Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCA7ECF0453
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 05:49:46 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.9229.1728452977818848407
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Oct 2024 22:49:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=imCU4QTH;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728452977; x=1759988977;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=h6dJRuX50cRsHaZKcRx5FPjmYAt5cfabAaerG12/ROg=;
  b=imCU4QTHfpaKtyduyybBfjyk1JqHtAIMJ6SKLVm7MqipCG3MQt+5Ioxs
   2fOnVuaetGvvEZl4GHdQufsfWY3BwBJ8FdXTo2X5+3Qc8v72rLXziDGiV
   QWedmkfTdKLBspQMcPAH5KUMwKq+y3V6//63fFaTet5iO6vzHcqyBpmWl
   nF7NoXwARsKu3XnpgZmPl7HfeT20UxBJewwQtNt+4d+KRWV/1knEzDvL7
   /cCJgLTOcGQ4Yhxbsi5vqd9dt++3dLMqleZhJL8QqJH19JKUCabvRr9b6
   ERRtJdSVVPawFwENR6RG/YmLYk1gPeTyU/0LQ8xeuAdlUyjEDy0w83vpr
   A==;
X-CSE-ConnectionGUID: nsEGN7VdQeKShKDJfIyecQ==
X-CSE-MsgGUID: GeKDXpkvSAiZ3eaNGNly9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="155133473"
X-IronPort-AV: E=Sophos;i="6.11,189,1725289200"; 
   d="scan'208";a="155133473"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 14:49:35 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1F8C9C68E7
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:33 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 59C48CFF8D
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:32 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id E966B40B62
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:31 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9555F1A000A;
	Wed,  9 Oct 2024 13:49:31 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 05/26] git: upgrade 2.46.1 -> 2.47.0
Date: Wed,  9 Oct 2024 13:48:54 +0800
Message-Id: <1728452955-25051-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728452955-25051-1-git-send-email-wangmy@fujitsu.com>
References: <1728452955-25051-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28718.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28718.005
X-TMASE-Result: 10-2.083500-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yYeZGkF0b0fXnJdsOLB4zv7QarzCEH4/6lpN
	bXTsWM8c7wJL2+8U4LHGKIf6hBf7VVromRa6X9R8P0HVIeixJdDBOVz0Jwcxl76S7Hfu9IUxWKo
	DKTsuRuQHPSv4KvMvjzYnftk0V7jqG2GD5Jngu0CeAiCmPx4NwBnUJ0Ek6yhjxEHRux+uk8irEH
	faj14ZyYJCEvi14V1wZQGki+HPE9ocBeaaRJAPRKKktb+jyD3WAcnIxg/qSaW+SLNu30AR5vOTY
	QrKBF2Aq0CBNmaBehqQOMJ6vlkJpRSBLAjt4zMi8gwWDQic4+rPmACeZqO85TioKJ2WPUxTLS4A
	EOLjtwA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 05:49:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205318

From: Wang Mingyu <wangmy@fujitsu.com>

0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
refreshed for 2.47.0

Changelog:
 https://raw.githubusercontent.com/git/git/master/Documentation/RelNotes/2.47.0.txt

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...nfig.mak.uname-do-not-force-RHEL-7-specific-build-.patch | 6 +++---
 meta/recipes-devtools/git/{git_2.46.1.bb => git_2.47.0.bb}  | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/git/{git_2.46.1.bb => git_2.47.0.bb} (98%)

diff --git a/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch b/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
index 3f0bc4aaa1..e5135928f0 100644
--- a/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
+++ b/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
@@ -1,4 +1,4 @@
-From be83596773e42b88ba1104f044a139f35d90a7f5 Mon Sep 17 00:00:00 2001
+From 348811a6f818408a31551d0830dcfe31c55d06a8 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Mon, 7 Feb 2022 10:13:15 +0100
 Subject: [PATCH] config.mak.uname: do not force RHEL-7 specific build settings
@@ -17,10 +17,10 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
  1 file changed, 4 deletions(-)
 
 diff --git a/config.mak.uname b/config.mak.uname
-index 85d6382..bdf06ca 100644
+index d511216..3144228 100644
 --- a/config.mak.uname
 +++ b/config.mak.uname
-@@ -64,10 +64,6 @@ ifeq ($(uname_S),Linux)
+@@ -63,10 +63,6 @@ ifeq ($(uname_S),Linux)
  	PROCFS_EXECUTABLE_PATH = /proc/self/exe
  	HAVE_PLATFORM_PROCINFO = YesPlease
  	COMPAT_OBJS += compat/linux/procinfo.o
diff --git a/meta/recipes-devtools/git/git_2.46.1.bb b/meta/recipes-devtools/git/git_2.47.0.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.46.1.bb
rename to meta/recipes-devtools/git/git_2.47.0.bb
index d301c474f2..67356874b5 100644
--- a/meta/recipes-devtools/git/git_2.46.1.bb
+++ b/meta/recipes-devtools/git/git_2.47.0.bb
@@ -164,4 +164,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "b0a4d1ad50e820edd84c0d1b609c29349d4ae2681ed458914ea759aafcd4bf21"
+SRC_URI[tarball.sha256sum] = "a84a7917e0ab608312834413f01fc01edc7844f9f9002ba69f3b4f4bcb8d937a"
-- 
2.34.1


