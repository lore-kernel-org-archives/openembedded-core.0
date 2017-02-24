Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id D346F72FE2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 20:54:22 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id 89so20497634wrr.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 12:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=26tjbkXEZWD74fRt6kUu0pH8Tzxap/wNTuJieaNCsM8=;
	b=pqKx+fDmJnGbYcoHwFxYBxP2BJwWkm/rQRzSDDX9Kzf4Rmu78FefefnBN4suFNw99Z
	AwBf0cz413xOtqCACL3v9P9driYqOSON7Tsvg6QgLCGNj06bjuddrRp+KWAXk6ddEYzx
	dt0YxI02O3yzlg3IOBgIMVGcA5jqtsc5TCO49reKjbLMmbBS6ioCyGWZcvprDDdQVBcH
	KyStCSzSCYOAIjq4/PrnpJv7uu7Z1FMzy2PeSKrfEXVMgclhyKzXvUhVMTP5mqjiO8Xl
	Qhu/KXduZu+GU7M/Ub/7jf1RP+XYwJIQVAVhfJZ+7AZI0r3d1VJIrbGfIbJ+YOEvQPjZ
	Ii9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=26tjbkXEZWD74fRt6kUu0pH8Tzxap/wNTuJieaNCsM8=;
	b=L2E/MrFHB7nIpGmSGGkMO7cVW7sgg9A0Ha83M5ooOVCHn/R394fz67ohOYJrVs6rPV
	c3lteF7rc0oREsjhc1meA38LhjnpTJgS3WbZX6DKc38jAv3QJJkr2xZee8MSNBHes3tX
	8NMtVXedXRpoAI/8mltFsQHXWsuW96AZ2PGNmuHSdAe7DUUM0EVaRoBaL99JIWtqW6I5
	1gglksc87r0nngrrLq5FOqN4dEQlhKLycJ4XMrgASokDmiJVloTB1Ge6IKm04DxL6qrM
	ZPAJ0lBah2OnUCKQSO7SgQSvCMCSIDd7A7rYFweAOEsjhIMl+AOD1ieocH5i1eT/78MD
	PSqg==
X-Gm-Message-State: AMke39lPSSM/lHtdAEIuObGBaq52LXwcFcY283Zw6ip6t9n8TG4+GQx9QQn3qxabtYiY0dZkKx06I+9IgQEQ0Q==
X-Received: by 10.223.136.79 with SMTP id e15mr4431830wre.14.1487969663612;
	Fri, 24 Feb 2017 12:54:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.208.207 with HTTP; Fri, 24 Feb 2017 12:54:23 -0800 (PST)
In-Reply-To: <20170224205136.204410-1-mark.hatle@windriver.com>
References: <20170224205136.204410-1-mark.hatle@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 24 Feb 2017 21:54:23 +0100
Message-ID: <CA+chaQdPPNmrs_dNBh2T31h8c2LofDxtJ0jFXFrezks_YKJ==Q@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Fri, 24 Feb 2017 20:54:24 -0000
Content-Type: multipart/alternative; boundary=001a11491ce43c7f3305494cef00

--001a11491ce43c7f3305494cef00
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This was already sent to ML 2 weeks ago:
http://lists.openembedded.org/pipermail/openembedded-core/2017-February/132=
584.html

discussed few times since it was upgraded

and I was pinging Ross about it few days ago as well, hopefully it will be
included before pyro is branched.

On Fri, Feb 24, 2017 at 9:51 PM, Mark Hatle <mark.hatle@windriver.com>
wrote:

