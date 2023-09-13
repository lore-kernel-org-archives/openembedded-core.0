Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C85C2CA5521
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 09:31:43 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.7637.1694597501565828609
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 02:31:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="119745832"
X-IronPort-AV: E=Sophos;i="6.02,142,1688396400"; 
   d="scan'208";a="119745832"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 18:31:38 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id C2987C68E2
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 18:31:36 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 18E7FD39CF
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 18:31:36 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4DF7F870F3;
	Wed, 13 Sep 2023 18:31:35 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] harfbuzz: upgrade 8.1.1 -> 8.2.0
Date: Wed, 13 Sep 2023 17:31:10 +0800
Message-Id: <1694597470-21394-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27872.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27872.006
X-TMASE-Result: 10-0.170900-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrG24YVeuZGmNOaDdl7pggvcul
	iDSdYQvb4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2WAN6i+va16uBoa
	RMwn0B/c/jpOn/YFJRS5rYfHE0OO95UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO0Nst
	CXmf87HFA7MEaXoysatHOe4EPGn2qoVBYJKtelhvzUeh0TiMV/cUQty+pSeYLuFT2Iiauu4Zd46
	wNMOM4trsGA4LOkzAZ/vwVeOTRRxfIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 09:31:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187563

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Various build and fuzzing fixes
- Improvements to COLRv1 painting.

- New API:
+hb_paint_color_glyph_func_t
+hb_paint_funcs_set_color_glyph_func
+hb_paint_color_glyph

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../harfbuzz/{harfbuzz_8.1.1.bb => harfbuzz_8.2.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_8.1.1.bb => harfbuzz_8.2.0.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_8.1.1.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.0.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_8.1.1.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_8.2.0.bb
index 9422db2005..1e60844204 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_8.1.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "0305ad702e11906a5fc0c1ba11c270b7f64a8f5390d676aacfd71db129d6565f"
+SRC_URI[sha256sum] = "8cb7117a62f42d5ad25d4a697e1bbfc65933b3eed2ee7f247203c79c9f1b514c"
 
 DEPENDS += "glib-2.0-native"
 
-- 
2.34.1


