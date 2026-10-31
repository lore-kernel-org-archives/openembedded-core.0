Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3738.1793405760299894895
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 17:16:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=eHAO1G/+;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so12081125e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793405758; x=1794010558; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=acZltvv8U/hK3FqPP8SNuYpjpClnMu1iR1fpZYYRUH8=;
        b=eHAO1G/+bbtiy9y/QMzZQjcYYHQhz/6WZJfzPu2rfA1H575rw5+ELSBADPibJjF/dC
         SlanxRY8t0aCfzObruBU0+tdfbQQxeTgoglsK5CDO3LX2pwW7gLuysyBe0zU6N172aCj
         F+alAWW7eh1C/0oQvPbSYCbivFXynEgEe/K9abEI8bNO7Hk0/5UtrmKattep71GtGCRT
         tDTH3lwFUhRkrRq+WALCbobKAkYkPjtLfdWXNaimHNHKYYupW8BJ322LUjPPTm9oB0ZH
         Dmg9aqjA6TYSJv/Vc3IaXj4FH48s/lFE00Sq3hny8RKAvW6ZbvqvFv136/vHUzqay7y8
         l/sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793405758; x=1794010558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=acZltvv8U/hK3FqPP8SNuYpjpClnMu1iR1fpZYYRUH8=;
        b=sQl6Ybe4BN1Z2x70FD9CW6bpKrNSATqTMQvXjv3wquclbzq1gLjiyJvAXaUOwSZIXC
         28UodDXrmGdGw1UnRLFkGT/TOEZyhSw9zPQ2vqQPdDrFwpwNN9dn4/oRJdY40/uDOrwO
         5GQUoDlWlL62ZdDIqh9XvweOBqsRMbL7D8Vh/h7Z1DTmCws9UnRXp+LSdFp5f292ACV3
         lYclXa5pNb7Ik3Tsj019NIkgAcSR9geS2IQ2pLfU+yzsWlYExWj7wfTDlQh/AUy6VAZ+
         4y5OJvlkt8/mNCqZa2l1IZnqybWMIm1n4oHMB25NqALW9ssFHOU7O+FviRf1JZDiEfU0
         Hj7w==
X-Gm-Message-State: AFq9FYJUsL7pnadFUYo4l9vO/xqV7lRzI2zIvdXVzeptlgl51o5lHw1H
	yE67evnRMV876GT/oTQxotsG4QnmuAwni72PLfIDz5fO1T7dMagdFXKpPbnoDfZOH6/e+CCE4xI
	ZMSnO1mk=
X-Gm-Gg: AYBFou2/p4CvYFoA79uPWYrJL/HbEGQSnGOGgyjUcTY+BnpyLYb6YhYgHgxbHIj4HMD
	7pap6xYCavBhkyxLC31s/DWThORHAfoAkW/K3DRbyB5w/1ZJ7X/8LtCVo7Jbd37lEag4PPK/pkp
	nXVuLvDcNM5kXF+7GnwAOwbyZqoyCbkDp1zAQDMDkQwyu4/7qRWDZBrKaXlV5YUa0ikCEVK0ji/
	ucLZ7zSxGCmN5csNxhOCVjuUo+DTDRMC2HRWjhtX74pezFGUgFASq7tGoVIznn3a4io9G80Bsql
	LHOczjfNxjakOxMg+BiOkDyKGqUZPelM9pf06UwPR59tqtqf5sq062yamDeZQF5NLk0PkJZge40
	gm3fnFm/gyt415lkgI70Be3JxphI4MlqIDXiUPV4vN1G1G6leNTD8tmyzxTh5pOdIkhu37d8naC
	rjAyBcllzbmlP3n6BsZEaSnYrLiw+Qznx8BDrke0qSfaHKLY8CYJjS/k5P36xSEodKyGDGKrj5I
	4pJEWAdPh1DumN93hURrl83IcWOj+8enhR7xjJ+DkItnw62RDG8bz2H1q0HEAO2+zTMDE2OTXhK
	Ta1+9GIScT8B6yhoNxY80CtntkuCJAySgaoFvLxZMjHfit/2cSpRjPiqzlknBzBff/ZgTxmU71i
	isyvsGf9gDQb7FtFuMLgnFmDQEm60
X-Received: by 2002:a05:600c:4f8b:b0:4a3:5a98:c279 with SMTP id 5b1f17b1804b1-4ac17ffb07cmr85525665e9.8.1793405758463;
        Fri, 30 Oct 2026 17:15:58 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm130350635e9.12.2026.10.30.17.15.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:15:57 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 26/55] glibc: patch CVE-2026-19499
