Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 438ECC43334
	for <webhook@archiver.kernel.org>; Thu, 16 Jun 2022 01:36:40 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.12861.1655343396893460987
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 18:36:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=HwjkA5tK;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655343394; i=@fujitsu.com;
	bh=ET4UKfK/75NBpQZYUzos4SeyDcfgz9ruuMf+7NmeCpY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=HwjkA5tKPqHEfys4XHWfu7TN9J2IFJQ8J/TBcZC8+HHgw15jFv785+gtXlc2/eGcN
	 8wcsKCf9BXOwqocU8R3sR76YLBPlWKH17ZQcztV5Xi42XBoi+K618cyoOCIl8D1Ohh
	 Eq/kic5zrIjn5DdVtDTGKGn4nm7N7bfvQEJcSJZ7JOw+Wk/8SIsWqr5//hRAy+pbQy
	 U3oRQfuL+VxRmyb4u8BMgBQh1KflN1QhoX0OlZV0zqOa/ZyO4679DyOVbZwlWN10Gv
	 4X9DNobrIbf5zaPzLtde7l01FK/19tlR4LRK9Dnq9+kqY4MPmcLjPbTnQBgHTndohP
	 8w7L+CRoEbSLw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRWlGSWpSXmKPExsViZ8MxSVexc1W
  SwdRedYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPHjmnsBW+lK3p37WBqYHwn0cXIxSEk8JhR
  ouv4TUYI5zyTxOnp81ggnD2MEnOvHADKcHKwCahJTL91g7WLkYNDREBP4uo/UZAws4CKxIvfP
  ewgtrCAq8Tp+9eYQWwWAVWJjZevMYHYvAJOEjt/fwCrkRBQkJjy8D0zRFxQ4uTMJywQcyQkDr
  54wQxRoygx+3IzC4RdITFjxjY2CFtN4uq5TcwTGPlnIWmfhaR9ASPTKkarpKLM9IyS3MTMHF1
  DAwNdQ0NTXSBpZKyXWKWbqJdaqlueWlyia6iXWF6sl1pcrFdcmZuck6KXl1qyiREYlCnFDNU7
  GP/3/tQ7xCjJwaQkyvuLZ1WSEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQneHe1AOcGi1PTUirTMH
  GCEwKQlOHiURHhPtAGleYsLEnOLM9MhUqcY7Tk+HLqyl5lj6ux/+5k5loPJmV/bDjALseTl56
  VKifNuAJkqANKWUZoHNxQW0ZcYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfOeqQSawpOZVwK
  3+xXQWUxAZzXuWwFyVkkiQkqqgWnu7JAb0rzl0d92HXE976U/0eWZ6vcKpr0vI5xXm7ifUE57
  OqPszI+Y1Re33Ga1jXVg/P295O3x4GephyfxxdTx1XtNmLM1d/oXOXVRh+6YLV4mSuJZtbXhH
  ir1ycJGK07z9l2/e+3GHBvhXx1pRrJSFVNt846UP3WN7ZghwRm6jCGir+0z785ZVbKaskHvmT
  psP9X2z7n26OoO2RcvI3e4fi9yYDR21Rd8E2mp2cp47eHXSUleTzQuHV1kMn89G1fXy5PHyiq
  7eTfPdOL5Z7tztdj1iRx5R29k5Mh9LGSNe+Fu+3uR+K21R3c5H7vqpZIpcbue6d8eQ87399NO
  Lph1gVuzvvdk09s0qVNRy5VYijMSDbWYi4oTARdmU1BjAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-587.messagelabs.com!1655343393!202003!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21166 invoked from network); 16 Jun 2022 01:36:33 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-16.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 16 Jun 2022 01:36:33 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 084561000CD
	for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jun 2022 02:36:33 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id EF203100078
	for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jun 2022 02:36:32 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 16 Jun 2022 02:36:11 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [PATCH] [OE-core] [PATCH v3] erofs-utils: upgrade 1.4 -> 1.5
Date: Thu, 16 Jun 2022 09:35:54 +0800
Message-ID: <1655343354-11954-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jun 2022 01:36:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166996

0001-fsck-main.c-add-missing-include.patch
removed since it's included in 1.5.

License-Update: license switch to GPL-2.0+ OR Apache-2.0
                for better 3rd-party integration.

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
 ...{erofs-utils_1.4.bb => erofs-utils_1.5.bb} |  9 +++----
 2 files changed, 4 insertions(+), 31 deletions(-)
 delete mode 100644 meta/recipes-devtools/erofs-utils/erofs-utils/0001-fsck-main.c-add-missing-include.patch
 rename meta/recipes-devtools/erofs-utils/{erofs-utils_1.4.bb => erofs-utils_1.5.bb} (72%)

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
similarity index 72%
rename from meta/recipes-devtools/erofs-utils/erofs-utils_1.4.bb
rename to meta/recipes-devtools/erofs-utils/erofs-utils_1.5.bb
index e5e19e75b4..b9a97b3e53 100644
--- a/meta/recipes-devtools/erofs-utils/erofs-utils_1.4.bb
+++ b/meta/recipes-devtools/erofs-utils/erofs-utils_1.5.bb
@@ -1,13 +1,12 @@
 SUMMARY = "Tools for erofs filesystems"
+# liberofs also available under Apache 2.0
 LICENSE = "GPL-2.0-or-later"
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


