Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3434CC4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 23:36:48 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.14420.1701214602621419286
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 15:36:43 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="142855067"
X-IronPort-AV: E=Sophos;i="6.04,234,1695654000"; 
   d="scan'208";a="142855067"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 08:36:40 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id C711FD9DAB
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 08:36:37 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 20966D9688
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 08:36:37 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.149])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id E59DB869FA;
	Wed, 29 Nov 2023 08:36:35 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] ethtool: upgrade 6.5 -> 6.6
Date: Wed, 29 Nov 2023 07:35:59 +0800
Message-Id: <1701214559-1512-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28026.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28026.003
X-TMASE-Result: 10--3.056200-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mr0bdjqKOoG3fMgTnl5cHHuHw6
	H06bMgiv/a1zVOcMCUt1Luz0vLZcOPc2FOs5RCDbP0HVIeixJdA3l2plwgrtWMC5DTEMxpeQFH0
	IKehhaoZt3t347YMumgLs0waEHW2U5blhnExvtopIcJTn2HkqsfioIsi7Sa0gmM5k0XPaqmmem2
	vw+cenKeLzNWBegCW24nmFeyfGnuMLbigRnpKlKZx+7GyJjhAUal1sy4UiDJ7yrqIL5gX8IudVJ
	p6xpUYfSQanOd7DEQcVzZO0Td5x9vOBqezX/FGZPE7Q1qIxqHMh8OJtmG2OnnUbc8qRd5fP7H2f
	VekOqwmYL1KImKhq1ZuOe7yPCBvAf2OJxbAVgHQ+kK598Yf3Mg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 23:36:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191410

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Feature: support for more CMIS transceiver modules (-m)
* Fix: fix build on systems with old kernel uapi headers

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/ethtool/{ethtool_6.5.bb => ethtool_6.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/ethtool/{ethtool_6.5.bb => ethtool_6.6.bb} (93%)

diff --git a/meta/recipes-extended/ethtool/ethtool_6.5.bb b/meta/recipes-extended/ethtool/ethtool_6.6.bb
similarity index 93%
rename from meta/recipes-extended/ethtool/ethtool_6.5.bb
rename to meta/recipes-extended/ethtool/ethtool_6.6.bb
index ef925e16b9..ab824356c2 100644
--- a/meta/recipes-extended/ethtool/ethtool_6.5.bb
+++ b/meta/recipes-extended/ethtool/ethtool_6.6.bb
@@ -11,7 +11,7 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[sha256sum] = "aed41ca58b3129126f18429172064d214191d7e7ef52c6e3f6b2ff7503706c03"
+SRC_URI[sha256sum] = "d4cdb4f7498781fb516e2b3d0eadab28691da3fd3e3445954e82d745de95fb96"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/software/network/ethtool/"
 
-- 
2.34.1


