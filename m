Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49740C433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 08:39:03 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web08.4022.1665391138458776511
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 01:38:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=BnC6Q4qr;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665391137; i=@fujitsu.com;
	bh=kxn3/+0Ki0N53SxJg9Ls1MXtjM/nuSGOaHJJgrTM2ok=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=BnC6Q4qr8j+q9q/bJM7uNfOysnj3VFOyMyBzjXDlI79YWTI3hsOfplzrjPpYo+cgm
	 qZi7Rxc1wieNwcduUVkx7uaMkUrK+sy1N/We1wT3fsyiS4AcmrDp6g+mbiaD6neR+t
	 aWDzNvoO//006nJAG6OTtCf6BHQWHdSsoRQnF3izAEPsmoiNMsRNqU+qe7yca0vBJ+
	 aj5qIAV34csSs2UfoO+xhXJ6lGF8jf1f3ucC95kht1uNBOiXu8VKRgckthW7iL5Jw/
	 wKnEo9bgEki6wZV9kom5XbJKOV/rCSay8mZ/g55naKeaCJVYD45HO//qZkqbYWdbL4
	 9NlCExmT9Izlg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrLIsWRWlGSWpSXmKPExsViZ8ORqKtwyzn
  Z4OkyLYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWP/zUWsBbdEKnqmXmRtYLwm1MXIxSEk8JhR
  Ys/XK6wQzjUmiTftTWwQzh5GiUU7PrN3MXJysAmoSUy/dQOoioNDREBP4uo/UZAws4CKxIvfP
  ewgYWEBG4k1y81AwiwCqhJrtrxnArF5BRwlGlZ8ZAaxJQQUJKY8fA9mcwo4Sfx8ugrMFgKq2b
  nzCiNEvaDEyZlPWCDGS0gcfPECqldRYvblZhYIu0Ji1qw2JghbTeLquU3MExgFZyFpn4WkfQE
  j0ypGq6SizPSMktzEzBxdQwMDXUNDU11jS10LI73EKt1EvdRS3fLU4hJdILe8WC+1uFivuDI3
  OSdFLy+1ZBMjMIRTitWDdjB+W/FT7xCjJAeTkiivwSHnZCG+pPyUyozE4oz4otKc1OJDjDIcH
  EoSvKuvAuUEi1LTUyvSMnOA8QSTluDgURLhfXARKM1bXJCYW5yZDpE6xejKcfXKlb3MHFNn/9
  vPzLEcTM782naAmWPTvq4DzEIsefl5qVLivAtuADULgDRnlObBjYalgkuMslLCvIwMDAxCPAW
  pRbmZJajyrxjFORiVhHkvXQGawpOZVwJ3wSug45iAjjt51QnkuJJEhJRUA5Od9NzooJaqH3cD
  9rRzObyu1rikYPBJfbU+X4zuGTeRQzN+TZjXcHuD3jL/eQX6/CbuP6VK9tm4nb3xeP9NDwHOR
  8ped46u3q8auye178iW28FcM0wld0xT/b0rwXaSbe1WviNRVUrHkxh+Gef2yc9bMH9KSNW2nP
  kV2YsvZO0+513dNPeyaP35Vq6dxk6H/BN231c5niVQur5HZMeH1UbrqnS/nlvo84Bj07LMPEb
  pmIaI16kTmIXWHvJ+2Rl24pSeWpzsCoH9Uxadd2qcX7NjPeOzqm5VC9f1MzW5qsX8JV3nNKtw
  HD9w6/9avfqFRr5FitVHNNqTbkjHryuWTrfjeCt+4rTDmtobKz50lSuxFGckGmoxFxUnAgDup
  yF6gAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-565.messagelabs.com!1665391136!80217!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17692 invoked from network); 10 Oct 2022 08:38:56 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-8.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 10 Oct 2022 08:38:56 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 65C7D10018D
	for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 09:38:56 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 559B0100043
	for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 09:38:56 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 10 Oct 2022 09:38:54 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] mtd-utils: upgrade 2.1.4 -> 2.1.5
Date: Mon, 10 Oct 2022 16:38:32 +0800
Message-ID: <1665391113-8040-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1665391113-8040-1-git-send-email-wangmy@fujitsu.com>
References: <1665391113-8040-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Oct 2022 08:39:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171561

0001-tests-Remove-unused-linux-fs.h-header-from-includes.patch
removed since it's included in 2.1.5

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...used-linux-fs.h-header-from-includes.patch | 31 -------------------
 meta/recipes-devtools/mtd/mtd-utils_git.bb    |  8 ++---
 2 files changed, 3 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-devtools/mtd/mtd-utils/0001-tests-Remove-unused-linux-fs.h-header-from-includes.patch

diff --git a/meta/recipes-devtools/mtd/mtd-utils/0001-tests-Remove-unused-linux-fs.h-header-from-includes.patch b/meta/recipes-devtools/mtd/mtd-utils/0001-tests-Remove-unused-linux-fs.h-header-from-includes.patch
deleted file mode 100644
index 73d4a8475f..0000000000
--- a/meta/recipes-devtools/mtd/mtd-utils/0001-tests-Remove-unused-linux-fs.h-header-from-includes.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 6fb10bd18488ed84776675bc1b2982800a51d839 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 6 Aug 2022 20:14:38 -0700
-Subject: [mtd-utils][PATCH] tests: Remove unused linux/fs.h header from includes
-
-This header is not needed, moreover it includes linux/mount.h which is
-now in conflict[1] with glibc provided sys/mount.h from glibc 2.36 onwards
-
-[1] https://sourceware.org/glibc/wiki/Release/2.36
-
-Upstream-Status: Submitted [https://lists.infradead.org/pipermail/linux-mtd/2022-August/094667.html]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- tests/fs-tests/lib/tests.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/tests/fs-tests/lib/tests.c b/tests/fs-tests/lib/tests.c
-index d1a2e0c..3db0426 100644
---- a/tests/fs-tests/lib/tests.c
-+++ b/tests/fs-tests/lib/tests.c
-@@ -35,7 +35,6 @@
- #include <sys/vfs.h>
- #include <sys/mount.h>
- #include <sys/statvfs.h>
--#include <linux/fs.h>
- #include <linux/jffs2.h>
- 
- #include "tests.h"
--- 
-2.37.1
-
diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
index 943666e529..2d76991d2f 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -11,12 +11,10 @@ inherit autotools pkgconfig update-alternatives
 DEPENDS = "zlib e2fsprogs util-linux"
 RDEPENDS:mtd-utils-tests += "bash"
 
-PV = "2.1.4"
+PV = "2.1.5"
 
-SRCREV = "c7f1bfa44a84d02061787e2f6093df5cc40b9f5c"
-SRC_URI = "git://git.infradead.org/mtd-utils.git;branch=master \
-           file://0001-tests-Remove-unused-linux-fs.h-header-from-includes.patch \
-           "
+SRCREV = "3f3b4cc6c3120107e7aaa21c6415772a255ac49c"
+SRC_URI = "git://git.infradead.org/mtd-utils.git;branch=master"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


