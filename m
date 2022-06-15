Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09CD5CCA47B
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 08:16:44 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web08.2094.1655281000197218264
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 01:16:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=afNyunVW;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655280998; i=@fujitsu.com;
	bh=ZENPR4WUR4MqDAHlyiY2cYXa0mR6KjbpL0NH0BSA9F8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=afNyunVWXo2qB/XNxs/E+fNJn0/ewzgVpEtIODHizCuFMpKk5MEFRG0dH5MhjVQNk
	 dzb1BE1G3Fsu95euEF191xfvH7n+IoEVFBd5LU+cvhKcioEAjyBSahSxDqd0rPI6mR
	 CxFz2ictskiMh3jeyLdb6ouJOVSw85Q5jdmEhMJweJwPYgeET/wXqvRcy84aN1GWgi
	 EB6LYiv2eFMB62o6KhgdmWmolglB+sWzvF0+Y326OuXpeZ/fvWxPaxxB7z9Z7GzhXP
	 FGiFv/Rs91o0DqquUaRBRugPquhACcHbBcTKBiTSxwrtzet1TxGx8TGbzhxZrV0Xuk
	 mF1iRVz2c3kXg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFIsWRWlGSWpSXmKPExsViZ8ORqJs6dWW
  Swby/OhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8asbdPYC1ZJV3ze9pa5gfGYRBcjF4eQwGNG
  iWUrNzJCOOeZJP7d+cgG4exhlHjY0MTSxcjJwSagJjH91g3WLkYODhEBPYmr/0RBwswCKhIvf
  vewg9jCAlYSCy89YgKxWQRUJe5P28sKYvMKOEp8m7mFGcSWEFCQmPLwPZjNKeAk8WbGLLBeIa
  CaowsXMUPUC0qcnPmEBWK+hMTBFy+gehUlZl9uZoGwKyRmzNjGBmGrSVw9t4l5AqPgLCTts5C
  0L2BkWsVok1SUmZ5RkpuYmaNraGCga2hoqmtprmtobKmXWKWbqJdaqpuXX1SSoWuol1herJda
  XKxXXJmbnJOil5dasokRGMgpxYndOxhX7/uld4hRkoNJSZRXefLKJCG+pPyUyozE4oz4otKc1
  OJDjDIcHEoSvK6TgHKCRanpqRVpmTnAqIJJS3DwKInw1oO08hYXJOYWZ6ZDpE4x2nN8OHRlLz
  PH1Nn/9jNzLAeTM7+2HWAWYsnLz0uVEueN6QRqEwBpyyjNgxsKSwKXGGWlhHkZGRgYhHgKUot
  yM0tQ5V8xinMwKgnzVkwBmsKTmVcCt/sV0FlMQGc17lsBclZJIkJKqoHJUfrOfGde6aWX/8cb
  XP5mqJWppnznHXPybd3JS76qsPNmr2zT/JCX+kphD2/naynb58scep7IqR7/cWy5Y3ria+O2O
  3qp1tdf/XpYVq55WU1cb86JHSz7TnOt8Ol4Ia1d84zBWUTthx/7+Q3CvA4rbgeIhpetX+G9uk
  zRvez5wplh6Wd/7NuofSf3vMGf/8qHI47N/X+FWZdzpoTUVMbg+Okuuw9c6cnfvXdr4tr3jR4
  5nqc/zpDrvpu8P6HhwNT9X3d/W2Wpnr5wW2LF/oL6jzbH2n4I/j/1U7VM8HpR8UuFV3Wy8acf
  /5D0CxdqP/xY+9sOlUXB17TDI+zPS8jO491nsz5kheosjm0Z/bsuK7EUZyQaajEXFScCAIi5u
  Bt9AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-745.messagelabs.com!1655280997!92136!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12574 invoked from network); 15 Jun 2022 08:16:37 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-11.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Jun 2022 08:16:37 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 1B693100193
	for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 09:16:37 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 0E1D710018B
	for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 09:16:37 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 15 Jun 2022 09:16:18 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] erofs-utils: upgrade 1.4 -> 1.5
