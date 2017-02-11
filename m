Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9FAF471DEE
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Feb 2017 02:17:13 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id 96so4351325uaq.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 18:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=m/BKzvjJHU+wipm6H+4sEwKCGFFo0VyqG7pBI1VTuyc=;
	b=pun5s72OpTI+m2Jp5SAFgtTRQQL1BJRPisfGN6gwYqS8Kblt1ybXLYhx2eZM+EQ52i
	f191LCAfFVgJl5IQwHV61LQS5roP0Iq2WM6dpLPURWggWXksF0Y2/C/J0I8szl3ay5sN
	ivsbyaDg9oJ31A26snChe8UQAnbZ50ZS6DIASLI60D+BR81Lr7H+3qYyvlim8k9yptPc
	XffaWy2qyZlBwX399E8Jdx86mmB/cH5DuvayXMIzr9tRycVXC96vT/ACbtw9puYNJ6GP
	7dxiaAy97YwtUs27OltEE8+1MxMJMRnyobshKdZW14H2huPNpdGTSNKqcn8OcdkJhKmL
	RDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=m/BKzvjJHU+wipm6H+4sEwKCGFFo0VyqG7pBI1VTuyc=;
	b=EzF7kNT01kta57fSXWWPNvhtRHo27XAx73GUFGUYhxezOMKkwLiAaVv5eaKdH/dENa
	VDpWh9iTyA0xrvvqrW8SWeFP2KRGuUvPp0odcp8MY2kG07u1KfpWldBTkco+m+g5Uskr
	zMVvk9zees66apzTX4A23YaAFHx7DWy8ECaWHW1nc1UdmbJZnLCyLs+pQ0ZUrgZHUzwj
	/j3ukIZ7ID03sWBQdUbp5C9uC84Qnhk2XzHfOdRrQOnR+j1jLdJhPwt8IeJxNPCucSLN
	eLr/UG2Hfh7t6giVCaKDr40/2BUvwyHss0D/u4nKm4sAPMMelNb+lUt1UoskISeOeuDm
	lfwA==
X-Gm-Message-State: AMke39kEeH9oRM/Uqr9kw7SBukn4QM7kCNi5VySAZQgIDQKIVn07sINjhbse1k/hGQAy0qwT+vh1+ambBqRzAA==
X-Received: by 10.176.90.199 with SMTP id x7mr6131965uae.165.1486779433089;
	Fri, 10 Feb 2017 18:17:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.222 with HTTP; Fri, 10 Feb 2017 18:16:42 -0800 (PST)
In-Reply-To: <20170210212218.GD3021@jama>
References: <20170210201308.30616-1-twoerner@gmail.com>
	<20170210212218.GD3021@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 10 Feb 2017 18:16:42 -0800
Message-ID: <CAMKF1sryvmFYzMfa61mndmeMgpkK8FhZXiAOUhLOdLVOqDk_qQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
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
X-List-Received-Date: Sat, 11 Feb 2017 02:17:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 10, 2017 at 1:22 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Fri, Feb 10, 2017 at 03:13:08PM -0500, Trevor Woerner wrote:
>> This reverts commit 3632abd01abb8dfff230e18f828af705da488f97.
>>
>> Multiple people have expressed issues with flex-2.6.2; personally I had
>> problems compiling libsepol from meta-selinux (for libselinux). I tried
>> upgrading to flex-2.6.3, but that caused binutils-cross_2.27 to fail.
>>
>> The simplest for now is to downgrade to flex-2.6.0.
>
> Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

