Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FFBCCDB474
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 06:03:18 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.111726.1697436190506974014
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 23:03:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="115096884"
X-IronPort-AV: E=Sophos;i="6.03,228,1694703600"; 
   d="scan'208";a="115096884"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 15:03:08 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id F27BDCA1E8
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 15:03:05 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2DC7AD5D53
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 15:03:05 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id E2E032FC6BA5;
	Mon, 16 Oct 2023 15:03:03 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] xkeyboard-config: upgrade 2.39 -> 2.40
Date: Mon, 16 Oct 2023 14:02:53 +0800
Message-Id: <1697436173-28865-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27938.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27938.005
X-TMASE-Result: 10-3.659200-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yRIRh9wkXSlFVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJogwIsQZbtzZwk3rl+MaNgxD4qCLIu0mtILoKhD6eS+1+XH3
	W+57nGfmBkESMI05d4nF03j9r9uDDCbm0451GVI3dCok3ibXlQX0tCKdnhB58I/9UW5M5dRMQpr
	Z/7WnuveTCMddcL/gjxlblqLlYqXLtPgA7Ff89MtluQfIIPAGiSd/nx09AMFyy7pTifZdAYuejV
	we5c+u0+PyLqROU3IduOjruZwjJ2tEwNtBBPExsJUeN62cIxgz+v9v52ZIoWjoAf389xF3XFSk9
	HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 06:03:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189257

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: remove excess line end spaces

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{xkeyboard-config_2.39.bb => xkeyboard-config_2.40.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.39.bb => xkeyboard-config_2.40.bb} (85%)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb
similarity index 85%
rename from meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb
rename to meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb
index 4795464ac0..5c1f475739 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb
@@ -10,10 +10,10 @@ HOMEPAGE = "http://freedesktop.org/wiki/Software/XKeyboardConfig"
 BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=xkeyboard-config"
 
 LICENSE = "MIT & MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0e7f21ca7db975c63467d2e7624a12f9"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8fc8ae699974c360e2e2e883a63ce264"
 
 SRC_URI = "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "5ac5f533eff7b0c116805fe254fd79b2c9882700a4f9f2c070f8c4eae5aaa682"
+SRC_URI[sha256sum] = "7a3dba1bec7dc7191432da021242d17c9cf6c89690e6c57b0de048ff8c9d2ae3"
 
 SECTION = "x11/libs"
 DEPENDS = "util-macros libxslt-native"
-- 
2.34.1


