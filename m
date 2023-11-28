Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20876C4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 23:43:58 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.14269.1701215029238359776
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 15:43:49 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="141134741"
X-IronPort-AV: E=Sophos;i="6.04,234,1695654000"; 
   d="scan'208";a="141134741"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 08:43:47 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id D8750D618A
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 08:43:44 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1DE40D9743
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 08:43:44 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.149])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id E15A8869FA;
	Wed, 29 Nov 2023 08:43:42 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-wheel: upgrade 0.41.3 -> 0.42.0
Date: Wed, 29 Nov 2023 07:43:04 +0800
Message-Id: <1701214984-1884-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28026.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28026.003
X-TMASE-Result: 10-3.034400-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwjVbZFdXapsKSvG
	qScnsLro4/lM/D9d1hNGZriJw3Sdwe1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQD5+
	EY120A3oWm/gAtjCd7AYUFsN5WfiF8plQwfMmRJSeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNWvjt7RMoWhlceyc7rMzd0ZAdr9lbqkf3Yb3c8MxNy6tgndkDshB+Aqe4KIRzNu8uSPGM
	enMloNZI9OgYtiVS98o3CVl65BtnujgMZI4KJ30U8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 23:43:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191419

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Allowed removing build tag with wheel tags --build ""
-Fixed wheel pack and wheel tags writing updated WHEEL fields after a blank
 line, causing other tools to ignore them
-Fixed wheel pack and wheel tags writing WHEEL with CRLF line endings or a
 mix of CRLF and LF
-Fixed wheel pack --build-number "" not removing build tag from WHEEL

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-wheel_0.41.3.bb => python3-wheel_0.42.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-wheel_0.41.3.bb => python3-wheel_0.42.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-wheel_0.41.3.bb b/meta/recipes-devtools/python/python3-wheel_0.42.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-wheel_0.41.3.bb
rename to meta/recipes-devtools/python/python3-wheel_0.42.0.bb
index bdba98b8d5..807888e6c0 100644
--- a/meta/recipes-devtools/python/python3-wheel_0.41.3.bb
+++ b/meta/recipes-devtools/python/python3-wheel_0.42.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7ffb0db04527cfe380e4f2726bd05ebf"
 
-SRC_URI[sha256sum] = "4d4987ce51a49370ea65c0bfd2234e8ce80a12780820d9dc462597a6e60d0841"
+SRC_URI[sha256sum] = "c45be39f7882c9d34243236f2d63cbd58039e360f85d0913425fbd7ceea617a8"
 
 inherit python_flit_core pypi
 
-- 
2.34.1


