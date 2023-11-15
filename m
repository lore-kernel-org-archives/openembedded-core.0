Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78AD7C07548
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 08:37:48 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.8899.1700037460634001823
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 00:37:41 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="119112642"
X-IronPort-AV: E=Sophos;i="6.03,304,1694703600"; 
   d="scan'208";a="119112642"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 17:37:38 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 50DC3D9D94
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 17:37:36 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 78A87D88C3
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 17:37:35 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 77A8D2FC8227;
	Wed, 15 Nov 2023 17:37:34 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-hypothesis: upgrade 6.88.1 -> 6.88.3
Date: Wed, 15 Nov 2023 16:35:58 +0800
Message-Id: <1700037358-1559-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27998.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27998.006
X-TMASE-Result: 10--5.749800-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mryqyllX6UJIvNVAvss75vYV88
	KFWF27c+SAhujIM3hn0Nyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl5GUF3NhJu3i0Dx
	cefaNGgCxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu25FeHtsUoHuZQ5YkzANNTK3hX
	/FmRPf2h1FaZyBFOVj1BMO3gKSUM5LDBwYotNgRw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 08:37:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190571

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-refactors from_type(typing.Tuple), allowing register_type_strategy() to take
 effect for tuples instead of being silently ignored (issue #3750).
-improves the speed of the explain phase on python 3.12+, by using the new
 sys.monitoring module to collect coverage, instead of sys.settrace.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-hypothesis_6.88.1.bb => python3-hypothesis_6.88.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.88.1.bb => python3-hypothesis_6.88.3.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.88.1.bb b/meta/recipes-devtools/python/python3-hypothesis_6.88.3.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.88.1.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.88.3.bb
index e6703f103b..ef1be95d6a 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.88.1.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.88.3.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "f4c2c004b9ec3e0e25332ad2cb6b91eba477a855557a7b5c6e79068809ff8b51"
+SRC_URI[sha256sum] = "5cfda253e34726c98ab04b9595fca15677ee9f4f6055146aea25a6278d71f6f1"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.34.1


