Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9926C4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 07:12:23 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.37022.1698995535210137954
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Nov 2023 00:12:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="126798367"
X-IronPort-AV: E=Sophos;i="6.03,273,1694703600"; 
   d="scan'208";a="126798367"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 16:12:12 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 70A9CD9D8F
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:12:10 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id AF418BF4CE
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:12:09 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2B3352FC7F5C;
	Fri,  3 Nov 2023 16:12:08 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libical: upgrade 3.0.16 -> 3.0.17
Date: Fri,  3 Nov 2023 15:11:13 +0800
Message-Id: <1698995473-30190-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27974.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27974.005
X-TMASE-Result: 10--4.328600-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIOYgThO+DmX+DLvvVL3eB4A34KY0g5BTfp5F0BEaAln1cZNuxCoduSnxf
	dbXcgkQQKZgIdNrUtgHk48PxckV+kHxPMjOKY7A/+HHE8LDNSg8RB0bsfrpPIcSqbxBgG0w6int
	QmXOlWx0QOMrwlT4aJRrdKHoRPG4E13rWzy9AH/QwBKVGT/8G1nt+tev29u1dP2fwfC/am4CU/E
	lmQRoxeYS3LjIYP0i2CvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 07:12:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190112

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libical/{libical_3.0.16.bb => libical_3.0.17.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libical/{libical_3.0.16.bb => libical_3.0.17.bb} (96%)

diff --git a/meta/recipes-support/libical/libical_3.0.16.bb b/meta/recipes-support/libical/libical_3.0.17.bb
similarity index 96%
rename from meta/recipes-support/libical/libical_3.0.16.bb
rename to meta/recipes-support/libical/libical_3.0.17.bb
index 61599b20dd..b91912b048 100644
--- a/meta/recipes-support/libical/libical_3.0.16.bb
+++ b/meta/recipes-support/libical/libical_3.0.17.bb
@@ -15,7 +15,7 @@ SECTION = "libs"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
            file://0001-cmake-Do-not-export-CC-into-gir-compiler.patch \
           "
-SRC_URI[sha256sum] = "b44705dd71ca4538c86fb16248483ab4b48978524fb1da5097bd76aa2e0f0c33"
+SRC_URI[sha256sum] = "bcda9a6db6870240328752854d1ea475af9bbc6356e6771018200e475e5f781b"
 
 inherit cmake pkgconfig gobject-introspection vala github-releases
 
-- 
2.34.1


