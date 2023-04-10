Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5C7CC77B61
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 09:03:08 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.39886.1681117385743870575
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 02:03:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Pxn23Typ;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681117383; i=@fujitsu.com;
	bh=mqSTkRmmi7iMnok7AZ0MCKLb1f6qzmqU4GZQQpKQ8PA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Pxn23TypCclEWhcmykjSKJY/o1Tni32jwW8pHdabAoeLawiG0uUkQMGxcy6nbvUNn
	 kcvDSRK8qn3KmcqcZ9Do8WkywiCfEKkUa3vEccsuoSnzT97JfQHndUQONMsJ563Teu
	 avB0UN0+S+1MF1sgOMUBvBZUf5M0u5Smrmjr5Ib5/IadVvAMaW03gobye+dB0MZO3F
	 Mw0sUUveo+NZgXTXvAkXeW+OMRosLofKB54hZsT2EgVJcBH1R1Yli9/P+/EjW652F2
	 oArh3Y6WSlaq9vdAhVrk4OUe/U5ZO+y71fkIuuebwwO1eEqa1fe2Qt516icovsWptI
	 9xb0/LuXgTieA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrLIsWRWlGSWpSXmKPExsViZ8ORqHv8gnG
  KwduLohZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aDs/+YC/bIVNz68p2lgfGiZBcjF4eQwGNG
  iVVTtzBBONeYJD43tjNCOHsYJWZtn8vWxcjJwSYgJXHj/n8gm4NDREBP4uo/UZAws4CKxIvfP
  ewgtrCAs8Tc14fAylkEVCV2rdwHVs4r4CTxfFc5SFhCQEFiysP3zCA2J1D5gWWPGEFKhIBKrk
  6TAgnzCghKnJz5hAViuoTEwRcvmCFaFSVmX25mgbArJBqnH2KCsNUkrp7bxDyBUXAWkvZZSNo
  XMDKtYjQvTi0qSy3SNTTRSyrKTM8oyU3MzNFLrNJN1Est1c3LLyrJ0DXUSywv1kstLtYrrsxN
  zknRy0st2cQIDN2U4sTjOxhf9f3VO8QoycGkJMrbxWWcIsSXlJ9SmZFYnBFfVJqTWnyIUYaDQ
  0mC1wAYDUKCRanpqRVpmTnAOIJJS3DwKInwZp0HSvMWFyTmFmemQ6ROMVpyXL1yZS8zx6Z9XQ
  eYOTr3A0khlrz8vFQpcV4OkAYBkIaM0jy4cbBYv8QoKyXMy8jAwCDEU5BalJtZgir/ilGcg1F
  JmHfbYaApPJl5JXBbXwEdxAR0EJeLAchBJYkIKakGJp2O6Y+ybyjzs342tdaZu2atv8Pp+18v
  77iSbjK1UKo3z+vyqiOLea5tNlGbvDBa1D1H8mXPE94v9aqTF5c6ceg38fyTtt6t1bd6zYXS2
  hdzGouTo2+G9HBeryloXff9rGXHT6VOORaeK/XClfOlIqceESrmfrFpt+DV0tNtQmmPxZ/wbr
  r/7oHNQfXWae1/PQ4q162O4hAonx3A3LrTdtlvvl1PlnzJnrs5vV4tv3o/j8q6NReObbFWdHL
  20mM8detM53oXh/t3Ji9vEtzDcl294fCeT13JD8Iygw5UBXFqWq0RVDgT9sz44uap4SIiCzZ7
  7N+38UiGapnMKZ0E67ndFzbMTftQ0xP14s1uXSWW4oxEQy3mouJEAMWS2fxwAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-728.messagelabs.com!1681117382!1439966!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 944 invoked from network); 10 Apr 2023 09:03:03 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-9.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 09:03:03 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id B9E0C1001BA
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:03:02 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id AD1591001B0
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:03:02 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 10:03:01 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] u-boot-tools: upgrade 2023.01 -> 2023.04
Date: Mon, 10 Apr 2023 17:01:52 +0800
Message-ID: <1681117314-24836-3-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 09:03:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179860

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Revert-config-tools-only-add-VIDEO-to-build-bmp_logo.patch
removed since it's included in 2023.04

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ols-only-add-VIDEO-to-build-bmp_logo.patch | 39 -------------------
 meta/recipes-bsp/u-boot/u-boot-common.inc     |  2 +-
 .../u-boot/u-boot-tools_2023.01.bb            |  4 --
 .../u-boot/u-boot-tools_2023.04.bb            |  3 ++
 4 files changed, 4 insertions(+), 44 deletions(-)
 delete mode 100644 meta/recipes-bsp/u-boot/files/0001-Revert-config-tools-only-add-VIDEO-to-build-bmp_logo.patch
 delete mode 100644 meta/recipes-bsp/u-boot/u-boot-tools_2023.01.bb
 create mode 100644 meta/recipes-bsp/u-boot/u-boot-tools_2023.04.bb

