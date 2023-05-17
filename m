Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09188C7EE2A
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 06:34:18 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.43505.1684305253551182024
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 May 2023 23:34:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="95680806"
X-IronPort-AV: E=Sophos;i="5.99,281,1677510000"; 
   d="scan'208";a="95680806"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2023 15:34:10 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id D8C35DD9C9
	for <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 15:34:08 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1B62BD946F
	for <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 15:34:08 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2273D8837A;
	Wed, 17 May 2023 15:34:07 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] iso-codes: upgrade 4.13.0 -> 4.15.0
Date: Wed, 17 May 2023 14:33:56 +0800
Message-Id: <1684305236-3199-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27630.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27630.005
X-TMASE-Result: 10-3.370000-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrbnIU6uSebvSwZuykSn6+/Hw6
	H06bMgivX64KjR1hKzoNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG21vZ
	7s3YIVDKa7IVNHJKd7tBU5f4C0eNcNrsgG44+2ERZRmuDptXfZ64sbbURvhPzgW6bY8SOq3WjxY
	yRBa/qJcFwgTvxipFajoczmuoPCq2PusQvSLZ//upMplIIUhP7smcVAQMhrlUxehcTGeFgIB+OO
	e8A0VP4XrbgzT80t53g7kVdumVUy/vNvlvoOUPm3i0PI0egVCYdJuEZuYbKVcUkrvIudlEZl07d
	DrsiYvyCLhFTP3QRDAbYwClu/qh3
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 06:34:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181447

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Translation updates for ISO 3166-1
- Translation updates for ISO 3166-3
- Translation updates for ISO 639-2
- Translation updates for ISO 3166-1
- Translation updates for ISO 3166-2
- Translation updates for ISO 3166-3
- Translation updates for ISO 639-2
- Translation updates for ISO 639-3
- Translation updates for ISO 639-5
- Translation updates for ISO 4217
- Translation updates for ISO 15924
* ISO 3166-2: Fix wrong Spanish translation

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../iso-codes/{iso-codes_4.13.0.bb => iso-codes_4.15.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/iso-codes/{iso-codes_4.13.0.bb => iso-codes_4.15.0.bb} (94%)

diff --git a/meta/recipes-support/iso-codes/iso-codes_4.13.0.bb b/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb
similarity index 94%
rename from meta/recipes-support/iso-codes/iso-codes_4.13.0.bb
rename to meta/recipes-support/iso-codes/iso-codes_4.15.0.bb
index 1950583f59..6ae6fdf8cb 100644
--- a/meta/recipes-support/iso-codes/iso-codes_4.13.0.bb
+++ b/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb
@@ -9,7 +9,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://salsa.debian.org/iso-codes-team/iso-codes.git;protocol=https;branch=main;"
-SRCREV = "ab6b01d5b56af7da9f0d2d1619a3cf84e43ed76a"
+SRCREV = "69ba16daef3c5c5e3c18f2d919e25296a4b946be"
 
 # inherit gettext cannot be used, because it adds gettext-native to BASEDEPENDS which
 # are inhibited by allarch
-- 
2.34.1


