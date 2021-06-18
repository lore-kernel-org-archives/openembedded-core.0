Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
 by mx.groups.io with SMTP id smtpd.web12.13751.1624049534184126523
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Jun 2021 13:52:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RujNWZCK;
 spf=pass (domain: gmail.com, ip: 209.85.217.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f41.google.com with SMTP id 68so5661635vsu.6
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Jun 2021 13:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OPldLBuVQeKukewiUwqJX2ZwYIotPn14uhjjV7VCRD8=;
        b=RujNWZCKeJJyz6ce6q5/qkowCPuhdYK3gFlb81DQIQJMl8Ydi0Jv1YNOEdd5uelbYP
         g6AsUZaZge2nyTmYiGv5hcs2SSw56uijM9vFsjOAlExVUOPI4Oo+BB3ccDJsZGVFxCv5
         9RLmZdQqAG/7c8GfeCFYukki66TKO+GcWgqhKq5w4E7s/8TKgRq94d6fvMYxQxpdsKGd
         zprd4gMko0gfr1KAxxMd6LFPA6NOuiSPgFdc5QzmJt2DB76yFkXGEuqlLKx4zppIpywu
         xcq9mr03zakVI5y+lz3IoXpQtYxlFuOmNno4sRxCP/0mZyntVB1ngNH3PtflcJ0ZRtfk
         jG9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OPldLBuVQeKukewiUwqJX2ZwYIotPn14uhjjV7VCRD8=;
        b=p1j358EMqpFn/qmf/zxctRyaUyD5/E8qznqXtR5w4RJ0oRNp3Pqh0eUjRyrrpSKQ1i
         Ih9yE36jWhLxdWXTeI1EjhLeLk4UYyuGUcULvfOav4+8BPeLQGjq+f/XlINzp4MHSNTR
         nyvgvb6lvb2fBfoVGTM2mv9LqGSDk2dHA8+J5D1EHrxRpBCzVlX1gebES350f1W4t5jB
         k8YmE1OASxlupknVGMYW5nqc29EEEG5MaS5E8RDc/ZhHCJJTiLEdHg0mfDLaj8DifazL
         9vSOYQW1jsi+wPVgOLdj7XXggrSYm3HJcYErnHotU2I5npp6GJXaz+eUmKvB9y1vagDj
         JGWQ==
X-Gm-Message-State: AOAM531xx7oUt4RXJ/efhWD4P1uQBbnmUgcuIoCdOCX2uTNDFIR0bzci
	1BBB4XUbZndBTm7hWqTxaWlnpUZeVzuPXpbvRr0XBXRB
X-Google-Smtp-Source: ABdhPJwGQEr7N7WYvv8FLMs+hy3pnuh/Ev0O03uQcfkGjkcaQ216+w/98gYq0lwrNZ97+2JrQW9jywJ5ba+leK6x/aM=
X-Received: by 2002:a67:1005:: with SMTP id 5mr9312400vsq.51.1624049533343;
 Fri, 18 Jun 2021 13:52:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210618204301.426877-1-anders.wallin@windriver.com>
In-Reply-To: <20210618204301.426877-1-anders.wallin@windriver.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Fri, 18 Jun 2021 22:52:02 +0200
Message-ID: <CANNYZj844DD3FLJRbV_iCeQxEKbKyDzFxcNXtY8Lg7+v3TcPcw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] coreutils: remove NOSTAT_LEAF_OPTIMIZATION
To: Anders Wallin <wallinux@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Anders Wallin <anders.wallin@windriver.com>
Content-Type: multipart/alternative; boundary="000000000000885bf805c5107f13"

--000000000000885bf805c5107f13
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Apologies, but you do need to explain clearly where the patch is coming
from, and set Upstream-Status appropriately.

Also, it looks like something that has to be accepted by upstream first
before oe-core can take it.

Alex

On Fri, 18 Jun 2021 at 22:43, Anders Wallin <wallinux@gmail.com> wrote:

