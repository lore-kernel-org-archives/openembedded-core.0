Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web12.196709.1598282139462107065
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2020 08:15:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=S1hyPqiN;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id m8so4987027pfh.3
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2020 08:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=xSau22+68LrUHCObJ018QMw/Ye6aey72n1MSKeQWjyk=;
        b=S1hyPqiNJM0SB96+UECqYpbI8IMjjLCGEi2AJpmTWtoeQEPvRoOwM1u1B3tc1+akbc
         Gabhq5Rm8SitRT3w0i8wjHrCzRQ9mOTi/LsFoYvqEFilEdLr1BTaUCdMqA1ZOzB+KVFT
         rXYl8dM18PBjFVzOMl3vMpZAXngu9PIHAqCdPB5uvexGIhQSe8WQJ2cilWSXW/K330XB
         cxI66qSNz2QDOVHvlmaiAQijTkJGNYyiRXy/L3bWfg669cHufsxeobm40xc4fBgb7+oW
         oAwJwJ2XdHnKUv5477xxoo6viBhvlZ78UZ8bn0FQUlaM8DwDpR8ikIhpDSocnJxaQogY
         qXcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=xSau22+68LrUHCObJ018QMw/Ye6aey72n1MSKeQWjyk=;
        b=AvYTpL/S9Ddr+IOElD4SZnM6S9uT1zmoLU6beo2seyLmhqMGe0AQy0hpsj3fIjFeWA
         bpQWGQbu5SqdWqfsIR3enEEOSREdPujr/LqjrZ0WBsrYVVkuhqkQcRP9TbM/DxrO9C+r
         Hch5TeRgKMX7mhWCZw+9QBUYiO4eQD/scFhQfOQSMZwdvNr9iVYBj3Ff+aIzE6UvTute
         QefYx1h0y5EToScNsBGuo6J1mh5mzBechM5T9Xwdyc0J9W4+iRtfGr0AY/wy0M9twOlc
         6mQzrfBN8nA5t90wD7cqeHtYGpQpyDABxPG340mLbMb/wQydd9krZkCvM7pL7TtW3PSS
         NZFQ==
X-Gm-Message-State: AOAM533dC9h6Qd2ltbr8z5WqP1L1iL6s7DYqhtRV3R3e4GWgB3Id82VA
	WxiheJw2aXQqWZJEXvy92UnZ+XVeNiW7SYSzkvU=
X-Google-Smtp-Source: ABdhPJxzfpzY5fl3UWnrWsLxiOC64niFfP2ZElRRp9EVfdwcIEb8pjLGK/noDq/kCl5j9KvspY76Xw==
X-Received: by 2002:a63:f813:: with SMTP id n19mr3658922pgh.34.1598282137484;
        Mon, 24 Aug 2020 08:15:37 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id a13sm11530382pfo.49.2020.08.24.08.15.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 08:15:36 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/12] ghostscript: update to 9.52
Date: Mon, 24 Aug 2020 05:14:55 -1000
Message-Id: <1cee5540ca74c38cc483b28f720e345644d6ca9b.1598281931.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1598281931.git.steve@sakoman.com>
References: <cover.1598281931.git.steve@sakoman.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

This is maintenance release consolidating the changes introduced
in 9.50. see :
https://www.ghostscript.com/doc/9.52/News.htm

Drop all custom objarch.h files; ghostscript nowadays generates
that with autoconf.

Freetype can no longer be disabled.

Building out of source tree is broken.

Upgrade include several CVE fixes:
CVE-2020-16287
CVE-2020-16288
CVE-2020-16289
CVE-2020-16290
CVE-2020-16291
CVE-2020-16292
CVE-2020-16293
CVE-2020-16294
CVE-2020-16295
CVE-2020-16296
CVE-2020-16297
CVE-2020-16298
CVE-2020-16299
CVE-2020-16300
CVE-2020-16301
CVE-2020-16302
CVE-2020-16303
CVE-2020-16304
CVE-2020-16305
CVE-2020-16308
CVE-2020-16309
CVE-2020-17538

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../do-not-check-local-libpng-source.patch    | 37 ++++------
 .../ghostscript/CVE-2019-14869-0001.patch     | 70 -------------------
 .../ghostscript/ghostscript/aarch64/objarch.h | 40 -----------
 .../ghostscript/ghostscript/arm/objarch.h     | 40 -----------
 .../ghostscript/ghostscript/armeb/objarch.h   | 40 -----------
 .../ghostscript-9.02-genarch.patch            | 38 ----------
 .../ghostscript/ghostscript/i586/objarch.h    | 41 -----------
 .../ghostscript/ghostscript/i686              |  1 -
 .../ghostscript/microblaze/objarch.h          | 40 -----------
 .../ghostscript/microblazeel/objarch.h        | 40 -----------
 .../ghostscript/mipsarchn32eb/objarch.h       | 40 -----------
 .../ghostscript/mipsarchn32el/objarch.h       | 40 -----------
 .../ghostscript/mipsarchn64eb/objarch.h       | 40 -----------
 .../ghostscript/mipsarchn64el/objarch.h       | 40 -----------
 .../ghostscript/mipsarcho32eb/objarch.h       | 40 -----------
 .../ghostscript/mipsarcho32el/objarch.h       | 40 -----------
 .../ghostscript/ghostscript/nios2/objarch.h   | 40 -----------
 .../ghostscript/ghostscript/powerpc/objarch.h | 40 -----------
 .../ghostscript/powerpc64/objarch.h           | 40 -----------
 .../ghostscript/powerpc64le/objarch.h         | 40 -----------
 .../ghostscript/ghostscript/x86-64/objarch.h  | 40 -----------
 ...hostscript_9.50.bb => ghostscript_9.52.bb} | 27 +++----
 22 files changed, 25 insertions(+), 829 deletions(-)
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14869-0001.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/aarch64/objarch.h
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/arm/objarch.h
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/armeb/objarch.h
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-genarch.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/i586/objarch.h
 delete mode 120000 meta/recipes-extended/ghostscript/ghostscript/i686
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/microblaze/objarch.h
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/microblazeel/objarch.h
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/mipsarchn32eb/objarch.h
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/mipsarchn32el/objarch.h
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/mipsarchn64eb/objarch.h
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/mipsarchn64el/objarch.h
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/mipsarcho32eb/objarch.h
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/mipsarcho32el/objarch.h
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/nios2/objarch.h
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/powerpc/objarch.h
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/powerpc64/objarch.h
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/powerpc64le/objarch.h
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/x86-64/objarch.h
 rename meta/recipes-extended/ghostscript/{ghostscript_9.50.bb => ghostscript_9.52.bb} (87%)

