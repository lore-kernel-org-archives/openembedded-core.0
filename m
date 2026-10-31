Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3735.1793405757573580293
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 17:15:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=T7Turuwi;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so10155875e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793405756; x=1794010556; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yVnabflqnxV8/zCDKyMXJ67qoJMX/ah2HwrRlaW2LIg=;
        b=T7Turuwi/74jnMIHmOD/vSEuqgj3yx4rxSq1Mirqyk48QFhrE3Qijgs3ADo6Vxr7sn
         Vs3nMZbnhuG2sK3dvdaNE4/IhJ6ad0LL1KXZkcDGrHX7PmeGciY0QFQj6xWe47JeaFBn
         NYyb7pZDGeULuBfZnAxeYbfe1SPZDcRkapyg+7HQ3Q25+10Q88PJFqG1jwTPKQEs+aAF
         8QjQmijSFyMY28v7aZog+DOw6J3asTQFHZQDpf9zaCN6QcHAUBB+f1OLKCTSO0O/Z1Vm
         5DyRZ1bKYdfrb9e8fQj2MhZBvr3lQvmETI20zIzO3n7pqUMTVnUG/cLagA21gBwCAlMt
         QhCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793405756; x=1794010556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yVnabflqnxV8/zCDKyMXJ67qoJMX/ah2HwrRlaW2LIg=;
        b=MtTXQSvdZNEZCghtvKsqitiLyDcl5mnNCaQO3g5gr4PTgSaVO4TQ3esJRjoFfGGGzj
         zgvGwyEdEVRkESZeJIx2pzxK3enoDWf0Lz6tTL+fR+xUOg1NmZaB+Ule+sqUrLI/+qcY
         1S6gssx5yMkb51ZgI9QG5tWWyHwZ8G+FcZ3P8sMDiEGS6BQmkKOthQ+UJFA9qnWAiORU
         mBsxbfhD/Rwz66WBhWlMZ5JhCnq53AfCBiKB9NdJxrrgu+KVDxGBSGIqKx8fDsbEayaD
         jfaa5sNMuphvDnu5MBL3HY1OgdHZdukNGeD7B2Ouht9p6budyWfCUvzAxKzoucLUUSZ0
         6Cmw==
X-Gm-Message-State: AFq9FYKoWSghg1PGVyePJQ5OvUwhTTb/Cs+QWhNvicWj0Xi12MFtVQol
	xBJ3i3Q7AEZ+N6B/7Qbt/cg5/D70MiSr2myFdsXFcDyEbATbrstz/NTsESDJwmG6MIQqNzWyzqU
	SkA2i78c=
X-Gm-Gg: AYBFou37jbzmijAhxF/aP5pp2zx1AwCNZnTl3RCTReFOsClCNdgsm0ZC54TAAxG1uCC
	wUlKhuGXuMaqV3b6EiGa2QDbTsWGgQWTYmNOkW9f+SUqW71mvIH7wvGuZqkHTeAvAsR4ANXYTBw
	nIq4ezkC13a563UQj6N7DsA1lsExinOr0628wJtJybrgZHvda+qe/cjeKJmQaAOPdvGmVa00bzE
	P26Q7mdeHJRWlFTJpoy3UK056kRh76457S+yDjW3vny3riYLQVGtBpUhflnSkR1ba86N5ILPvN3
	gKHDwHqZbVqgwRD2WPPbR1DsbxJzcfbLrMKtEo3mubzz5br0stlTrPkGTjCoSrF+R09UCQ+GoEg
	lWmH9bnCxl4Q6isV0oHAmlSvMWcxBbR3Tp7OsGMr+y2rIV+qEqL9sSiqrWJa0p8ypeMJ4PgJbiH
	DJcS6XokbuL3WHysRz18Tr9Wycsyq3f1e+IXcg4EpHT2Fq+hIrsgmCrYvzIuoT9JTjYNDn5QmrJ
	/r6zDKrGqY5OyvyGrUEcdBkVqAKgiALwny+yyrq2rCq7BHMN5HSfSh3zkJzS4trOzMeD3Loif0X
	roN9VDT/mcmWEjNAM6UBz0L5P1t1oCcSy4Nk8iVD168rg221bm/AhwgTE96JkwUcVQiFW+EcDtM
	RRy2U1lhHEUyHrj4Y7fTn2eokniIg