> It caused =E2=80=98find=E2=80=99 and =E2=80=98du=E2=80=99 to dump core, =
and it was useful
> only for obsolescent Linux filesystems anyway.  Problem reported in:
> https://lists.gnu.org/r/bug-gnulib/2020-04/msg00068.html
> Quite possibly there is still a serious underlying fts bug with
> tight-loop-check and mutating file systems, but if so this patch
> should cause the bug to be triggered less often.
> * lib/fts.c (enum leaf_optimization): Remove
> NOSTAT_LEAF_OPTIMIZATION, as it=E2=80=99s problematic.
> (S_MAGIC_REISERFS, S_MAGIC_XFS): Remove; no longer needed.
> (leaf_optimization): Remove special cases for ReiserFS and XFS.
> (fts_read): Remove NOSTAT_LEAF_OPTIMIZATION code.
> * lib/fts_.h (struct _ftsent.fts_n_dirs_remaining):
> Remove.  All uses removed.
>
> Signed-off-by: Anders Wallin <anders.wallin@windriver.com>
> ---
>  ...-fts-remove-NOSTAT_LEAF_OPTIMIZATION.patch | 162 ++++++++++++++++++
>  meta/recipes-core/coreutils/coreutils_8.32.bb |   1 +
>  2 files changed, 163 insertions(+)
>  create mode 100644
> meta/recipes-core/coreutils/coreutils/0001-fts-remove-NOSTAT_LEAF_OPTIMI=
ZATION.patch
>
> diff --git
> a/meta/recipes-core/coreutils/coreutils/0001-fts-remove-NOSTAT_LEAF_OPTI=
MIZATION.patch
> b/meta/recipes-core/coreutils/coreutils/0001-fts-remove-NOSTAT_LEAF_OPTI=
MIZATION.patch
> new file mode 100644
> index 0000000000..e3f9e3b502
> --- /dev/null
> +++
> b/meta/recipes-core/coreutils/coreutils/0001-fts-remove-NOSTAT_LEAF_OPTI=
MIZATION.patch
> @@ -0,0 +1,162 @@
> +From 0a0d887e095f97185d25e90b59612b1da8197533 Mon Sep 17 00:00:00 2001
> +Message-Id: <
> 0a0d887e095f97185d25e90b59612b1da8197533.1624008099.git.wallinux@gmail.c=
om
> >
> +From: Paul Eggert <eggert@cs.ucla.edu>
> +Date: Wed, 15 Apr 2020 20:50:32 -0700
> +Subject: [PATCH] fts: remove NOSTAT_LEAF_OPTIMIZATION
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +It caused =E2=80=98find=E2=80=99 and =E2=80=98du=E2=80=99 to dump core,=
 and it was useful
