Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86813C77B70
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 01:01:58 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.3166.1681174909037469590
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 18:01:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=N0vR/EDo;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681174907; i=@fujitsu.com;
	bh=/h9C1+0cKseOw5a5RFh8X4yIT6GTtcIcRc7dg+DOUJ8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=N0vR/EDo+hSTH+iVDbNRX8GQJYAqX/qX8hPL2GGF7rbzKTAzDKlC6L2KjFtfmCZ6L
	 ZLBtANF6+bCNvNjNgUkVUFq0d9OGCdqOTXyxQrXgrMJElJh0okRKflXR9ZzdQD/yaD
	 k2EjVRAVGEMiIZBqU0gOczJb+OHJ4LON/kXPM9kK43HdP2e/Ny533EKphd49Xpqf0D
	 ZCA1vMZbHgkGGrJpcLZ0NbepWHYF1h1WLugmAFHuejQlfuukMjxPvuxskkEMn8aItP
	 Cv+OYjWWE4q/MsgBc7Q1PD4TC/uWbVIRXF24ubwyInONyOVZmRuJ1JKEcZFwdtgRfr
	 Mcsdo431vZI8w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRWlGSWpSXmKPExsViZ8OxWbdqo0m
  Kwdscizs/37E7MHqc27iCMYAxijUzLym/IoE14/+CNSwFrRIVU/qjGhifiHYxcnIICTxglPi1
  Jb6LkQvIvsQkseNSPzuEs4dRouvzfHaQKjYBKYkb9/+zdTFycIgI6Elc/QfWzCygIvHidw9Yi
  bCAi8TGXfdYQGwWAVWJxVc7wcp5BZwkVk00AwlLCChITHn4nhkkzCngLHFoQxLECU4S99ZuAO
  vkFRCUODnzCQvEdAmJgy9eMEO0KkrMvtzMAmFXSDROP8QEYatJXD23iXkCo+AsJO2zkLQvYGR
  axWhWnFpUllqka66XVJSZnlGSm5iZo5dYpZuol1qqm5dfVJKha6iXWF6sl1pcrFdcmZuck6KX
  l1qyiREYsinFqZw7GFf2/dU7xCjJwaQkyrtKziRFiC8pP6UyI7E4I76oNCe1+BCjDAeHkgTv3
  0VAOcGi1PTUirTMHGD8wKQlOHiURHg5VwCleYsLEnOLM9MhUqcYjTmuXrmyl5lj076uA8xCLH
  n5ealS4rwWIJMEQEozSvPgBsHi+hKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd7I9UBTeDL
  zSuD2vQI6hQnolJMWYKeUJCKkpBqYVNY0+0QuKkt5E74l2G37vQcmn1Y19ipM/RMe99rwn7iq
  hMzJa5tu5O6btytoSvSLUgk2q/kqgiz/bhaZG3W+WP384SVmr16G3N/ts359ML95ecPKoMSUB
  KHFTE+cD5Uv4tRJ7uyZ2LT73jXvjob3m1/q/slS5P5WuGzV4szPKtNyXoQl3Dyv98Rr2eFYB2
  eN9Mz4JNn51p4G15IiihdwFn1o+7pi5kTD6Zs3CW3szLx0bdu+BlGVkz+zbos0Si+wy7/VvVf
  ybwCD7lnDrxneipFdclKJ7+79dtC1yLJi6vJZdczSTOjOwrjKi9tLD6zpfnjGXzr7zIEIAW0p
  dRexGbscuD2sT2+p9VDcn/RJiaU4I9FQi7moOBEAwAyXKmYDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-732.messagelabs.com!1681174905!441070!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5880 invoked from network); 11 Apr 2023 01:01:45 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-4.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 11 Apr 2023 01:01:45 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 6F192153
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Apr 2023 02:01:45 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 628F17B
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Apr 2023 02:01:45 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 11 Apr 2023 02:01:43 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH V2] squashfs-tools: upgrade 4.5.1 -> 4.6.0
Date: Tue, 11 Apr 2023 09:01:28 +0800
Message-ID: <1681174888-30847-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681174888-30847-1-git-send-email-wangmy@fujitsu.com>
References: <1681174888-30847-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Apr 2023 01:01:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179904

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://github.com/plougher/squashfs-tools/blob/master/CHANGES

0001-install-manpages.sh-do-not-write-original-timestamps.patch
removed since it's included in 4.6.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ....sh-do-not-write-original-timestamps.patch | 30 -------------------
 ...s-tools_git.bb => squashfs-tools_4.6.0.bb} |  4 +--
 2 files changed, 1 insertion(+), 33 deletions(-)
 delete mode 100644 meta/recipes-devtools/squashfs-tools/files/0001-install-manpages.sh-do-not-write-original-timestamps.patch
 rename meta/recipes-devtools/squashfs-tools/{squashfs-tools_git.bb => squashfs-tools_4.6.0.bb} (91%)

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
diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.6.0.bb
similarity index 91%
rename from meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
rename to meta/recipes-devtools/squashfs-tools/squashfs-tools_4.6.0.bb
index 4e009d2625..6a95079da5 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.6.0.bb
@@ -7,10 +7,8 @@ SECTION = "base"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-PV = "4.5.1"
-SRCREV = "afdd63fc386919b4aa40d573b0a6069414d14317"
+SRCREV = "8c7c87ea85546dd51651ce0ce898a4a2a54311d0"
 SRC_URI = "git://github.com/plougher/squashfs-tools.git;protocol=https;branch=master \
-           file://0001-install-manpages.sh-do-not-write-original-timestamps.patch \
            "
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
-- 
2.34.1


