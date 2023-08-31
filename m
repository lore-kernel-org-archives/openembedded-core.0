Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11761C83F27
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 02:53:53 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.8768.1693450425666527959
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 19:53:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="117833598"
X-IronPort-AV: E=Sophos;i="6.02,215,1688396400"; 
   d="scan'208";a="117833598"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 11:53:42 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 445A1DB4C2
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:53:40 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 88A48D3F2F
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:53:39 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 721522FC2743;
	Thu, 31 Aug 2023 11:53:38 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] shaderc: upgrade 2023.5 -> 2023.6
Date: Thu, 31 Aug 2023 10:52:57 +0800
Message-Id: <1693450377-28569-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27846.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27846.004
X-TMASE-Result: 10-1.063300-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrWtqCCOR3BfCU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNnVTWWiNp+v84ptE5KnVLXumHqf6ZGvCR1vZ
	7s3YIVDI3lq3YEgY6Jjrmb2Z4b9ZLk+ELgR0ZH/Y6N/cDgNNi4U3yuY9BGW8rvF63U/jjtZDX7Q
	qxdrFbPuLzNWBegCW24nmFeyfGnuMLbigRnpKlKZx+7GyJjhAUjAUks1UwPWFTuCwsVV1fZeAhD
	jwS2vIykUmrJ1MaDcy6XoRsn7Z/1JgDenOA7eYro91YxHf9y/Ka8Z8Oi7E/vPJfLxRMbVw27H2f
	VekOqwmYL1KImKhq1ZuOe7yPCBvAf2OJxbAVgHQ+kK598Yf3Mg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 02:53:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186956

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
- Update dependencies, including SPIRV-Tools v2023.4.rc2

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../shaderc/{shaderc_2023.5.bb => shaderc_2023.6.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/shaderc/{shaderc_2023.5.bb => shaderc_2023.6.bb} (95%)

diff --git a/meta/recipes-graphics/shaderc/shaderc_2023.5.bb b/meta/recipes-graphics/shaderc/shaderc_2023.6.bb
similarity index 95%
rename from meta/recipes-graphics/shaderc/shaderc_2023.5.bb
rename to meta/recipes-graphics/shaderc/shaderc_2023.6.bb
index 8d2f4551ab..5afdec5ce9 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2023.5.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2023.6.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/google/shaderc"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "7428c8d5f6b200910fbd32fa0ca0b0244ace6482"
+SRCREV = "9547789ecfa1be140327057e766ba80666b66e21"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main \
            file://0001-cmake-disable-building-external-dependencies.patch \
            file://0002-libshaderc_util-fix-glslang-header-file-location.patch \
-- 
2.34.1


