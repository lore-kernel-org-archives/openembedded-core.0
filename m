Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63BD3C07548
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 08:42:08 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.8977.1700037721577618662
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 00:42:01 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="139717717"
X-IronPort-AV: E=Sophos;i="6.03,304,1694703600"; 
   d="scan'208";a="139717717"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 17:41:59 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 75401CC17A
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 17:41:57 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 99F929FF1E
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 17:41:56 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7C20685C9B;
	Wed, 15 Nov 2023 17:41:55 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-trove-classifiers: upgrade 2023.10.18 -> 2023.11.9
Date: Wed, 15 Nov 2023 16:41:12 +0800
Message-Id: <1700037672-1710-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27998.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27998.006
X-TMASE-Result: 10--0.878900-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGOYGRpv0VVRxuce7gFxhKa0BQOqUsWgx5gIZ++dWnH7bnpt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFA3tMtfMpP2YYXwvdNwxLipBh9
	9i3ARTilARIYyYGzGt3rwGWVAKlLtfSXkLpLwk8O3OsnBZRcwh+X12N1JD729g2yQ+bVWBNOx9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 08:42:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190574

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ers_2023.10.18.bb => python3-trove-classifiers_2023.11.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2023.10.18.bb => python3-trove-classifiers_2023.11.9.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2023.10.18.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2023.11.9.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2023.10.18.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2023.11.9.bb
index b0c1b84cc5..5567ed870f 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2023.10.18.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2023.11.9.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "2cdfcc7f31f7ffdd57666a9957296089ac72daad4d11ab5005060e5cd7e29939"
+SRC_URI[sha256sum] = "0542bc03d151f8af84f0eb0e74aa931b374b6f9c8ed8fbf7ee41989fb9d40f1d"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.34.1


