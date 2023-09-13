Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFECBCA5529
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 09:36:33 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.7714.1694597785876028706
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 02:36:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="119997734"
X-IronPort-AV: E=Sophos;i="6.02,142,1688396400"; 
   d="scan'208";a="119997734"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 18:36:22 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id D7E70C68E4
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 18:36:20 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 24C1BD5007
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 18:36:20 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 63CA1200501AE;
	Wed, 13 Sep 2023 18:36:19 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] ccache: upgrade 4.8.2 -> 4.8.3
Date: Wed, 13 Sep 2023 17:35:46 +0800
Message-Id: <1694597746-21636-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27872.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27872.006
X-TMASE-Result: 10-1.869100-10.000000
X-TMASE-MatchedRID: xNkyGzs1zQGjz0nOeth/yXg2y0j5vXZGlEDhvi2wR84H4DTIEE89jLlR
	DJlAaWLLGH/8NwQ5sYNw9xwPDUxrR0WNbZfbxvwGHWRJEfGP5nkYFQt+VRO1dEEd8fQeT+PEvqn
	FtM6Nq/L7tBxFpWhrycYoh/qEF/tVoYY7KoErjW8ReM8i8p3vgGv34qCfZeB4SDFJDHNIsBsdVi
	Prp6qeeTo2a10XPZVUfOhfoy0690QrqSb6h39QPDo39wOA02LhIGvcBvtI0NqBbptjxI6rdaPFj
	JEFr+olX8emX/Nw6OXkwjHXXC/4I8ZW5ai5WKly2z+2j+OCKY7emJCjYass5i4KCHHZOPniDxrE
	ZFPOnunDxmDw5enM3vjvwGuBSDpLsI1a4SF4pi16Nlth0PIHR6ayI3Ekv1al/r/b+dmSKFo6AH9
	/PcRd1xUpPR4VGZ8OzhiFp8LOC6Mh1j2M6LiVMg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 09:36:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187569

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2021

Changelog:
===========
-Fixed various problems with parsing of MSVC response file (.rsp).
-Fixed handling of NVCC -Xcompiler and --Werror options.
-Fixed bookkeeping of files when hard linking or file cloning is enabled.
-Made a workaround for GCC 12.3 bug 109241 where GCC fails to compile ccache.
-Upgraded to xxHash 0.8.2, which fixes compilation of ccache with GCC 12 and -Og.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ccache/{ccache_4.8.2.bb => ccache_4.8.3.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/ccache/{ccache_4.8.2.bb => ccache_4.8.3.bb} (82%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.8.2.bb b/meta/recipes-devtools/ccache/ccache_4.8.3.bb
similarity index 82%
rename from meta/recipes-devtools/ccache/ccache_4.8.2.bb
rename to meta/recipes-devtools/ccache/ccache_4.8.3.bb
index 22a6b385b0..03372aa685 100644
--- a/meta/recipes-devtools/ccache/ccache_4.8.2.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.8.3.bb
@@ -7,14 +7,14 @@ HOMEPAGE = "http://ccache.samba.org"
 SECTION = "devel"
 
 LICENSE = "GPL-3.0-or-later"
-LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=cd54b7abfc462470b0f505273c38f0ff"
+LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=6a6fe0ae4e57592b187ab72fa6d420ec"
 
 DEPENDS = "zstd"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
            file://0001-xxhash.h-Fix-build-with-gcc-12.patch \
            "
-SRC_URI[sha256sum] = "75eef15b8b9da48db9c91e1d0ff58b3645fc70c0e4ca2ef1b6825a12f21f217d"
+SRC_URI[sha256sum] = "d59dd569ad2bbc826c0bc335c8ebd73e78ed0f2f40ba6b30069347e63585d9ef"
 
 inherit cmake github-releases
 
-- 
2.34.1