diff --git a/meta/recipes-extended/ghostscript/files/do-not-check-local-libpng-source.patch b/meta/recipes-extended/ghostscript/files/do-not-check-local-libpng-source.patch
index 5834ffaf9f..a9afb9948c 100644
--- a/meta/recipes-extended/ghostscript/files/do-not-check-local-libpng-source.patch
+++ b/meta/recipes-extended/ghostscript/files/do-not-check-local-libpng-source.patch
@@ -1,7 +1,7 @@
-From a954bf29a5f906b3151dffbecb5856e02e1565da Mon Sep 17 00:00:00 2001
+From 2adaa7366064a8f18af864eda74e52877a89620c Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 18 Jan 2016 01:00:30 -0500
-Subject: [PATCH 03/10] configure.ac: do not check local png source
+Subject: [PATCH] configure.ac: do not check local png source
 
 In oe-core, it did not need to compile local libpng
 source in ghostscript, so do not check local png
@@ -11,28 +11,21 @@ libpng library.
 Upstream-Status: Inappropriate [OE-Core specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
 ---
- configure.ac | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 9341930..80a60b1 100644
+index 698abd3..e65ac8b 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1114,11 +1114,11 @@ AC_SUBST(ZLIBDIR)
- AC_SUBST(FT_SYS_ZLIB)
- 
- dnl png for the png output device; it also requires zlib
--LIBPNGDIR=src
-+LIBPNGDIR=$srcdir/libpng
- PNGDEVS=''
- PNGDEVS_ALL='png48 png16m pnggray pngmono pngmonod png256 png16 pngalpha'
- AC_MSG_CHECKING([for local png library source])
--if test -f $srcdir/libpng/pngread.c; then
-+if false; then
-         AC_MSG_RESULT([yes])
-         SHARE_LIBPNG=0
-         LIBPNGDIR=$srcdir/libpng
--- 
-1.8.3.1
-
+@@ -1241,7 +1241,7 @@ else
+   PNGDEVS=''
+   PNGDEVS_ALL='png48 png16m pnggray pngmono pngmonod png256 png16 pngalpha'
+   AC_MSG_CHECKING([for local png library source])
+-  if test -f $srcdir/libpng/pngread.c; then
++  if false; then
+           AC_MSG_RESULT([yes])
+           SHARE_LIBPNG=0
+           LIBPNGDIR=$srcdir/libpng
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14869-0001.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14869-0001.patch
deleted file mode 100644
index 715ec1c450..0000000000
--- a/meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14869-0001.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 485904772c5f0aa1140032746e5a0abfc40f4cef Mon Sep 17 00:00:00 2001
-From: Chris Liddell <chris.liddell@artifex.com>
-Date: Tue, 5 Nov 2019 09:45:27 +0000
-Subject: [PATCH] Bug 701841: remove .forceput from /.charkeys
-
-When loading Type 1 or Truetype fonts from disk, we attempt to extend the glyph
-name table to include all identifiable glyph names from the Adobe Glyph List.
-
-In the case of Type 1 fonts, the font itself (almost always) marks the
-CharStrings dictionary as read-only, hence we have to use .forceput for that
-case.
-
-But for Truetype fonts, the CharStrings dictionary is created internally and is
-not read-only until *after* we have fully populated it (including the extended
-glyph names from the AGL), hence there is no need for .forceput, and no need to
-carry the security risk of using it.
-
-Replace with regular put.
-
-CVE: CVE-2019-14869
-Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
-
-Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
----
- Resource/Init/gs_ttf.ps | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/Resource/Init/gs_ttf.ps b/Resource/Init/gs_ttf.ps
-index e34967d..5354ff0 100644
---- a/Resource/Init/gs_ttf.ps
-+++ b/Resource/Init/gs_ttf.ps
-@@ -1301,7 +1301,7 @@ currentdict /.pickcmap_with_no_xlatmap .undef
-           TTFDEBUG { (\n1 setting alias: ) print dup ==only
-                 ( to be the same as  ) print 2 index //== exec } if
- 
--          7 index 2 index 3 -1 roll exch .forceput
-+          7 index 2 index 3 -1 roll exch put
-         } forall
-         pop pop pop
-       }
-@@ -1319,7 +1319,7 @@ currentdict /.pickcmap_with_no_xlatmap .undef
-           exch pop
-           TTFDEBUG { (\n2 setting alias: ) print 1 index ==only
-                      ( to use glyph index: ) print dup //== exec } if
--          5 index 3 1 roll .forceput
-+          5 index 3 1 roll put
-           //false
-         }
-         {
-@@ -1336,7 +1336,7 @@ currentdict /.pickcmap_with_no_xlatmap .undef
-         {                            %  CharStrings(dict) isunicode(boolean) cmap(dict) RAGL(dict) gname(name) codep(integer) gindex(integer)
-           TTFDEBUG { (\3 nsetting alias: ) print 1 index ==only
-                 ( to be index: ) print dup //== exec } if
--          exch pop 5 index 3 1 roll .forceput
-+          exch pop 5 index 3 1 roll put
-         }
-         {
-           pop pop
-@@ -1366,7 +1366,7 @@ currentdict /.pickcmap_with_no_xlatmap .undef
-       } ifelse
-     ]
-   TTFDEBUG { (Encoding: ) print dup === flush } if
--} .bind executeonly odef		% hides .forceput
-+} .bind odef
- 
- % ---------------- CIDFontType 2 font loading ---------------- %
- 
--- 
-2.20.1
-
diff --git a/meta/recipes-extended/ghostscript/ghostscript/aarch64/objarch.h b/meta/recipes-extended/ghostscript/ghostscript/aarch64/objarch.h
deleted file mode 100644
index a05de29def..0000000000
--- a/meta/recipes-extended/ghostscript/ghostscript/aarch64/objarch.h
+++ /dev/null
@@ -1,40 +0,0 @@
-/* Parameters derived from machine and compiler architecture. */
-/* This file is generated mechanically by genarch.c. */
-
-	 /* ---------------- Scalar alignments ---------------- */
-
-#define ARCH_ALIGN_SHORT_MOD 2
-#define ARCH_ALIGN_INT_MOD 4
-#define ARCH_ALIGN_LONG_MOD 8
-#define ARCH_ALIGN_PTR_MOD 8
-#define ARCH_ALIGN_FLOAT_MOD 4
-#define ARCH_ALIGN_DOUBLE_MOD 8
-
-	 /* ---------------- Scalar sizes ---------------- */
-
-#define ARCH_LOG2_SIZEOF_CHAR 0
-#define ARCH_LOG2_SIZEOF_SHORT 1
-#define ARCH_LOG2_SIZEOF_INT 2
-#define ARCH_LOG2_SIZEOF_LONG 3
-#define ARCH_LOG2_SIZEOF_LONG_LONG 3
-#define ARCH_SIZEOF_GX_COLOR_INDEX 8
-#define ARCH_SIZEOF_PTR 8
-#define ARCH_SIZEOF_FLOAT 4
-#define ARCH_SIZEOF_DOUBLE 8
-#define ARCH_FLOAT_MANTISSA_BITS 24
-#define ARCH_DOUBLE_MANTISSA_BITS 53
-
-	 /* ---------------- Unsigned max values ---------------- */
-
-#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
-#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
-#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
-#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
-
-	 /* ---------------- Miscellaneous ---------------- */
-
-#define ARCH_IS_BIG_ENDIAN 0
-#define ARCH_PTRS_ARE_SIGNED 0
-#define ARCH_FLOATS_ARE_IEEE 1
-#define ARCH_ARITH_RSHIFT 2
-#define ARCH_DIV_NEG_POS_TRUNCATES 1
diff --git a/meta/recipes-extended/ghostscript/ghostscript/arm/objarch.h b/meta/recipes-extended/ghostscript/ghostscript/arm/objarch.h
deleted file mode 100644
index e8772cd958..0000000000
--- a/meta/recipes-extended/ghostscript/ghostscript/arm/objarch.h
+++ /dev/null
@@ -1,40 +0,0 @@
-/* Parameters derived from machine and compiler architecture. */
-/* This file is generated mechanically by genarch.c. */
-
-	 /* ---------------- Scalar alignments ---------------- */
-
-#define ARCH_ALIGN_SHORT_MOD 2
-#define ARCH_ALIGN_INT_MOD 4
-#define ARCH_ALIGN_LONG_MOD 4
-#define ARCH_ALIGN_PTR_MOD 4
-#define ARCH_ALIGN_FLOAT_MOD 4
-#define ARCH_ALIGN_DOUBLE_MOD 8
-
-	 /* ---------------- Scalar sizes ---------------- */
-
-#define ARCH_LOG2_SIZEOF_CHAR 0
-#define ARCH_LOG2_SIZEOF_SHORT 1
-#define ARCH_LOG2_SIZEOF_INT 2
-#define ARCH_LOG2_SIZEOF_LONG 2
-#define ARCH_LOG2_SIZEOF_LONG_LONG 3
-#define ARCH_SIZEOF_GX_COLOR_INDEX 8
-#define ARCH_SIZEOF_PTR 4
-#define ARCH_SIZEOF_FLOAT 4
-#define ARCH_SIZEOF_DOUBLE 8
-#define ARCH_FLOAT_MANTISSA_BITS 24
-#define ARCH_DOUBLE_MANTISSA_BITS 53
-
-	 /* ---------------- Unsigned max values ---------------- */
-
-#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
-#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
-#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
-#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
-
-	 /* ---------------- Miscellaneous ---------------- */
-
-#define ARCH_IS_BIG_ENDIAN 0
-#define ARCH_PTRS_ARE_SIGNED 0
-#define ARCH_FLOATS_ARE_IEEE 1
-#define ARCH_ARITH_RSHIFT 2
-#define ARCH_DIV_NEG_POS_TRUNCATES 1
diff --git a/meta/recipes-extended/ghostscript/ghostscript/armeb/objarch.h b/meta/recipes-extended/ghostscript/ghostscript/armeb/objarch.h
deleted file mode 100644
index 359097f356..0000000000
--- a/meta/recipes-extended/ghostscript/ghostscript/armeb/objarch.h
+++ /dev/null
@@ -1,40 +0,0 @@
-/* Parameters derived from machine and compiler architecture. */
-/* This file is generated mechanically by genarch.c. */
-
-	 /* ---------------- Scalar alignments ---------------- */
-
-#define ARCH_ALIGN_SHORT_MOD 2
-#define ARCH_ALIGN_INT_MOD 4
-#define ARCH_ALIGN_LONG_MOD 4
-#define ARCH_ALIGN_PTR_MOD 4
-#define ARCH_ALIGN_FLOAT_MOD 4
-#define ARCH_ALIGN_DOUBLE_MOD 8
-
-	 /* ---------------- Scalar sizes ---------------- */
-
-#define ARCH_LOG2_SIZEOF_CHAR 0
-#define ARCH_LOG2_SIZEOF_SHORT 1
-#define ARCH_LOG2_SIZEOF_INT 2
-#define ARCH_LOG2_SIZEOF_LONG 2
-#define ARCH_LOG2_SIZEOF_LONG_LONG 3
-#define ARCH_SIZEOF_GX_COLOR_INDEX 8
-#define ARCH_SIZEOF_PTR 4
-#define ARCH_SIZEOF_FLOAT 4
-#define ARCH_SIZEOF_DOUBLE 8
-#define ARCH_FLOAT_MANTISSA_BITS 24
-#define ARCH_DOUBLE_MANTISSA_BITS 53
-
-	 /* ---------------- Unsigned max values ---------------- */
-
-#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
-#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
-#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
-#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
-
-	 /* ---------------- Miscellaneous ---------------- */
-
-#define ARCH_IS_BIG_ENDIAN 1
-#define ARCH_PTRS_ARE_SIGNED 0
-#define ARCH_FLOATS_ARE_IEEE 1
-#define ARCH_ARITH_RSHIFT 2
-#define ARCH_DIV_NEG_POS_TRUNCATES 1
diff --git a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-genarch.patch b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-genarch.patch
deleted file mode 100644
index 7b70bb8e2c..0000000000
--- a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-genarch.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From c076d0fc970f190f723018258790c79b59daba2e Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Sat, 11 May 2019 21:20:27 +0800
-Subject: [PATCH] not generate objarch.h at compile time
-
-Import patch from windriver linux for cross compilation, and split
-patches into oe way under different directories such as i586, powerpc etc
-according to Richard's opinion.
-
-Upstream-Status: Pending
-
-Signed-off-by: Kang Kai <kai.kang@windriver.com>
-Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
-
-Rebase to 9.27
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- base/lib.mak | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/base/lib.mak b/base/lib.mak
-index 3ed088a..5af2b43 100644
---- a/base/lib.mak
-+++ b/base/lib.mak
-@@ -87,8 +87,8 @@ arch_h=$(GLGEN)arch.h
- stdpre_h=$(GLSRC)stdpre.h
- stdint__h=$(GLSRC)stdint_.h
- 
--$(GLGEN)arch.h : $(GENARCH_XE)
--	$(EXP)$(GENARCH_XE) $(GLGEN)arch.h $(TARGET_ARCH_FILE)
-+##$(GLGEN)arch.h : $(GENARCH_XE)
-+##	$(EXP)$(GENARCH_XE) $(GLGEN)arch.h $(TARGET_ARCH_FILE)
- 
- # Platform interfaces
- 
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/ghostscript/ghostscript/i586/objarch.h b/meta/recipes-extended/ghostscript/ghostscript/i586/objarch.h
deleted file mode 100644
index 5817b7a6d7..0000000000
--- a/meta/recipes-extended/ghostscript/ghostscript/i586/objarch.h
+++ /dev/null
@@ -1,41 +0,0 @@
-/* Parameters derived from machine and compiler architecture. */
-/* This file is generated mechanically by genarch.c. */
-
-	 /* ---------------- Scalar alignments ---------------- */
-
-#define ARCH_ALIGN_SHORT_MOD 2
-#define ARCH_ALIGN_INT_MOD 4
-#define ARCH_ALIGN_LONG_MOD 4
-#define ARCH_ALIGN_PTR_MOD 4
-#define ARCH_ALIGN_FLOAT_MOD 4
-#define ARCH_ALIGN_DOUBLE_MOD 4
-
-	 /* ---------------- Scalar sizes ---------------- */
-
-#define ARCH_LOG2_SIZEOF_CHAR 0
-#define ARCH_LOG2_SIZEOF_SHORT 1
-#define ARCH_LOG2_SIZEOF_INT 2
-#define ARCH_LOG2_SIZEOF_LONG 2
-#define ARCH_LOG2_SIZEOF_LONG_LONG 3
-#define ARCH_SIZEOF_GX_COLOR_INDEX 8
-#define ARCH_SIZEOF_PTR 4
-#define ARCH_SIZEOF_FLOAT 4
-#define ARCH_SIZEOF_DOUBLE 8
-#define ARCH_FLOAT_MANTISSA_BITS 24
-#define ARCH_DOUBLE_MANTISSA_BITS 53
-
-	 /* ---------------- Unsigned max values ---------------- */
-
-#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
-#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
-#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
-#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
-
-	 /* ---------------- Miscellaneous ---------------- */
-
-#define ARCH_IS_BIG_ENDIAN 0
-#define ARCH_PTRS_ARE_SIGNED 0
-#define ARCH_FLOATS_ARE_IEEE 1
-#define ARCH_ARITH_RSHIFT 2
-#define ARCH_DIV_NEG_POS_TRUNCATES 1
-
diff --git a/meta/recipes-extended/ghostscript/ghostscript/i686 b/meta/recipes-extended/ghostscript/ghostscript/i686
deleted file mode 120000
index 87aaca5903..0000000000
--- a/meta/recipes-extended/ghostscript/ghostscript/i686
+++ /dev/null
@@ -1 +0,0 @@
-i586
\ No newline at end of file
diff --git a/meta/recipes-extended/ghostscript/ghostscript/microblaze/objarch.h b/meta/recipes-extended/ghostscript/ghostscript/microblaze/objarch.h
deleted file mode 100644
index 63232fdfa6..0000000000
--- a/meta/recipes-extended/ghostscript/ghostscript/microblaze/objarch.h
+++ /dev/null
@@ -1,40 +0,0 @@
-/* Parameters derived from machine and compiler architecture. */
-/* This file is generated mechanically by genarch.c. */
-
-	 /* ---------------- Scalar alignments ---------------- */
-
-#define ARCH_ALIGN_SHORT_MOD 2
-#define ARCH_ALIGN_INT_MOD 4
-#define ARCH_ALIGN_LONG_MOD 4
-#define ARCH_ALIGN_PTR_MOD 4
-#define ARCH_ALIGN_FLOAT_MOD 4
-#define ARCH_ALIGN_DOUBLE_MOD 4
-
-	 /* ---------------- Scalar sizes ---------------- */
-
-#define ARCH_LOG2_SIZEOF_CHAR 0
-#define ARCH_LOG2_SIZEOF_SHORT 1
-#define ARCH_LOG2_SIZEOF_INT 2
-#define ARCH_LOG2_SIZEOF_LONG 2
-#define ARCH_LOG2_SIZEOF_LONG_LONG 3
-#define ARCH_SIZEOF_GX_COLOR_INDEX 8
-#define ARCH_SIZEOF_PTR 4
-#define ARCH_SIZEOF_FLOAT 4
-#define ARCH_SIZEOF_DOUBLE 8
-#define ARCH_FLOAT_MANTISSA_BITS 24
-#define ARCH_DOUBLE_MANTISSA_BITS 53
-
-	 /* ---------------- Unsigned max values ---------------- */
-
-#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
-#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
-#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
-#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
-
-	 /* ---------------- Miscellaneous ---------------- */
-
-#define ARCH_IS_BIG_ENDIAN 1
-#define ARCH_PTRS_ARE_SIGNED 0
-#define ARCH_FLOATS_ARE_IEEE 1
-#define ARCH_ARITH_RSHIFT 2
-#define ARCH_DIV_NEG_POS_TRUNCATES 1
diff --git a/meta/recipes-extended/ghostscript/ghostscript/microblazeel/objarch.h b/meta/recipes-extended/ghostscript/ghostscript/microblazeel/objarch.h
deleted file mode 100644
index 3ec8101681..0000000000
--- a/meta/recipes-extended/ghostscript/ghostscript/microblazeel/objarch.h
+++ /dev/null
@@ -1,40 +0,0 @@
-/* Parameters derived from machine and compiler architecture. */
-/* This file is generated mechanically by genarch.c. */
-
-	 /* ---------------- Scalar alignments ---------------- */
-
-#define ARCH_ALIGN_SHORT_MOD 2
-#define ARCH_ALIGN_INT_MOD 4
-#define ARCH_ALIGN_LONG_MOD 4
-#define ARCH_ALIGN_PTR_MOD 4
-#define ARCH_ALIGN_FLOAT_MOD 4
-#define ARCH_ALIGN_DOUBLE_MOD 4
-
-	 /* ---------------- Scalar sizes ---------------- */
-
-#define ARCH_LOG2_SIZEOF_CHAR 0
-#define ARCH_LOG2_SIZEOF_SHORT 1
-#define ARCH_LOG2_SIZEOF_INT 2
-#define ARCH_LOG2_SIZEOF_LONG 2
-#define ARCH_LOG2_SIZEOF_LONG_LONG 3
-#define ARCH_SIZEOF_GX_COLOR_INDEX 8
-#define ARCH_SIZEOF_PTR 4
-#define ARCH_SIZEOF_FLOAT 4
-#define ARCH_SIZEOF_DOUBLE 8
-#define ARCH_FLOAT_MANTISSA_BITS 24
-#define ARCH_DOUBLE_MANTISSA_BITS 53
-
-	 /* ---------------- Unsigned max values ---------------- */
-
-#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
-#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
-#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
-#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
-
-	 /* ---------------- Miscellaneous ---------------- */
-
-#define ARCH_IS_BIG_ENDIAN 0
-#define ARCH_PTRS_ARE_SIGNED 0
-#define ARCH_FLOATS_ARE_IEEE 1
-#define ARCH_ARITH_RSHIFT 2
-#define ARCH_DIV_NEG_POS_TRUNCATES 1
diff --git a/meta/recipes-extended/ghostscript/ghostscript/mipsarchn32eb/objarch.h b/meta/recipes-extended/ghostscript/ghostscript/mipsarchn32eb/objarch.h
deleted file mode 100644
index 0d0a16bfa3..0000000000
--- a/meta/recipes-extended/ghostscript/ghostscript/mipsarchn32eb/objarch.h
+++ /dev/null
@@ -1,40 +0,0 @@
-/* Parameters derived from machine and compiler architecture. */
-/* This file is generated mechanically by genarch.c. */
-
-	 /* ---------------- Scalar alignments ---------------- */
-
-#define ARCH_ALIGN_SHORT_MOD 2
-#define ARCH_ALIGN_INT_MOD 4
-#define ARCH_ALIGN_LONG_MOD 8
-#define ARCH_ALIGN_PTR_MOD 8
-#define ARCH_ALIGN_FLOAT_MOD 4
-#define ARCH_ALIGN_DOUBLE_MOD 8
-
-	 /* ---------------- Scalar sizes ---------------- */
-
-#define ARCH_LOG2_SIZEOF_CHAR 0
-#define ARCH_LOG2_SIZEOF_SHORT 1
-#define ARCH_LOG2_SIZEOF_INT 2
-#define ARCH_LOG2_SIZEOF_LONG 3
-#define ARCH_LOG2_SIZEOF_LONG_LONG 3
-#define ARCH_SIZEOF_GX_COLOR_INDEX 8
-#define ARCH_SIZEOF_PTR 8
-#define ARCH_SIZEOF_FLOAT 4
-#define ARCH_SIZEOF_DOUBLE 8
-#define ARCH_FLOAT_MANTISSA_BITS 24
-#define ARCH_DOUBLE_MANTISSA_BITS 53
-
-	 /* ---------------- Unsigned max values ---------------- */
-
-#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
-#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
-#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
-#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
-
-	 /* ---------------- Miscellaneous ---------------- */
-
-#define ARCH_IS_BIG_ENDIAN 1
-#define ARCH_PTRS_ARE_SIGNED 0
-#define ARCH_FLOATS_ARE_IEEE 1
-#define ARCH_ARITH_RSHIFT 2
-#define ARCH_DIV_NEG_POS_TRUNCATES 1
diff --git a/meta/recipes-extended/ghostscript/ghostscript/mipsarchn32el/objarch.h b/meta/recipes-extended/ghostscript/ghostscript/mipsarchn32el/objarch.h
deleted file mode 100644
index a05de29def..0000000000
--- a/meta/recipes-extended/ghostscript/ghostscript/mipsarchn32el/objarch.h
+++ /dev/null
@@ -1,40 +0,0 @@
-/* Parameters derived from machine and compiler architecture. */
-/* This file is generated mechanically by genarch.c. */
-
-	 /* ---------------- Scalar alignments ---------------- */
-
-#define ARCH_ALIGN_SHORT_MOD 2
-#define ARCH_ALIGN_INT_MOD 4
-#define ARCH_ALIGN_LONG_MOD 8
-#define ARCH_ALIGN_PTR_MOD 8
-#define ARCH_ALIGN_FLOAT_MOD 4
-#define ARCH_ALIGN_DOUBLE_MOD 8
-
-	 /* ---------------- Scalar sizes ---------------- */
-
-#define ARCH_LOG2_SIZEOF_CHAR 0
-#define ARCH_LOG2_SIZEOF_SHORT 1
-#define ARCH_LOG2_SIZEOF_INT 2
-#define ARCH_LOG2_SIZEOF_LONG 3
-#define ARCH_LOG2_SIZEOF_LONG_LONG 3
-#define ARCH_SIZEOF_GX_COLOR_INDEX 8
-#define ARCH_SIZEOF_PTR 8
-#define ARCH_SIZEOF_FLOAT 4
-#define ARCH_SIZEOF_DOUBLE 8
-#define ARCH_FLOAT_MANTISSA_BITS 24
-#define ARCH_DOUBLE_MANTISSA_BITS 53
-
-	 /* ---------------- Unsigned max values ---------------- */
-
-#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
-#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
-#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
-#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
-
-	 /* ---------------- Miscellaneous ---------------- */
-
-#define ARCH_IS_BIG_ENDIAN 0
-#define ARCH_PTRS_ARE_SIGNED 0
-#define ARCH_FLOATS_ARE_IEEE 1
-#define ARCH_ARITH_RSHIFT 2
-#define ARCH_DIV_NEG_POS_TRUNCATES 1
diff --git a/meta/recipes-extended/ghostscript/ghostscript/mipsarchn64eb/objarch.h b/meta/recipes-extended/ghostscript/ghostscript/mipsarchn64eb/objarch.h
deleted file mode 100644
index 0d0a16bfa3..0000000000
--- a/meta/recipes-extended/ghostscript/ghostscript/mipsarchn64eb/objarch.h
+++ /dev/null
@@ -1,40 +0,0 @@
-/* Parameters derived from machine and compiler architecture. */
-/* This file is generated mechanically by genarch.c. */
-
-	 /* ---------------- Scalar alignments ---------------- */
-
-#define ARCH_ALIGN_SHORT_MOD 2
-#define ARCH_ALIGN_INT_MOD 4
-#define ARCH_ALIGN_LONG_MOD 8
-#define ARCH_ALIGN_PTR_MOD 8
-#define ARCH_ALIGN_FLOAT_MOD 4
-#define ARCH_ALIGN_DOUBLE_MOD 8
-
-	 /* ---------------- Scalar sizes ---------------- */
-
-#define ARCH_LOG2_SIZEOF_CHAR 0
-#define ARCH_LOG2_SIZEOF_SHORT 1
-#define ARCH_LOG2_SIZEOF_INT 2
-#define ARCH_LOG2_SIZEOF_LONG 3
-#define ARCH_LOG2_SIZEOF_LONG_LONG 3
-#define ARCH_SIZEOF_GX_COLOR_INDEX 8
-#define ARCH_SIZEOF_PTR 8
-#define ARCH_SIZEOF_FLOAT 4
-#define ARCH_SIZEOF_DOUBLE 8
-#define ARCH_FLOAT_MANTISSA_BITS 24
-#define ARCH_DOUBLE_MANTISSA_BITS 53
-
-	 /* ---------------- Unsigned max values ---------------- */
-
-#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
-#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
-#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
-#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
-
-	 /* ---------------- Miscellaneous ---------------- */
-
-#define ARCH_IS_BIG_ENDIAN 1
-#define ARCH_PTRS_ARE_SIGNED 0
-#define ARCH_FLOATS_ARE_IEEE 1
-#define ARCH_ARITH_RSHIFT 2
-#define ARCH_DIV_NEG_POS_TRUNCATES 1
diff --git a/meta/recipes-extended/ghostscript/ghostscript/mipsarchn64el/objarch.h b/meta/recipes-extended/ghostscript/ghostscript/mipsarchn64el/objarch.h
deleted file mode 100644
index a05de29def..0000000000
--- a/meta/recipes-extended/ghostscript/ghostscript/mipsarchn64el/objarch.h
+++ /dev/null
@@ -1,40 +0,0 @@
-/* Parameters derived from machine and compiler architecture. */
-/* This file is generated mechanically by genarch.c. */
-
-	 /* ---------------- Scalar alignments ---------------- */
-
-#define ARCH_ALIGN_SHORT_MOD 2
-#define ARCH_ALIGN_INT_MOD 4
-#define ARCH_ALIGN_LONG_MOD 8
-#define ARCH_ALIGN_PTR_MOD 8
-#define ARCH_ALIGN_FLOAT_MOD 4
-#define ARCH_ALIGN_DOUBLE_MOD 8
-
-	 /* ---------------- Scalar sizes ---------------- */
-
-#define ARCH_LOG2_SIZEOF_CHAR 0
-#define ARCH_LOG2_SIZEOF_SHORT 1
-#define ARCH_LOG2_SIZEOF_INT 2
-#define ARCH_LOG2_SIZEOF_LONG 3
-#define ARCH_LOG2_SIZEOF_LONG_LONG 3
-#define ARCH_SIZEOF_GX_COLOR_INDEX 8
-#define ARCH_SIZEOF_PTR 8
-#define ARCH_SIZEOF_FLOAT 4
-#define ARCH_SIZEOF_DOUBLE 8
-#define ARCH_FLOAT_MANTISSA_BITS 24
-#define ARCH_DOUBLE_MANTISSA_BITS 53
-
-	 /* ---------------- Unsigned max values ---------------- */
-
-#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
-#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
-#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
-#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
-
-	 /* ---------------- Miscellaneous ---------------- */
-
-#define ARCH_IS_BIG_ENDIAN 0
-#define ARCH_PTRS_ARE_SIGNED 0
-#define ARCH_FLOATS_ARE_IEEE 1
-#define ARCH_ARITH_RSHIFT 2
-#define ARCH_DIV_NEG_POS_TRUNCATES 1
diff --git a/meta/recipes-extended/ghostscript/ghostscript/mipsarcho32eb/objarch.h b/meta/recipes-extended/ghostscript/ghostscript/mipsarcho32eb/objarch.h
deleted file mode 100644
index b8b637cca2..0000000000
--- a/meta/recipes-extended/ghostscript/ghostscript/mipsarcho32eb/objarch.h
+++ /dev/null
@@ -1,40 +0,0 @@
-/* Parameters derived from machine and compiler architecture. */
-/* This file is generated mechanically by genarch.c. */
-
-	 /* ---------------- Scalar alignments ---------------- */
-
-#define ARCH_ALIGN_SHORT_MOD 2
-#define ARCH_ALIGN_INT_MOD 4
-#define ARCH_ALIGN_LONG_MOD 4
-#define ARCH_ALIGN_PTR_MOD 4
-#define ARCH_ALIGN_FLOAT_MOD 4
-#define ARCH_ALIGN_DOUBLE_MOD 8
-
-	 /* ---------------- Scalar sizes ---------------- */
-
-#define ARCH_LOG2_SIZEOF_CHAR 0
-#define ARCH_LOG2_SIZEOF_SHORT 1
-#define ARCH_LOG2_SIZEOF_INT 2
-#define ARCH_LOG2_SIZEOF_LONG 2
-#define ARCH_LOG2_SIZEOF_LONG_LONG 3
-#define ARCH_SIZEOF_GX_COLOR_INDEX 4
-#define ARCH_SIZEOF_PTR 4
-#define ARCH_SIZEOF_FLOAT 4
-#define ARCH_SIZEOF_DOUBLE 8
-#define ARCH_FLOAT_MANTISSA_BITS 24
-#define ARCH_DOUBLE_MANTISSA_BITS 53
-
-	 /* ---------------- Unsigned max values ---------------- */
-
-#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
-#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
-#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
-#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
-
-	 /* ---------------- Miscellaneous ---------------- */
-
-#define ARCH_IS_BIG_ENDIAN 1
-#define ARCH_PTRS_ARE_SIGNED 0
-#define ARCH_FLOATS_ARE_IEEE 1
-#define ARCH_ARITH_RSHIFT 2
-#define ARCH_DIV_NEG_POS_TRUNCATES 1
diff --git a/meta/recipes-extended/ghostscript/ghostscript/mipsarcho32el/objarch.h b/meta/recipes-extended/ghostscript/ghostscript/mipsarcho32el/objarch.h
deleted file mode 100644
index 29f90ddf85..0000000000
--- a/meta/recipes-extended/ghostscript/ghostscript/mipsarcho32el/objarch.h
+++ /dev/null
@@ -1,40 +0,0 @@
-/* Parameters derived from machine and compiler architecture. */
-/* This file is generated mechanically by genarch.c. */
-
-	 /* ---------------- Scalar alignments ---------------- */
-
-#define ARCH_ALIGN_SHORT_MOD 2
-#define ARCH_ALIGN_INT_MOD 4
-#define ARCH_ALIGN_LONG_MOD 4
-#define ARCH_ALIGN_PTR_MOD 4
-#define ARCH_ALIGN_FLOAT_MOD 4
-#define ARCH_ALIGN_DOUBLE_MOD 8
-
-	 /* ---------------- Scalar sizes ---------------- */
-
-#define ARCH_LOG2_SIZEOF_CHAR 0
-#define ARCH_LOG2_SIZEOF_SHORT 1
-#define ARCH_LOG2_SIZEOF_INT 2
-#define ARCH_LOG2_SIZEOF_LONG 2
-#define ARCH_LOG2_SIZEOF_LONG_LONG 3
-#define ARCH_SIZEOF_GX_COLOR_INDEX 4
-#define ARCH_SIZEOF_PTR 4
-#define ARCH_SIZEOF_FLOAT 4
-#define ARCH_SIZEOF_DOUBLE 8
-#define ARCH_FLOAT_MANTISSA_BITS 24
-#define ARCH_DOUBLE_MANTISSA_BITS 53
-
-	 /* ---------------- Unsigned max values ---------------- */
-
-#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
-#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
-#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
-#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
-
-	 /* ---------------- Miscellaneous ---------------- */
-
-#define ARCH_IS_BIG_ENDIAN 0
-#define ARCH_PTRS_ARE_SIGNED 0
-#define ARCH_FLOATS_ARE_IEEE 1
-#define ARCH_ARITH_RSHIFT 2
-#define ARCH_DIV_NEG_POS_TRUNCATES 1
diff --git a/meta/recipes-extended/ghostscript/ghostscript/nios2/objarch.h b/meta/recipes-extended/ghostscript/ghostscript/nios2/objarch.h
deleted file mode 100644
index 3ec8101681..0000000000
--- a/meta/recipes-extended/ghostscript/ghostscript/nios2/objarch.h
+++ /dev/null
@@ -1,40 +0,0 @@
-/* Parameters derived from machine and compiler architecture. */
-/* This file is generated mechanically by genarch.c. */
-
-	 /* ---------------- Scalar alignments ---------------- */
-
-#define ARCH_ALIGN_SHORT_MOD 2
-#define ARCH_ALIGN_INT_MOD 4
-#define ARCH_ALIGN_LONG_MOD 4
-#define ARCH_ALIGN_PTR_MOD 4
-#define ARCH_ALIGN_FLOAT_MOD 4
-#define ARCH_ALIGN_DOUBLE_MOD 4
-
-	 /* ---------------- Scalar sizes ---------------- */
-
-#define ARCH_LOG2_SIZEOF_CHAR 0
-#define ARCH_LOG2_SIZEOF_SHORT 1
-#define ARCH_LOG2_SIZEOF_INT 2
-#define ARCH_LOG2_SIZEOF_LONG 2
-#define ARCH_LOG2_SIZEOF_LONG_LONG 3
-#define ARCH_SIZEOF_GX_COLOR_INDEX 8
-#define ARCH_SIZEOF_PTR 4
-#define ARCH_SIZEOF_FLOAT 4
-#define ARCH_SIZEOF_DOUBLE 8
-#define ARCH_FLOAT_MANTISSA_BITS 24
-#define ARCH_DOUBLE_MANTISSA_BITS 53
-
-	 /* ---------------- Unsigned max values ---------------- */
-
-#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
-#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
-#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
-#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
-
-	 /* ---------------- Miscellaneous ---------------- */
-
-#define ARCH_IS_BIG_ENDIAN 0
-#define ARCH_PTRS_ARE_SIGNED 0
-#define ARCH_FLOATS_ARE_IEEE 1
-#define ARCH_ARITH_RSHIFT 2
-#define ARCH_DIV_NEG_POS_TRUNCATES 1
diff --git a/meta/recipes-extended/ghostscript/ghostscript/powerpc/objarch.h b/meta/recipes-extended/ghostscript/ghostscript/powerpc/objarch.h
deleted file mode 100644
index 359097f356..0000000000
--- a/meta/recipes-extended/ghostscript/ghostscript/powerpc/objarch.h
+++ /dev/null
@@ -1,40 +0,0 @@
-/* Parameters derived from machine and compiler architecture. */
-/* This file is generated mechanically by genarch.c. */
-
-	 /* ---------------- Scalar alignments ---------------- */
-
-#define ARCH_ALIGN_SHORT_MOD 2
-#define ARCH_ALIGN_INT_MOD 4
-#define ARCH_ALIGN_LONG_MOD 4
-#define ARCH_ALIGN_PTR_MOD 4
-#define ARCH_ALIGN_FLOAT_MOD 4
-#define ARCH_ALIGN_DOUBLE_MOD 8
-
-	 /* ---------------- Scalar sizes ---------------- */
-
-#define ARCH_LOG2_SIZEOF_CHAR 0
-#define ARCH_LOG2_SIZEOF_SHORT 1
-#define ARCH_LOG2_SIZEOF_INT 2
-#define ARCH_LOG2_SIZEOF_LONG 2
-#define ARCH_LOG2_SIZEOF_LONG_LONG 3
-#define ARCH_SIZEOF_GX_COLOR_INDEX 8
-#define ARCH_SIZEOF_PTR 4
-#define ARCH_SIZEOF_FLOAT 4
-#define ARCH_SIZEOF_DOUBLE 8
-#define ARCH_FLOAT_MANTISSA_BITS 24
-#define ARCH_DOUBLE_MANTISSA_BITS 53
-
-	 /* ---------------- Unsigned max values ---------------- */
-
-#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
-#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
-#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
-#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
-
-	 /* ---------------- Miscellaneous ---------------- */
-
-#define ARCH_IS_BIG_ENDIAN 1
-#define ARCH_PTRS_ARE_SIGNED 0
-#define ARCH_FLOATS_ARE_IEEE 1
-#define ARCH_ARITH_RSHIFT 2
-#define ARCH_DIV_NEG_POS_TRUNCATES 1
diff --git a/meta/recipes-extended/ghostscript/ghostscript/powerpc64/objarch.h b/meta/recipes-extended/ghostscript/ghostscript/powerpc64/objarch.h
deleted file mode 100644
index 0d0a16bfa3..0000000000
--- a/meta/recipes-extended/ghostscript/ghostscript/powerpc64/objarch.h
+++ /dev/null
@@ -1,40 +0,0 @@
-/* Parameters derived from machine and compiler architecture. */
-/* This file is generated mechanically by genarch.c. */
-
-	 /* ---------------- Scalar alignments ---------------- */
-
-#define ARCH_ALIGN_SHORT_MOD 2
-#define ARCH_ALIGN_INT_MOD 4
-#define ARCH_ALIGN_LONG_MOD 8
-#define ARCH_ALIGN_PTR_MOD 8
-#define ARCH_ALIGN_FLOAT_MOD 4
-#define ARCH_ALIGN_DOUBLE_MOD 8
-
-	 /* ---------------- Scalar sizes ---------------- */
-
-#define ARCH_LOG2_SIZEOF_CHAR 0
-#define ARCH_LOG2_SIZEOF_SHORT 1
-#define ARCH_LOG2_SIZEOF_INT 2
-#define ARCH_LOG2_SIZEOF_LONG 3
-#define ARCH_LOG2_SIZEOF_LONG_LONG 3
-#define ARCH_SIZEOF_GX_COLOR_INDEX 8
-#define ARCH_SIZEOF_PTR 8
-#define ARCH_SIZEOF_FLOAT 4
-#define ARCH_SIZEOF_DOUBLE 8
-#define ARCH_FLOAT_MANTISSA_BITS 24
-#define ARCH_DOUBLE_MANTISSA_BITS 53
-
-	 /* ---------------- Unsigned max values ---------------- */
-
-#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
-#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
-#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
-#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
-
-	 /* ---------------- Miscellaneous ---------------- */
-
-#define ARCH_IS_BIG_ENDIAN 1
-#define ARCH_PTRS_ARE_SIGNED 0
-#define ARCH_FLOATS_ARE_IEEE 1
-#define ARCH_ARITH_RSHIFT 2
-#define ARCH_DIV_NEG_POS_TRUNCATES 1
diff --git a/meta/recipes-extended/ghostscript/ghostscript/powerpc64le/objarch.h b/meta/recipes-extended/ghostscript/ghostscript/powerpc64le/objarch.h
deleted file mode 100644
index a05de29def..0000000000
--- a/meta/recipes-extended/ghostscript/ghostscript/powerpc64le/objarch.h
+++ /dev/null
@@ -1,40 +0,0 @@
-/* Parameters derived from machine and compiler architecture. */
-/* This file is generated mechanically by genarch.c. */
-
-	 /* ---------------- Scalar alignments ---------------- */
-
-#define ARCH_ALIGN_SHORT_MOD 2
-#define ARCH_ALIGN_INT_MOD 4
-#define ARCH_ALIGN_LONG_MOD 8
-#define ARCH_ALIGN_PTR_MOD 8
-#define ARCH_ALIGN_FLOAT_MOD 4
-#define ARCH_ALIGN_DOUBLE_MOD 8
-
-	 /* ---------------- Scalar sizes ---------------- */
-
-#define ARCH_LOG2_SIZEOF_CHAR 0
-#define ARCH_LOG2_SIZEOF_SHORT 1
-#define ARCH_LOG2_SIZEOF_INT 2
-#define ARCH_LOG2_SIZEOF_LONG 3
-#define ARCH_LOG2_SIZEOF_LONG_LONG 3
-#define ARCH_SIZEOF_GX_COLOR_INDEX 8
-#define ARCH_SIZEOF_PTR 8
-#define ARCH_SIZEOF_FLOAT 4
-#define ARCH_SIZEOF_DOUBLE 8
-#define ARCH_FLOAT_MANTISSA_BITS 24
-#define ARCH_DOUBLE_MANTISSA_BITS 53
-
-	 /* ---------------- Unsigned max values ---------------- */
-
-#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
-#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
-#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
-#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
-
-	 /* ---------------- Miscellaneous ---------------- */
-
-#define ARCH_IS_BIG_ENDIAN 0
-#define ARCH_PTRS_ARE_SIGNED 0
-#define ARCH_FLOATS_ARE_IEEE 1
-#define ARCH_ARITH_RSHIFT 2
-#define ARCH_DIV_NEG_POS_TRUNCATES 1
diff --git a/meta/recipes-extended/ghostscript/ghostscript/x86-64/objarch.h b/meta/recipes-extended/ghostscript/ghostscript/x86-64/objarch.h
deleted file mode 100644
index a05de29def..0000000000
--- a/meta/recipes-extended/ghostscript/ghostscript/x86-64/objarch.h
+++ /dev/null
@@ -1,40 +0,0 @@
-/* Parameters derived from machine and compiler architecture. */
-/* This file is generated mechanically by genarch.c. */
-
-	 /* ---------------- Scalar alignments ---------------- */
-
-#define ARCH_ALIGN_SHORT_MOD 2
-#define ARCH_ALIGN_INT_MOD 4
-#define ARCH_ALIGN_LONG_MOD 8
-#define ARCH_ALIGN_PTR_MOD 8
-#define ARCH_ALIGN_FLOAT_MOD 4
-#define ARCH_ALIGN_DOUBLE_MOD 8
-
-	 /* ---------------- Scalar sizes ---------------- */
-
-#define ARCH_LOG2_SIZEOF_CHAR 0
-#define ARCH_LOG2_SIZEOF_SHORT 1
-#define ARCH_LOG2_SIZEOF_INT 2
-#define ARCH_LOG2_SIZEOF_LONG 3
-#define ARCH_LOG2_SIZEOF_LONG_LONG 3
-#define ARCH_SIZEOF_GX_COLOR_INDEX 8
-#define ARCH_SIZEOF_PTR 8
-#define ARCH_SIZEOF_FLOAT 4
-#define ARCH_SIZEOF_DOUBLE 8
-#define ARCH_FLOAT_MANTISSA_BITS 24
-#define ARCH_DOUBLE_MANTISSA_BITS 53
-
-	 /* ---------------- Unsigned max values ---------------- */
-
-#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
-#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
-#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
-#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
-
-	 /* ---------------- Miscellaneous ---------------- */
-
-#define ARCH_IS_BIG_ENDIAN 0
-#define ARCH_PTRS_ARE_SIGNED 0
-#define ARCH_FLOATS_ARE_IEEE 1
-#define ARCH_ARITH_RSHIFT 2
-#define ARCH_DIV_NEG_POS_TRUNCATES 1
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.50.bb b/meta/recipes-extended/ghostscript/ghostscript_9.52.bb
similarity index 87%
rename from meta/recipes-extended/ghostscript/ghostscript_9.50.bb
rename to meta/recipes-extended/ghostscript/ghostscript_9.52.bb
index 662db72b5e..65135f5821 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.50.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.52.bb
@@ -19,21 +19,22 @@ DEPENDS_class-native = "libpng-native"
 UPSTREAM_CHECK_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
 
-SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs950/${BPN}-${PV}.tar.gz \
+def gs_verdir(v):
+    return "".join(v.split("."))
+
+
+SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs${@gs_verdir("${PV}")}/${BPN}-${PV}.tar.gz \
                 file://ghostscript-9.15-parallel-make.patch \
                 file://ghostscript-9.16-Werror-return-type.patch \
                 file://do-not-check-local-libpng-source.patch \
                 file://avoid-host-contamination.patch \
                 file://mkdir-p.patch \
-                file://CVE-2019-14869-0001.patch \
-                file://CVE-2020-15900.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
            file://ghostscript-9.21-prevent_recompiling.patch \
-           file://ghostscript-9.02-genarch.patch \
-           file://objarch.h \
            file://cups-no-gcrypt.patch \
+           file://CVE-2020-15900.patch \
            "
 
 SRC_URI_class-native = "${SRC_URI_BASE} \
@@ -41,8 +42,8 @@ SRC_URI_class-native = "${SRC_URI_BASE} \
                         file://base-genht.c-add-a-preprocessor-define-to-allow-fope.patch \
                         "
 
-SRC_URI[md5sum] = "00970cf622bd5b46f68eec9383753870"
-SRC_URI[sha256sum] = "0f53e89fd647815828fc5171613e860e8535b68f7afbc91bf89aee886769ce89"
+SRC_URI[md5sum] = "0f6964ab9b83a63b7e373f136243f901"
+SRC_URI[sha256sum] = "c2501d8e8e0814c4a5aa7e443e230e73d7af7f70287546f7b697e5ef49e32176"
 
 # Put something like
 #
@@ -73,7 +74,7 @@ EXTRA_OECONF_class-native = "--without-x --with-system-libtiff=no \
                              --without-jbig2dec --without-libpaper \
                              --with-fontpath=${datadir}/fonts \
                              --without-libidn --disable-fontconfig \
-                             --disable-freetype --disable-cups"
+                             --enable-freetype --disable-cups "
 
 # This has been fixed upstream but for now we need to subvert the check for time.h
 # http://bugs.ghostscript.com/show_bug.cgi?id=692443
@@ -81,15 +82,7 @@ EXTRA_OECONF_class-native = "--without-x --with-system-libtiff=no \
 CFLAGS += "-DHAVE_SYS_TIME_H=1"
 BUILD_CFLAGS += "-DHAVE_SYS_TIME_H=1"
 
-inherit autotools
-
-do_configure_prepend () {
-	mkdir -p obj
-	mkdir -p soobj
-	if [ -e ${WORKDIR}/objarch.h ]; then
-		cp ${WORKDIR}/objarch.h obj/arch.h
-	fi
-}
+inherit autotools-brokensep
 
 do_configure_append () {
 	# copy tools from the native ghostscript build
-- 
2.17.1

