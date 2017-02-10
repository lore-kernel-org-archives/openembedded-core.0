Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id E487E60107
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 21:22:19 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id k90so16306710wrc.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 13:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Zs4AWWfBKwrorhZjJIn3BDmkNhtgHjd/r42qvkc6heY=;
	b=mcdMpNDvoPxew4qpUyDosL87uSZonm79q+8ED0GmEqozsdnkKWY3LlN72QVRFds2YO
	GSC5iYkkU9hocPNDfh7mpPxIgYGiI8DBv1Lbbyd66NcHVRoKgw4htk+b2v9cBVS8gGJ4
	NOhgL2g3i4GprRr+FYzyxTfo58awcVMBJ5z1/wl128iv3/zNikNn0JW7DR+yt5uXeaXT
	gCaD0iNurFrcoCq7WA1xw23nXlicR6mcD66By9eiDUhj/lZ3nfcPD0al7+ASCaddzsBC
	Rr1eZqQf81SnhpxSRypdiBgFHYra6wd/sNgsaTXmLKlvdyvZWKn4RQ4Ir7vCpTLXv9dU
	6afA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Zs4AWWfBKwrorhZjJIn3BDmkNhtgHjd/r42qvkc6heY=;
	b=YZ9TevgFF7EgCTiGRiaSjsUfGZhDyELTHPbfdH5Qa4nc6MqCxQphr6h8w+bpocKDth
	CXQUvP1EEQvjyp5OaHPGYFOpMBz5tdGSzvZd8UjFsWIW3FWfLR1Un8j5q9iXwR2V7+OS
	XvCg1lCu+D/BYyG7Bp+n3rvKmMGwtkCMgI9RaTOqiGhQzyXApGIVuynF5Q40mRV/shT5
	T4XCkBDebni/Dd+WGw3lKHSPCW3c00giYe6JHuyKqx1gOJzGS0KvnlCy8Fc6+MTPMgGD
	O4hgBEkqF374pvuNhLOU1vx1qrrb3GgCfS/gLQND5uV8h71WWq7O40usS2H+zuYPCuOQ
	Q7bQ==
X-Gm-Message-State: AMke39kzeVKlGoz2U/TFZHmkrjKRjqK1pzk1QJkaS+gHidHwdoQn4vF6Bo9VQRZJ0tXR1g==
X-Received: by 10.223.135.43 with SMTP id a40mr10415481wra.197.1486761739114; 
	Fri, 10 Feb 2017 13:22:19 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	h75sm4158152wrh.37.2017.02.10.13.22.17
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 10 Feb 2017 13:22:17 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 10 Feb 2017 22:22:18 +0100
To: Trevor Woerner <twoerner@gmail.com>
Message-ID: <20170210212218.GD3021@jama>
References: <20170210201308.30616-1-twoerner@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20170210201308.30616-1-twoerner@gmail.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Revert "flex: upgrade to 2.6.2"
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
X-List-Received-Date: Fri, 10 Feb 2017 21:22:21 -0000
X-Groupsio-MsgNum: 93191
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AbQceqfdZEv+FvjW"
Content-Disposition: inline

--AbQceqfdZEv+FvjW
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 10, 2017 at 03:13:08PM -0500, Trevor Woerner wrote:
> This reverts commit 3632abd01abb8dfff230e18f828af705da488f97.
>=20
> Multiple people have expressed issues with flex-2.6.2; personally I had
> problems compiling libsepol from meta-selinux (for libselinux). I tried
> upgrading to flex-2.6.3, but that caused binutils-cross_2.27 to fail.
>=20
> The simplest for now is to downgrade to flex-2.6.0.

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

