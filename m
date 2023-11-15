Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50910C07548
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 08:27:18 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.8762.1700036836449886511
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 00:27:16 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="119111551"
X-IronPort-AV: E=Sophos;i="6.03,304,1694703600"; 
   d="scan'208";a="119111551"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 17:27:14 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id D9642D6189
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 17:27:11 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2AA00CF7C5
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 17:27:11 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id E5B9D2FC7253;
	Wed, 15 Nov 2023 17:27:09 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libsolv: upgrade 0.7.25 -> 0.7.26
Date: Wed, 15 Nov 2023 16:26:36 +0800
Message-Id: <1700036796-1292-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27998.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27998.006
X-TMASE-Result: 10-1.143100-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmLHBvqhRdA8shs7n0Ur0F2YOjf3A4DTYuHhKQh1LCmGBlCx3a/pWcPaIy/
	Fg1mRnqLtAdDE/EtBJIAy6p60ZV62To3UJuRLIoTdB/CxWTRRu+rAZ8KTspSzeGc6kdyxaadwKX
	x9+IkEYWypEhV1t/hOT5eDl2g+QUkqhYGUL0IpI7BNmd5sYqJ9lPLxDqkwMNISaFkOPvLLS9Myt
	zuo66PHiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 08:27:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190565

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsolv/{libsolv_0.7.25.bb => libsolv_0.7.26.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libsolv/{libsolv_0.7.25.bb => libsolv_0.7.26.bb} (95%)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.25.bb b/meta/recipes-extended/libsolv/libsolv_0.7.26.bb
similarity index 95%
rename from meta/recipes-extended/libsolv/libsolv_0.7.25.bb
rename to meta/recipes-extended/libsolv/libsolv_0.7.26.bb
index 69cb3f7996..bae7960138 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.25.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.26.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https \
            file://0001-utils-Conside-musl-when-wrapping-qsort_r.patch \
 "
 
-SRCREV = "f1be8bf3dcc7dc14d331adbc97f337fa08e641c9"
+SRCREV = "48c985375134d2443eee551613161cadc278af2f"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.34.1


