Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C77CEC4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 07:52:33 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.39071.1698997946077797477
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Nov 2023 00:52:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="126164761"
X-IronPort-AV: E=Sophos;i="6.03,273,1694703600"; 
   d="scan'208";a="126164761"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 16:52:23 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id A94C5D4F51
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:52:21 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id E5A2B29F8A
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:52:20 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id C1C722FC82BD;
	Fri,  3 Nov 2023 16:52:19 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-wheel: upgrade 0.41.2 -> 0.41.3
Date: Fri,  3 Nov 2023 15:51:34 +0800
Message-Id: <1698997894-31441-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27974.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27974.005
X-TMASE-Result: 10-1.362400-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrK2GKtdiFmTkf0wrpkdMLWr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74Cu2GmdldmiUGAN6i+va16uBqd
	FRjHdIbixfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSz1ejkF6qgjbaCJU
	XVk8b2fXeZBrwre+fZa/PXPOlZ8eMe94qOsfl8AaSEChdsm3+CskZPrWNm5zHnRvjTsASWYT3T0
	nf3KPwliB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 07:52:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190138

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Updated vendored packaging to 23.2
Fixed ABI tag generation for CPython 3.13a1 on Windows

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-wheel_0.41.2.bb => python3-wheel_0.41.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-wheel_0.41.2.bb => python3-wheel_0.41.3.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-wheel_0.41.2.bb b/meta/recipes-devtools/python/python3-wheel_0.41.3.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-wheel_0.41.2.bb
rename to meta/recipes-devtools/python/python3-wheel_0.41.3.bb
index d11c6a857a..bdba98b8d5 100644
--- a/meta/recipes-devtools/python/python3-wheel_0.41.2.bb
+++ b/meta/recipes-devtools/python/python3-wheel_0.41.3.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7ffb0db04527cfe380e4f2726bd05ebf"
 
-SRC_URI[sha256sum] = "0c5ac5ff2afb79ac23ab82bab027a0be7b5dbcf2e54dc50efe4bf507de1f7985"
+SRC_URI[sha256sum] = "4d4987ce51a49370ea65c0bfd2234e8ce80a12780820d9dc462597a6e60d0841"
 
 inherit python_flit_core pypi
 
-- 
2.34.1