>
>> ---
>>  ...oid-c-comments-in-c-code-fails-with-gcc-6.patch |  64 ++++++
>>  .../recipes-devtools/flex/flex/CVE-2016-6354.patch |  59 ++++++
>>  meta/recipes-devtools/flex/flex/crosscompile.patch | 214 --------------=
-------
>>  .../flex/flex/do_not_create_pdf_doc.patch          |  17 ++
>>  .../flex/{flex_2.6.2.bb =3D> flex_2.6.0.bb}          |  11 +-
>>  5 files changed, 146 insertions(+), 219 deletions(-)
>>  create mode 100644 meta/recipes-devtools/flex/flex/0002-avoid-c-comment=
s-in-c-code-fails-with-gcc-6.patch
>>  create mode 100644 meta/recipes-devtools/flex/flex/CVE-2016-6354.patch
>>  delete mode 100644 meta/recipes-devtools/flex/flex/crosscompile.patch
>>  create mode 100644 meta/recipes-devtools/flex/flex/do_not_create_pdf_do=
c.patch
>>  rename meta/recipes-devtools/flex/{flex_2.6.2.bb =3D> flex_2.6.0.bb} (8=
4%)
>>
>> diff --git a/meta/recipes-devtools/flex/flex/0002-avoid-c-comments-in-c-=
code-fails-with-gcc-6.patch b/meta/recipes-devtools/flex/flex/0002-avoid-c-=
comments-in-c-code-fails-with-gcc-6.patch
>> new file mode 100644
>> index 0000000000..438ca5f527
>> --- /dev/null
>> +++ b/meta/recipes-devtools/flex/flex/0002-avoid-c-comments-in-c-code-fa=
ils-with-gcc-6.patch
>> @@ -0,0 +1,64 @@
>> +From 7072befe1397af4eb01c3ff7edf99f0cd5076089 Mon Sep 17 00:00:00 2001
>> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@google=
mail.com>
>> +Date: Tue, 30 Aug 2016 14:25:32 +0200
>> +Subject: [PATCH] avoid c++ comments in c-code - fails with gcc-6
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=3DUTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +fixes:
>> +
>> +| error: C++ style comments are not allowed in ISO C90
>> +| num_to_alloc =3D 1; // After all that talk, this was set to 1 anyways=
...
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> +---
>> + src/flex.skl | 2 +-
>> + src/scan.c   | 2 +-
>> + src/skel.c   | 2 +-
>> + 3 files changed, 3 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/src/flex.skl b/src/flex.skl
>> +index 73a0b9e..ed71627 100644
>> +--- a/src/flex.skl
>> ++++ b/src/flex.skl
>> +@@ -2350,7 +2350,7 @@ void yyFlexLexer::yyensure_buffer_stack(void)
>> +              * scanner will even need a stack. We use 2 instead of 1 t=
o avoid an
>> +              * immediate realloc on the next call.
>> +          */
>> +-            num_to_alloc =3D 1; // After all that talk, this was set t=
o 1 anyways...
>> ++            num_to_alloc =3D 1; /* After all that talk, this was set t=
o 1 anyways... */
>> +             YY_G(yy_buffer_stack) =3D (struct yy_buffer_state**)yyallo=
c
>> +                                                             (num_to_al=
loc * sizeof(struct yy_buffer_state*)
>> +                                                             M4_YY_CALL=
_LAST_ARG);
>> +diff --git a/src/scan.c b/src/scan.c
>> +index b55df2d..f1dce75 100644
>> +--- a/src/scan.c
>> ++++ b/src/scan.c
>> +@@ -4672,7 +4672,7 @@ static void yyensure_buffer_stack (void)
>> +              * scanner will even need a stack. We use 2 instead of 1 t=
o avoid an
>> +              * immediate realloc on the next call.
>> +          */
>> +-            num_to_alloc =3D 1; // After all that talk, this was set t=
o 1 anyways...
>> ++            num_to_alloc =3D 1; /* After all that talk, this was set t=
o 1 anyways...*/
>> +             (yy_buffer_stack) =3D (struct yy_buffer_state**)yyalloc
>> +                                                             (num_to_al=
loc * sizeof(struct yy_buffer_state*)
>> +                                                             );
>> +diff --git a/src/skel.c b/src/skel.c
>> +index ef657d3..26cc889 100644
>> +--- a/src/skel.c
>> ++++ b/src/skel.c
>> +@@ -2561,7 +2561,7 @@ const char *skel[] =3D {
>> +   "          * scanner will even need a stack. We use 2 instead of 1 t=
o avoid an",
>> +   "          * immediate realloc on the next call.",
>> +   "         */",
>> +-  "         num_to_alloc =3D 1; // After all that talk, this was set t=
o 1 anyways...",
>> ++  "         num_to_alloc =3D 1; /* After all that talk, this was set t=
o 1 anyways... */",
>> +   "         YY_G(yy_buffer_stack) =3D (struct yy_buffer_state**)yyallo=
c",
>> +   "                                                         (num_to_al=
loc * sizeof(struct yy_buffer_state*)",
>> +   "                                                         M4_YY_CALL=
_LAST_ARG);",
>> +--
>> +2.5.5
>> +
>> diff --git a/meta/recipes-devtools/flex/flex/CVE-2016-6354.patch b/meta/=
recipes-devtools/flex/flex/CVE-2016-6354.patch
>> new file mode 100644
>> index 0000000000..216ac7ae1c
>> --- /dev/null
>> +++ b/meta/recipes-devtools/flex/flex/CVE-2016-6354.patch
>> @@ -0,0 +1,59 @@
>> +From 3939eccdff598f47e5b37b05d58bf1b44d3796e7 Mon Sep 17 00:00:00 2001
>> +From: Jussi Kukkonen <jussi.kukkonen@intel.com>
>> +Date: Fri, 7 Oct 2016 14:15:38 +0300
>> +Subject: [PATCH] Prevent buffer overflow in yy_get_next_buffer
>> +
>> +This is upstream commit a5cbe929ac3255d371e698f62dc256afe7006466
>> +with some additional backporting to make binutils build again.
>> +
>> +Upstream-Status: Backport
>> +CVE: CVE-2016-6354
>> +Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
>> +---
>> + src/flex.skl | 2 +-
>> + src/scan.c   | 2 +-
>> + src/skel.c   | 2 +-
>> + 3 files changed, 3 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/src/flex.skl b/src/flex.skl
>> +index ed71627..814d562 100644
>> +--- a/src/flex.skl
>> ++++ b/src/flex.skl
>> +@@ -1718,7 +1718,7 @@ int yyFlexLexer::yy_get_next_buffer()
>> +
>> +     else
>> +             {
>> +-                    yy_size_t num_to_read =3D
>> ++                    int num_to_read =3D
>> +                     YY_CURRENT_BUFFER_LVALUE->yy_buf_size - number_to_=
move - 1;
>> +
>> +             while ( num_to_read <=3D 0 )
>> +diff --git a/src/scan.c b/src/scan.c
>> +index f1dce75..1949872 100644
>> +--- a/src/scan.c
>> ++++ b/src/scan.c
>> +@@ -4181,7 +4181,7 @@ static int yy_get_next_buffer (void)
>> +
>> +     else
>> +             {
>> +-                    yy_size_t num_to_read =3D
>> ++                    int num_to_read =3D
>> +                     YY_CURRENT_BUFFER_LVALUE->yy_buf_size - number_to_=
move - 1;
>> +
>> +             while ( num_to_read <=3D 0 )
>> +diff --git a/src/skel.c b/src/skel.c
>> +index 26cc889..0344d18 100644
>> +--- a/src/skel.c
>> ++++ b/src/skel.c
>> +@@ -1929,7 +1929,7 @@ const char *skel[] =3D {
>> +   "",
>> +   " else",
>> +   "         {",
>> +-  "                 yy_size_t num_to_read =3D",
>> ++  "                 int num_to_read =3D",
>> +   "                 YY_CURRENT_BUFFER_LVALUE->yy_buf_size - number_to_=
move - 1;",
>> +   "",
>> +   "         while ( num_to_read <=3D 0 )",
>> +--
>> +2.1.4
>> +
>> diff --git a/meta/recipes-devtools/flex/flex/crosscompile.patch b/meta/r=
ecipes-devtools/flex/flex/crosscompile.patch
>> deleted file mode 100644
>> index 14463d93f4..0000000000
>> --- a/meta/recipes-devtools/flex/flex/crosscompile.patch
>> +++ /dev/null
>> @@ -1,214 +0,0 @@
>> -Add this patch from https://github.com/westes/flex/pull/153 with minor =
changes
>> -to fix cross compilation.
>> -
>> -Upstream-Status: Submitted
>> -Signed-off-by: Ross Burton <ross.burton@intel.com>
>> -
>> -From 52d4a3ca249be984614d9204dcc7b957bc04b2ac Mon Sep 17 00:00:00 2001
>> -From: Alastair Hughes <hobbitalastair@gmail.com>
>> -Date: Fri, 6 Jan 2017 19:06:03 +1300
>> -Subject: [PATCH] build: support cross compiling
>> -
>> -Check for cross compiling. If cross compiling, build stage1flex using a
>> -custom link command.
>> -We also override LDADD since that adds the replacement implementations
>> -that are cross compiled, and instead always use the replacement library
>> -implementations.
>> -
>> -We don't use BUILD_OBJEXT and BUILD_EXEEXT since it seems that automake
>> -does not support these.
>> -
>> -Fixes #78.
>> -
>> -Signed-off-by: Alastair Hughes <hobbitalastair@gmail.com>
>> -Signed-off-by: Ross Burton <ross.burton@intel.com>
>> ----
>> - configure.ac               |   3 ++
>> - m4/ax_prog_cc_for_build.m4 | 125 +++++++++++++++++++++++++++++++++++++=
++++++++
>> - src/Makefile.am            |  17 ++++++
>> - 3 files changed, 145 insertions(+)
>> - create mode 100644 m4/ax_prog_cc_for_build.m4
>> -
>> -diff --git a/configure.ac b/configure.ac
>> -index 901339f..2a7dce2 100644
>> ---- a/configure.ac
>> -+++ b/configure.ac
>> -@@ -42,6 +42,7 @@ AM_GNU_GETTEXT_VERSION([0.19])
>> - AC_PROG_YACC
>> - AM_PROG_LEX
>> - AC_PROG_CC
>> -+AX_PROG_CC_FOR_BUILD
>> - AC_PROG_CXX
>> - AM_PROG_CC_C_O
>> - AC_PROG_LN_S
>> -@@ -75,6 +76,8 @@ AC_ARG_ENABLE([bootstrap],
>> -   [], [enable_bootstrap=3Dyes])
>> - AM_CONDITIONAL([ENABLE_BOOTSTRAP], [test "x$enable_bootstrap" =3D xyes=
])
>> -
>> -+AM_CONDITIONAL([CROSS], [test "x$cross_compiling" =3D xyes])
>> -+
>> - AC_PATH_PROG([BISON], bison, no)
>> - AS_IF([test "$BISON" !=3D no],[],
>> -     [ AC_SUBST([BISON], [\${top_srcdir}/build-aux/missing bison])
>> -diff --git a/m4/ax_prog_cc_for_build.m4 b/m4/ax_prog_cc_for_build.m4
>> -new file mode 100644
>> -index 0000000..77fd346
>> ---- /dev/null
>> -+++ b/m4/ax_prog_cc_for_build.m4
>> -@@ -0,0 +1,125 @@
>> -+# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>> -+#   http://www.gnu.org/software/autoconf-archive/ax_prog_cc_for_build.=
html
>> -+# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>> -+#
>> -+# SYNOPSIS
>> -+#
>> -+#   AX_PROG_CC_FOR_BUILD
>> -+#
>> -+# DESCRIPTION
>> -+#
>> -+#   This macro searches for a C compiler that generates native executa=
bles,
>> -+#   that is a C compiler that surely is not a cross-compiler. This can=
 be
>> -+#   useful if you have to generate source code at compile-time like fo=
r
>> -+#   example GCC does.
>> -+#
>> -+#   The macro sets the CC_FOR_BUILD and CPP_FOR_BUILD macros to anythi=
ng
>> -+#   needed to compile or link (CC_FOR_BUILD) and preprocess (CPP_FOR_B=
UILD).
>> -+#   The value of these variables can be overridden by the user by spec=
ifying
>> -+#   a compiler with an environment variable (like you do for standard =
CC).
>> -+#
>> -+#   It also sets BUILD_EXEEXT and BUILD_OBJEXT to the executable and o=
bject
>> -+#   file extensions for the build platform, and GCC_FOR_BUILD to `yes'=
 if
>> -+#   the compiler we found is GCC. All these variables but GCC_FOR_BUIL=
D are
>> -+#   substituted in the Makefile.
>> -+#
>> -+# LICENSE
>> -+#
>> -+#   Copyright (c) 2008 Paolo Bonzini <bonzini@gnu.org>
>> -+#
>> -+#   Copying and distribution of this file, with or without modificatio=
n, are
>> -+#   permitted in any medium without royalty provided the copyright not=
ice
>> -+#   and this notice are preserved. This file is offered as-is, without=
 any
>> -+#   warranty.
>> -+
>> -+#serial 8
>> -+
>> -+AU_ALIAS([AC_PROG_CC_FOR_BUILD], [AX_PROG_CC_FOR_BUILD])
>> -+AC_DEFUN([AX_PROG_CC_FOR_BUILD], [dnl
>> -+AC_REQUIRE([AC_PROG_CC])dnl
>> -+AC_REQUIRE([AC_PROG_CPP])dnl
>> -+AC_REQUIRE([AC_EXEEXT])dnl
>> -+AC_REQUIRE([AC_CANONICAL_HOST])dnl
>> -+
>> -+dnl Use the standard macros, but make them use other variable names
>> -+dnl
>> -+pushdef([ac_cv_prog_CPP], ac_cv_build_prog_CPP)dnl
>> -+pushdef([ac_cv_prog_gcc], ac_cv_build_prog_gcc)dnl
>> -+pushdef([ac_cv_prog_cc_works], ac_cv_build_prog_cc_works)dnl
>> -+pushdef([ac_cv_prog_cc_cross], ac_cv_build_prog_cc_cross)dnl
>> -+pushdef([ac_cv_prog_cc_g], ac_cv_build_prog_cc_g)dnl
>> -+pushdef([ac_cv_exeext], ac_cv_build_exeext)dnl
>> -+pushdef([ac_cv_objext], ac_cv_build_objext)dnl
>> -+pushdef([ac_exeext], ac_build_exeext)dnl
>> -+pushdef([ac_objext], ac_build_objext)dnl
>> -+pushdef([CC], CC_FOR_BUILD)dnl
>> -+pushdef([CPP], CPP_FOR_BUILD)dnl
>> -+pushdef([CFLAGS], CFLAGS_FOR_BUILD)dnl
>> -+pushdef([CPPFLAGS], CPPFLAGS_FOR_BUILD)dnl
>> -+pushdef([LDFLAGS], LDFLAGS_FOR_BUILD)dnl
>> -+pushdef([host], build)dnl
>> -+pushdef([host_alias], build_alias)dnl
>> -+pushdef([host_cpu], build_cpu)dnl
>> -+pushdef([host_vendor], build_vendor)dnl
>> -+pushdef([host_os], build_os)dnl
>> -+pushdef([ac_cv_host], ac_cv_build)dnl
>> -+pushdef([ac_cv_host_alias], ac_cv_build_alias)dnl
>> -+pushdef([ac_cv_host_cpu], ac_cv_build_cpu)dnl
>> -+pushdef([ac_cv_host_vendor], ac_cv_build_vendor)dnl
>> -+pushdef([ac_cv_host_os], ac_cv_build_os)dnl
>> -+pushdef([ac_cpp], ac_build_cpp)dnl
>> -+pushdef([ac_compile], ac_build_compile)dnl
>> -+pushdef([ac_link], ac_build_link)dnl
>> -+
>> -+save_cross_compiling=3D$cross_compiling
>> -+save_ac_tool_prefix=3D$ac_tool_prefix
>> -+cross_compiling=3Dno
>> -+ac_tool_prefix=3D
>> -+
>> -+AC_PROG_CC
>> -+AC_PROG_CPP
>> -+AC_EXEEXT
>> -+
>> -+ac_tool_prefix=3D$save_ac_tool_prefix
>> -+cross_compiling=3D$save_cross_compiling
>> -+
>> -+dnl Restore the old definitions
>> -+dnl
>> -+popdef([ac_link])dnl
>> -+popdef([ac_compile])dnl
>> -+popdef([ac_cpp])dnl
>> -+popdef([ac_cv_host_os])dnl
>> -+popdef([ac_cv_host_vendor])dnl
>> -+popdef([ac_cv_host_cpu])dnl
>> -+popdef([ac_cv_host_alias])dnl
>> -+popdef([ac_cv_host])dnl
>> -+popdef([host_os])dnl
>> -+popdef([host_vendor])dnl
>> -+popdef([host_cpu])dnl
>> -+popdef([host_alias])dnl
>> -+popdef([host])dnl
>> -+popdef([LDFLAGS])dnl
>> -+popdef([CPPFLAGS])dnl
>> -+popdef([CFLAGS])dnl
>> -+popdef([CPP])dnl
>> -+popdef([CC])dnl
>> -+popdef([ac_objext])dnl
>> -+popdef([ac_exeext])dnl
>> -+popdef([ac_cv_objext])dnl
>> -+popdef([ac_cv_exeext])dnl
>> -+popdef([ac_cv_prog_cc_g])dnl
>> -+popdef([ac_cv_prog_cc_cross])dnl
>> -+popdef([ac_cv_prog_cc_works])dnl
>> -+popdef([ac_cv_prog_gcc])dnl
>> -+popdef([ac_cv_prog_CPP])dnl
>> -+
>> -+dnl Finally, set Makefile variables
>> -+dnl
>> -+BUILD_EXEEXT=3D$ac_build_exeext
>> -+BUILD_OBJEXT=3D$ac_build_objext
>> -+AC_SUBST(BUILD_EXEEXT)dnl
>> -+AC_SUBST(BUILD_OBJEXT)dnl
>> -+AC_SUBST([CFLAGS_FOR_BUILD])dnl
>> -+AC_SUBST([CPPFLAGS_FOR_BUILD])dnl
>> -+AC_SUBST([LDFLAGS_FOR_BUILD])dnl
>> -+])
>> -diff --git a/src/Makefile.am b/src/Makefile.am
>> -index 3b5e362..05fe8d3 100644
>> ---- a/src/Makefile.am
>> -+++ b/src/Makefile.am
>> -@@ -22,7 +22,24 @@ stage1flex_SOURCES =3D \
>> -     scan.l \
>> -     $(COMMON_SOURCES)
>> -
>> -+if CROSS
>> -+stage1flex_LDADD =3D
>> -+stage1flex_SOURCES +=3D \
>> -+                  ../lib/malloc.c \
>> -+                  ../lib/realloc.c \
>> -+                  ../lib/reallocarray.c
>> -+stage1flex_LINK =3D $(LIBTOOL) --tag=3DCC --mode=3Dlink $(CC_FOR_BUILD=
) \
>> -+              $(CFLAGS_FOR_BUILD) $(LDFLAGS_FOR_BUILD) -o $@
>> -+
>> -+$(stage1flex_OBJECTS): CC=3D$(CC_FOR_BUILD)
>> -+$(stage1flex_OBJECTS): CFLAGS=3D$(CFLAGS_FOR_BUILD)
>> -+$(stage1flex_OBJECTS): CPP=3D$(CPP_FOR_BUILD)
>> -+$(stage1flex_OBJECTS): CPPFLAGS=3D$(CPPFLAGS_FOR_BUILD)
>> -+$(stage1flex_OBJECTS): LDFLAGS=3D$(LDFLAGS_FOR_BUILD)
>> -+else
>> - stage1flex_CFLAGS =3D $(AM_CFLAGS)
>> -+stage1flex_LINK =3D $(LINK)
>> -+endif
>> -
>> - flex_SOURCES =3D \
>> -     $(COMMON_SOURCES)
>> ---
>> -2.8.1
>> diff --git a/meta/recipes-devtools/flex/flex/do_not_create_pdf_doc.patch=
 b/meta/recipes-devtools/flex/flex/do_not_create_pdf_doc.patch
>> new file mode 100644
>> index 0000000000..032833ae7a
>> --- /dev/null
>> +++ b/meta/recipes-devtools/flex/flex/do_not_create_pdf_doc.patch
>> @@ -0,0 +1,17 @@
>> +Upstream-Status: Inappropriate (embedded specific)
>> +
>> +Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
>> +
>> +Index: flex-2.5.37/doc/Makefile.am
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- flex-2.5.37.orig/doc/Makefile.am 2012-07-21 04:18:27.000000000 +030=
0
>> ++++ flex-2.5.37/doc/Makefile.am      2013-07-30 17:57:09.834834531 +030=
0
>> +@@ -2,7 +2,7 @@
>> +
>> + info_TEXINFOS =3D     flex.texi
>> + dist_man_MANS =3D flex.1
>> +-dist_doc_DATA=3D flex.pdf
>> ++EXTRA_DIST=3D flex.pdf
>> +
>> + CLEANFILES =3D \
>> +     flex.hks \
>> diff --git a/meta/recipes-devtools/flex/flex_2.6.2.bb b/meta/recipes-dev=
tools/flex/flex_2.6.0.bb
>> similarity index 84%
>> rename from meta/recipes-devtools/flex/flex_2.6.2.bb
>> rename to meta/recipes-devtools/flex/flex_2.6.0.bb
>> index 1780cabbff..ab35b09f99 100644
>> --- a/meta/recipes-devtools/flex/flex_2.6.2.bb
>> +++ b/meta/recipes-devtools/flex/flex_2.6.0.bb
>> @@ -6,20 +6,21 @@ SECTION =3D "devel"
>>  LICENSE =3D "BSD"
>>
>>  DEPENDS =3D "${@bb.utils.contains('PTEST_ENABLED', '1', 'bison-native f=
lex-native', '', d)}"
>> -
>>  BBCLASSEXTEND =3D "native nativesdk"
>>
>>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De4742cf92e89040b39486a6219b6=
8067"
>>
>> -SRC_URI =3D "https://github.com/westes/flex/releases/download/v${PV}/fl=
ex-${PV}.tar.gz \
>> -           file://crosscompile.patch;apply=3D1 \
>> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/flex/flex-${PV}.tar.bz2 \
>>             file://run-ptest \
>> +           file://do_not_create_pdf_doc.patch \
>>             file://0001-tests-add-a-target-for-building-tests-without-ru=
nnin.patch \
>> +           file://0002-avoid-c-comments-in-c-code-fails-with-gcc-6.patc=
h \
>> +           file://CVE-2016-6354.patch \
>>             ${@bb.utils.contains('PTEST_ENABLED', '1', '', 'file://disab=
le-tests.patch', d)} \
>>             "
>>
>> -SRC_URI[md5sum] =3D "cc6d76c333db7653d5caf423a3335239"
>> -SRC_URI[sha256sum] =3D "9a01437a1155c799b7dc2508620564ef806ba66250c36bf=
5f9034b1c207cb2c9"
>> +SRC_URI[md5sum] =3D "266270f13c48ed043d95648075084d59"
>> +SRC_URI[sha256sum] =3D "24e611ef5a4703a191012f80c1027dc9d12555183ce0ecd=
46f3636e587e9b8e9"
>>
>>  # Flex has moved to github from 2.6.1 onwards
>>  UPSTREAM_CHECK_URI =3D "https://github.com/westes/flex/releases"
>> --
>> 2.11.0.258.ge05806d
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

