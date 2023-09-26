Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B259E7D257
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 08:23:30 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.14309.1695716604383068133
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Sep 2023 01:23:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="135103224"
X-IronPort-AV: E=Sophos;i="6.03,177,1694703600"; 
   d="scan'208";a="135103224"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 17:23:22 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id A5B4FCA1E4
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 17:23:19 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id D0BDAD5E3A
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 17:23:18 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id EEEEF2FC8156;
	Tue, 26 Sep 2023 17:23:17 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] harfbuzz: upgrade 8.2.0 -> 8.2.1
Date: Tue, 26 Sep 2023 16:23:07 +0800
Message-Id: <1695716587-8212-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27898.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27898.006
X-TMASE-Result: 10--1.230600-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJopGZilTi8ctSOwpfLMeBwRsCtGYG0znilNdfE/FsH7rVnpt
	r8PnHpyni8zVgXoAltr8hWd4lAsFlC24oEZ6SpSmcfuxsiY4QFGXR5dUnvfzhDrqgDkXkYYN3X4
	uK7VTW+0lTNDQO1LrVsN1X7zetWMA+EEoIiFNdjKxga6K0ZZhDjU8B4K8XbI+xxrqRWL/TlOx9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 08:23:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188225

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Unicode 15.1 support.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../harfbuzz/{harfbuzz_8.2.0.bb => harfbuzz_8.2.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_8.2.0.bb => harfbuzz_8.2.1.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_8.2.0.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb
index 1e60844204..df41af29f9 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "8cb7117a62f42d5ad25d4a697e1bbfc65933b3eed2ee7f247203c79c9f1b514c"
+SRC_URI[sha256sum] = "0fec78f98c9c8faf228957a201c8846f809452c20f8445eb092a1ba6f22dbea5"
 
 DEPENDS += "glib-2.0-native"
 
-- 
2.34.1


