Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C58ADC77B61
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 09:02:58 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.39883.1681117378243696895
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 02:02:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=oxk3sIjo;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681117376; i=@fujitsu.com;
	bh=kajUu/qNxItqaHKYOSrkGxPiafFecLinjgfMMwtEwgw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=oxk3sIjoK+G/HsKgedjbACnXKdIuXAUvWUekKzS9b/eXSaGsSBrZGfVD23TlEkrOK
	 iMRXKXLLfGAkc25dsvdT0rls/e9faZsNpFi89AHO5rlLaGe1YC+ky7AOrhs2KMI7bQ
	 qBJQegCougZJPJfrvJyU7FAuFFrn+mbziXNpfCrK7rLezS0YMgJg7GFMB1tX04mC0L
	 FE2c1pQeN4pHvODw8EkYQByzLV4QugxqD3OHCtY59UPrRhNm5FUGluLILzTIoEIaO6
	 +fYgzomO0hAX+NLIcTPkcYMUF+xbY8LJ5dv5G8bbI8yifBUXEkaAyr5B5UswjaQusD
	 OsGmT3UbaFHhg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8MxSXf/BeM
  UgzMvdSzu/HzH7sDocW7jCsYAxijWzLyk/IoE1oxZZ74xFXSIVXw6/IOlgfGDcBcjF4eQwGNG
  iePNZ1kgnGtMEvM2XGSEcPYwSrR/fg3kcHKwCUhJ3Lj/n62LkYNDREBP4uo/UZAws4CKxIvfP
  ewgtrCAo8TvRb9ZQGwWAVWJyz+bmEFsXgEnidlbDzCB2BICChJTHr4Hi3MKOEscWPaIEWSkEF
  DN1WlSEOWCEidnPmGBGC8hcfDFC2aIVkWJ2ZebWSDsConG6YegRqpJXD23iXkCo+AsJO2zkLQ
  vYGRaxWhWnFpUllqka6mXVJSZnlGSm5iZo5dYpZuol1qqm5dfVJKha6iXWF6sl1pcrFdcmZuc
  k6KXl1qyiREYuinFyWd3MB7t+6t3iFGSg0lJlLeLyzhFiC8pP6UyI7E4I76oNCe1+BCjDAeHk
  gSvATAahASLUtNTK9Iyc4BxBJOW4OBREuHNOg+U5i0uSMwtzkyHSJ1iNOa4euXKXmaOTfu6Dj
  ALseTl56VKifNygJQKgJRmlObBDYLF9yVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrzbDgN
  N4cnMK4Hb9wroFCagU7hcDEBOKUlESEk1MCWcXKRY6F8meWm65MMWppbHIvsFi9SuHMwysP2r
  E3K6NcFLx5k5umd2yQ+nrQ+Mvm86vPsUQ+iBi/dW2d2U/lZSp3xi3QSXSReUvt/41nwv3Gf1z
  dVcRyb1x213jEm5HdXx6P+HvqXmC2f2HY8W9n2l4t7L+2UFO1dt2PE5GQecdrDyHwxLeHMiVl
  mq3ClafquGOid7dafs5fwd98N4jEIyGGaJnPoWzqru0ZIqcD2jOqiYYZZB2Znlmyr+cEzoyzi
  d91GpbNnRtNsn77ot4bd021V99qH5KrcTEdqKSmafhJWVi2o7rZbLaj5UCfKRtd6poKPM6ceQ
  lfG98XhUL/+uQ5fkHYoE7vxuF3RTYinOSDTUYi4qTgQAWF53LWoDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-728.messagelabs.com!1681117375!1440101!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12444 invoked from network); 10 Apr 2023 09:02:55 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-10.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 09:02:55 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 24B5A10032B
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:02:55 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 17D70100329
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:02:55 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 10:02:53 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] squashfs-tools: upgrade 4.5.1 -> 4.6.0
Date: Mon, 10 Apr 2023 17:01:51 +0800
Message-ID: <1681117314-24836-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681117314-24836-1-git-send-email-wangmy@fujitsu.com>
References: <1681117314-24836-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 09:02:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179859

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://github.com/plougher/squashfs-tools/blob/master/CHANGES

0001-install-manpages.sh-do-not-write-original-timestamps.patch
removed since it's included in 4.6.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ....sh-do-not-write-original-timestamps.patch | 30 -------------------
 .../squashfs-tools/squashfs-tools_git.bb      |  5 ++--
 2 files changed, 2 insertions(+), 33 deletions(-)
 delete mode 100644 meta/recipes-devtools/squashfs-tools/files/0001-install-manpages.sh-do-not-write-original-timestamps.patch

diff --git a/meta/recipes-devtools/squashfs-tools/files/0001-install-manpages.sh-do-not-write-original-timestamps.patch b/meta/recipes-devtools/squashfs-tools/files/0001-install-manpages.sh-do-not-write-original-timestamps.patch
deleted file mode 100644
index ed1d2f5b3b..0000000000
--- a/meta/recipes-devtools/squashfs-tools/files/0001-install-manpages.sh-do-not-write-original-timestamps.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From b44b00dae195d8587857c7e8054e9be4eaa1f8b3 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Thu, 7 Apr 2022 09:26:09 +0200
-Subject: [PATCH] install-manpages.sh: do not write original timestamps into
- .gz metadata
-
-This helps binary reproducibility.
-
-Upstream-Status: Submitted [https://github.com/plougher/squashfs-tools/pull/177]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- generate-manpages/install-manpages.sh | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/generate-manpages/install-manpages.sh b/generate-manpages/install-manpages.sh
-index d4c9e91..6a43b89 100755
---- a/generate-manpages/install-manpages.sh
-+++ b/generate-manpages/install-manpages.sh
-@@ -56,7 +56,7 @@ for i in mksquashfs unsquashfs sqfstar sqfscat; do
- 		exit 1
- 	fi
- 
--	if ! gzip -f9 $2/$i.1; then
-+	if ! gzip -n -f9 $2/$i.1; then
- 		echo "$0: Compressing installed manpage failed.  Aborting" >&2
- 		exit 1
- 	fi
--- 
-2.30.2
-
diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
index 4e009d2625..51963fe696 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
@@ -7,10 +7,9 @@ SECTION = "base"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-PV = "4.5.1"
-SRCREV = "afdd63fc386919b4aa40d573b0a6069414d14317"
+PV = "4.6.0"
+SRCREV = "8c7c87ea85546dd51651ce0ce898a4a2a54311d0"
 SRC_URI = "git://github.com/plougher/squashfs-tools.git;protocol=https;branch=master \
-           file://0001-install-manpages.sh-do-not-write-original-timestamps.patch \
            "
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
-- 
2.34.1


