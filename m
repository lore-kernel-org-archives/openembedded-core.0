Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web12.1250.1610655199468310933
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jan 2021 12:13:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RruEx6tP;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id g15so4508722pgu.9
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Jan 2021 12:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=df2l6QQqGSL9c5kBSWE54wG7MxtWr1FYPR3j+nO7xco=;
        b=RruEx6tPc7meNC51YmMuhAD3V2C5SHT+MNOIe3hDhM9TxJ7160gSlYg7HAKH4Ky0qm
         aDRZ6Pq+rbVt+y2Ep/WQIg2u+fqrGUWxz3JdHb7BvaXRobyjTExqPG2Zf+IM9JwI2M0I
         0Iw5wzPWmPaeJcG+5dkqKf56SRSkAWnRNa7kFBHpOlE1OFKP5BLJN02WRj9lqT5Aij2A
         psECpXpbjTlQ+cFXpq6f6qMuRLTyrxr474JVy3KxIfgfeQ96QzprT01lyaLuoupQmz+o
         GDbz7JTbuWQVI6WM35Pc8gqAGtt0g84xgUPxjWvVT+Z0HA8SdaqpUIxZcgf/mIy5Up6t
         FhYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=df2l6QQqGSL9c5kBSWE54wG7MxtWr1FYPR3j+nO7xco=;
        b=LmDgB79AgTcUqZQbVDl99V7DtFcJau26lhYEmEE9U7wZHchJy9j2k09qg/WxtUH1hh
         f+9aS916hv9fO3HWha0DJDG2xEph9TdbzlBfpJP0clHlo+YZNsqke9eudSds2+Huy1JP
         bkrFol/fnlsj+76aaryh+KB8SaKvNW/dRzajVW4kIh+Q21UqpPD1IobcjsWZlrqFvUBG
         PSMhFxfc/9sv7oPN9kRThxPixmBsAkxjfeSqrijwJi0ra9ImrXY4HWq5j7JtYOq7xHVS
         3eEP+Ab8+xnY8vcAIg0p9olAkgOPn/EkJX1/rlbNsbAFSZSKLWF3QpYlDAw+uUDWfh/S
         1nDg==
X-Gm-Message-State: AOAM5302AJc62udx3Y6CFjEAKGUUHs3+YeSP5oDR5ooYdBcHU7UOe4xr
	IYNBXOKyb//u6mpIb9JVUHBF1y18Nzg+rg==
X-Google-Smtp-Source: ABdhPJywv0JMaBw9ZU3ALIStLxn9Sh4/cNXU8F32qtHAVz0txW1QWvi3w2WzDriuoOe/ZMVdhfniig==
X-Received: by 2002:a62:7ed2:0:b029:19d:9461:2b30 with SMTP id z201-20020a627ed20000b029019d94612b30mr9107955pfc.14.1610655198468;
        Thu, 14 Jan 2021 12:13:18 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:19ce:8609:7a34:860])
        by smtp.gmail.com with ESMTPSA id np7sm5809966pjb.10.2021.01.14.12.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 12:13:17 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Scott Murray <scott.murray@konsulko.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Armin Kuster <akuster@mvista.com>
Subject: [dunfell][PATCH] glibc: CVE-2019-25013
Date: Thu, 14 Jan 2021 12:13:16 -0800
Message-Id: <20210114201316.23953-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

From: Scott Murray <scott.murray@konsulko.com>

Source: openembedded.org
MR: 107928
Type: Security Fix
Disposition: Backport from https://git.openembedded.org/openembedded-core/commit/meta/recipes-core/glibc?id=53d149df4d8832e34ace2470c31ddc688176faf7
ChangeID: 462441a4a91cb481401e170876c25dcdbd00f1e0
Description:

* CVE detail: https://nvd.nist.gov/vuln/detail/CVE-2019-25013

* upstream tracking: https://sourceware.org/bugzilla/show_bug.cgi?id=24973

* patch from upstream:
    https://sourceware.org/git/?p=glibc.git;a=patch;
    h=ee7a3144c9922808181009b7b3e50e852fb4999b

(From OE-Core rev: 53d149df4d8832e34ace2470c31ddc688176faf7)

Signed-off-by: Scott Murray <scott.murray@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 164b3e63612b40e984aec19c5a54c8ae408725ec)
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../glibc/glibc/CVE-2019-25013.patch          | 135 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.31.bb         |   1 +
 2 files changed, 136 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2019-25013.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2019-25013.patch b/meta/recipes-core/glibc/glibc/CVE-2019-25013.patch
