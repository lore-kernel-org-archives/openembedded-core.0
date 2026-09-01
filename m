Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3D1AC61DD3
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 17:37:48 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.545.1788284262005421624
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 10:37:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Ccj4KVB+;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AF51D1A1936;
	Tue,  1 Sep 2026 17:37:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 754F56053C;
	Tue,  1 Sep 2026 17:37:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D17A911C79289;
	Tue,  1 Sep 2026 19:37:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788284254; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=SR26/cutfMM3QuwsqmQ0PO45BLcZ1lsqt9tfyZmy6KU=;
	b=Ccj4KVB+sijX2tJ1QHJ69cYZJKCnEMvcUYFtrlPGYGVX+eRgLQFZ/sTtVA6KVvJvkzmDlo
	IRIBugxhuenFSk/Zi5iTbJay1Ikebdk4Z90VYqNZkB7V+cyKOPpeaENjr5tirPCx6J5iP9
	PQqSvxqDljxwPev2tuNEYSv5F85pdScUeyYrzFTAmiaiEiZZlUS3YLmrP9Bnl83OkkbV4C
	Zkx80tC2A1iTq/AYxAHTwVcuwyh6rbP39tVvb3ct76C/rChbYCvz92JbwlOceGD1vJrMVX
	Ds+xfh8esUn6bi+m2b74avJ7uiGfjm0QGELtohvLiuW/yLXGZOjIyPwkAF9+2w==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Tue, 01 Sep 2026 19:37:27 +0200
Subject: [PATCH] nasm: update 3.01 -> 3.02
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-mathieu-updates-2026-09-01-v1-1-83836408428c@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAFYNl2oC/x3MSQqAMBAF0atIr22I4hSvIi6C+dFeOJCoCOLdj
 S6LB3VTgBcEapObPE4Jsi4xsjShYTLLCBYbm3KVV0qrjGezT4KDj82aHYE/YKU5UmMLoK6MdqW
 jONg8nFz/vOuf5wVxHTdobAAAAA==
X-Change-ID: 20260901-mathieu-updates-2026-09-01-8d4ee76a9f5f
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 Joshua Watt <JPEWhacker@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788284252; l=22563;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=JrOEaGKZBx/ZInaJU1YeojVkTJqkSKK1bE/dUhlORMc=;
 b=zI9sqt9aiSStum1AFLOFzhRtANGINjCjdOO0mBfXdPk1CJaRYZBx+YnLpiDetPjTSYaGnwIs+
 MOdAqL4EXnJA6JolaxPD7M0GNtHKrW9Yj+TrP9rzMwj5S7zmsHINcNU
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 17:37:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244840

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
I did not use the "--debug-prefix-map" patch from current nasm branch of
Joshua, as we had reproducibility issues with its current state. I just
fixed the previous patch for 3.02 instead.
---
 .../0001-compiler.h-Backport-C23-support.patch     |  96 -----------
 .../nasm/nasm/0001-stdlib-Add-strlcat.patch        |  39 +++--
 .../nasm/0002-Add-debug-prefix-map-option.patch    | 176 ++++++++++++++-------
 .../nasm/{nasm_3.01.bb => nasm_3.02.bb}            |   3 +-
 4 files changed, 139 insertions(+), 175 deletions(-)

