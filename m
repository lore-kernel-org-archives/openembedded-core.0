Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EEF8EB64D9
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 07:19:25 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.7535.1687850363892851065
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 00:19:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="122377520"
X-IronPort-AV: E=Sophos;i="6.01,161,1684767600"; 
   d="scan'208";a="122377520"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 16:19:22 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 907C6D3EB2
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 16:19:19 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id C43B9D5EAB
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 16:19:18 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 331D46C833;
	Tue, 27 Jun 2023 16:19:18 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] freetype: upgrade 2.13.0 -> 2.13.1
Date: Tue, 27 Jun 2023 15:16:58 +0800
Message-Id: <1687850250-20040-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27716.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27716.005
X-TMASE-Result: 10--1.288600-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrC//1TMV5chPozDhGeQC9EjNW
	Kvzwh564z5FUBH2oRSGKhQZzlVuPaxCefipHQGrub/oIJuUAIuFUENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzvxr4VwoL73EneBzEkCCpnRlIcJTn2HkqsbFk511UyURnAhn751acftuem2
	vw+cenKeLzNWBegCW29sZ0UX0EaOILbigRnpKlKZx+7GyJjhAUUpLzqYbnjaYjB6TeObejlXQB2
	TOw3pgzF5RB7/5WEQOYPHngs2xbpiK+XT43eJnrolyMdgqLQkSU2Bosh1FGw+UVTgP69YoY7H2f
	VekOqwmYL1KImKhq1ZuOe7yPCBvAf2OJxbAVgHQ+kK598Yf3Mg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 07:19:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183442

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* docs/VERSION.TXT: Add entry for version 2.13.1.
* docs/CHANGES: Updated.
* docs/release, docs/README, builds/macs/README: Updated.
* README, src/base/ftver.rc, builds/windows/vc2010/index.html,
builds/windows/visualc/index.html, builds/windows/visualce/index.html,
builds/wince/vc2005-ce/index.html, builds/wince/vc2008-ce/index.html,
docs/freetype-config.1: s/2.13.0/2.13/1/, s/2130/2131/.
* include/freetype/freetype.h (FREETYPE_PATCH): Set to 1.
* builds/unix/configure.raw (version_info): Set to 26:0:20.
* CMakeLists.txt (VERSION_PATCH): Set to 1.
* subprojects/libpng.wrap, subprojects/zlib.wrap, subprojects/dlg: Updated.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../freetype/{freetype_2.13.0.bb => freetype_2.13.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/freetype/{freetype_2.13.0.bb => freetype_2.13.1.bb} (95%)

diff --git a/meta/recipes-graphics/freetype/freetype_2.13.0.bb b/meta/recipes-graphics/freetype/freetype_2.13.1.bb
similarity index 95%
rename from meta/recipes-graphics/freetype/freetype_2.13.0.bb
rename to meta/recipes-graphics/freetype/freetype_2.13.1.bb
index 514672c0ee..5b1c520944 100644
--- a/meta/recipes-graphics/freetype/freetype_2.13.0.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.13.1.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=843b6efc16f6b1652ec97f89d5a516c0 \
                     "
 
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "5ee23abd047636c24b2d43c6625dcafc66661d1aca64dec9e0d05df29592624c"
+SRC_URI[sha256sum] = "ea67e3b019b1104d1667aa274f5dc307d8cbd606b399bc32df308a77f1a564bf"
 
 UPSTREAM_CHECK_REGEX = "freetype-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.34.1


