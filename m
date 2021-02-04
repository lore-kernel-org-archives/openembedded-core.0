Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web12.3831.1612477921101668163
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Feb 2021 14:32:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=cn7OWqmg;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id l18so2659503pji.3
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Feb 2021 14:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MYq3+f/sATCIIXHzH+K8MwYYoykL+0BZhRt0Cr4RhgA=;
        b=cn7OWqmgwTCDHGYBCEBMO4F5WRHrUarYetUkHEKjc/U6ebsH7M+6hQcrgkU16ezdXE
         kEVyYEgbNWx4sKtCq/ThY+m5dsACCoF4LkNLjipqWdMQIx2A56gQN7Kr+4d9Bbo0XMSz
         q2fN/ji3qyKbYbrHnCux/pw12tR/0vHgxuIULVDe43O/BnUaO2pgXMclHfjDpLESJXN1
         mcazQVYH4ww11J8SwVY3cSLMpHE52ajsXjbrBlHLRm+ggW8GQ7g0DzrvCEcpCmBBuOgB
         s6ZhihDhH0dzlOq/NVh2wWcCv5tm0FcWSGMFfnZQwqdH8M0W9plP+xnpYEnk6M+S9rdT
         LsQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MYq3+f/sATCIIXHzH+K8MwYYoykL+0BZhRt0Cr4RhgA=;
        b=eQ4i6A9wlaoPE6uI68r0E348YNrsWSoGbDnFrliqdGH3TTfX8JOiT0eqmK1VN2wqfA
         LKlrnBaHa9CMEVMhJvy9dht0UtK/yiC4UU6mJmD0FD6NBMevv6bUcSE+QjVVMHFSJwZ5
         j4FgsAZEJpmH2DfEozkL5/PqSh5Q5m3licWbInYENWxGlBxvhy9figzo4fHzREMLa4aC
         CKMhe7L3H8Ux8y1K1JMRQu/rfbUsAJsQZLV0zcYLogTCBHEN4ov8xeINpqtTcGjP+uQb
         5WSW6n7Koqeawjty8jKdsiEnJD2XkQdaaT8JvcjMdjZt8+rzo6wz9Ubw7UmIS4iVJKYV
         xyUQ==
X-Gm-Message-State: AOAM5334v/EvK5RiUaaknbDeFgrCTen4c+80zFRGclPZqXG//R1HzRuv
	NjEyGK/f6yuTnQx/RbaRQ0hMX6iZIv+zjHOOYXM=
