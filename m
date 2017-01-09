Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 0B9136FF56
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 15:59:45 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id c85so102281656wmi.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jan 2017 07:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=fAVz5MCX230PgwNHqhaRHlzhD7hle3xaxbK1CT3YjpU=;
	b=Z/yrGa9ALnKe3D5atj+JuQ/c3hYdcGOS8JDEHbuD4DwTe+nZxnISnYqEhoijN3gab9
	fO+jz8si8PFewlSub9NLGKHic88EWIJknneTKGgo3+Kt8RXRKtIU1yzDvT23H/kVp/fh
	TVvUSj3Om2gPYeA0xo0tkr8vfdTL+r9S4x4oxWOPFY5grcqItMghLsNzsh7fri3kdyeL
	8/JiMzn3PdEPHXYk+ypABlXv3Bn8yvCblmu7cIDofmHOnD8LEk2roOlV16nVWsW/Sfzj
	OCOKyoYzyjVbhzquHaRPMHEBLQqRTOX+sHHdxgRJH5FkCH5PYkNDe+S91qB0wMNnKhwi
	q9tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=fAVz5MCX230PgwNHqhaRHlzhD7hle3xaxbK1CT3YjpU=;
	b=bQ3SRXaTpXfKqe40DC7FmacWTZjN2Niy0JBvAjDyF1TRFugxIqTWEYq8iGsqNGH4vb
	qUcFKgdwckmRuPklG6eQZ/bhq+rvrbWAyLhkwwIlGvchG6r4Ev3I7NCZmRnp/osTAjK0
	LtW10sLJmAbFcyiId/fPRe84RHzI0VQO4UKw57cB/xtXXac6LyTEtcAOt5Gz+4LDK+Td
	++Hn2Mcaq1yQfKSztvB3SE72bGews7eV+KPVGSKDi16GPj9EyB0merE0ple2pBcU7b2n
	Bu8S2AsJyzkjIa0wLAOhOLXnBoTHRVEA4Q/DGSSzgDHo0f24rOXjh2K2/VF0g8Xbje2A
	AGNg==
X-Gm-Message-State: AIkVDXJvkpO//jqW6Usj2E2iMwxfKlgzaoavULJJT/waV7S4b7rN5KUyY/Tz067tRVk1jvTi
X-Received: by 10.223.154.132 with SMTP id a4mr256326wrc.188.1483977585324;
	Mon, 09 Jan 2017 07:59:45 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	jv8sm28678694wjc.32.2017.01.09.07.59.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 Jan 2017 07:59:44 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jan 2017 15:59:40 +0000
Message-Id: <1483977580-11236-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] flex: upgrade to 2.6.2
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
X-List-Received-Date: Mon, 09 Jan 2017 15:59:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Patches dropped as they are merged upstream:
- CVE-2016-6354.patch
- 0002-avoid-c-comments-in-c-code-fails-with-gcc-6.patch
- do_not_create_pdf_doc.patch

Apply a patch from github to simplify cross-compilation and not need a
flex-native to bootstrap.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...oid-c-comments-in-c-code-fails-with-gcc-6.patch |  64 ------
 .../recipes-devtools/flex/flex/CVE-2016-6354.patch |  59 ------
 meta/recipes-devtools/flex/flex/crosscompile.patch | 214 +++++++++++++++++++++
 .../flex/flex/do_not_create_pdf_doc.patch          |  17 --
 .../flex/{flex_2.6.0.bb => flex_2.6.2.bb}          |  11 +-
 5 files changed, 219 insertions(+), 146 deletions(-)
 delete mode 100644 meta/recipes-devtools/flex/flex/0002-avoid-c-comments-in-c-code-fails-with-gcc-6.patch
 delete mode 100644 meta/recipes-devtools/flex/flex/CVE-2016-6354.patch
 create mode 100644 meta/recipes-devtools/flex/flex/crosscompile.patch
 delete mode 100644 meta/recipes-devtools/flex/flex/do_not_create_pdf_doc.patch
 rename meta/recipes-devtools/flex/{flex_2.6.0.bb => flex_2.6.2.bb} (84%)

