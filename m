Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E8DBC07548
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 08:26:48 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.8742.1700036799702665567
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 00:26:40 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="128069959"
X-IronPort-AV: E=Sophos;i="6.03,304,1694703600"; 
   d="scan'208";a="128069959"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 17:26:37 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 38ECBC2143
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 17:26:35 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5CF7CBF4A2
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 17:26:34 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 44082885A7;
	Wed, 15 Nov 2023 17:26:33 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libsdl2: upgrade 2.28.4 -> 2.28.5
Date: Wed, 15 Nov 2023 16:25:31 +0800
Message-Id: <1700036731-1256-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27998.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27998.006
X-TMASE-Result: 10-0.073200-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrrOCEGIPhtwjhA4WtAM986TV/
	fGF88Jrloftpkb0YXswNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0JwcxlwV9fM+V9jt7ssb
	EkSX6c0mSEJEqMNJgUaAikEAClIRNoc50oBUFVx+eAiCmPx4NwGmRqNBHmBveeFIQTy0Zb4bfaY
	87m2dqxydET58jp62S5cZb1aAHNBuHLLnWZz9OhyCgIRjK8ghMUfFQ0xo/VpwOvW0sIWmzW5skK
	bkLeAHPlEHN6LsXyG5Wkaw16CZReMuqXe9YNbJPS7+RMq/2CK6rA4c7UV2fQpvi2PQO/FFQiz2u
	jrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 08:26:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190564

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
Added support for the HP HyperX Clutch Gladiate controller
Fixed a crash if a controller is disconnected while SDL is opening it
Fixed a crash on Linux if XInput2 isn't available at runtime

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsdl2/{libsdl2_2.28.4.bb => libsdl2_2.28.5.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.28.4.bb => libsdl2_2.28.5.bb} (97%)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.28.4.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.28.5.bb
similarity index 97%
rename from meta/recipes-graphics/libsdl2/libsdl2_2.28.4.bb
rename to meta/recipes-graphics/libsdl2/libsdl2_2.28.5.bb
index 3fed10878f..fd876df0ad 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.28.4.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.28.5.bb
@@ -25,7 +25,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz"
 
 S = "${WORKDIR}/SDL2-${PV}"
 
-SRC_URI[sha256sum] = "888b8c39f36ae2035d023d1b14ab0191eb1d26403c3cf4d4d5ede30e66a4942c"
+SRC_URI[sha256sum] = "332cb37d0be20cb9541739c61f79bae5a477427d79ae85e352089afdaf6666e4"
 
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
 
-- 
2.34.1