X-Google-Smtp-Source: ABdhPJxgRuZQN7H4O1G0l9L051YTLSHFy3auOCsO4y84arUn+bqf6k7/9cVQH8Rc5CM3ZF/VqvLbnw==
X-Received: by 2002:a17:90a:e392:: with SMTP id b18mr1165865pjz.33.1612477919595;
        Thu, 04 Feb 2021 14:31:59 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id h11sm6014203pjg.46.2021.02.04.14.31.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 14:31:58 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [[OE-core][master V2] glibc: update to latest release/2.32/master branch
Date: Thu,  4 Feb 2021 12:31:25 -1000
Message-Id: <20210204223125.2149643-1-steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove patches for CVE-2019-25013 and CVE-2020-27618 since they are
present in the branch now. Add both CVEs to CVE_CHECK_WHITELIST.

760e1d28782 gconv: Fix assertion failure in ISO-2022-JP-3 module (bug 27256)
d3cb8f6222a aarch64: fix static PIE start code for BTI [BZ #27068]
082798622d8 __vfscanf_internal: fix aliasing violation (bug 26690)
33dc30bc838 aarch64: Use mmap to add PROT_BTI instead of mprotect [BZ #26831]
46e1e64fe3e elf: Pass the fd to note processing
b6eae83717d elf: Move note processing after l_phdr is updated
c6090dcebd1 aarch64: align address for BTI protection [BZ #26988]
610e2c51504 aarch64: Fix missing BTI protection from dependencies [BZ #26926]
4c619b3eed5 x86: Check IFUNC definition in unrelocated executable [BZ #20019]
87450ecf8a8 x86: Set header.feature_1 in TCB for always-on CET [BZ #27177]
2b4f67c2b33 Update for [BZ #27130] fix
1a24bbd43e4 x86-64: Avoid rep movsb with short distance [BZ #27130]
0d9793e82a1 Fix buffer overrun in EUC-KR conversion module (bz #24973)
1d49bede4d8 tests-mcheck: New variable to run tests with MALLOC_CHECK_=3
050022910be iconv: Accept redundant shift sequences in IBM1364 [BZ #26224]
ac0a6929c5d sh: Add sh4 fpu Implies folder
3ea24955bff struct _Unwind_Exception alignment should not depend on compiler flags
5c36293f067 resolv: Serialize processing in resolv/tst-resolv-txnid-collision
2dfa659a66f resolv: Handle transaction ID collisions in parallel queries (bug 26600)
05c025abca1 support: Provide a way to clear the RA bit in DNS server responses
f688bcd83de support: Provide a way to reorder responses within the DNS test server
eba0ce60588 Remove __warndecl
5337b2af4b8 Remove __warn_memset_zero_len [BZ #25399]
c6e794640c3 aarch64: Add unwind information to _start (bug 26853)
70ee5e8b573 aarch64: Fix DT_AARCH64_VARIANT_PCS handling [BZ #26798]
8813b2682e4 x86: Optimizing memcpy for AMD Zen architecture.
e61a8fd8fad Reversing calculation of __x86_shared_non_temporal_threshold
0b9460d22e2 sysvipc: Fix IPC_INFO and SHM_INFO handling [BZ #26636]
c4aeedea598 sysvipc: Fix IPC_INFO and MSG_INFO handling [BZ #26639]
9b139b6b81a sysvipc: Fix SEM_STAT_ANY kernel argument pass [BZ #26637]
81c5484d93a AArch64: Use __memcpy_simd on Neoverse N2/V1
0f8f0ed25c1 AArch64: Improve backwards memmove performance
23482f78866 Set version.h RELEASE to "stable" (Bug 26700)
69beb5cbf85 string: Fix strerrorname_np return value [BZ #26555]
fe62c4d173f intl: Handle translation output codesets with suffixes [BZ #26383]
386543bc449 NEWS: Update for [BZ #26534] fix
cebc01cbfd6 x86-64: Fix FMA4 detection in ifunc [BZ #26534]

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
V2: delete the CVE patch files

 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 .../glibc/glibc/CVE-2019-25013.patch          | 137 ------------------
 .../glibc/glibc/CVE-2020-27618.patch          |  91 ------------
 meta/recipes-core/glibc/glibc_2.32.bb         |   5 +-
 4 files changed, 3 insertions(+), 232 deletions(-)
 delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2019-25013.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2020-27618.patch

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 1566056297..586b2e207e 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.32/master"
 PV = "2.32"
-SRCREV_glibc ?= "3de512be7ea6053255afed6154db9ee31d4e557a"
+SRCREV_glibc ?= "760e1d287825fa91d4d5a0cc921340c740d803e2"
 SRCREV_localedef ?= "bd644c9e6f3e20c5504da1488448173c69c56c28"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
diff --git a/meta/recipes-core/glibc/glibc/CVE-2019-25013.patch b/meta/recipes-core/glibc/glibc/CVE-2019-25013.patch
deleted file mode 100644
index 987e959db2..0000000000
--- a/meta/recipes-core/glibc/glibc/CVE-2019-25013.patch
+++ /dev/null
@@ -1,137 +0,0 @@
-From ee7a3144c9922808181009b7b3e50e852fb4999b Mon Sep 17 00:00:00 2001
-From: Andreas Schwab <schwab@suse.de>
-Date: Mon, 21 Dec 2020 08:56:43 +0530
-Subject: [PATCH] Fix buffer overrun in EUC-KR conversion module (bz #24973)
-
-The byte 0xfe as input to the EUC-KR conversion denotes a user-defined
-area and is not allowed.  The from_euc_kr function used to skip two bytes
-when told to skip over the unknown designation, potentially running over
-the buffer end.
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=patch;h=ee7a3144c9922808181009b7b3e50e852fb4999b]
-CVE: CVE-2019-25013
-Signed-off-by: Scott Murray <scott.murray@konsulko.com>
----
- iconvdata/Makefile      |  3 ++-
- iconvdata/bug-iconv13.c | 53 +++++++++++++++++++++++++++++++++++++++++
- iconvdata/euc-kr.c      |  6 +----
- iconvdata/ksc5601.h     |  6 ++---
- 4 files changed, 59 insertions(+), 9 deletions(-)
- create mode 100644 iconvdata/bug-iconv13.c
-
-diff --git a/iconvdata/Makefile b/iconvdata/Makefile
-index 4ec2741cdc..85009f3390 100644
---- a/iconvdata/Makefile
-+++ b/iconvdata/Makefile
-@@ -73,7 +73,8 @@ modules.so := $(addsuffix .so, $(modules))
- ifeq (yes,$(build-shared))
- tests = bug-iconv1 bug-iconv2 tst-loading tst-e2big tst-iconv4 bug-iconv4 \
- 	tst-iconv6 bug-iconv5 bug-iconv6 tst-iconv7 bug-iconv8 bug-iconv9 \
--	bug-iconv10 bug-iconv11 bug-iconv12 tst-iconv-big5-hkscs-to-2ucs4
-+	bug-iconv10 bug-iconv11 bug-iconv12 tst-iconv-big5-hkscs-to-2ucs4 \
-+	bug-iconv13
- ifeq ($(have-thread-library),yes)
- tests += bug-iconv3
- endif
-diff --git a/iconvdata/bug-iconv13.c b/iconvdata/bug-iconv13.c
-new file mode 100644
-index 0000000000..87aaff398e
---- /dev/null
-+++ b/iconvdata/bug-iconv13.c
-@@ -0,0 +1,53 @@
-+/* bug 24973: Test EUC-KR module
-+   Copyright (C) 2020 Free Software Foundation, Inc.
-+   This file is part of the GNU C Library.
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, see
-+   <https://www.gnu.org/licenses/>.  */
-+
-+#include <errno.h>
-+#include <iconv.h>
-+#include <stdio.h>
-+#include <support/check.h>
-+
-+static int
-+do_test (void)
-+{
-+  iconv_t cd = iconv_open ("UTF-8//IGNORE", "EUC-KR");
-+  TEST_VERIFY_EXIT (cd != (iconv_t) -1);
-+
-+  /* 0xfe (->0x7e : row 94) and 0xc9 (->0x49 : row 41) are user-defined
-+     areas, which are not allowed and should be skipped over due to
-+     //IGNORE.  The trailing 0xfe also is an incomplete sequence, which
-+     should be checked first.  */
-+  char input[4] = { '\xc9', '\xa1', '\0', '\xfe' };
-+  char *inptr = input;
-+  size_t insize = sizeof (input);
-+  char output[4];
-+  char *outptr = output;
-+  size_t outsize = sizeof (output);
-+
-+  /* This used to crash due to buffer overrun.  */
-+  TEST_VERIFY (iconv (cd, &inptr, &insize, &outptr, &outsize) == (size_t) -1);
-+  TEST_VERIFY (errno == EINVAL);
-+  /* The conversion should produce one character, the converted null
-+     character.  */
-+  TEST_VERIFY (sizeof (output) - outsize == 1);
-+
-+  TEST_VERIFY_EXIT (iconv_close (cd) != -1);
-+
-+  return 0;
-+}
-+
-+#include <support/test-driver.c>
-diff --git a/iconvdata/euc-kr.c b/iconvdata/euc-kr.c
-index b0d56cf3ee..1045bae926 100644
---- a/iconvdata/euc-kr.c
-+++ b/iconvdata/euc-kr.c
-@@ -80,11 +80,7 @@ euckr_from_ucs4 (uint32_t ch, unsigned char *cp)
- 									      \
-     if (ch <= 0x9f)							      \
-       ++inptr;								      \
--    /* 0xfe(->0x7e : row 94) and 0xc9(->0x59 : row 41) are		      \
--       user-defined areas.  */						      \
--    else if (__builtin_expect (ch == 0xa0, 0)				      \
--	     || __builtin_expect (ch > 0xfe, 0)				      \
--	     || __builtin_expect (ch == 0xc9, 0))			      \
-+    else if (__glibc_unlikely (ch == 0xa0))				      \
-       {									      \
- 	/* This is illegal.  */						      \
- 	STANDARD_FROM_LOOP_ERR_HANDLER (1);				      \
-diff --git a/iconvdata/ksc5601.h b/iconvdata/ksc5601.h
-index d3eb3a4ff8..f5cdc72797 100644
---- a/iconvdata/ksc5601.h
-+++ b/iconvdata/ksc5601.h
-@@ -50,15 +50,15 @@ ksc5601_to_ucs4 (const unsigned char **s, size_t avail, unsigned char offset)
-   unsigned char ch2;
-   int idx;
- 
-+  if (avail < 2)
-+    return 0;
-+
-   /* row 94(0x7e) and row 41(0x49) are user-defined area in KS C 5601 */
- 
-   if (ch < offset || (ch - offset) <= 0x20 || (ch - offset) >= 0x7e
-       || (ch - offset) == 0x49)
-     return __UNKNOWN_10646_CHAR;
- 
--  if (avail < 2)
--    return 0;
--
-   ch2 = (*s)[1];
-   if (ch2 < offset || (ch2 - offset) <= 0x20 || (ch2 - offset) >= 0x7f)
-     return __UNKNOWN_10646_CHAR;
--- 
-2.27.0
-
diff --git a/meta/recipes-core/glibc/glibc/CVE-2020-27618.patch b/meta/recipes-core/glibc/glibc/CVE-2020-27618.patch
deleted file mode 100644
index bf32238357..0000000000
--- a/meta/recipes-core/glibc/glibc/CVE-2020-27618.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From 20e6c868c29f5a6121cbb88f3387bb9b884a4206 Mon Sep 17 00:00:00 2001
-From: Arjun Shankar <arjun@redhat.com>
-Date: Wed, 4 Nov 2020 12:19:38 +0100
-Subject: [PATCH] iconv: Accept redundant shift sequences in IBM1364 [BZ
- #26224]
-
-The IBM1364, IBM1371, IBM1388, IBM1390 and IBM1399 character sets
-share converter logic (iconvdata/ibm1364.c) which would reject
-redundant shift sequences when processing input in these character
-sets.  This led to a hang in the iconv program (CVE-2020-27618).
-
-This commit adjusts the converter to ignore redundant shift sequences
-and adds test cases for iconv_prog hangs that would be triggered upon
-their rejection.  This brings the implementation in line with other
-converters that also ignore redundant shift sequences (e.g. IBM930
-etc., fixed in commit 692de4b3960d).
-
-Reviewed-by: Carlos O'Donell <carlos@redhat.com>
-
-Upstream-Status: Backport
-[https://sourceware.org/git/?p=glibc.git;a=commit;
-h=9a99c682144bdbd40792ebf822fe9264e0376fb5]
-
-CVE: CVE-2020-27618
-Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
----
- iconv/tst-iconv_prog.sh | 16 ++++++++++------
- iconvdata/ibm1364.c     | 14 ++------------
- 2 files changed, 12 insertions(+), 18 deletions(-)
-
-diff --git a/iconv/tst-iconv_prog.sh b/iconv/tst-iconv_prog.sh
-index 8298136b7f..d8db7b335c 100644
---- a/iconv/tst-iconv_prog.sh
-+++ b/iconv/tst-iconv_prog.sh
-@@ -102,12 +102,16 @@ hangarray=(
- "\x00\x80;-c;IBM1161;UTF-8//TRANSLIT//IGNORE"
- "\x00\xdb;-c;IBM1162;UTF-8//TRANSLIT//IGNORE"
- "\x00\x70;-c;IBM12712;UTF-8//TRANSLIT//IGNORE"
--# These are known hangs that are yet to be fixed:
--# "\x00\x0f;-c;IBM1364;UTF-8"
--# "\x00\x0f;-c;IBM1371;UTF-8"
--# "\x00\x0f;-c;IBM1388;UTF-8"
--# "\x00\x0f;-c;IBM1390;UTF-8"
--# "\x00\x0f;-c;IBM1399;UTF-8"
-+"\x00\x0f;-c;IBM1364;UTF-8"
-+"\x0e\x0e;-c;IBM1364;UTF-8"
-+"\x00\x0f;-c;IBM1371;UTF-8"
-+"\x0e\x0e;-c;IBM1371;UTF-8"
-+"\x00\x0f;-c;IBM1388;UTF-8"
-+"\x0e\x0e;-c;IBM1388;UTF-8"
-+"\x00\x0f;-c;IBM1390;UTF-8"
-+"\x0e\x0e;-c;IBM1390;UTF-8"
-+"\x00\x0f;-c;IBM1399;UTF-8"
-+"\x0e\x0e;-c;IBM1399;UTF-8"
- "\x00\x53;-c;IBM16804;UTF-8//TRANSLIT//IGNORE"
- "\x00\x41;-c;IBM274;UTF-8//TRANSLIT//IGNORE"
- "\x00\x41;-c;IBM275;UTF-8//TRANSLIT//IGNORE"
-diff --git a/iconvdata/ibm1364.c b/iconvdata/ibm1364.c
-index 49e7267ab4..521f0825b7 100644
---- a/iconvdata/ibm1364.c
-+++ b/iconvdata/ibm1364.c
-@@ -158,24 +158,14 @@ enum
- 									      \
-     if (__builtin_expect (ch, 0) == SO)					      \
-       {									      \
--	/* Shift OUT, change to DBCS converter.  */			      \
--	if (curcs == db)						      \
--	  {								      \
--	    result = __GCONV_ILLEGAL_INPUT;				      \
--	    break;							      \
--	  }								      \
-+	/* Shift OUT, change to DBCS converter (redundant escape okay).  */   \
- 	curcs = db;							      \
- 	++inptr;							      \
- 	continue;							      \
-       }									      \
-     if (__builtin_expect (ch, 0) == SI)					      \
-       {									      \
--	/* Shift IN, change to SBCS converter.  */			      \
--	if (curcs == sb)						      \
--	  {								      \
--	    result = __GCONV_ILLEGAL_INPUT;				      \
--	    break;							      \
--	  }								      \
-+	/* Shift IN, change to SBCS converter (redundant escape okay).  */    \
- 	curcs = sb;							      \
- 	++inptr;							      \
- 	continue;							      \
--- 
-2.29.2
-
diff --git a/meta/recipes-core/glibc/glibc_2.32.bb b/meta/recipes-core/glibc/glibc_2.32.bb
index 2d9c707a0b..249f59176e 100644
--- a/meta/recipes-core/glibc/glibc_2.32.bb
+++ b/meta/recipes-core/glibc/glibc_2.32.bb
@@ -1,7 +1,8 @@
 require glibc.inc
 require glibc-version.inc
 
-CVE_CHECK_WHITELIST += "CVE-2020-10029"
+# whitelist CVE's with fixes in latest release/2.32/master branch
+CVE_CHECK_WHITELIST += "CVE-2019-25013 CVE-2020-10029 CVE-2020-27618"
 
 DEPENDS += "gperf-native bison-native make-native"
 
@@ -45,8 +46,6 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0031-linux-Allow-adjtime-with-NULL-argument-BZ-26833.patch \
            file://CVE-2020-29562.patch \
            file://CVE-2020-29573.patch \
-           file://CVE-2019-25013.patch \
-           file://CVE-2020-27618.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.25.1

