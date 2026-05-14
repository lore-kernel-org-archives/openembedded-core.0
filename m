Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A34BFCD4F39
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 13:31:06 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11047.1778765459101016473
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2026 06:30:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Ow5A6ZQe;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-44509921fbcso4095557f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 06:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778765457; x=1779370257; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0Qh1jRdL+a9/q5o68XxcuPUxurbU3ijseFUaSlOl/Pw=;
        b=Ow5A6ZQeEAF0LonWW6N6wSZKprreTYV9/TbK9eEklQ5SHhlMl6uCVZIBDdKyzUqJFA
         CKA0XgH0joLI/GiFXR4YqQx3LsqGbV7gYSGG2Q00jShgPXQEiRDaXrritD2pNj/y1vmr
         EyOh2Fn9vDWsVOLzJCEt97QyHDrT1gGscqwpLd0k4XzbGfDb0QcU8p4C0S5x6bbmuAqo
         YWcQ9G8iesYpQfiHzkpxrab3I01rOFO/92AsfDi7x4oI7ZPDCp+xeF7GAWQ0oyi1SDGF
         ZOONzEW0+WolsiBRkwQCUR5ER9IJYAQKANCFyhIpOkD762/IcZgd0yuoOFQQeFUBmSbq
         roKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778765457; x=1779370257;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Qh1jRdL+a9/q5o68XxcuPUxurbU3ijseFUaSlOl/Pw=;
        b=PmkI3giLOuYj7TRvhq2nALdgPUN9LEzSbmDDCGwN/IgfYghZ51gsjmU4O3Jb+Ur7ER
         bwwT6QT2qDdgLZe6ShczhR8B+D6jLq9FonC8Tkzjh8wsU9W0hnlHpBNGHgaVAs29DByB
         nBvzWRPjU5S0X6c1Xp105Rv4MB0xhUhcri6W24gFVzzSBFreV/aPbR8ahTWpAZ57qApo
         7+mFEmcfM9YZ7nu35yIjp7TDGNXnWRSI2BI9DcTj97EZWWeuPLHLBX8keInXF6G/pR0U
         OWP6tOqUMHMRYSuUUk8hugf0cGXIEFYOQgDDs2jc08WjkhRqXJbrjMK1SDfrsFqYwTH+
         jYBg==
X-Gm-Message-State: AOJu0Yza1e0RXL8Mx0a/mBWG9VRZyZ5LciklH3XB6M3TXTpVkg1yl4fC
	s+8rSa2aSikTrm1qAU7adl+T/v7qmoB28UW7NL7OSKgQafFive2le5BbI8SGYA==
X-Gm-Gg: Acq92OHPG49R0VsnZCb/vswNqHgm5HZEmeBMOhG9prBD1QmiWbq28Pn/QG8ijh7891c
	GUHdioA1/3s2Z2TdVUXNQtHfCrTEtRPxnLG+TwUYOHfe0B9Oq1DgsWC6fWUngvq0iizbTpLix+Y
	/kQwrm+tHM6BUZVmse4xBRQiKZcECAo54la8RsTpet0/yaTkDa5/zY27NFtTmd413uXii4mRy1n
	FqTvcue3GUFhXKRg+wVGpB63+EiUSvss5jExkcsgWFNGpQEF+kNiPyQBCSS6qbJHMXicJyrjqRT
	mgmbgfuaGRq1pl9GyXAY6FISz/Tu4Gqu7Mhk7BgiLMY4VIo4v3VWnnOMHXtbkgHlsyV3oh1k+jt
	bkiZq9LtzDnnVwRsb8ZOBLIiE+1QLiI5WqeCsT2p0TBEz2FdNNkDV7Krks0CMZe56j1KqsPovr2
	74oSHlUyMav0QiXfRpK9TcCv2NOKIBS4BAwkwbOqwIolF9yg==
