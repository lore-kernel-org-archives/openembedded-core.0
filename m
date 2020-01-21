Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
	[209.85.208.51])
	by mail.openembedded.org (Postfix) with ESMTP id 940E17FD87
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2020 16:59:20 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id f8so3719030edv.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2020 08:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=iJsEKU95orslMtrq74vYS6ULBuiII3rofvO1toIPiIg=;
	b=oIqHaV7dJkVnnDLdWGal/qpr969lQUGMFRx4rOIApQpgyK7LZjCbOgh5gD/K0T76/T
	l/uvbl/zVcOWgd/5iXTwFOyoCR/FZQF8U0PjWRUqW7i26+Xavisx1qIax7Kc7vVIYvwJ
	23EPRXkmDHTGV9EOYrUv2YtyC+LWvegDakAurYRJVzTGNeksGR34F1SBtXQv/fzwYthI
	D63rDtvlC7bR/hGp7WZa3m7JVk8cNxlgGPsOFHLeL+21jqyK/2gpApea5gWvlrJLCXbN
	qIbWeKbCTTbBcwRQHbuLfK1lDsO0rfqwlL1M4X2FhXTT3K/bQpzalzychP/l8HtV/Z4o
	7jDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=iJsEKU95orslMtrq74vYS6ULBuiII3rofvO1toIPiIg=;
	b=Gd8k7EKzOA/MubgOI/S8Md4iXCa/5kPPxyLZ7CACdEzFm209ZzxypkzmZjtW1QJdS0
	jVNZiYDHKIkTUmu4wgQGgkPlA+QoWnlgeGbBvrZ07lIaAxRebQMSoka9n5uFI2IEctny
	ZY7G8lBlNseE8u2Vkb19TfCXUxxPm5K+OSdaZ7Zn4QbPW4F3eYrCQCx1oxPxeOHu461p
	/mxwc9PLag7+KKKQSDOYo8/cr7MJadcfKT+vi9vWQJ1fOheOz6MxXHeM2Wt2gwoaTKJf
	yysl8tUsgDW/xSjAxnVrQonAaRGhzgwyEJRIQRhwnxqIJX9tPJ7MdYmwK2OHphAuXtRx
	+YUQ==
X-Gm-Message-State: APjAAAWWbCOpZaWM40jdVaVV4WyjNLYBpbFNeNPYZNKnbIObqgngyoCV
	DfqNRLJjeDxBMk5lSqQdLR3j2Pg9pLh2zXHV0w5iW0yO
X-Google-Smtp-Source: APXvYqxgC+Y9yMWBnjWOK2RwczyDfnx0CnXtJ6GQ8QSW+fWS99pt/30F/bARfXWvnAuUKdgmh+gF51yrEkOkXzfmfPQ=
X-Received: by 2002:a17:906:90c3:: with SMTP id
	v3mr5432368ejw.30.1579625961268; 
	Tue, 21 Jan 2020 08:59:21 -0800 (PST)
MIME-Version: 1.0
References: <20200121164733.13892-1-sno@netbsd.org>
In-Reply-To: <20200121164733.13892-1-sno@netbsd.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 21 Jan 2020 17:59:08 +0100
Message-ID: <CA+chaQeZg=ENRH4AbF1h5hkW=YBxaX-d_MHTLnYY4oGo2PJ7hw@mail.gmail.com>
To: Jens Rehsack <sno@netbsd.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] make: 4.2.1 -> 4.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Jan 2020 16:59:21 -0000
Content-Type: multipart/alternative; boundary="0000000000004cabc8059ca954de"

--0000000000004cabc8059ca954de
Content-Type: text/plain; charset="UTF-8"

There are also some backwards incompatible changes introduced in this
release.

Link to whole announcement:
https://lists.gnu.org/archive/html/bug-make/2020-01/msg00057.html

On Tue, Jan 21, 2020 at 5:47 PM Jens Rehsack <sno@netbsd.org> wrote:

