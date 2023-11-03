Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9E87C4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 07:40:13 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.38791.1698997204945018910
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Nov 2023 00:40:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="138607381"
X-IronPort-AV: E=Sophos;i="6.03,273,1694703600"; 
   d="scan'208";a="138607381"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 16:40:03 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 99F1FD687F
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:40:00 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id CE5C8DA251
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:39:59 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id B17312FC71A0;
	Fri,  3 Nov 2023 16:39:58 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pycairo: upgrade 1.25.0 -> 1.25.1
Date: Fri,  3 Nov 2023 15:39:19 +0800
Message-Id: <1698997159-31007-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27974.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27974.005
X-TMASE-Result: 10--3.336500-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrTfK5j0EZbyveyEk8VTRANb6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74ACtGYG0znilMZICH6pwLFJiMD
	6wB/IizIKZgIdNrUtgHk48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w5Afe
	sUogd2ftMOByXcol42iy/+65co2H+eSWyKE76JVhi97KEDkTmMau0meYdv88zQ9NO7yam2maRFK
	nHBY5FTBM+dhB03QtSCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 07:40:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190130

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* Fix a crash with pypy3.10
* Fix the build with CPython 3.13.0a1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pycairo_1.25.0.bb => python3-pycairo_1.25.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pycairo_1.25.0.bb => python3-pycairo_1.25.1.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-pycairo_1.25.0.bb b/meta/recipes-devtools/python/python3-pycairo_1.25.1.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-pycairo_1.25.0.bb
rename to meta/recipes-devtools/python/python3-pycairo_1.25.1.bb
index a9e89b0f7a..1599f6d39e 100644
--- a/meta/recipes-devtools/python/python3-pycairo_1.25.0.bb
+++ b/meta/recipes-devtools/python/python3-pycairo_1.25.1.bb
@@ -13,7 +13,7 @@ DEPENDS = "cairo python3"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/pycairo-${PV}.tar.gz"
 GITHUB_BASE_URI = "https://github.com/pygobject/pycairo/releases/"
 
-SRC_URI[sha256sum] = "37842b9bfa6339c45a5025f752e1d78d5840b1a0f82303bdd5610846ad8b5c4f"
+SRC_URI[sha256sum] = "7e2be4fbc3b4536f16db7a11982cbf713e75069a4d73d44fe5a49b68423f5c0c"
 
 S = "${WORKDIR}/pycairo-${PV}"
 
-- 
2.34.1