> This reverts commit 3632abd01abb8dfff230e18f828af705da488f97.
>
> The commit upgraded flex and changed the way it was constructed.  There
> is a problem with either the upgrade or changes in construction mechanism
> resulting in problems similar to:
>
> ../cil/src/cil_lexer.lo: In function `cil_lexer_setup':
> cil_lexer.c:(.text+0x1737): undefined reference to `yy_scan_buffer'
> ../cil/src/cil_lexer.lo: In function `cil_lexer_destroy':
> cil_lexer.c:(.text+0x1773): undefined reference to `yylex_destroy'
>
> Effectively the yy_scan_buffer and yylex_destroy (in this example) were
> defined in a header, but were not defined in the resulting generated code=
.
>
> The snippet above was from libsepol-native from the meta-selinux layer.
> The build was performed on a Fedora 24 system.
>
> Reverting that commit resolves the problem.
>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  ...oid-c-comments-in-c-code-fails-with-gcc-6.patch |  64 ++++++
>  .../recipes-devtools/flex/flex/CVE-2016-6354.patch |  59 ++++++
>  meta/recipes-devtools/flex/flex/crosscompile.patch | 214
> ---------------------
>  .../flex/flex/do_not_create_pdf_doc.patch          |  17 ++
>  .../flex/{flex_2.6.2.bb =3D> flex_2.6.0.bb}          |  11 +-
>  5 files changed, 146 insertions(+), 219 deletions(-)
>  create mode 100644 meta/recipes-devtools/flex/
> flex/0002-avoid-c-comments-in-c-code-fails-with-gcc-6.patch
>  create mode 100644 meta/recipes-devtools/flex/flex/CVE-2016-6354.patch
>  delete mode 100644 meta/recipes-devtools/flex/flex/crosscompile.patch
>  create mode 100644 meta/recipes-devtools/flex/flex/do_not_create_pdf_doc=
.
> patch
>  rename meta/recipes-devtools/flex/{flex_2.6.2.bb =3D> flex_2.6.0.bb} (84=
%)
>
> diff --git a/meta/recipes-devtools/flex/flex/0002-avoid-c-comments-in-c-c=
ode-fails-with-gcc-6.patch
> b/meta/recipes-devtools/flex/flex/0002-avoid-c-comments-in-
> c-code-fails-with-gcc-6.patch
> new file mode 100644
> index 0000000000..438ca5f527
> --- /dev/null
> +++ b/meta/recipes-devtools/flex/flex/0002-avoid-c-comments-in-
> c-code-fails-with-gcc-6.patch
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
..
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
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
> +                * scanner will even need a stack. We use 2 instead of 1
> to avoid an
> +                * immediate realloc on the next call.
> +          */
> +-              num_to_alloc =3D 1; // After all that talk, this was set =
to
> 1 anyways...
> ++              num_to_alloc =3D 1; /* After all that talk, this was set =
to
> 1 anyways... */
> +               YY_G(yy_buffer_stack) =3D (struct yy_buffer_state**)yyall=
oc
> +
>  (num_to_alloc * sizeof(struct yy_buffer_state*)
> +
>  M4_YY_CALL_LAST_ARG);
> +diff --git a/src/scan.c b/src/scan.c
> +index b55df2d..f1dce75 100644
> +--- a/src/scan.c
> ++++ b/src/scan.c
> +@@ -4672,7 +4672,7 @@ static void yyensure_buffer_stack (void)
> +                * scanner will even need a stack. We use 2 instead of 1
> to avoid an
> +                * immediate realloc on the next call.
> +          */
> +-              num_to_alloc =3D 1; // After all that talk, this was set =
to
> 1 anyways...
> ++              num_to_alloc =3D 1; /* After all that talk, this was set =
to
> 1 anyways...*/
> +               (yy_buffer_stack) =3D (struct yy_buffer_state**)yyalloc
> +
>  (num_to_alloc * sizeof(struct yy_buffer_state*)
> +                                                               );
> +diff --git a/src/skel.c b/src/skel.c
> +index ef657d3..26cc889 100644
> +--- a/src/skel.c
> ++++ b/src/skel.c
> +@@ -2561,7 +2561,7 @@ const char *skel[] =3D {
> +   "            * scanner will even need a stack. We use 2 instead of 1
> to avoid an",
> +   "            * immediate realloc on the next call.",
> +   "         */",
> +-  "           num_to_alloc =3D 1; // After all that talk, this was set =
to
> 1 anyways...",
> ++  "           num_to_alloc =3D 1; /* After all that talk, this was set =
to
> 1 anyways... */",
> +   "           YY_G(yy_buffer_stack) =3D (struct yy_buffer_state**)yyall=
oc",
> +   "
>  (num_to_alloc * sizeof(struct yy_buffer_state*)",
> +   "
>  M4_YY_CALL_LAST_ARG);",
> +--
> +2.5.5
> +
> diff --git a/meta/recipes-devtools/flex/flex/CVE-2016-6354.patch
> b/meta/recipes-devtools/flex/flex/CVE-2016-6354.patch
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
> +
> +       else
> +               {
> +-                      yy_size_t num_to_read =3D
> ++                      int num_to_read =3D
> +                       YY_CURRENT_BUFFER_LVALUE->yy_buf_size -
> number_to_move - 1;
> +
> +               while ( num_to_read <=3D 0 )
> +diff --git a/src/scan.c b/src/scan.c
> +index f1dce75..1949872 100644
> +--- a/src/scan.c
> ++++ b/src/scan.c
> +@@ -4181,7 +4181,7 @@ static int yy_get_next_buffer (void)
> +
> +       else
> +               {
> +-                      yy_size_t num_to_read =3D
> ++                      int num_to_read =3D
> +                       YY_CURRENT_BUFFER_LVALUE->yy_buf_size -
> number_to_move - 1;
> +
> +               while ( num_to_read <=3D 0 )
> +diff --git a/src/skel.c b/src/skel.c
> +index 26cc889..0344d18 100644
> +--- a/src/skel.c
> ++++ b/src/skel.c
> +@@ -1929,7 +1929,7 @@ const char *skel[] =3D {
> +   "",
> +   "   else",
> +   "           {",
> +-  "                   yy_size_t num_to_read =3D",
> ++  "                   int num_to_read =3D",
> +   "                   YY_CURRENT_BUFFER_LVALUE->yy_buf_size -
> number_to_move - 1;",
> +   "",
> +   "           while ( num_to_read <=3D 0 )",
> +--
> +2.1.4
> +
> diff --git a/meta/recipes-devtools/flex/flex/crosscompile.patch
> b/meta/recipes-devtools/flex/flex/crosscompile.patch
> deleted file mode 100644
> index 14463d93f4..0000000000
> --- a/meta/recipes-devtools/flex/flex/crosscompile.patch
> +++ /dev/null
> @@ -1,214 +0,0 @@
> -Add this patch from https://github.com/westes/flex/pull/153 with minor
> changes
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
> - m4/ax_prog_cc_for_build.m4 | 125 ++++++++++++++++++++++++++++++
> +++++++++++++++
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
> - AM_CONDITIONAL([ENABLE_BOOTSTRAP], [test "x$enable_bootstrap" =3D xyes]=
)
> -
> -+AM_CONDITIONAL([CROSS], [test "x$cross_compiling" =3D xyes])
> -+
> - AC_PATH_PROG([BISON], bison, no)
> - AS_IF([test "$BISON" !=3D no],[],
> -       [ AC_SUBST([BISON], [\${top_srcdir}/build-aux/missing bison])
> -diff --git a/m4/ax_prog_cc_for_build.m4 b/m4/ax_prog_cc_for_build.m4
> -new file mode 100644
> -index 0000000..77fd346
> ---- /dev/null
> -+++ b/m4/ax_prog_cc_for_build.m4
> -@@ -0,0 +1,125 @@
> -+# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -+#   http://www.gnu.org/software/autoconf-archive/ax_prog_cc_
> for_build.html
> -+# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -+#
> -+# SYNOPSIS
> -+#
> -+#   AX_PROG_CC_FOR_BUILD
> -+#
> -+# DESCRIPTION
> -+#
> -+#   This macro searches for a C compiler that generates native
> executables,
> -+#   that is a C compiler that surely is not a cross-compiler. This can =
be
> -+#   useful if you have to generate source code at compile-time like for
> -+#   example GCC does.
> -+#
> -+#   The macro sets the CC_FOR_BUILD and CPP_FOR_BUILD macros to anythin=
g
> -+#   needed to compile or link (CC_FOR_BUILD) and preprocess
> (CPP_FOR_BUILD).
> -+#   The value of these variables can be overridden by the user by
> specifying
> -+#   a compiler with an environment variable (like you do for standard
> CC).
> -+#
> -+#   It also sets BUILD_EXEEXT and BUILD_OBJEXT to the executable and
> object
> -+#   file extensions for the build platform, and GCC_FOR_BUILD to `yes' =
if
> -+#   the compiler we found is GCC. All these variables but GCC_FOR_BUILD
> are
> -+#   substituted in the Makefile.
> -+#
> -+# LICENSE
> -+#
> -+#   Copyright (c) 2008 Paolo Bonzini <bonzini@gnu.org>
> -+#
> -+#   Copying and distribution of this file, with or without modification=
,
> are
> -+#   permitted in any medium without royalty provided the copyright noti=
ce
> -+#   and this notice are preserved. This file is offered as-is, without
> any
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
> -       scan.l \
> -       $(COMMON_SOURCES)
> -
> -+if CROSS
> -+stage1flex_LDADD =3D
> -+stage1flex_SOURCES +=3D \
> -+                    ../lib/malloc.c \
> -+                    ../lib/realloc.c \
> -+                    ../lib/reallocarray.c
> -+stage1flex_LINK =3D $(LIBTOOL) --tag=3DCC --mode=3Dlink $(CC_FOR_BUILD)=
 \
> -+                $(CFLAGS_FOR_BUILD) $(LDFLAGS_FOR_BUILD) -o $@
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
> -
> - flex_SOURCES =3D \
> -       $(COMMON_SOURCES)
> ---
> -2.8.1
> diff --git a/meta/recipes-devtools/flex/flex/do_not_create_pdf_doc.patch
> b/meta/recipes-devtools/flex/flex/do_not_create_pdf_doc.patch
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
> +--- flex-2.5.37.orig/doc/Makefile.am   2012-07-21 04:18:27.000000000
> +0300
> ++++ flex-2.5.37/doc/Makefile.am        2013-07-30 17:57:09.834834531 +03=
00
> +@@ -2,7 +2,7 @@
> +
> + info_TEXINFOS =3D       flex.texi
> + dist_man_MANS =3D flex.1
> +-dist_doc_DATA=3D flex.pdf
> ++EXTRA_DIST=3D flex.pdf
> +
> + CLEANFILES =3D \
> +       flex.hks \
> diff --git a/meta/recipes-devtools/flex/flex_2.6.2.bb
> b/meta/recipes-devtools/flex/flex_2.6.0.bb
> similarity index 84%
> rename from meta/recipes-devtools/flex/flex_2.6.2.bb
> rename to meta/recipes-devtools/flex/flex_2.6.0.bb
> index 1780cabbff..ab35b09f99 100644
> --- a/meta/recipes-devtools/flex/flex_2.6.2.bb
> +++ b/meta/recipes-devtools/flex/flex_2.6.0.bb
> @@ -6,20 +6,21 @@ SECTION =3D "devel"
>  LICENSE =3D "BSD"
>
>  DEPENDS =3D "${@bb.utils.contains('PTEST_ENABLED', '1', 'bison-native
> flex-native', '', d)}"
> -
>  BBCLASSEXTEND =3D "native nativesdk"
>
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De4742cf92e89040b39486a6219b68=
067"
>
> -SRC_URI =3D "https://github.com/westes/flex/releases/download/v${PV}/
> flex-${PV}.tar.gz \
> -           file://crosscompile.patch;apply=3D1 \
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/flex/flex-${PV}.tar.bz2 \
>             file://run-ptest \
> +           file://do_not_create_pdf_doc.patch \
>             file://0001-tests-add-a-target-for-building-tests-without-run=
nin.patch
> \
> +           file://0002-avoid-c-comments-in-c-code-fails-with-gcc-6.patch
> \
> +           file://CVE-2016-6354.patch \
>             ${@bb.utils.contains('PTEST_ENABLED', '1', '',
> 'file://disable-tests.patch', d)} \
>             "
>
> -SRC_URI[md5sum] =3D "cc6d76c333db7653d5caf423a3335239"
> -SRC_URI[sha256sum] =3D "9a01437a1155c799b7dc2508620564
> ef806ba66250c36bf5f9034b1c207cb2c9"
> +SRC_URI[md5sum] =3D "266270f13c48ed043d95648075084d59"
> +SRC_URI[sha256sum] =3D "24e611ef5a4703a191012f80c1027d
> c9d12555183ce0ecd46f3636e587e9b8e9"
>
>  # Flex has moved to github from 2.6.1 onwards
>  UPSTREAM_CHECK_URI =3D "https://github.com/westes/flex/releases"
> --
> 2.11.0.rc1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11491ce43c7f3305494cef00
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This was already sent to ML 2 weeks ago:<div><a href=3D"ht=
tp://lists.openembedded.org/pipermail/openembedded-core/2017-February/13258=
4.html">http://lists.openembedded.org/pipermail/openembedded-core/2017-Febr=
uary/132584.html</a><br></div><div><br></div><div>discussed few times since=
 it was upgraded</div><div><br></div><div>and I was pinging Ross about it f=
ew days ago as well, hopefully it will be included before pyro is branched.=
</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Fr=
i, Feb 24, 2017 at 9:51 PM, Mark Hatle <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:mark.hatle@windriver.com" target=3D"_blank">mark.hatle@windriver.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">This reverts commit 3=
632abd01abb8dfff230e18f828af7<wbr>05da488f97.<br>
<br>
The commit upgraded flex and changed the way it was constructed.=C2=A0 Ther=
e<br>
is a problem with either the upgrade or changes in construction mechanism<b=
r>
resulting in problems similar to:<br>
<br>
../cil/src/cil_lexer.lo: In function `cil_lexer_setup&#39;:<br>
cil_lexer.c:(.text+0x1737): undefined reference to `yy_scan_buffer&#39;<br>
../cil/src/cil_lexer.lo: In function `cil_lexer_destroy&#39;:<br>
cil_lexer.c:(.text+0x1773): undefined reference to `yylex_destroy&#39;<br>
<br>
Effectively the yy_scan_buffer and yylex_destroy (in this example) were<br>
defined in a header, but were not defined in the resulting generated code.<=
br>
<br>
The snippet above was from libsepol-native from the meta-selinux layer.<br>
The build was performed on a Fedora 24 system.<br>
<br>
Reverting that commit resolves the problem.<br>
<br>
Signed-off-by: Mark Hatle &lt;<a href=3D"mailto:mark.hatle@windriver.com">m=
ark.hatle@windriver.com</a>&gt;<br>
---<br>
=C2=A0...oid-c-comments-in-c-code-<wbr>fails-with-gcc-6.patch |=C2=A0 64 ++=
++++<br>
=C2=A0.../recipes-devtools/flex/<wbr>flex/CVE-2016-6354.patch |=C2=A0 59 ++=
++++<br>
=C2=A0meta/recipes-devtools/flex/<wbr>flex/crosscompile.patch | 214 -------=
--------------<br>
=C2=A0.../flex/flex/do_not_create_<wbr>pdf_doc.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 17 ++<br>
=C2=A0.../flex/{<a href=3D"http://flex_2.6.2.bb" rel=3D"noreferrer" target=
=3D"_blank">flex_2.6.2.bb</a> =3D&gt; <a href=3D"http://flex_2.6.0.bb" rel=
=3D"noreferrer" target=3D"_blank">flex_2.6.0.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 11 +-<br>
=C2=A05 files changed, 146 insertions(+), 219 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-devtools/flex/<wbr>flex/0002-avoid-c-=
comments-in-<wbr>c-code-fails-with-gcc-6.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/flex/<wbr>flex/CVE-2016-6354=
.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/flex/<wbr>flex/crosscompile.=
patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/flex/<wbr>flex/do_not_create=
_pdf_doc.<wbr>patch<br>
=C2=A0rename meta/recipes-devtools/flex/{<a href=3D"http://flex_2.6.2.bb" r=
el=3D"noreferrer" target=3D"_blank">fl<wbr>ex_2.6.2.bb</a> =3D&gt; <a href=
=3D"http://flex_2.6.0.bb" rel=3D"noreferrer" target=3D"_blank">flex_2.6.0.b=
b</a>} (84%)<br>
<br>
diff --git a/meta/recipes-devtools/flex/<wbr>flex/0002-avoid-c-comments-in-=
<wbr>c-code-fails-with-gcc-6.patch b/meta/recipes-devtools/flex/<wbr>flex/0=
002-avoid-c-comments-in-<wbr>c-code-fails-with-gcc-6.patch<br>
new file mode 100644<br>
index 0000000000..438ca5f527<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/flex/<wbr>flex/0002-avoid-c-comments-in-<wbr>c-=
code-fails-with-gcc-6.patch<br>
@@ -0,0 +1,64 @@<br>
+From 7072befe1397af4eb01c3ff7edf99f<wbr>0cd5076089 Mon Sep 17 00:00:00 200=
1<br>
+From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3D<wbr>BCller?=3D &lt;<a href=3D"mail=
to:schnitzeltony@googlemail.com">schnitzeltony@googlemail.com</a>&gt;<br>
+Date: Tue, 30 Aug 2016 14:25:32 +0200<br>
+Subject: [PATCH] avoid c++ comments in c-code - fails with gcc-6<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+fixes:<br>
+<br>
+| error: C++ style comments are not allowed in ISO C90<br>
+| num_to_alloc =3D 1; // After all that talk, this was set to 1 anyways...=
<br>
+<br>
+Upstream-Status: Pending<br>
+<br>
+Signed-off-by: Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzeltony@goo=
glemail.com">schnitzeltony@googlemail.com</a>&gt;<br>
+---<br>
+ src/flex.skl | 2 +-<br>
+ src/scan.c=C2=A0 =C2=A0| 2 +-<br>
+ src/skel.c=C2=A0 =C2=A0| 2 +-<br>
+ 3 files changed, 3 insertions(+), 3 deletions(-)<br>
+<br>
+diff --git a/src/flex.skl b/src/flex.skl<br>
+index 73a0b9e..ed71627 100644<br>
+--- a/src/flex.skl<br>
++++ b/src/flex.skl<br>
+@@ -2350,7 +2350,7 @@ void yyFlexLexer::yyensure_buffer_<wbr>stack(void)<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * scanner will eve=
n need a stack. We use 2 instead of 1 to avoid an<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * immediate reallo=
c on the next call.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 num_to_alloc =3D 1; // A=
fter all that talk, this was set to 1 anyways...<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 num_to_alloc =3D 1; /* A=
fter all that talk, this was set to 1 anyways... */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0YY_G(yy_buffer_stac=
k) =3D (struct yy_buffer_state**)yyalloc<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(num_to_alloc * sizeof(struct yy_buffer_state*)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0M4_YY_CALL_LAST_ARG);<br>
+diff --git a/src/scan.c b/src/scan.c<br>
+index b55df2d..f1dce75 100644<br>
+--- a/src/scan.c<br>
++++ b/src/scan.c<br>
+@@ -4672,7 +4672,7 @@ static void yyensure_buffer_stack (void)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * scanner will eve=
n need a stack. We use 2 instead of 1 to avoid an<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * immediate reallo=
c on the next call.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 num_to_alloc =3D 1; // A=
fter all that talk, this was set to 1 anyways...<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 num_to_alloc =3D 1; /* A=
fter all that talk, this was set to 1 anyways...*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(yy_buffer_stack) =
=3D (struct yy_buffer_state**)yyalloc<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(num_to_alloc * sizeof(struct yy_buffer_state*)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0);<br>
+diff --git a/src/skel.c b/src/skel.c<br>
+index ef657d3..26cc889 100644<br>
+--- a/src/skel.c<br>
++++ b/src/skel.c<br>
+@@ -2561,7 +2561,7 @@ const char *skel[] =3D {<br>
+=C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * scanner wil=
l even need a stack. We use 2 instead of 1 to avoid an&quot;,<br>
+=C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * immediate r=
ealloc on the next call.&quot;,<br>
+=C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/&quot;,<br>
+-=C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0num_to_alloc =3D 1;=
 // After all that talk, this was set to 1 anyways...&quot;,<br>
++=C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0num_to_alloc =3D 1;=
 /* After all that talk, this was set to 1 anyways... */&quot;,<br>
+=C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0YY_G(yy_buffer=
_stack) =3D (struct yy_buffer_state**)yyalloc&quot;,<br>
+=C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0(num_to_alloc * sizeof(struct yy_buffer_state*)&quot;,<br>
+=C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0M4_YY_CALL_LAST_ARG);&quot;,<br>
+--<br>
+2.5.5<br>
+<br>
diff --git a/meta/recipes-devtools/flex/<wbr>flex/CVE-2016-6354.patch b/met=
a/recipes-devtools/flex/<wbr>flex/CVE-2016-6354.patch<br>
new file mode 100644<br>
index 0000000000..216ac7ae1c<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/flex/<wbr>flex/CVE-2016-6354.patch<br>
@@ -0,0 +1,59 @@<br>
+From 3939eccdff598f47e5b37b05d58bf1<wbr>b44d3796e7 Mon Sep 17 00:00:00 200=
1<br>
+From: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.com">jussi=
.kukkonen@intel.com</a>&gt;<br>
+Date: Fri, 7 Oct 2016 14:15:38 +0300<br>
+Subject: [PATCH] Prevent buffer overflow in yy_get_next_buffer<br>
+<br>
+This is upstream commit a5cbe929ac3255d371e698f62dc256<wbr>afe7006466<br>
+with some additional backporting to make binutils build again.<br>
+<br>
+Upstream-Status: Backport<br>
+CVE: CVE-2016-6354<br>
+Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.c=
om">jussi.kukkonen@intel.com</a>&gt;<br>
+---<br>
+ src/flex.skl | 2 +-<br>
+ src/scan.c=C2=A0 =C2=A0| 2 +-<br>
+ src/skel.c=C2=A0 =C2=A0| 2 +-<br>
+ 3 files changed, 3 insertions(+), 3 deletions(-)<br>
+<br>
+diff --git a/src/flex.skl b/src/flex.skl<br>
+index ed71627..814d562 100644<br>
+--- a/src/flex.skl<br>
++++ b/src/flex.skl<br>
+@@ -1718,7 +1718,7 @@ int yyFlexLexer::yy_get_next_<wbr>buffer()<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 yy_size_t num_to_read =3D<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 int num_to_read =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0YY_CURRENT_BUFFER_LVALUE-&gt;yy_<wbr>buf_size - number_to_move - =
1;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while ( num_to_read=
 &lt;=3D 0 )<br>
+diff --git a/src/scan.c b/src/scan.c<br>
+index f1dce75..1949872 100644<br>
+--- a/src/scan.c<br>
++++ b/src/scan.c<br>
+@@ -4181,7 +4181,7 @@ static int yy_get_next_buffer (void)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 yy_size_t num_to_read =3D<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 int num_to_read =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0YY_CURRENT_BUFFER_LVALUE-&gt;yy_<wbr>buf_size - number_to_move - =
1;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while ( num_to_read=
 &lt;=3D 0 )<br>
+diff --git a/src/skel.c b/src/skel.c<br>
+index 26cc889..0344d18 100644<br>
+--- a/src/skel.c<br>
++++ b/src/skel.c<br>
+@@ -1929,7 +1929,7 @@ const char *skel[] =3D {<br>
+=C2=A0 =C2=A0&quot;&quot;,<br>
+=C2=A0 =C2=A0&quot;=C2=A0 =C2=A0else&quot;,<br>
+=C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;,<br>
+-=C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0yy_size_t num_to_read =3D&quot;,<br>
++=C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0int num_to_read =3D&quot;,<br>
+=C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0YY_CURRENT_BUFFER_LVALUE-&gt;yy_<wbr>buf_size - number_to_mov=
e - 1;&quot;,<br>
+=C2=A0 =C2=A0&quot;&quot;,<br>
+=C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while ( num_to=
_read &lt;=3D 0 )&quot;,<br>
+--<br>
+2.1.4<br>
+<br>
diff --git a/meta/recipes-devtools/flex/<wbr>flex/crosscompile.patch b/meta=
/recipes-devtools/flex/<wbr>flex/crosscompile.patch<br>
deleted file mode 100644<br>
index 14463d93f4..0000000000<br>
--- a/meta/recipes-devtools/flex/<wbr>flex/crosscompile.patch<br>
+++ /dev/null<br>
@@ -1,214 +0,0 @@<br>
-Add this patch from <a href=3D"https://github.com/westes/flex/pull/153" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/westes/<wbr>flex/pull=
/153</a> with minor changes<br>
-to fix cross compilation.<br>
-<br>
-Upstream-Status: Submitted<br>
-Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ro=
ss.burton@intel.com</a>&gt;<br>
-<br>
-From 52d4a3ca249be984614d9204dcc7b9<wbr>57bc04b2ac Mon Sep 17 00:00:00 200=
1<br>
-From: Alastair Hughes &lt;<a href=3D"mailto:hobbitalastair@gmail.com">hobb=
italastair@gmail.com</a>&gt;<br>
-Date: Fri, 6 Jan 2017 19:06:03 +1300<br>
-Subject: [PATCH] build: support cross compiling<br>
-<br>
-Check for cross compiling. If cross compiling, build stage1flex using a<br=
>
-custom link command.<br>
-We also override LDADD since that adds the replacement implementations<br>
-that are cross compiled, and instead always use the replacement library<br=
>
-implementations.<br>
-<br>
-We don&#39;t use BUILD_OBJEXT and BUILD_EXEEXT since it seems that automak=
e<br>
-does not support these.<br>
-<br>
-Fixes #78.<br>
-<br>
-Signed-off-by: Alastair Hughes &lt;<a href=3D"mailto:hobbitalastair@gmail.=
com">hobbitalastair@gmail.com</a>&gt;<br>
-Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ro=
ss.burton@intel.com</a>&gt;<br>
----<br>
- <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A03 ++<br>
- m4/ax_prog_cc_for_build.m4 | 125 ++++++++++++++++++++++++++++++<wbr>+++++=
++++++++++<br>
- src/Makefile.am=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 17 +++++=
+<br>
- 3 files changed, 145 insertions(+)<br>
- create mode 100644 m4/ax_prog_cc_for_build.m4<br>
-<br>
-diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
-index 901339f..2a7dce2 100644<br>
---- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-@@ -42,6 +42,7 @@ AM_GNU_GETTEXT_VERSION([0.19])<br>
- AC_PROG_YACC<br>
- AM_PROG_LEX<br>
- AC_PROG_CC<br>
-+AX_PROG_CC_FOR_BUILD<br>
- AC_PROG_CXX<br>
- AM_PROG_CC_C_O<br>
- AC_PROG_LN_S<br>
-@@ -75,6 +76,8 @@ AC_ARG_ENABLE([bootstrap],<br>
-=C2=A0 =C2=A0[], [enable_bootstrap=3Dyes])<br>
- AM_CONDITIONAL([ENABLE_<wbr>BOOTSTRAP], [test &quot;x$enable_bootstrap&qu=
ot; =3D xyes])<br>
-<br>
-+AM_CONDITIONAL([CROSS], [test &quot;x$cross_compiling&quot; =3D xyes])<br=
>
-+<br>
- AC_PATH_PROG([BISON], bison, no)<br>
- AS_IF([test &quot;$BISON&quot; !=3D no],[],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0[ AC_SUBST([BISON], [\${top_srcdir}/build-aux/<=
wbr>missing bison])<br>
-diff --git a/m4/ax_prog_cc_for_build.m4 b/m4/ax_prog_cc_for_build.m4<br>
-new file mode 100644<br>
-index 0000000..77fd346<br>
---- /dev/null<br>
-+++ b/m4/ax_prog_cc_for_build.m4<br>
-@@ -0,0 +1,125 @@<br>
-+# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D<br>
-+#=C2=A0 =C2=A0<a href=3D"http://www.gnu.org/software/autoconf-archive/ax_=
prog_cc_for_build.html" rel=3D"noreferrer" target=3D"_blank">http://www.gnu=
.org/software/<wbr>autoconf-archive/ax_prog_cc_<wbr>for_build.html</a><br>
-+# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D<br>
-+#<br>
-+# SYNOPSIS<br>
-+#<br>
-+#=C2=A0 =C2=A0AX_PROG_CC_FOR_BUILD<br>
-+#<br>
-+# DESCRIPTION<br>
-+#<br>
-+#=C2=A0 =C2=A0This macro searches for a C compiler that generates native =
executables,<br>
-+#=C2=A0 =C2=A0that is a C compiler that surely is not a cross-compiler. T=
his can be<br>
-+#=C2=A0 =C2=A0useful if you have to generate source code at compile-time =
like for<br>
-+#=C2=A0 =C2=A0example GCC does.<br>
-+#<br>
-+#=C2=A0 =C2=A0The macro sets the CC_FOR_BUILD and CPP_FOR_BUILD macros to=
 anything<br>
-+#=C2=A0 =C2=A0needed to compile or link (CC_FOR_BUILD) and preprocess (CP=
P_FOR_BUILD).<br>
-+#=C2=A0 =C2=A0The value of these variables can be overridden by the user =
by specifying<br>
-+#=C2=A0 =C2=A0a compiler with an environment variable (like you do for st=
andard CC).<br>
-+#<br>
-+#=C2=A0 =C2=A0It also sets BUILD_EXEEXT and BUILD_OBJEXT to the executabl=
e and object<br>
-+#=C2=A0 =C2=A0file extensions for the build platform, and GCC_FOR_BUILD t=
o `yes&#39; if<br>
-+#=C2=A0 =C2=A0the compiler we found is GCC. All these variables but GCC_F=
OR_BUILD are<br>
-+#=C2=A0 =C2=A0substituted in the Makefile.<br>
-+#<br>
-+# LICENSE<br>
-+#<br>
-+#=C2=A0 =C2=A0Copyright (c) 2008 Paolo Bonzini &lt;<a href=3D"mailto:bonz=
ini@gnu.org">bonzini@gnu.org</a>&gt;<br>
-+#<br>
-+#=C2=A0 =C2=A0Copying and distribution of this file, with or without modi=
fication, are<br>
-+#=C2=A0 =C2=A0permitted in any medium without royalty provided the copyri=
ght notice<br>
-+#=C2=A0 =C2=A0and this notice are preserved. This file is offered as-is, =
without any<br>
-+#=C2=A0 =C2=A0warranty.<br>
-+<br>
-+#serial 8<br>
-+<br>
-+AU_ALIAS([AC_PROG_CC_FOR_<wbr>BUILD], [AX_PROG_CC_FOR_BUILD])<br>
-+AC_DEFUN([AX_PROG_CC_FOR_<wbr>BUILD], [dnl<br>
-+AC_REQUIRE([AC_PROG_CC])dnl<br>
-+AC_REQUIRE([AC_PROG_CPP])dnl<br>
-+AC_REQUIRE([AC_EXEEXT])dnl<br>
-+AC_REQUIRE([AC_CANONICAL_<wbr>HOST])dnl<br>
-+<br>
-+dnl Use the standard macros, but make them use other variable names<br>
-+dnl<br>
-+pushdef([ac_cv_prog_CPP], ac_cv_build_prog_CPP)dnl<br>
-+pushdef([ac_cv_prog_gcc], ac_cv_build_prog_gcc)dnl<br>
-+pushdef([ac_cv_prog_cc_<wbr>works], ac_cv_build_prog_cc_works)dnl<br>
-+pushdef([ac_cv_prog_cc_<wbr>cross], ac_cv_build_prog_cc_cross)dnl<br>
-+pushdef([ac_cv_prog_cc_g], ac_cv_build_prog_cc_g)dnl<br>
-+pushdef([ac_cv_exeext], ac_cv_build_exeext)dnl<br>
-+pushdef([ac_cv_objext], ac_cv_build_objext)dnl<br>
-+pushdef([ac_exeext], ac_build_exeext)dnl<br>
-+pushdef([ac_objext], ac_build_objext)dnl<br>
-+pushdef([CC], CC_FOR_BUILD)dnl<br>
-+pushdef([CPP], CPP_FOR_BUILD)dnl<br>
-+pushdef([CFLAGS], CFLAGS_FOR_BUILD)dnl<br>
-+pushdef([CPPFLAGS], CPPFLAGS_FOR_BUILD)dnl<br>
-+pushdef([LDFLAGS], LDFLAGS_FOR_BUILD)dnl<br>
-+pushdef([host], build)dnl<br>
-+pushdef([host_alias], build_alias)dnl<br>
-+pushdef([host_cpu], build_cpu)dnl<br>
-+pushdef([host_vendor], build_vendor)dnl<br>
-+pushdef([host_os], build_os)dnl<br>
-+pushdef([ac_cv_host], ac_cv_build)dnl<br>
-+pushdef([ac_cv_host_alias], ac_cv_build_alias)dnl<br>
-+pushdef([ac_cv_host_cpu], ac_cv_build_cpu)dnl<br>
-+pushdef([ac_cv_host_vendor], ac_cv_build_vendor)dnl<br>
-+pushdef([ac_cv_host_os], ac_cv_build_os)dnl<br>
-+pushdef([ac_cpp], ac_build_cpp)dnl<br>
-+pushdef([ac_compile], ac_build_compile)dnl<br>
-+pushdef([ac_link], ac_build_link)dnl<br>
-+<br>
-+save_cross_compiling=3D$cross_<wbr>compiling<br>
-+save_ac_tool_prefix=3D$ac_<wbr>tool_prefix<br>
-+cross_compiling=3Dno<br>
-+ac_tool_prefix=3D<br>
-+<br>
-+AC_PROG_CC<br>
-+AC_PROG_CPP<br>
-+AC_EXEEXT<br>
-+<br>
-+ac_tool_prefix=3D$save_ac_<wbr>tool_prefix<br>
-+cross_compiling=3D$save_cross_<wbr>compiling<br>
-+<br>
-+dnl Restore the old definitions<br>
-+dnl<br>
-+popdef([ac_link])dnl<br>
-+popdef([ac_compile])dnl<br>
-+popdef([ac_cpp])dnl<br>
-+popdef([ac_cv_host_os])dnl<br>
-+popdef([ac_cv_host_vendor])<wbr>dnl<br>
-+popdef([ac_cv_host_cpu])dnl<br>
-+popdef([ac_cv_host_alias])<wbr>dnl<br>
-+popdef([ac_cv_host])dnl<br>
-+popdef([host_os])dnl<br>
-+popdef([host_vendor])dnl<br>
-+popdef([host_cpu])dnl<br>
-+popdef([host_alias])dnl<br>
-+popdef([host])dnl<br>
-+popdef([LDFLAGS])dnl<br>
-+popdef([CPPFLAGS])dnl<br>
-+popdef([CFLAGS])dnl<br>
-+popdef([CPP])dnl<br>
-+popdef([CC])dnl<br>
-+popdef([ac_objext])dnl<br>
-+popdef([ac_exeext])dnl<br>
-+popdef([ac_cv_objext])dnl<br>
-+popdef([ac_cv_exeext])dnl<br>
-+popdef([ac_cv_prog_cc_g])dnl<br>
-+popdef([ac_cv_prog_cc_cross]<wbr>)dnl<br>
-+popdef([ac_cv_prog_cc_works]<wbr>)dnl<br>
-+popdef([ac_cv_prog_gcc])dnl<br>
-+popdef([ac_cv_prog_CPP])dnl<br>
-+<br>
-+dnl Finally, set Makefile variables<br>
-+dnl<br>
-+BUILD_EXEEXT=3D$ac_build_<wbr>exeext<br>
-+BUILD_OBJEXT=3D$ac_build_<wbr>objext<br>
-+AC_SUBST(BUILD_EXEEXT)dnl<br>
-+AC_SUBST(BUILD_OBJEXT)dnl<br>
-+AC_SUBST([CFLAGS_FOR_BUILD])<wbr>dnl<br>
-+AC_SUBST([CPPFLAGS_FOR_<wbr>BUILD])dnl<br>
-+AC_SUBST([LDFLAGS_FOR_BUILD]<wbr>)dnl<br>
-+])<br>
-diff --git a/src/Makefile.am b/src/Makefile.am<br>
-index 3b5e362..05fe8d3 100644<br>
---- a/src/Makefile.am<br>
-+++ b/src/Makefile.am<br>
-@@ -22,7 +22,24 @@ stage1flex_SOURCES =3D \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0scan.l \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(COMMON_SOURCES)<br>
-<br>
-+if CROSS<br>
-+stage1flex_LDADD =3D<br>
-+stage1flex_SOURCES +=3D \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ../=
lib/malloc.c \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ../=
lib/realloc.c \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ../=
lib/reallocarray.c<br>
-+stage1flex_LINK =3D $(LIBTOOL) --tag=3DCC --mode=3Dlink $(CC_FOR_BUILD) \=
<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(CFLAGS_FOR_BUIL=
D) $(LDFLAGS_FOR_BUILD) -o $@<br>
-+<br>
-+$(stage1flex_OBJECTS): CC=3D$(CC_FOR_BUILD)<br>
-+$(stage1flex_OBJECTS): CFLAGS=3D$(CFLAGS_FOR_BUILD)<br>
-+$(stage1flex_OBJECTS): CPP=3D$(CPP_FOR_BUILD)<br>
-+$(stage1flex_OBJECTS): CPPFLAGS=3D$(CPPFLAGS_FOR_BUILD)<br>
-+$(stage1flex_OBJECTS): LDFLAGS=3D$(LDFLAGS_FOR_BUILD)<br>
-+else<br>
- stage1flex_CFLAGS =3D $(AM_CFLAGS)<br>
-+stage1flex_LINK =3D $(LINK)<br>
-+endif<br>
-<br>
- flex_SOURCES =3D \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(COMMON_SOURCES)<br>
---<br>
-2.8.1<br>
diff --git a/meta/recipes-devtools/flex/<wbr>flex/do_not_create_pdf_doc.<wb=
r>patch b/meta/recipes-devtools/flex/<wbr>flex/do_not_create_pdf_doc.<wbr>p=
atch<br>
new file mode 100644<br>
index 0000000000..032833ae7a<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/flex/<wbr>flex/do_not_create_pdf_doc.<wbr>patch=
<br>
@@ -0,0 +1,17 @@<br>
+Upstream-Status: Inappropriate (embedded specific)<br>
+<br>
+Signed-off-by: Laurentiu Palcu &lt;<a href=3D"mailto:laurentiu.palcu@intel=
.com">laurentiu.palcu@intel.com</a>&gt;<br>
+<br>
+Index: flex-2.5.37/doc/Makefile.am<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- flex-2.5.37.orig/doc/Makefile.<wbr>am=C2=A0 =C2=A02012-07-21 04:18:27.=
000000000 +0300<br>
++++ flex-2.5.37/doc/Makefile.am=C2=A0 =C2=A0 =C2=A0 =C2=A0 2013-07-30 17:5=
7:09.834834531 +0300<br>
+@@ -2,7 +2,7 @@<br>
+<br>
+ info_TEXINFOS =3D=C2=A0 =C2=A0 =C2=A0 =C2=A0flex.texi<br>
+ dist_man_MANS =3D flex.1<br>
+-dist_doc_DATA=3D flex.pdf<br>
++EXTRA_DIST=3D flex.pdf<br>
+<br>
+ CLEANFILES =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0flex.hks \<br>
diff --git a/meta/recipes-devtools/flex/<a href=3D"http://flex_2.6.2.bb" re=
l=3D"noreferrer" target=3D"_blank">f<wbr>lex_2.6.2.bb</a> b/meta/recipes-de=
vtools/flex/<a href=3D"http://flex_2.6.0.bb" rel=3D"noreferrer" target=3D"_=
blank">f<wbr>lex_2.6.0.bb</a><br>
similarity index 84%<br>
rename from meta/recipes-devtools/flex/<a href=3D"http://flex_2.6.2.bb" rel=
=3D"noreferrer" target=3D"_blank">fle<wbr>x_2.6.2.bb</a><br>
rename to meta/recipes-devtools/flex/<a href=3D"http://flex_2.6.0.bb" rel=
=3D"noreferrer" target=3D"_blank">fle<wbr>x_2.6.0.bb</a><br>
index 1780cabbff..ab35b09f99 100644<br>
--- a/meta/recipes-devtools/flex/<a href=3D"http://flex_2.6.2.bb" rel=3D"no=
referrer" target=3D"_blank">f<wbr>lex_2.6.2.bb</a><br>
+++ b/meta/recipes-devtools/flex/<a href=3D"http://flex_2.6.0.bb" rel=3D"no=
referrer" target=3D"_blank">f<wbr>lex_2.6.0.bb</a><br>
@@ -6,20 +6,21 @@ SECTION =3D &quot;devel&quot;<br>
=C2=A0LICENSE =3D &quot;BSD&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;${@bb.utils.contains(&#39;PTEST_<wbr>ENABLED&#39;, =
&#39;1&#39;, &#39;bison-native flex-native&#39;, &#39;&#39;, d)}&quot;<br>
-<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>e4742cf92e89040b=
39486a6219b680<wbr>67&quot;<br>
<br>
-SRC_URI =3D &quot;<a href=3D"https://github.com/westes/flex/releases/downl=
oad/v${PV}/flex-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">https://=
github.com/westes/<wbr>flex/releases/download/v${PV}/<wbr>flex-${PV}.tar.gz=
</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://crosscompile.patch;<wbr>ap=
ply=3D1 \<br>
+SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/flex/<wbr>flex-${PV}.tar.bz2 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://do_not_create_pdf_doc.<wbr=
>patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-tests-add-a-<wbr>targ=
et-for-building-tests-<wbr>without-runnin.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-avoid-c-comments-<wbr=
>in-c-code-fails-with-gcc-6.<wbr>patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2016-6354.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;PTEST_<=
wbr>ENABLED&#39;, &#39;1&#39;, &#39;&#39;, &#39;file://disable-tests.patch&=
#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;<wbr>cc6d76c333db7653d5caf423a33352<wbr>39&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>9a01437a1155c799b7dc2508620564<wbr>ef806=
ba66250c36bf5f9034b1c207c<wbr>b2c9&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>266270f13c48ed043d95648075084d<wbr>59&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>24e611ef5a4703a191012f80c1027d<wbr>c9d12=
555183ce0ecd46f3636e587e9<wbr>b8e9&quot;<br>
<br>
=C2=A0# Flex has moved to github from 2.6.1 onwards<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/westes/fle=
x/releases" rel=3D"noreferrer" target=3D"_blank">https://github.com/westes/=
<wbr>flex/releases</a>&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.11.0.rc1<br>
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

--001a11491ce43c7f3305494cef00--
