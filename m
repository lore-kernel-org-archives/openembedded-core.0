Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFC83CA5529
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 09:38:03 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.7705.1694597882484219713
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 02:38:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="111397031"
X-IronPort-AV: E=Sophos;i="6.02,142,1688396400"; 
   d="scan'208";a="111397031"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 18:37:59 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 46E7FCD7E5
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 18:37:57 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 84A4EACD72
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 18:37:56 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9974A200501AE;
	Wed, 13 Sep 2023 18:37:55 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [PATCH] [OE-core] [PATCH] font-util: upgrade 1.4.0 -> 1.4.1
Date: Wed, 13 Sep 2023 17:36:37 +0800
Message-Id: <1694597797-21673-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27872.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27872.006
X-TMASE-Result: 10--2.444200-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/ybnHu4BcYSmtPsGG+kQsvKgc5SGKNk1CG5nA
	lBEbeOzkZRUjkVFROF6EselkymEYFY+zxsyRFQbXEclbAMYYY6xUENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmibAGOCaWkxjuzRPQ8T4oe5aGaFJ51fdvCqOT+wIyiMDiUg5
	UD6AlF0rF9uGobEuT7gDLqnrRlXraum3vxp9wM190H8LFZNFG76sBnwpOylLOaQfGDA4XSAJrbn
	M8OTd3Y8aWeI2eQV5c3wVC+epj/22Kr3vfrxWcvNTo5+SR/BI0w5iqzMMFVWjBrby2JM9NsSWUK
	wlScaeGIHqaUMp7VXtL/LK0d4I30Ze/gJB41STsbqpM7Cr+fvX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 09:38:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187570

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
- Replace unicode files with ones that provide better terms of use
  Identical files but these have the unicode terms-of-use (SPDX:
  Unicode-TOU) instead of some old license format.

   https://www.unicode.org/Public/MAPPINGS/ISO8859/8859-1.TXT
   https://www.unicode.org/Public/MAPPINGS/OBSOLETE/EASTASIA/JIS/JIS0201.TXT
   https://www.unicode.org/Public/MAPPINGS/VENDORS/MISC/KOI8-R.TXT

- Remove "All rights reserved" from Oracle copyright notices
  Oracle no longer includes this term in our copyright & license notices.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-font/{font-util_1.4.0.bb => font-util_1.4.1.bb}   | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-font/{font-util_1.4.0.bb => font-util_1.4.1.bb} (74%)

diff --git a/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb b/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb
similarity index 74%
rename from meta/recipes-graphics/xorg-font/font-util_1.4.0.bb
rename to meta/recipes-graphics/xorg-font/font-util_1.4.1.bb
index db82104afe..c422482f08 100644
--- a/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb
+++ b/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb
@@ -4,10 +4,11 @@ require xorg-font-common.inc
 
 #Unicode is MIT
 LICENSE = "MIT & MIT & BSD-4-Clause & BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=5df208ec65eb84ce5bb8d82d8f3b9675 \
+LIC_FILES_CHKSUM = "file://COPYING;md5=2a9e705c00e463c8d294f90486852e06 \
                     file://ucs2any.c;endline=28;md5=8357dc567fc628bd12696f15b2a33bcb \
                     file://bdftruncate.c;endline=26;md5=4f82ffc101a1b165eae9c6998abff937 \
-                    file://map-ISO8859-1;beginline=9;endline=23;md5=1cecb984063248f29ffe5c46f5c04f34"
+                    file://map-ISO8859-1;beginline=9;endline=23;md5=f66cea01f9377a2a5ebbf0dcd2126124 \
+                    "
 
 DEPENDS = "encodings util-macros"
 DEPENDS:class-native = "util-macros-native"
@@ -16,7 +17,7 @@ RDEPENDS:${PN}:class-native = ""
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[sha256sum] = "9f724bf940128c7e39f7252bd961cd38cfac2359de2100a8bed696bf40d40f7d"
+SRC_URI[sha256sum] = "5c9f64123c194b150fee89049991687386e6ff36ef2af7b80ba53efaf368cc95"
 
 SYSROOT_DIRS_IGNORE:remove = "${datadir}/fonts"
 
-- 
2.34.1