> +only for obsolescent Linux filesystems anyway.  Problem reported in:
> +https://lists.gnu.org/r/bug-gnulib/2020-04/msg00068.html
> +Quite possibly there is still a serious underlying fts bug with
> +tight-loop-check and mutating file systems, but if so this patch
> +should cause the bug to be triggered less often.
> +* lib/fts.c (enum leaf_optimization): Remove
> +NOSTAT_LEAF_OPTIMIZATION, as it=E2=80=99s problematic.
> +(S_MAGIC_REISERFS, S_MAGIC_XFS): Remove; no longer needed.
> +(leaf_optimization): Remove special cases for ReiserFS and XFS.
> +(fts_read): Remove NOSTAT_LEAF_OPTIMIZATION code.
> +* lib/fts_.h (struct _ftsent.fts_n_dirs_remaining):
> +Remove.  All uses removed.
> +---
> + lib/fts.c  | 56 ++++++++----------------------------------------------
> + lib/fts_.h |  5 -----
> + 2 files changed, 8 insertions(+), 53 deletions(-)
> +
> +diff --git a/lib/fts.c b/lib/fts.c
> +index d3a0472..ade8c33 100644
> +--- a/lib/fts.c
> ++++ b/lib/fts.c
> +@@ -445,7 +445,6 @@ fts_open (char * const *argv,
> +                 if ((parent =3D fts_alloc(sp, "", 0)) =3D=3D NULL)
> +                         goto mem2;
> +                 parent->fts_level =3D FTS_ROOTPARENTLEVEL;
> +-                parent->fts_n_dirs_remaining =3D -1;
> +           }
> +
> +         /* The classic fts implementation would call fts_stat with
> +@@ -634,9 +633,8 @@ fts_close (FTS *sp)
> + }
> +
> + /* Minimum link count of a traditional Unix directory.  When leaf
> +-   optimization is OK and MIN_DIR_NLINK <=3D st_nlink, then st_nlink i=
s
> +-   an upper bound on the number of subdirectories (counting "." and
> +-   "..").  */
> ++   optimization is OK and a directory's st_nlink =3D=3D MIN_DIR_NLINK,
> ++   then the directory has no subdirectories.  */
> + enum { MIN_DIR_NLINK =3D 2 };
> +
> + /* Whether leaf optimization is OK for a directory.  */
> +@@ -645,12 +643,8 @@ enum leaf_optimization
> +     /* st_nlink is not reliable for this directory's subdirectories.  =
*/
> +     NO_LEAF_OPTIMIZATION,
> +
> +-    /* Leaf optimization is OK, but is not useful for avoiding stat
> calls.  */
> +-    OK_LEAF_OPTIMIZATION,
> +-
> +-    /* Leaf optimization is not only OK: it is useful for avoiding
> +-       stat calls, because dirent.d_type does not work.  */
> +-    NOSTAT_LEAF_OPTIMIZATION
> ++    /* st_nlink =3D=3D 2 means the directory lacks subdirectories.  */
> ++    OK_LEAF_OPTIMIZATION
> +   };
> +
> + #if (defined __linux__ || defined __ANDROID__) \
> +@@ -663,9 +657,7 @@ enum leaf_optimization
> + # define S_MAGIC_CIFS 0xFF534D42
> + # define S_MAGIC_NFS 0x6969
> + # define S_MAGIC_PROC 0x9FA0
> +-# define S_MAGIC_REISERFS 0x52654973
> + # define S_MAGIC_TMPFS 0x1021994
> +-# define S_MAGIC_XFS 0x58465342
> +
> + # ifdef HAVE___FSWORD_T
> + typedef __fsword_t fsword;
> +@@ -782,23 +774,15 @@ dirent_inode_sort_may_be_useful (FTSENT const *p,
> int dir_fd)
> + }
> +
> + /* Given an FTS entry P for a directory with descriptor DIR_FD,
> +-   return true if it is both useful and valid to apply leaf optimizati=
on.
> +-   The optimization is useful only for file systems that lack usable
> +-   dirent.d_type info.  The optimization is valid if an st_nlink value
> +-   of at least MIN_DIR_NLINK is an upper bound on the number of
> +-   subdirectories of D, counting "." and ".."  as subdirectories.
> ++   return whether it is valid to apply leaf optimization.
> ++   The optimization is valid if a directory's st_nlink value equal
> ++   to MIN_DIR_NLINK means the directory has no subdirectories.
> +    DIR_FD is negative if unavailable.  */
> + static enum leaf_optimization
> + leaf_optimization (FTSENT const *p, int dir_fd)
> + {
> +   switch (filesystem_type (p, dir_fd))
> +     {
> +-      /* List here the file system types that may lack usable
> dirent.d_type
> +-         info, yet for which the optimization does apply.  */
> +-    case S_MAGIC_REISERFS:
> +-    case S_MAGIC_XFS: /* XFS lacked it until 2013-08-22 commit.  */
> +-      return NOSTAT_LEAF_OPTIMIZATION;
> +-
> +     case 0:
> +       /* Leaf optimization is unsafe if the file system type is
> unknown.  */
> +       FALLTHROUGH;
> +@@ -1023,26 +1007,7 @@ check_for_dir:
> +                 if (p->fts_info =3D=3D FTS_NSOK)
> +                   {
> +                     if (p->fts_statp->st_size =3D=3D FTS_STAT_REQUIRED=
)
> +-                      {
> +-                        FTSENT *parent =3D p->fts_parent;
> +-                        if (parent->fts_n_dirs_remaining =3D=3D 0
> +-                            && ISSET(FTS_NOSTAT)
> +-                            && ISSET(FTS_PHYSICAL)
> +-                            && (leaf_optimization (parent,
> sp->fts_cwd_fd)
> +-                                =3D=3D NOSTAT_LEAF_OPTIMIZATION))
> +-                          {
> +-                            /* nothing more needed */
> +-                          }
> +-                        else
> +-                          {
> +-                            p->fts_info =3D fts_stat(sp, p, false);
> +-                            if (S_ISDIR(p->fts_statp->st_mode)
> +-                                && p->fts_level !=3D FTS_ROOTLEVEL
> +-                                && 0 < parent->fts_n_dirs_remaining
> +-                                && parent->fts_n_dirs_remaining !=3D
> (nlink_t) -1)
> +-                                  parent->fts_n_dirs_remaining--;
> +-                          }
> +-                      }
> ++                      p->fts_info =3D fts_stat(sp, p, false);
> +                     else
> +                       fts_assert (p->fts_statp->st_size =3D=3D
> FTS_NO_STAT_REQUIRED);
> +                   }
> +@@ -1826,11 +1791,6 @@ err:            memset(sbp, 0, sizeof(struct
> stat));
> +         }
> +
> +         if (S_ISDIR(sbp->st_mode)) {
> +-                p->fts_n_dirs_remaining
> +-                  =3D ((sbp->st_nlink < MIN_DIR_NLINK
> +-                      || p->fts_level <=3D FTS_ROOTLEVEL)
> +-                     ? -1
> +-                     : sbp->st_nlink - (ISSET (FTS_SEEDOT) ? 0 :
> MIN_DIR_NLINK));
> +                 if (ISDOT(p->fts_name)) {
> +                         /* Command-line "." and ".." are real
> directories. */
> +                         return (p->fts_level =3D=3D FTS_ROOTLEVEL ? FT=
S_D :
> FTS_DOT);
> +diff --git a/lib/fts_.h b/lib/fts_.h
> +index 6c7d0ce..15c248c 100644
> +--- a/lib/fts_.h
> ++++ b/lib/fts_.h
> +@@ -219,11 +219,6 @@ typedef struct _ftsent {
> +
> +         size_t fts_namelen;             /* strlen(fts_name) */
> +
> +-        /* If not (nlink_t) -1, an upper bound on the number of
> +-           remaining subdirectories of interest.  If this becomes
> +-           zero, some work can be avoided.  */
> +-        nlink_t fts_n_dirs_remaining;
> +-
> + # define FTS_D           1              /* preorder directory */
> + # define FTS_DC          2              /* directory that causes cycle=
s
> */
> + # define FTS_DEFAULT     3              /* none of the above */
> +--
> +2.29.2
> +
> diff --git a/meta/recipes-core/coreutils/coreutils_8.32.bb
> b/meta/recipes-core/coreutils/coreutils_8.32.bb
> index f3fe31fd3b..dd271d4968 100644
> --- a/meta/recipes-core/coreutils/coreutils_8.32.bb
> +++ b/meta/recipes-core/coreutils/coreutils_8.32.bb
> @@ -21,6 +21,7 @@ SRC_URI =3D "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
>             file://0001-local.mk-fix-cross-compiling-problem.patch \
>             file://run-ptest \
>
> file://0001-ls-restore-8.31-behavior-on-removed-directories.patch \
> +           file://0001-fts-remove-NOSTAT_LEAF_OPTIMIZATION.patch \
>             "
>
>  SRC_URI[md5sum] =3D "022042695b7d5bcf1a93559a9735e668"
> --
> 2.32.0
>
>
>=20
>
>

--000000000000885bf805c5107f13
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Apologies, but you do need to explain clearly where t=
he patch is coming from, and set Upstream-Status appropriately.</div><div><=
br></div><div>Also, it looks like something that has to be accepted by upst=
ream first before oe-core can take it.</div><div><br></div><div>Alex<br></d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Fri, 18 Jun 2021 at 22:43, Anders Wallin &lt;<a href=3D"mailto:wallin=
ux@gmail.com">wallinux@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">It caused =E2=80=98find=E2=80=99 and =E2=
=80=98du=E2=80=99 to dump core, and it was useful<br>
only for obsolescent Linux filesystems anyway.=C2=A0 Problem reported in:<=
br>
<a href=3D"https://lists.gnu.org/r/bug-gnulib/2020-04/msg00068.html" rel=
=3D"noreferrer" target=3D"_blank">https://lists.gnu.org/r/bug-gnulib/2020-=
04/msg00068.html</a><br>
Quite possibly there is still a serious underlying fts bug with<br>
tight-loop-check and mutating file systems, but if so this patch<br>
should cause the bug to be triggered less often.<br>
* lib/fts.c (enum leaf_optimization): Remove<br>
NOSTAT_LEAF_OPTIMIZATION, as it=E2=80=99s problematic.<br>
(S_MAGIC_REISERFS, S_MAGIC_XFS): Remove; no longer needed.<br>
(leaf_optimization): Remove special cases for ReiserFS and XFS.<br>
(fts_read): Remove NOSTAT_LEAF_OPTIMIZATION code.<br>
* lib/fts_.h (struct _ftsent.fts_n_dirs_remaining):<br>
Remove.=C2=A0 All uses removed.<br>
<br>
Signed-off-by: Anders Wallin &lt;<a href=3D"mailto:anders.wallin@windriver=
.com" target=3D"_blank">anders.wallin@windriver.com</a>&gt;<br>
---<br>
=C2=A0...-fts-remove-NOSTAT_LEAF_OPTIMIZATION.patch | 162 ++++++++++++++++=
++<br>
=C2=A0meta/recipes-core/coreutils/<a href=3D"http://coreutils_8.32.bb" rel=
=
=3D"noreferrer" target=3D"_blank">coreutils_8.32.bb</a> |=C2=A0 =C2=A01 +<=
br>
=C2=A02 files changed, 163 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-core/coreutils/coreutils/0001-fts-re=
move-NOSTAT_LEAF_OPTIMIZATION.patch<br>
<br>
diff --git a/meta/recipes-core/coreutils/coreutils/0001-fts-remove-NOSTAT_=
LEAF_OPTIMIZATION.patch b/meta/recipes-core/coreutils/coreutils/0001-fts-re=
move-NOSTAT_LEAF_OPTIMIZATION.patch<br>
new file mode 100644<br>
index 0000000000..e3f9e3b502<br>
--- /dev/null<br>
+++ b/meta/recipes-core/coreutils/coreutils/0001-fts-remove-NOSTAT_LEAF_OP=
TIMIZATION.patch<br>
@@ -0,0 +1,162 @@<br>
+From 0a0d887e095f97185d25e90b59612b1da8197533 Mon Sep 17 00:00:00 2001<br=
>
+Message-Id: &lt;<a href=3D"mailto:0a0d887e095f97185d25e90b59612b1da819753=
3.1624008099.git.wallinux@gmail.com" target=3D"_blank">0a0d887e095f97185d25=
e90b59612b1da8197533.1624008099.git.wallinux@gmail.com</a>&gt;<br>
+From: Paul Eggert &lt;<a href=3D"mailto:eggert@cs.ucla.edu" target=3D"_bl=
ank">eggert@cs.ucla.edu</a>&gt;<br>
+Date: Wed, 15 Apr 2020 20:50:32 -0700<br>
+Subject: [PATCH] fts: remove NOSTAT_LEAF_OPTIMIZATION<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+It caused =E2=80=98find=E2=80=99 and =E2=80=98du=E2=80=99 to dump core, a=
nd it was useful<br>
+only for obsolescent Linux filesystems anyway.=C2=A0 Problem reported in:=
<br>
+<a href=3D"https://lists.gnu.org/r/bug-gnulib/2020-04/msg00068.html" rel=
=3D"noreferrer" target=3D"_blank">https://lists.gnu.org/r/bug-gnulib/2020-=
04/msg00068.html</a><br>
+Quite possibly there is still a serious underlying fts bug with<br>
+tight-loop-check and mutating file systems, but if so this patch<br>
+should cause the bug to be triggered less often.<br>
+* lib/fts.c (enum leaf_optimization): Remove<br>
+NOSTAT_LEAF_OPTIMIZATION, as it=E2=80=99s problematic.<br>
+(S_MAGIC_REISERFS, S_MAGIC_XFS): Remove; no longer needed.<br>
+(leaf_optimization): Remove special cases for ReiserFS and XFS.<br>
+(fts_read): Remove NOSTAT_LEAF_OPTIMIZATION code.<br>
+* lib/fts_.h (struct _ftsent.fts_n_dirs_remaining):<br>
+Remove.=C2=A0 All uses removed.<br>
+---<br>
+ lib/fts.c=C2=A0 | 56 ++++++++-------------------------------------------=
---<br>
+ lib/fts_.h |=C2=A0 5 -----<br>
+ 2 files changed, 8 insertions(+), 53 deletions(-)<br>
+<br>
+diff --git a/lib/fts.c b/lib/fts.c<br>
+index d3a0472..ade8c33 100644<br>
+--- a/lib/fts.c<br>
++++ b/lib/fts.c<br>
+@@ -445,7 +445,6 @@ fts_open (char * const *argv,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((parent=
 =3D fts_alloc(sp, &quot;&quot;, 0)) =3D=3D NULL)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0goto mem2;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0parent-&gt;=
fts_level =3D FTS_ROOTPARENTLEVEL;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parent-&gt;fts_n=
_dirs_remaining =3D -1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* The classic fts implementation would=
 call fts_stat with<br>
+@@ -634,9 +633,8 @@ fts_close (FTS *sp)<br>
+ }<br>
+ <br>
+ /* Minimum link count of a traditional Unix directory.=C2=A0 When leaf<b=
r>
+-=C2=A0 =C2=A0optimization is OK and MIN_DIR_NLINK &lt;=3D st_nlink, then=
 st_nlink is<br>
+-=C2=A0 =C2=A0an upper bound on the number of subdirectories (counting &q=
uot;.&quot; and<br>
+-=C2=A0 =C2=A0&quot;..&quot;).=C2=A0 */<br>
++=C2=A0 =C2=A0optimization is OK and a directory&#39;s st_nlink =3D=3D MI=
N_DIR_NLINK,<br>
++=C2=A0 =C2=A0then the directory has no subdirectories.=C2=A0 */<br>
+ enum { MIN_DIR_NLINK =3D 2 };<br>
+ <br>
+ /* Whether leaf optimization is OK for a directory.=C2=A0 */<br>
+@@ -645,12 +643,8 @@ enum leaf_optimization<br>
+=C2=A0 =C2=A0 =C2=A0/* st_nlink is not reliable for this directory&#39;s =
subdirectories.=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0NO_LEAF_OPTIMIZATION,<br>
+ <br>
+-=C2=A0 =C2=A0 /* Leaf optimization is OK, but is not useful for avoiding=
 stat calls.=C2=A0 */<br>
+-=C2=A0 =C2=A0 OK_LEAF_OPTIMIZATION,<br>
+-<br>
+-=C2=A0 =C2=A0 /* Leaf optimization is not only OK: it is useful for avoi=
ding<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0stat calls, because dirent.d_type does not wo=
rk.=C2=A0 */<br>
+-=C2=A0 =C2=A0 NOSTAT_LEAF_OPTIMIZATION<br>
++=C2=A0 =C2=A0 /* st_nlink =3D=3D 2 means the directory lacks subdirector=
ies.=C2=A0 */<br>
++=C2=A0 =C2=A0 OK_LEAF_OPTIMIZATION<br>
+=C2=A0 =C2=A0};<br>
+ <br>
+ #if (defined __linux__ || defined __ANDROID__) \<br>
+@@ -663,9 +657,7 @@ enum leaf_optimization<br>
+ # define S_MAGIC_CIFS 0xFF534D42<br>
+ # define S_MAGIC_NFS 0x6969<br>
+ # define S_MAGIC_PROC 0x9FA0<br>
+-# define S_MAGIC_REISERFS 0x52654973<br>
+ # define S_MAGIC_TMPFS 0x1021994<br>
+-# define S_MAGIC_XFS 0x58465342<br>
+ <br>
+ # ifdef HAVE___FSWORD_T<br>
+ typedef __fsword_t fsword;<br>
+@@ -782,23 +774,15 @@ dirent_inode_sort_may_be_useful (FTSENT const *p, i=
nt dir_fd)<br>
+ }<br>
+ <br>
+ /* Given an FTS entry P for a directory with descriptor DIR_FD,<br>
+-=C2=A0 =C2=A0return true if it is both useful and valid to apply leaf op=
timization.<br>
+-=C2=A0 =C2=A0The optimization is useful only for file systems that lack =
usable<br>
+-=C2=A0 =C2=A0dirent.d_type info.=C2=A0 The optimization is valid if an s=
t_nlink value<br>
+-=C2=A0 =C2=A0of at least MIN_DIR_NLINK is an upper bound on the number o=
f<br>
+-=C2=A0 =C2=A0subdirectories of D, counting &quot;.&quot; and &quot;..&qu=
ot;=C2=A0 as subdirectories.<br>
++=C2=A0 =C2=A0return whether it is valid to apply leaf optimization.<br>
++=C2=A0 =C2=A0The optimization is valid if a directory&#39;s st_nlink val=
ue equal<br>
++=C2=A0 =C2=A0to MIN_DIR_NLINK means the directory has no subdirectories.=
<br>
+=C2=A0 =C2=A0 DIR_FD is negative if unavailable.=C2=A0 */<br>
+ static enum leaf_optimization<br>
+ leaf_optimization (FTSENT const *p, int dir_fd)<br>
+ {<br>
+=C2=A0 =C2=A0switch (filesystem_type (p, dir_fd))<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 =C2=A0 /* List here the file system types that may lack us=
able dirent.d_type<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info, yet for which the optimization d=
oes apply.=C2=A0 */<br>
+-=C2=A0 =C2=A0 case S_MAGIC_REISERFS:<br>
+-=C2=A0 =C2=A0 case S_MAGIC_XFS: /* XFS lacked it until 2013-08-22 commit=
.=C2=A0 */<br>
+-=C2=A0 =C2=A0 =C2=A0 return NOSTAT_LEAF_OPTIMIZATION;<br>
+-<br>
+=C2=A0 =C2=A0 =C2=A0case 0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Leaf optimization is unsafe if the file sys=
tem type is unknown.=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0FALLTHROUGH;<br>
+@@ -1023,26 +1007,7 @@ check_for_dir:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (p-&gt;f=
ts_info =3D=3D FTS_NSOK)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0if (p-&gt;fts_statp-&gt;st_size =3D=3D FTS_STAT_REQUIRED)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 FTSENT *parent =3D p-&gt;fts_parent;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 if (parent-&gt;fts_n_dirs_remaining =3D=3D 0<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; ISSET(FTS_NOSTAT)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; ISSET(FTS_PHYSICAL)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; (leaf_optimization (parent, sp-&gt;=
fts_cwd_fd)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=3D NOSTAT_LEAF_OPTIMIZATION)=
)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* nothing more needed */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 else<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 p-&gt;fts_info =3D fts_stat(sp, p, false);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (S_ISDIR(p-&gt;fts_statp-&gt;st_mode)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; p-&gt;fts_level !=3D =
FTS_ROOTLEVEL<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; 0 &lt; parent-&gt;fts=
_n_dirs_remaining<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; parent-&gt;fts_n_dirs=
_remaining !=3D (nlink_t) -1)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parent-&gt;fts_n_dirs_rem=
aining--;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 p-&gt;fts_info =3D fts_stat(sp, p, false);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0fts_assert (p-&gt;fts_statp-&gt;st_size =3D=3D FTS_NO_STAT_REQUI=
RED);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br=
>
+@@ -1826,11 +1791,6 @@ err:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mems=
et(sbp, 0, sizeof(struct stat));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (S_ISDIR(sbp-&gt;st_mode)) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p-&gt;fts_n_dirs=
_remaining<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D ((sbp=
-&gt;st_nlink &lt; MIN_DIR_NLINK<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 || p-&gt;fts_level &lt;=3D FTS_ROOTLEVEL)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0? -1<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0: sbp-&gt;st_nlink - (ISSET (FTS_SEEDOT) ? 0 : MIN_DIR_NLINK));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ISDOT(p=
-&gt;fts_name)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0/* Command-line &quot;.&quot; and &quot;..&quot; are real=
 directories. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0return (p-&gt;fts_level =3D=3D FTS_ROOTLEVEL ? FTS_D : FT=
S_DOT);<br>
+diff --git a/lib/fts_.h b/lib/fts_.h<br>
+index 6c7d0ce..15c248c 100644<br>
+--- a/lib/fts_.h<br>
++++ b/lib/fts_.h<br>
+@@ -219,11 +219,6 @@ typedef struct _ftsent {<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t fts_namelen;=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* strlen(fts_name) */<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* If not (nlink_t) -1, an upper bound on th=
e number of<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0remaining subdirectories of int=
erest.=C2=A0 If this becomes<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0zero, some work can be avoided.=
=
=C2=A0 */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 nlink_t fts_n_dirs_remaining;<br>
+-<br>
+ # define FTS_D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* preorder directory */<br>
+ # define FTS_DC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2=C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* directory that causes cycles */<br>
+ # define FTS_DEFAULT=C2=A0 =C2=A0 =C2=A03=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 /* none of the above */<br>
+-- <br>
+2.29.2<br>
+<br>
diff --git a/meta/recipes-core/coreutils/<a href=3D"http://coreutils_8.32.=
bb" rel=3D"noreferrer" target=3D"_blank">coreutils_8.32.bb</a> b/meta/recip=
es-core/coreutils/<a href=3D"http://coreutils_8.32.bb" rel=3D"noreferrer" t=
arget=3D"_blank">coreutils_8.32.bb</a><br>
index f3fe31fd3b..dd271d4968 100644<br>
--- a/meta/recipes-core/coreutils/<a href=3D"http://coreutils_8.32.bb" rel=
=
=3D"noreferrer" target=3D"_blank">coreutils_8.32.bb</a><br>
+++ b/meta/recipes-core/coreutils/<a href=3D"http://coreutils_8.32.bb" rel=
=
=3D"noreferrer" target=3D"_blank">coreutils_8.32.bb</a><br>
@@ -21,6 +21,7 @@ SRC_URI =3D &quot;${GNU_MIRROR}/coreutils/${BP}.tar.xz \=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-local.mk-fix-cross-c=
ompiling-problem.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-ls-restore-8.31-beha=
vior-on-removed-directories.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-fts-remove-NOSTAT_LE=
AF_OPTIMIZATION.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI[md5sum] =3D &quot;022042695b7d5bcf1a93559a9735e668&quot;<br>
-- <br>
2.32.0<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000885bf805c5107f13--