Date: Sat, 31 Oct 2026 01:14:47 +0100
Message-ID: <d3c11728cebabc0fc8131e0b3275f49263be21d4.1793405493.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793405493.git.yoann.congal@smile.fr>
References: <cover.1793405493.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 00:16:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249101
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch referencing this CVE from 2.41 branch (oldest release
still receiving security updates).

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: fixed a 3.41 -> 2.41 typo in branch name]
---
 .../glibc/glibc/0036-CVE-2026-19499.patch     | 100 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.39.bb         |   1 +
 2 files changed, 101 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0036-CVE-2026-19499.patch

diff --git a/meta/recipes-core/glibc/glibc/0036-CVE-2026-19499.patch b/meta/recipes-core/glibc/glibc/0036-CVE-2026-19499.patch
new file mode 100644
index 00000000000..792c5276d0b
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0036-CVE-2026-19499.patch
@@ -0,0 +1,100 @@
+From 5256941bc811248670eda4636dccd0a390d34dec Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Thu, 27 Aug 2026 13:34:54 +0200
+Subject: [PATCH] stdlib: Fix right-justification in strfmon (bug 34510,
+ CVE-2026-19499)
+
+The memmove call did not take into account that __printf_buffer_pad
+updated the buffer pointers.
+
+Fixes commit e88b9f0e5cc50cab57a299dc7efe1a4eb385161d
+("stdio-common: Convert vfprintf and related functions to buffers"),
+which went into glibc 2.37.
+
+Reviewed-by: Adhemerval Zanella  <adhemerval.zanella@linaro.org>
+(cherry picked from commit b090cf226ff65b913e41536f1f573f500855615c)
+
+CVE: CVE-2026-19499
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=5256941bc811248670eda4636dccd0a390d34dec]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ stdlib/Makefile               |  1 +
+ stdlib/strfmon_l.c            |  5 +++--
+ stdlib/tst-strfmon-bug34510.c | 33 +++++++++++++++++++++++++++++++++
+ 3 files changed, 37 insertions(+), 2 deletions(-)
+ create mode 100644 stdlib/tst-strfmon-bug34510.c
+
+diff --git a/stdlib/Makefile b/stdlib/Makefile
+index c9c8f702a2..b655f0e5eb 100644
+--- a/stdlib/Makefile
++++ b/stdlib/Makefile
+@@ -324,6 +324,7 @@ tests := \
+   tst-stdc_leading_zeros \
+   tst-stdc_trailing_ones \
+   tst-stdc_trailing_zeros \
++  tst-strfmon-bug34510 \
+   tst-strfmon_l \
+   tst-strfrom \
+   tst-strfrom-locale \
+diff --git a/stdlib/strfmon_l.c b/stdlib/strfmon_l.c
+index 5e22aac750..bd849ff470 100644
+--- a/stdlib/strfmon_l.c
++++ b/stdlib/strfmon_l.c
+@@ -549,7 +549,8 @@ __vstrfmon_l_buffer (struct __printf_buffer *buf, locale_t loc,
+       /* Now test whether the output width is filled.  */
+       if (buf->write_ptr - startp < width)
+ 	{
+-	  size_t pad_width = width - (buf->write_ptr - startp);
++	  size_t written_width = buf->write_ptr - startp;
++	  size_t pad_width = width - written_width;
+ 	  __printf_buffer_pad (buf, ' ', pad_width);
+ 	  if (__printf_buffer_has_failed (buf))
+ 	    /* Implies length check.  */
+@@ -558,7 +559,7 @@ __vstrfmon_l_buffer (struct __printf_buffer *buf, locale_t loc,
+ 	     Otherwise move the field contents in place.  */
+ 	  if (!left)
+ 	    {
+-	      memmove (startp + pad_width, startp, buf->write_ptr - startp);
++	      memmove (startp + pad_width, startp, written_width);
+ 	      memset (startp, ' ', pad_width);
+ 	    }
+ 	}
+diff --git a/stdlib/tst-strfmon-bug34510.c b/stdlib/tst-strfmon-bug34510.c
+new file mode 100644
+index 0000000000..b187bde1f4
+--- /dev/null
++++ b/stdlib/tst-strfmon-bug34510.c
+@@ -0,0 +1,33 @@
++/* Test handling of right-padding in strfmon (bug 34510, CVE-2026-19499).
++   Copyright (C) 2026 Free Software Foundation, Inc.
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
++#include <monetary.h>
++#include <errno.h>
++#include <support/check.h>
++#include <support/next_to_fault.h>
++
++static int
++do_test (void)
++{
++  struct support_next_to_fault ntf = support_next_to_fault_allocate (100);
++  TEST_COMPARE (strfmon (ntf.buffer, ntf.length, "%100n", 1.23), -1);
++  TEST_COMPARE (errno, E2BIG);
++  return 0;
++}
++
++#include <support/test-driver.c>
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/glibc/glibc_2.39.bb
index eb198427d1a..567d53dd6f6 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -68,6 +68,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0033-CVE-2026-6791.patch \
            file://0034-CVE-2026-6368.patch \
            file://0035-CVE-2026-19542.patch \
+           file://0036-CVE-2026-19499.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