X-Received: by 2002:a05:6000:2485:b0:44d:67f7:e1a6 with SMTP id ffacd0b85a97d-45c79f29cf9mr12422005f8f.20.1778765457155;
        Thu, 14 May 2026 06:30:57 -0700 (PDT)
Received: from localhost.localdomain ([81.15.96.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e768072sm6767958f8f.5.2026.05.14.06.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 06:30:56 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [scarthgap][PATCH] libgcrypt: upgrade 1.10.3 -> 1.10.4
Date: Thu, 14 May 2026 13:30:22 +0000
Message-ID: <20260514133022.56169-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 13:31:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237030

Fixes CVE-2026-41989

Full changelog:
https://github.com/gpg/libgcrypt/compare/libgcrypt-1.10.3...libgcrypt-1.10.4

Noteworthy changes in version 1.10.4 (2026-04-21)  [C24/A4/R4]
-------------------------------------------------

 * Bug fixes:
   - Fix possible ECDH buffer overwrite with zeroes.  [T8211]
   - Fix AESWRAP padding length check.  [T7130]

 * Other:
   - Handle HAVE_BROKEN_MLOCK for the case of building with ASAN.
     [T7889]

 Release-info: https://dev.gnupg.org/T8233

CVE: CVE-2026-41989
Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 ...ilding-error-with-O2-in-sysroot-path.patch | 64 -------------------
 ...01-libgcrypt-fix-m4-file-for-oe-core.patch |  3 +-
 ...m-fix-undefined-reference-to-pthread.patch |  9 ++-
 .../libgcrypt/files/no-bench-slope.patch      | 12 +++-
 .../libgcrypt/files/no-native-gpg-error.patch | 10 ++-
 ...ibgcrypt_1.10.3.bb => libgcrypt_1.10.4.bb} |  3 +-
 6 files changed, 25 insertions(+), 76 deletions(-)
 delete mode 100644 meta/recipes-support/libgcrypt/files/0001-Fix-building-error-with-O2-in-sysroot-path.patch
 rename meta/recipes-support/libgcrypt/{libgcrypt_1.10.3.bb => libgcrypt_1.10.4.bb} (92%)

diff --git a/meta/recipes-support/libgcrypt/files/0001-Fix-building-error-with-O2-in-sysroot-path.patch b/meta/recipes-support/libgcrypt/files/0001-Fix-building-error-with-O2-in-sysroot-path.patch
deleted file mode 100644
index dee4969f35..0000000000
--- a/meta/recipes-support/libgcrypt/files/0001-Fix-building-error-with-O2-in-sysroot-path.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From b99952adc6ee611641709610d2e4dc90ba9acf37 Mon Sep 17 00:00:00 2001
-From: "simit.ghane" <simit.ghane@lge.com>
-Date: Tue, 7 May 2024 14:09:03 +0530
-Subject: [PATCH] Fix building error with '-O2' in sysroot path
-
-* cipher/Makefile.am (o_flag_munging): Tweak the sed script.
-* random/Makefile.am (o_flag_munging): Ditto.
---
-
-Characters like '-O2' or '-Ofast' will be replaced by '-O1' and '-O0'
-respectively when compiling cipher and random in the filesystem
-paths as well if they happen to contain '-O2' or '-Ofast
-
-If we are cross compiling libgcrypt and sysroot contains such
-characters, we would
-get compile errors because the sysroot path has been modified.
-
-Fix this by adding blank spaces and tabs before the original matching
-pattern in the sed command.
-
-Signed-off-by: simit.ghane <simit.ghane@lge.com>
-
-ChangeLog entries added by wk
-
-Note that there is also the configure option --disable-O-flag-munging;
-see the README.
-
-Upstream-Status: Backport [https://dev.gnupg.org/rCb99952adc6ee611641709610d2e4dc90ba9acf37 https://dev.gnupg.org/rC5afadba008918d651afefb842ae123cc18454c74]
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- cipher/Makefile.am | 2 +-
- random/Makefile.am | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/cipher/Makefile.am b/cipher/Makefile.am
-index 2c39586e..a914ed2b 100644
---- a/cipher/Makefile.am
-+++ b/cipher/Makefile.am
-@@ -168,7 +168,7 @@ gost-s-box$(EXEEXT_FOR_BUILD): gost-s-box.c
- 
- 
- if ENABLE_O_FLAG_MUNGING
--o_flag_munging = sed -e 's/-O\([2-9sgz][2-9sgz]*\)/-O1/' -e 's/-Ofast/-O1/g'
-+o_flag_munging = sed -e 's/[[:blank:]]-O\([2-9sgz][2-9sgz]*\)/ -O1 /g' -e 's/[[:blank:]]-Ofast/ -O1 /g'
- else
- o_flag_munging = cat
- endif
-diff --git a/random/Makefile.am b/random/Makefile.am
-index 0c935a05..340df38a 100644
---- a/random/Makefile.am
-+++ b/random/Makefile.am
-@@ -56,7 +56,7 @@ jitterentropy-base.c jitterentropy.h jitterentropy-base-user.h
- 
- # The rndjent module needs to be compiled without optimization.  */
- if ENABLE_O_FLAG_MUNGING
--o_flag_munging = sed -e 's/-O\([1-9sgz][1-9sgz]*\)/-O0/g' -e 's/-Ofast/-O0/g'
-+o_flag_munging = sed -e 's/[[:blank:]]-O\([1-9sgz][1-9sgz]*\)/ -O0 /g' -e 's/[[:blank:]]-Ofast/ -O0 /g'
- else
- o_flag_munging = cat
- endif
--- 
-2.44.1
-
diff --git a/meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-file-for-oe-core.patch b/meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-file-for-oe-core.patch
index cbfa30f0ad..9206453d2a 100644
--- a/meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-file-for-oe-core.patch
+++ b/meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-file-for-oe-core.patch
@@ -1,4 +1,4 @@
-From bcfd89abdb5110b93314297120412d4c7f2da313 Mon Sep 17 00:00:00 2001
+From 17f9b99ec4d6db91180ed39641f27a7c66cfb412 Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <trevor.gamblin@windriver.com>
 Date: Tue, 29 Oct 2019 14:08:32 -0400
 Subject: [PATCH] libgcrypt: fix m4 file for oe-core
@@ -11,7 +11,6 @@ settings.
 Upstream-Status: Inappropriate [oe-specific]
 
 Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
-
 ---
  src/libgcrypt.m4 | 90 +++---------------------------------------------
  1 file changed, 4 insertions(+), 86 deletions(-)
diff --git a/meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch b/meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch
index 4233fa7877..daf4d30b1f 100644
--- a/meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch
+++ b/meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch
@@ -1,4 +1,4 @@
-From 9182bc2dc676858a823c477d8f45a578b8c4f69f Mon Sep 17 00:00:00 2001
+From df905c6d2fcd5a8044e3ec9fcd5082b764540dd9 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Sun, 12 Jun 2016 04:44:29 -0400
 Subject: [PATCH] tests/Makefile.am: fix undefined reference to
@@ -9,16 +9,15 @@ Add missing '-lpthread' to CFLAGS
 Upstream-Status: Pending
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
 ---
  tests/Makefile.am | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index e6953fd..f47e1d3 100644
+index 302d923..b302ad5 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -76,7 +76,7 @@ t_mpi_bit_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
+@@ -87,7 +87,7 @@ t_mpi_bit_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
  t_secmem_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
  testapi_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
  t_lock_LDADD = $(standard_ldadd) $(GPG_ERROR_MT_LIBS) @LDADD_FOR_TESTS_KLUDGE@
@@ -27,7 +26,7 @@ index e6953fd..f47e1d3 100644
  testdrv_LDADD = $(LDADD_FOR_TESTS_KLUDGE)
  
  # Build a version of the test driver for the build platform.
-@@ -95,7 +95,7 @@ else
+@@ -106,7 +106,7 @@ else
  xtestsuite_libs = ../src/.libs/libgcrypt.so*
  xtestsuite_driver = testdrv
  t_kdf_LDADD = $(standard_ldadd) $(GPG_ERROR_MT_LIBS) @LDADD_FOR_TESTS_KLUDGE@
diff --git a/meta/recipes-support/libgcrypt/files/no-bench-slope.patch b/meta/recipes-support/libgcrypt/files/no-bench-slope.patch
index 8de3c6713b..0a8eb56f10 100644
--- a/meta/recipes-support/libgcrypt/files/no-bench-slope.patch
+++ b/meta/recipes-support/libgcrypt/files/no-bench-slope.patch
@@ -1,3 +1,8 @@
+From 164870c01911c48a8f0ea4e93bff1f05ff5c13ca Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Fri, 9 Sep 2022 11:13:37 +0100
+Subject: [PATCH] libgcrypt: disable bench-slope test case
+
 The bench-slope test appears to be aborting fairly frequently, which causes
 failures on the autobuilder.
 
@@ -5,12 +10,15 @@ Until this has been root-caused, disable the test.
 
 Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ tests/testdrv.c | 1 -
+ 1 file changed, 1 deletion(-)
 
 diff --git a/tests/testdrv.c b/tests/testdrv.c
-index 0ccde326..d3455186 100644
+index 6d6abd5..d345518 100644
 --- a/tests/testdrv.c
 +++ b/tests/testdrv.c
-@@ -77,7 +77,6 @@ static struct {
+@@ -76,7 +76,6 @@ static struct {
     { "t-x448"      },
     { "t-ed448"     },
     { "benchmark"   },
diff --git a/meta/recipes-support/libgcrypt/files/no-native-gpg-error.patch b/meta/recipes-support/libgcrypt/files/no-native-gpg-error.patch
index b9a607863d..c6b40b04b5 100644
--- a/meta/recipes-support/libgcrypt/files/no-native-gpg-error.patch
+++ b/meta/recipes-support/libgcrypt/files/no-native-gpg-error.patch
@@ -1,11 +1,19 @@
+From dedc54234af84503de085e5b04f2bfe2d5ec63b3 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Fri, 26 Aug 2022 15:23:37 +0100
+Subject: [PATCH] libgcrypt: rewrite ptest
+
 Don't depend on a native libgpg-error to build the test driver, as it's
 an optional dependency for some C annotations.
 
 Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ tests/testdrv.c | 1 -
+ 1 file changed, 1 deletion(-)
 
 diff --git a/tests/testdrv.c b/tests/testdrv.c
-index 0ccde326..6d6abd57 100644
+index 0ccde32..6d6abd5 100644
 --- a/tests/testdrv.c
 +++ b/tests/testdrv.c
 @@ -32,7 +32,6 @@
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.10.4.bb
similarity index 92%
rename from meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb
rename to meta/recipes-support/libgcrypt/libgcrypt_1.10.4.bb
index 3d49d586bb..a3b5bd06cc 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.10.4.bb
@@ -25,9 +25,8 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
            file://no-native-gpg-error.patch \
            file://no-bench-slope.patch \
            file://run-ptest \
-           file://0001-Fix-building-error-with-O2-in-sysroot-path.patch \
            "
-SRC_URI[sha256sum] = "8b0870897ac5ac67ded568dcfadf45969cfa8a6beb0fd60af2a9eadc2a3272aa"
+SRC_URI[sha256sum] = "d6d2f835a79711ceba54b53d1081d388d24fb0341d79a268a6557e12908a90a0"
 
 BINCONFIG = "${bindir}/libgcrypt-config"
 
-- 
2.43.0