X-Received: by 2002:a05:600c:8b04:b0:4a1:fb01:13 with SMTP id 5b1f17b1804b1-4ac17a3683bmr88178115e9.18.1793405755776;
        Fri, 30 Oct 2026 17:15:55 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm130350635e9.12.2026.10.30.17.15.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:15:55 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 22/55] glibc: patch CVE-2026-5450
Date: Sat, 31 Oct 2026 01:14:43 +0100
Message-ID: <8e0de08b8c72587c4eb71a876609f8cf21469dab.1793405493.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793405493.git.yoann.congal@smile.fr>
References: <cover.1793405493.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 00:16:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249097
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch [1] which is [2] backported to 2.41 (oldest release still
receiving security updates) which is mentioned in [3].

[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=1a74f82eedaf0987eda1f522121e6a48fac502e7
[2] https://sourceware.org/git/?p=glibc.git;a=commit;h=839898777226a3ed88c0859f25ffe712519b4ead
[3] https://security-tracker.debian.org/tracker/CVE-2026-5450

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: fixed a 3.41 -> 2.41 typo in branch name]
---
 .../glibc/glibc/0032-CVE-2026-5450.patch      | 133 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.39.bb         |   1 +
 2 files changed, 134 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0032-CVE-2026-5450.patch

diff --git a/meta/recipes-core/glibc/glibc/0032-CVE-2026-5450.patch b/meta/recipes-core/glibc/glibc/0032-CVE-2026-5450.patch
new file mode 100644
index 00000000000..631b63f4654
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0032-CVE-2026-5450.patch
@@ -0,0 +1,133 @@
+From 1a74f82eedaf0987eda1f522121e6a48fac502e7 Mon Sep 17 00:00:00 2001
+From: Rocket Ma <marocketbd@gmail.com>
+Date: Fri, 17 Apr 2026 23:48:41 -0700
+Subject: [PATCH] stdio-common: Fix buffer overflow in scanf %mc [BZ #34008]
+
+* stdio-common/vfscanf-internal.c: When enlarging allocated buffer with
+format %mc or %mC, glibc allocates one byte less, leading to
+user-controlled one byte overflow. This commit fixes BZ #34008, or
+CVE-2026-5450.
+
+Reviewed-by: Carlos O'Donell <carlos@redhat.com>
+Signed-off-by: Rocket Ma <marocketbd@gmail.com>
+Reviewed-by: H.J. Lu <hjl.tools@gmail.com>
+(cherry picked from commit 839898777226a3ed88c0859f25ffe712519b4ead)
+
+CVE: CVE-2026-5450
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=1a74f82eedaf0987eda1f522121e6a48fac502e7]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ stdio-common/Makefile              |  4 +++
+ stdio-common/tst-vfscanf-bz34008.c | 48 ++++++++++++++++++++++++++++++
+ stdio-common/vfscanf-internal.c    |  7 ++---
+ 3 files changed, 55 insertions(+), 4 deletions(-)
+ create mode 100644 stdio-common/tst-vfscanf-bz34008.c
+
+diff --git a/stdio-common/Makefile b/stdio-common/Makefile
+index ac098dcd8a..72c18e5dc1 100644
+--- a/stdio-common/Makefile
++++ b/stdio-common/Makefile
+@@ -266,6 +266,7 @@ tests := \
+   tst-vfprintf-width-i18n \
+   tst-vfprintf-width-prec \
+   tst-vfprintf-width-prec-alloc \
++  tst-vfscanf-bz34008 \
+   tst-wc-printf \
+   tstdiomisc \
+   tstgetln \
+@@ -401,6 +402,9 @@ tst-printf-bz18872-ENV = MALLOC_TRACE=$(objpfx)tst-printf-bz18872.mtrace \
+ tst-vfprintf-width-prec-ENV = \
+   MALLOC_TRACE=$(objpfx)tst-vfprintf-width-prec.mtrace \
+   LD_PRELOAD=$(common-objpfx)/malloc/libc_malloc_debug.so
++tst-vfscanf-bz34008-ENV = \
++  MALLOC_CHECK_=3 \
++  LD_PRELOAD=$(common-objpfx)/malloc/libc_malloc_debug.so
+ tst-printf-bz25691-ENV = \
+   MALLOC_TRACE=$(objpfx)tst-printf-bz25691.mtrace \
+   LD_PRELOAD=$(common-objpfx)/malloc/libc_malloc_debug.so
+diff --git a/stdio-common/tst-vfscanf-bz34008.c b/stdio-common/tst-vfscanf-bz34008.c
+new file mode 100644
+index 0000000000..48371c8a3d
+--- /dev/null
++++ b/stdio-common/tst-vfscanf-bz34008.c
+@@ -0,0 +1,48 @@
++/* Regression test for vfscanf %Nmc out-of-bound write (BZ #34008)
++   Copyright (C) 2026 The GNU Toolchain Authors.
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
++#include "malloc/mcheck.h"
++#include <stddef.h>
++#include <stdio.h>
++#include <string.h>
++#include <wchar.h>
++#include <stdlib.h>
++#include <malloc.h>
++#include <support/check.h>
++
++#define WIDTH 0x410
++#define SCANFSTR "%1040mc"
++static int
++do_test (void)
++{
++  mcheck_pedantic (NULL);
++  char *input = malloc (WIDTH + 1);
++  TEST_VERIFY (input != NULL);
++  memset (input, 'A', WIDTH);
++  input[WIDTH] = '\0';
++
++  char *buf = NULL;
++  TEST_VERIFY (sscanf (input, SCANFSTR, &buf) != -1);
++  TEST_VERIFY (buf != NULL);
++
++  free (buf);
++  free (input);
++  return 0;
++}
++
++#include <support/test-driver.c>
+diff --git a/stdio-common/vfscanf-internal.c b/stdio-common/vfscanf-internal.c
+index 1ba034d961..fabb0ec874 100644
+--- a/stdio-common/vfscanf-internal.c
++++ b/stdio-common/vfscanf-internal.c
+@@ -853,8 +853,7 @@ __vfscanf_internal (FILE *s, const char *format, va_list argptr,
+ 			{
+ 			  /* Enlarge the buffer.  */
+ 			  size_t newsize
+-			    = strsize
+-			      + (strsize >= width ? width - 1 : strsize);
++			    = strsize + (strsize >= width ? width : strsize);
+ 
+ 			  str = (char *) realloc (*strptr, newsize);
+ 			  if (str == NULL)
+@@ -925,7 +924,7 @@ __vfscanf_internal (FILE *s, const char *format, va_list argptr,
+ 		      && wstr == (wchar_t *) *strptr + strsize)
+ 		    {
+ 		      size_t newsize
+-			= strsize + (strsize > width ? width - 1 : strsize);
++			= strsize + (strsize >= width ? width : strsize);
+ 		      /* Enlarge the buffer.  */
+ 		      wstr = (wchar_t *) realloc (*strptr,
+ 						  newsize * sizeof (wchar_t));
+@@ -980,7 +979,7 @@ __vfscanf_internal (FILE *s, const char *format, va_list argptr,
+ 		    && wstr == (wchar_t *) *strptr + strsize)
+ 		  {
+ 		    size_t newsize
+-		      = strsize + (strsize > width ? width - 1 : strsize);
++		      = strsize + (strsize >= width ? width : strsize);
+ 		    /* Enlarge the buffer.  */
+ 		    wstr = (wchar_t *) realloc (*strptr,
+ 						newsize * sizeof (wchar_t));
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/glibc/glibc_2.39.bb
index 0a4f7ac3bd6..e62d941fdde 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -64,6 +64,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0029-CVE-2026-6238-0005.patch \
            file://0030-CVE-2026-6238-0006.patch \
            file://0031-CVE-2026-5928.patch \
+           file://0032-CVE-2026-5450.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