> 1) Remove upstream provided patches
> 0001-glob-Do-not-assume-glibc-glob-internals.patch
>    and 0002-glob-Do-not-assume-glibc-glob-internals.patch.
>
> 2) License has been changed to GPLv3 only
>
> 3) Important bug-fix is
>    * https://lists.gnu.org/archive/html/bug-make/2018-09/msg00006.html
>
> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> ---
>  meta/recipes-devtools/make/make.inc           |  4 +-
>  ...b-Do-not-assume-glibc-glob-internals.patch | 70 -------------------
>  ...b-Do-not-assume-glibc-glob-internals.patch | 38 ----------
>  meta/recipes-devtools/make/make_4.2.1.bb      | 12 ----
>  meta/recipes-devtools/make/make_4.3.bb        | 10 +++
>  5 files changed, 11 insertions(+), 123 deletions(-)
>  delete mode 100644
> meta/recipes-devtools/make/make/0001-glob-Do-not-assume-glibc-glob-internals.patch
>  delete mode 100644
> meta/recipes-devtools/make/make/0002-glob-Do-not-assume-glibc-glob-internals.patch
>  delete mode 100644 meta/recipes-devtools/make/make_4.2.1.bb
>  create mode 100644 meta/recipes-devtools/make/make_4.3.bb
>
> diff --git a/meta/recipes-devtools/make/make.inc
> b/meta/recipes-devtools/make/make.inc
> index b8905bc6d3..4142cf23d3 100644
> --- a/meta/recipes-devtools/make/make.inc
> +++ b/meta/recipes-devtools/make/make.inc
> @@ -5,9 +5,7 @@ called the makefile, which lists each of the non-source
> files and how to compute
>  HOMEPAGE = "http://www.gnu.org/software/make/"
>  SECTION = "devel"
>
> -SRC_URI = "${GNU_MIRROR}/make/make-${PV}.tar.bz2 \
> -           file://0001-glob-Do-not-assume-glibc-glob-internals.patch \
> -           file://0002-glob-Do-not-assume-glibc-glob-internals.patch \
> +SRC_URI = "${GNU_MIRROR}/make/make-${PV}.tar.lz \
>             "
>
>  inherit autotools gettext pkgconfig texinfo
> diff --git
> a/meta/recipes-devtools/make/make/0001-glob-Do-not-assume-glibc-glob-internals.patch
> b/meta/recipes-devtools/make/make/0001-glob-Do-not-assume-glibc-glob-internals.patch
> deleted file mode 100644
> index 2b6e4d40c3..0000000000
> ---
> a/meta/recipes-devtools/make/make/0001-glob-Do-not-assume-glibc-glob-internals.patch
> +++ /dev/null
> @@ -1,70 +0,0 @@
> -From c90a7dda6c572f79b8e78da44b6ebf8704edef65 Mon Sep 17 00:00:00 2001
> -From: Paul Eggert <eggert@cs.ucla.edu>
> -Date: Sun, 24 Sep 2017 09:12:58 -0400
> -Subject: [PATCH 1/2] glob: Do not assume glibc glob internals.
> -
> -It has been proposed that glibc glob start using gl_lstat,
> -which the API allows it to do.  GNU 'make' should not get in
> -the way of this.  See:
> -https://sourceware.org/ml/libc-alpha/2017-09/msg00409.html
> -
> -* dir.c (local_lstat): New function, like local_stat.
> -(dir_setup_glob): Use it to initialize gl_lstat too, as the API
> -requires.
> ----
> -Upstream-Status: Backport
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> - dir.c | 29 +++++++++++++++++++++++++++--
> - 1 file changed, 27 insertions(+), 2 deletions(-)
> -
> -diff --git a/dir.c b/dir.c
> -index f34bbf5..12eef30 100644
> ---- a/dir.c
> -+++ b/dir.c
> -@@ -1299,15 +1299,40 @@ local_stat (const char *path, struct stat *buf)
> - }
> - #endif
> -
> -+/* Similarly for lstat.  */
> -+#if !defined(lstat) && !defined(WINDOWS32) || defined(VMS)
> -+# ifndef VMS
> -+#  ifndef HAVE_SYS_STAT_H
> -+int lstat (const char *path, struct stat *sbuf);
> -+#  endif
> -+# else
> -+    /* We are done with the fake lstat.  Go back to the real lstat */
> -+#   ifdef lstat
> -+#     undef lstat
> -+#   endif
> -+# endif
> -+# define local_lstat lstat
> -+#elif defined(WINDOWS32)
> -+/* Windows doesn't support lstat().  */
> -+# define local_lstat local_stat
> -+#else
> -+static int
> -+local_lstat (const char *path, struct stat *buf)
> -+{
> -+  int e;
> -+  EINTRLOOP (e, lstat (path, buf));
> -+  return e;
> -+}
> -+#endif
> -+
> - void
> - dir_setup_glob (glob_t *gl)
> - {
> -   gl->gl_opendir = open_dirstream;
> -   gl->gl_readdir = read_dirstream;
> -   gl->gl_closedir = free;
> -+  gl->gl_lstat = local_lstat;
> -   gl->gl_stat = local_stat;
> --  /* We don't bother setting gl_lstat, since glob never calls it.
> --     The slot is only there for compatibility with 4.4 BSD.  */
> - }
> -
> - void
> ---
> -2.16.1
> -
> diff --git
> a/meta/recipes-devtools/make/make/0002-glob-Do-not-assume-glibc-glob-internals.patch
> b/meta/recipes-devtools/make/make/0002-glob-Do-not-assume-glibc-glob-internals.patch
> deleted file mode 100644
> index d49acd9f6e..0000000000
> ---
> a/meta/recipes-devtools/make/make/0002-glob-Do-not-assume-glibc-glob-internals.patch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -From 9858702dbd1e137262c06765919937660879f63c Mon Sep 17 00:00:00 2001
> -From: Paul Eggert <eggert@cs.ucla.edu>
> -Date: Sun, 24 Sep 2017 09:12:58 -0400
> -Subject: [PATCH 2/2] glob: Do not assume glibc glob internals.
> -
> -It has been proposed that glibc glob start using gl_lstat,
> -which the API allows it to do.  GNU 'make' should not get in
> -the way of this.  See:
> -https://sourceware.org/ml/libc-alpha/2017-09/msg00409.html
> -
> -* dir.c (local_lstat): New function, like local_stat.
> -(dir_setup_glob): Use it to initialize gl_lstat too, as the API
> -requires.
> ----
> -Upstream-Status: Backport
> -
> - configure.ac | 3 +--
> - 1 file changed, 1 insertion(+), 2 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 64ec870..e87901c 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -399,10 +399,9 @@ AC_CACHE_CHECK([if system libc has GNU glob],
> [make_cv_sys_gnu_glob],
> - #include <glob.h>
> - #include <fnmatch.h>
> -
> --#define GLOB_INTERFACE_VERSION 1
> - #if !defined _LIBC && defined __GNU_LIBRARY__ && __GNU_LIBRARY__ > 1
> - # include <gnu-versions.h>
> --# if _GNU_GLOB_INTERFACE_VERSION == GLOB_INTERFACE_VERSION
> -+if _GNU_GLOB_INTERFACE_VERSION == 1 || _GNU_GLOB_INTERFACE_VERSION == 2
> -    gnu glob
> - # endif
> - #endif],
> ---
> -2.16.1
> -
> diff --git a/meta/recipes-devtools/make/make_4.2.1.bb
> b/meta/recipes-devtools/make/make_4.2.1.bb
> deleted file mode 100644
> index c6e6a0cd58..0000000000
> --- a/meta/recipes-devtools/make/make_4.2.1.bb
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -LICENSE = "GPLv3 & LGPLv2"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
> -
> file://tests/COPYING;md5=d32239bcb673463ab874e80d47fae504 \
> -
> file://glob/COPYING.LIB;md5=4a770b67e6be0f60da244beb2de0fce4"
> -require make.inc
> -
> -EXTRA_OECONF += "--without-guile"
> -
> -SRC_URI[md5sum] = "15b012617e7c44c0ed482721629577ac"
> -SRC_URI[sha256sum] =
> "d6e262bf3601b42d2b1e4ef8310029e1dcf20083c5446b4b7aa67081fdffc589"
> -
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta/recipes-devtools/make/make_4.3.bb
> b/meta/recipes-devtools/make/make_4.3.bb
> new file mode 100644
> index 0000000000..a3eb9d92f2
> --- /dev/null
> +++ b/meta/recipes-devtools/make/make_4.3.bb
> @@ -0,0 +1,10 @@
> +LICENSE = "GPLv3"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> +require make.inc
> +
> +EXTRA_OECONF += "--without-guile"
> +
> +SRC_URI[md5sum] = "d5c40e7bd1e97a7404f5d3be982f479a"
> +SRC_URI[sha256sum] =
> "de1a441c4edf952521db30bfca80baae86a0ff1acd0a00402999344f04c45e82"
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000004cabc8059ca954de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">There are also some backwards incompatible changes introdu=
ced in this release.<div><br></div><div>Link to whole announcement:<a href=
=3D"https://lists.gnu.org/archive/html/bug-make/2020-01/msg00057.html">http=
s://lists.gnu.org/archive/html/bug-make/2020-01/msg00057.html</a></div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On T=
ue, Jan 21, 2020 at 5:47 PM Jens Rehsack &lt;<a href=3D"mailto:sno@netbsd.o=
rg">sno@netbsd.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">1) Remove upstream provided patches 0001-glob-Do-not-assu=
me-glibc-glob-internals.patch<br>
=C2=A0 =C2=A0and 0002-glob-Do-not-assume-glibc-glob-internals.patch.<br>
<br>
2) License has been changed to GPLv3 only<br>
<br>
3) Important bug-fix is<br>
=C2=A0 =C2=A0* <a href=3D"https://lists.gnu.org/archive/html/bug-make/2018-=
09/msg00006.html" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.or=
g/archive/html/bug-make/2018-09/msg00006.html</a><br>
<br>
Signed-off-by: Jens Rehsack &lt;<a href=3D"mailto:sno@netbsd.org" target=3D=
"_blank">sno@netbsd.org</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/make/make.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 4 +-<br>
=C2=A0...b-Do-not-assume-glibc-glob-internals.patch | 70 ------------------=
-<br>
=C2=A0...b-Do-not-assume-glibc-glob-internals.patch | 38 ----------<br>
=C2=A0meta/recipes-devtools/make/<a href=3D"http://make_4.2.1.bb" rel=3D"no=
referrer" target=3D"_blank">make_4.2.1.bb</a>=C2=A0 =C2=A0 =C2=A0 | 12 ----=
<br>
=C2=A0meta/recipes-devtools/make/<a href=3D"http://make_4.3.bb" rel=3D"nore=
ferrer" target=3D"_blank">make_4.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 10 +=
++<br>
=C2=A05 files changed, 11 insertions(+), 123 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-devtools/make/make/0001-glob-Do-not-a=
ssume-glibc-glob-internals.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/make/make/0002-glob-Do-not-a=
ssume-glibc-glob-internals.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/make/<a href=3D"http://make_=
4.2.1.bb" rel=3D"noreferrer" target=3D"_blank">make_4.2.1.bb</a><br>
=C2=A0create mode 100644 meta/recipes-devtools/make/<a href=3D"http://make_=
4.3.bb" rel=3D"noreferrer" target=3D"_blank">make_4.3.bb</a><br>
<br>
diff --git a/meta/recipes-devtools/make/make.inc b/meta/recipes-devtools/ma=
ke/make.inc<br>
index b8905bc6d3..4142cf23d3 100644<br>
--- a/meta/recipes-devtools/make/make.inc<br>
+++ b/meta/recipes-devtools/make/make.inc<br>
@@ -5,9 +5,7 @@ called the makefile, which lists each of the non-source fil=
es and how to compute<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"http://www.gnu.org/software/make/" rel=
=3D"noreferrer" target=3D"_blank">http://www.gnu.org/software/make/</a>&quo=
t;<br>
=C2=A0SECTION =3D &quot;devel&quot;<br>
<br>
-SRC_URI =3D &quot;${GNU_MIRROR}/make/make-${PV}.tar.bz2 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-glob-Do-not-assume-gl=
ibc-glob-internals.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-glob-Do-not-assume-gl=
ibc-glob-internals.patch \<br>
+SRC_URI =3D &quot;${GNU_MIRROR}/make/make-${PV}.tar.lz \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0inherit autotools gettext pkgconfig texinfo<br>
diff --git a/meta/recipes-devtools/make/make/0001-glob-Do-not-assume-glibc-=
glob-internals.patch b/meta/recipes-devtools/make/make/0001-glob-Do-not-ass=
ume-glibc-glob-internals.patch<br>
deleted file mode 100644<br>
index 2b6e4d40c3..0000000000<br>
--- a/meta/recipes-devtools/make/make/0001-glob-Do-not-assume-glibc-glob-in=
ternals.patch<br>
+++ /dev/null<br>
@@ -1,70 +0,0 @@<br>
-From c90a7dda6c572f79b8e78da44b6ebf8704edef65 Mon Sep 17 00:00:00 2001<br>
-From: Paul Eggert &lt;<a href=3D"mailto:eggert@cs.ucla.edu" target=3D"_bla=
nk">eggert@cs.ucla.edu</a>&gt;<br>
-Date: Sun, 24 Sep 2017 09:12:58 -0400<br>
-Subject: [PATCH 1/2] glob: Do not assume glibc glob internals.<br>
-<br>
-It has been proposed that glibc glob start using gl_lstat,<br>
-which the API allows it to do.=C2=A0 GNU &#39;make&#39; should not get in<=
br>
-the way of this.=C2=A0 See:<br>
-<a href=3D"https://sourceware.org/ml/libc-alpha/2017-09/msg00409.html" rel=
=3D"noreferrer" target=3D"_blank">https://sourceware.org/ml/libc-alpha/2017=
-09/msg00409.html</a><br>
-<br>
-* dir.c (local_lstat): New function, like local_stat.<br>
-(dir_setup_glob): Use it to initialize gl_lstat too, as the API<br>
-requires.<br>
----<br>
-Upstream-Status: Backport<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
-<br>
- dir.c | 29 +++++++++++++++++++++++++++--<br>
- 1 file changed, 27 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/dir.c b/dir.c<br>
-index f34bbf5..12eef30 100644<br>
---- a/dir.c<br>
-+++ b/dir.c<br>
-@@ -1299,15 +1299,40 @@ local_stat (const char *path, struct stat *buf)<br=
>
- }<br>
- #endif<br>
- <br>
-+/* Similarly for lstat.=C2=A0 */<br>
-+#if !defined(lstat) &amp;&amp; !defined(WINDOWS32) || defined(VMS)<br>
-+# ifndef VMS<br>
-+#=C2=A0 ifndef HAVE_SYS_STAT_H<br>
-+int lstat (const char *path, struct stat *sbuf);<br>
-+#=C2=A0 endif<br>
-+# else<br>
-+=C2=A0 =C2=A0 /* We are done with the fake lstat.=C2=A0 Go back to the re=
al lstat */<br>
-+#=C2=A0 =C2=A0ifdef lstat<br>
-+#=C2=A0 =C2=A0 =C2=A0undef lstat<br>
-+#=C2=A0 =C2=A0endif<br>
-+# endif<br>
-+# define local_lstat lstat<br>
-+#elif defined(WINDOWS32)<br>
-+/* Windows doesn&#39;t support lstat().=C2=A0 */<br>
-+# define local_lstat local_stat<br>
-+#else<br>
-+static int<br>
-+local_lstat (const char *path, struct stat *buf)<br>
-+{<br>
-+=C2=A0 int e;<br>
-+=C2=A0 EINTRLOOP (e, lstat (path, buf));<br>
-+=C2=A0 return e;<br>
-+}<br>
-+#endif<br>
-+<br>
- void<br>
- dir_setup_glob (glob_t *gl)<br>
- {<br>
-=C2=A0 =C2=A0gl-&gt;gl_opendir =3D open_dirstream;<br>
-=C2=A0 =C2=A0gl-&gt;gl_readdir =3D read_dirstream;<br>
-=C2=A0 =C2=A0gl-&gt;gl_closedir =3D free;<br>
-+=C2=A0 gl-&gt;gl_lstat =3D local_lstat;<br>
-=C2=A0 =C2=A0gl-&gt;gl_stat =3D local_stat;<br>
--=C2=A0 /* We don&#39;t bother setting gl_lstat, since glob never calls it=
.<br>
--=C2=A0 =C2=A0 =C2=A0The slot is only there for compatibility with 4.4 BSD=
.=C2=A0 */<br>
- }<br>
- <br>
- void<br>
--- <br>
-2.16.1<br>
-<br>
diff --git a/meta/recipes-devtools/make/make/0002-glob-Do-not-assume-glibc-=
glob-internals.patch b/meta/recipes-devtools/make/make/0002-glob-Do-not-ass=
ume-glibc-glob-internals.patch<br>
deleted file mode 100644<br>
index d49acd9f6e..0000000000<br>
--- a/meta/recipes-devtools/make/make/0002-glob-Do-not-assume-glibc-glob-in=
ternals.patch<br>
+++ /dev/null<br>
@@ -1,38 +0,0 @@<br>
-From 9858702dbd1e137262c06765919937660879f63c Mon Sep 17 00:00:00 2001<br>
-From: Paul Eggert &lt;<a href=3D"mailto:eggert@cs.ucla.edu" target=3D"_bla=
nk">eggert@cs.ucla.edu</a>&gt;<br>
-Date: Sun, 24 Sep 2017 09:12:58 -0400<br>
-Subject: [PATCH 2/2] glob: Do not assume glibc glob internals.<br>
-<br>
-It has been proposed that glibc glob start using gl_lstat,<br>
-which the API allows it to do.=C2=A0 GNU &#39;make&#39; should not get in<=
br>
-the way of this.=C2=A0 See:<br>
-<a href=3D"https://sourceware.org/ml/libc-alpha/2017-09/msg00409.html" rel=
=3D"noreferrer" target=3D"_blank">https://sourceware.org/ml/libc-alpha/2017=
-09/msg00409.html</a><br>
-<br>
-* dir.c (local_lstat): New function, like local_stat.<br>
-(dir_setup_glob): Use it to initialize gl_lstat too, as the API<br>
-requires.<br>
----<br>
-Upstream-Status: Backport<br>
-<br>
- <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a> | 3 +--<br>
- 1 file changed, 1 insertion(+), 2 deletions(-)<br>
-<br>
-diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
-index 64ec870..e87901c 100644<br>
---- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-@@ -399,10 +399,9 @@ AC_CACHE_CHECK([if system libc has GNU glob], [make_c=
v_sys_gnu_glob],<br>
- #include &lt;glob.h&gt;<br>
- #include &lt;fnmatch.h&gt;<br>
- <br>
--#define GLOB_INTERFACE_VERSION 1<br>
- #if !defined _LIBC &amp;&amp; defined __GNU_LIBRARY__ &amp;&amp; __GNU_LI=
BRARY__ &gt; 1<br>
- # include &lt;gnu-versions.h&gt;<br>
--# if _GNU_GLOB_INTERFACE_VERSION =3D=3D GLOB_INTERFACE_VERSION<br>
-+if _GNU_GLOB_INTERFACE_VERSION =3D=3D 1 || _GNU_GLOB_INTERFACE_VERSION =
=3D=3D 2<br>
-=C2=A0 =C2=A0 gnu glob<br>
- # endif<br>
- #endif],<br>
--- <br>
-2.16.1<br>
-<br>
diff --git a/meta/recipes-devtools/make/<a href=3D"http://make_4.2.1.bb" re=
l=3D"noreferrer" target=3D"_blank">make_4.2.1.bb</a> b/meta/recipes-devtool=
s/make/<a href=3D"http://make_4.2.1.bb" rel=3D"noreferrer" target=3D"_blank=
">make_4.2.1.bb</a><br>
deleted file mode 100644<br>
index c6e6a0cd58..0000000000<br>
--- a/meta/recipes-devtools/make/<a href=3D"http://make_4.2.1.bb" rel=3D"no=
referrer" target=3D"_blank">make_4.2.1.bb</a><br>
+++ /dev/null<br>
@@ -1,12 +0,0 @@<br>
-LICENSE =3D &quot;GPLv3 &amp; LGPLv2&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dd32239bcb673463ab874e80d47=
fae504 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://tests/COPYING;md5=3Dd32239bcb673463ab874e80d47fae504 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://glob/COPYING.LIB;md5=3D4a770b67e6be0f60da244beb2de0fce4&quot;<br>
-require make.inc<br>
-<br>
-EXTRA_OECONF +=3D &quot;--without-guile&quot;<br>
-<br>
-SRC_URI[md5sum] =3D &quot;15b012617e7c44c0ed482721629577ac&quot;<br>
-SRC_URI[sha256sum] =3D &quot;d6e262bf3601b42d2b1e4ef8310029e1dcf20083c5446=
b4b7aa67081fdffc589&quot;<br>
-<br>
-BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
diff --git a/meta/recipes-devtools/make/<a href=3D"http://make_4.3.bb" rel=
=3D"noreferrer" target=3D"_blank">make_4.3.bb</a> b/meta/recipes-devtools/m=
ake/<a href=3D"http://make_4.3.bb" rel=3D"noreferrer" target=3D"_blank">mak=
e_4.3.bb</a><br>
new file mode 100644<br>
index 0000000000..a3eb9d92f2<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/make/<a href=3D"http://make_4.3.bb" rel=3D"nore=
ferrer" target=3D"_blank">make_4.3.bb</a><br>
@@ -0,0 +1,10 @@<br>
+LICENSE =3D &quot;GPLv3&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dd32239bcb673463ab874e80d47=
fae504&quot;<br>
+require make.inc<br>
+<br>
+EXTRA_OECONF +=3D &quot;--without-guile&quot;<br>
+<br>
+SRC_URI[md5sum] =3D &quot;d5c40e7bd1e97a7404f5d3be982f479a&quot;<br>
+SRC_URI[sha256sum] =3D &quot;de1a441c4edf952521db30bfca80baae86a0ff1acd0a0=
0402999344f04c45e82&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-- <br>
2.17.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--0000000000004cabc8059ca954de--
