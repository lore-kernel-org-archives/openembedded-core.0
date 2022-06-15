Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AA9CC43334
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 09:08:34 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web09.2411.1655284106352583971
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 02:08:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=UYKjrnBq;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655284104; i=@fujitsu.com;
	bh=gnw8U4q40ALzBD6Zwl1B1BaRFLkDHWmI8y1FZbynXO8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=UYKjrnBqVIckuY1jKdfGslikyybzqcxBU4vCBRqO/dxW07Zv8iJ0OCRIdTS1/cSy4
	 9I4gkJg1MwcaJ60isAKsZq0hbA9fbHZAcHWxMkTeoPl7UTKBZu1k3J0vnlFEblsYsW
	 vf9i2nCVO0zKe5Ky3zuDqZmBpAQRzCKYXBq8ggkak/ig4VUgjOYEdDE11S9D+U6l1F
	 pN/HsEsgMAH6V/+h/EmNDbVsAlWm30iLGuwOKniHGsJPC0WiOEIYC+tJsKlxl2sFN+
	 mhD2VhMKtH+xxedSOD5VoiQOx6w2WppJBDpNPTZ/xliRFcQzE44dAKeKF7nDZMXqHx
	 Z1ZJBhwAdsUxw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRWlGSWpSXmKPExsViZ8OxWbdt4co
  kg/2HlS3u/HzH7sDocW7jCsYAxijWzLyk/IoE1oy1B+YwF7yVrtj39zh7A+MniS5GLg4hgQeM
  El0Xd7FBOKeZJKa9nQDl7GGUeN7UxNrFyMnBJqAmMf3WDSCbg0NEQE/i6j9RkDCzgIrEi9897
  CC2sICtxO9zn5lAbBYBVYnDB2cwgti8Ao4SPd1bmEFsCQEFiSkP3zNDxAUlTs58wgIxR0Li4I
  sXUDWKErMvN7NA2BUSM2ZsY4Ow1SSuntvEPIGRfxaS9llI2hcwMq1itEoqykzPKMlNzMzRNTQ
  w0DU0NNU10zUyNNBLrNJN1Est1S1PLS7RNdRLLC/WSy0u1iuuzE3OSdHLSy3ZxAgMypRitks7
  GOf2/dQ7xCjJwaQkyhs/e2WSEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQle10lAOcGi1PTUirTMH
  GCEwKQlOHiURHi3zwdK8xYXJOYWZ6ZDpE4x2nN8OHRlLzPH1Nn/9jNzLAeTM7+2HWAWYsnLz0
  uVEueNXwDUJgDSllGaBzcUFtGXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzWoFM4cnMK4H
  b/QroLCagsxr3rQA5qyQRISXVwDTDwu/wsabHc3hO984I3PBIvULqt+Xfe+vX3N+zwntJkcv1
  Da5q52Xsni26XbdM7K8Ot4HKBIOSFTlrcp/IGDEG9rudcajnsVT8yL+x0kpEQijhbUPIx6DiX
  yH7Stjn9B4VCD8TZiUe8Hq6ZEwXY77FQcNjazsnL3Vm8rsca3lc01xknq1A/vZP7bVGGlaKjP
  G2RnrRt39kLFAMib26wfrY79wHnx592HQ3/K4Dn/YXHp2wu1/urXmX47EtefuXjj2s3J4abM/
  y+1MDl5YJbjgmt7Zm84Eda787d4WUthqKJx8/l9q9g+Hk0i0yd7r4bbx/tYotZxPwKl/bbfzm
  6OlnhqLzEyefCkv9vKa/QImlOCPRUIu5qDgRAO7R0M5jAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-591.messagelabs.com!1655284102!150038!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11643 invoked from network); 15 Jun 2022 09:08:22 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-8.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Jun 2022 09:08:22 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 26FFD14C
	for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 10:08:22 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 1AA9C75
	for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 10:08:22 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 15 Jun 2022 10:08:03 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] erofs-utils: upgrade 1.4 -> 1.5
Date: Wed, 15 Jun 2022 17:07:49 +0800
Message-ID: <1655284069-7150-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 09:08:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166924

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
index e5e19e75b4..2a313cf9ad 100644
--- a/meta/recipes-devtools/erofs-utils/erofs-utils_1.4.bb
+++ b/meta/recipes-devtools/erofs-utils/erofs-utils_1.5.bb
@@ -1,13 +1,11 @@
 SUMMARY = "Tools for erofs filesystems"
-LICENSE = "GPL-2.0-or-later"
+LICENSE = "GPL-2.0-or-later or Apache-2.0"
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


