Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE32DC021AE
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 07:41:38 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.14628.1739864485290970726
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Feb 2025 23:41:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HT5BdSng;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739864494; x=1771400494;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=F9FuY9YplWrM6rUQoLCVhKFlvwDVuCUONJO3riV/gsE=;
  b=HT5BdSngYctCPB1Bpd+6GZfVy2Bg3gQ3rdDFVucgDZZ3NxPxBoCgYR7f
   vNa4sPCs+96SLcVXtPCWpLR+Amq698xEUrb+rM/FSNevTnZxtZb9YlXUa
   FYZ/IYmkilqBP3Hz4NzJVElxJBJNTJID16P/8ZvzDpaoVn0x709TdrYFx
   z0S5MsHGo6Oh3qcPN9S2x2WZYT80+BICOW3twMW+uTN4Uc+6G4IzRLTeN
   Q7M19w9voUuY0GLT5hEuTAOuFpvFQd+0W1wzdNymvHeshRFZSxNwNpbRc
   eT3XFFhzWRQGAYjwhdjAYkQk9yeUeEdjcRGQTt9HmKz60ZcgLygtE4svf
   Q==;
X-CSE-ConnectionGUID: bk66X20TQmib/DhmoslPXg==
X-CSE-MsgGUID: 8dNP7xY1TE+AP2RzpC8Qsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="169232673"
X-IronPort-AV: E=Sophos;i="6.13,295,1732546800"; 
   d="scan'208";a="169232673"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 16:41:32 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7AE8DE8525
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 42DE2F313
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:30 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 094601A000B;
	Tue, 18 Feb 2025 15:41:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 30/32] xkeyboard-config: upgrade 2.43 -> 2.44
Date: Tue, 18 Feb 2025 15:39:33 +0800
Message-Id: <1739864375-21394-30-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
References: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 07:41:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211593

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{xkeyboard-config_2.43.bb => xkeyboard-config_2.44.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.43.bb => xkeyboard-config_2.44.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb
rename to meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb
index 7378cf475e..52d074fd5e 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb
@@ -13,7 +13,7 @@ LICENSE = "MIT & MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8fc8ae699974c360e2e2e883a63ce264"
 
 SRC_URI = "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "c810f362c82a834ee89da81e34cd1452c99789339f46f6037f4b9e227dd06c01"
+SRC_URI[sha256sum] = "54d2c33eeebb031d48fa590c543e54c9bcbd0f00386ebc6489b2f47a0da4342a"
 
 SECTION = "x11/libs"
 DEPENDS = "util-macros libxslt-native"
-- 
2.43.0


