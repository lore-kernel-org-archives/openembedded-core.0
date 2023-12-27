Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A5CAC46CD2
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 13:09:51 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.101140.1703682583818500668
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Dec 2023 05:09:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="145017775"
X-IronPort-AV: E=Sophos;i="6.04,309,1695654000"; 
   d="scan'208";a="145017775"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2023 22:09:42 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id D91D4D618A
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 22:09:38 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 19CC2D5E87
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 22:09:38 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9B567202DE8D6
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 22:09:37 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5A5461A006F;
	Wed, 27 Dec 2023 21:09:37 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-dbusmock: upgrade 0.30.0 -> 0.30.1
Date: Wed, 27 Dec 2023 21:09:29 +0800
Message-Id: <1703682569-24164-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28082.007
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28082.007
X-TMASE-Result: 10--0.595500-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrmZiw53dqSN+pTkI0HK8zpSC2
	FZ19GZheO+2AH6UJslSgGOZ3m2LY5+1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ7m0
	K7bkUDKINUccATRyd1M2wNCN6ScI7e4OGWN8bTes7Cl8sx4HBG1XgGeVUh3WdmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZJSqOl/0IUrT+xr2Yyo/uwFpGUd2UD/WOvPMT6J1YU2w3U9V
	7r3/MjVybzjCbbTYxofFzm5UftK2Eb+B/1zY9rWxOjg3VTtlNxLv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 13:09:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192949

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-bluez: Clean up static default properties, re-drop PairDevice() class_ parameter
-Add pre-commit rules

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-dbusmock_0.30.0.bb => python3-dbusmock_0.30.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dbusmock_0.30.0.bb => python3-dbusmock_0.30.1.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.30.0.bb b/meta/recipes-devtools/python/python3-dbusmock_0.30.1.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-dbusmock_0.30.0.bb
rename to meta/recipes-devtools/python/python3-dbusmock_0.30.1.bb
index 8dec23134a..7fa1154b57 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.30.0.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.30.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/python-dbusmock/"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI[sha256sum] = "dbb59e715b4d88089caed950edf93c46cb5f022ceae5d8ae37064b73baf956c1"
+SRC_URI[sha256sum] = "aa865e5345aa7626583b83f70e7956c576c24dbc19491ce7fd19281cfef49690"
 
 PYPI_PACKAGE = "python-dbusmock"
 
-- 
2.34.1


