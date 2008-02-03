" Vim syntax file
" Language:     PBwiki, http://pbwiki.com/
" Maintainer:   George V. Reilly  <george@reilly.org>
" Home:         http://www.georgevreilly.com/vim/pbwiki/
" Other Home:   http://www.vim.org/scripts/script.php?script_id=2138
" Author:       George V. Reilly
" Last Change: Sun Feb 03 01:00 AM 2008 P
" Version:      0.1

" Quit if syntax file is already loaded
if version < 600
    syntax clear
" elseif exists("b:current_syntax")
    finish
endif

" A WikiWord
syntax match  pbwikiWord          /\%(\~\@<![A-Z][a-z0-9]\+[A-Za-z0-9]*[A-Z]\+[A-Za-z0-9]*\)/
" A [bracketed wiki word]
syntax match  pbwikiWord          /\[[[:alnum:]\s]\+\]/

" text: http://pbwiki.com
" text: [http://pbwiki.com/|PBwiki]
" text: support@pbwiki.com
" text: [support@pbwiki.com|help!!]
syntax match pbwikiLink           `\(https\?\|ftp\|mailto\|file\):\(\(\(//\)\|\(\\\\\)\)*[A-Za-z0-9:#@%/;$~_?+-=.&\-\\\\]*\)`
syntax match pbwikiLink           `\[\(https\?\|ftp\|mailto\|file\):\(\(\(//\)\|\(\\\\\)\)*[A-Za-z0-9:#@%/;$~_?+-=.&\-\\\\]*\)|[^]].\{-}\]`
syntax match pbwikiLink           `[A-Za-z0-9._%+-]\+@[A-Za-z0-9.-]\+\.[A-Za-z]\{2,4}`
syntax match pbwikiLink           `\[[A-Za-z0-9._%+-]\+@[A-Za-z0-9.-]\+\.[A-Za-z]\{2,4}|[^]].\{-}\]`

" text: **strong** 
syntax match pbwikiBold           /\(^\|\W\)\zs\*\*\([^\* ].\{-}\)\*\*/

" ''italic''
syntax match pbwikiItalic         /''\([^'].\{-}\)''/

" text: __underlined__ 
syntax match pbwikiUnderlined     /\(^\|\W\)\zs__\([^\* ].\{-}\)__/

" <raw>text</raw>
syntax match pbwikiCode           /<raw>\([^<].\{-}\)<\/raw>/

"   text: -strikethrough- 
syntax match pbwikiDelText        /\(^\|\s\+\)\zs-\([^ <a ]\|[^ <img ]\|[^ -].*\)-/

" Aggregate all the regular text highlighting into pbwikiText
syntax cluster pbwikiText contains=pbwikiItalic,pbwikiBold,pbwikiCode,pbwikiDelText,pbwikiLink,pbwikiWord,pbwikiUnderlined

" Header levels, 1-6
syntax match pbwikiH1             /^!.*$/
syntax match pbwikiH2             /^!!.*$/
syntax match pbwikiH3             /^!!!.*$/
syntax match pbwikiH4             /^!!!!.*$/
syntax match pbwikiH5             /^!!!!!.*$/
syntax match pbwikiH6             /^!!!!!!.*$/

" Tables. Each line starts and ends with '|'; each cell is separated by '|'
syntax match pbwikiTable          /|/

" Bulleted list items start with one or tabs, followed by whitespace, then '*'
" Numeric  list items start with one or tabs, followed by whitespace, then '1.'
" Eight spaces at the beginning of the line is equivalent to the leading tab.
syntax match pbwikiList           /^\(\*\|#\)\+ .*$/   contains=@pbwikiText

" Treat all other lines that start with spaces as PRE-formatted text.
" syntax match pbwikiPre            /^[ \t]\+[^ \t*1].*$/

" Handle nested HTML inside .html blocks
" syn cluster htmlPreProc add=@tt2_top_cluster

" Link PBwiki syntax items to colors
hi def link pbwikiH1                    Title
hi def link pbwikiH2                    pbwikiH1
hi def link pbwikiH3                    pbwikiH2
hi def link pbwikiH4                    pbwikiH3
hi def link pbwikiH5                    pbwikiH4
hi def link pbwikiH6                    pbwikiH5
hi def link pbwikiHR                    pbwikiH6
    
hi def pbwikiBold                       term=bold cterm=bold gui=bold
hi def pbwikiItalic                     term=italic cterm=italic gui=italic
hi def pbwikiUnderlined                 term=underline cterm=underline gui=underline

hi def link pbwikiCode                  Statement
hi def link pbwikiWord                  Underlined

hi def link pbwikiEscape                Todo
hi def link pbwikiPre                   PreProc
hi def link pbwikiLink                  Underlined
hi def link pbwikiList                  Type
hi def link pbwikiTable                 Type
hi def link pbwikiDelText               Comment

hi def link pbwikiSingleLineProperty    Identifier

let b:current_syntax="PBwiki"

" vim:tw=0:
