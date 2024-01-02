Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11F00C47073
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 07:28:06 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.24559.1704180478318040681
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 23:27:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="133070605"
X-IronPort-AV: E=Sophos;i="6.04,324,1695654000"; 
   d="scan'208";a="133070605"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2024 16:27:55 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id B5E3FD9D8F
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Jan 2024 16:27:53 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id A11F1106333
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Jan 2024 16:27:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 37A1D20093271
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Jan 2024 16:27:52 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BE84E1A0070;
	Tue,  2 Jan 2024 15:27:51 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-hypothesis: upgrade 6.92.1 -> 6.92.2
Date: Tue,  2 Jan 2024 15:26:37 +0800
Message-Id: <1704180397-8684-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28094.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28094.005
X-TMASE-Result: 10--4.972800-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrxZpjHSMI6w7x/es4TBfOp9nq
	JQncEKKr4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2RHWEfZh7epYlIO
	VA+gJRdKxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzRpGKWWzMCKG+4Z
	YlM84b+J28w0monqb/TKvrX7n7hok79o8GbDE1OP/FvucCB+pjAWMpcKxK29DRWWHwwDLbK/Dz9
	PEYoHHniB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 07:28:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193214

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
updates vendored list of top-level domains, which is used by the provisional domains() strategy.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-hypothesis_6.92.1.bb => python3-hypothesis_6.92.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.92.1.bb => python3-hypothesis_6.92.2.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.92.1.bb b/meta/recipes-devtools/python/python3-hypothesis_6.92.2.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.92.1.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.92.2.bb
index 764ca28627..ab5dd3223d 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.92.1.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.92.2.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "fa755ded526e50b7e2f642cdc5d64519f88d4e4ee71d9d29ec3eb2f2fddf1274"
+SRC_URI[sha256sum] = "841f89a486c43bdab55698de8929bd2635639ec20bf6ce98ccd75622d7ee6d41"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.34.1


