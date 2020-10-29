Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web12.4711.1604009374002182280
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 15:09:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=gunT09DM;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id o9so1958188plx.10
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 15:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=i6IalqL+hcR9LQLa2dLYIwB+UDZ1odA1mc/n9RFTto0=;
        b=gunT09DMzhwmXNCxXplLL4M9pXGfeSfA3AfJvQPcCiXBBQ/cGzod9SiwgPZT5NlAYF
         VCkhbUr2hfbn8MjD7G/cev9EUiUjJAP8cSfu1H1lUkmmqwY5gQSaHXTVdvat8qelSG8e
         XVsZVxePSuquLNWrSdau9+VkFqRxIdSO0wdR9oOCdYAyr2CVG86Nv0+9MSnE6vl+bpFu
         L6+p6Cx2YaDtLlzRXzKPG1MSxaWcx0N5PkEN5aVg0R3CSZdSM/bqgl2YeElPMAxv6w1d
         xExT5EcNOJeWNfreJtv19JKBdMa9NCEC1beOIhRT3gHzT8akJTpSbRx2kKPT6Z26MWx9
         0W2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=i6IalqL+hcR9LQLa2dLYIwB+UDZ1odA1mc/n9RFTto0=;
        b=FDUeImwB5/rRWCM6FLCWWxdu0cKqvTYf0JOe0gf/gKG3MDOiWtMHMGY3J8xKAcTPj3
         f9j3okfVrKfckGfCfGoNHb5tRwzvNSR69X2IId/n8WuGrIghyUeKAN4iwAVNmWVDOEAW
         YuLbsaeQ7lH1IOD2c34z9grksJrCaTgZ3soW9sX9c0A6Xw8Z+4ydZvT3HREP234L+hal
         hPmbhZu2bG5w/wvjvgRDUWgIciesyaAYe5zN0auH7yaqwI/feggG9/sPsyfO0cZhFW0G
         u5AxVUb808jaSY7UK3B3vHfYwY/cAP0Kf1//+UVWJnMNQAps/ykNOp6qiaaEYNvCEqZo
         vGRQ==
X-Gm-Message-State: AOAM530d2rivFMZq15gjouBONWWuGmtrE7UsQKy77/GqVPW1GfDTYjQN
	RhJY8YHBLVRIvyMv1ak/peFC/64YpAV9+U54
X-Google-Smtp-Source: ABdhPJzW7HnM/xDK950f8/3hr/UOfn1pzAJ+vxtTVCTfbrEZSKnXLmcA2a42JbGn/L4NgVbLQRuExw==
X-Received: by 2002:a17:902:8a8a:b029:d5:ab9e:1d5d with SMTP id p10-20020a1709028a8ab02900d5ab9e1d5dmr5948118plo.32.1604009372741;
        Thu, 29 Oct 2020 15:09:32 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id e20sm3643638pfi.30.2020.10.29.15.09.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 15:09:32 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/2] nasm: update 2.14.02 -> 2.15.03 for CVE fixes
Date: Thu, 29 Oct 2020 12:09:09 -1000
Message-Id: <66c477f0ee6d9166ef8254b5a34bfc7f62ad33c4.1604009130.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1604009130.git.steve@sakoman.com>
References: <cover.1604009130.git.steve@sakoman.com>

From: Alexander Kanavin <alex.kanavin@gmail.com>

Fixes:

CVE-2018-16517: nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16517
CVE-2019-20334: nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20334
CVE-2019-6290: nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6290
CVE-2019-6291: nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6291
CVE-2019-8343: nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-8343

Remove backported patches, rebase the rest.

