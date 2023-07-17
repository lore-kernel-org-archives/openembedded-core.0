Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBAC7C04FE0
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 09:10:55 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.4250.1689585046790070710
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jul 2023 02:10:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="124256821"
X-IronPort-AV: E=Sophos;i="6.01,211,1684767600"; 
   d="scan'208";a="124256821"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 18:10:46 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id B55C2E428A
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 18:10:43 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0690DD20AF
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 18:10:43 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2D74C2FC8579;
	Mon, 17 Jul 2023 18:10:42 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] opkg-utils: upgrade 0.5.0 -> 0.6.2
Date: Mon, 17 Jul 2023 17:10:16 +0800
Message-Id: <1689585025-23731-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1689585025-23731-1-git-send-email-wangmy@fujitsu.com>
References: <1689585025-23731-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27756.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27756.006
X-TMASE-Result: 10--2.134800-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJwk5p7o69tnXDICbPFvtnTOjf3A4DTYuFV4BnlVId1nZsoi2XrUn/J8m+
	hzBStanvIM9mETCO70ydET58jp62S8rTP4uTVxbDXK8MaKm98DmwfNttv3nTj71pjyOihQt8iJN
	5p904O+bcXCrZshgQF8IwtH5+J6butLKstsqK55+6ZYsTBcnBMS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 09:10:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184446

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../opkg-utils/{opkg-utils_0.5.0.bb => opkg-utils_0.6.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/opkg-utils/{opkg-utils_0.5.0.bb => opkg-utils_0.6.2.bb} (97%)

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb
similarity index 97%
rename from meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb
rename to meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb
index b27e3ded33..eb88b9b734 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb
@@ -10,7 +10,7 @@ PROVIDES += "${@bb.utils.contains('PACKAGECONFIG', 'update-alternatives', 'virtu
 SRC_URI = "git://git.yoctoproject.org/opkg-utils;protocol=https;branch=master \
            file://0001-update-alternatives-correctly-match-priority.patch \
            "
-SRCREV = "9239541f14a2529b9d01c0a253ab11afa2822dab"
+SRCREV = "67994e62dc598282830385da75ba9b1abbbda941"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


