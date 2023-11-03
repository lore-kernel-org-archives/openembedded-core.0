Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCD60C4167D
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 07:50:53 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.39536.1698997850727597865
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Nov 2023 00:50:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="138607844"
X-IronPort-AV: E=Sophos;i="6.03,273,1694703600"; 
   d="scan'208";a="138607844"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 16:50:48 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3335DD3EA9
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:50:46 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6F002DA251
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:50:45 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 47CA9880A3;
	Fri,  3 Nov 2023 16:50:44 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-trove-classifiers: upgrade 2023.9.19 -> 2023.10.18
Date: Fri,  3 Nov 2023 15:49:50 +0800
Message-Id: <1698997790-31348-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27974.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27974.005
X-TMASE-Result: 10--1.026300-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJorNUVnqixiMOgyKXAUOPYkQQhNjZQYyI3Cl6ppmExqcYlIO
	VA+gJRdKxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzS9RwtDmGVpSZ5V
	i+UUizyfPF1K90mJIbmM635VwGcRXdFowNdhhMrdpamrNLw7tVfplRlgz9+jWyaVCm5xkkny1ba
	F3BS1uKiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 07:50:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190136

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 dd Framework :: Mkdocs classifier (#154)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ers_2023.9.19.bb => python3-trove-classifiers_2023.10.18.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2023.9.19.bb => python3-trove-classifiers_2023.10.18.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2023.9.19.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2023.10.18.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2023.9.19.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2023.10.18.bb
index aa062f659b..b0c1b84cc5 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2023.9.19.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2023.10.18.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "3e700af445c802f251ce2b741ee78d2e5dfa5ab8115b933b89ca631b414691c9"
+SRC_URI[sha256sum] = "2cdfcc7f31f7ffdd57666a9957296089ac72daad4d11ab5005060e5cd7e29939"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.34.1


