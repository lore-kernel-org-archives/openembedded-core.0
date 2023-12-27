Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28B31C46CD2
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 13:08:31 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.101123.1703682509520425237
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Dec 2023 05:08:30 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="123536022"
X-IronPort-AV: E=Sophos;i="6.04,309,1695654000"; 
   d="scan'208";a="123536022"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2023 22:08:27 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 143C2D7AC6
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 22:08:25 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4AC08106033
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 22:08:24 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id CD87C202CCD35
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 22:08:23 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8BB3B1A006F;
	Wed, 27 Dec 2023 21:08:23 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] fontconfig: upgrade 2.14.2 -> 2.15.0
Date: Wed, 27 Dec 2023 21:08:17 +0800
Message-Id: <1703682497-24090-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28082.007
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28082.007
X-TMASE-Result: 10-3.743500-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yaoXHZz/dXlxVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJorNUVnqixiMO0NzKZ2JUx1a3A3RUN5plo2AN6i+va16u0Ct
	cUnKf9Pi4mvl5MJqKUbcz2IEzbBXpyGOiXr1rOL51e7Xbb6Im2q4sbbURvhPzgW6bY8SOq3WjxY
	yRBa/qJV/Hpl/zcOjl9OK0T+WGxHvdB/CxWTRRu+rAZ8KTspSzjJmpmjikm6x6hVjYGwlGWm7Yd
	bhsLdyyfAIOmyT7p7g3kEu3gZvSdFHbXm0n5TwhXOGfc7bwd2gku3xkZTsxbGpYCrOwyyRniB6m
	lDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 13:08:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192947

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Add FC_FONT_WRAPPER

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../fontconfig/{fontconfig_2.14.2.bb => fontconfig_2.15.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/fontconfig/{fontconfig_2.14.2.bb => fontconfig_2.15.0.bb} (93%)

diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb b/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb
similarity index 93%
rename from meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb
rename to meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb
index a3d29ddbae..b737447e47 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb
@@ -13,7 +13,7 @@ BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=fontconfig"
 
 LICENSE = "MIT & MIT & PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=00252fd272bf2e722925613ad74cb6c7 \
-                    file://src/fcfreetype.c;endline=45;md5=ce976b310a013a6ace6b60afa71851c1 \
+                    file://src/fcfreetype.c;endline=45;md5=ef8702fbf3dc506715be8a9d69cb0252 \
                     "
 
 SECTION = "libs"
@@ -24,7 +24,7 @@ SRC_URI = "http://fontconfig.org/release/fontconfig-${PV}.tar.gz \
            file://revert-static-pkgconfig.patch \
            "
 
-SRC_URI[sha256sum] = "3ba2dd92158718acec5caaf1a716043b5aa055c27b081d914af3ccb40dce8a55"
+SRC_URI[sha256sum] = "f5f359d6332861bd497570848fcb42520964a9e83d5e3abe397b6b6db9bcaaf4"
 
 UPSTREAM_CHECK_REGEX = "fontconfig-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
-- 
2.34.1


