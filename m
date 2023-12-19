Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DA4BC41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 09:35:18 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.8729.1702978511392995747
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 01:35:11 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="132302973"
X-IronPort-AV: E=Sophos;i="6.04,287,1695654000"; 
   d="scan'208";a="132302973"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 18:35:08 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8167CD6189
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:35:06 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id C350FD5461
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:35:05 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 56B05202CE127
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:35:05 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0DA311A006F;
	Tue, 19 Dec 2023 17:35:05 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] opkg-utils: upgrade 0.6.2 -> 0.6.3
Date: Tue, 19 Dec 2023 17:34:57 +0800
Message-Id: <1702978497-7791-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28066.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28066.006
X-TMASE-Result: 10--4.616900-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrVr5aZRoV9oRW/Z+zkKZQo57z
	whVHCkW5L3L+I4V5eCOT2y3cScrkse1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQRBg
	61kSK4DgaYwo8xVHcKziMwfFTaQrQOwTo9ZXISSyeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNRF0z2eYTGiTToQ63gQTfbQI0XMj5zxnCUyPxxiUJXgXxQboRSAky3jW7LA/T/aEg0wTV
	UGcq67tK1wrCsFFzN5UQKyveb2Id/zs1/e9oUcoU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 09:35:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192704

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
-Add acls and xattrs support
-whitespace and styling
-update markdown styling
-update opkg mailing list
-add SECURITY.md
-refresh document

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../opkg-utils/{opkg-utils_0.6.2.bb => opkg-utils_0.6.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/opkg-utils/{opkg-utils_0.6.2.bb => opkg-utils_0.6.3.bb} (97%)

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb
similarity index 97%
rename from meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb
rename to meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb
index eb88b9b734..b509227e1a 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb
@@ -10,7 +10,7 @@ PROVIDES += "${@bb.utils.contains('PACKAGECONFIG', 'update-alternatives', 'virtu
 SRC_URI = "git://git.yoctoproject.org/opkg-utils;protocol=https;branch=master \
            file://0001-update-alternatives-correctly-match-priority.patch \
            "
-SRCREV = "67994e62dc598282830385da75ba9b1abbbda941"
+SRCREV = "589880d01969eb9af1e66120e731d43193504718"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


