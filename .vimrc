"=[GENERAL]======================================
set nu
set nuw=4
autocmd InsertEnter * set nornu
autocmd InsertLeave * set rnu

"-[Automatic paste with indention]--------------
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction
"-----------------------------------------------
"-[Words replace without delete]----------------
nnoremap <silent> S :set opfunc=PasteReplace<CR>g@
function! PasteReplace(type, ...)
    if a:0
        silent exe "normal! `<" . a:type . "`>p"
    elseif a:type == 'line'
        silent exe "normal! '[V']p"
    elseif a:type == 'block'
        silent exe "normal! `[\<C-V>`]p"
    else
        silent exe "normal! `[v`]p"
    endif
endfunction
nmap SS S$
"-----------------------------------------------

"=[END GENERAL]==================================
"=[PLUGINS]======================================

if empty(glob("~/.vim/autoload/plug.vim"))
        execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

Plug 'mhinz/vim-startify'

Plug 'tpope/vim-sensible'

Plug 'Keithbsmiley/investigate.vim'
nnoremap <F1> :call investigate#Investigate()<CR>

Plug 'mattn/emmet-vim',           { 'for': ['html','xhtml','css','sass','scss','less'] }
au FileType html,css,sass,scss,less imap <expr>jk   emmet#expandAbbrIntelligent("\<tab>")
au FileType html                    imap <C-\>      <CR><CR><Esc>ki<Tab>

Plug 'Yggdroot/indentLine'
let g:indentLine_enabled    = 0
let g:indentLine_char       = '¦'
let g:indentLine_color_term = 239
let g:indentLine_color_gui  = '#A4E57E'
nmap ^[i :IndentLinesToggle<CR>

Plug 'tpope/vim-haml',            { 'for': 'haml'   }
Plug 'wavded/vim-stylus',         { 'for': 'stylus' }
Plug 'groenewege/vim-less',       { 'for': 'less'   }
Plug 'digitaltoad/vim-jade',      { 'for': 'jade'   }
Plug 'slim-template/vim-slim',    { 'for': 'slim'   }
Plug 'othree/html5-syntax.vim',   { 'for': 'html'   }
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss'   }

Plug 'hail2u/vim-css3-syntax',    { 'for': ['html','css'] }
augroup VimCSS3Syntax
  autocmd!
  autocmd FileType css setlocal iskeyword+=-
augroup END

Plug 'Chiel92/vim-autoformat'
let g:formatprg_args_javascript = "-j -q -B -f -"
noremap  <F8>   :Autoformat<CR><CR>
vnoremap <C-F8> gq

Plug 'moll/vim-node'
Plug 'pangloss/vim-javascript',      { 'for': 'javascript' }
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
let javascript_enable_domhtmlcss = 1
let g:html_indent_inctags        = "html,body,head,tbody"
let g:html_indent_script1        = "inc"
let g:html_indent_style1         = "inc"

Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }
let b:current_syntax       = 'javascript'
let g:used_javascript_libs = 'angularjs'

call plug#end()
"=[END PLUGINS]==================================
