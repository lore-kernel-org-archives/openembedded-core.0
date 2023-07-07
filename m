Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18A71C3DA40
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 03:10:27 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.4843.1688699421475706682
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 20:10:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="123740042"
X-IronPort-AV: E=Sophos;i="6.01,187,1684767600"; 
   d="scan'208";a="123740042"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 12:10:19 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 99E64C3F90
	for <openembedded-core@lists.openembedded.org>; Fri,  7 Jul 2023 12:10:16 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id E3227E67B3
	for <openembedded-core@lists.openembedded.org>; Fri,  7 Jul 2023 12:10:15 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id D42F12FC76DA;
	Fri,  7 Jul 2023 12:10:14 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] acpica: upgrade 20230331 -> 20230628
Date: Fri,  7 Jul 2023 11:10:03 +0800
Message-Id: <1688699410-2397-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27736.002
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27736.002
X-TMASE-Result: 10-2.062600-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmKPxx0Rlc7hI10ieHN50/kHuce7gFxhKa0Ea8g1x8eqF2YJBRchJ9pKnpt
	r8PnHpyni8zVgXoAltr8hWd4lAsFlC24oEZ6SpSmcfuxsiY4QFPB7/m07ZIHTKFsAxbVwdMWkX/
	Y7qh87EsO/yZrB1VlaKbleqnvb1pL53+PGGjtukNjqHVQ/osfsbXjPVgE3CyoJWX6AvNTvEex9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jul 2023 03:10:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183987

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../acpica/{acpica_20230331.bb => acpica_20230628.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/acpica/{acpica_20230331.bb => acpica_20230628.bb} (94%)

diff --git a/meta/recipes-extended/acpica/acpica_20230331.bb b/meta/recipes-extended/acpica/acpica_20230628.bb
similarity index 94%
rename from meta/recipes-extended/acpica/acpica_20230331.bb
rename to meta/recipes-extended/acpica/acpica_20230628.bb
index 01b8833f50..06db99cef5 100644
--- a/meta/recipes-extended/acpica/acpica_20230331.bb
+++ b/meta/recipes-extended/acpica/acpica_20230628.bb
@@ -17,7 +17,7 @@ COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 DEPENDS = "m4-native flex-native bison-native"
 
 SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix-${PV}.tar.gz"
-SRC_URI[sha256sum] = "0c5d695d605aaa61709f3c63f57a1a99b8902291723998446b0813b57ac310e2"
+SRC_URI[sha256sum] = "86876a745e3d224dcfd222ed3de465b47559e85811df2db9820ef09a9dff5cce"
 
 UPSTREAM_CHECK_URI = "https://acpica.org/downloads"
 
-- 
2.34.1


