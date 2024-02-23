;;; tanakh-mode.el --- (´･_･`) in your status bar  -*- lexical-binding: t; -*-

;;; code

(defvar tanakh-i 0)

(defun tanakh-advance ()
    "Advances tanakh."
    (setq tanakh-i (% (+ 1 tanakh-i) (length tanakh-face)))
    (force-mode-line-update))

(defgroup tanah nil
    "Customization group for `tanakh-mode'."
    :group 'frames)

(defcustom tanakh-face
    '("(´･_･`)´･_･`)"
      " (´･_･`)_･`)  "
      "  (´･_･`)`)   "
      "  ((´･_･`)    "
      " (´･(´･_･`)  "
      " (´･_(´･_･`) "
      "(´･_･`)´･_･`)"
      " (´･_･`)_･`)  "
      "  (´･_･`)`)   "
      "  (´･_･`))    "
      "   ((´･_･`)   "
      "  (´･(´･_･`) "
      " (´･_(´･_･`) ")
    "tanakh."
    :type '(list string)
    :group 'tanakh)

(defcustom tanakh-interval 0.2
    "Reverse number of tanakh in a second."
    :type 'float
    :set (lambda (sym val)
             (set-default sym val)
             (tanakh-advance))
    :group 'tanakh)

(defvar tanakh-animation-timer nil)

(defun tanakh-start ()
    "Starts tanakh."
    (interactive)
    (setq tanakh-animation-timer
          (run-at-time "1 sec" tanakh-interval 'tanakh-advance)))

(defun tanakh-create ()
    "Returns the current tanakh."
    (interactive)
    (nth tanakh-i tanakh-face))

;;;###autoload
(defun tanakh-force ()
    "Force tanakh anyways."
    (interactive)
    (tanakh-mode 1)
    (setq mode-line-format
          (list '(:eval (list (tanakh-create))))))

;;;###autoload
(define-minor-mode tanakh-mode
    "Have tanakh in your status bar."
    :global t
    (when tanakh-mode (tanakh-start)))

(provide 'tanakh-mode)

