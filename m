Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEC93C4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 07:33:13 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.37688.1698996788828641139
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Nov 2023 00:33:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="138277914"
X-IronPort-AV: E=Sophos;i="6.03,273,1694703600"; 
   d="scan'208";a="138277914"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 16:33:07 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 91D54D6187
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:33:04 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id D5DBDD67AA
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:33:03 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2106320050190;
	Fri,  3 Nov 2023 16:33:03 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-hypothesis: upgrade 6.87.4 -> 6.88.1
Date: Fri,  3 Nov 2023 15:32:27 +0800
Message-Id: <1698996747-30853-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27974.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27974.005
X-TMASE-Result: 10--3.562100-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrJ4cwIYL6KufHkH7uosEn7J1C
	zYDeNo+T3c7SY8eZSi4Nyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl5GUF3NhJu3i0Dx
	cefaNGgCxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzZj3d3GMA+of9Es
	EIjiQtRp2EviANi5q3X9ZwEe/eNuhIH16phiXycgw5pA05jFXj+idDtvvxQ6M4sbOVu3CdjOJ06
	6rFnVKpiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 07:33:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190127

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
*improves register_type_strategy() when used with tuple subclasses, by
 preventing them from being interpreted as generic and provided to
 strategies like st.from_type(Sequence[int]) (issue #3767).
*allows strategy-generating functions registered with
 register_type_strategy() to conditionally not return a strategy,
 by returning NotImplemented (issue #3767).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-hypothesis_6.87.4.bb => python3-hypothesis_6.88.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.87.4.bb => python3-hypothesis_6.88.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.87.4.bb b/meta/recipes-devtools/python/python3-hypothesis_6.88.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.87.4.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.88.1.bb
index 4f41e2ab1a..e6703f103b 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.87.4.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.88.1.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "c508779be66e266c45dbf9c1b2713e560dfd89abb044d92eafe91e8b2728af01"
+SRC_URI[sha256sum] = "f4c2c004b9ec3e0e25332ad2cb6b91eba477a855557a7b5c6e79068809ff8b51"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.34.1