Date: Wed, 15 Jun 2022 16:16:01 +0800
Message-ID: <1655280963-6605-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655280963-6605-1-git-send-email-wangmy@fujitsu.com>
References: <1655280963-6605-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 08:16:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166916

0001-fsck-main.c-add-missing-include.patch
removed since it's included in 1.5.

License-Update: changed from "GPL-2.0-or-later" to "GPL-2.0+"

Changelog:
==========
* This release includes the following updates:
   - (fsck.erofs) support filesystem extraction (Igor Ostapenko);
   - support ztailpacking inline feature for compressed files (Yue Hu);
   - (dump.erofs) support listing directories;
   - more liberofs APIs (including iterate APIs) (me, Kelvin Zhang);
   - use mtime to allow more control over the timestamps (David Anderson);
   - switch to GPL-2.0+ OR Apache-2.0 dual license for liberofs;
   - various bugfixes and cleanups;

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...0001-fsck-main.c-add-missing-include.patch | 26 -------------------
 ...{erofs-utils_1.4.bb => erofs-utils_1.5.bb} | 10 +++----
 2 files changed, 4 insertions(+), 32 deletions(-)
 delete mode 100644 meta/recipes-devtools/erofs-utils/erofs-utils/0001-fsck-main.c-add-missing-include.patch
 rename meta/recipes-devtools/erofs-utils/{erofs-utils_1.4.bb => erofs-utils_1.5.bb} (69%)

diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils/0001-fsck-main.c-add-missing-include.patch b/meta/recipes-devtools/erofs-utils/erofs-utils/0001-fsck-main.c-add-missing-include.patch
deleted file mode 100644
index c3b3c0bd56..0000000000
--- a/meta/recipes-devtools/erofs-utils/erofs-utils/0001-fsck-main.c-add-missing-include.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 821778286843b8e88d0cd73a97d20b5a2fff8ea1 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Mon, 6 Dec 2021 20:12:54 +0100
-Subject: [PATCH] fsck/main.c: add missing include
-
-Otherwise musl C library builds fail with missing S_IFMT/S_IFDIR
-definitions.
-
-Upstream-Status: Submitted [email to linux-erofs@lists.ozlabs.org,hsiangkao@linux.alibaba.com]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- fsck/main.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/fsck/main.c b/fsck/main.c
-index aefa881..ad48e35 100644
---- a/fsck/main.c
-+++ b/fsck/main.c
-@@ -6,6 +6,7 @@
- #include <stdlib.h>
- #include <getopt.h>
- #include <time.h>
-+#include <sys/stat.h>
- #include "erofs/print.h"
- #include "erofs/io.h"
- #include "erofs/decompress.h"
diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils_1.4.bb b/meta/recipes-devtools/erofs-utils/erofs-utils_1.5.bb
similarity index 69%
rename from meta/recipes-devtools/erofs-utils/erofs-utils_1.4.bb
rename to meta/recipes-devtools/erofs-utils/erofs-utils_1.5.bb
index e5e19e75b4..4231b3ca67 100644
--- a/meta/recipes-devtools/erofs-utils/erofs-utils_1.4.bb
+++ b/meta/recipes-devtools/erofs-utils/erofs-utils_1.5.bb
@@ -1,13 +1,11 @@
 SUMMARY = "Tools for erofs filesystems"
-LICENSE = "GPL-2.0-or-later"
+LICENSE = "GPL-2.0+"
 SECTION = "base"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94fa01670a2a8f2d3ab2de15004e0848"
+LIC_FILES_CHKSUM = "file://COPYING;md5=73001d804ea1e3d84365f652242cca20"
 HOMEPAGE = "https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/tree/README"
 
-SRCREV = "ee97fe5fb77c737df0f77d92ab0d92edd3a11be6"
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git;branch=master \
-           file://0001-fsck-main.c-add-missing-include.patch \
-           "
+SRCREV = "a2821a66b42aee5430bccee82c280e38d1e9ab29"
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git;branch=master"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(\d+(\.\d+)+))"
 
-- 
2.25.1


