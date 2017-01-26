Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 04BFC71ADD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 22:39:15 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id r144so53824977wme.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 14:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ACs3Snn3fWQajoWah9H6zfTxXsHQa0Ozp7OyRl43gws=;
	b=dAMOQyxHuHL1rHIzQsnRlSLUr8P+ydog4ewXavC487FCItq+R5y3kjBnMA/h2xo3na
	RmbZWguMAgIHDRDCQE8BB0r3Q0PZEebCJKlEd6QTiIYB3O/yT82YUi9q0+yh7vipMlUC
	J3tTtD6FjK9Qx6jf/PxPFX2RKPjhRCjdiCcjEbzaoormOE15LGvCs/h5s5a0YRPqXcjH
	TUrODunJuZfPaV0iUM4FpzIejmE8Q6w9QjA493LrbhHefg8Mia8hSTr5gK8PZmXJGrT2
	VIgNn/mlncINJMdZshm4yhwXu9mrQ+VuRu3UIHnxkRMS3up3W60mA0NloTorMAr0Go3l
	vVLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ACs3Snn3fWQajoWah9H6zfTxXsHQa0Ozp7OyRl43gws=;
	b=XlkmY+cdS7F6aZaysEesUFAWb6yJs7Nkfy0vI0mkEFexch0y5dZuBZ9hy/feDYmTUc
	sFWgyfbNLlyzQgF2r2UhFSI051fz3wecYnQtzvRxvV44sK88rU77IW9FXncAG0u0C9vP
	5JNfaOR8bgRN8cujpBcVDIyg3+DzlVWnxaQeHYmZPdfiIAXQm1Mr0CNQzhNxBFt2GNYI
	xu0FBOD/OdxzbD8oxfcpNst7nmEDMgZNnTPgllC1W9Svv9zTnrGEZ2lTBJ2+HgufssDn
	JNdB7S2gV24ymOSVd2q1muQCjAiZHT1zdukR019T1jl6X8gEPefZliA2Ys70kZxa65Cw
	oF8Q==
X-Gm-Message-State: AIkVDXJKTbi1Qjq5+uajUx54hjhlwMS5oomYhotLsfIwRazpCed5ogDkRQuCnoV+adIqisTfC7+VtyAFb+TuCQ==
X-Received: by 10.223.150.34 with SMTP id b31mr4840002wra.196.1485470355716;
	Thu, 26 Jan 2017 14:39:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.148.174 with HTTP; Thu, 26 Jan 2017 14:39:15 -0800 (PST)
In-Reply-To: <46d94601d67973b17516241cea3b6afce9a2914d.1482739038.git.Qi.Chen@windriver.com>
References: <cover.1482739038.git.Qi.Chen@windriver.com>
	<46d94601d67973b17516241cea3b6afce9a2914d.1482739038.git.Qi.Chen@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 26 Jan 2017 23:39:15 +0100
Message-ID: <CA+chaQd519TOCHMNPzFnnWgZFi6=aWNC231-8=ihqf_Mfr-9Hw@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/7] flex: upgrade to 2.6.2
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
X-List-Received-Date: Thu, 26 Jan 2017 22:39:16 -0000
Content-Type: multipart/alternative; boundary=001a11477bfee080570547070406

--001a11477bfee080570547070406
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This is breaking number of recipes as discussed in acpica thread:
http://lists.openembedded.org/pipermail/openembedded-core/2017-January/1315=
55.html

in by builds I also see failures in qtwebkit, upstart, libpbnjson, ...

I've tried to upgrade to 2.6.3 as suggested in:
https://github.com/westes/flex/issues/164

