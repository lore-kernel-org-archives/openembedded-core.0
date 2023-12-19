Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8C54C41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 09:55:18 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.8899.1702979717236677270
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 01:55:17 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="143915985"
X-IronPort-AV: E=Sophos;i="6.04,287,1695654000"; 
   d="scan'208";a="143915985"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 18:55:15 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 09ED8D9DA9
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:55:13 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 49990F991
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:55:12 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id C9A5D6B670
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:55:11 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8524A1A006F;
	Tue, 19 Dec 2023 17:55:11 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-license-expression: upgrade 30.1.1 -> 30.2.0
Date: Tue, 19 Dec 2023 17:42:41 +0800
Message-Id: <1702978961-8161-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28066.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28066.006
X-TMASE-Result: 10--2.359200-10.000000
X-TMASE-MatchedRID: UL9qRiLRGjIFWIzFaWZsv31zro62qhdCpxAd6mi1Ga3uebKrFNJkRb6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtIOmHqf6ZGvCR1vZ
	7s3YIVDJ6eUBjjG/BIC5rYfHE0OO95UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO2W79
	Uq8KMo9RcLj8aX+oS98meApRptmsAyFFTV76kvX4gi/QZ839jLdPn3gm/To3ZfQIfTii3jYisg2
	FKwWeFv4Zq/jABQMZwOJix1o2niPvIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 09:55:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192713

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Use latest skeleton
-Update license list to latest ScanCode and SPDX 3.22
-Add Python 3.12 support in CI

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...xpression_30.1.1.bb => python3-license-expression_30.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-license-expression_30.1.1.bb => python3-license-expression_30.2.0.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb b/meta/recipes-devtools/python/python3-license-expression_30.2.0.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-license-expression_30.1.1.bb
rename to meta/recipes-devtools/python/python3-license-expression_30.2.0.bb
index 31fb88d6e5..dd55aeac39 100644
--- a/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb
+++ b/meta/recipes-devtools/python/python3-license-expression_30.2.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/nexB/license-expression"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://apache-2.0.LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "42375df653ad85e6f5b4b0385138b2dbea1f5d66360783d8625c3e4f97f11f0c"
+SRC_URI[sha256sum] = "599928edd995c43fc335e0af342076144dc71cb858afa1ed9c1c30c4e81794f5"
 
 inherit pypi ptest python_setuptools_build_meta
 
-- 
2.34.1