diff --git a/meta/recipes-bsp/u-boot/files/0001-Revert-config-tools-only-add-VIDEO-to-build-bmp_logo.patch b/meta/recipes-bsp/u-boot/files/0001-Revert-config-tools-only-add-VIDEO-to-build-bmp_logo.patch
deleted file mode 100644
index ab05761146..0000000000
--- a/meta/recipes-bsp/u-boot/files/0001-Revert-config-tools-only-add-VIDEO-to-build-bmp_logo.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 5d663e105f5affbe1ba771a1124855bff748b829 Mon Sep 17 00:00:00 2001
-From: Fabio Estevam <festevam@denx.de>
-Date: Wed, 18 Jan 2023 22:15:04 -0300
-Subject: [PATCH] Revert "config: tools only: add VIDEO to build bmp_logo"
-
-This reverts commit 1cfba53ca46cade2dbf4e067afc8c19e72909a4b.
-
-Since commit 1cfba53ca46c ("config: tools only: add VIDEO to build
-bmp_logo") the build of tools-only_defconfig fails:
-
-| /bin/sh: line 1: tools/bmp_logo: No such file or directory
-
-This has been noticed in OpenEmbedded and Debian [1].
-
-Revert it for now.
-
-[1] https://lists.denx.de/pipermail/u-boot/2023-January/504758.html
-
-Upstream-Status: Backport [https://source.denx.de/u-boot/u-boot/-/commit/6333acb961b6fcaa60c6e5b623d676b332481cfa]
-Signed-off-by: Fabio Estevam <festevam@denx.de>
----
- configs/tools-only_defconfig | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/configs/tools-only_defconfig b/configs/tools-only_defconfig
-index 2197063112..fb75235e3d 100644
---- a/configs/tools-only_defconfig
-+++ b/configs/tools-only_defconfig
-@@ -29,7 +29,6 @@ CONFIG_DM_RTC=y
- CONFIG_SOUND=y
- CONFIG_SYSRESET=y
- CONFIG_TIMER=y
--CONFIG_VIDEO=y
- # CONFIG_VIRTIO_MMIO is not set
- # CONFIG_VIRTIO_PCI is not set
- # CONFIG_VIRTIO_SANDBOX is not set
--- 
-2.25.1
-
diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index d72f6d3ba2..8a2e9aef94 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -12,7 +12,7 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "62e2ad1ceafbfdf2c44d3dc1b6efc81e768a96b9"
+SRCREV = "fd4ed6b7e83ec3aea9a2ce21baea8ca9676f40dd"
 
 SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2023.01.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2023.01.bb
deleted file mode 100644
index 3484b359ad..0000000000
--- a/meta/recipes-bsp/u-boot/u-boot-tools_2023.01.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require u-boot-common.inc
-require u-boot-tools.inc
-
-SRC_URI += "file://0001-Revert-config-tools-only-add-VIDEO-to-build-bmp_logo.patch"
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2023.04.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2023.04.bb
new file mode 100644
index 0000000000..ef386f76e6
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/u-boot-tools_2023.04.bb
@@ -0,0 +1,3 @@
+require u-boot-common.inc
+require u-boot-tools.inc
+
-- 
2.34.1


