Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95FC6C61DA7
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 09:06:36 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.15256.1700643993759764404
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 01:06:34 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="128560415"
X-IronPort-AV: E=Sophos;i="6.04,218,1695654000"; 
   d="scan'208";a="128560415"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 18:06:31 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 68619C148F
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 18:06:29 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 96D66D8AC8
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 18:06:28 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 8349D2FC8519;
	Wed, 22 Nov 2023 18:06:27 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-hypothesis: upgrade 6.89.0 -> 6.90.0
Date: Wed, 22 Nov 2023 17:05:47 +0800
Message-Id: <1700643947-9780-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28012.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28012.006
X-TMASE-Result: 10--5.392800-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrARyXsbS4pUajEIt+uIPPOD4t
	lu4+KTBz8QW+WBxJLQUF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2RHWEfZh7epYnpt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSkj80Za3RRg8J3WvwiZ5pPL/rFjqnXpfNMLLp
	VwuQ1G7/0MyoeAwys23Lz21U6sOKU=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 09:06:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191038

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-makes it an error to assign settings = settings(...) as a class attribute on a
 RuleBasedStateMachine.
-refactors some internals. 

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-hypothesis_6.89.0.bb => python3-hypothesis_6.90.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.89.0.bb => python3-hypothesis_6.90.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.89.0.bb b/meta/recipes-devtools/python/python3-hypothesis_6.90.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.89.0.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.90.0.bb
index 035809c394..1760bb37a2 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.89.0.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.90.0.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "9168bb12cd29001067e66b5f25f1bbdeff08b80c29c3909e19fc8205d8b9aeed"
+SRC_URI[sha256sum] = "0ab33900b9362318bd03d911a77a0dda8629c1877420074d87ae466919f6e4c0"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.34.1


