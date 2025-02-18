Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4F80C021B6
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 07:41:28 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.14678.1739864482814925242
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Feb 2025 23:41:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=O+Zq5kKY;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739864488; x=1771400488;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=E+pAZwX/LG0JCfxtmotFvjbbqqS7X57yhlWOk66vcGw=;
  b=O+Zq5kKYHuWTV/LRocrz/diybXamaTsZmyrxdXZIHyeqxvvZzI9qGJV5
   ey/q8NHp3F13ju/RUd5Vfugw6FvYpVko++ZqVrH0rVfKc3HgymuUzt0y6
   JaMtePvgdVuEBJDC8Z/Opdn+VHqME+uamnVoXfsewlyX7bWXRh9CbswPI
   vWwO43Yp4fQzsM9I8E+qz6k6acljs3CUZLQelbtGXqAo8ZlDwcXCRc0Ge
   ACmvYqBTxq+moWAHaPZVsh7GE/42upeBcojjULKA1o0V62PYp0GB2IwZE
   mDaoBof9tSyeZzIcFaAEHi/TBV/z3rpvjop97XIiPPP1gyK1oSkcwFYeT
   g==;
X-CSE-ConnectionGUID: ngHrYgwqTLK4N3Ff6RSQbQ==
X-CSE-MsgGUID: BoRPc3yiRPuyLtnk5jVr0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="169273907"
X-IronPort-AV: E=Sophos;i="6.13,295,1732546800"; 
   d="scan'208";a="169273907"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 16:41:26 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 81575E8523
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:24 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 44A83D96A0
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:24 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DA6711A000B;
	Tue, 18 Feb 2025 15:41:23 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 14/32] libxkbcommon: upgrade 1.7.0 -> 1.8.0
Date: Tue, 18 Feb 2025 15:39:17 +0800
Message-Id: <1739864375-21394-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
References: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 07:41:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211575

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-lib/{libxkbcommon_1.7.0.bb => libxkbcommon_1.8.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxkbcommon_1.7.0.bb => libxkbcommon_1.8.0.bb} (96%)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.0.bb
similarity index 96%
rename from meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb
rename to meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.0.bb
index f216a07983..a7dad3f4a2 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.0.bb
@@ -9,7 +9,7 @@ DEPENDS = "flex-native bison-native"
 
 SRC_URI = "git://github.com/xkbcommon/libxkbcommon;protocol=https;branch=master"
 
-SRCREV = "7a31e3585edf78be281559377e26d15f8c4bc655"
+SRCREV = "76740e0c4583ae49675e7ba8213d31ee09aa00d2"
 S = "${WORKDIR}/git"
 
 inherit meson pkgconfig bash-completion
-- 
2.43.0