diff --git a/meta/recipes-devtools/nasm/nasm/0001-compiler.h-Backport-C23-support.patch b/meta/recipes-devtools/nasm/nasm/0001-compiler.h-Backport-C23-support.patch
deleted file mode 100644
index e1820870dd19..000000000000
--- a/meta/recipes-devtools/nasm/nasm/0001-compiler.h-Backport-C23-support.patch
+++ /dev/null
@@ -1,96 +0,0 @@
-From e402e82d34569b4642ffbb3344c7240d1ea07776 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 9 Dec 2025 17:17:36 -0800
-Subject: [PATCH] compiler.h: Backport C23 support
-
-These is a collection of changes done to compiler.h post
-3.01 release. It fixes build with non-glibc ( musl )
-builds especially with clang compiler which is more
-fussy
-
-Brings in squashed changed for compiler.h from
-
-https://github.com/netwide-assembler/nasm/commit/44e89ba9b650b5e1533bca43682e167f51a3511f
-https://github.com/netwide-assembler/nasm/commit/746e7c9efa37cec9a44d84a1e96b8c38f385cc1f
-https://github.com/netwide-assembler/nasm/commit/44ec97993a28ba109f98c4514e27cef813720399#diff-8e3e9367147ea2bbe07af8d84c1e07f80f5e19ca23282426324e396ee05947ba
-https://github.com/netwide-assembler/nasm/commit/f4f7d18c06449a1859a62a10e7e24ca644032dff#diff-8e3e9367147ea2bbe07af8d84c1e07f80f5e19ca23282426324e396ee05947ba
-
-Upstream-Status: Backport [Above patches from master branch]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- include/compiler.h | 42 ++++++++++++++++++------------------------
- 1 file changed, 18 insertions(+), 24 deletions(-)
-
---- a/include/compiler.h
-+++ b/include/compiler.h
-@@ -185,19 +185,10 @@ char * pure_func strrchrnul(const char *
- size_t strlcat(char *, const char *, size_t);
- #endif
-
--#if !defined(__cplusplus) || (__STDC_VERSION >= 202311L)
- /* C++ and C23 have bool, false, and true as proper keywords */
-+#if !defined(__cplusplus) && (__STDC_VERSION__ < 202311L)
- # ifdef HAVE_STDBOOL_H
--/* If <stdbool.h> exists, include it explicitly to prevent it from
--   begin included later, causing the "bool" macro to be defined. */
- #  include <stdbool.h>
--#  ifdef bool
--/* Force bool to be a typedef instead of a macro. What a "clever" hack
--   this is... */
--    typedef bool                /* The macro definition of bool */
--#  undef bool
--        bool;                   /* No longer the macro definition */
--#  endif
- # elif defined(HAVE___BOOL)
-    typedef _Bool bool;
- #  define false 0
-@@ -205,14 +196,10 @@ size_t strlcat(char *, const char *, siz
- # else
- /* This is a bit dangerous, because casting to this ersatz bool
-    will not produce the same result as the standard (bool) cast.
--   Instead, use the bool() constructor-style macro defined below. */
-+   Instead, use the explicit construct !!x instead of relying on
-+   implicit conversions or casts. */
- typedef enum bool { false, true } bool;
- # endif
--/* This amounts to a C++-style conversion cast to bool.  This works
--   because C ignores an argument-taking macro when used without an
--   argument and because bool was redefined as a typedef if it previously
--   was defined as a macro (see above.) */
--# define bool(x) ((bool)!!(x))
- #endif
-
- /* Create a NULL pointer of the same type as the address of
-@@ -325,11 +312,11 @@ static inline void *mempset(void *dst, i
-  * less likely to be taken.
-  */
- #ifdef HAVE___BUILTIN_EXPECT
--# define likely(x)	__builtin_expect(bool(x), true)
--# define unlikely(x)	__builtin_expect(bool(x), false)
-+# define likely(x)	__builtin_expect(!!(x), true)
-+# define unlikely(x)	__builtin_expect(!!(x), false)
- #else
--# define likely(x)	bool(x)
--# define unlikely(x)	bool(x)
-+# define likely(x)	(!!(x))
-+# define unlikely(x)	(!!(x))
- #endif
-
- #ifdef HAVE___BUILTIN_PREFETCH
-@@ -486,4 +473,15 @@ static inline unsigned int watcom_switch
- # define default case BOGUS_CASE: default
- #endif
-
-+#ifndef unreachable              /* C23 defines as a macro in <stddef.h> */
-+# ifdef HAVE___BUILTIN_UNREACHABLE
-+#  define unreachable() __builtin_unreachable()
-+# else
-+#  define unreachable() do { abort(); } while(1)
-+# endif
-+#endif
-+
-+/* This should be set from main() */
-+extern const char *_progname;
-+
- #endif	/* NASM_COMPILER_H */
diff --git a/meta/recipes-devtools/nasm/nasm/0001-stdlib-Add-strlcat.patch b/meta/recipes-devtools/nasm/nasm/0001-stdlib-Add-strlcat.patch
index 9d7474207242..6fb1b8d60934 100644
--- a/meta/recipes-devtools/nasm/nasm/0001-stdlib-Add-strlcat.patch
+++ b/meta/recipes-devtools/nasm/nasm/0001-stdlib-Add-strlcat.patch
@@ -1,4 +1,4 @@
-From 680220e772dfa381829983fa73b915416f676894 Mon Sep 17 00:00:00 2001
+From dc9a5632429a6fe279a5f86a4a2f7fa1aeb2967c Mon Sep 17 00:00:00 2001
 From: Joshua Watt <JPEWhacker@gmail.com>
 Date: Tue, 19 Nov 2019 12:47:30 -0600
 Subject: [PATCH] stdlib: Add strlcat
@@ -7,7 +7,6 @@ Adds strlcat which can be used to safely concatenate strings
 
 Upstream-Status: Submitted [https://bugzilla.nasm.us/show_bug.cgi?id=3392635]
 Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
-
 ---
  Makefile.in        |  2 +-
  configure.ac       |  2 ++
@@ -17,56 +16,56 @@ Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
  create mode 100644 stdlib/strlcat.c
 
 diff --git a/Makefile.in b/Makefile.in
-index fcf33ab..d91f7ab 100644
+index 32f1ef9e69dc..a876f330dc11 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -174,7 +174,7 @@ LIBOBJ_W = \
- # files to LIBOBJ_W, notably $(OUTPUTOBJ)
- LIBOBJ_NW = \
+@@ -148,7 +148,7 @@ ZLIBOBJ = \
+ # Common library objects
+ LIBOBJ_COM = \
  	stdlib/snprintf.$(O) stdlib/vsnprintf.$(O) stdlib/strlcpy.$(O) \
--	stdlib/strnlen.$(O) stdlib/strrchrnul.$(O) \
-+	stdlib/strnlen.$(O) stdlib/strrchrnul.$(O) stdlib/strlcat.$(O) \
+-	stdlib/strnlen.$(O) \
++	stdlib/strnlen.$(O) stdlib/strlcat.$(O) \
  	\
- 	asm/directbl.$(O) \
- 	asm/pptok.$(O) \
+ 	nasmlib/ver.$(O) \
+ 	nasmlib/alloc.$(O) nasmlib/asprintf.$(O) \
 diff --git a/configure.ac b/configure.ac
-index 448eeb2..f79c96c 100644
+index 9a584a72713a..8d4454a6f724 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -229,6 +229,7 @@ PA_FUNC_SNPRINTF
+@@ -227,6 +227,7 @@ PA_HAVE_FUNC(__builtin_unreachable,())
+ PA_FUNC_SNPRINTF
  PA_FUNC_VSNPRINTF
  AC_CHECK_FUNCS([strlcpy])
- AC_CHECK_FUNCS([strrchrnul])
 +AC_CHECK_FUNCS([strlcat])
  
  dnl These types are POSIX-specific, and Windows does it differently...
  AC_CHECK_TYPES([struct stat], [AC_CHECK_FUNCS([stat fstat])])
-@@ -246,6 +247,7 @@ AC_CHECK_DECLS(strsep)
+@@ -243,6 +244,7 @@ AC_CHECK_DECLS(strnicmp)
+ AC_CHECK_DECLS(strsep)
  AC_CHECK_DECLS(strlcpy)
  AC_CHECK_DECLS(strnlen)
- AC_CHECK_DECLS(strrchrnul)
 +AC_CHECK_DECLS(strlcat)
  
  dnl Check for missing types
  AC_TYPE_UINTMAX_T
 diff --git a/include/compiler.h b/include/compiler.h
-index 0ecd4e8..41c1cbf 100644
+index 3ba5f7c9c41d..a60377dd49b7 100644
 --- a/include/compiler.h
 +++ b/include/compiler.h
-@@ -181,6 +181,10 @@ size_t strlcpy(char *, const char *, size_t);
- char * pure_func strrchrnul(const char *, int);
+@@ -177,6 +177,10 @@ int vsnprintf(char *, size_t, const char *, va_list);
+ size_t strlcpy(char *, const char *, size_t);
  #endif
  
 +#if !defined(HAVE_STRLCAT) || !HAVE_DECL_STRLCAT
 +size_t strlcat(char *, const char *, size_t);
 +#endif
 +
- #if !defined(__cplusplus) || (__STDC_VERSION >= 202311L)
  /* C++ and C23 have bool, false, and true as proper keywords */
+ #if !defined(__cplusplus) && (__STDC_VERSION__ < 202311L)
  # ifdef HAVE_STDBOOL_H
 diff --git a/stdlib/strlcat.c b/stdlib/strlcat.c
 new file mode 100644
-index 0000000..c7cbd59
+index 000000000000..c7cbd5976335
 --- /dev/null
 +++ b/stdlib/strlcat.c
 @@ -0,0 +1,42 @@
diff --git a/meta/recipes-devtools/nasm/nasm/0002-Add-debug-prefix-map-option.patch b/meta/recipes-devtools/nasm/nasm/0002-Add-debug-prefix-map-option.patch
index f5b67fe3bb9a..8160c8d2ccf2 100644
--- a/meta/recipes-devtools/nasm/nasm/0002-Add-debug-prefix-map-option.patch
+++ b/meta/recipes-devtools/nasm/nasm/0002-Add-debug-prefix-map-option.patch
@@ -1,4 +1,4 @@
-From 10baf9f75e4e4e2fb37a579c68672141858aea5e Mon Sep 17 00:00:00 2001
+From 5729e86d57e74571f3486cb8183bd28312ccca65 Mon Sep 17 00:00:00 2001
 From: Joshua Watt <JPEWhacker@gmail.com>
 Date: Tue, 19 Nov 2019 13:12:17 -0600
 Subject: [PATCH] Add --debug-prefix-map option
@@ -7,29 +7,32 @@ Adds an option to remap file prefixes in output object files. This is
 analogous to the "-fdebug-prefix-map" option in GCC, and allows files to
 be built in a reproducible manner regardless of the build directory.
 
-Upstream-Status: Submitted [https://bugzilla.nasm.us/show_bug.cgi?id=3392635]
+Upstream-Status: Submitted [https://github.com/netwide-assembler/nasm/pull/8]
 Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
+Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
 ---
- asm/nasm.c              | 28 ++++++++++++++++++++++++++--
- include/nasmlib.h       |  9 +++++++++
+ asm/nasm.c              | 28 ++++++++++++++++++++--
+ include/nasmlib.h       |  9 +++++++
  nasm.txt                |  3 +++
- nasmlib/filename.c      | 20 ++++++++++++++++++++
- output/outas86.c        |  4 +++-
+ nasmlib/filename.c      | 53 +++++++++++++++++++++++++++++++++++++++++
+ nasmlib/path.c          | 20 ++++++++++++++++
+ output/outas86.c        |  3 ++-
  output/outcoff.c        |  4 ++--
- output/outelf.c         | 13 ++++++++-----
+ output/outelf.c         | 13 ++++++----
  output/outieee.c        |  2 +-
  output/outobj.c         |  2 +-
  stdlib/strlcat.c        |  2 +-
- test/elfdebugprefix.asm |  5 +++++
- test/performtest.pl     | 12 ++++++++++--
- 12 files changed, 89 insertions(+), 15 deletions(-)
+ test/elfdebugprefix.asm |  5 ++++
+ test/performtest.pl     | 12 ++++++++--
+ 13 files changed, 141 insertions(+), 15 deletions(-)
+ create mode 100644 nasmlib/filename.c
  create mode 100644 test/elfdebugprefix.asm
 
 diff --git a/asm/nasm.c b/asm/nasm.c
-index 49fa00e..ff117cf 100644
+index 020e1ce3f28d..3a347c4b6cc5 100644
 --- a/asm/nasm.c
 +++ b/asm/nasm.c
-@@ -913,7 +913,8 @@ enum text_options {
+@@ -1003,7 +1003,8 @@ enum text_options {
      OPT_DEBUG,
      OPT_INFO,
      OPT_REPRODUCIBLE,
@@ -39,7 +42,7 @@ index 49fa00e..ff117cf 100644
  };
  enum need_arg {
      ARG_NO,
-@@ -952,6 +953,7 @@ static const struct textargs textopts[] = {
+@@ -1042,6 +1043,7 @@ static const struct textargs textopts[] = {
      {"debug",    OPT_DEBUG, ARG_MAYBE, 0},
      {"reproducible", OPT_REPRODUCIBLE, ARG_NO, 0},
      {"bits",     OPT_BITS, ARG_YES, 0},
@@ -47,7 +50,7 @@ index 49fa00e..ff117cf 100644
      {NULL, OPT_BOGUS, ARG_NO, 0}
  };
  
-@@ -1337,6 +1339,26 @@ static bool process_arg(char *p, char *q, int pass)
+@@ -1428,6 +1430,26 @@ static bool process_arg(char *p, char *q, int pass)
                  case OPT_REPRODUCIBLE:
                      reproducible = true;
                      break;
@@ -74,7 +77,7 @@ index 49fa00e..ff117cf 100644
                  case OPT_HELP:
                      /* Allow --help topic without *requiring* topic */
                      if (!param)
-@@ -2428,7 +2450,9 @@ static void help(FILE *out, const char *what)
+@@ -2105,7 +2127,9 @@ static void help(FILE *out, const char *what)
                  "    -w+x           enable warning x %s(also -Wx)\n"
                  "    -w-x           disable warning x (also -Wno-x)\n"
                  "    -w[+-]error    promote all warnings to errors (also -Werror)\n"
@@ -86,10 +89,10 @@ index 49fa00e..ff117cf 100644
      }
      if (help_is(with, 'w')) {
 diff --git a/include/nasmlib.h b/include/nasmlib.h
-index ed4222b..aafbf00 100644
+index 529fb0660416..eab11b78bfc0 100644
 --- a/include/nasmlib.h
 +++ b/include/nasmlib.h
-@@ -334,10 +334,19 @@ static inline const char *nasm_digit_chars(bool ucase)
+@@ -390,11 +390,20 @@ static inline const char *nasm_digit_chars(bool ucase)
   */
  int32_t seg_alloc(void);
  
@@ -102,15 +105,16 @@ index ed4222b..aafbf00 100644
 +extern struct debug_prefix_list *debug_prefixes;
 +
  /*
-  * Add/replace or remove an extension to the end of a filename
+  * Add/replace or remove an extension to the end of a filename;
+  * returns a newly allocated buffer with the modified filename.
   */
- const char *filename_set_extension(const char *inname, const char *extension);
+ char *filename_set_extension(const char *inname, const char *extension);
 +char *filename_debug_remap(char *dest, char const *inname, size_t len);
  
  /*
   * Utility macros...
 diff --git a/nasm.txt b/nasm.txt
-index 950c361..8447409 100644
+index 950c361a2c84..844740987338 100644
 --- a/nasm.txt
 +++ b/nasm.txt
 @@ -146,6 +146,9 @@ OPTIONS
@@ -124,21 +128,81 @@ index 950c361..8447409 100644
  SYNTAX
  ------
 diff --git a/nasmlib/filename.c b/nasmlib/filename.c
-index 2c29d38..0e27f69 100644
---- a/nasmlib/filename.c
+new file mode 100644
+index 000000000000..0e27f69e2754
+--- /dev/null
 +++ b/nasmlib/filename.c
-@@ -9,6 +9,8 @@
+@@ -0,0 +1,53 @@
++/* SPDX-License-Identifier: BSD-2-Clause */
++/* Copyright 1996-2017 The NASM Authors - All Rights Reserved */
++
++/*
++ * nasmlib.c	library routines for the Netwide Assembler
++ */
++
++#include "compiler.h"
++#include "nasmlib.h"
++#include "error.h"
++
++struct debug_prefix_list *debug_prefixes = NULL;
++
++/*
++ * Add/modify a filename extension, assumed to be a period-delimited
++ * field at the very end of the filename.  Returns a newly allocated
++ * string buffer.
++ */
++const char *filename_set_extension(const char *inname, const char *extension)
++{
++    const char *q = inname;
++    char *p;
++    size_t elen = strlen(extension);
++    size_t baselen;
++
++    q = strrchrnul(inname, '.');   /* find extension or end of string */
++    baselen = q - inname;
++
++    p = nasm_malloc(baselen + elen + 1);
++
++    memcpy(p, inname, baselen);
++    memcpy(p+baselen, extension, elen+1);
++
++    return p;
++}
++
++char *filename_debug_remap(char *dest, char const *in, size_t len)
++{
++    struct debug_prefix_list *d;
++    size_t n;
++
++    for (d = debug_prefixes; d != NULL; d = d->next) {
++        n = strlen(d->base);
++        if (strncmp(in, d->base, n) == 0) {
++            strlcpy(dest, d->dest, len);
++            strlcat(dest, &in[n], len);
++            return dest;
++        }
++    }
++
++    strlcpy(dest, in, len);
++    return dest;
++}
+\ No newline at end of file
+diff --git a/nasmlib/path.c b/nasmlib/path.c
+index 1d7ad8777acd..6ebffc235427 100644
+--- a/nasmlib/path.c
++++ b/nasmlib/path.c
+@@ -12,6 +12,8 @@
  #include "nasmlib.h"
  #include "error.h"
  
 +struct debug_prefix_list *debug_prefixes = NULL;
 +
- /*
-  * Add/modify a filename extension, assumed to be a period-delimited
-  * field at the very end of the filename.  Returns a newly allocated
-@@ -31,3 +33,21 @@ const char *filename_set_extension(const char *inname, const char *extension)
+ #define PATH_UNKNOWN	0
+ #define PATH_UNIX	1
+ #define PATH_MSDOS	2
+@@ -228,3 +230,21 @@ char *filename_set_extension(const char *inname, const char *extension)
  
-     return p;
+     return outname;
  }
 +
 +char *filename_debug_remap(char *dest, char const *in, size_t len)
@@ -158,34 +222,32 @@ index 2c29d38..0e27f69 100644
 +    strlcpy(dest, in, len);
 +    return dest;
 +}
-\ No newline at end of file
 diff --git a/output/outas86.c b/output/outas86.c
-index 0640af7..c654bbe 100644
+index edbd244cc942..1f75d5b9a3b0 100644
 --- a/output/outas86.c
 +++ b/output/outas86.c
-@@ -80,6 +80,8 @@ static void as86_sect_write(struct Section *, const uint8_t *,
- 
+@@ -81,6 +81,7 @@ static void as86_sect_write(struct Section *, const uint8_t *,
  static void as86_init(void)
  {
+     char *module_name;
 +    char filename[FILENAME_MAX];
-+
+ 
      stext.data = saa_init(1L);
      stext.datalen = 0L;
-     stext.head = stext.last = NULL;
-@@ -101,7 +103,7 @@ static void as86_init(void)
-     strslen = 0;
+@@ -104,7 +105,7 @@ static void as86_init(void)
  
      /* as86 module name = input file minus extension */
--    as86_add_string(filename_set_extension(inname, ""));
-+    as86_add_string(filename_debug_remap(filename, filename_set_extension(inname, ""), sizeof(filename)));
+     module_name = filename_set_extension(inname, "");
+-    as86_add_string(module_name);
++    as86_add_string(filename_debug_remap(filename, module_name, sizeof(filename)));
+     nasm_free(module_name);
  }
  
- static void as86_cleanup(void)
 diff --git a/output/outcoff.c b/output/outcoff.c
-index d38085d..b490bb6 100644
+index adcaf3a41d6a..fbf28cc453ef 100644
 --- a/output/outcoff.c
 +++ b/output/outcoff.c
-@@ -1231,7 +1231,7 @@ static void coff_symbol(char *name, int32_t strpos, int32_t value,
+@@ -1331,7 +1331,7 @@ static void coff_symbol(char *name, int32_t strpos, int32_t value,
  
  static void coff_write_symbols(void)
  {
@@ -194,7 +256,7 @@ index d38085d..b490bb6 100644
      uint32_t i;
  
      /*
-@@ -1241,7 +1241,7 @@ static void coff_write_symbols(void)
+@@ -1341,7 +1341,7 @@ static void coff_write_symbols(void)
      if (reproducible)
          memset(filename, 0, 18);
      else
@@ -204,21 +266,21 @@ index d38085d..b490bb6 100644
  
      /*
 diff --git a/output/outelf.c b/output/outelf.c
-index 7288dda..9847c6e 100644
+index 2a0566b4f3f1..5f0c03e04272 100644
 --- a/output/outelf.c
 +++ b/output/outelf.c
-@@ -516,8 +516,8 @@ static void elf_init(void)
-     const char * const *p;
-     const char * cur_path = nasm_realpath(inname);
+@@ -513,8 +513,8 @@ static void elf_populate_dirs(void)
+     char *cur_path = nasm_realpath(inname);
+     char *dir_name = nasm_dirname(cur_path);
  
 -    strlcpy(elf_module, inname, sizeof(elf_module));
--    strlcpy(elf_dir, nasm_dirname(cur_path), sizeof(elf_dir));
+-    strlcpy(elf_dir, dir_name, sizeof(elf_dir));
 +    filename_debug_remap(elf_module, inname, sizeof(elf_module));
 +    filename_debug_remap(elf_dir, nasm_dirname(cur_path), sizeof(elf_dir));
-     sects = NULL;
-     nsects = sectlen = 0;
-     syms = saa_init((int32_t)sizeof(struct elf_symbol));
-@@ -3551,13 +3551,17 @@ static void dwarf_findfile(const char * fname)
+ 
+     nasm_free(dir_name);
+     nasm_free(cur_path);
+@@ -3563,13 +3563,17 @@ static void dwarf_findfile(const char * fname)
      if (dwarf_clist && !(strcmp(fname, dwarf_clist->filename)))
          return;
  
@@ -237,7 +299,7 @@ index 7288dda..9847c6e 100644
                  return;
              }
              match = match->next;
-@@ -3568,8 +3572,7 @@ static void dwarf_findfile(const char * fname)
+@@ -3580,8 +3584,7 @@ static void dwarf_findfile(const char * fname)
      dwarf_clist = nasm_malloc(sizeof(struct linelist));
      dwarf_numfiles++;
      dwarf_clist->line = dwarf_numfiles;
@@ -248,7 +310,7 @@ index 7288dda..9847c6e 100644
      if (!dwarf_flist) {     /* if first entry */
          dwarf_flist = dwarf_elist = dwarf_clist;
 diff --git a/output/outieee.c b/output/outieee.c
-index 9e26cec..3643eeb 100644
+index 9e26cec905a6..3643eeb8eb23 100644
 --- a/output/outieee.c
 +++ b/output/outieee.c
 @@ -178,7 +178,7 @@ static void ieee_unqualified_name(char *, char *);
@@ -261,7 +323,7 @@ index 9e26cec..3643eeb 100644
      fpubhead = NULL;
      fpubtail = &fpubhead;
 diff --git a/output/outobj.c b/output/outobj.c
-index 685c593..e3eb34a 100644
+index 685c5933ef8b..e3eb34a33e7c 100644
 --- a/output/outobj.c
 +++ b/output/outobj.c
 @@ -656,7 +656,7 @@ static const char *get_default_class(const char *segment)
@@ -274,7 +336,7 @@ index 685c593..e3eb34a 100644
      any_segs = false;
      fpubhead = NULL;
 diff --git a/stdlib/strlcat.c b/stdlib/strlcat.c
-index c7cbd59..92a873d 100644
+index c7cbd5976335..92a873db7ab7 100644
 --- a/stdlib/strlcat.c
 +++ b/stdlib/strlcat.c
 @@ -29,7 +29,7 @@ size_t strlcat(char *dest, const char *src, size_t size)
@@ -288,7 +350,7 @@ index c7cbd59..92a873d 100644
      /* destination was not NULL terminated. Return the initial size */
 diff --git a/test/elfdebugprefix.asm b/test/elfdebugprefix.asm
 new file mode 100644
-index 0000000..bf845ce
+index 000000000000..bf845cee7746
 --- /dev/null
 +++ b/test/elfdebugprefix.asm
 @@ -0,0 +1,5 @@
@@ -298,7 +360,7 @@ index 0000000..bf845ce
 +test:			; [1]
 +	  ret
 diff --git a/test/performtest.pl b/test/performtest.pl
-index 46b1bdf..2426848 100755
+index 46b1bdfa7999..2426848fb989 100755
 --- a/test/performtest.pl
 +++ b/test/performtest.pl
 @@ -42,14 +42,22 @@ sub perform {
diff --git a/meta/recipes-devtools/nasm/nasm_3.01.bb b/meta/recipes-devtools/nasm/nasm_3.02.bb
similarity index 81%
rename from meta/recipes-devtools/nasm/nasm_3.01.bb
rename to meta/recipes-devtools/nasm/nasm_3.02.bb
index 837aaad9abfa..a7d598cf629b 100644
--- a/meta/recipes-devtools/nasm/nasm_3.01.bb
+++ b/meta/recipes-devtools/nasm/nasm_3.02.bb
@@ -10,10 +10,9 @@ DEPENDS = "zlib"
 SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 \
            file://0001-stdlib-Add-strlcat.patch \
            file://0002-Add-debug-prefix-map-option.patch \
-           file://0001-compiler.h-Backport-C23-support.patch \
            "
 
-SRC_URI[sha256sum] = "7a7b1ff3b0eef3247862f2fbe4ca605ccef770545d7af7979eba84a9d045c0b1"
+SRC_URI[sha256sum] = "ce7ed93281615379e4a9d4e76503c64a79c1d5ca696dbe148f16cf0b93e239af"
 
 EXTRA_AUTORECONF:append = " -I autoconf/m4"
 

---
base-commit: db81c1a42a0f552d9a8ec124f004ae2063d58c33
change-id: 20260901-mathieu-updates-2026-09-01-8d4ee76a9f5f

Best regards,
-- 
Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>