Switch to using (mostly) standard autotools build.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4d13e2713efd5f6cbdc6cf1f86edd0b336ba3ba2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../nasm/nasm/0001-stdlib-Add-strlcat.patch   |  28 ++--
 .../0002-Add-debug-prefix-map-option.patch    | 129 +++++++-----------
 .../nasm/nasm/CVE-2018-19755.patch            | 116 ----------------
 .../nasm/nasm/CVE-2019-14248.patch            |  43 ------
 .../nasm/{nasm_2.14.02.bb => nasm_2.15.03.bb} |  10 +-
 5 files changed, 66 insertions(+), 260 deletions(-)
 delete mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2018-19755.patch
 delete mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2019-14248.patch
 rename meta/recipes-devtools/nasm/{nasm_2.14.02.bb => nasm_2.15.03.bb} (56%)

diff --git a/meta/recipes-devtools/nasm/nasm/0001-stdlib-Add-strlcat.patch b/meta/recipes-devtools/nasm/nasm/0001-stdlib-Add-strlcat.patch
index d94fd3290e..0ede8a8328 100644
--- a/meta/recipes-devtools/nasm/nasm/0001-stdlib-Add-strlcat.patch
+++ b/meta/recipes-devtools/nasm/nasm/0001-stdlib-Add-strlcat.patch
@@ -1,12 +1,13 @@
-From 8a204171004fa0d7d21389530c744d215e99efb0 Mon Sep 17 00:00:00 2001
+From 1c5023002bad3a5b0bbc181fdb324160beace733 Mon Sep 17 00:00:00 2001
 From: Joshua Watt <JPEWhacker@gmail.com>
 Date: Tue, 19 Nov 2019 12:47:30 -0600
