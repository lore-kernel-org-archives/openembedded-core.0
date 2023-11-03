Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9A7DC4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 07:53:33 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.39850.1698998005613944241
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Nov 2023 00:53:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="139976062"
X-IronPort-AV: E=Sophos;i="6.03,273,1694703600"; 
   d="scan'208";a="139976062"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 16:53:23 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id DE684D69D5
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:53:20 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 30638D67AA
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:53:20 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5D62B20050190;
	Fri,  3 Nov 2023 16:53:19 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] shaderc: upgrade 2023.6 -> 2023.7
Date: Fri,  3 Nov 2023 15:52:26 +0800
Message-Id: <1698997946-31479-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27974.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27974.005
X-TMASE-Result: 10--1.664700-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yUIIxwDaU5mrWtqCCOR3BfDfUY2boz4kpHMW
	fmr8UEU8+HFUiys+kAANyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0JwcxlwV9fM+V9jt7hEz
	I3+mkzifQNSIDx0xToZg+xMERr0NZeBzEkCCpnRloMLOoNHsM9vWr7HvOSElaSMg2Oe/b8Ey7FY
	/sCUPw09hnEsRN7QJ3KI5/U0OcIj6tYv/FAmebjp4CIKY/Hg3AaZGo0EeYG95UMLUJu4leYyq2r
	l3dzGQ16kDg2UIcpVjSSvNvI1wXAxHUwY/tjkGl+DClCpgbsrt9hGyp8MLg+CBjFmL36OaDJ1Q0
	NfgQdzGzc96quCH+EC8nrFaPkWj3mW1z9vWl8eZTyZ1y9sjWHZLqPOO5dObQxMzMgJrM/hR6Fi1
	pV3LGbw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 07:53:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190139

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
 - Update dependencies
 - Finish converting build instructions and flags to always use C++17
 - Add GitHub CI to test more flows

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../shaderc/{shaderc_2023.6.bb => shaderc_2023.7.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/shaderc/{shaderc_2023.6.bb => shaderc_2023.7.bb} (95%)

diff --git a/meta/recipes-graphics/shaderc/shaderc_2023.6.bb b/meta/recipes-graphics/shaderc/shaderc_2023.7.bb
similarity index 95%
rename from meta/recipes-graphics/shaderc/shaderc_2023.6.bb
rename to meta/recipes-graphics/shaderc/shaderc_2023.7.bb
index 5afdec5ce9..e4555af6d5 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2023.6.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2023.7.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/google/shaderc"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "9547789ecfa1be140327057e766ba80666b66e21"
+SRCREV = "23cc2d78fd4f866b6ab527886a396bec36948605"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main \
            file://0001-cmake-disable-building-external-dependencies.patch \
            file://0002-libshaderc_util-fix-glslang-header-file-location.patch \
-- 
2.34.1


