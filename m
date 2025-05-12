Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B04C3C54E90
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:04:13 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.45914.1747040638623560703
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:04:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RgYCjRkQ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747040643; x=1778576643;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=4Fd2VJwPpb+hfFpkb8QUtG/QhcoEqtcYhWGoH/ACpHw=;
  b=RgYCjRkQPX+64SKLNM+KCqV3EgbBrq0y/mtcICj3Ug4wnwbajfaltVgZ
   KTroQLR39TvZTsUImdvNL1rjN8N6BIBrksu06fLjZuqmIl33n3hIx15Uf
   r+g6nL+bp5Jb3iRBIuTaIOxgfDMUsT61p3B+Dx0eCiBE4HkFiSIKW+/G+
   CBbSQftTNYzaJEaF/rZvqZdyezMH8vei1AzGI3xbtkwNHjF+pugNHNYwh
   7zcIggEGKstVFG8qoHURMl2ZfAF6/PuhwzT5fjcCMHviRH1DrF6KyHimm
   k44qnd/JQBGUhf0KhjKgiKSJPODeFx9QKXglDYuvE8JlxvPEDlvKNFaWU
   w==;
X-CSE-ConnectionGUID: XGSnI8vgTUO7587uKV671A==
X-CSE-MsgGUID: q/HBuBpiQSqYTA/eEPGYmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="199533793"
X-IronPort-AV: E=Sophos;i="6.15,281,1739804400"; 
   d="scan'208";a="199533793"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 18:04:02 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0B707D5056
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:04:00 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id BA707D505A
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:59 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4D2301A00A2;
	Mon, 12 May 2025 17:03:59 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 31/56] libxkbcommon: upgrade 1.8.1 -> 1.9.2
Date: Mon, 12 May 2025 17:03:14 +0800
Message-Id: <1747040619-7566-31-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:04:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216327

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-lib/{libxkbcommon_1.8.1.bb => libxkbcommon_1.9.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxkbcommon_1.8.1.bb => libxkbcommon_1.9.2.bb} (94%)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.9.2.bb
similarity index 94%
rename from meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb
rename to meta/recipes-graphics/xorg-lib/libxkbcommon_1.9.2.bb
index 76a622e157..77ee8ce500 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.9.2.bb
@@ -7,9 +7,9 @@ LICENSE = "MIT & MIT-open-group & HPND & HPND-sell-variant & X11"
 
 DEPENDS = "flex-native bison-native"
 
-SRC_URI = "git://github.com/xkbcommon/libxkbcommon;protocol=https;branch=master"
+SRC_URI = "git://github.com/xkbcommon/libxkbcommon;protocol=https;branch=master;tag=xkbcommon-${PV}"
 
-SRCREV = "b3465081878e80ca6c11fe35c81787ec374ec15a"
+SRCREV = "dd642359f8d43c09968e34ca7f1eb1121b2dfd70"
 S = "${WORKDIR}/git"
 
 inherit meson pkgconfig bash-completion
-- 
2.43.0