diff --git a/meta/recipes-devtools/flex/flex/0002-avoid-c-comments-in-c-code-fails-with-gcc-6.patch b/meta/recipes-devtools/flex/flex/0002-avoid-c-comments-in-c-code-fails-with-gcc-6.patch
deleted file mode 100644
index 438ca5f..0000000
--- a/meta/recipes-devtools/flex/flex/0002-avoid-c-comments-in-c-code-fails-with-gcc-6.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 7072befe1397af4eb01c3ff7edf99f0cd5076089 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Tue, 30 Aug 2016 14:25:32 +0200
-Subject: [PATCH] avoid c++ comments in c-code - fails with gcc-6
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-fixes:
-
-| error: C++ style comments are not allowed in ISO C90
-| num_to_alloc = 1; // After all that talk, this was set to 1 anyways...
-
-Upstream-Status: Pending
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- src/flex.skl | 2 +-
- src/scan.c   | 2 +-
- src/skel.c   | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/flex.skl b/src/flex.skl
-index 73a0b9e..ed71627 100644
---- a/src/flex.skl
-+++ b/src/flex.skl
-@@ -2350,7 +2350,7 @@ void yyFlexLexer::yyensure_buffer_stack(void)
- 		 * scanner will even need a stack. We use 2 instead of 1 to avoid an
- 		 * immediate realloc on the next call.
-          */
--		num_to_alloc = 1; // After all that talk, this was set to 1 anyways...
-+		num_to_alloc = 1; /* After all that talk, this was set to 1 anyways... */
- 		YY_G(yy_buffer_stack) = (struct yy_buffer_state**)yyalloc
- 								(num_to_alloc * sizeof(struct yy_buffer_state*)
- 								M4_YY_CALL_LAST_ARG);
-diff --git a/src/scan.c b/src/scan.c
-index b55df2d..f1dce75 100644
---- a/src/scan.c
-+++ b/src/scan.c
-@@ -4672,7 +4672,7 @@ static void yyensure_buffer_stack (void)
- 		 * scanner will even need a stack. We use 2 instead of 1 to avoid an
- 		 * immediate realloc on the next call.
-          */
--		num_to_alloc = 1; // After all that talk, this was set to 1 anyways...
-+		num_to_alloc = 1; /* After all that talk, this was set to 1 anyways...*/
- 		(yy_buffer_stack) = (struct yy_buffer_state**)yyalloc
- 								(num_to_alloc * sizeof(struct yy_buffer_state*)
- 								);
-diff --git a/src/skel.c b/src/skel.c
-index ef657d3..26cc889 100644
---- a/src/skel.c
-+++ b/src/skel.c
-@@ -2561,7 +2561,7 @@ const char *skel[] = {
-   "		 * scanner will even need a stack. We use 2 instead of 1 to avoid an",
-   "		 * immediate realloc on the next call.",
-   "         */",
--  "		num_to_alloc = 1; // After all that talk, this was set to 1 anyways...",
-+  "		num_to_alloc = 1; /* After all that talk, this was set to 1 anyways... */",
-   "		YY_G(yy_buffer_stack) = (struct yy_buffer_state**)yyalloc",
-   "								(num_to_alloc * sizeof(struct yy_buffer_state*)",
-   "								M4_YY_CALL_LAST_ARG);",
--- 
-2.5.5
-
diff --git a/meta/recipes-devtools/flex/flex/CVE-2016-6354.patch b/meta/recipes-devtools/flex/flex/CVE-2016-6354.patch
deleted file mode 100644
index 216ac7a..0000000
--- a/meta/recipes-devtools/flex/flex/CVE-2016-6354.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 3939eccdff598f47e5b37b05d58bf1b44d3796e7 Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Fri, 7 Oct 2016 14:15:38 +0300
-Subject: [PATCH] Prevent buffer overflow in yy_get_next_buffer
-
-This is upstream commit a5cbe929ac3255d371e698f62dc256afe7006466
-with some additional backporting to make binutils build again.
-
-Upstream-Status: Backport
-CVE: CVE-2016-6354
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
----
- src/flex.skl | 2 +-
- src/scan.c   | 2 +-
- src/skel.c   | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/flex.skl b/src/flex.skl
-index ed71627..814d562 100644
---- a/src/flex.skl
-+++ b/src/flex.skl
-@@ -1718,7 +1718,7 @@ int yyFlexLexer::yy_get_next_buffer()
- 
- 	else
- 		{
--			yy_size_t num_to_read =
-+			int num_to_read =
- 			YY_CURRENT_BUFFER_LVALUE->yy_buf_size - number_to_move - 1;
- 
- 		while ( num_to_read <= 0 )
-diff --git a/src/scan.c b/src/scan.c
-index f1dce75..1949872 100644
---- a/src/scan.c
-+++ b/src/scan.c
-@@ -4181,7 +4181,7 @@ static int yy_get_next_buffer (void)
- 
- 	else
- 		{
--			yy_size_t num_to_read =
-+			int num_to_read =
- 			YY_CURRENT_BUFFER_LVALUE->yy_buf_size - number_to_move - 1;
- 
- 		while ( num_to_read <= 0 )
-diff --git a/src/skel.c b/src/skel.c
-index 26cc889..0344d18 100644
---- a/src/skel.c
-+++ b/src/skel.c
-@@ -1929,7 +1929,7 @@ const char *skel[] = {
-   "",
-   "	else",
-   "		{",
--  "			yy_size_t num_to_read =",
-+  "			int num_to_read =",
-   "			YY_CURRENT_BUFFER_LVALUE->yy_buf_size - number_to_move - 1;",
-   "",
-   "		while ( num_to_read <= 0 )",
--- 
-2.1.4
-
diff --git a/meta/recipes-devtools/flex/flex/crosscompile.patch b/meta/recipes-devtools/flex/flex/crosscompile.patch
new file mode 100644
index 0000000..14463d9
--- /dev/null
+++ b/meta/recipes-devtools/flex/flex/crosscompile.patch
@@ -0,0 +1,214 @@
+Add this patch from https://github.com/westes/flex/pull/153 with minor changes
+to fix cross compilation.
+
+Upstream-Status: Submitted
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 52d4a3ca249be984614d9204dcc7b957bc04b2ac Mon Sep 17 00:00:00 2001
+From: Alastair Hughes <hobbitalastair@gmail.com>
+Date: Fri, 6 Jan 2017 19:06:03 +1300
+Subject: [PATCH] build: support cross compiling
+
+Check for cross compiling. If cross compiling, build stage1flex using a
+custom link command.
+We also override LDADD since that adds the replacement implementations
+that are cross compiled, and instead always use the replacement library
+implementations.
+
+We don't use BUILD_OBJEXT and BUILD_EXEEXT since it seems that automake
+does not support these.
+
+Fixes #78.
+
+Signed-off-by: Alastair Hughes <hobbitalastair@gmail.com>
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+---
+ configure.ac               |   3 ++
+ m4/ax_prog_cc_for_build.m4 | 125 +++++++++++++++++++++++++++++++++++++++++++++
+ src/Makefile.am            |  17 ++++++
+ 3 files changed, 145 insertions(+)
+ create mode 100644 m4/ax_prog_cc_for_build.m4
+
+diff --git a/configure.ac b/configure.ac
+index 901339f..2a7dce2 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -42,6 +42,7 @@ AM_GNU_GETTEXT_VERSION([0.19])
+ AC_PROG_YACC
+ AM_PROG_LEX
+ AC_PROG_CC
++AX_PROG_CC_FOR_BUILD
+ AC_PROG_CXX
+ AM_PROG_CC_C_O
+ AC_PROG_LN_S
+@@ -75,6 +76,8 @@ AC_ARG_ENABLE([bootstrap],
+   [], [enable_bootstrap=yes])
+ AM_CONDITIONAL([ENABLE_BOOTSTRAP], [test "x$enable_bootstrap" = xyes])
+ 
++AM_CONDITIONAL([CROSS], [test "x$cross_compiling" = xyes])
++
+ AC_PATH_PROG([BISON], bison, no)
+ AS_IF([test "$BISON" != no],[],
+ 	[ AC_SUBST([BISON], [\${top_srcdir}/build-aux/missing bison])
+diff --git a/m4/ax_prog_cc_for_build.m4 b/m4/ax_prog_cc_for_build.m4
+new file mode 100644
+index 0000000..77fd346
+--- /dev/null
++++ b/m4/ax_prog_cc_for_build.m4
+@@ -0,0 +1,125 @@
++# ===========================================================================
++#   http://www.gnu.org/software/autoconf-archive/ax_prog_cc_for_build.html
++# ===========================================================================
++#
++# SYNOPSIS
++#
++#   AX_PROG_CC_FOR_BUILD
++#
++# DESCRIPTION
++#
++#   This macro searches for a C compiler that generates native executables,
++#   that is a C compiler that surely is not a cross-compiler. This can be
++#   useful if you have to generate source code at compile-time like for
++#   example GCC does.
++#
++#   The macro sets the CC_FOR_BUILD and CPP_FOR_BUILD macros to anything
++#   needed to compile or link (CC_FOR_BUILD) and preprocess (CPP_FOR_BUILD).
++#   The value of these variables can be overridden by the user by specifying
++#   a compiler with an environment variable (like you do for standard CC).
++#
++#   It also sets BUILD_EXEEXT and BUILD_OBJEXT to the executable and object
++#   file extensions for the build platform, and GCC_FOR_BUILD to `yes' if
++#   the compiler we found is GCC. All these variables but GCC_FOR_BUILD are
++#   substituted in the Makefile.
++#
++# LICENSE
++#
++#   Copyright (c) 2008 Paolo Bonzini <bonzini@gnu.org>
++#
++#   Copying and distribution of this file, with or without modification, are
++#   permitted in any medium without royalty provided the copyright notice
++#   and this notice are preserved. This file is offered as-is, without any
++#   warranty.
++
++#serial 8
++
++AU_ALIAS([AC_PROG_CC_FOR_BUILD], [AX_PROG_CC_FOR_BUILD])
++AC_DEFUN([AX_PROG_CC_FOR_BUILD], [dnl
++AC_REQUIRE([AC_PROG_CC])dnl
++AC_REQUIRE([AC_PROG_CPP])dnl
++AC_REQUIRE([AC_EXEEXT])dnl
++AC_REQUIRE([AC_CANONICAL_HOST])dnl
++
++dnl Use the standard macros, but make them use other variable names
++dnl
++pushdef([ac_cv_prog_CPP], ac_cv_build_prog_CPP)dnl
++pushdef([ac_cv_prog_gcc], ac_cv_build_prog_gcc)dnl
++pushdef([ac_cv_prog_cc_works], ac_cv_build_prog_cc_works)dnl
++pushdef([ac_cv_prog_cc_cross], ac_cv_build_prog_cc_cross)dnl
++pushdef([ac_cv_prog_cc_g], ac_cv_build_prog_cc_g)dnl
++pushdef([ac_cv_exeext], ac_cv_build_exeext)dnl
++pushdef([ac_cv_objext], ac_cv_build_objext)dnl
++pushdef([ac_exeext], ac_build_exeext)dnl
++pushdef([ac_objext], ac_build_objext)dnl
++pushdef([CC], CC_FOR_BUILD)dnl
++pushdef([CPP], CPP_FOR_BUILD)dnl
++pushdef([CFLAGS], CFLAGS_FOR_BUILD)dnl
++pushdef([CPPFLAGS], CPPFLAGS_FOR_BUILD)dnl
++pushdef([LDFLAGS], LDFLAGS_FOR_BUILD)dnl
++pushdef([host], build)dnl
++pushdef([host_alias], build_alias)dnl
++pushdef([host_cpu], build_cpu)dnl
++pushdef([host_vendor], build_vendor)dnl
++pushdef([host_os], build_os)dnl
++pushdef([ac_cv_host], ac_cv_build)dnl
++pushdef([ac_cv_host_alias], ac_cv_build_alias)dnl
++pushdef([ac_cv_host_cpu], ac_cv_build_cpu)dnl
++pushdef([ac_cv_host_vendor], ac_cv_build_vendor)dnl
++pushdef([ac_cv_host_os], ac_cv_build_os)dnl
++pushdef([ac_cpp], ac_build_cpp)dnl
++pushdef([ac_compile], ac_build_compile)dnl
++pushdef([ac_link], ac_build_link)dnl
++
++save_cross_compiling=$cross_compiling
++save_ac_tool_prefix=$ac_tool_prefix
++cross_compiling=no
++ac_tool_prefix=
++
++AC_PROG_CC
++AC_PROG_CPP
++AC_EXEEXT
++
++ac_tool_prefix=$save_ac_tool_prefix
++cross_compiling=$save_cross_compiling
++
++dnl Restore the old definitions
++dnl
++popdef([ac_link])dnl
++popdef([ac_compile])dnl
++popdef([ac_cpp])dnl
++popdef([ac_cv_host_os])dnl
++popdef([ac_cv_host_vendor])dnl
++popdef([ac_cv_host_cpu])dnl
++popdef([ac_cv_host_alias])dnl
++popdef([ac_cv_host])dnl
++popdef([host_os])dnl
++popdef([host_vendor])dnl
++popdef([host_cpu])dnl
++popdef([host_alias])dnl
++popdef([host])dnl
++popdef([LDFLAGS])dnl
++popdef([CPPFLAGS])dnl
++popdef([CFLAGS])dnl
++popdef([CPP])dnl
++popdef([CC])dnl
++popdef([ac_objext])dnl
++popdef([ac_exeext])dnl
++popdef([ac_cv_objext])dnl
++popdef([ac_cv_exeext])dnl
++popdef([ac_cv_prog_cc_g])dnl
++popdef([ac_cv_prog_cc_cross])dnl
++popdef([ac_cv_prog_cc_works])dnl
++popdef([ac_cv_prog_gcc])dnl
++popdef([ac_cv_prog_CPP])dnl
++
++dnl Finally, set Makefile variables
++dnl
++BUILD_EXEEXT=$ac_build_exeext
++BUILD_OBJEXT=$ac_build_objext
++AC_SUBST(BUILD_EXEEXT)dnl
++AC_SUBST(BUILD_OBJEXT)dnl
++AC_SUBST([CFLAGS_FOR_BUILD])dnl
++AC_SUBST([CPPFLAGS_FOR_BUILD])dnl
++AC_SUBST([LDFLAGS_FOR_BUILD])dnl
++])
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 3b5e362..05fe8d3 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -22,7 +22,24 @@ stage1flex_SOURCES = \
+ 	scan.l \
+ 	$(COMMON_SOURCES)
+ 
++if CROSS
++stage1flex_LDADD =
++stage1flex_SOURCES += \
++		      ../lib/malloc.c \
++		      ../lib/realloc.c \
++		      ../lib/reallocarray.c
++stage1flex_LINK = $(LIBTOOL) --tag=CC --mode=link $(CC_FOR_BUILD) \
++		  $(CFLAGS_FOR_BUILD) $(LDFLAGS_FOR_BUILD) -o $@
++
++$(stage1flex_OBJECTS): CC=$(CC_FOR_BUILD)
++$(stage1flex_OBJECTS): CFLAGS=$(CFLAGS_FOR_BUILD)
++$(stage1flex_OBJECTS): CPP=$(CPP_FOR_BUILD)
++$(stage1flex_OBJECTS): CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
++$(stage1flex_OBJECTS): LDFLAGS=$(LDFLAGS_FOR_BUILD)
++else
+ stage1flex_CFLAGS = $(AM_CFLAGS)
++stage1flex_LINK = $(LINK)
++endif
+ 
+ flex_SOURCES = \
+ 	$(COMMON_SOURCES)
+-- 
+2.8.1
diff --git a/meta/recipes-devtools/flex/flex/do_not_create_pdf_doc.patch b/meta/recipes-devtools/flex/flex/do_not_create_pdf_doc.patch
deleted file mode 100644
index 032833ae..0000000
--- a/meta/recipes-devtools/flex/flex/do_not_create_pdf_doc.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Upstream-Status: Inappropriate (embedded specific)
-
-Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
-
-Index: flex-2.5.37/doc/Makefile.am
-===================================================================
---- flex-2.5.37.orig/doc/Makefile.am	2012-07-21 04:18:27.000000000 +0300
-+++ flex-2.5.37/doc/Makefile.am	2013-07-30 17:57:09.834834531 +0300
-@@ -2,7 +2,7 @@
- 
- info_TEXINFOS =	flex.texi
- dist_man_MANS = flex.1
--dist_doc_DATA= flex.pdf
-+EXTRA_DIST= flex.pdf
- 
- CLEANFILES = \
- 	flex.hks \
diff --git a/meta/recipes-devtools/flex/flex_2.6.0.bb b/meta/recipes-devtools/flex/flex_2.6.2.bb
similarity index 84%
rename from meta/recipes-devtools/flex/flex_2.6.0.bb
rename to meta/recipes-devtools/flex/flex_2.6.2.bb
index ab35b09..1780cab 100644
--- a/meta/recipes-devtools/flex/flex_2.6.0.bb
+++ b/meta/recipes-devtools/flex/flex_2.6.2.bb
@@ -6,21 +6,20 @@ SECTION = "devel"
 LICENSE = "BSD"
 
 DEPENDS = "${@bb.utils.contains('PTEST_ENABLED', '1', 'bison-native flex-native', '', d)}"
+
 BBCLASSEXTEND = "native nativesdk"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e4742cf92e89040b39486a6219b68067"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/flex/flex-${PV}.tar.bz2 \
+SRC_URI = "https://github.com/westes/flex/releases/download/v${PV}/flex-${PV}.tar.gz \
+           file://crosscompile.patch;apply=1 \
            file://run-ptest \
-           file://do_not_create_pdf_doc.patch \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
-           file://0002-avoid-c-comments-in-c-code-fails-with-gcc-6.patch \
-           file://CVE-2016-6354.patch \
            ${@bb.utils.contains('PTEST_ENABLED', '1', '', 'file://disable-tests.patch', d)} \
            "
 
-SRC_URI[md5sum] = "266270f13c48ed043d95648075084d59"
-SRC_URI[sha256sum] = "24e611ef5a4703a191012f80c1027dc9d12555183ce0ecd46f3636e587e9b8e9"
+SRC_URI[md5sum] = "cc6d76c333db7653d5caf423a3335239"
+SRC_URI[sha256sum] = "9a01437a1155c799b7dc2508620564ef806ba66250c36bf5f9034b1c207cb2c9"
 
 # Flex has moved to github from 2.6.1 onwards
 UPSTREAM_CHECK_URI = "https://github.com/westes/flex/releases"
-- 
2.8.1


