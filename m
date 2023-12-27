Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C878C46CD4
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 13:10:41 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.100714.1703682630937761591
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Dec 2023 05:10:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="145017809"
X-IronPort-AV: E=Sophos;i="6.04,309,1695654000"; 
   d="scan'208";a="145017809"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2023 22:10:29 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id D89B1D7AC6
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 22:10:26 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id DD858D9471
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 22:10:25 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 69B9C21D6C9
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 22:10:25 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 26DE01A006F;
	Wed, 27 Dec 2023 21:10:25 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-hatchling: upgrade 1.20.0 -> 1.21.0
Date: Wed, 27 Dec 2023 21:10:05 +0800
Message-Id: <1703682605-24200-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28082.007
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28082.007
X-TMASE-Result: 10--1.134600-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mregIHHX2L4YyU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNEhGH3CRdKUU/V5uTWOYebIFum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXKQRvkow7ET2JxIcu2SYyt7rAPkJGiMPCAFVO
	5yphn+m36av4V4IKaTf49w5bsylQSGW3EKu63T6bahN7FulS82ApVeE1GFgK7+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 13:10:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192950

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Add parent context modifier for path fields

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-hatchling_1.20.0.bb => python3-hatchling_1.21.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatchling_1.20.0.bb => python3-hatchling_1.21.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-hatchling_1.20.0.bb b/meta/recipes-devtools/python/python3-hatchling_1.21.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-hatchling_1.20.0.bb
rename to meta/recipes-devtools/python/python3-hatchling_1.21.0.bb
index 6c1db9b801..494e609319 100644
--- a/meta/recipes-devtools/python/python3-hatchling_1.20.0.bb
+++ b/meta/recipes-devtools/python/python3-hatchling_1.21.0.bb
@@ -8,7 +8,7 @@ inherit pypi python_hatchling
 DEPENDS += "python3-pluggy-native python3-pathspec-native python3-packaging-native python3-editables-native python3-trove-classifiers-native"
 DEPENDS:remove:class-native = "python3-hatchling-native"
 
-SRC_URI[sha256sum] = "0e0893cbe3d5f9275fc0e5b629087fc23b17abd7065e4db0a310e0a0237bc945"
+SRC_URI[sha256sum] = "5c086772357a50723b825fd5da5278ac7e3697cdf7797d07541a6c90b6ff754c"
 
 do_compile:prepend() {
     export PYTHONPATH=src
-- 
2.34.1


