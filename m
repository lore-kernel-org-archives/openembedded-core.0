Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3986C41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 10:15:28 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.9126.1702980919441925161
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 02:15:19 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="143394172"
X-IronPort-AV: E=Sophos;i="6.04,287,1695654000"; 
   d="scan'208";a="143394172"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 19:15:17 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id C3279D6187
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 19:15:14 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0DEBDD3F29
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 19:15:14 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9C3086BF46
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 19:15:13 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 57C681A0072;
	Tue, 19 Dec 2023 18:15:13 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-trove-classifiers: upgrade 2023.11.22 -> 2023.11.29
Date: Tue, 19 Dec 2023 18:02:28 +0800
Message-Id: <1702980148-8549-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28066.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28066.006
X-TMASE-Result: 10--1.026300-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJorNUVnqixiMOgyKXAUOPYkQQhNjZQYyI3Cl6ppmExqcYlIO
	VA+gJRdKxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzKbJN2vfhjoyM9U
	DjqUwkOBV5AlbArItoHmF7h+zUdrWvJqc+AlmNPM25rHlfxN2hzHTIMxpTVkhVtuDvQ68HOqBYh
	NDijlT3iB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 10:15:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192718

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
License :: OSI Approved :: Zero-Clause BSD (0BSD)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...rs_2023.11.22.bb => python3-trove-classifiers_2023.11.29.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2023.11.22.bb => python3-trove-classifiers_2023.11.29.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2023.11.22.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2023.11.29.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2023.11.22.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2023.11.29.bb
index 44a6f5de03..a06d08455c 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2023.11.22.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2023.11.29.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "c31a7e92f965f060a244b57d8ed5ee6f53fcb413ee17ce790e00577cb369ad99"
+SRC_URI[sha256sum] = "ff8f7fd82c7932113b46e7ef6742c70091cc63640c8c65db00d91f2e940b9514"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.34.1


