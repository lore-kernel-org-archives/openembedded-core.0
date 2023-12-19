Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78142C41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 09:41:58 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.8767.1702978909252011236
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 01:41:49 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="123234193"
X-IronPort-AV: E=Sophos;i="6.04,287,1695654000"; 
   d="scan'208";a="123234193"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 18:41:46 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 53E66D63DD
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:41:44 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 8FF44CF7C4
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:41:43 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 161F06B670
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:41:43 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C471C1A006F;
	Tue, 19 Dec 2023 17:41:42 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-hypothesis: upgrade 6.90.0 -> 6.92.1
Date: Tue, 19 Dec 2023 17:41:31 +0800
Message-Id: <1702978891-8088-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28066.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28066.006
X-TMASE-Result: 10--0.456400-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrZG3SCLP7QtI+++3dUGxY376p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74DCHpeB2Sdtvg9r3iN/4cJv1+0
	KsXaxWz7i8zVgXoAltr8hWd4lAsFlC24oEZ6SpSmcfuxsiY4QFGAIiq1BibCim84NS2FQr/opZN
	OcqJ19bSyh5QGggMBcRcFMwZEhJNqLYXvqG+n2wEb6LY2Lc3qicso1DyvNoOUy6gTEt2tiwOx9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 09:41:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192711

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
https://hypothesis.readthedocs.io/en/latest/changes.html

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-hypothesis_6.90.0.bb => python3-hypothesis_6.92.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.90.0.bb => python3-hypothesis_6.92.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.90.0.bb b/meta/recipes-devtools/python/python3-hypothesis_6.92.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.90.0.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.92.1.bb
index 1760bb37a2..764ca28627 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.90.0.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.92.1.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "0ab33900b9362318bd03d911a77a0dda8629c1877420074d87ae466919f6e4c0"
+SRC_URI[sha256sum] = "fa755ded526e50b7e2f642cdc5d64519f88d4e4ee71d9d29ec3eb2f2fddf1274"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.34.1


