Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 676A0E7D266
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 08:37:50 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.14524.1695717463294935681
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Sep 2023 01:37:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="133664372"
X-IronPort-AV: E=Sophos;i="6.03,177,1694703600"; 
   d="scan'208";a="133664372"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 17:37:41 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4A40ED3EA9
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 17:37:38 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8314BD5E89
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 17:37:37 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id F153B2FC7ABE;
	Tue, 26 Sep 2023 17:37:35 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-zipp: upgrade 3.16.2 -> 3.17.0
Date: Tue, 26 Sep 2023 16:37:02 +0800
Message-Id: <1695717422-13620-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27898.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27898.006
X-TMASE-Result: 10-1.288200-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrA7f8DkoYc/+U8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNnVTWWiNp+v8QhNjZQYyI3Cl6ppmExqcYlIO
	VA+gJRdKxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSz/JmugCPgSmlOfu
	U8btQqB3n0n6Kzhq5RDqUKItF4o7vrJg+YKJFg7eGXZBXkSiA00RiDiSSVoGFb+HsDrVx19qt0i
	oYToLBeiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 08:37:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188239

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Added CompleteDirs.inject classmethod to make available for use elsewhere.
-Avoid matching path separators for '?' in glob.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-zipp_3.16.2.bb => python3-zipp_3.17.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-zipp_3.16.2.bb => python3-zipp_3.17.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-zipp_3.16.2.bb b/meta/recipes-devtools/python/python3-zipp_3.17.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-zipp_3.16.2.bb
rename to meta/recipes-devtools/python/python3-zipp_3.17.0.bb
index 9dff59ffaf..11f3b5cda0 100644
--- a/meta/recipes-devtools/python/python3-zipp_3.16.2.bb
+++ b/meta/recipes-devtools/python/python3-zipp_3.17.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jaraco/zipp"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=141643e11c48898150daa83802dbc65f"
 
-SRC_URI[sha256sum] = "ebc15946aa78bd63458992fc81ec3b6f7b1e92d51c35e6de1c3804e73b799147"
+SRC_URI[sha256sum] = "84e64a1c28cf7e91ed2078bb8cc8c259cb19b76942096c8d7b84947690cabaf0"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-- 
2.34.1


