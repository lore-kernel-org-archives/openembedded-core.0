Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2D5BC4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 07:10:33 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.36285.1698995431010437341
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Nov 2023 00:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="138277065"
X-IronPort-AV: E=Sophos;i="6.03,273,1694703600"; 
   d="scan'208";a="138277065"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 16:10:28 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id EB59DD6187
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:10:25 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 292DFDA251
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:10:25 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0C7642FC71A0;
	Fri,  3 Nov 2023 16:10:23 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] harfbuzz: upgrade 8.2.1 -> 8.2.2
Date: Fri,  3 Nov 2023 15:09:15 +0800
Message-Id: <1698995355-30115-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27974.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27974.005
X-TMASE-Result: 10-2.695800-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbysNPh1d8yNzuji8
	yF7SdZet/DW1GvHktOgkqlrTyg1GfLBAQLqGlKivP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW5tMXimGWsZZAYUFsN5WfiFjbcgpFl911oDfgpjSDkFN1XgGeVUh3WdmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZIvkmyoG4exFIKF0KYBc0aQvrKwC3KndAH1gO7ao1HJpcoUY
	2Imoe60wVd9+FrjSIRkY5sZXlBoEMuLoTSHS3YzSvR5AH5JlJxLv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 07:10:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190110

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix regression from 8.1.0 in shaping fonts with duplicate feature tags.
- Fix regression from 8.2.0 in parsing CSS-style feature strings.
- Variable fonts instanciation now handles more tables.
- Various CMake build improvements.
- various fixes to build without errors with gcc 4.9.2.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../harfbuzz/{harfbuzz_8.2.1.bb => harfbuzz_8.2.2.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_8.2.1.bb => harfbuzz_8.2.2.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.2.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_8.2.2.bb
index df41af29f9..ce1a6bed65 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.2.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "0fec78f98c9c8faf228957a201c8846f809452c20f8445eb092a1ba6f22dbea5"
+SRC_URI[sha256sum] = "e433ad85fbdf57f680be29479b3f964577379aaf319f557eb76569f0ecbc90f3"
 
 DEPENDS += "glib-2.0-native"
 
-- 
2.34.1


