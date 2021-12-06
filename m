Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6EB9C433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 15:38:49 +0000 (UTC)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com
 [209.85.222.45])
 by mx.groups.io with SMTP id smtpd.web10.53233.1638805128490123691
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 07:38:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hPFJDo1R;
 spf=pass (domain: gmail.com, ip: 209.85.222.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f45.google.com with SMTP id w23so20381726uao.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 07:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CNx+G5KeZlQ8JbsvmuA0BZhSkYqMrKYPxWaNt3jqL9k=;
        b=hPFJDo1RZ00GvL4LzMEo1e2W54Fak76O13NpUVrgO2rnXma3JxzyT7L76hYfKgGrGI
         RvXbVWNyobyrFr6drs9UhyV+bJOr613dB7b1MAeJlM/4TP3gz4cw0oyhey24y6AtxjD4
         ArCjFpmBWhw30WD8oBeQL7LLKru2KTRHHa/Q8oDZQkhKrm9pJrq9rEvdx8NoeAnBOTWa
         QOD7EpbWfImVUPFG5e5GsY3LB5ujFXUe4HJBupIOBQE3ZrzKl9xg0oemT1fEoWSW4Bjl
         HuVzSqwkEX1YIBEtn7oYE+eK+Ox5qdnRgmoMsGsRsI+ZMA56UlpfntujyDzEItAa7Sxp
         dueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CNx+G5KeZlQ8JbsvmuA0BZhSkYqMrKYPxWaNt3jqL9k=;
        b=vybnRMzt7xA+Ya1siqLZayGqDKYKao1HNfByKXynq3EOsEHoSUNjQgqPbvkzfufftv
         53NS54vjaDHJKyuy2VGwLTKxFS4+aSsKGTTCCfB0rgWfUEY24kNZbkGvbNtC1BJwfKKX
         BlkinYVQEzYarUZWUkTsdviav1Kzva6fJ6zmN5G/poyMSMuk4VIRVa2QQGZ28wMBWqmo
         HQ7DT47DZumP7pnD+8fEV9UDfFXL5lrxXjf1+Fg4wrT1Q6kbgyMwt0QRnRvv777ckCmv
         zJV+FBYgJoJQr3e+S32dWHwb3ouoW/K4V+1CRHZKWQgrzj72q9N90Sjymy7TYW6tF1SI
         lX9Q==
X-Gm-Message-State: AOAM533wIdwoNp1Q7XT83HyksMXz3V9K9hXlVu2h4loeSkUTBZbtXdh2
	iAIrlb5VFrWjQDGGP3z56ggMscfaMEFUcSM0QSk=
X-Google-Smtp-Source: 
 ABdhPJwhx62YbyMWy6GS7wGCpJPZJJKpFK+ljGmSnvFRfHZCAWuHe1eDHYQ1U9tAmrD+8H7re5uHTzFYwlSkwybekQA=
X-Received: by 2002:ab0:55ce:: with SMTP id w14mr40732307uaa.93.1638805124911;
 Mon, 06 Dec 2021 07:38:44 -0800 (PST)
MIME-Version: 1.0
References: <20211206144953.360894-1-ross.burton@arm.com>
In-Reply-To: <20211206144953.360894-1-ross.burton@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 6 Dec 2021 16:38:33 +0100
Message-ID: 
 <CANNYZj9d56EHvYm3M9THRSTujWatEhADTawjabuxavxaBgqTAw@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] vim: upgrade to 8.2 patch 3752
To: Ross Burton <ross@burtonini.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000053b49f05d27c0dde"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 15:38:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159247

--00000000000053b49f05d27c0dde
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I tend to agree. Vim has a strange release policy where major releases
happen infrequently and allow unfixed issues to pile up, but minor releases
are tagged for every single commit. And so it becomes hard for integrators
to pick an update strategy between those thousands of commits, and even
harder to backport everything if sticking to a current major release.

Alex


On Mon, 6 Dec 2021 at 15:50, Ross Burton <ross@burtonini.com> wrote:

> There's a fairly constant flow of CVEs being fixed in Vim, which are
> getting increasing non-trivial to backport.
>
> Instead of trying to backport (and potentially introduce more bugs), or
> just ignoring them entirely, upgrade vim to the latest patch in the hope
> that vim 8.3 will be released before we release Kirkstone.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  ...1-reading-character-past-end-of-line.patch |  62 ------
>  ...28-using-freed-memory-when-replacing.patch |  83 -------
>  ...eading-uninitialized-memory-when-giv.patch |  63 ------
>  ...rash-when-using-CTRL-W-f-without-fin.patch |  92 --------
>  ...llegal-memory-access-if-buffer-name-.patch |  86 --------
>  ...ml_get-error-after-search-with-range.patch |  72 ------
>  ...nvalid-memory-access-when-scrolling-.patch |  97 --------
>  .../vim/files/CVE-2021-3778.patch             |  61 ------
>  ...1e135a16091c93f6f5f7525a5c58fb7ca9f9.patch | 207 ------------------
>  meta/recipes-support/vim/vim.inc              |  15 +-
>  10 files changed, 4 insertions(+), 834 deletions(-)
>  delete mode 100644
> meta/recipes-support/vim/files/0001-patch-8.2.3581-reading-character-past=
-end-of-line.patch
>  delete mode 100644
> meta/recipes-support/vim/files/0002-patch-8.2.3428-using-freed-memory-whe=
n-replacing.patch
>  delete mode 100644
> meta/recipes-support/vim/files/0002-patch-8.2.3582-reading-uninitialized-=
memory-when-giv.patch
>  delete mode 100644
> meta/recipes-support/vim/files/0002-patch-8.2.3611-crash-when-using-CTRL-=
W-f-without-fin.patch
>  delete mode 100644
> meta/recipes-support/vim/files/0003-patch-8.2.3487-illegal-memory-access-=
if-buffer-name-.patch
>  delete mode 100644
> meta/recipes-support/vim/files/0004-patch-8.2.3489-ml_get-error-after-sea=
rch-with-range.patch
>  delete mode 100644
> meta/recipes-support/vim/files/0005-patch-8.2.3564-invalid-memory-access-=
when-scrolling-.patch
>  delete mode 100644 meta/recipes-support/vim/files/CVE-2021-3778.patch
>  delete mode 100644
> meta/recipes-support/vim/files/b7081e135a16091c93f6f5f7525a5c58fb7ca9f9.p=
atch
>
> diff --git
> a/meta/recipes-support/vim/files/0001-patch-8.2.3581-reading-character-pa=
st-end-of-line.patch
> b/meta/recipes-support/vim/files/0001-patch-8.2.3581-reading-character-pa=
st-end-of-line.patch
> deleted file mode 100644
> index 28c61cd782..0000000000
> ---
> a/meta/recipes-support/vim/files/0001-patch-8.2.3581-reading-character-pa=
st-end-of-line.patch
> +++ /dev/null
> @@ -1,62 +0,0 @@
> -CVE: CVE-2021-3927
> -Upstream-Status: Backport
> -Signed-off-by: Ross Burton <ross.burton@arm.com>
> -
> -From 93b427c6e729260d0700c3b2804ec153bc8284fa Mon Sep 17 00:00:00 2001
> -From: Bram Moolenaar <Bram@vim.org>
> -Date: Thu, 4 Nov 2021 15:10:11 +0000
> -Subject: [PATCH] patch 8.2.3581: reading character past end of line
> -
> -Problem:    Reading character past end of line.
> -Solution:   Correct the cursor column.
> ----
> - src/ex_docmd.c           |  1 +
> - src/testdir/test_put.vim | 12 ++++++++++++
> - src/version.c            |  2 ++
> - 3 files changed, 15 insertions(+)
> -
> -diff --git a/src/ex_docmd.c b/src/ex_docmd.c
> -index fde726477..59e245bee 100644
> ---- a/src/ex_docmd.c
> -+++ b/src/ex_docmd.c
> -@@ -6905,6 +6905,7 @@ ex_put(exarg_T *eap)
> -       eap->forceit =3D TRUE;
> -     }
> -     curwin->w_cursor.lnum =3D eap->line2;
> -+    check_cursor_col();
> -     do_put(eap->regname, eap->forceit ? BACKWARD : FORWARD, 1L,
> -
> PUT_LINE|PUT_CURSLINE);
> - }
> -diff --git a/src/testdir/test_put.vim b/src/testdir/test_put.vim
> -index 225ebd1f3..922e5b269 100644
> ---- a/src/testdir/test_put.vim
> -+++ b/src/testdir/test_put.vim
> -@@ -113,3 +113,15 @@ func Test_put_p_indent_visual()
> -   call assert_equal('select that text', getline(2))
> -   bwipe!
> - endfunc
> -+
> -+func Test_put_above_first_line()
> -+  new
> -+  let @" =3D 'text'
> -+  silent! normal 0o00
> -+  0put
> -+  call assert_equal('text', getline(1))
> -+  bwipe!
> -+endfunc
> -+
> -+
> -+" vim: shiftwidth=3D2 sts=3D2 expandtab
> -diff --git a/src/version.c b/src/version.c
> -index a9e8be0e7..df4ec9a47 100644
> ---- a/src/version.c
> -+++ b/src/version.c
> -@@ -742,6 +742,8 @@ static char *(features[]) =3D
> -
> - static int included_patches[] =3D
> - {   /* Add new patch number below this line */
> -+/**/
> -+    3581,
> - /**/
> -     3564,
> - /**/
> diff --git
> a/meta/recipes-support/vim/files/0002-patch-8.2.3428-using-freed-memory-w=
hen-replacing.patch
> b/meta/recipes-support/vim/files/0002-patch-8.2.3428-using-freed-memory-w=
hen-replacing.patch
> deleted file mode 100644
> index ecfae0301e..0000000000
> ---
> a/meta/recipes-support/vim/files/0002-patch-8.2.3428-using-freed-memory-w=
hen-replacing.patch
> +++ /dev/null
> @@ -1,83 +0,0 @@
> -CVE: CVE-2021-3796
> -Upstream-Status: Backport
> -Signed-off-by: Ross Burton <ross.burton@arm.com>
> -
> -From 1160e5f74b229336502fc376416f21108d36cfc2 Mon Sep 17 00:00:00 2001
> -From: Bram Moolenaar <Bram@vim.org>
> -Date: Sat, 11 Sep 2021 21:14:20 +0200
> -Subject: [PATCH] patch 8.2.3428: using freed memory when replacing
> -
> -Problem:    Using freed memory when replacing. (Dhiraj Mishra)
> -Solution:   Get the line pointer after calling ins_copychar().
> ----
> - src/normal.c              | 10 +++++++---
> - src/testdir/test_edit.vim | 14 ++++++++++++++
> - src/version.c             |  2 ++
> - 3 files changed, 23 insertions(+), 3 deletions(-)
> -
> -diff --git a/src/normal.c b/src/normal.c
> -index c4963e621..d6333b948 100644
> ---- a/src/normal.c
> -+++ b/src/normal.c
> -@@ -5009,19 +5009,23 @@ nv_replace(cmdarg_T *cap)
> -           {
> -               /*
> -                * Get ptr again, because u_save and/or showmatch() will
> have
> --               * released the line.  At the same time we let know that
> the
> --               * line will be changed.
> -+               * released the line.  This may also happen in
> ins_copychar().
> -+               * At the same time we let know that the line will be
> changed.
> -                */
> --              ptr =3D ml_get_buf(curbuf, curwin->w_cursor.lnum, TRUE);
> -               if (cap->nchar =3D=3D Ctrl_E || cap->nchar =3D=3D Ctrl_Y)
> -               {
> -                 int c =3D ins_copychar(curwin->w_cursor.lnum
> -                                          + (cap->nchar =3D=3D Ctrl_Y ? =
-1 :
> 1));
> -+
> -+                ptr =3D ml_get_buf(curbuf, curwin->w_cursor.lnum, TRUE)=
;
> -                 if (c !=3D NUL)
> -                   ptr[curwin->w_cursor.col] =3D c;
> -               }
> -               else
> -+              {
> -+                  ptr =3D ml_get_buf(curbuf, curwin->w_cursor.lnum, TRU=
E);
> -                   ptr[curwin->w_cursor.col] =3D cap->nchar;
> -+              }
> -               if (p_sm && msg_silent =3D=3D 0)
> -                   showmatch(cap->nchar);
> -               ++curwin->w_cursor.col;
> -diff --git a/src/testdir/test_edit.vim b/src/testdir/test_edit.vim
> -index 4e29e7fe1..f94e6c181 100644
> ---- a/src/testdir/test_edit.vim
> -+++ b/src/testdir/test_edit.vim
> -@@ -1519,3 +1519,17 @@ func Test_edit_noesckeys()
> -   bwipe!
> -   set esckeys
> - endfunc
> -+
> -+" Test for getting the character of the line below after "p"
> -+func Test_edit_put_CTRL_E()
> -+  set encoding=3Dlatin1
> -+  new
> -+  let @" =3D ''
> -+  sil! norm or ggRx
> -+  sil! norm pr
> -+  call assert_equal(['r', 'r'], getline(1, 2))
> -+  bwipe!
> -+  set encoding=3Dutf-8
> -+endfunc
> -+
> -+" vim: shiftwidth=3D2 sts=3D2 expandtab
> -diff --git a/src/version.c b/src/version.c
> -index 85bdfc601..1046993d6 100644
> ---- a/src/version.c
> -+++ b/src/version.c
> -@@ -742,6 +742,8 @@ static char *(features[]) =3D
> -
> - static int included_patches[] =3D
> - {   /* Add new patch number below this line */
> -+/**/
> -+    3428,
> - /**/
> -     3409,
> - /**/
> diff --git
> a/meta/recipes-support/vim/files/0002-patch-8.2.3582-reading-uninitialize=
d-memory-when-giv.patch
> b/meta/recipes-support/vim/files/0002-patch-8.2.3582-reading-uninitialize=
d-memory-when-giv.patch
> deleted file mode 100644
> index d117a98893..0000000000
> ---
> a/meta/recipes-support/vim/files/0002-patch-8.2.3582-reading-uninitialize=
d-memory-when-giv.patch
> +++ /dev/null
> @@ -1,63 +0,0 @@
> -CVE: CVE-2021-3928
> -Upstream-Status: Backport
> -Signed-off-by: Ross Burton <ross.burton@arm.com>
> -
> -From ade0f0481969f1453c60e7c8354b00dfe4238739 Mon Sep 17 00:00:00 2001
> -From: Bram Moolenaar <Bram@vim.org>
> -Date: Thu, 4 Nov 2021 15:46:05 +0000
> -Subject: [PATCH] patch 8.2.3582: reading uninitialized memory when givin=
g
> - spell suggestions
> -
> -Problem:    Reading uninitialized memory when giving spell suggestions.
> -Solution:   Check that preword is not empty.
> ----
> - src/spellsuggest.c         | 2 +-
> - src/testdir/test_spell.vim | 8 ++++++++
> - src/version.c              | 2 ++
> - 3 files changed, 11 insertions(+), 1 deletion(-)
> -
> -diff --git a/src/spellsuggest.c b/src/spellsuggest.c
> -index 9d6df7930..8615d5280 100644
> ---- a/src/spellsuggest.c
> -+++ b/src/spellsuggest.c
> -@@ -1600,7 +1600,7 @@ suggest_trie_walk(
> -                   // char, e.g., "thes," -> "these".
> -                   p =3D fword + sp->ts_fidx;
> -                   MB_PTR_BACK(fword, p);
> --                  if (!spell_iswordp(p, curwin))
> -+                  if (!spell_iswordp(p, curwin) && *preword !=3D NUL)
> -                   {
> -                       p =3D preword + STRLEN(preword);
> -                       MB_PTR_BACK(preword, p);
> -diff --git a/src/testdir/test_spell.vim b/src/testdir/test_spell.vim
> -index 79fb8927c..e435e9172 100644
> ---- a/src/testdir/test_spell.vim
> -+++ b/src/testdir/test_spell.vim
> -@@ -498,6 +498,14 @@ func Test_spell_screendump()
> -   call delete('XtestSpell')
> - endfunc
> -
> -+func Test_spell_single_word()
> -+  new
> -+  silent! norm 0R00
> -+  spell! =C3=9F=C3=82
> -+  silent 0norm 0r$ Dvz=3D
> -+  bwipe!
> -+endfunc
> -+
> - let g:test_data_aff1 =3D [
> -       \"SET ISO8859-1",
> -       \"TRY
> esianrtolcdugmphbyfvkwjkqxz-\xEB\xE9\xE8\xEA\xEF\xEE\xE4\xE0\xE2\xF6\xFC\=
xFB'ESIANRTOLCDUGMPHBYFVKWJKQXZ",
> -diff --git a/src/version.c b/src/version.c
> -index df4ec9a47..e1bc0d09b 100644
> ---- a/src/version.c
> -+++ b/src/version.c
> -@@ -742,6 +742,8 @@ static char *(features[]) =3D
> -
> - static int included_patches[] =3D
> - {   /* Add new patch number below this line */
> -+/**/
> -+    3582,
> - /**/
> -     3581,
> - /**/
> diff --git
> a/meta/recipes-support/vim/files/0002-patch-8.2.3611-crash-when-using-CTR=
L-W-f-without-fin.patch
> b/meta/recipes-support/vim/files/0002-patch-8.2.3611-crash-when-using-CTR=
L-W-f-without-fin.patch
> deleted file mode 100644
> index 58d3442677..0000000000
> ---
> a/meta/recipes-support/vim/files/0002-patch-8.2.3611-crash-when-using-CTR=
L-W-f-without-fin.patch
> +++ /dev/null
> @@ -1,92 +0,0 @@
> -CVE: CVE-2021-3973
> -Upstream-Status: Backport
> -Signed-off-by: Ross Burton <ross.burton@arm.com>
> -
> -From b6154e9f530544ddc3130d981caae0dabc053757 Mon Sep 17 00:00:00 2001
> -From: Bram Moolenaar <Bram@vim.org>
> -Date: Wed, 17 Nov 2021 18:00:31 +0000
> -Subject: [PATCH] patch 8.2.3611: crash when using CTRL-W f without
> finding a
> - file name  Problem:    Crash when using CTRL-W f without finding
> - a file name. Solution:   Bail out when the file name length is zero.
> -
> ----
> - src/findfile.c              | 8 ++++++++
> - src/normal.c                | 6 ++++--
> - src/testdir/test_visual.vim | 8 ++++++++
> - src/version.c               | 2 ++
> - 4 files changed, 22 insertions(+), 2 deletions(-)
> -
> -diff --git a/src/findfile.c b/src/findfile.c
> -index dba547da1..5764fd7b8 100644
> ---- a/src/findfile.c
> -+++ b/src/findfile.c
> -@@ -1727,6 +1727,9 @@ find_file_in_path_option(
> -     proc->pr_WindowPtr =3D (APTR)-1L;
> - # endif
> -
> -+    if (len =3D=3D 0)
> -+      return NULL;
> -+
> -     if (first =3D=3D TRUE)
> -     {
> -       // copy file name into NameBuff, expanding environment variables
> -@@ -2094,7 +2097,12 @@ find_file_name_in_path(
> -     int               c;
> - # if defined(FEAT_FIND_ID) && defined(FEAT_EVAL)
> -     char_u    *tofree =3D NULL;
> -+# endif
> -
> -+    if (len =3D=3D 0)
> -+      return NULL;
> -+
> -+# if defined(FEAT_FIND_ID) && defined(FEAT_EVAL)
> -     if ((options & FNAME_INCL) && *curbuf->b_p_inex !=3D NUL)
> -     {
> -       tofree =3D eval_includeexpr(ptr, len);
> -diff --git a/src/normal.c b/src/normal.c
> -index 7cb959257..f0084f2ac 100644
> ---- a/src/normal.c
> -+++ b/src/normal.c
> -@@ -3778,8 +3778,10 @@ get_visual_text(
> -           *pp =3D ml_get_pos(&VIsual);
> -           *lenp =3D curwin->w_cursor.col - VIsual.col + 1;
> -       }
> --      if (has_mbyte)
> --          // Correct the length to include the whole last character.
> -+      if (**pp =3D=3D NUL)
> -+          *lenp =3D 0;
> -+      if (has_mbyte && *lenp > 0)
> -+          // Correct the length to include all bytes of the last
> character.
> -           *lenp +=3D (*mb_ptr2len)(*pp + (*lenp - 1)) - 1;
> -     }
> -     reset_VIsual_and_resel();
> -diff --git a/src/testdir/test_visual.vim b/src/testdir/test_visual.vim
> -index ae281238e..0705fdb57 100644
> ---- a/src/testdir/test_visual.vim
> -+++ b/src/testdir/test_visual.vim
> -@@ -894,4 +894,12 @@ func Test_block_insert_replace_tabs()
> -   bwipe!
> - endfunc
> -
> -+func Test_visual_block_ctrl_w_f()
> -+  " Emtpy block selected in new buffer should not result in an error.
> -+  au! BufNew foo sil norm   f
> -+  edit foo
> -+
> -+  au! BufNew
> -+endfunc
> -+
> - " vim: shiftwidth=3D2 sts=3D2 expandtab
> -diff --git a/src/version.c b/src/version.c
> -index 52be3c39d..59a314b3a 100644
> ---- a/src/version.c
> -+++ b/src/version.c
> -@@ -742,6 +742,8 @@ static char *(features[]) =3D
> -
> - static int included_patches[] =3D
> - {   /* Add new patch number below this line */
> -+/**/
> -+    3611,
> - /**/
> -     3582,
> - /**/
> diff --git
> a/meta/recipes-support/vim/files/0003-patch-8.2.3487-illegal-memory-acces=
s-if-buffer-name-.patch
> b/meta/recipes-support/vim/files/0003-patch-8.2.3487-illegal-memory-acces=
s-if-buffer-name-.patch
> deleted file mode 100644
> index 576664f436..0000000000
> ---
> a/meta/recipes-support/vim/files/0003-patch-8.2.3487-illegal-memory-acces=
s-if-buffer-name-.patch
> +++ /dev/null
> @@ -1,86 +0,0 @@
> -CVE: CVE-2021-3872
> -Upstream-Status: Backport
> -Signed-off-by: Ross Burton <ross.burton@arm.com>
> -
> -From 61629ea24a2fff1f89c37479d3fb52f17c3480fc Mon Sep 17 00:00:00 2001
> -From: Bram Moolenaar <Bram@vim.org>
> -Date: Fri, 8 Oct 2021 18:39:28 +0100
> -Subject: [PATCH] patch 8.2.3487: illegal memory access if buffer name is
> very
> - long
> -
> -Problem:    Illegal memory access if buffer name is very long.
> -Solution:   Make sure not to go over the end of the buffer.
> ----
> - src/drawscreen.c                | 10 +++++-----
> - src/testdir/test_statusline.vim | 11 +++++++++++
> - src/version.c                   |  2 ++
> - 3 files changed, 18 insertions(+), 5 deletions(-)
> -
> -diff --git a/src/drawscreen.c b/src/drawscreen.c
> -index 3a88ee979..9acb70552 100644
> ---- a/src/drawscreen.c
> -+++ b/src/drawscreen.c
> -@@ -446,13 +446,13 @@ win_redr_status(win_T *wp, int ignore_pum UNUSED)
> -           *(p + len++) =3D ' ';
> -       if (bt_help(wp->w_buffer))
> -       {
> --          STRCPY(p + len, _("[Help]"));
> -+          vim_snprintf((char *)p + len, MAXPATHL - len, "%s",
> _("[Help]"));
> -           len +=3D (int)STRLEN(p + len);
> -       }
> - #ifdef FEAT_QUICKFIX
> -       if (wp->w_p_pvw)
> -       {
> --          STRCPY(p + len, _("[Preview]"));
> -+          vim_snprintf((char *)p + len, MAXPATHL - len, "%s",
> _("[Preview]"));
> -           len +=3D (int)STRLEN(p + len);
> -       }
> - #endif
> -@@ -462,12 +462,12 @@ win_redr_status(win_T *wp, int ignore_pum UNUSED)
> - #endif
> -               )
> -       {
> --          STRCPY(p + len, "[+]");
> --          len +=3D 3;
> -+          vim_snprintf((char *)p + len, MAXPATHL - len, "%s", "[+]");
> -+          len +=3D (int)STRLEN(p + len);
> -       }
> -       if (wp->w_buffer->b_p_ro)
> -       {
> --          STRCPY(p + len, _("[RO]"));
> -+          vim_snprintf((char *)p + len, MAXPATHL - len, "%s", _("[RO]")=
);
> -           len +=3D (int)STRLEN(p + len);
> -       }
> -
> -diff --git a/src/testdir/test_statusline.vim
> b/src/testdir/test_statusline.vim
> -index 1f705b847..91bce1407 100644
> ---- a/src/testdir/test_statusline.vim
> -+++ b/src/testdir/test_statusline.vim
> -@@ -393,3 +393,14 @@ func Test_statusline_visual()
> -   bwipe! x1
> -   bwipe! x2
> - endfunc
> -+" Used to write beyond allocated memory.  This assumes MAXPATHL is 4096
> bytes.
> -+func Test_statusline_verylong_filename()
> -+  let fname =3D repeat('x', 4090)
> -+  exe "new " .. fname
> -+  set buftype=3Dhelp
> -+  set previewwindow
> -+  redraw
> -+  bwipe!
> -+endfunc
> -+
> -+" vim: shiftwidth=3D2 sts=3D2 expandtab
> -diff --git a/src/version.c b/src/version.c
> -index 1046993d6..2b5de5ccf 100644
> ---- a/src/version.c
> -+++ b/src/version.c
> -@@ -742,6 +742,8 @@ static char *(features[]) =3D
> -
> - static int included_patches[] =3D
> - {   /* Add new patch number below this line */
> -+/**/
> -+    3487,
> - /**/
> -     3428,
> - /**/
> diff --git
> a/meta/recipes-support/vim/files/0004-patch-8.2.3489-ml_get-error-after-s=
earch-with-range.patch
> b/meta/recipes-support/vim/files/0004-patch-8.2.3489-ml_get-error-after-s=
earch-with-range.patch
> deleted file mode 100644
> index 045081579c..0000000000
> ---
> a/meta/recipes-support/vim/files/0004-patch-8.2.3489-ml_get-error-after-s=
earch-with-range.patch
> +++ /dev/null
> @@ -1,72 +0,0 @@
> -CVE: CVE-2021-3875
> -Upstream-Status: Backport
> -Signed-off-by: Ross Burton <ross.burton@arm.com>
> -
> -From b8968e26d7508e7d64bfc86808142818b0a9288c Mon Sep 17 00:00:00 2001
> -From: Bram Moolenaar <Bram@vim.org>
> -Date: Sat, 9 Oct 2021 13:58:55 +0100
> -Subject: [PATCH] patch 8.2.3489: ml_get error after search with range
> -
> -Problem:    ml_get error after search with range.
> -Solution:   Limit the line number to the buffer line count.
> ----
> - src/ex_docmd.c              |  6 ++++--
> - src/testdir/test_search.vim | 17 +++++++++++++++++
> - src/version.c               |  2 ++
> - 3 files changed, 23 insertions(+), 2 deletions(-)
> -
> -diff --git a/src/ex_docmd.c b/src/ex_docmd.c
> -index fb07450f8..fde726477 100644
> ---- a/src/ex_docmd.c
> -+++ b/src/ex_docmd.c
> -@@ -3586,8 +3586,10 @@ get_address(
> -
> -                   // When '/' or '?' follows another address, start fro=
m
> -                   // there.
> --                  if (lnum !=3D MAXLNUM)
> --                      curwin->w_cursor.lnum =3D lnum;
> -+                  if (lnum > 0 && lnum !=3D MAXLNUM)
> -+                      curwin->w_cursor.lnum =3D
> -+                              lnum > curbuf->b_ml.ml_line_count
> -+                                         ? curbuf->b_ml.ml_line_count :
> lnum;
> -
> -                   // Start a forward search at the end of the line
> (unless
> -                   // before the first line).
> -diff --git a/src/testdir/test_search.vim b/src/testdir/test_search.vim
> -index 187671305..e142c3547 100644
> ---- a/src/testdir/test_search.vim
> -+++ b/src/testdir/test_search.vim
> -@@ -1366,3 +1366,20 @@ func Test_searchdecl()
> -
> -   bwipe!
> - endfunc
> -+
> -+func Test_search_with_invalid_range()
> -+  new
> -+  let lines =3D<< trim END
> -+    /\%.v
> -+    5/
> -+    c
> -+  END
> -+  call writefile(lines, 'Xrangesearch')
> -+  source Xrangesearch
> -+
> -+  bwipe!
> -+  call delete('Xrangesearch')
> -+endfunc
> -+
> -+
> -+" vim: shiftwidth=3D2 sts=3D2 expandtab
> -diff --git a/src/version.c b/src/version.c
> -index 2b5de5ccf..092864bbb 100644
> ---- a/src/version.c
> -+++ b/src/version.c
> -@@ -742,6 +742,8 @@ static char *(features[]) =3D
> -
> - static int included_patches[] =3D
> - {   /* Add new patch number below this line */
> -+/**/
> -+    3489,
> - /**/
> -     3487,
> - /**/
> diff --git
> a/meta/recipes-support/vim/files/0005-patch-8.2.3564-invalid-memory-acces=
s-when-scrolling-.patch
> b/meta/recipes-support/vim/files/0005-patch-8.2.3564-invalid-memory-acces=
s-when-scrolling-.patch
> deleted file mode 100644
> index 7184b37cad..0000000000
> ---
> a/meta/recipes-support/vim/files/0005-patch-8.2.3564-invalid-memory-acces=
s-when-scrolling-.patch
> +++ /dev/null
> @@ -1,97 +0,0 @@
> -CVE: CVE-2021-3903
> -Upstream-Status: Backport
> -Signed-off-by: Ross Burton <ross.burton@arm.com>
> -
> -From b15919c1fe0f7fc3d98ff5207ed2feb43c59009d Mon Sep 17 00:00:00 2001
> -From: Bram Moolenaar <Bram@vim.org>
> -Date: Mon, 25 Oct 2021 17:07:04 +0100
> -Subject: [PATCH] patch 8.2.3564: invalid memory access when scrolling
> without
> - valid screen
> -
> -Problem:    Invalid memory access when scrolling without a valid screen.
> -Solution:   Do not set VALID_BOTLINE in w_valid.
> ----
> - src/move.c                  |  1 -
> - src/testdir/test_normal.vim | 23 ++++++++++++++++++++---
> - src/version.c               |  2 ++
> - 3 files changed, 22 insertions(+), 4 deletions(-)
> -
> -diff --git a/src/move.c b/src/move.c
> -index 8e53d8bcb..10165ef4d 100644
> ---- a/src/move.c
> -+++ b/src/move.c
> -@@ -198,7 +198,6 @@ update_topline(void)
> -     {
> -       curwin->w_topline =3D curwin->w_cursor.lnum;
> -       curwin->w_botline =3D curwin->w_topline;
> --      curwin->w_valid |=3D VALID_BOTLINE|VALID_BOTLINE_AP;
> -       curwin->w_scbind_pos =3D 1;
> -       return;
> -     }
> -diff --git a/src/testdir/test_normal.vim b/src/testdir/test_normal.vim
> -index d45cf4159..ca87928f5 100644
> ---- a/src/testdir/test_normal.vim
> -+++ b/src/testdir/test_normal.vim
> -@@ -33,14 +33,14 @@ func CountSpaces(type, ...)
> -   else
> -     silent exe "normal! `[v`]y"
> -   endif
> --  let g:a=3Dstrlen(substitute(@@, '[^ ]', '', 'g'))
> -+  let g:a =3D strlen(substitute(@@, '[^ ]', '', 'g'))
> -   let &selection =3D sel_save
> -   let @@ =3D reg_save
> - endfunc
> -
> - func OpfuncDummy(type, ...)
> -   " for testing operatorfunc
> --  let g:opt=3D&linebreak
> -+  let g:opt =3D &linebreak
> -
> -   if a:0  " Invoked from Visual mode, use gv command.
> -     silent exe "normal! gvy"
> -@@ -51,7 +51,7 @@ func OpfuncDummy(type, ...)
> -   endif
> -   " Create a new dummy window
> -   new
> --  let g:bufnr=3Dbufnr('%')
> -+  let g:bufnr =3D bufnr('%')
> - endfunc
> -
> - fun! Test_normal00_optrans()
> -@@ -718,6 +718,23 @@ func Test_normal17_z_scroll_hor2()
> -   bw!
> - endfunc
> -
> -+
> -+func Test_scroll_in_ex_mode()
> -+  " This was using invalid memory because w_botline was invalid.
> -+  let lines =3D<< trim END
> -+      diffsplit
> -+      norm os0 0(
> -+      call writefile(['done'], 'Xdone')
> -+      qa!
> -+  END
> -+  call writefile(lines, 'Xscript')
> -+  call assert_equal(1, RunVim([], [], '--clean -X -Z -e -s -S Xscript')=
)
> -+  call assert_equal(['done'], readfile('Xdone'))
> -+
> -+  call delete('Xscript')
> -+  call delete('Xdone')
> -+endfunc
> -+
> - func Test_normal18_z_fold()
> -   " basic tests for foldopen/folddelete
> -   if !has("folding")
> -diff --git a/src/version.c b/src/version.c
> -index 092864bbb..a9e8be0e7 100644
> ---- a/src/version.c
> -+++ b/src/version.c
> -@@ -742,6 +742,8 @@ static char *(features[]) =3D
> -
> - static int included_patches[] =3D
> - {   /* Add new patch number below this line */
> -+/**/
> -+    3564,
> - /**/
> -     3489,
> - /**/
> diff --git a/meta/recipes-support/vim/files/CVE-2021-3778.patch
> b/meta/recipes-support/vim/files/CVE-2021-3778.patch
> deleted file mode 100644
> index 544af04458..0000000000
> --- a/meta/recipes-support/vim/files/CVE-2021-3778.patch
> +++ /dev/null
> @@ -1,61 +0,0 @@
> -From 6d351cec5b97cb72b226d03bd727e453a235ed8d Mon Sep 17 00:00:00 2001
> -From: Minjae Kim <flowergom@gmail.com>
> -Date: Sun, 26 Sep 2021 23:48:00 +0000
> -Subject: [PATCH] patch 8.2.3409: reading beyond end of line with invalid
> utf-8
> - character
> -
> -Problem: Reading beyond end of line with invalid utf-8 character.
> -Solution: Check for NUL when advancing.
> -
> -Upstream-Status: Accepted [
> https://github.com/vim/vim/commit/65b605665997fad54ef39a93199e305af2fe4d7=
f
> ]
> -CVE: CVE-2021-3778
> -Signed-off-by: Minjae Kim <flowergom@gmail.com>
> -
> ----
> - src/regexp_nfa.c                 | 3 ++-
> - src/testdir/test_regexp_utf8.vim | 7 +++++++
> - src/version.c                    | 2 ++
> - 3 files changed, 11 insertions(+), 1 deletion(-)
> -
> -diff --git a/src/regexp_nfa.c b/src/regexp_nfa.c
> -index fb512f961..ace83a1a3 100644
> ---- a/src/regexp_nfa.c
> -+++ b/src/regexp_nfa.c
> -@@ -5455,7 +5455,8 @@ find_match_text(colnr_T startcol, int regstart,
> char_u *match_text)
> -               match =3D FALSE;
> -               break;
> -           }
> --          len2 +=3D MB_CHAR2LEN(c2);
> -+          len2 +=3D enc_utf8 ? utf_ptr2len(rex.line + col + len2)
> -+                                                           :
> MB_CHAR2LEN(c2);
> -       }
> -       if (match
> -               // check that no composing char follows
> -diff --git a/src/testdir/test_regexp_utf8.vim
> b/src/testdir/test_regexp_utf8.vim
> -index 19ff882be..e0665818b 100644
> ---- a/src/testdir/test_regexp_utf8.vim
> -+++ b/src/testdir/test_regexp_utf8.vim
> -@@ -215,3 +215,10 @@ func Test_optmatch_toolong()
> -   set re=3D0
> - endfunc
> -
> -+func Test_match_invalid_byte()
> -+  call writefile(0z630a.765d30aa0a.2e0a.790a.4030, 'Xinvalid')
> -+  new
> -+  source Xinvalid
> -+  bwipe!
> -+  call delete('Xinvalid')
> -+endfunc
> -diff --git a/src/version.c b/src/version.c
> -index 8912f6215..85bdfc601 100644
> ---- a/src/version.c
> -+++ b/src/version.c
> -@@ -742,6 +742,8 @@ static char *(features[]) =3D
> -
> - static int included_patches[] =3D
> - {   /* Add new patch number below this line */
> -+/**/
> -+    3409,
> - /**/
> -     3402,
> - /**/
> diff --git
> a/meta/recipes-support/vim/files/b7081e135a16091c93f6f5f7525a5c58fb7ca9f9=
.patch
> b/meta/recipes-support/vim/files/b7081e135a16091c93f6f5f7525a5c58fb7ca9f9=
.patch
> deleted file mode 100644
> index 1cee759502..0000000000
> ---
> a/meta/recipes-support/vim/files/b7081e135a16091c93f6f5f7525a5c58fb7ca9f9=
.patch
> +++ /dev/null
> @@ -1,207 +0,0 @@
> -From b7081e135a16091c93f6f5f7525a5c58fb7ca9f9 Mon Sep 17 00:00:00 2001
> -From: Bram Moolenaar <Bram@vim.org>
> -Date: Sat, 4 Sep 2021 18:47:28 +0200
> -Subject: [PATCH] patch 8.2.3402: invalid memory access when using :retab
> with
> - large value
> -
> -Problem:    Invalid memory access when using :retab with large value.
> -Solution:   Check the number is positive.
> -
> -CVE: CVE-2021-3770
> -Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> -Upstream-Status: Backport [
> https://github.com/vim/vim/commit/b7081e135a16091c93f6f5f7525a5c58fb7ca9f=
9
> ]
> ----
> - src/indent.c               | 34 +++++++++++++++++++++-------------
> - src/option.c               | 12 ++++++------
> - src/optionstr.c            |  4 ++--
> - src/testdir/test_retab.vim |  3 +++
> - src/version.c              |  2 ++
> - 5 files changed, 34 insertions(+), 21 deletions(-)
> -
> -Index: git/src/indent.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/src/indent.c
> -+++ git/src/indent.c
> -@@ -18,18 +18,19 @@
> - /*
> -  * Set the integer values corresponding to the string setting of
> 'vartabstop'.
> -  * "array" will be set, caller must free it if needed.
> -+ * Return FAIL for an error.
> -  */
> -     int
> - tabstop_set(char_u *var, int **array)
> - {
> --    int valcount =3D 1;
> --    int t;
> --    char_u *cp;
> -+    int           valcount =3D 1;
> -+    int           t;
> -+    char_u  *cp;
> -
> -     if (var[0] =3D=3D NUL || (var[0] =3D=3D '0' && var[1] =3D=3D NUL))
> -     {
> -       *array =3D NULL;
> --      return TRUE;
> -+      return OK;
> -     }
> -
> -     for (cp =3D var; *cp !=3D NUL; ++cp)
> -@@ -43,8 +44,8 @@ tabstop_set(char_u *var, int **array)
> -               if (cp !=3D end)
> -                   emsg(_(e_positive));
> -               else
> --                  emsg(_(e_invarg));
> --              return FALSE;
> -+                  semsg(_(e_invarg2), cp);
> -+              return FAIL;
> -           }
> -       }
> -
> -@@ -55,26 +56,33 @@ tabstop_set(char_u *var, int **array)
> -           ++valcount;
> -           continue;
> -       }
> --      emsg(_(e_invarg));
> --      return FALSE;
> -+      semsg(_(e_invarg2), var);
> -+      return FAIL;
> -     }
> -
> -     *array =3D ALLOC_MULT(int, valcount + 1);
> -     if (*array =3D=3D NULL)
> --      return FALSE;
> -+      return FAIL;
> -     (*array)[0] =3D valcount;
> -
> -     t =3D 1;
> -     for (cp =3D var; *cp !=3D NUL;)
> -     {
> --      (*array)[t++] =3D atoi((char *)cp);
> --      while (*cp  !=3D NUL && *cp !=3D ',')
> -+      int n =3D atoi((char *)cp);
> -+
> -+      if (n < 0 || n > 9999)
> -+      {
> -+          semsg(_(e_invarg2), cp);
> -+          return FAIL;
> -+      }
> -+      (*array)[t++] =3D n;
> -+      while (*cp !=3D NUL && *cp !=3D ',')
> -           ++cp;
> -       if (*cp !=3D NUL)
> -           ++cp;
> -     }
> -
> --    return TRUE;
> -+    return OK;
> - }
> -
> - /*
> -@@ -1556,7 +1564,7 @@ ex_retab(exarg_T *eap)
> -
> - #ifdef FEAT_VARTABS
> -     new_ts_str =3D eap->arg;
> --    if (!tabstop_set(eap->arg, &new_vts_array))
> -+    if (tabstop_set(eap->arg, &new_vts_array) =3D=3D FAIL)
> -       return;
> -     while (vim_isdigit(*(eap->arg)) || *(eap->arg) =3D=3D ',')
> -       ++(eap->arg);
> -Index: git/src/option.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/src/option.c
> -+++ git/src/option.c
> -@@ -2292,9 +2292,9 @@ didset_options2(void)
> - #endif
> - #ifdef FEAT_VARTABS
> -     vim_free(curbuf->b_p_vsts_array);
> --    tabstop_set(curbuf->b_p_vsts, &curbuf->b_p_vsts_array);
> -+    (void)tabstop_set(curbuf->b_p_vsts, &curbuf->b_p_vsts_array);
> -     vim_free(curbuf->b_p_vts_array);
> --    tabstop_set(curbuf->b_p_vts,  &curbuf->b_p_vts_array);
> -+    (void)tabstop_set(curbuf->b_p_vts,  &curbuf->b_p_vts_array);
> - #endif
> - }
> -
> -@@ -5756,7 +5756,7 @@ buf_copy_options(buf_T *buf, int flags)
> -           buf->b_p_vsts =3D vim_strsave(p_vsts);
> -           COPY_OPT_SCTX(buf, BV_VSTS);
> -           if (p_vsts && p_vsts !=3D empty_option)
> --              tabstop_set(p_vsts, &buf->b_p_vsts_array);
> -+              (void)tabstop_set(p_vsts, &buf->b_p_vsts_array);
> -           else
> -               buf->b_p_vsts_array =3D 0;
> -           buf->b_p_vsts_nopaste =3D p_vsts_nopaste
> -@@ -5914,7 +5914,7 @@ buf_copy_options(buf_T *buf, int flags)
> -               buf->b_p_isk =3D save_p_isk;
> - #ifdef FEAT_VARTABS
> -               if (p_vts && p_vts !=3D empty_option && !buf->b_p_vts_arr=
ay)
> --                  tabstop_set(p_vts, &buf->b_p_vts_array);
> -+                  (void)tabstop_set(p_vts, &buf->b_p_vts_array);
> -               else
> -                   buf->b_p_vts_array =3D NULL;
> - #endif
> -@@ -5929,7 +5929,7 @@ buf_copy_options(buf_T *buf, int flags)
> -               buf->b_p_vts =3D vim_strsave(p_vts);
> -               COPY_OPT_SCTX(buf, BV_VTS);
> -               if (p_vts && p_vts !=3D empty_option && !buf->b_p_vts_arr=
ay)
> --                  tabstop_set(p_vts, &buf->b_p_vts_array);
> -+                  (void)tabstop_set(p_vts, &buf->b_p_vts_array);
> -               else
> -                   buf->b_p_vts_array =3D NULL;
> - #endif
> -@@ -6634,7 +6634,7 @@ paste_option_changed(void)
> -           if (buf->b_p_vsts_array)
> -               vim_free(buf->b_p_vsts_array);
> -           if (buf->b_p_vsts && buf->b_p_vsts !=3D empty_option)
> --              tabstop_set(buf->b_p_vsts, &buf->b_p_vsts_array);
> -+              (void)tabstop_set(buf->b_p_vsts, &buf->b_p_vsts_array);
> -           else
> -               buf->b_p_vsts_array =3D 0;
> - #endif
> -Index: git/src/optionstr.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/src/optionstr.c
> -+++ git/src/optionstr.c
> -@@ -2166,7 +2166,7 @@ did_set_string_option(
> -           if (errmsg =3D=3D NULL)
> -           {
> -               int *oldarray =3D curbuf->b_p_vsts_array;
> --              if (tabstop_set(*varp, &(curbuf->b_p_vsts_array)))
> -+              if (tabstop_set(*varp, &(curbuf->b_p_vsts_array)) =3D=3D =
OK)
> -               {
> -                   if (oldarray)
> -                       vim_free(oldarray);
> -@@ -2205,7 +2205,7 @@ did_set_string_option(
> -           {
> -               int *oldarray =3D curbuf->b_p_vts_array;
> -
> --              if (tabstop_set(*varp, &(curbuf->b_p_vts_array)))
> -+              if (tabstop_set(*varp, &(curbuf->b_p_vts_array)) =3D=3D O=
K)
> -               {
> -                   vim_free(oldarray);
> - #ifdef FEAT_FOLDING
> -Index: git/src/testdir/test_retab.vim
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/src/testdir/test_retab.vim
> -+++ git/src/testdir/test_retab.vim
> -@@ -74,4 +74,7 @@ endfunc
> - func Test_retab_error()
> -   call assert_fails('retab -1',  'E487:')
> -   call assert_fails('retab! -1', 'E487:')
> -+  call assert_fails('ret -1000', 'E487:')
> -+  call assert_fails('ret 10000', 'E475:')
> -+  call assert_fails('ret 80000000000000000000', 'E475:')
> - endfunc
> -Index: git/src/version.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/src/version.c
> -+++ git/src/version.c
> -@@ -743,6 +743,8 @@ static char *(features[]) =3D
> - static int included_patches[] =3D
> - {   /* Add new patch number below this line */
> - /**/
> -+    3402,
> -+/**/
> -     0
> - };
> -
> diff --git a/meta/recipes-support/vim/vim.inc
> b/meta/recipes-support/vim/vim.inc
> index a0692755b6..dc11a0aabb 100644
> --- a/meta/recipes-support/vim/vim.inc
> +++ b/meta/recipes-support/vim/vim.inc
> @@ -8,8 +8,9 @@ BUGTRACKER =3D "https://github.com/vim/vim/issues"
>  DEPENDS =3D "ncurses gettext-native"
>  # vimdiff doesn't like busybox diff
>  RSUGGESTS:${PN} =3D "diffutils"
> +
>  LICENSE =3D "vim"
> -LIC_FILES_CHKSUM =3D
> "file://runtime/doc/uganda.txt;endline=3D287;md5=3Da19edd7ec70d573a005d9e=
509375a99a"
> +LIC_FILES_CHKSUM =3D
> "file://runtime/doc/uganda.txt;endline=3D287;md5=3D909f1394892b7e0f9c2a95=
306c0c552b"
>
>  SRC_URI =3D "git://github.com/vim/vim.git;branch=3Dmaster;protocol=3Dhtt=
ps \
>             file://disable_acl_header_check.patch \
> @@ -17,18 +18,10 @@ SRC_URI =3D "git://
> github.com/vim/vim.git;branch=3Dmaster;protocol=3Dhttps \
>             file://0001-src-Makefile-improve-reproducibility.patch \
>             file://no-path-adjust.patch \
>             file://racefix.patch \
> -           file://b7081e135a16091c93f6f5f7525a5c58fb7ca9f9.patch \
> -           file://CVE-2021-3778.patch \
> -
>  file://0002-patch-8.2.3428-using-freed-memory-when-replacing.patch \
> -
>  file://0003-patch-8.2.3487-illegal-memory-access-if-buffer-name-.patch \
> -
>  file://0004-patch-8.2.3489-ml_get-error-after-search-with-range.patch \
> -
>  file://0005-patch-8.2.3564-invalid-memory-access-when-scrolling-.patch \
> -
>  file://0001-patch-8.2.3581-reading-character-past-end-of-line.patch \
> -
>  file://0002-patch-8.2.3582-reading-uninitialized-memory-when-giv.patch \
> -
>  file://0002-patch-8.2.3611-crash-when-using-CTRL-W-f-without-fin.patch \
>             "
>
> -SRCREV =3D "98056533b96b6b5d8849641de93185dd7bcadc44"
> +PV .=3D ".3752"
> +SRCREV =3D "8603be338ac810446f23c092f21bc6082f787519"
>
>  # Do not consider .z in x.y.z, as that is updated with every commit
>  UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+\.\d+)\.0"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159232):
> https://lists.openembedded.org/g/openembedded-core/message/159232
> Mute This Topic: https://lists.openembedded.org/mt/87541078/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000053b49f05d27c0dde
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I tend to agree. Vim has a strange release policy whe=
re major releases happen infrequently and allow unfixed issues to pile up, =
but minor releases are tagged for every single commit. And so it becomes ha=
rd for integrators to pick an update strategy between those thousands of co=
mmits, and even harder to backport everything if sticking to a current majo=
r release.</div><div><br></div><div>Alex<br></div><br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 6 Dec 2021 a=
t 15:50, Ross Burton &lt;<a href=3D"mailto:ross@burtonini.com">ross@burtoni=
ni.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">There&#39;s a fairly constant flow of CVEs being fixed in Vim, which =
are<br>
getting increasing non-trivial to backport.<br>
<br>
Instead of trying to backport (and potentially introduce more bugs), or<br>
just ignoring them entirely, upgrade vim to the latest patch in the hope<br=
>
that vim 8.3 will be released before we release Kirkstone.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0...1-reading-character-past-end-of-line.patch |=C2=A0 62 ------<br>
=C2=A0...28-using-freed-memory-when-replacing.patch |=C2=A0 83 -------<br>
=C2=A0...eading-uninitialized-memory-when-giv.patch |=C2=A0 63 ------<br>
=C2=A0...rash-when-using-CTRL-W-f-without-fin.patch |=C2=A0 92 --------<br>
=C2=A0...llegal-memory-access-if-buffer-name-.patch |=C2=A0 86 --------<br>
=C2=A0...ml_get-error-after-search-with-range.patch |=C2=A0 72 ------<br>
=C2=A0...nvalid-memory-access-when-scrolling-.patch |=C2=A0 97 --------<br>
=C2=A0.../vim/files/CVE-2021-3778.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 61 ------<br>
=C2=A0...1e135a16091c93f6f5f7525a5c58fb7ca9f9.patch | 207 -----------------=
-<br>
=C2=A0meta/recipes-support/vim/vim.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 15 +-<br>
=C2=A010 files changed, 4 insertions(+), 834 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-support/vim/files/0001-patch-8.2.3581=
-reading-character-past-end-of-line.patch<br>
=C2=A0delete mode 100644 meta/recipes-support/vim/files/0002-patch-8.2.3428=
-using-freed-memory-when-replacing.patch<br>
=C2=A0delete mode 100644 meta/recipes-support/vim/files/0002-patch-8.2.3582=
-reading-uninitialized-memory-when-giv.patch<br>
=C2=A0delete mode 100644 meta/recipes-support/vim/files/0002-patch-8.2.3611=
-crash-when-using-CTRL-W-f-without-fin.patch<br>
=C2=A0delete mode 100644 meta/recipes-support/vim/files/0003-patch-8.2.3487=
-illegal-memory-access-if-buffer-name-.patch<br>
=C2=A0delete mode 100644 meta/recipes-support/vim/files/0004-patch-8.2.3489=
-ml_get-error-after-search-with-range.patch<br>
=C2=A0delete mode 100644 meta/recipes-support/vim/files/0005-patch-8.2.3564=
-invalid-memory-access-when-scrolling-.patch<br>
=C2=A0delete mode 100644 meta/recipes-support/vim/files/CVE-2021-3778.patch=
<br>
=C2=A0delete mode 100644 meta/recipes-support/vim/files/b7081e135a16091c93f=
6f5f7525a5c58fb7ca9f9.patch<br>
<br>
diff --git a/meta/recipes-support/vim/files/0001-patch-8.2.3581-reading-cha=
racter-past-end-of-line.patch b/meta/recipes-support/vim/files/0001-patch-8=
.2.3581-reading-character-past-end-of-line.patch<br>
deleted file mode 100644<br>
index 28c61cd782..0000000000<br>
--- a/meta/recipes-support/vim/files/0001-patch-8.2.3581-reading-character-=
past-end-of-line.patch<br>
+++ /dev/null<br>
@@ -1,62 +0,0 @@<br>
-CVE: CVE-2021-3927<br>
-Upstream-Status: Backport<br>
-Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targ=
et=3D"_blank">ross.burton@arm.com</a>&gt;<br>
-<br>
-From 93b427c6e729260d0700c3b2804ec153bc8284fa Mon Sep 17 00:00:00 2001<br>
-From: Bram Moolenaar &lt;<a href=3D"mailto:Bram@vim.org" target=3D"_blank"=
>Bram@vim.org</a>&gt;<br>
-Date: Thu, 4 Nov 2021 15:10:11 +0000<br>
-Subject: [PATCH] patch 8.2.3581: reading character past end of line<br>
-<br>
-Problem:=C2=A0 =C2=A0 Reading character past end of line.<br>
-Solution:=C2=A0 =C2=A0Correct the cursor column.<br>
----<br>
- src/ex_docmd.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
- src/testdir/test_put.vim | 12 ++++++++++++<br>
- src/version.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 ++<br>
- 3 files changed, 15 insertions(+)<br>
-<br>
-diff --git a/src/ex_docmd.c b/src/ex_docmd.c<br>
-index fde726477..59e245bee 100644<br>
---- a/src/ex_docmd.c<br>
-+++ b/src/ex_docmd.c<br>
-@@ -6905,6 +6905,7 @@ ex_put(exarg_T *eap)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0eap-&gt;forceit =3D TRUE;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0curwin-&gt;w_cursor.lnum =3D eap-&gt;line2;<br>
-+=C2=A0 =C2=A0 check_cursor_col();<br>
-=C2=A0 =C2=A0 =C2=A0do_put(eap-&gt;regname, eap-&gt;forceit ? BACKWARD : F=
ORWARD, 1L,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PUT_LINE|PUT_CURSLINE);<br>
- }<br>
-diff --git a/src/testdir/test_put.vim b/src/testdir/test_put.vim<br>
-index 225ebd1f3..922e5b269 100644<br>
---- a/src/testdir/test_put.vim<br>
-+++ b/src/testdir/test_put.vim<br>
-@@ -113,3 +113,15 @@ func Test_put_p_indent_visual()<br>
-=C2=A0 =C2=A0call assert_equal(&#39;select that text&#39;, getline(2))<br>
-=C2=A0 =C2=A0bwipe!<br>
- endfunc<br>
-+<br>
-+func Test_put_above_first_line()<br>
-+=C2=A0 new<br>
-+=C2=A0 let @&quot; =3D &#39;text&#39;<br>
-+=C2=A0 silent! normal 0o00<br>
-+=C2=A0 0put<br>
-+=C2=A0 call assert_equal(&#39;text&#39;, getline(1))<br>
-+=C2=A0 bwipe!<br>
-+endfunc<br>
-+<br>
-+<br>
-+&quot; vim: shiftwidth=3D2 sts=3D2 expandtab<br>
-diff --git a/src/version.c b/src/version.c<br>
-index a9e8be0e7..df4ec9a47 100644<br>
---- a/src/version.c<br>
-+++ b/src/version.c<br>
-@@ -742,6 +742,8 @@ static char *(features[]) =3D<br>
- <br>
- static int included_patches[] =3D<br>
- {=C2=A0 =C2=A0/* Add new patch number below this line */<br>
-+/**/<br>
-+=C2=A0 =C2=A0 3581,<br>
- /**/<br>
-=C2=A0 =C2=A0 =C2=A03564,<br>
- /**/<br>
diff --git a/meta/recipes-support/vim/files/0002-patch-8.2.3428-using-freed=
-memory-when-replacing.patch b/meta/recipes-support/vim/files/0002-patch-8.=
2.3428-using-freed-memory-when-replacing.patch<br>
deleted file mode 100644<br>
index ecfae0301e..0000000000<br>
--- a/meta/recipes-support/vim/files/0002-patch-8.2.3428-using-freed-memory=
-when-replacing.patch<br>
+++ /dev/null<br>
@@ -1,83 +0,0 @@<br>
-CVE: CVE-2021-3796<br>
-Upstream-Status: Backport<br>
-Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targ=
et=3D"_blank">ross.burton@arm.com</a>&gt;<br>
-<br>
-From 1160e5f74b229336502fc376416f21108d36cfc2 Mon Sep 17 00:00:00 2001<br>
-From: Bram Moolenaar &lt;<a href=3D"mailto:Bram@vim.org" target=3D"_blank"=
>Bram@vim.org</a>&gt;<br>
-Date: Sat, 11 Sep 2021 21:14:20 +0200<br>
-Subject: [PATCH] patch 8.2.3428: using freed memory when replacing<br>
-<br>
-Problem:=C2=A0 =C2=A0 Using freed memory when replacing. (Dhiraj Mishra)<b=
r>
-Solution:=C2=A0 =C2=A0Get the line pointer after calling ins_copychar().<b=
r>
----<br>
- src/normal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 10 +++++++=
---<br>
- src/testdir/test_edit.vim | 14 ++++++++++++++<br>
- src/version.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 ++=
<br>
- 3 files changed, 23 insertions(+), 3 deletions(-)<br>
-<br>
-diff --git a/src/normal.c b/src/normal.c<br>
-index c4963e621..d6333b948 100644<br>
---- a/src/normal.c<br>
-+++ b/src/normal.c<br>
-@@ -5009,19 +5009,23 @@ nv_replace(cmdarg_T *cap)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Get ptr again, b=
ecause u_save and/or showmatch() will have<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* released the lin=
e.=C2=A0 At the same time we let know that the<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* line will be cha=
nged.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* released the lin=
e.=C2=A0 This may also happen in ins_copychar().<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* At the same time=
 we let know that the line will be changed.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ptr =3D ml_get_buf(curbu=
f, curwin-&gt;w_cursor.lnum, TRUE);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (cap-&gt;nchar =
=3D=3D Ctrl_E || cap-&gt;nchar =3D=3D Ctrl_Y)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int c =3D in=
s_copychar(curwin-&gt;w_cursor.lnum<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=
 (cap-&gt;nchar =3D=3D Ctrl_Y ? -1 : 1));<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ptr =3D ml_get_bu=
f(curbuf, curwin-&gt;w_cursor.lnum, TRUE);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (c !=3D N=
UL)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr[c=
urwin-&gt;w_cursor.col] =3D c;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ptr =3D ml=
_get_buf(curbuf, curwin-&gt;w_cursor.lnum, TRUE);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr[c=
urwin-&gt;w_cursor.col] =3D cap-&gt;nchar;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (p_sm &amp;&amp;=
 msg_silent =3D=3D 0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0showm=
atch(cap-&gt;nchar);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0++curwin-&gt;w_curs=
or.col;<br>
-diff --git a/src/testdir/test_edit.vim b/src/testdir/test_edit.vim<br>
-index 4e29e7fe1..f94e6c181 100644<br>
---- a/src/testdir/test_edit.vim<br>
-+++ b/src/testdir/test_edit.vim<br>
-@@ -1519,3 +1519,17 @@ func Test_edit_noesckeys()<br>
-=C2=A0 =C2=A0bwipe!<br>
-=C2=A0 =C2=A0set esckeys<br>
- endfunc<br>
-+<br>
-+&quot; Test for getting the character of the line below after &quot;p&quo=
t;<br>
-+func Test_edit_put_CTRL_E()<br>
-+=C2=A0 set encoding=3Dlatin1<br>
-+=C2=A0 new<br>
-+=C2=A0 let @&quot; =3D &#39;&#39;<br>
-+=C2=A0 sil! norm or ggRx<br>
-+=C2=A0 sil! norm pr <br>
-+=C2=A0 call assert_equal([&#39;r&#39;, &#39;r&#39;], getline(1, 2))<br>
-+=C2=A0 bwipe!<br>
-+=C2=A0 set encoding=3Dutf-8<br>
-+endfunc<br>
-+<br>
-+&quot; vim: shiftwidth=3D2 sts=3D2 expandtab<br>
-diff --git a/src/version.c b/src/version.c<br>
-index 85bdfc601..1046993d6 100644<br>
---- a/src/version.c<br>
-+++ b/src/version.c<br>
-@@ -742,6 +742,8 @@ static char *(features[]) =3D<br>
- <br>
- static int included_patches[] =3D<br>
- {=C2=A0 =C2=A0/* Add new patch number below this line */<br>
-+/**/<br>
-+=C2=A0 =C2=A0 3428,<br>
- /**/<br>
-=C2=A0 =C2=A0 =C2=A03409,<br>
- /**/<br>
diff --git a/meta/recipes-support/vim/files/0002-patch-8.2.3582-reading-uni=
nitialized-memory-when-giv.patch b/meta/recipes-support/vim/files/0002-patc=
h-8.2.3582-reading-uninitialized-memory-when-giv.patch<br>
deleted file mode 100644<br>
index d117a98893..0000000000<br>
--- a/meta/recipes-support/vim/files/0002-patch-8.2.3582-reading-uninitiali=
zed-memory-when-giv.patch<br>
+++ /dev/null<br>
@@ -1,63 +0,0 @@<br>
-CVE: CVE-2021-3928<br>
-Upstream-Status: Backport<br>
-Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targ=
et=3D"_blank">ross.burton@arm.com</a>&gt;<br>
-<br>
-From ade0f0481969f1453c60e7c8354b00dfe4238739 Mon Sep 17 00:00:00 2001<br>
-From: Bram Moolenaar &lt;<a href=3D"mailto:Bram@vim.org" target=3D"_blank"=
>Bram@vim.org</a>&gt;<br>
-Date: Thu, 4 Nov 2021 15:46:05 +0000<br>
-Subject: [PATCH] patch 8.2.3582: reading uninitialized memory when giving<=
br>
- spell suggestions<br>
-<br>
-Problem:=C2=A0 =C2=A0 Reading uninitialized memory when giving spell sugge=
stions.<br>
-Solution:=C2=A0 =C2=A0Check that preword is not empty.<br>
----<br>
- src/spellsuggest.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
- src/testdir/test_spell.vim | 8 ++++++++<br>
- src/version.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 ++<br>
- 3 files changed, 11 insertions(+), 1 deletion(-)<br>
-<br>
-diff --git a/src/spellsuggest.c b/src/spellsuggest.c<br>
-index 9d6df7930..8615d5280 100644<br>
---- a/src/spellsuggest.c<br>
-+++ b/src/spellsuggest.c<br>
-@@ -1600,7 +1600,7 @@ suggest_trie_walk(<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// ch=
ar, e.g., &quot;thes,&quot; -&gt; &quot;these&quot;.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p =3D=
 fword + sp-&gt;ts_fidx;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MB_PT=
R_BACK(fword, p);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!spell=
_iswordp(p, curwin))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!spell=
_iswordp(p, curwin) &amp;&amp; *preword !=3D NUL)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0p =3D preword + STRLEN(preword);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0MB_PTR_BACK(preword, p);<br>
-diff --git a/src/testdir/test_spell.vim b/src/testdir/test_spell.vim<br>
-index 79fb8927c..e435e9172 100644<br>
---- a/src/testdir/test_spell.vim<br>
-+++ b/src/testdir/test_spell.vim<br>
-@@ -498,6 +498,14 @@ func Test_spell_screendump()<br>
-=C2=A0 =C2=A0call delete(&#39;XtestSpell&#39;)<br>
- endfunc<br>
- <br>
-+func Test_spell_single_word()<br>
-+=C2=A0 new<br>
-+=C2=A0 silent! norm 0R00<br>
-+=C2=A0 spell! =C3=9F=C3=82<br>
-+=C2=A0 silent 0norm 0r$ Dvz=3D<br>
-+=C2=A0 bwipe!<br>
-+endfunc<br>
-+<br>
- let g:test_data_aff1 =3D [<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0\&quot;SET ISO8859-1&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0\&quot;TRY esianrtolcdugmphbyfvkwjkqxz-\xEB\xE9=
\xE8\xEA\xEF\xEE\xE4\xE0\xE2\xF6\xFC\xFB&#39;ESIANRTOLCDUGMPHBYFVKWJKQXZ&qu=
ot;,<br>
-diff --git a/src/version.c b/src/version.c<br>
-index df4ec9a47..e1bc0d09b 100644<br>
---- a/src/version.c<br>
-+++ b/src/version.c<br>
-@@ -742,6 +742,8 @@ static char *(features[]) =3D<br>
- <br>
- static int included_patches[] =3D<br>
- {=C2=A0 =C2=A0/* Add new patch number below this line */<br>
-+/**/<br>
-+=C2=A0 =C2=A0 3582,<br>
- /**/<br>
-=C2=A0 =C2=A0 =C2=A03581,<br>
- /**/<br>
diff --git a/meta/recipes-support/vim/files/0002-patch-8.2.3611-crash-when-=
using-CTRL-W-f-without-fin.patch b/meta/recipes-support/vim/files/0002-patc=
h-8.2.3611-crash-when-using-CTRL-W-f-without-fin.patch<br>
deleted file mode 100644<br>
index 58d3442677..0000000000<br>
--- a/meta/recipes-support/vim/files/0002-patch-8.2.3611-crash-when-using-C=
TRL-W-f-without-fin.patch<br>
+++ /dev/null<br>
@@ -1,92 +0,0 @@<br>
-CVE: CVE-2021-3973<br>
-Upstream-Status: Backport<br>
-Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targ=
et=3D"_blank">ross.burton@arm.com</a>&gt;<br>
-<br>
-From b6154e9f530544ddc3130d981caae0dabc053757 Mon Sep 17 00:00:00 2001<br>
-From: Bram Moolenaar &lt;<a href=3D"mailto:Bram@vim.org" target=3D"_blank"=
>Bram@vim.org</a>&gt;<br>
-Date: Wed, 17 Nov 2021 18:00:31 +0000<br>
-Subject: [PATCH] patch 8.2.3611: crash when using CTRL-W f without finding=
 a<br>
- file name=C2=A0 Problem:=C2=A0 =C2=A0 Crash when using CTRL-W f without f=
inding<br>
- a file name. Solution:=C2=A0 =C2=A0Bail out when the file name length is =
zero.<br>
-<br>
----<br>
- src/findfile.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 8 ++++++=
++<br>
- src/normal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 6 +=
+++--<br>
- src/testdir/test_visual.vim | 8 ++++++++<br>
- src/version.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +=
+<br>
- 4 files changed, 22 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/src/findfile.c b/src/findfile.c<br>
-index dba547da1..5764fd7b8 100644<br>
---- a/src/findfile.c<br>
-+++ b/src/findfile.c<br>
-@@ -1727,6 +1727,9 @@ find_file_in_path_option(<br>
-=C2=A0 =C2=A0 =C2=A0proc-&gt;pr_WindowPtr =3D (APTR)-1L;<br>
- # endif<br>
- <br>
-+=C2=A0 =C2=A0 if (len =3D=3D 0)<br>
-+=C2=A0 =C2=A0 =C2=A0 return NULL;<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0if (first =3D=3D TRUE)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0// copy file name into NameBuff, expanding envi=
ronment variables<br>
-@@ -2094,7 +2097,12 @@ find_file_name_in_path(<br>
-=C2=A0 =C2=A0 =C2=A0int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0c;<br>
- # if defined(FEAT_FIND_ID) &amp;&amp; defined(FEAT_EVAL)<br>
-=C2=A0 =C2=A0 =C2=A0char_u=C2=A0 =C2=A0 *tofree =3D NULL;<br>
-+# endif<br>
- <br>
-+=C2=A0 =C2=A0 if (len =3D=3D 0)<br>
-+=C2=A0 =C2=A0 =C2=A0 return NULL;<br>
-+<br>
-+# if defined(FEAT_FIND_ID) &amp;&amp; defined(FEAT_EVAL)<br>
-=C2=A0 =C2=A0 =C2=A0if ((options &amp; FNAME_INCL) &amp;&amp; *curbuf-&gt;=
b_p_inex !=3D NUL)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tofree =3D eval_includeexpr(ptr, len);<br>
-diff --git a/src/normal.c b/src/normal.c<br>
-index 7cb959257..f0084f2ac 100644<br>
---- a/src/normal.c<br>
-+++ b/src/normal.c<br>
-@@ -3778,8 +3778,10 @@ get_visual_text(<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*pp =3D ml_get_pos(&amp;VIsual);<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*lenp =3D curwin-&gt;w_cursor.col=
 - VIsual.col + 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 =C2=A0 if (has_mbyte)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Correct the length to include the w=
hole last character.<br>
-+=C2=A0 =C2=A0 =C2=A0 if (**pp =3D=3D NUL)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *lenp =3D 0;<br>
-+=C2=A0 =C2=A0 =C2=A0 if (has_mbyte &amp;&amp; *lenp &gt; 0)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Correct the length to include all b=
ytes of the last character.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*lenp +=3D (*mb_ptr2len)(*pp + (*=
lenp - 1)) - 1;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0reset_VIsual_and_resel();<br>
-diff --git a/src/testdir/test_visual.vim b/src/testdir/test_visual.vim<br>
-index ae281238e..0705fdb57 100644<br>
---- a/src/testdir/test_visual.vim<br>
-+++ b/src/testdir/test_visual.vim<br>
-@@ -894,4 +894,12 @@ func Test_block_insert_replace_tabs()<br>
-=C2=A0 =C2=A0bwipe!<br>
- endfunc<br>
- <br>
-+func Test_visual_block_ctrl_w_f()<br>
-+=C2=A0 &quot; Emtpy block selected in new buffer should not result in an =
error.<br>
-+=C2=A0 au! BufNew foo sil norm=C2=A0 =C2=A0f<br>
-+=C2=A0 edit foo<br>
-+<br>
-+=C2=A0 au! BufNew<br>
-+endfunc<br>
-+<br>
- &quot; vim: shiftwidth=3D2 sts=3D2 expandtab<br>
-diff --git a/src/version.c b/src/version.c<br>
-index 52be3c39d..59a314b3a 100644<br>
---- a/src/version.c<br>
-+++ b/src/version.c<br>
-@@ -742,6 +742,8 @@ static char *(features[]) =3D<br>
- <br>
- static int included_patches[] =3D<br>
- {=C2=A0 =C2=A0/* Add new patch number below this line */<br>
-+/**/<br>
-+=C2=A0 =C2=A0 3611,<br>
- /**/<br>
-=C2=A0 =C2=A0 =C2=A03582,<br>
- /**/<br>
diff --git a/meta/recipes-support/vim/files/0003-patch-8.2.3487-illegal-mem=
ory-access-if-buffer-name-.patch b/meta/recipes-support/vim/files/0003-patc=
h-8.2.3487-illegal-memory-access-if-buffer-name-.patch<br>
deleted file mode 100644<br>
index 576664f436..0000000000<br>
--- a/meta/recipes-support/vim/files/0003-patch-8.2.3487-illegal-memory-acc=
ess-if-buffer-name-.patch<br>
+++ /dev/null<br>
@@ -1,86 +0,0 @@<br>
-CVE: CVE-2021-3872<br>
-Upstream-Status: Backport<br>
-Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targ=
et=3D"_blank">ross.burton@arm.com</a>&gt;<br>
-<br>
-From 61629ea24a2fff1f89c37479d3fb52f17c3480fc Mon Sep 17 00:00:00 2001<br>
-From: Bram Moolenaar &lt;<a href=3D"mailto:Bram@vim.org" target=3D"_blank"=
>Bram@vim.org</a>&gt;<br>
-Date: Fri, 8 Oct 2021 18:39:28 +0100<br>
-Subject: [PATCH] patch 8.2.3487: illegal memory access if buffer name is v=
ery<br>
- long<br>
-<br>
-Problem:=C2=A0 =C2=A0 Illegal memory access if buffer name is very long.<b=
r>
-Solution:=C2=A0 =C2=A0Make sure not to go over the end of the buffer.<br>
----<br>
- src/drawscreen.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
 10 +++++-----<br>
- src/testdir/test_statusline.vim | 11 +++++++++++<br>
- src/version.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 2 ++<br>
- 3 files changed, 18 insertions(+), 5 deletions(-)<br>
-<br>
-diff --git a/src/drawscreen.c b/src/drawscreen.c<br>
-index 3a88ee979..9acb70552 100644<br>
---- a/src/drawscreen.c<br>
-+++ b/src/drawscreen.c<br>
-@@ -446,13 +446,13 @@ win_redr_status(win_T *wp, int ignore_pum UNUSED)<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*(p + len++) =3D &#39; &#39;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (bt_help(wp-&gt;w_buffer))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 STRCPY(p + len, _(&quot;[Help]&quot;))=
;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vim_snprintf((char *)p + len, MAXPATHL=
 - len, &quot;%s&quot;, _(&quot;[Help]&quot;));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len +=3D (int)STRLEN(p + len);<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- #ifdef FEAT_QUICKFIX<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (wp-&gt;w_p_pvw)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 STRCPY(p + len, _(&quot;[Preview]&quot=
;));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vim_snprintf((char *)p + len, MAXPATHL=
 - len, &quot;%s&quot;, _(&quot;[Preview]&quot;));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len +=3D (int)STRLEN(p + len);<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- #endif<br>
-@@ -462,12 +462,12 @@ win_redr_status(win_T *wp, int ignore_pum UNUSED)<br=
>
- #endif<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 STRCPY(p + len, &quot;[+]&quot;);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len +=3D 3;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vim_snprintf((char *)p + len, MAXPATHL=
 - len, &quot;%s&quot;, &quot;[+]&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len +=3D (int)STRLEN(p + len);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (wp-&gt;w_buffer-&gt;b_p_ro)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 STRCPY(p + len, _(&quot;[RO]&quot;));<=
br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vim_snprintf((char *)p + len, MAXPATHL=
 - len, &quot;%s&quot;, _(&quot;[RO]&quot;));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len +=3D (int)STRLEN(p + len);<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-diff --git a/src/testdir/test_statusline.vim b/src/testdir/test_statusline=
.vim<br>
-index 1f705b847..91bce1407 100644<br>
---- a/src/testdir/test_statusline.vim<br>
-+++ b/src/testdir/test_statusline.vim<br>
-@@ -393,3 +393,14 @@ func Test_statusline_visual()<br>
-=C2=A0 =C2=A0bwipe! x1<br>
-=C2=A0 =C2=A0bwipe! x2<br>
- endfunc<br>
-+&quot; Used to write beyond allocated memory.=C2=A0 This assumes MAXPATHL=
 is 4096 bytes.<br>
-+func Test_statusline_verylong_filename()<br>
-+=C2=A0 let fname =3D repeat(&#39;x&#39;, 4090)<br>
-+=C2=A0 exe &quot;new &quot; .. fname<br>
-+=C2=A0 set buftype=3Dhelp<br>
-+=C2=A0 set previewwindow<br>
-+=C2=A0 redraw<br>
-+=C2=A0 bwipe!<br>
-+endfunc<br>
-+<br>
-+&quot; vim: shiftwidth=3D2 sts=3D2 expandtab<br>
-diff --git a/src/version.c b/src/version.c<br>
-index 1046993d6..2b5de5ccf 100644<br>
---- a/src/version.c<br>
-+++ b/src/version.c<br>
-@@ -742,6 +742,8 @@ static char *(features[]) =3D<br>
- <br>
- static int included_patches[] =3D<br>
- {=C2=A0 =C2=A0/* Add new patch number below this line */<br>
-+/**/<br>
-+=C2=A0 =C2=A0 3487,<br>
- /**/<br>
-=C2=A0 =C2=A0 =C2=A03428,<br>
- /**/<br>
diff --git a/meta/recipes-support/vim/files/0004-patch-8.2.3489-ml_get-erro=
r-after-search-with-range.patch b/meta/recipes-support/vim/files/0004-patch=
-8.2.3489-ml_get-error-after-search-with-range.patch<br>
deleted file mode 100644<br>
index 045081579c..0000000000<br>
--- a/meta/recipes-support/vim/files/0004-patch-8.2.3489-ml_get-error-after=
-search-with-range.patch<br>
+++ /dev/null<br>
@@ -1,72 +0,0 @@<br>
-CVE: CVE-2021-3875<br>
-Upstream-Status: Backport<br>
-Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targ=
et=3D"_blank">ross.burton@arm.com</a>&gt;<br>
-<br>
-From b8968e26d7508e7d64bfc86808142818b0a9288c Mon Sep 17 00:00:00 2001<br>
-From: Bram Moolenaar &lt;<a href=3D"mailto:Bram@vim.org" target=3D"_blank"=
>Bram@vim.org</a>&gt;<br>
-Date: Sat, 9 Oct 2021 13:58:55 +0100<br>
-Subject: [PATCH] patch 8.2.3489: ml_get error after search with range<br>
-<br>
-Problem:=C2=A0 =C2=A0 ml_get error after search with range.<br>
-Solution:=C2=A0 =C2=A0Limit the line number to the buffer line count.<br>
----<br>
- src/ex_docmd.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 =
++++--<br>
- src/testdir/test_search.vim | 17 +++++++++++++++++<br>
- src/version.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 2 ++<br>
- 3 files changed, 23 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/src/ex_docmd.c b/src/ex_docmd.c<br>
-index fb07450f8..fde726477 100644<br>
---- a/src/ex_docmd.c<br>
-+++ b/src/ex_docmd.c<br>
-@@ -3586,8 +3586,10 @@ get_address(<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Wh=
en &#39;/&#39; or &#39;?&#39; follows another address, start from<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// th=
ere.<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (lnum !=
=3D MAXLNUM)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 curwin-&gt;w_cursor.lnum =3D lnum;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (lnum &=
gt; 0 &amp;&amp; lnum !=3D MAXLNUM)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 curwin-&gt;w_cursor.lnum =3D<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lnum &gt; curbuf-&gt;b_ml.ml_line_count<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0? =
curbuf-&gt;b_ml.ml_line_count : lnum;<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// St=
art a forward search at the end of the line (unless<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// be=
fore the first line).<br>
-diff --git a/src/testdir/test_search.vim b/src/testdir/test_search.vim<br>
-index 187671305..e142c3547 100644<br>
---- a/src/testdir/test_search.vim<br>
-+++ b/src/testdir/test_search.vim<br>
-@@ -1366,3 +1366,20 @@ func Test_searchdecl()<br>
- <br>
-=C2=A0 =C2=A0bwipe!<br>
- endfunc<br>
-+<br>
-+func Test_search_with_invalid_range()<br>
-+=C2=A0 new<br>
-+=C2=A0 let lines =3D&lt;&lt; trim END<br>
-+=C2=A0 =C2=A0 /\%.v<br>
-+=C2=A0 =C2=A0 5/<br>
-+=C2=A0 =C2=A0 c<br>
-+=C2=A0 END<br>
-+=C2=A0 call writefile(lines, &#39;Xrangesearch&#39;)<br>
-+=C2=A0 source Xrangesearch<br>
-+<br>
-+=C2=A0 bwipe!<br>
-+=C2=A0 call delete(&#39;Xrangesearch&#39;)<br>
-+endfunc<br>
-+<br>
-+<br>
-+&quot; vim: shiftwidth=3D2 sts=3D2 expandtab<br>
-diff --git a/src/version.c b/src/version.c<br>
-index 2b5de5ccf..092864bbb 100644<br>
---- a/src/version.c<br>
-+++ b/src/version.c<br>
-@@ -742,6 +742,8 @@ static char *(features[]) =3D<br>
- <br>
- static int included_patches[] =3D<br>
- {=C2=A0 =C2=A0/* Add new patch number below this line */<br>
-+/**/<br>
-+=C2=A0 =C2=A0 3489,<br>
- /**/<br>
-=C2=A0 =C2=A0 =C2=A03487,<br>
- /**/<br>
diff --git a/meta/recipes-support/vim/files/0005-patch-8.2.3564-invalid-mem=
ory-access-when-scrolling-.patch b/meta/recipes-support/vim/files/0005-patc=
h-8.2.3564-invalid-memory-access-when-scrolling-.patch<br>
deleted file mode 100644<br>
index 7184b37cad..0000000000<br>
--- a/meta/recipes-support/vim/files/0005-patch-8.2.3564-invalid-memory-acc=
ess-when-scrolling-.patch<br>
+++ /dev/null<br>
@@ -1,97 +0,0 @@<br>
-CVE: CVE-2021-3903<br>
-Upstream-Status: Backport<br>
-Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targ=
et=3D"_blank">ross.burton@arm.com</a>&gt;<br>
-<br>
-From b15919c1fe0f7fc3d98ff5207ed2feb43c59009d Mon Sep 17 00:00:00 2001<br>
-From: Bram Moolenaar &lt;<a href=3D"mailto:Bram@vim.org" target=3D"_blank"=
>Bram@vim.org</a>&gt;<br>
-Date: Mon, 25 Oct 2021 17:07:04 +0100<br>
-Subject: [PATCH] patch 8.2.3564: invalid memory access when scrolling with=
out<br>
- valid screen<br>
-<br>
-Problem:=C2=A0 =C2=A0 Invalid memory access when scrolling without a valid=
 screen.<br>
-Solution:=C2=A0 =C2=A0Do not set VALID_BOTLINE in w_valid.<br>
----<br>
- src/move.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 1 -<br>
- src/testdir/test_normal.vim | 23 ++++++++++++++++++++---<br>
- src/version.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 2 ++<br>
- 3 files changed, 22 insertions(+), 4 deletions(-)<br>
-<br>
-diff --git a/src/move.c b/src/move.c<br>
-index 8e53d8bcb..10165ef4d 100644<br>
---- a/src/move.c<br>
-+++ b/src/move.c<br>
-@@ -198,7 +198,6 @@ update_topline(void)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0curwin-&gt;w_topline =3D curwin-&gt;w_cursor.ln=
um;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0curwin-&gt;w_botline =3D curwin-&gt;w_topline;<=
br>
--=C2=A0 =C2=A0 =C2=A0 curwin-&gt;w_valid |=3D VALID_BOTLINE|VALID_BOTLINE_=
AP;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0curwin-&gt;w_scbind_pos =3D 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-diff --git a/src/testdir/test_normal.vim b/src/testdir/test_normal.vim<br>
-index d45cf4159..ca87928f5 100644<br>
---- a/src/testdir/test_normal.vim<br>
-+++ b/src/testdir/test_normal.vim<br>
-@@ -33,14 +33,14 @@ func CountSpaces(type, ...)<br>
-=C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0silent exe &quot;normal! `[v`]y&quot;<br>
-=C2=A0 =C2=A0endif<br>
--=C2=A0 let g:a=3Dstrlen(substitute(@@, &#39;[^ ]&#39;, &#39;&#39;, &#39;g=
&#39;))<br>
-+=C2=A0 let g:a =3D strlen(substitute(@@, &#39;[^ ]&#39;, &#39;&#39;, &#39=
;g&#39;))<br>
-=C2=A0 =C2=A0let &amp;selection =3D sel_save<br>
-=C2=A0 =C2=A0let @@ =3D reg_save<br>
- endfunc<br>
- <br>
- func OpfuncDummy(type, ...)<br>
-=C2=A0 =C2=A0&quot; for testing operatorfunc<br>
--=C2=A0 let g:opt=3D&amp;linebreak<br>
-+=C2=A0 let g:opt =3D &amp;linebreak<br>
- <br>
-=C2=A0 =C2=A0if a:0=C2=A0 &quot; Invoked from Visual mode, use gv command.=
<br>
-=C2=A0 =C2=A0 =C2=A0silent exe &quot;normal! gvy&quot;<br>
-@@ -51,7 +51,7 @@ func OpfuncDummy(type, ...)<br>
-=C2=A0 =C2=A0endif<br>
-=C2=A0 =C2=A0&quot; Create a new dummy window<br>
-=C2=A0 =C2=A0new<br>
--=C2=A0 let g:bufnr=3Dbufnr(&#39;%&#39;)<br>
-+=C2=A0 let g:bufnr =3D bufnr(&#39;%&#39;)<br>
- endfunc<br>
- <br>
- fun! Test_normal00_optrans()<br>
-@@ -718,6 +718,23 @@ func Test_normal17_z_scroll_hor2()<br>
-=C2=A0 =C2=A0bw!<br>
- endfunc<br>
- <br>
-+<br>
-+func Test_scroll_in_ex_mode()<br>
-+=C2=A0 &quot; This was using invalid memory because w_botline was invalid=
.<br>
-+=C2=A0 let lines =3D&lt;&lt; trim END<br>
-+=C2=A0 =C2=A0 =C2=A0 diffsplit<br>
-+=C2=A0 =C2=A0 =C2=A0 norm os0 0( <br>
-+=C2=A0 =C2=A0 =C2=A0 call writefile([&#39;done&#39;], &#39;Xdone&#39;)<br=
>
-+=C2=A0 =C2=A0 =C2=A0 qa!<br>
-+=C2=A0 END<br>
-+=C2=A0 call writefile(lines, &#39;Xscript&#39;)<br>
-+=C2=A0 call assert_equal(1, RunVim([], [], &#39;--clean -X -Z -e -s -S Xs=
cript&#39;))<br>
-+=C2=A0 call assert_equal([&#39;done&#39;], readfile(&#39;Xdone&#39;))<br>
-+<br>
-+=C2=A0 call delete(&#39;Xscript&#39;)<br>
-+=C2=A0 call delete(&#39;Xdone&#39;)<br>
-+endfunc<br>
-+<br>
- func Test_normal18_z_fold()<br>
-=C2=A0 =C2=A0&quot; basic tests for foldopen/folddelete<br>
-=C2=A0 =C2=A0if !has(&quot;folding&quot;)<br>
-diff --git a/src/version.c b/src/version.c<br>
-index 092864bbb..a9e8be0e7 100644<br>
---- a/src/version.c<br>
-+++ b/src/version.c<br>
-@@ -742,6 +742,8 @@ static char *(features[]) =3D<br>
- <br>
- static int included_patches[] =3D<br>
- {=C2=A0 =C2=A0/* Add new patch number below this line */<br>
-+/**/<br>
-+=C2=A0 =C2=A0 3564,<br>
- /**/<br>
-=C2=A0 =C2=A0 =C2=A03489,<br>
- /**/<br>
diff --git a/meta/recipes-support/vim/files/CVE-2021-3778.patch b/meta/reci=
pes-support/vim/files/CVE-2021-3778.patch<br>
deleted file mode 100644<br>
index 544af04458..0000000000<br>
--- a/meta/recipes-support/vim/files/CVE-2021-3778.patch<br>
+++ /dev/null<br>
@@ -1,61 +0,0 @@<br>
-From 6d351cec5b97cb72b226d03bd727e453a235ed8d Mon Sep 17 00:00:00 2001<br>
-From: Minjae Kim &lt;<a href=3D"mailto:flowergom@gmail.com" target=3D"_bla=
nk">flowergom@gmail.com</a>&gt;<br>
-Date: Sun, 26 Sep 2021 23:48:00 +0000<br>
-Subject: [PATCH] patch 8.2.3409: reading beyond end of line with invalid u=
tf-8<br>
- character<br>
-<br>
-Problem: Reading beyond end of line with invalid utf-8 character.<br>
-Solution: Check for NUL when advancing.<br>
-<br>
-Upstream-Status: Accepted [<a href=3D"https://github.com/vim/vim/commit/65=
b605665997fad54ef39a93199e305af2fe4d7f" rel=3D"noreferrer" target=3D"_blank=
">https://github.com/vim/vim/commit/65b605665997fad54ef39a93199e305af2fe4d7=
f</a>]<br>
-CVE: CVE-2021-3778<br>
-Signed-off-by: Minjae Kim &lt;<a href=3D"mailto:flowergom@gmail.com" targe=
t=3D"_blank">flowergom@gmail.com</a>&gt;<br>
-<br>
----<br>
- src/regexp_nfa.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 3 ++-<br>
- src/testdir/test_regexp_utf8.vim | 7 +++++++<br>
- src/version.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 2 ++<br>
- 3 files changed, 11 insertions(+), 1 deletion(-)<br>
-<br>
-diff --git a/src/regexp_nfa.c b/src/regexp_nfa.c<br>
-index fb512f961..ace83a1a3 100644<br>
---- a/src/regexp_nfa.c<br>
-+++ b/src/regexp_nfa.c<br>
-@@ -5455,7 +5455,8 @@ find_match_text(colnr_T startcol, int regstart, char=
_u *match_text)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0match =3D FALSE;<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len2 +=3D MB_CHAR2LEN(c2);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len2 +=3D enc_utf8 ? utf_ptr2len(rex.l=
ine + col + len2)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: MB_CHAR2LEN=
(c2);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (match<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// check that no co=
mposing char follows<br>
-diff --git a/src/testdir/test_regexp_utf8.vim b/src/testdir/test_regexp_ut=
f8.vim<br>
-index 19ff882be..e0665818b 100644<br>
---- a/src/testdir/test_regexp_utf8.vim<br>
-+++ b/src/testdir/test_regexp_utf8.vim<br>
-@@ -215,3 +215,10 @@ func Test_optmatch_toolong()<br>
-=C2=A0 =C2=A0set re=3D0<br>
- endfunc<br>
- <br>
-+func Test_match_invalid_byte()<br>
-+=C2=A0 call writefile(0z630a.765d30aa0a.2e0a.790a.4030, &#39;Xinvalid&#39=
;)<br>
-+=C2=A0 new<br>
-+=C2=A0 source Xinvalid<br>
-+=C2=A0 bwipe!<br>
-+=C2=A0 call delete(&#39;Xinvalid&#39;)<br>
-+endfunc<br>
-diff --git a/src/version.c b/src/version.c<br>
-index 8912f6215..85bdfc601 100644<br>
---- a/src/version.c<br>
-+++ b/src/version.c<br>
-@@ -742,6 +742,8 @@ static char *(features[]) =3D<br>
- <br>
- static int included_patches[] =3D<br>
- {=C2=A0 =C2=A0/* Add new patch number below this line */<br>
-+/**/<br>
-+=C2=A0 =C2=A0 3409,<br>
- /**/<br>
-=C2=A0 =C2=A0 =C2=A03402,<br>
- /**/<br>
diff --git a/meta/recipes-support/vim/files/b7081e135a16091c93f6f5f7525a5c5=
8fb7ca9f9.patch b/meta/recipes-support/vim/files/b7081e135a16091c93f6f5f752=
5a5c58fb7ca9f9.patch<br>
deleted file mode 100644<br>
index 1cee759502..0000000000<br>
--- a/meta/recipes-support/vim/files/b7081e135a16091c93f6f5f7525a5c58fb7ca9=
f9.patch<br>
+++ /dev/null<br>
@@ -1,207 +0,0 @@<br>
-From b7081e135a16091c93f6f5f7525a5c58fb7ca9f9 Mon Sep 17 00:00:00 2001<br>
-From: Bram Moolenaar &lt;<a href=3D"mailto:Bram@vim.org" target=3D"_blank"=
>Bram@vim.org</a>&gt;<br>
-Date: Sat, 4 Sep 2021 18:47:28 +0200<br>
-Subject: [PATCH] patch 8.2.3402: invalid memory access when using :retab w=
ith<br>
- large value<br>
-<br>
-Problem:=C2=A0 =C2=A0 Invalid memory access when using :retab with large v=
alue.<br>
-Solution:=C2=A0 =C2=A0Check the number is positive.<br>
-<br>
-CVE: CVE-2021-3770<br>
-Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfo=
undation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<=
br>
-Upstream-Status: Backport [<a href=3D"https://github.com/vim/vim/commit/b7=
081e135a16091c93f6f5f7525a5c58fb7ca9f9" rel=3D"noreferrer" target=3D"_blank=
">https://github.com/vim/vim/commit/b7081e135a16091c93f6f5f7525a5c58fb7ca9f=
9</a>]<br>
----<br>
- src/indent.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 34 +=
++++++++++++++++++++-------------<br>
- src/option.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 12 +=
+++++------<br>
- src/optionstr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++--<b=
r>
- src/testdir/test_retab.vim |=C2=A0 3 +++<br>
- src/version.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +=
+<br>
- 5 files changed, 34 insertions(+), 21 deletions(-)<br>
-<br>
-Index: git/src/indent.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- git.orig/src/indent.c<br>
-+++ git/src/indent.c<br>
-@@ -18,18 +18,19 @@<br>
- /*<br>
-=C2=A0 * Set the integer values corresponding to the string setting of &#3=
9;vartabstop&#39;.<br>
-=C2=A0 * &quot;array&quot; will be set, caller must free it if needed.<br>
-+ * Return FAIL for an error.<br>
-=C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0int<br>
- tabstop_set(char_u *var, int **array)<br>
- {<br>
--=C2=A0 =C2=A0 int valcount =3D 1;<br>
--=C2=A0 =C2=A0 int t;<br>
--=C2=A0 =C2=A0 char_u *cp;<br>
-+=C2=A0 =C2=A0 int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0valcount =3D 1;=
<br>
-+=C2=A0 =C2=A0 int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0t;<br>
-+=C2=A0 =C2=A0 char_u=C2=A0 *cp;<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0if (var[0] =3D=3D NUL || (var[0] =3D=3D &#39;0&#39; &a=
mp;&amp; var[1] =3D=3D NUL))<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0*array =3D NULL;<br>
--=C2=A0 =C2=A0 =C2=A0 return TRUE;<br>
-+=C2=A0 =C2=A0 =C2=A0 return OK;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0for (cp =3D var; *cp !=3D NUL; ++cp)<br>
-@@ -43,8 +44,8 @@ tabstop_set(char_u *var, int **array)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (cp !=3D end)<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0emsg(=
_(e_positive));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 emsg(_(e_i=
nvarg));<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return FALSE;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 semsg(_(e_=
invarg2), cp);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return FAIL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-@@ -55,26 +56,33 @@ tabstop_set(char_u *var, int **array)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0++valcount;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 =C2=A0 emsg(_(e_invarg));<br>
--=C2=A0 =C2=A0 =C2=A0 return FALSE;<br>
-+=C2=A0 =C2=A0 =C2=A0 semsg(_(e_invarg2), var);<br>
-+=C2=A0 =C2=A0 =C2=A0 return FAIL;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0*array =3D ALLOC_MULT(int, valcount + 1);<br>
-=C2=A0 =C2=A0 =C2=A0if (*array =3D=3D NULL)<br>
--=C2=A0 =C2=A0 =C2=A0 return FALSE;<br>
-+=C2=A0 =C2=A0 =C2=A0 return FAIL;<br>
-=C2=A0 =C2=A0 =C2=A0(*array)[0] =3D valcount;<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0t =3D 1;<br>
-=C2=A0 =C2=A0 =C2=A0for (cp =3D var; *cp !=3D NUL;)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
--=C2=A0 =C2=A0 =C2=A0 (*array)[t++] =3D atoi((char *)cp);<br>
--=C2=A0 =C2=A0 =C2=A0 while (*cp=C2=A0 !=3D NUL &amp;&amp; *cp !=3D &#39;,=
&#39;)<br>
-+=C2=A0 =C2=A0 =C2=A0 int n =3D atoi((char *)cp);<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 if (n &lt; 0 || n &gt; 9999)<br>
-+=C2=A0 =C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 semsg(_(e_invarg2), cp);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return FAIL;<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 (*array)[t++] =3D n;<br>
-+=C2=A0 =C2=A0 =C2=A0 while (*cp !=3D NUL &amp;&amp; *cp !=3D &#39;,&#39;)=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0++cp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (*cp !=3D NUL)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0++cp;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
- <br>
--=C2=A0 =C2=A0 return TRUE;<br>
-+=C2=A0 =C2=A0 return OK;<br>
- }<br>
- <br>
- /*<br>
-@@ -1556,7 +1564,7 @@ ex_retab(exarg_T *eap)<br>
- <br>
- #ifdef FEAT_VARTABS<br>
-=C2=A0 =C2=A0 =C2=A0new_ts_str =3D eap-&gt;arg;<br>
--=C2=A0 =C2=A0 if (!tabstop_set(eap-&gt;arg, &amp;new_vts_array))<br>
-+=C2=A0 =C2=A0 if (tabstop_set(eap-&gt;arg, &amp;new_vts_array) =3D=3D FAI=
L)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
-=C2=A0 =C2=A0 =C2=A0while (vim_isdigit(*(eap-&gt;arg)) || *(eap-&gt;arg) =
=3D=3D &#39;,&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0++(eap-&gt;arg);<br>
-Index: git/src/option.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- git.orig/src/option.c<br>
-+++ git/src/option.c<br>
-@@ -2292,9 +2292,9 @@ didset_options2(void)<br>
- #endif<br>
- #ifdef FEAT_VARTABS<br>
-=C2=A0 =C2=A0 =C2=A0vim_free(curbuf-&gt;b_p_vsts_array);<br>
--=C2=A0 =C2=A0 tabstop_set(curbuf-&gt;b_p_vsts, &amp;curbuf-&gt;b_p_vsts_a=
rray);<br>
-+=C2=A0 =C2=A0 (void)tabstop_set(curbuf-&gt;b_p_vsts, &amp;curbuf-&gt;b_p_=
vsts_array);<br>
-=C2=A0 =C2=A0 =C2=A0vim_free(curbuf-&gt;b_p_vts_array);<br>
--=C2=A0 =C2=A0 tabstop_set(curbuf-&gt;b_p_vts,=C2=A0 &amp;curbuf-&gt;b_p_v=
ts_array);<br>
-+=C2=A0 =C2=A0 (void)tabstop_set(curbuf-&gt;b_p_vts,=C2=A0 &amp;curbuf-&gt=
;b_p_vts_array);<br>
- #endif<br>
- }<br>
- <br>
-@@ -5756,7 +5756,7 @@ buf_copy_options(buf_T *buf, int flags)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0buf-&gt;b_p_vsts =3D vim_strsave(=
p_vsts);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0COPY_OPT_SCTX(buf, BV_VSTS);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (p_vsts &amp;&amp; p_vsts !=3D=
 empty_option)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tabstop_set(p_vsts, &amp=
;buf-&gt;b_p_vsts_array);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (void)tabstop_set(p_vsts=
, &amp;buf-&gt;b_p_vsts_array);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0buf-&gt;b_p_vsts_ar=
ray =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0buf-&gt;b_p_vsts_nopaste =3D p_vs=
ts_nopaste<br>
-@@ -5914,7 +5914,7 @@ buf_copy_options(buf_T *buf, int flags)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0buf-&gt;b_p_isk =3D=
 save_p_isk;<br>
- #ifdef FEAT_VARTABS<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (p_vts &amp;&amp=
; p_vts !=3D empty_option &amp;&amp; !buf-&gt;b_p_vts_array)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tabstop_se=
t(p_vts, &amp;buf-&gt;b_p_vts_array);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (void)tabs=
top_set(p_vts, &amp;buf-&gt;b_p_vts_array);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0buf-&=
gt;b_p_vts_array =3D NULL;<br>
- #endif<br>
-@@ -5929,7 +5929,7 @@ buf_copy_options(buf_T *buf, int flags)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0buf-&gt;b_p_vts =3D=
 vim_strsave(p_vts);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0COPY_OPT_SCTX(buf, =
BV_VTS);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (p_vts &amp;&amp=
; p_vts !=3D empty_option &amp;&amp; !buf-&gt;b_p_vts_array)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tabstop_se=
t(p_vts, &amp;buf-&gt;b_p_vts_array);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (void)tabs=
top_set(p_vts, &amp;buf-&gt;b_p_vts_array);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0buf-&=
gt;b_p_vts_array =3D NULL;<br>
- #endif<br>
-@@ -6634,7 +6634,7 @@ paste_option_changed(void)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (buf-&gt;b_p_vsts_array)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vim_free(buf-&gt;b_=
p_vsts_array);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (buf-&gt;b_p_vsts &amp;&amp; b=
uf-&gt;b_p_vsts !=3D empty_option)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tabstop_set(buf-&gt;b_p_=
vsts, &amp;buf-&gt;b_p_vsts_array);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (void)tabstop_set(buf-&g=
t;b_p_vsts, &amp;buf-&gt;b_p_vsts_array);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0buf-&gt;b_p_vsts_ar=
ray =3D 0;<br>
- #endif<br>
-Index: git/src/optionstr.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- git.orig/src/optionstr.c<br>
-+++ git/src/optionstr.c<br>
-@@ -2166,7 +2166,7 @@ did_set_string_option(<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (errmsg =3D=3D NULL)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int *oldarray =3D c=
urbuf-&gt;b_p_vsts_array;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tabstop_set(*varp, &=
amp;(curbuf-&gt;b_p_vsts_array)))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tabstop_set(*varp, &=
amp;(curbuf-&gt;b_p_vsts_array)) =3D=3D OK)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (o=
ldarray)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0vim_free(oldarray);<br>
-@@ -2205,7 +2205,7 @@ did_set_string_option(<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int *oldarray =3D c=
urbuf-&gt;b_p_vts_array;<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tabstop_set(*varp, &=
amp;(curbuf-&gt;b_p_vts_array)))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tabstop_set(*varp, &=
amp;(curbuf-&gt;b_p_vts_array)) =3D=3D OK)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vim_f=
ree(oldarray);<br>
- #ifdef FEAT_FOLDING<br>
-Index: git/src/testdir/test_retab.vim<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- git.orig/src/testdir/test_retab.vim<br>
-+++ git/src/testdir/test_retab.vim<br>
-@@ -74,4 +74,7 @@ endfunc<br>
- func Test_retab_error()<br>
-=C2=A0 =C2=A0call assert_fails(&#39;retab -1&#39;,=C2=A0 &#39;E487:&#39;)<=
br>
-=C2=A0 =C2=A0call assert_fails(&#39;retab! -1&#39;, &#39;E487:&#39;)<br>
-+=C2=A0 call assert_fails(&#39;ret -1000&#39;, &#39;E487:&#39;)<br>
-+=C2=A0 call assert_fails(&#39;ret 10000&#39;, &#39;E475:&#39;)<br>
-+=C2=A0 call assert_fails(&#39;ret 80000000000000000000&#39;, &#39;E475:&#=
39;)<br>
- endfunc<br>
-Index: git/src/version.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- git.orig/src/version.c<br>
-+++ git/src/version.c<br>
-@@ -743,6 +743,8 @@ static char *(features[]) =3D<br>
- static int included_patches[] =3D<br>
- {=C2=A0 =C2=A0/* Add new patch number below this line */<br>
- /**/<br>
-+=C2=A0 =C2=A0 3402,<br>
-+/**/<br>
-=C2=A0 =C2=A0 =C2=A00<br>
- };<br>
- <br>
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vi=
m.inc<br>
index a0692755b6..dc11a0aabb 100644<br>
--- a/meta/recipes-support/vim/vim.inc<br>
+++ b/meta/recipes-support/vim/vim.inc<br>
@@ -8,8 +8,9 @@ BUGTRACKER =3D &quot;<a href=3D"https://github.com/vim/vim/=
issues" rel=3D"noreferrer" target=3D"_blank">https://github.com/vim/vim/iss=
ues</a>&quot;<br>
=C2=A0DEPENDS =3D &quot;ncurses gettext-native&quot;<br>
=C2=A0# vimdiff doesn&#39;t like busybox diff<br>
=C2=A0RSUGGESTS:${PN} =3D &quot;diffutils&quot;<br>
+<br>
=C2=A0LICENSE =3D &quot;vim&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://runtime/doc/uganda.txt;endline=3D287;md5=
=3Da19edd7ec70d573a005d9e509375a99a&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://runtime/doc/uganda.txt;endline=3D287;md5=
=3D909f1394892b7e0f9c2a95306c0c552b&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/vim/vim.git;bran=
ch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.c=
om/vim/vim.git;branch=3Dmaster;protocol=3Dhttps</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://disable_acl_header_check.p=
atch \<br>
@@ -17,18 +18,10 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/vi=
m/vim.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_b=
lank">github.com/vim/vim.git;branch=3Dmaster;protocol=3Dhttps</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-src-Makefile-improve-=
reproducibility.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://no-path-adjust.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://racefix.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://b7081e135a16091c93f6f5f752=
5a5c58fb7ca9f9.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2021-3778.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-patch-8.2.3428-using-=
freed-memory-when-replacing.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-patch-8.2.3487-illega=
l-memory-access-if-buffer-name-.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0004-patch-8.2.3489-ml_get=
-error-after-search-with-range.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0005-patch-8.2.3564-invali=
d-memory-access-when-scrolling-.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-patch-8.2.3581-readin=
g-character-past-end-of-line.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-patch-8.2.3582-readin=
g-uninitialized-memory-when-giv.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-patch-8.2.3611-crash-=
when-using-CTRL-W-f-without-fin.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRCREV =3D &quot;98056533b96b6b5d8849641de93185dd7bcadc44&quot;<br>
+PV .=3D &quot;.3752&quot;<br>
+SRCREV =3D &quot;8603be338ac810446f23c092f21bc6082f787519&quot;<br>
<br>
=C2=A0# Do not consider .z in x.y.z, as that is updated with every commit<b=
r>
=C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D &quot;(?P&lt;pver&gt;\d+\.\d+)\.0&quot=
;<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#159232): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/159232" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/159232</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87541078/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87541078/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000053b49f05d27c0dde--

