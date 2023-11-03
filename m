Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9875C4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 07:54:23 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.39089.1698998062213660322
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Nov 2023 00:54:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="138502913"
X-IronPort-AV: E=Sophos;i="6.03,273,1694703600"; 
   d="scan'208";a="138502913"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 16:54:21 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id DE041D3EAC
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:54:17 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1905CD9680
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:54:17 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id E28FAE4ABD;
	Fri,  3 Nov 2023 16:54:15 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] xserver-xorg: upgrade 21.1.8 -> 21.1.9
Date: Fri,  3 Nov 2023 15:53:25 +0800
Message-Id: <1698998005-31516-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27974.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27974.005
X-TMASE-Result: 10-1.094000-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrWtDhCHcVAp54YeSlHZYForxW
	X+DacI6twl//q4VwmmgNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG2Ksm
	10TThDCKxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dJNj6WA3EkDPPoLR4+zsDTtoubv1b7BWh2v4B
	2N7NRFrijoA+qUd4fKu42qxdmlaR0O0vGDXd7Pj6iNsOo+JgebsgksahdWQpiHjW5PHXK6VqDQ8
	iXmLH+EQY7wTcUSglPyDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgAQ4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 07:54:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190140

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-present: Send a PresentConfigureNotify event for destroyed windows
-Switch to libbsd-overlay
-Xi/randr: fix handling of PropModeAppend/Prepend
-mi: reset the PointerWindows reference on screen switch

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{xserver-xorg_21.1.8.bb => xserver-xorg_21.1.9.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.8.bb => xserver-xorg_21.1.9.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.9.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.9.bb
index 19db7ea434..43c06181e3 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.9.bb
@@ -3,7 +3,7 @@ require xserver-xorg.inc
 SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
            "
-SRC_URI[sha256sum] = "38aadb735650c8024ee25211c190bf8aad844c5f59632761ab1ef4c4d5aeb152"
+SRC_URI[sha256sum] = "ff697be2011b4c4966b7806929e51b7a08e9d33800d505305d26d9ccde4b533a"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.34.1