-Subject: [PATCH 1/2] stdlib: Add strlcat
+Subject: [PATCH] stdlib: Add strlcat
 
 Adds strlcat which can be used to safely concatenate strings
 
 Upstream-Status: Submitted [https://bugzilla.nasm.us/show_bug.cgi?id=3392635]
 Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
+
 ---
  Makefile.in        |  2 +-
  configure.ac       |  2 ++
@@ -16,10 +17,10 @@ Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
  create mode 100644 stdlib/strlcat.c
 
 diff --git a/Makefile.in b/Makefile.in
-index 32ef3d91..ff7eb447 100644
+index bfae1f8..156dc4c 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -93,7 +93,7 @@ NASM =	asm/nasm.$(O)
+@@ -101,7 +101,7 @@ NASM =	asm/nasm.$(O)
  NDISASM = disasm/ndisasm.$(O)
  
  LIBOBJ = stdlib/snprintf.$(O) stdlib/vsnprintf.$(O) stdlib/strlcpy.$(O) \
@@ -27,20 +28,20 @@ index 32ef3d91..ff7eb447 100644
 +	stdlib/strnlen.$(O) stdlib/strrchrnul.$(O) stdlib/strlcat.$(O) \
  	\
  	nasmlib/ver.$(O) \
- 	nasmlib/crc64.$(O) nasmlib/malloc.$(O) nasmlib/errfile.$(O) \
+ 	nasmlib/alloc.$(O) nasmlib/asprintf.$(O) nasmlib/errfile.$(O) \
 diff --git a/configure.ac b/configure.ac
-index 38b3b596..b4e88778 100644
+index 7b72769..14fd033 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -152,6 +152,7 @@ AC_CHECK_FUNCS([vsnprintf _vsnprintf])
- AC_CHECK_FUNCS([snprintf _snprintf])
+@@ -234,6 +234,7 @@ PA_FUNC_SNPRINTF
+ PA_FUNC_VSNPRINTF
  AC_CHECK_FUNCS([strlcpy])
  AC_CHECK_FUNCS([strrchrnul])
 +AC_CHECK_FUNCS([strlcat])
  
  dnl These types are POSIX-specific, and Windows does it differently...
  AC_CHECK_TYPES([struct _stati64])
-@@ -170,6 +171,7 @@ AC_CHECK_DECLS(strsep)
+@@ -253,6 +254,7 @@ AC_CHECK_DECLS(strsep)
  AC_CHECK_DECLS(strlcpy)
  AC_CHECK_DECLS(strnlen)
  AC_CHECK_DECLS(strrchrnul)
@@ -49,10 +50,10 @@ index 38b3b596..b4e88778 100644
  dnl Check for missing types
  AC_TYPE_UINTPTR_T
 diff --git a/include/compiler.h b/include/compiler.h
-index 4178c98e..8153d297 100644
+index b4fd3a8..7fb4821 100644
 --- a/include/compiler.h
 +++ b/include/compiler.h
-@@ -159,6 +159,10 @@ size_t strlcpy(char *, const char *, size_t);
+@@ -169,6 +169,10 @@ size_t strlcpy(char *, const char *, size_t);
  char *strrchrnul(const char *, int);
  #endif
  
@@ -65,7 +66,7 @@ index 4178c98e..8153d297 100644
  #  include <stdbool.h>
 diff --git a/stdlib/strlcat.c b/stdlib/strlcat.c
 new file mode 100644
-index 00000000..7084d460
+index 0000000..7084d46
 --- /dev/null
 +++ b/stdlib/strlcat.c
 @@ -0,0 +1,43 @@
@@ -112,6 +113,3 @@ index 00000000..7084d460
 +
 +#endif
 +
--- 
-2.23.0
-
diff --git a/meta/recipes-devtools/nasm/nasm/0002-Add-debug-prefix-map-option.patch b/meta/recipes-devtools/nasm/nasm/0002-Add-debug-prefix-map-option.patch
index bbfae2e8a5..f788e0fd43 100644
--- a/meta/recipes-devtools/nasm/nasm/0002-Add-debug-prefix-map-option.patch
+++ b/meta/recipes-devtools/nasm/nasm/0002-Add-debug-prefix-map-option.patch
@@ -1,7 +1,7 @@
-From fa677c1caf6b8192971920cf5c1aa8cb33c74605 Mon Sep 17 00:00:00 2001
+From bb4e42ad3a0cdd23a1d1797e6299c76b474867c0 Mon Sep 17 00:00:00 2001
 From: Joshua Watt <JPEWhacker@gmail.com>
 Date: Tue, 19 Nov 2019 13:12:17 -0600
-Subject: [PATCH 2/2] Add --debug-prefix-map option
+Subject: [PATCH] Add --debug-prefix-map option
 
 Adds an option to remap file prefixes in output object files. This is
 analogous to the "-fdebug-prefix-map" option in GCC, and allows files to
@@ -9,47 +9,48 @@ be built in a reproducible manner regardless of the build directory.
 
 Upstream-Status: Submitted [https://bugzilla.nasm.us/show_bug.cgi?id=3392635]
 Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
+
 ---
- asm/nasm.c              | 28 ++++++++++++++++++++++++++--
+ asm/nasm.c              | 26 +++++++++++++++++++++++++-
  include/nasmlib.h       |  9 +++++++++
  nasm.txt                |  4 ++++
  nasmlib/filename.c      | 20 ++++++++++++++++++++
  output/outas86.c        |  4 +++-
  output/outcoff.c        |  4 ++--
- output/outelf.c         |  8 ++++----
+ output/outelf.c         |  2 +-
  output/outieee.c        |  2 +-
  output/outobj.c         |  2 +-
  stdlib/strlcat.c        |  2 +-
  test/elfdebugprefix.asm |  6 ++++++
  test/performtest.pl     | 12 ++++++++++--
- 12 files changed, 87 insertions(+), 14 deletions(-)
+ 12 files changed, 83 insertions(+), 10 deletions(-)
  create mode 100644 test/elfdebugprefix.asm
 
 diff --git a/asm/nasm.c b/asm/nasm.c
-index 1c5a5fc5..5d45103c 100644
+index a0e1719..fc6c62e 100644
 --- a/asm/nasm.c
 +++ b/asm/nasm.c
-@@ -841,7 +841,8 @@ enum text_options {
-     OPT_BEFORE,
+@@ -938,7 +938,8 @@ enum text_options {
      OPT_LIMIT,
      OPT_KEEP_ALL,
--    OPT_NO_LINE
-+    OPT_NO_LINE,
+     OPT_NO_LINE,
+-    OPT_DEBUG
++    OPT_DEBUG,
 +    OPT_DEBUG_PREFIX_MAP
  };
- struct textargs {
-     const char *label;
-@@ -866,6 +867,7 @@ static const struct textargs textopts[] = {
-     {"limit-",   OPT_LIMIT,   true, 0},
-     {"keep-all", OPT_KEEP_ALL, false, 0},
-     {"no-line",  OPT_NO_LINE, false, 0},
+ enum need_arg {
+     ARG_NO,
+@@ -970,6 +971,7 @@ static const struct textargs textopts[] = {
+     {"keep-all", OPT_KEEP_ALL, ARG_NO, 0},
+     {"no-line",  OPT_NO_LINE, ARG_NO, 0},
+     {"debug",    OPT_DEBUG, ARG_MAYBE, 0},
 +    {"debug-prefix-map", OPT_DEBUG_PREFIX_MAP, true, 0},
-     {NULL, OPT_BOGUS, false, 0}
+     {NULL, OPT_BOGUS, ARG_NO, 0}
  };
  
-@@ -1217,6 +1219,26 @@ static bool process_arg(char *p, char *q, int pass)
-                 case OPT_NO_LINE:
-                     pp_noline = true;
+@@ -1332,6 +1334,26 @@ static bool process_arg(char *p, char *q, int pass)
+                 case OPT_DEBUG:
+                     debug_nasm = param ? strtoul(param, NULL, 10) : debug_nasm+1;
                      break;
 +                case OPT_DEBUG_PREFIX_MAP: {
 +                    struct debug_prefix_list *d;
@@ -72,24 +73,22 @@ index 1c5a5fc5..5d45103c 100644
 +                    }
 +                    break;
                  case OPT_HELP:
-                     help(0);
+                     help(stdout);
                      exit(0);
-@@ -2010,7 +2032,9 @@ static void help(const char xopt)
-          "   --lpostfix str append the given string to all other symbols\n"
-          "   --keep-all     output files will not be removed even if an error happens\n"
-          "   --no-line      ignore %%line directives in input\n"
--         "   --limit-X val  set execution limit X\n");
-+         "   --limit-X val  set execution limit X\n"
-+         "   --debug-prefix-map base=dest\n"
-+         "                  remap paths starting with 'base' to 'dest' in output files\n");
+@@ -2297,6 +2319,8 @@ static void help(FILE *out)
+         "    -w-x          disable warning x (also -Wno-x)\n"
+         "    -w[+-]error   promote all warnings to errors (also -Werror)\n"
+         "    -w[+-]error=x promote warning x to errors (also -Werror=x)\n"
++        "   --debug-prefix-map base=dest\n"
++        "                  remap paths starting with 'base' to 'dest' in output files\n"
+         , out);
  
-     for (i = 0; i <= LIMIT_MAX; i++) {
-         printf("                     %-15s %s (default ",
+     fprintf(out, "       %-20s %s\n",
 diff --git a/include/nasmlib.h b/include/nasmlib.h
-index e57d0e6d..cf921547 100644
+index e9bfbcc..98fc653 100644
 --- a/include/nasmlib.h
 +++ b/include/nasmlib.h
-@@ -195,10 +195,19 @@ int64_t readstrnum(char *str, int length, bool *warn);
+@@ -250,10 +250,19 @@ int64_t readstrnum(char *str, int length, bool *warn);
   */
  int32_t seg_alloc(void);
  
@@ -110,7 +109,7 @@ index e57d0e6d..cf921547 100644
  /*
   * Utility macros...
 diff --git a/nasm.txt b/nasm.txt
-index a28202f9..443c06b2 100644
+index cc7fa27..d3485c9 100644
 --- a/nasm.txt
 +++ b/nasm.txt
 @@ -147,6 +147,10 @@ OPTIONS
@@ -125,7 +124,7 @@ index a28202f9..443c06b2 100644
  ------
  This man page does not fully describe the syntax of *nasm*'s assembly language,
 diff --git a/nasmlib/filename.c b/nasmlib/filename.c
-index 172ae0bc..fda2be41 100644
+index 172ae0b..fda2be4 100644
 --- a/nasmlib/filename.c
 +++ b/nasmlib/filename.c
 @@ -39,6 +39,8 @@
@@ -160,10 +159,10 @@ index 172ae0bc..fda2be41 100644
 +    return dest;
 +}
 diff --git a/output/outas86.c b/output/outas86.c
-index 3f9867b9..d5f4f966 100644
+index 54b22f8..c4a412c 100644
 --- a/output/outas86.c
 +++ b/output/outas86.c
-@@ -113,6 +113,8 @@ static void as86_sect_write(struct Section *, const uint8_t *,
+@@ -110,6 +110,8 @@ static void as86_sect_write(struct Section *, const uint8_t *,
  
  static void as86_init(void)
  {
@@ -172,7 +171,7 @@ index 3f9867b9..d5f4f966 100644
      stext.data = saa_init(1L);
      stext.datalen = 0L;
      stext.head = stext.last = NULL;
-@@ -134,7 +136,7 @@ static void as86_init(void)
+@@ -131,7 +133,7 @@ static void as86_init(void)
      strslen = 0;
  
      /* as86 module name = input file minus extension */
@@ -182,10 +181,10 @@ index 3f9867b9..d5f4f966 100644
  
  static void as86_cleanup(void)
 diff --git a/output/outcoff.c b/output/outcoff.c
-index a2fd302c..bcf576fb 100644
+index bcd9ff3..15bfcf3 100644
 --- a/output/outcoff.c
 +++ b/output/outcoff.c
-@@ -1070,14 +1070,14 @@ static void coff_symbol(char *name, int32_t strpos, int32_t value,
+@@ -1095,14 +1095,14 @@ static void coff_symbol(char *name, int32_t strpos, int32_t value,
  
  static void coff_write_symbols(void)
  {
@@ -203,48 +202,23 @@ index a2fd302c..bcf576fb 100644
  
      /*
 diff --git a/output/outelf.c b/output/outelf.c
-index de99d076..203b5dc0 100644
+index 61af020..1292958 100644
 --- a/output/outelf.c
 +++ b/output/outelf.c
-@@ -1,5 +1,5 @@
- /* ----------------------------------------------------------------------- *
-- *   
-+ *
-  *   Copyright 1996-2017 The NASM Authors - All Rights Reserved
-  *   See the file AUTHORS included with the NASM distribution for
-  *   the specific copyright holders.
-@@ -14,7 +14,7 @@
-  *     copyright notice, this list of conditions and the following
-  *     disclaimer in the documentation and/or other materials provided
-  *     with the distribution.
-- *     
-+ *
-  *     THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
-  *     CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
-  *     INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
-@@ -315,7 +315,7 @@ elf_directive(enum directive directive, char *value, int pass)
+@@ -553,7 +553,7 @@ static void elf_init(void)
+     };
+     const char * const *p;
  
- static void elf_init(void)
- {
 -    strlcpy(elf_module, inname, sizeof(elf_module));
 +    filename_debug_remap(elf_module, inname, sizeof(elf_module));
      sects = NULL;
      nsects = sectlen = 0;
      syms = saa_init((int32_t)sizeof(struct elf_symbol));
-@@ -868,7 +868,7 @@ static void elf32_out(int32_t segto, const void *data,
-                       " segment base references");
-             } else {
-                 if (wrt == NO_SEG) {
--                    /* 
-+                    /*
-                      * The if() is a hack to deal with compilers which
-                      * don't handle switch() statements with 64-bit
-                      * expressions.
 diff --git a/output/outieee.c b/output/outieee.c
-index 3a28942d..f61824e4 100644
+index 4cc0f0f..2468724 100644
 --- a/output/outieee.c
 +++ b/output/outieee.c
-@@ -209,7 +209,7 @@ static void ieee_unqualified_name(char *, char *);
+@@ -207,7 +207,7 @@ static void ieee_unqualified_name(char *, char *);
   */
  static void ieee_init(void)
  {
@@ -254,10 +228,10 @@ index 3a28942d..f61824e4 100644
      fpubhead = NULL;
      fpubtail = &fpubhead;
 diff --git a/output/outobj.c b/output/outobj.c
-index b4f2c499..55bba4a1 100644
+index 0d4d311..d8dd6a0 100644
 --- a/output/outobj.c
 +++ b/output/outobj.c
-@@ -640,7 +640,7 @@ static enum directive_result obj_directive(enum directive, char *, int);
+@@ -638,7 +638,7 @@ static enum directive_result obj_directive(enum directive, char *);
  
  static void obj_init(void)
  {
@@ -267,7 +241,7 @@ index b4f2c499..55bba4a1 100644
      any_segs = false;
      fpubhead = NULL;
 diff --git a/stdlib/strlcat.c b/stdlib/strlcat.c
-index 7084d460..ee93dea3 100644
+index 7084d46..ee93dea 100644
 --- a/stdlib/strlcat.c
 +++ b/stdlib/strlcat.c
 @@ -29,7 +29,7 @@ size_t strlcat(char *dest, const char *src, size_t size)
@@ -281,7 +255,7 @@ index 7084d460..ee93dea3 100644
      /* destination was not NULL terminated. Return the initial size */
 diff --git a/test/elfdebugprefix.asm b/test/elfdebugprefix.asm
 new file mode 100644
-index 00000000..a67ba29c
+index 0000000..a67ba29
 --- /dev/null
 +++ b/test/elfdebugprefix.asm
 @@ -0,0 +1,6 @@
@@ -292,7 +266,7 @@ index 00000000..a67ba29c
 +	  ret
 +
 diff --git a/test/performtest.pl b/test/performtest.pl
-index f7865b39..096f9604 100755
+index f7865b3..096f960 100755
 --- a/test/performtest.pl
 +++ b/test/performtest.pl
 @@ -42,14 +42,22 @@ sub perform {
@@ -320,6 +294,3 @@ index f7865b39..096f9604 100755
          #Move the output to the test dir
          mkpath("$outputdir/$testname/$subname");
          foreach(split / /,$files) {
--- 
-2.23.0
-
diff --git a/meta/recipes-devtools/nasm/nasm/CVE-2018-19755.patch b/meta/recipes-devtools/nasm/nasm/CVE-2018-19755.patch
deleted file mode 100644
index 6e3f909d0f..0000000000
--- a/meta/recipes-devtools/nasm/nasm/CVE-2018-19755.patch
+++ /dev/null
@@ -1,116 +0,0 @@
-From 3079f7966dbed4497e36d5067cbfd896a90358cb Mon Sep 17 00:00:00 2001
-From: Cyrill Gorcunov <gorcunov@gmail.com>
-Date: Wed, 14 Nov 2018 10:03:42 +0300
-Subject: [PATCH] preproc: Fix malformed parameter count
-
-readnum returns 64bit number which may become
-a negative integer upon conversion which in
-turn lead to out of bound array access.
-
-Fix it by explicit conversion with bounds check
-
- | POC6:2: error: parameter count `2222222222' is out of bounds [0; 2147483647]
-
-https://bugzilla.nasm.us/show_bug.cgi?id=3392528
-
-Signed-off-by: Cyrill Gorcunov <gorcunov@gmail.com>
-
-Upstream-Status: Backport
-CVE: CVE-2018-19755
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- asm/preproc.c | 43 +++++++++++++++++++++----------------------
- 1 file changed, 21 insertions(+), 22 deletions(-)
-
-diff --git a/asm/preproc.c b/asm/preproc.c
-index b6afee3..e5ad05a 100644
---- a/asm/preproc.c
-+++ b/asm/preproc.c
-@@ -1650,6 +1650,23 @@ smacro_defined(Context * ctx, const char *name, int nparam, SMacro ** defn,
-     return false;
- }
- 
-+/* param should be a natural number [0; INT_MAX] */
-+static int read_param_count(const char *str)
-+{
-+    int result;
-+    bool err;
-+
-+    result = readnum(str, &err);
-+    if (result < 0 || result > INT_MAX) {
-+        result = 0;
-+        nasm_error(ERR_NONFATAL, "parameter count `%s' is out of bounds [%d; %d]",
-+                   str, 0, INT_MAX);
-+    } else if (err) {
-+        nasm_error(ERR_NONFATAL, "unable to parse parameter count `%s'", str);
-+    }
-+    return result;
-+}
-+
- /*
-  * Count and mark off the parameters in a multi-line macro call.
-  * This is called both from within the multi-line macro expansion
-@@ -1871,11 +1888,7 @@ static bool if_condition(Token * tline, enum preproc_token ct)
-                   pp_directives[ct]);
-         } else {
-             searching.nparam_min = searching.nparam_max =
--                readnum(tline->text, &j);
--            if (j)
--                nasm_error(ERR_NONFATAL,
--                      "unable to parse parameter count `%s'",
--                      tline->text);
-+                read_param_count(tline->text);
-         }
-         if (tline && tok_is_(tline->next, "-")) {
-             tline = tline->next->next;
-@@ -1886,11 +1899,7 @@ static bool if_condition(Token * tline, enum preproc_token ct)
-                       "`%s' expects a parameter count after `-'",
-                       pp_directives[ct]);
-             else {
--                searching.nparam_max = readnum(tline->text, &j);
--                if (j)
--                    nasm_error(ERR_NONFATAL,
--                          "unable to parse parameter count `%s'",
--                          tline->text);
-+                searching.nparam_max = read_param_count(tline->text);
-                 if (searching.nparam_min > searching.nparam_max) {
-                     nasm_error(ERR_NONFATAL,
-                           "minimum parameter count exceeds maximum");
-@@ -2079,8 +2088,6 @@ static void undef_smacro(Context *ctx, const char *mname)
-  */
- static bool parse_mmacro_spec(Token *tline, MMacro *def, const char *directive)
- {
--    bool err;
--
-     tline = tline->next;
-     skip_white_(tline);
-     tline = expand_id(tline);
-@@ -2103,11 +2110,7 @@ static bool parse_mmacro_spec(Token *tline, MMacro *def, const char *directive)
-     if (!tok_type_(tline, TOK_NUMBER)) {
-         nasm_error(ERR_NONFATAL, "`%s' expects a parameter count", directive);
-     } else {
--        def->nparam_min = def->nparam_max =
--            readnum(tline->text, &err);
--        if (err)
--            nasm_error(ERR_NONFATAL,
--                  "unable to parse parameter count `%s'", tline->text);
-+        def->nparam_min = def->nparam_max = read_param_count(tline->text);
-     }
-     if (tline && tok_is_(tline->next, "-")) {
-         tline = tline->next->next;
-@@ -2117,11 +2120,7 @@ static bool parse_mmacro_spec(Token *tline, MMacro *def, const char *directive)
-             nasm_error(ERR_NONFATAL,
-                   "`%s' expects a parameter count after `-'", directive);
-         } else {
--            def->nparam_max = readnum(tline->text, &err);
--            if (err) {
--                nasm_error(ERR_NONFATAL, "unable to parse parameter count `%s'",
--                      tline->text);
--            }
-+            def->nparam_max = read_param_count(tline->text);
-             if (def->nparam_min > def->nparam_max) {
-                 nasm_error(ERR_NONFATAL, "minimum parameter count exceeds maximum");
-                 def->nparam_max = def->nparam_min;
--- 
-2.10.5.GIT
-
diff --git a/meta/recipes-devtools/nasm/nasm/CVE-2019-14248.patch b/meta/recipes-devtools/nasm/nasm/CVE-2019-14248.patch
deleted file mode 100644
index d45d2cb465..0000000000
--- a/meta/recipes-devtools/nasm/nasm/CVE-2019-14248.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 93d41d82963b2cfd0b24c906f5a8daf53281b559 Mon Sep 17 00:00:00 2001
-From: "H. Peter Anvin (Intel)" <hpa@zytor.com>
-Date: Fri, 16 Aug 2019 01:12:54 -0700
-Subject: [PATCH] BR 3392576: don't segfault on a bad %pragma limit
-
-Don't segfault on a bad %pragma limit. Instead treat a NULL pointer as
-an empty string.
-
-Reported-by: Ren Kimura <rkx1209dev@gmail.com>
-Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
-
-CVE: CVE-2019-14248
-Upstream-Status: Backport [https://repo.or.cz/nasm.git/commit/93d41d82963b2cfd0b24c906f5a8daf53281b559]
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- asm/nasm.c | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/asm/nasm.c b/asm/nasm.c
-index c84d675..65116ab 100644
---- a/asm/nasm.c
-+++ b/asm/nasm.c
-@@ -212,6 +212,11 @@ nasm_set_limit(const char *limit, const char *valstr)
-     bool rn_error;
-     int errlevel;
- 
-+    if (!limit)
-+        limit = "";
-+    if (!valstr)
-+        valstr = "";
-+
-     for (i = 0; i <= LIMIT_MAX; i++) {
-         if (!nasm_stricmp(limit, limit_info[i].name))
-             break;
-@@ -204,7 +209,7 @@ nasm_set_limit(const char *limit, const char *valstr)
-             errlevel = ERR_WARNING|ERR_NOFILE|ERR_USAGE;
-         else
-             errlevel = ERR_WARNING|ERR_PASS1|WARN_UNKNOWN_PRAGMA;
--        nasm_error(errlevel, "unknown limit: `%s'", limit);
-+        nasm_error(errlevel, "invalid limit value: `%s'", valstr);
-         return DIRR_ERROR;
-     }
- 
diff --git a/meta/recipes-devtools/nasm/nasm_2.14.02.bb b/meta/recipes-devtools/nasm/nasm_2.15.03.bb
similarity index 56%
rename from meta/recipes-devtools/nasm/nasm_2.14.02.bb
rename to meta/recipes-devtools/nasm/nasm_2.15.03.bb
index f8a8d76e99..5c4e28de06 100644
--- a/meta/recipes-devtools/nasm/nasm_2.14.02.bb
+++ b/meta/recipes-devtools/nasm/nasm_2.15.03.bb
@@ -4,19 +4,15 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=90904486f8fbf1861cf42752e1a39efe"
 
 SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 \
-           file://CVE-2018-19755.patch \
-           file://CVE-2019-14248.patch \
            file://0001-stdlib-Add-strlcat.patch \
            file://0002-Add-debug-prefix-map-option.patch \
            "
 
-SRC_URI[md5sum] = "3f489aa48ad2aa1f967dc5e293bbd06f"
-SRC_URI[sha256sum] = "34fd26c70a277a9fdd54cb5ecf389badedaf48047b269d1008fbc819b24e80bc"
+SRC_URI[sha256sum] = "04e7343d9bf112bffa9fda86f6c7c8b120c2ccd700b882e2db9f57484b1bd778"
 
-# brokensep since this uses autoconf but not automake
-inherit autotools-brokensep
+EXTRA_AUTORECONF_append = " -I autoconf/m4"
 
-EXTRA_AUTORECONF += "--exclude=aclocal"
+inherit autotools
 
 BBCLASSEXTEND = "native"
 
-- 
2.17.1