> ---
>  ...oid-c-comments-in-c-code-fails-with-gcc-6.patch |  64 ++++++
>  .../recipes-devtools/flex/flex/CVE-2016-6354.patch |  59 ++++++
>  meta/recipes-devtools/flex/flex/crosscompile.patch | 214 ---------------=
------
>  .../flex/flex/do_not_create_pdf_doc.patch          |  17 ++
>  .../flex/{flex_2.6.2.bb =3D> flex_2.6.0.bb}          |  11 +-
>  5 files changed, 146 insertions(+), 219 deletions(-)
>  create mode 100644 meta/recipes-devtools/flex/flex/0002-avoid-c-comments=
-in-c-code-fails-with-gcc-6.patch
>  create mode 100644 meta/recipes-devtools/flex/flex/CVE-2016-6354.patch
>  delete mode 100644 meta/recipes-devtools/flex/flex/crosscompile.patch
>  create mode 100644 meta/recipes-devtools/flex/flex/do_not_create_pdf_doc=
=2Epatch
>  rename meta/recipes-devtools/flex/{flex_2.6.2.bb =3D> flex_2.6.0.bb} (84=
%)
>=20
> diff --git a/meta/recipes-devtools/flex/flex/0002-avoid-c-comments-in-c-c=
ode-fails-with-gcc-6.patch b/meta/recipes-devtools/flex/flex/0002-avoid-c-c=
omments-in-c-code-fails-with-gcc-6.patch
> new file mode 100644
> index 0000000000..438ca5f527
> --- /dev/null
> +++ b/meta/recipes-devtools/flex/flex/0002-avoid-c-comments-in-c-code-fai=
ls-with-gcc-6.patch
> @@ -0,0 +1,64 @@
> +From 7072befe1397af4eb01c3ff7edf99f0cd5076089 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
> +Date: Tue, 30 Aug 2016 14:25:32 +0200
> +Subject: [PATCH] avoid c++ comments in c-code - fails with gcc-6
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +fixes:
> +
> +| error: C++ style comments are not allowed in ISO C90
> +| num_to_alloc =3D 1; // After all that talk, this was set to 1 anyways.=
=2E.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> +---
> + src/flex.skl | 2 +-
> + src/scan.c   | 2 +-
> + src/skel.c   | 2 +-
> + 3 files changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/flex.skl b/src/flex.skl
> +index 73a0b9e..ed71627 100644
> +--- a/src/flex.skl
> ++++ b/src/flex.skl
> +@@ -2350,7 +2350,7 @@ void yyFlexLexer::yyensure_buffer_stack(void)
> + 		 * scanner will even need a stack. We use 2 instead of 1 to avoid an
> + 		 * immediate realloc on the next call.
> +          */
> +-		num_to_alloc =3D 1; // After all that talk, this was set to 1 anyways=
=2E..
> ++		num_to_alloc =3D 1; /* After all that talk, this was set to 1 anyways=
=2E.. */
> + 		YY_G(yy_buffer_stack) =3D (struct yy_buffer_state**)yyalloc
> + 								(num_to_alloc * sizeof(struct yy_buffer_state*)
> + 								M4_YY_CALL_LAST_ARG);
> +diff --git a/src/scan.c b/src/scan.c
> +index b55df2d..f1dce75 100644
> +--- a/src/scan.c
> ++++ b/src/scan.c
> +@@ -4672,7 +4672,7 @@ static void yyensure_buffer_stack (void)
> + 		 * scanner will even need a stack. We use 2 instead of 1 to avoid an
> + 		 * immediate realloc on the next call.
> +          */
> +-		num_to_alloc =3D 1; // After all that talk, this was set to 1 anyways=
=2E..
> ++		num_to_alloc =3D 1; /* After all that talk, this was set to 1 anyways=
=2E..*/
> + 		(yy_buffer_stack) =3D (struct yy_buffer_state**)yyalloc
> + 								(num_to_alloc * sizeof(struct yy_buffer_state*)
> + 								);
> +diff --git a/src/skel.c b/src/skel.c
> +index ef657d3..26cc889 100644
> +--- a/src/skel.c
> ++++ b/src/skel.c
> +@@ -2561,7 +2561,7 @@ const char *skel[] =3D {
> +   "		 * scanner will even need a stack. We use 2 instead of 1 to avoid =
an",
> +   "		 * immediate realloc on the next call.",
> +   "         */",
> +-  "		num_to_alloc =3D 1; // After all that talk, this was set to 1 anyw=
ays...",
> ++  "		num_to_alloc =3D 1; /* After all that talk, this was set to 1 anyw=
ays... */",
> +   "		YY_G(yy_buffer_stack) =3D (struct yy_buffer_state**)yyalloc",
> +   "								(num_to_alloc * sizeof(struct yy_buffer_state*)",
> +   "								M4_YY_CALL_LAST_ARG);",
> +--=20
> +2.5.5
> +
> diff --git a/meta/recipes-devtools/flex/flex/CVE-2016-6354.patch b/meta/r=
ecipes-devtools/flex/flex/CVE-2016-6354.patch
> new file mode 100644
> index 0000000000..216ac7ae1c
> --- /dev/null
> +++ b/meta/recipes-devtools/flex/flex/CVE-2016-6354.patch
> @@ -0,0 +1,59 @@
> +From 3939eccdff598f47e5b37b05d58bf1b44d3796e7 Mon Sep 17 00:00:00 2001
> +From: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +Date: Fri, 7 Oct 2016 14:15:38 +0300
> +Subject: [PATCH] Prevent buffer overflow in yy_get_next_buffer
> +
> +This is upstream commit a5cbe929ac3255d371e698f62dc256afe7006466
> +with some additional backporting to make binutils build again.
> +
> +Upstream-Status: Backport
> +CVE: CVE-2016-6354
> +Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +---
> + src/flex.skl | 2 +-
> + src/scan.c   | 2 +-
> + src/skel.c   | 2 +-
> + 3 files changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/flex.skl b/src/flex.skl
> +index ed71627..814d562 100644
> +--- a/src/flex.skl
> ++++ b/src/flex.skl
> +@@ -1718,7 +1718,7 @@ int yyFlexLexer::yy_get_next_buffer()
> +=20
> + 	else
> + 		{
> +-			yy_size_t num_to_read =3D
> ++			int num_to_read =3D
> + 			YY_CURRENT_BUFFER_LVALUE->yy_buf_size - number_to_move - 1;
> +=20
> + 		while ( num_to_read <=3D 0 )
> +diff --git a/src/scan.c b/src/scan.c
> +index f1dce75..1949872 100644
> +--- a/src/scan.c
> ++++ b/src/scan.c
> +@@ -4181,7 +4181,7 @@ static int yy_get_next_buffer (void)
> +=20
> + 	else
> + 		{
> +-			yy_size_t num_to_read =3D
> ++			int num_to_read =3D
> + 			YY_CURRENT_BUFFER_LVALUE->yy_buf_size - number_to_move - 1;
> +=20
> + 		while ( num_to_read <=3D 0 )
> +diff --git a/src/skel.c b/src/skel.c
> +index 26cc889..0344d18 100644
> +--- a/src/skel.c
> ++++ b/src/skel.c
> +@@ -1929,7 +1929,7 @@ const char *skel[] =3D {
> +   "",
> +   "	else",
> +   "		{",
> +-  "			yy_size_t num_to_read =3D",
> ++  "			int num_to_read =3D",
> +   "			YY_CURRENT_BUFFER_LVALUE->yy_buf_size - number_to_move - 1;",
> +   "",
> +   "		while ( num_to_read <=3D 0 )",
> +--=20
> +2.1.4
> +
> diff --git a/meta/recipes-devtools/flex/flex/crosscompile.patch b/meta/re=
cipes-devtools/flex/flex/crosscompile.patch
> deleted file mode 100644
> index 14463d93f4..0000000000
> --- a/meta/recipes-devtools/flex/flex/crosscompile.patch
> +++ /dev/null
> @@ -1,214 +0,0 @@
> -Add this patch from https://github.com/westes/flex/pull/153 with minor c=
hanges
> -to fix cross compilation.
> -
> -Upstream-Status: Submitted
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -
> -From 52d4a3ca249be984614d9204dcc7b957bc04b2ac Mon Sep 17 00:00:00 2001
> -From: Alastair Hughes <hobbitalastair@gmail.com>
> -Date: Fri, 6 Jan 2017 19:06:03 +1300
> -Subject: [PATCH] build: support cross compiling
> -
> -Check for cross compiling. If cross compiling, build stage1flex using a
> -custom link command.
> -We also override LDADD since that adds the replacement implementations
> -that are cross compiled, and instead always use the replacement library
> -implementations.
> -
> -We don't use BUILD_OBJEXT and BUILD_EXEEXT since it seems that automake
> -does not support these.
> -
> -Fixes #78.
> -
> -Signed-off-by: Alastair Hughes <hobbitalastair@gmail.com>
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> ----
> - configure.ac               |   3 ++
> - m4/ax_prog_cc_for_build.m4 | 125 ++++++++++++++++++++++++++++++++++++++=
+++++++
> - src/Makefile.am            |  17 ++++++
> - 3 files changed, 145 insertions(+)
> - create mode 100644 m4/ax_prog_cc_for_build.m4
> -
> -diff --git a/configure.ac b/configure.ac
> -index 901339f..2a7dce2 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -42,6 +42,7 @@ AM_GNU_GETTEXT_VERSION([0.19])
> - AC_PROG_YACC
> - AM_PROG_LEX
> - AC_PROG_CC
> -+AX_PROG_CC_FOR_BUILD
> - AC_PROG_CXX
> - AM_PROG_CC_C_O
> - AC_PROG_LN_S
> -@@ -75,6 +76,8 @@ AC_ARG_ENABLE([bootstrap],
> -   [], [enable_bootstrap=3Dyes])
> - AM_CONDITIONAL([ENABLE_BOOTSTRAP], [test "x$enable_bootstrap" =3D xyes])
> -=20
> -+AM_CONDITIONAL([CROSS], [test "x$cross_compiling" =3D xyes])
> -+
> - AC_PATH_PROG([BISON], bison, no)
> - AS_IF([test "$BISON" !=3D no],[],
> - 	[ AC_SUBST([BISON], [\${top_srcdir}/build-aux/missing bison])
> -diff --git a/m4/ax_prog_cc_for_build.m4 b/m4/ax_prog_cc_for_build.m4
> -new file mode 100644
> -index 0000000..77fd346
> ---- /dev/null
> -+++ b/m4/ax_prog_cc_for_build.m4
> -@@ -0,0 +1,125 @@
> -+# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> -+#   http://www.gnu.org/software/autoconf-archive/ax_prog_cc_for_build.h=
tml
> -+# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> -+#
> -+# SYNOPSIS
> -+#
> -+#   AX_PROG_CC_FOR_BUILD
> -+#
> -+# DESCRIPTION
> -+#
> -+#   This macro searches for a C compiler that generates native executab=
les,
> -+#   that is a C compiler that surely is not a cross-compiler. This can =
be
> -+#   useful if you have to generate source code at compile-time like for
> -+#   example GCC does.
> -+#
> -+#   The macro sets the CC_FOR_BUILD and CPP_FOR_BUILD macros to anything
> -+#   needed to compile or link (CC_FOR_BUILD) and preprocess (CPP_FOR_BU=
ILD).
> -+#   The value of these variables can be overridden by the user by speci=
fying
> -+#   a compiler with an environment variable (like you do for standard C=
C).
> -+#
> -+#   It also sets BUILD_EXEEXT and BUILD_OBJEXT to the executable and ob=
ject
> -+#   file extensions for the build platform, and GCC_FOR_BUILD to `yes' =
if
> -+#   the compiler we found is GCC. All these variables but GCC_FOR_BUILD=
 are
> -+#   substituted in the Makefile.
> -+#
> -+# LICENSE
> -+#
> -+#   Copyright (c) 2008 Paolo Bonzini <bonzini@gnu.org>
> -+#
> -+#   Copying and distribution of this file, with or without modification=
, are
> -+#   permitted in any medium without royalty provided the copyright noti=
ce
> -+#   and this notice are preserved. This file is offered as-is, without =
any
> -+#   warranty.
> -+
> -+#serial 8
> -+
> -+AU_ALIAS([AC_PROG_CC_FOR_BUILD], [AX_PROG_CC_FOR_BUILD])
> -+AC_DEFUN([AX_PROG_CC_FOR_BUILD], [dnl
> -+AC_REQUIRE([AC_PROG_CC])dnl
> -+AC_REQUIRE([AC_PROG_CPP])dnl
> -+AC_REQUIRE([AC_EXEEXT])dnl
> -+AC_REQUIRE([AC_CANONICAL_HOST])dnl
> -+
> -+dnl Use the standard macros, but make them use other variable names
> -+dnl
> -+pushdef([ac_cv_prog_CPP], ac_cv_build_prog_CPP)dnl
> -+pushdef([ac_cv_prog_gcc], ac_cv_build_prog_gcc)dnl
> -+pushdef([ac_cv_prog_cc_works], ac_cv_build_prog_cc_works)dnl
> -+pushdef([ac_cv_prog_cc_cross], ac_cv_build_prog_cc_cross)dnl
> -+pushdef([ac_cv_prog_cc_g], ac_cv_build_prog_cc_g)dnl
> -+pushdef([ac_cv_exeext], ac_cv_build_exeext)dnl
> -+pushdef([ac_cv_objext], ac_cv_build_objext)dnl
> -+pushdef([ac_exeext], ac_build_exeext)dnl
> -+pushdef([ac_objext], ac_build_objext)dnl
> -+pushdef([CC], CC_FOR_BUILD)dnl
> -+pushdef([CPP], CPP_FOR_BUILD)dnl
> -+pushdef([CFLAGS], CFLAGS_FOR_BUILD)dnl
> -+pushdef([CPPFLAGS], CPPFLAGS_FOR_BUILD)dnl
> -+pushdef([LDFLAGS], LDFLAGS_FOR_BUILD)dnl
> -+pushdef([host], build)dnl
> -+pushdef([host_alias], build_alias)dnl
> -+pushdef([host_cpu], build_cpu)dnl
> -+pushdef([host_vendor], build_vendor)dnl
> -+pushdef([host_os], build_os)dnl
> -+pushdef([ac_cv_host], ac_cv_build)dnl
> -+pushdef([ac_cv_host_alias], ac_cv_build_alias)dnl
> -+pushdef([ac_cv_host_cpu], ac_cv_build_cpu)dnl
> -+pushdef([ac_cv_host_vendor], ac_cv_build_vendor)dnl
> -+pushdef([ac_cv_host_os], ac_cv_build_os)dnl
> -+pushdef([ac_cpp], ac_build_cpp)dnl
> -+pushdef([ac_compile], ac_build_compile)dnl
> -+pushdef([ac_link], ac_build_link)dnl
> -+
> -+save_cross_compiling=3D$cross_compiling
> -+save_ac_tool_prefix=3D$ac_tool_prefix
> -+cross_compiling=3Dno
> -+ac_tool_prefix=3D
> -+
> -+AC_PROG_CC
> -+AC_PROG_CPP
> -+AC_EXEEXT
> -+
> -+ac_tool_prefix=3D$save_ac_tool_prefix
> -+cross_compiling=3D$save_cross_compiling
> -+
> -+dnl Restore the old definitions
> -+dnl
> -+popdef([ac_link])dnl
> -+popdef([ac_compile])dnl
> -+popdef([ac_cpp])dnl
> -+popdef([ac_cv_host_os])dnl
> -+popdef([ac_cv_host_vendor])dnl
> -+popdef([ac_cv_host_cpu])dnl
> -+popdef([ac_cv_host_alias])dnl
> -+popdef([ac_cv_host])dnl
> -+popdef([host_os])dnl
> -+popdef([host_vendor])dnl
> -+popdef([host_cpu])dnl
> -+popdef([host_alias])dnl
> -+popdef([host])dnl
> -+popdef([LDFLAGS])dnl
> -+popdef([CPPFLAGS])dnl
> -+popdef([CFLAGS])dnl
> -+popdef([CPP])dnl
> -+popdef([CC])dnl
> -+popdef([ac_objext])dnl
> -+popdef([ac_exeext])dnl
> -+popdef([ac_cv_objext])dnl
> -+popdef([ac_cv_exeext])dnl
> -+popdef([ac_cv_prog_cc_g])dnl
> -+popdef([ac_cv_prog_cc_cross])dnl
> -+popdef([ac_cv_prog_cc_works])dnl
> -+popdef([ac_cv_prog_gcc])dnl
> -+popdef([ac_cv_prog_CPP])dnl
> -+
> -+dnl Finally, set Makefile variables
> -+dnl
> -+BUILD_EXEEXT=3D$ac_build_exeext
> -+BUILD_OBJEXT=3D$ac_build_objext
> -+AC_SUBST(BUILD_EXEEXT)dnl
> -+AC_SUBST(BUILD_OBJEXT)dnl
> -+AC_SUBST([CFLAGS_FOR_BUILD])dnl
> -+AC_SUBST([CPPFLAGS_FOR_BUILD])dnl
> -+AC_SUBST([LDFLAGS_FOR_BUILD])dnl
> -+])
> -diff --git a/src/Makefile.am b/src/Makefile.am
> -index 3b5e362..05fe8d3 100644
> ---- a/src/Makefile.am
> -+++ b/src/Makefile.am
> -@@ -22,7 +22,24 @@ stage1flex_SOURCES =3D \
> - 	scan.l \
> - 	$(COMMON_SOURCES)
> -=20
> -+if CROSS
> -+stage1flex_LDADD =3D
> -+stage1flex_SOURCES +=3D \
> -+		      ../lib/malloc.c \
> -+		      ../lib/realloc.c \
> -+		      ../lib/reallocarray.c
> -+stage1flex_LINK =3D $(LIBTOOL) --tag=3DCC --mode=3Dlink $(CC_FOR_BUILD)=
 \
> -+		  $(CFLAGS_FOR_BUILD) $(LDFLAGS_FOR_BUILD) -o $@
> -+
> -+$(stage1flex_OBJECTS): CC=3D$(CC_FOR_BUILD)
> -+$(stage1flex_OBJECTS): CFLAGS=3D$(CFLAGS_FOR_BUILD)
> -+$(stage1flex_OBJECTS): CPP=3D$(CPP_FOR_BUILD)
> -+$(stage1flex_OBJECTS): CPPFLAGS=3D$(CPPFLAGS_FOR_BUILD)
> -+$(stage1flex_OBJECTS): LDFLAGS=3D$(LDFLAGS_FOR_BUILD)
> -+else
> - stage1flex_CFLAGS =3D $(AM_CFLAGS)
> -+stage1flex_LINK =3D $(LINK)
> -+endif
> -=20
> - flex_SOURCES =3D \
> - 	$(COMMON_SOURCES)
> ---=20
> -2.8.1
> diff --git a/meta/recipes-devtools/flex/flex/do_not_create_pdf_doc.patch =
b/meta/recipes-devtools/flex/flex/do_not_create_pdf_doc.patch
> new file mode 100644
> index 0000000000..032833ae7a
> --- /dev/null
> +++ b/meta/recipes-devtools/flex/flex/do_not_create_pdf_doc.patch
> @@ -0,0 +1,17 @@
> +Upstream-Status: Inappropriate (embedded specific)
> +
> +Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> +
> +Index: flex-2.5.37/doc/Makefile.am
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- flex-2.5.37.orig/doc/Makefile.am	2012-07-21 04:18:27.000000000 +0300
> ++++ flex-2.5.37/doc/Makefile.am	2013-07-30 17:57:09.834834531 +0300
> +@@ -2,7 +2,7 @@
> +=20
> + info_TEXINFOS =3D	flex.texi
> + dist_man_MANS =3D flex.1
> +-dist_doc_DATA=3D flex.pdf
> ++EXTRA_DIST=3D flex.pdf
> +=20
> + CLEANFILES =3D \
> + 	flex.hks \
> diff --git a/meta/recipes-devtools/flex/flex_2.6.2.bb b/meta/recipes-devt=
ools/flex/flex_2.6.0.bb
> similarity index 84%
> rename from meta/recipes-devtools/flex/flex_2.6.2.bb
> rename to meta/recipes-devtools/flex/flex_2.6.0.bb
> index 1780cabbff..ab35b09f99 100644
> --- a/meta/recipes-devtools/flex/flex_2.6.2.bb
> +++ b/meta/recipes-devtools/flex/flex_2.6.0.bb
> @@ -6,20 +6,21 @@ SECTION =3D "devel"
>  LICENSE =3D "BSD"
> =20
>  DEPENDS =3D "${@bb.utils.contains('PTEST_ENABLED', '1', 'bison-native fl=
ex-native', '', d)}"
> -
>  BBCLASSEXTEND =3D "native nativesdk"
> =20
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De4742cf92e89040b39486a6219b68=
067"
> =20
> -SRC_URI =3D "https://github.com/westes/flex/releases/download/v${PV}/fle=
x-${PV}.tar.gz \
> -           file://crosscompile.patch;apply=3D1 \
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/flex/flex-${PV}.tar.bz2 \
>             file://run-ptest \
> +           file://do_not_create_pdf_doc.patch \
>             file://0001-tests-add-a-target-for-building-tests-without-run=
nin.patch \
> +           file://0002-avoid-c-comments-in-c-code-fails-with-gcc-6.patch=
 \
> +           file://CVE-2016-6354.patch \
>             ${@bb.utils.contains('PTEST_ENABLED', '1', '', 'file://disabl=
e-tests.patch', d)} \
>             "
> =20
> -SRC_URI[md5sum] =3D "cc6d76c333db7653d5caf423a3335239"
> -SRC_URI[sha256sum] =3D "9a01437a1155c799b7dc2508620564ef806ba66250c36bf5=
f9034b1c207cb2c9"
> +SRC_URI[md5sum] =3D "266270f13c48ed043d95648075084d59"
> +SRC_URI[sha256sum] =3D "24e611ef5a4703a191012f80c1027dc9d12555183ce0ecd4=
6f3636e587e9b8e9"
> =20
>  # Flex has moved to github from 2.6.1 onwards
>  UPSTREAM_CHECK_URI =3D "https://github.com/westes/flex/releases"
> --=20
> 2.11.0.258.ge05806d
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--AbQceqfdZEv+FvjW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWJ4vCgAKCRA3VSO3ZXaA
HPsvAJ4lvhnVw/qqYshFNU/wVdWuNvLcBACdGYGCrf8D37R185Uwlfzu3UOYg3Y=
=UReW
-----END PGP SIGNATURE-----

--AbQceqfdZEv+FvjW--
