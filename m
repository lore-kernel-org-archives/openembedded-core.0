Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 971D8C61D9C
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 09:07:56 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.15355.1700644067045450235
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 01:07:47 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="140574769"
X-IronPort-AV: E=Sophos;i="6.04,218,1695654000"; 
   d="scan'208";a="140574769"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 18:07:44 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id C70F3D66DD
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 18:07:42 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 10FDFE6478
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 18:07:42 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 059CA8717C;
	Wed, 22 Nov 2023 18:07:40 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-scons: upgrade 4.5.2 -> 4.6.0
Date: Wed, 22 Nov 2023 17:07:07 +0800
Message-Id: <1700644027-9873-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28012.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28012.006
X-TMASE-Result: 10-0.266800-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mr9pLnYtQ99xJoOe42HKVRDr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3FCedixYXzOrlmG
	OZvTvMReD/SpuYoqPDS5rYfHE0OO95UcZtwNsCroURSScn+QSXpjDMT0TyDk5+gtHj7OwNO28bR
	Ued1HGAsJi10hJ43xHvjQzpLWwQh4qMFq74bw2p68cJAMSlYrsivwTsUHhAPqJ6BCaI2e7Kl2ro
	31NTVPvECDB5u+Pt3TZdTCUzonWQfIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 09:07:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191040

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://github.com/SCons/scons/releases/tag/4.6.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-scons_4.5.2.bb => python3-scons_4.6.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-scons_4.5.2.bb => python3-scons_4.6.0.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-scons_4.5.2.bb b/meta/recipes-devtools/python/python3-scons_4.6.0.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-scons_4.5.2.bb
rename to meta/recipes-devtools/python/python3-scons_4.6.0.bb
index e0173a309e..c3cc3f0373 100644
--- a/meta/recipes-devtools/python/python3-scons_4.5.2.bb
+++ b/meta/recipes-devtools/python/python3-scons_4.6.0.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d903b0b8027f461402bac9b5169b36f7"
 
 SRC_URI += " file://0001-Fix-man-page-installation.patch"
-SRC_URI[sha256sum] = "813360b2bce476bc9cc12a0f3a22d46ce520796b352557202cb07d3e402f5458"
+SRC_URI[sha256sum] = "7db28958b188b800f803c287d0680cc3ac7c422ed0b1cf9895042c52567803ec"
 
 PYPI_PACKAGE = "SCons"
 
-- 
2.34.1


