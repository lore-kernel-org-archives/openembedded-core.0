Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B73A5EB64DC
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 09:10:45 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.4247.1689585039935889573
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jul 2023 02:10:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="124762999"
X-IronPort-AV: E=Sophos;i="6.01,211,1684767600"; 
   d="scan'208";a="124762999"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 18:10:38 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 49E3ECA1E6
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 18:10:35 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 72AF1D5FF4
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 18:10:34 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 98AD12FC8579;
	Mon, 17 Jul 2023 18:10:33 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] harfbuzz: upgrade 7.3.0 -> 8.0.1
Date: Mon, 17 Jul 2023 17:10:07 +0800
Message-Id: <1689585025-23731-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27756.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27756.006
X-TMASE-Result: 10--5.518600-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrTfK5j0EZbytYC5LPd7BvbTnd
	lzPLlFQ79mkXx1BuUH8Nyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG21vZ
	7s3YIVDI6NmtdFz2VVHzoX6MtOvdErWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNbkHm4uaNBC16z16WywbUJ4fCBaLR6yf1ajUW/+c6X5nywtNwpzD17s=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 09:10:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184437

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Build fix on 32-bit arm.
- More speed optimizations.
- New, experimental, WebAssembly (WASM) shaper
- Improvements to
  Experimental features introduced in earlier releases.
- New macro HB_ALWAYS_INLINE.
- New API.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../harfbuzz/{harfbuzz_7.3.0.bb => harfbuzz_8.0.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_7.3.0.bb => harfbuzz_8.0.1.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_8.0.1.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_8.0.1.bb
index 7ecbb04a6a..359272e934 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_8.0.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "20770789749ac9ba846df33983dbda22db836c70d9f5d050cb9aa5347094a8fb"
+SRC_URI[sha256sum] = "c1ce780acd385569f25b9a29603d1d5bc71e6940e55bfdd4f7266fad50e42620"
 
 DEPENDS += "glib-2.0-native"
 
-- 
2.34.1


