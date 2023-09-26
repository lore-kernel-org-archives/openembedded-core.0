Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AC08E7D266
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 08:37:00 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.14311.1695717417523373657
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Sep 2023 01:36:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="133659103"
X-IronPort-AV: E=Sophos;i="6.03,177,1694703600"; 
   d="scan'208";a="133659103"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 17:36:55 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id D4EDFC68E1
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 17:36:52 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1FD16CFB9A
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 17:36:52 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 675BC6B4C4;
	Tue, 26 Sep 2023 17:36:51 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-urllib3: upgrade 2.0.4 -> 2.0.5
Date: Tue, 26 Sep 2023 16:36:23 +0800
Message-Id: <1695717383-13331-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27898.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27898.006
X-TMASE-Result: 10-1.306400-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrYjDXdM/x2VMtorPLNYrwZHeA
	HGnweZviNov+2HfRFRQNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0JwcxlwV9fM+V9jt75wM
	PMqdPNSyBkESMI05d4iiOf1NDnCI+rWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNUCb06LTIZZdB1I+jYKuxf2N3yJ0tKG+3KJHt09iCSOlUgSKz47yKTsIJ5K54nQW1VlZZ
	KM+7Dm/DDMyFQj6NDP2/e5oIGGwKIJXtKB2OUbbU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 08:37:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188238

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Allowed pyOpenSSL third-party module without any deprecation warning.
-Fixed default blocksize of HTTPConnection classes to match high-level
 classes. Previously was 8KiB, now 16KiB.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-urllib3_2.0.4.bb => python3-urllib3_2.0.5.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-urllib3_2.0.4.bb => python3-urllib3_2.0.5.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-urllib3_2.0.4.bb b/meta/recipes-devtools/python/python3-urllib3_2.0.5.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-urllib3_2.0.4.bb
rename to meta/recipes-devtools/python/python3-urllib3_2.0.5.bb
index 0abd2adf65..9c15791d34 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.0.4.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.0.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=52d273a3054ced561275d4d15260ecda"
 
-SRC_URI[sha256sum] = "8d22f86aae8ef5e410d4f539fde9ce6b2113a001bb4d189e0aed70642d602b11"
+SRC_URI[sha256sum] = "13abf37382ea2ce6fb744d4dad67838eec857c9f4f57009891805e0b5e123594"
 
 inherit pypi python_hatchling
 
-- 
2.34.1