but that brings different set of undefined yy* symbols (e.g. yywrap in
yylex function when building binutils-crosssdk and in the end it doesn't
help at all, because even binutils, binutils-cross, dtc-native fail much
sooner.

Is someone working on flex upgrade or can we revert this 2.6.2 upgrade
until these issues are resolved?

On Mon, Dec 26, 2016 at 9:10 AM, Chen Qi <Qi.Chen@windriver.com> wrote:

> Upgrade flex to 2.6.2.
>
> The following two patches are removed as they have been merged.
>   0002-avoid-c-comments-in-c-code-fails-with-gcc-6.patch
>   CVE-2016-6354.patch
>
> do_not_create_pdf_doc.patch is removed as it's not suitable for the new
> version.
>
> 0001-use-stage1flex-from-flex-native-to-fix-cross-compili.patch is added
> to fix cross compiling problem.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  ...lex-from-flex-native-to-fix-cross-compili.patch | 51 ++++++++++++++++=
+
>  ...oid-c-comments-in-c-code-fails-with-gcc-6.patch | 64
> ----------------------
>  .../recipes-devtools/flex/flex/CVE-2016-6354.patch | 59
> --------------------
>  .../flex/flex/do_not_create_pdf_doc.patch          | 17 ------
>  .../flex/{flex_2.6.0.bb =3D> flex_2.6.2.bb}          | 16 +++---
>  5 files changed, 60 insertions(+), 147 deletions(-)
>  create mode 100644 meta/recipes-devtools/flex/
> flex/0001-use-stage1flex-from-flex-native-to-fix-cross-compili.patch
>  delete mode 100644 meta/recipes-devtools/flex/
> flex/0002-avoid-c-comments-in-c-code-fails-with-gcc-6.patch
>  delete mode 100644 meta/recipes-devtools/flex/flex/CVE-2016-6354.patch
>  delete mode 100644 meta/recipes-devtools/flex/flex/do_not_create_pdf_doc=
.
> patch
>  rename meta/recipes-devtools/flex/{flex_2.6.0.bb =3D> flex_2.6.2.bb} (79=
%)
>
> diff --git a/meta/recipes-devtools/flex/flex/0001-use-stage1flex-from-
> flex-native-to-fix-cross-compili.patch b/meta/recipes-devtools/flex/
> flex/0001-use-stage1flex-from-flex-native-to-fix-cross-compili.patch
> new file mode 100644
> index 0000000..08f7688
> --- /dev/null
> +++ b/meta/recipes-devtools/flex/flex/0001-use-stage1flex-from-
> flex-native-to-fix-cross-compili.patch
> @@ -0,0 +1,51 @@
> +Subject: use stage1flex from flex-native to fix cross compiling
> +
> +When cross compiling, we would have failure because stage1flex cannot ru=
n
> on host.
> +Use stage1flex from flex-native to fix this problem.
> +
> +This patch is OE specific as upstream may have other way to fix this
> cross compilation
> +problem.
> +
> +Upstream-Status: Inappropriate [OE specific]
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + src/Makefile.am | 11 ++---------
> + 1 file changed, 2 insertions(+), 9 deletions(-)
> +
> +diff --git a/src/Makefile.am b/src/Makefile.am
> +index 77ddf4b..09ffddb 100644
> +--- a/src/Makefile.am
> ++++ b/src/Makefile.am
> +@@ -6,17 +6,10 @@ LIBS =3D @LIBS@
> + m4 =3D @M4@
> +
> + bin_PROGRAMS =3D flex
> +-noinst_PROGRAMS =3D stage1flex
> + lib_LTLIBRARIES =3D \
> +       libfl.la \
> +       libfl_pic.la
> +
> +-stage1flex_SOURCES =3D \
> +-      scan.l \
> +-      $(COMMON_SOURCES)
> +-
> +-stage1flex_CFLAGS =3D $(AM_CFLAGS)
> +-
> + flex_SOURCES =3D \
> +       $(COMMON_SOURCES)
> +
> +@@ -89,8 +82,8 @@ skel.c: flex.skl mkskel.sh flexint.h tables_shared.h
> tables_shared.c
> +         $(SHELL) $(srcdir)/mkskel.sh > $@.tmp
> +       mv $@.tmp $@
> +
> +-stage1scan.c: scan.l stage1flex$(EXEEXT)
> +-      ./stage1flex$(EXEEXT) -o $@ $<
> ++stage1scan.c: scan.l
> ++      stage1flex$(EXEEXT) -o $@ $<
> +
> + # make needs to be told to make parse.h so that parallelized runs will
> + # not fail.
> +--
> +2.1.0
> +
> diff --git a/meta/recipes-devtools/flex/flex/0002-avoid-c-comments-in-c-c=
ode-fails-with-gcc-6.patch
> b/meta/recipes-devtools/flex/flex/0002-avoid-c-comments-in-
> c-code-fails-with-gcc-6.patch
> deleted file mode 100644
> index 438ca5f..0000000
> --- a/meta/recipes-devtools/flex/flex/0002-avoid-c-comments-in-
> c-code-fails-with-gcc-6.patch
> +++ /dev/null
> @@ -1,64 +0,0 @@
> -From 7072befe1397af4eb01c3ff7edf99f0cd5076089 Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
> -Date: Tue, 30 Aug 2016 14:25:32 +0200
> -Subject: [PATCH] avoid c++ comments in c-code - fails with gcc-6
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -fixes:
> -
> -| error: C++ style comments are not allowed in ISO C90
> -| num_to_alloc =3D 1; // After all that talk, this was set to 1 anyways.=
..
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ----
> - src/flex.skl | 2 +-
> - src/scan.c   | 2 +-
> - src/skel.c   | 2 +-
> - 3 files changed, 3 insertions(+), 3 deletions(-)
> -
> -diff --git a/src/flex.skl b/src/flex.skl
> -index 73a0b9e..ed71627 100644
> ---- a/src/flex.skl
> -+++ b/src/flex.skl
> -@@ -2350,7 +2350,7 @@ void yyFlexLexer::yyensure_buffer_stack(void)
> -                * scanner will even need a stack. We use 2 instead of 1
> to avoid an
> -                * immediate realloc on the next call.
> -          */
> --              num_to_alloc =3D 1; // After all that talk, this was set =
to
> 1 anyways...
> -+              num_to_alloc =3D 1; /* After all that talk, this was set =
to
> 1 anyways... */
> -               YY_G(yy_buffer_stack) =3D (struct yy_buffer_state**)yyall=
oc
> -
>  (num_to_alloc * sizeof(struct yy_buffer_state*)
> -
>  M4_YY_CALL_LAST_ARG);
> -diff --git a/src/scan.c b/src/scan.c
> -index b55df2d..f1dce75 100644
> ---- a/src/scan.c
> -+++ b/src/scan.c
> -@@ -4672,7 +4672,7 @@ static void yyensure_buffer_stack (void)
> -                * scanner will even need a stack. We use 2 instead of 1
> to avoid an
> -                * immediate realloc on the next call.
> -          */
> --              num_to_alloc =3D 1; // After all that talk, this was set =
to
> 1 anyways...
> -+              num_to_alloc =3D 1; /* After all that talk, this was set =
to
> 1 anyways...*/
> -               (yy_buffer_stack) =3D (struct yy_buffer_state**)yyalloc
> -
>  (num_to_alloc * sizeof(struct yy_buffer_state*)
> -                                                               );
> -diff --git a/src/skel.c b/src/skel.c
> -index ef657d3..26cc889 100644
> ---- a/src/skel.c
> -+++ b/src/skel.c
> -@@ -2561,7 +2561,7 @@ const char *skel[] =3D {
> -   "            * scanner will even need a stack. We use 2 instead of 1
> to avoid an",
> -   "            * immediate realloc on the next call.",
> -   "         */",
> --  "           num_to_alloc =3D 1; // After all that talk, this was set =
to
> 1 anyways...",
> -+  "           num_to_alloc =3D 1; /* After all that talk, this was set =
to
> 1 anyways... */",
> -   "           YY_G(yy_buffer_stack) =3D (struct yy_buffer_state**)yyall=
oc",
> -   "
>  (num_to_alloc * sizeof(struct yy_buffer_state*)",
> -   "
>  M4_YY_CALL_LAST_ARG);",
> ---
> -2.5.5
> -
> diff --git a/meta/recipes-devtools/flex/flex/CVE-2016-6354.patch
> b/meta/recipes-devtools/flex/flex/CVE-2016-6354.patch
> deleted file mode 100644
> index 216ac7a..0000000
> --- a/meta/recipes-devtools/flex/flex/CVE-2016-6354.patch
> +++ /dev/null
> @@ -1,59 +0,0 @@
> -From 3939eccdff598f47e5b37b05d58bf1b44d3796e7 Mon Sep 17 00:00:00 2001
> -From: Jussi Kukkonen <jussi.kukkonen@intel.com>
> -Date: Fri, 7 Oct 2016 14:15:38 +0300
> -Subject: [PATCH] Prevent buffer overflow in yy_get_next_buffer
> -
> -This is upstream commit a5cbe929ac3255d371e698f62dc256afe7006466
> -with some additional backporting to make binutils build again.
> -
> -Upstream-Status: Backport
> -CVE: CVE-2016-6354
> -Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ----
> - src/flex.skl | 2 +-
> - src/scan.c   | 2 +-
> - src/skel.c   | 2 +-
> - 3 files changed, 3 insertions(+), 3 deletions(-)
> -
> -diff --git a/src/flex.skl b/src/flex.skl
> -index ed71627..814d562 100644
> ---- a/src/flex.skl
> -+++ b/src/flex.skl
> -@@ -1718,7 +1718,7 @@ int yyFlexLexer::yy_get_next_buffer()
> -
> -       else
> -               {
> --                      yy_size_t num_to_read =3D
> -+                      int num_to_read =3D
> -                       YY_CURRENT_BUFFER_LVALUE->yy_buf_size -
> number_to_move - 1;
> -
> -               while ( num_to_read <=3D 0 )
> -diff --git a/src/scan.c b/src/scan.c
> -index f1dce75..1949872 100644
> ---- a/src/scan.c
> -+++ b/src/scan.c
> -@@ -4181,7 +4181,7 @@ static int yy_get_next_buffer (void)
> -
> -       else
> -               {
> --                      yy_size_t num_to_read =3D
> -+                      int num_to_read =3D
> -                       YY_CURRENT_BUFFER_LVALUE->yy_buf_size -
> number_to_move - 1;
> -
> -               while ( num_to_read <=3D 0 )
> -diff --git a/src/skel.c b/src/skel.c
> -index 26cc889..0344d18 100644
> ---- a/src/skel.c
> -+++ b/src/skel.c
> -@@ -1929,7 +1929,7 @@ const char *skel[] =3D {
> -   "",
> -   "   else",
> -   "           {",
> --  "                   yy_size_t num_to_read =3D",
> -+  "                   int num_to_read =3D",
> -   "                   YY_CURRENT_BUFFER_LVALUE->yy_buf_size -
> number_to_move - 1;",
> -   "",
> -   "           while ( num_to_read <=3D 0 )",
> ---
> -2.1.4
> -
> diff --git a/meta/recipes-devtools/flex/flex/do_not_create_pdf_doc.patch
> b/meta/recipes-devtools/flex/flex/do_not_create_pdf_doc.patch
> deleted file mode 100644
> index 032833ae..0000000
> --- a/meta/recipes-devtools/flex/flex/do_not_create_pdf_doc.patch
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -Upstream-Status: Inappropriate (embedded specific)
> -
> -Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> -
> -Index: flex-2.5.37/doc/Makefile.am
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- flex-2.5.37.orig/doc/Makefile.am   2012-07-21 04:18:27.000000000
> +0300
> -+++ flex-2.5.37/doc/Makefile.am        2013-07-30 17:57:09.834834531 +03=
00
> -@@ -2,7 +2,7 @@
> -
> - info_TEXINFOS =3D       flex.texi
> - dist_man_MANS =3D flex.1
> --dist_doc_DATA=3D flex.pdf
> -+EXTRA_DIST=3D flex.pdf
> -
> - CLEANFILES =3D \
> -       flex.hks \
> diff --git a/meta/recipes-devtools/flex/flex_2.6.0.bb
> b/meta/recipes-devtools/flex/flex_2.6.2.bb
> similarity index 79%
> rename from meta/recipes-devtools/flex/flex_2.6.0.bb
> rename to meta/recipes-devtools/flex/flex_2.6.2.bb
> index ab35b09..e723124 100644
> --- a/meta/recipes-devtools/flex/flex_2.6.0.bb
> +++ b/meta/recipes-devtools/flex/flex_2.6.2.bb
> @@ -5,22 +5,23 @@ HOMEPAGE =3D "http://sourceforge.net/projects/flex/"
>  SECTION =3D "devel"
>  LICENSE =3D "BSD"
>
> -DEPENDS =3D "${@bb.utils.contains('PTEST_ENABLED', '1', 'bison-native
> flex-native', '', d)}"
> +DEPENDS =3D "flex-native ${@bb.utils.contains('PTEST_ENABLED', '1',
> 'bison-native', '', d)}"
>  BBCLASSEXTEND =3D "native nativesdk"
>
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De4742cf92e89040b39486a6219b68=
067"
>
> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/flex/flex-${PV}.tar.bz2 \
> +SRC_URI =3D "https://github.com/westes/flex/releases/download/v${PV}/
> flex-${PV}.tar.gz \
>             file://run-ptest \
> -           file://do_not_create_pdf_doc.patch \
>             file://0001-tests-add-a-target-for-building-tests-without-run=
nin.patch
> \
> -           file://0002-avoid-c-comments-in-c-code-fails-with-gcc-6.patch
> \
> -           file://CVE-2016-6354.patch \
>             ${@bb.utils.contains('PTEST_ENABLED', '1', '',
> 'file://disable-tests.patch', d)} \
>             "
>
> -SRC_URI[md5sum] =3D "266270f13c48ed043d95648075084d59"
> -SRC_URI[sha256sum] =3D "24e611ef5a4703a191012f80c1027d
> c9d12555183ce0ecd46f3636e587e9b8e9"
> +SRC_URI_append_class-target =3D " \
> +           file://0001-use-stage1flex-from-flex-native-to-fix-cross-comp=
ili.patch
> \
> +           "
> +
> +SRC_URI[md5sum] =3D "cc6d76c333db7653d5caf423a3335239"
> +SRC_URI[sha256sum] =3D "9a01437a1155c799b7dc2508620564
> ef806ba66250c36bf5f9034b1c207cb2c9"
>
>  # Flex has moved to github from 2.6.1 onwards
>  UPSTREAM_CHECK_URI =3D "https://github.com/westes/flex/releases"
> @@ -37,6 +38,7 @@ EXTRA_OEMAKE +=3D "${@bb.utils.contains('PTEST_ENABLED'=
,
> '1', 'FLEX=3D${STAGING_BIND
>
>  do_install_append_class-native() {
>         create_wrapper ${D}/${bindir}/flex M4=3D${M4}
> +       cp ${B}/src/stage1flex ${D}/${bindir}
>  }
>
>  do_install_append_class-nativesdk() {
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11477bfee080570547070406
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This is breaking number of recipes as discussed in acpica =
thread:<div><a href=3D"http://lists.openembedded.org/pipermail/openembedded=
-core/2017-January/131555.html">http://lists.openembedded.org/pipermail/ope=
nembedded-core/2017-January/131555.html</a></div><div><br></div><div>in by =
builds I also see failures in qtwebkit, upstart, libpbnjson, ...<div><br></=
div><div>I&#39;ve tried to upgrade to 2.6.3 as suggested in:</div></div><di=
v><a href=3D"https://github.com/westes/flex/issues/164">https://github.com/=
westes/flex/issues/164</a><br></div><div><br></div><div>but that brings dif=
ferent set of undefined yy* symbols (e.g. yywrap in yylex function when bui=
lding binutils-crosssdk and in the end it doesn&#39;t help at all, because =
even binutils, binutils-cross, dtc-native fail much sooner.</div><div><br><=
/div><div>Is someone working on flex upgrade or can we revert this 2.6.2 up=
grade until these issues are resolved?</div></div><div class=3D"gmail_extra=
"><br><div class=3D"gmail_quote">On Mon, Dec 26, 2016 at 9:10 AM, Chen Qi <=
span dir=3D"ltr">&lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"_bl=
ank">Qi.Chen@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">Upgrade flex to 2.6.2.<br>
<br>
The following two patches are removed as they have been merged.<br>
=C2=A0 0002-avoid-c-comments-in-c-<wbr>code-fails-with-gcc-6.patch<br>
=C2=A0 CVE-2016-6354.patch<br>
<br>
do_not_create_pdf_doc.patch is removed as it&#39;s not suitable for the new=
<br>
version.<br>
<br>
0001-use-stage1flex-from-flex-<wbr>native-to-fix-cross-compili.<wbr>patch i=
s added<br>
to fix cross compiling problem.<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen=
@windriver.com</a>&gt;<br>
---<br>
=C2=A0...lex-from-flex-native-to-<wbr>fix-cross-compili.patch | 51 ++++++++=
+++++++++<br>
=C2=A0...oid-c-comments-in-c-code-<wbr>fails-with-gcc-6.patch | 64 --------=
--------------<br>
=C2=A0.../recipes-devtools/flex/<wbr>flex/CVE-2016-6354.patch | 59 --------=
------------<br>
=C2=A0.../flex/flex/do_not_create_<wbr>pdf_doc.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 17 ------<br>
=C2=A0.../flex/{<a href=3D"http://flex_2.6.0.bb" rel=3D"noreferrer" target=
=3D"_blank">flex_2.6.0.bb</a> =3D&gt; <a href=3D"http://flex_2.6.2.bb" rel=
=3D"noreferrer" target=3D"_blank">flex_2.6.2.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 16 +++---<br>
=C2=A05 files changed, 60 insertions(+), 147 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-devtools/flex/<wbr>flex/0001-use-stag=
e1flex-from-<wbr>flex-native-to-fix-cross-<wbr>compili.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/flex/<wbr>flex/0002-avoid-c-=
comments-in-<wbr>c-code-fails-with-gcc-6.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/flex/<wbr>flex/CVE-2016-6354=
.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/flex/<wbr>flex/do_not_create=
_pdf_doc.<wbr>patch<br>
=C2=A0rename meta/recipes-devtools/flex/{<a href=3D"http://flex_2.6.0.bb" r=
el=3D"noreferrer" target=3D"_blank">fl<wbr>ex_2.6.0.bb</a> =3D&gt; <a href=
=3D"http://flex_2.6.2.bb" rel=3D"noreferrer" target=3D"_blank">flex_2.6.2.b=
b</a>} (79%)<br>
<br>
diff --git a/meta/recipes-devtools/flex/<wbr>flex/0001-use-stage1flex-from-=
<wbr>flex-native-to-fix-cross-<wbr>compili.patch b/meta/recipes-devtools/fl=
ex/<wbr>flex/0001-use-stage1flex-from-<wbr>flex-native-to-fix-cross-<wbr>co=
mpili.patch<br>
new file mode 100644<br>
index 0000000..08f7688<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/flex/<wbr>flex/0001-use-stage1flex-from-<wbr>fl=
ex-native-to-fix-cross-<wbr>compili.patch<br>
@@ -0,0 +1,51 @@<br>
+Subject: use stage1flex from flex-native to fix cross compiling<br>
+<br>
+When cross compiling, we would have failure because stage1flex cannot run =
on host.<br>
+Use stage1flex from flex-native to fix this problem.<br>
+<br>
+This patch is OE specific as upstream may have other way to fix this cross=
 compilation<br>
+problem.<br>
+<br>
+Upstream-Status: Inappropriate [OE specific]<br>
+<br>
+Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Che=
n@windriver.com</a>&gt;<br>
+---<br>
+ src/Makefile.am | 11 ++---------<br>
+ 1 file changed, 2 insertions(+), 9 deletions(-)<br>
+<br>
+diff --git a/src/Makefile.am b/src/Makefile.am<br>
+index 77ddf4b..09ffddb 100644<br>
+--- a/src/Makefile.am<br>
++++ b/src/Makefile.am<br>
+@@ -6,17 +6,10 @@ LIBS =3D @LIBS@<br>
+ m4 =3D @M4@<br>
+<br>
+ bin_PROGRAMS =3D flex<br>
+-noinst_PROGRAMS =3D stage1flex<br>
+ lib_LTLIBRARIES =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://libfl.la" rel=3D"noreferrer" =
target=3D"_blank">libfl.la</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://libfl_pic.la" rel=3D"noreferr=
er" target=3D"_blank">libfl_pic.la</a><br>
+<br>
+-stage1flex_SOURCES =3D \<br>
+-=C2=A0 =C2=A0 =C2=A0 scan.l \<br>
+-=C2=A0 =C2=A0 =C2=A0 $(COMMON_SOURCES)<br>
+-<br>
+-stage1flex_CFLAGS =3D $(AM_CFLAGS)<br>
+-<br>
+ flex_SOURCES =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(COMMON_SOURCES)<br>
+<br>
+@@ -89,8 +82,8 @@ skel.c: flex.skl mkskel.sh flexint.h tables_shared.h tab=
les_shared.c<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(SHELL) $(srcdir)/mkskel.sh &gt; $@.tmp=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mv $@.tmp $@<br>
+<br>
+-stage1scan.c: scan.l stage1flex$(EXEEXT)<br>
+-=C2=A0 =C2=A0 =C2=A0 ./stage1flex$(EXEEXT) -o $@ $&lt;<br>
++stage1scan.c: scan.l<br>
++=C2=A0 =C2=A0 =C2=A0 stage1flex$(EXEEXT) -o $@ $&lt;<br>
+<br>
+ # make needs to be told to make parse.h so that parallelized runs will<br=
>
+ # not fail.<br>
+--<br>
+2.1.0<br>
+<br>
diff --git a/meta/recipes-devtools/flex/<wbr>flex/0002-avoid-c-comments-in-=
<wbr>c-code-fails-with-gcc-6.patch b/meta/recipes-devtools/flex/<wbr>flex/0=
002-avoid-c-comments-in-<wbr>c-code-fails-with-gcc-6.patch<br>
deleted file mode 100644<br>
index 438ca5f..0000000<br>
--- a/meta/recipes-devtools/flex/<wbr>flex/0002-avoid-c-comments-in-<wbr>c-=
code-fails-with-gcc-6.patch<br>
+++ /dev/null<br>
@@ -1,64 +0,0 @@<br>
-From 7072befe1397af4eb01c3ff7edf99f<wbr>0cd5076089 Mon Sep 17 00:00:00 200=
1<br>
-From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3D<wbr>BCller?=3D &lt;<a href=3D"mail=
to:schnitzeltony@googlemail.com">schnitzeltony@googlemail.com</a>&gt;<br>
-Date: Tue, 30 Aug 2016 14:25:32 +0200<br>
-Subject: [PATCH] avoid c++ comments in c-code - fails with gcc-6<br>
-MIME-Version: 1.0<br>
-Content-Type: text/plain; charset=3DUTF-8<br>
-Content-Transfer-Encoding: 8bit<br>
-<br>
-fixes:<br>
-<br>
-| error: C++ style comments are not allowed in ISO C90<br>
-| num_to_alloc =3D 1; // After all that talk, this was set to 1 anyways...=
<br>
-<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzeltony@goo=
glemail.com">schnitzeltony@googlemail.com</a>&gt;<br>
----<br>
- src/flex.skl | 2 +-<br>
- src/scan.c=C2=A0 =C2=A0| 2 +-<br>
- src/skel.c=C2=A0 =C2=A0| 2 +-<br>
- 3 files changed, 3 insertions(+), 3 deletions(-)<br>
-<br>
-diff --git a/src/flex.skl b/src/flex.skl<br>
-index 73a0b9e..ed71627 100644<br>
---- a/src/flex.skl<br>
-+++ b/src/flex.skl<br>
-@@ -2350,7 +2350,7 @@ void yyFlexLexer::yyensure_buffer_<wbr>stack(void)<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * scanner will eve=
n need a stack. We use 2 instead of 1 to avoid an<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * immediate reallo=
c on the next call.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 num_to_alloc =3D 1; // A=
fter all that talk, this was set to 1 anyways...<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 num_to_alloc =3D 1; /* A=
fter all that talk, this was set to 1 anyways... */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0YY_G(yy_buffer_stac=
k) =3D (struct yy_buffer_state**)yyalloc<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(num_to_alloc * sizeof(struct yy_buffer_state*)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0M4_YY_CALL_LAST_ARG);<br>
-diff --git a/src/scan.c b/src/scan.c<br>
-index b55df2d..f1dce75 100644<br>
---- a/src/scan.c<br>
-+++ b/src/scan.c<br>
-@@ -4672,7 +4672,7 @@ static void yyensure_buffer_stack (void)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * scanner will eve=
n need a stack. We use 2 instead of 1 to avoid an<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * immediate reallo=
c on the next call.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 num_to_alloc =3D 1; // A=
fter all that talk, this was set to 1 anyways...<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 num_to_alloc =3D 1; /* A=
fter all that talk, this was set to 1 anyways...*/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(yy_buffer_stack) =
=3D (struct yy_buffer_state**)yyalloc<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(num_to_alloc * sizeof(struct yy_buffer_state*)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0);<br>
-diff --git a/src/skel.c b/src/skel.c<br>
-index ef657d3..26cc889 100644<br>
---- a/src/skel.c<br>
-+++ b/src/skel.c<br>
-@@ -2561,7 +2561,7 @@ const char *skel[] =3D {<br>
-=C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * scanner wil=
l even need a stack. We use 2 instead of 1 to avoid an&quot;,<br>
-=C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * immediate r=
ealloc on the next call.&quot;,<br>
-=C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/&quot;,<br>
--=C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0num_to_alloc =3D 1;=
 // After all that talk, this was set to 1 anyways...&quot;,<br>
-+=C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0num_to_alloc =3D 1;=
 /* After all that talk, this was set to 1 anyways... */&quot;,<br>
-=C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0YY_G(yy_buffer=
_stack) =3D (struct yy_buffer_state**)yyalloc&quot;,<br>
-=C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0(num_to_alloc * sizeof(struct yy_buffer_state*)&quot;,<br>
-=C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0M4_YY_CALL_LAST_ARG);&quot;,<br>
---<br>
-2.5.5<br>
-<br>
diff --git a/meta/recipes-devtools/flex/<wbr>flex/CVE-2016-6354.patch b/met=
a/recipes-devtools/flex/<wbr>flex/CVE-2016-6354.patch<br>
deleted file mode 100644<br>
index 216ac7a..0000000<br>
--- a/meta/recipes-devtools/flex/<wbr>flex/CVE-2016-6354.patch<br>
+++ /dev/null<br>
@@ -1,59 +0,0 @@<br>
-From 3939eccdff598f47e5b37b05d58bf1<wbr>b44d3796e7 Mon Sep 17 00:00:00 200=
1<br>
-From: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.com">jussi=
.kukkonen@intel.com</a>&gt;<br>
-Date: Fri, 7 Oct 2016 14:15:38 +0300<br>
-Subject: [PATCH] Prevent buffer overflow in yy_get_next_buffer<br>
-<br>
-This is upstream commit a5cbe929ac3255d371e698f62dc256<wbr>afe7006466<br>
-with some additional backporting to make binutils build again.<br>
-<br>
-Upstream-Status: Backport<br>
-CVE: CVE-2016-6354<br>
-Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.c=
om">jussi.kukkonen@intel.com</a>&gt;<br>
----<br>
- src/flex.skl | 2 +-<br>
- src/scan.c=C2=A0 =C2=A0| 2 +-<br>
- src/skel.c=C2=A0 =C2=A0| 2 +-<br>
- 3 files changed, 3 insertions(+), 3 deletions(-)<br>
-<br>
-diff --git a/src/flex.skl b/src/flex.skl<br>
-index ed71627..814d562 100644<br>
---- a/src/flex.skl<br>
-+++ b/src/flex.skl<br>
-@@ -1718,7 +1718,7 @@ int yyFlexLexer::yy_get_next_<wbr>buffer()<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 yy_size_t num_to_read =3D<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 int num_to_read =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0YY_CURRENT_BUFFER_LVALUE-&gt;yy_<wbr>buf_size - number_to_move - =
1;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while ( num_to_read=
 &lt;=3D 0 )<br>
-diff --git a/src/scan.c b/src/scan.c<br>
-index f1dce75..1949872 100644<br>
---- a/src/scan.c<br>
-+++ b/src/scan.c<br>
-@@ -4181,7 +4181,7 @@ static int yy_get_next_buffer (void)<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 yy_size_t num_to_read =3D<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 int num_to_read =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0YY_CURRENT_BUFFER_LVALUE-&gt;yy_<wbr>buf_size - number_to_move - =
1;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while ( num_to_read=
 &lt;=3D 0 )<br>
-diff --git a/src/skel.c b/src/skel.c<br>
-index 26cc889..0344d18 100644<br>
---- a/src/skel.c<br>
-+++ b/src/skel.c<br>
-@@ -1929,7 +1929,7 @@ const char *skel[] =3D {<br>
-=C2=A0 =C2=A0&quot;&quot;,<br>
-=C2=A0 =C2=A0&quot;=C2=A0 =C2=A0else&quot;,<br>
-=C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;,<br>
--=C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0yy_size_t num_to_read =3D&quot;,<br>
-+=C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0int num_to_read =3D&quot;,<br>
-=C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0YY_CURRENT_BUFFER_LVALUE-&gt;yy_<wbr>buf_size - number_to_mov=
e - 1;&quot;,<br>
-=C2=A0 =C2=A0&quot;&quot;,<br>
-=C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while ( num_to=
_read &lt;=3D 0 )&quot;,<br>
---<br>
-2.1.4<br>
-<br>
diff --git a/meta/recipes-devtools/flex/<wbr>flex/do_not_create_pdf_doc.<wb=
r>patch b/meta/recipes-devtools/flex/<wbr>flex/do_not_create_pdf_doc.<wbr>p=
atch<br>
deleted file mode 100644<br>
index 032833ae..0000000<br>
--- a/meta/recipes-devtools/flex/<wbr>flex/do_not_create_pdf_doc.<wbr>patch=
<br>
+++ /dev/null<br>
@@ -1,17 +0,0 @@<br>
-Upstream-Status: Inappropriate (embedded specific)<br>
-<br>
-Signed-off-by: Laurentiu Palcu &lt;<a href=3D"mailto:laurentiu.palcu@intel=
.com">laurentiu.palcu@intel.com</a>&gt;<br>
-<br>
-Index: flex-2.5.37/doc/Makefile.am<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- flex-2.5.37.orig/doc/Makefile.<wbr>am=C2=A0 =C2=A02012-07-21 04:18:27.=
000000000 +0300<br>
-+++ flex-2.5.37/doc/Makefile.am=C2=A0 =C2=A0 =C2=A0 =C2=A0 2013-07-30 17:5=
7:09.834834531 +0300<br>
-@@ -2,7 +2,7 @@<br>
-<br>
- info_TEXINFOS =3D=C2=A0 =C2=A0 =C2=A0 =C2=A0flex.texi<br>
- dist_man_MANS =3D flex.1<br>
--dist_doc_DATA=3D flex.pdf<br>
-+EXTRA_DIST=3D flex.pdf<br>
-<br>
- CLEANFILES =3D \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0flex.hks \<br>
diff --git a/meta/recipes-devtools/flex/<a href=3D"http://flex_2.6.0.bb" re=
l=3D"noreferrer" target=3D"_blank">f<wbr>lex_2.6.0.bb</a> b/meta/recipes-de=
vtools/flex/<a href=3D"http://flex_2.6.2.bb" rel=3D"noreferrer" target=3D"_=
blank">f<wbr>lex_2.6.2.bb</a><br>
similarity index 79%<br>
rename from meta/recipes-devtools/flex/<a href=3D"http://flex_2.6.0.bb" rel=
=3D"noreferrer" target=3D"_blank">fle<wbr>x_2.6.0.bb</a><br>
rename to meta/recipes-devtools/flex/<a href=3D"http://flex_2.6.2.bb" rel=
=3D"noreferrer" target=3D"_blank">fle<wbr>x_2.6.2.bb</a><br>
index ab35b09..e723124 100644<br>
--- a/meta/recipes-devtools/flex/<a href=3D"http://flex_2.6.0.bb" rel=3D"no=
referrer" target=3D"_blank">f<wbr>lex_2.6.0.bb</a><br>
+++ b/meta/recipes-devtools/flex/<a href=3D"http://flex_2.6.2.bb" rel=3D"no=
referrer" target=3D"_blank">f<wbr>lex_2.6.2.bb</a><br>
@@ -5,22 +5,23 @@ HOMEPAGE =3D &quot;<a href=3D"http://sourceforge.net/proj=
ects/flex/" rel=3D"noreferrer" target=3D"_blank">http://sourceforge.net/<wb=
r>projects/flex/</a>&quot;<br>
=C2=A0SECTION =3D &quot;devel&quot;<br>
=C2=A0LICENSE =3D &quot;BSD&quot;<br>
<br>
-DEPENDS =3D &quot;${@bb.utils.contains(&#39;PTEST_<wbr>ENABLED&#39;, &#39;=
1&#39;, &#39;bison-native flex-native&#39;, &#39;&#39;, d)}&quot;<br>
+DEPENDS =3D &quot;flex-native ${@bb.utils.contains(&#39;PTEST_<wbr>ENABLED=
&#39;, &#39;1&#39;, &#39;bison-native&#39;, &#39;&#39;, d)}&quot;<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>e4742cf92e89040b=
39486a6219b680<wbr>67&quot;<br>
<br>
-SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/flex/<wbr>flex-${PV}.tar.bz2 \<br>
+SRC_URI =3D &quot;<a href=3D"https://github.com/westes/flex/releases/downl=
oad/v${PV}/flex-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">https://=
github.com/westes/<wbr>flex/releases/download/v${PV}/<wbr>flex-${PV}.tar.gz=
</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://do_not_create_pdf_doc.<wbr=
>patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-tests-add-a-<wbr>targ=
et-for-building-tests-<wbr>without-runnin.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-avoid-c-comments-<wbr=
>in-c-code-fails-with-gcc-6.<wbr>patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2016-6354.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;PTEST_<=
wbr>ENABLED&#39;, &#39;1&#39;, &#39;&#39;, &#39;file://disable-tests.patch&=
#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;<wbr>266270f13c48ed043d95648075084d<wbr>59&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>24e611ef5a4703a191012f80c1027d<wbr>c9d12=
555183ce0ecd46f3636e587e9<wbr>b8e9&quot;<br>
+SRC_URI_append_class-target =3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-use-stage1flex-<wbr>f=
rom-flex-native-to-fix-cross-<wbr>compili.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
+<br>
+SRC_URI[md5sum] =3D &quot;<wbr>cc6d76c333db7653d5caf423a33352<wbr>39&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>9a01437a1155c799b7dc2508620564<wbr>ef806=
ba66250c36bf5f9034b1c207c<wbr>b2c9&quot;<br>
<br>
=C2=A0# Flex has moved to github from 2.6.1 onwards<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/westes/fle=
x/releases" rel=3D"noreferrer" target=3D"_blank">https://github.com/westes/=
<wbr>flex/releases</a>&quot;<br>
@@ -37,6 +38,7 @@ EXTRA_OEMAKE +=3D &quot;${@bb.utils.contains(&#39;PTEST_<=
wbr>ENABLED&#39;, &#39;1&#39;, &#39;FLEX=3D${STAGING_BIND<br>
<br>
=C2=A0do_install_append_class-<wbr>native() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 create_wrapper ${D}/${bindir}/flex M4=3D${M4}<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp ${B}/src/stage1flex ${D}/${bindir}<br>
=C2=A0}<br>
<br>
=C2=A0do_install_append_class-<wbr>nativesdk() {<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a11477bfee080570547070406--
