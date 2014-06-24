;;; 起動画面を表示しない
(setq inhibit-startup-screen t)

;;; 標準の文字コードを UTF に.
(set-language-environment 'Japanese)
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;;; バックアップファイルを作らない
(setq backup-inhibited t)

;;;;;;;;;;;;;;;;;
;;; モード指定 ;;;
;;;;;;;;;;;;;;;;;

;;; php-mode
(autoload 'php-mode "php-mode")
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))

;;; markdown-mode
(autoload 'markdown-mode "markdown-mode")
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))

;;; to edit Firefox Extension Code.
(add-to-list 'auto-mode-alist '("\\.rdf$" . xml-mode))
(add-to-list 'auto-mode-alist '("\\.xul$" . xml-mode))

;;; 拡張子が .m のファイルを開くときは, octave mode で開く.
(add-to-list 'auto-mode-alist '("\\.m$" . octave-mode))

;;; 拡張子が .cpp のファイルを開くときは, c++ mode で開く.
(add-to-list 'auto-mode-alist '("\\.cpp$" . c++-mode))

;;; arduino-mode
(autoload 'arduino-mode "arduino-mode")
(add-to-list 'auto-mode-alist '("\\.pde$" . arduino-mode))
(add-to-list 'auto-mode-alist '("\\.ino$" . arduino-mode))

;;; js2-mode
(autoload 'js2-mode "js2-mode")
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))



;;; タイトルバーにファイル名を表示する
;(setq frame-title-format (format "emacs@%s : %%f" (system-name)))
(setq frame-title-format "%b")
(setq icon-title-format "%b")

(set-frame-height (next-frame) 40)
(set-frame-width (next-frame) 95)


;;; 画像ファイルを表示する
;(auto-image-file-mode t)

;;; 括弧の対応をハイライトさせる.
(show-paren-mode t)

;;; x11 とクリップボードを共有する.
(setq x-select-enable-clipboard t)

;;; フォントの設定.
;(add-to-list 'default-frame-alist '(font . "ricty-12"))

;;; Ricty にしたいのに, なぜか日本語が可愛くなるので、回避するよ.
;(create-fontset-from-ascii-font
; "ricty-12:weight=normal:slant=normal" nil "rictyricty")
;(set-fontset-font 
; "fontset-rictyricty" 'unicode
; (font-spec :family "Ricty" :size 12)
; nil 'append)
;(add-to-list 'default-frame-alist '(font . "fontset-rictyricty"))


;;; アルファベットをricty, 日本語をヒラギノでやってみたっ！
(create-fontset-from-ascii-font
 "ricty-12:weight=normal:slant=normal" nil "rictykakugo")
(set-fontset-font 
 "fontset-rictykakugo" 'unicode
 (font-spec :family "Hiragino Kaku Gothic ProN" :size 12)
 nil 'append)
(add-to-list 'default-frame-alist '(font . "fontset-rictykakugo"))

;;; ファイラの初期ディレクトリ
;(setq *filer-primary-directory* "~/")
(setq default-directory "~/")



;; 1行ごとスクロールする.
(setq scroll-step 1)

;; ベルを無効化
(setq ring-bell-function 'ignore)

;; 全角スペースと改行を表示
(add-to-list 'load-path "~/.emacs.d/elisp")
(require 'jaspace)
;(setq jaspace-alternate-jaspace-string "□")
(setq jaspace-alternate-eol-string "\xab\n")
(setq jaspace-modes (append jaspace-modes
                            (list 'lisp-mode
                                  'yaml-mode
                                  'perl-mode
                                  'js2-mode
                                  'javascript-mode
                                  'python-mode
                                  'ruby-mode
                                  'php-mode
                                  'xml-mode
                                  'html-mode
                                  'css-mode
                                  'text-mode
                                  'tt-mode
                                  'fundamental-mode
                                  'latex-mode
                                  'arduino-mode
                                  )))

;;; 行番号を表示
(global-linum-mode t)

;;; 非選択ウィンドウはちょっと透明(90)に, カレントはギリギリ透明(98)にする
(set-frame-parameter nil 'alpha '(98 90))

;;; ツールバーのアイコンを消す
(tool-bar-mode -1)

;;; 時刻を表示
;(setq display-time-string-forms '(month "/" day " " 24-hours ":" minutes))
;(display-time-mode t)

;;; テーマを変更
(load-theme 'deeper-blue t)


;;; 各 OS ごとの設定
(cond 
 ((string-match "apple-darwin" system-configuration) ;; Mac 用の設定
  ()
  )
 ((string-match "linux" system-configuration) ;; Linux 用の設定
  (require 'ibus) ;; ibus を持ち込むよ
  (add-hook 'after-init-hook 'ibus-mode-on)
  (ibus-define-common-key ?\C-/ nil) ;; C-/ は ibus には使わない
  (ibus-define-common-key ?\C-\s nil) ;; C-s は ibus には使わない
  (global-set-key [zenkaku-hankaku] 'ibus-toggle) ;; 半角全角キーで切り替え
  )
)