new file mode 100644
index 00000000000..73df1da868c
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2019-25013.patch
@@ -0,0 +1,135 @@
+From ee7a3144c9922808181009b7b3e50e852fb4999b Mon Sep 17 00:00:00 2001
+From: Andreas Schwab <schwab@suse.de>
+Date: Mon, 21 Dec 2020 08:56:43 +0530
+Subject: [PATCH] Fix buffer overrun in EUC-KR conversion module (bz #24973)
+
+The byte 0xfe as input to the EUC-KR conversion denotes a user-defined
+area and is not allowed.  The from_euc_kr function used to skip two bytes
+when told to skip over the unknown designation, potentially running over
+the buffer end.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=patch;h=ee7a3144c9922808181009b7b3e50e852fb4999b]
+CVE: CVE-2019-25013
+Signed-off-by: Scott Murray <scott.murray@konsulko.com>
+[Refreshed for Dundell context; Makefile changes]
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ iconvdata/Makefile      |  3 ++-
+ iconvdata/bug-iconv13.c | 53 +++++++++++++++++++++++++++++++++++++++++
+ iconvdata/euc-kr.c      |  6 +----
+ iconvdata/ksc5601.h     |  6 ++---
+ 4 files changed, 59 insertions(+), 9 deletions(-)
+ create mode 100644 iconvdata/bug-iconv13.c
+
+Index: git/iconvdata/Makefile
+===================================================================
+--- git.orig/iconvdata/Makefile
++++ git/iconvdata/Makefile
+@@ -73,7 +73,7 @@ modules.so := $(addsuffix .so, $(modules
+ ifeq (yes,$(build-shared))
+ tests = bug-iconv1 bug-iconv2 tst-loading tst-e2big tst-iconv4 bug-iconv4 \
+ 	tst-iconv6 bug-iconv5 bug-iconv6 tst-iconv7 bug-iconv8 bug-iconv9 \
+-	bug-iconv10 bug-iconv11 bug-iconv12
++	bug-iconv10 bug-iconv11 bug-iconv12 bug-iconv13
+ ifeq ($(have-thread-library),yes)
+ tests += bug-iconv3
+ endif
+Index: git/iconvdata/bug-iconv13.c
+===================================================================
+--- /dev/null
++++ git/iconvdata/bug-iconv13.c
+@@ -0,0 +1,53 @@
++/* bug 24973: Test EUC-KR module
++   Copyright (C) 2020 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <https://www.gnu.org/licenses/>.  */
++
++#include <errno.h>
++#include <iconv.h>
++#include <stdio.h>
++#include <support/check.h>
++
++static int
++do_test (void)
++{
++  iconv_t cd = iconv_open ("UTF-8//IGNORE", "EUC-KR");
++  TEST_VERIFY_EXIT (cd != (iconv_t) -1);
++
++  /* 0xfe (->0x7e : row 94) and 0xc9 (->0x49 : row 41) are user-defined
++     areas, which are not allowed and should be skipped over due to
++     //IGNORE.  The trailing 0xfe also is an incomplete sequence, which
++     should be checked first.  */
++  char input[4] = { '\xc9', '\xa1', '\0', '\xfe' };
++  char *inptr = input;
++  size_t insize = sizeof (input);
++  char output[4];
++  char *outptr = output;
++  size_t outsize = sizeof (output);
++
++  /* This used to crash due to buffer overrun.  */
++  TEST_VERIFY (iconv (cd, &inptr, &insize, &outptr, &outsize) == (size_t) -1);
++  TEST_VERIFY (errno == EINVAL);
++  /* The conversion should produce one character, the converted null
++     character.  */
++  TEST_VERIFY (sizeof (output) - outsize == 1);
++
++  TEST_VERIFY_EXIT (iconv_close (cd) != -1);
++
++  return 0;
++}
++
++#include <support/test-driver.c>
+Index: git/iconvdata/euc-kr.c
+===================================================================
+--- git.orig/iconvdata/euc-kr.c
++++ git/iconvdata/euc-kr.c
+@@ -80,11 +80,7 @@ euckr_from_ucs4 (uint32_t ch, unsigned c
+ 									      \
+     if (ch <= 0x9f)							      \
+       ++inptr;								      \
+-    /* 0xfe(->0x7e : row 94) and 0xc9(->0x59 : row 41) are		      \
+-       user-defined areas.  */						      \
+-    else if (__builtin_expect (ch == 0xa0, 0)				      \
+-	     || __builtin_expect (ch > 0xfe, 0)				      \
+-	     || __builtin_expect (ch == 0xc9, 0))			      \
++    else if (__glibc_unlikely (ch == 0xa0))				      \
+       {									      \
+ 	/* This is illegal.  */						      \
+ 	STANDARD_FROM_LOOP_ERR_HANDLER (1);				      \
+Index: git/iconvdata/ksc5601.h
+===================================================================
+--- git.orig/iconvdata/ksc5601.h
++++ git/iconvdata/ksc5601.h
+@@ -50,15 +50,15 @@ ksc5601_to_ucs4 (const unsigned char **s
+   unsigned char ch2;
+   int idx;
+ 
++  if (avail < 2)
++    return 0;
++
+   /* row 94(0x7e) and row 41(0x49) are user-defined area in KS C 5601 */
+ 
+   if (ch < offset || (ch - offset) <= 0x20 || (ch - offset) >= 0x7e
+       || (ch - offset) == 0x49)
+     return __UNKNOWN_10646_CHAR;
+ 
+-  if (avail < 2)
+-    return 0;
+-
+   ch2 = (*s)[1];
+   if (ch2 < offset || (ch2 - offset) <= 0x20 || (ch2 - offset) >= 0x7f)
+     return __UNKNOWN_10646_CHAR;
diff --git a/meta/recipes-core/glibc/glibc_2.31.bb b/meta/recipes-core/glibc/glibc_2.31.bb
index 067d4de64a6..b75bbb41960 100644
--- a/meta/recipes-core/glibc/glibc_2.31.bb
+++ b/meta/recipes-core/glibc/glibc_2.31.bb
@@ -43,6 +43,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0029-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch \
            file://CVE-2020-29562.patch \
            file://CVE-2020-29573.patch \
+           file://CVE-2019-25013.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.17.1

