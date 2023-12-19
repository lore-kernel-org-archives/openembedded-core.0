Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AD20C46CA2
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 09:32:08 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.8704.1702978317938370663
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 01:31:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="143760957"
X-IronPort-AV: E=Sophos;i="6.04,287,1695654000"; 
   d="scan'208";a="143760957"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 18:31:55 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 32F24D6188
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:31:53 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6FCA1D2989
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:31:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0172D201F950F
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:31:52 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9BD581A006F;
	Tue, 19 Dec 2023 17:31:51 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libva-utils: upgrade 2.20.0 -> 2.20.1
Date: Tue, 19 Dec 2023 17:31:46 +0800
Message-Id: <1702978306-7588-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28066.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28066.006
X-TMASE-Result: 10-3.293900-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvIgofMgahPrYCn
	q9qtGcvVHXATnQqW944Nyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG21vZ
	7s3YIVDI3lq3YEgY6JoqzhSsGiK9tYwDOL7t3RyFvTnqYKYXTRlXgGeVUh3WdmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZLst10TogAWVt+es/2lYZIyyDfvYeFTl6dStUk8WbdEAI3pr
	/Ul3meMWo3oT/KAZTuAVbXAWR0oXHdilSzCzWFojjj6MJ3Vg3JLv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 09:32:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192699

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Fix some coverity issues exposed in encode
-Fixed VPP coverity issues

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libva/{libva-utils_2.20.0.bb => libva-utils_2.20.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libva/{libva-utils_2.20.0.bb => libva-utils_2.20.1.bb} (95%)

diff --git a/meta/recipes-graphics/libva/libva-utils_2.20.0.bb b/meta/recipes-graphics/libva/libva-utils_2.20.1.bb
similarity index 95%
rename from meta/recipes-graphics/libva/libva-utils_2.20.0.bb
rename to meta/recipes-graphics/libva/libva-utils_2.20.1.bb
index 2e1fd09406..3bce9a1e32 100644
--- a/meta/recipes-graphics/libva/libva-utils_2.20.0.bb
+++ b/meta/recipes-graphics/libva/libva-utils_2.20.1.bb
@@ -15,7 +15,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b148fc8adf19dc9aec17cf9cd29a9a5e"
 
 SRC_URI = "git://github.com/intel/libva-utils.git;branch=v2.20-branch;protocol=https"
-SRCREV = "0c8373e62af3e4d9a3831334c5402ad255797e67"
+SRCREV = "2ad888bb463dc9bfb3deb512ec9faf78f1d3bfa8"
 S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))$"
-- 
2.34.1


