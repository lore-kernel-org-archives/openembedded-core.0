Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4719CA552C
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 09:40:33 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.7779.1694598024030647437
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 02:40:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="120253038"
X-IronPort-AV: E=Sophos;i="6.02,142,1688396400"; 
   d="scan'208";a="120253038"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 18:40:18 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id BF03ACD7E8
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 18:40:16 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id B5802D620E
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 18:40:15 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7F04EE4A90;
	Wed, 13 Sep 2023 18:40:14 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-hypothesis: upgrade 6.84.0 -> 6.84.3
Date: Wed, 13 Sep 2023 17:39:52 +0800
Message-Id: <1694597992-21804-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27872.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27872.006
X-TMASE-Result: 10--3.860000-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mr1QQ6Jx/ffla+ZCINP4FpYJ/b
	umQx78u3lxPsRwiY5LzptC3CI0xHcbCwmcfXoaeCGoiRlSCh4/WOQOsE4nDCdJ20WOXA/NsCuI8
	WAK0NiDvgK2NiZClvaQXURz+hQhGVWkIi5GvRHEpO5y1KmK5bJTZlY6a4lRLZEdYR9mHt6liem2
	vw+cenKeLzNWBegCW2wgn7iDBesS0nRE+fI6etkjqwcHkKzE2zb3O6bRVQSd2vnHmVCNS031tYT
	a4SiOsR4Yh0BW4D2L6RXSZhmXkkbvVVfoHkcU/D1ZXVCRUzUxR3OnoQee/REku/kTKv9giuqwOH
	O1Fdn0Kb4tj0DvxRUIs9ro6z1cfchCFNTbTJJtE=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 09:40:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187573

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-This patch automatically disables the differing_executors health check for
 methods which are also pytest parametrized tests, because those were mostly
 false alarms (issue #3733).
-Building on recent releases, characters() now accepts _any_ codec=, not just
 "utf-8" and "ascii".
-This includes standard codecs from the codecs module and their aliases,
 platform specific and user-registered codecs if they are available, and
 python-specific text encodings (but not text transforms or binary transforms).
-This patch by Reagan Lee makes st.text(...).filter(str.isidentifier) return
 an efficient custom strategy (issue #3480).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-hypothesis_6.84.0.bb => python3-hypothesis_6.84.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.84.0.bb => python3-hypothesis_6.84.3.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.84.0.bb b/meta/recipes-devtools/python/python3-hypothesis_6.84.3.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.84.0.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.84.3.bb
index 8e3f6c0bf4..21b0f65a8e 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.84.0.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.84.3.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "446ecc9665a23fc67a6d32bafbe4233d77fef10eb90d4ede8ab1e76474a63215"
+SRC_URI[sha256sum] = "b4117f4138e81986cf62ad4e1410a021adeaa52e4b0326419da626cd7d3b6250"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.34.1


