Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2DB6C46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 07:21:15 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.24512.1704180068849545526
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 23:21:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="145316898"
X-IronPort-AV: E=Sophos;i="6.04,324,1695654000"; 
   d="scan'208";a="145316898"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2024 16:21:06 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id E6FCFD7AE3
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Jan 2024 16:21:03 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 190E2106191
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Jan 2024 16:21:03 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 981582008E696
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Jan 2024 16:21:02 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 42AE51A0070;
	Tue,  2 Jan 2024 15:21:02 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] ccache: upgrade 4.8.3 -> 4.9
Date: Tue,  2 Jan 2024 15:20:49 +0800
Message-Id: <1704180049-8477-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28094.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28094.005
X-TMASE-Result: 10--3.390000-10.000000
X-TMASE-MatchedRID: +qH7TW9/Rkejz0nOeth/yfCnSDfauCxfcDzcoONn/M4R34ro7k23nQfN
	hshqWR17jOuMs1hxWhn5fIu2trOcXYgrKnsJ1GRgP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW6vBQc3bCgEsM4pEbFr1obyMzwe5s18okM7Cl8sx4HBGwK0ZgbTOeKUvGsAbY6bunb8bA
	aVdPsnTcL/NP3BYFG2DZmEL9jt0nMk/AYjLp9ITG9OepgphdNGVeAZ5VSHdZ2bKItl61J/yUGDD
	kbg1gJk6Gn57TccK/YLbigRnpKlKSBuGJWwgxArHsoRE2DMTEaP1nmLxqNZRcJY1NpAFTbnJSLM
	4aRsPfsnK21Nwv7iafmI8JInNcf9BIzpsK49UHiXDK9vUHAOtgJ/+Yl5cZ1mP0d3nMjP6J2IHqa
	UMp7VXtL/LK0d4I30Ze/gJB41STsbqpM7Cr+fvX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 07:21:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193209

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
===============
Upgrade to fmt 10.1.1
Upgrade to cpp-httplib 0.14.3
Upgrade to BLAKE3 1.5.0

Changelog:
 https://ccache.dev/releasenotes.html#_ccache_4_9

0001-xxhash.h-Fix-build-with-gcc-12.patch
refreshed for 4.9

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ccache/{ccache_4.8.3.bb => ccache_4.9.bb}               | 4 ++--
 .../ccache/files/0001-xxhash.h-Fix-build-with-gcc-12.patch  | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/ccache/{ccache_4.8.3.bb => ccache_4.9.bb} (82%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.8.3.bb b/meta/recipes-devtools/ccache/ccache_4.9.bb
similarity index 82%
rename from meta/recipes-devtools/ccache/ccache_4.8.3.bb
rename to meta/recipes-devtools/ccache/ccache_4.9.bb
index 03372aa685..8550470e3f 100644
--- a/meta/recipes-devtools/ccache/ccache_4.8.3.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.9.bb
@@ -7,14 +7,14 @@ HOMEPAGE = "http://ccache.samba.org"
 SECTION = "devel"
 
 LICENSE = "GPL-3.0-or-later"
-LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=6a6fe0ae4e57592b187ab72fa6d420ec"
+LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=11b0b581dd56bbac4f5de214d47927ca"
 
 DEPENDS = "zstd"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
            file://0001-xxhash.h-Fix-build-with-gcc-12.patch \
            "
-SRC_URI[sha256sum] = "d59dd569ad2bbc826c0bc335c8ebd73e78ed0f2f40ba6b30069347e63585d9ef"
+SRC_URI[sha256sum] = "866b2223d59333640f0e7a003cbb85b32d9ca3c9445bd9e3cf142942e69dd3ec"
 
 inherit cmake github-releases
 
diff --git a/meta/recipes-devtools/ccache/files/0001-xxhash.h-Fix-build-with-gcc-12.patch b/meta/recipes-devtools/ccache/files/0001-xxhash.h-Fix-build-with-gcc-12.patch
index 67c74a1e8e..e65b830257 100644
--- a/meta/recipes-devtools/ccache/files/0001-xxhash.h-Fix-build-with-gcc-12.patch
+++ b/meta/recipes-devtools/ccache/files/0001-xxhash.h-Fix-build-with-gcc-12.patch
@@ -1,4 +1,4 @@
-From 550834a3ec2e05e379be63b084e7fa06a1723f84 Mon Sep 17 00:00:00 2001
+From d17fdacf4892a15fafb56b0890ece05b485e89fb Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Mon, 6 Jun 2022 17:53:20 +0800
 Subject: [PATCH] xxhash.h: Fix build with gcc-12
@@ -23,10 +23,10 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/third_party/xxhash.h b/src/third_party/xxhash.h
-index 08ab794..c754e99 100644
+index a18e8c7..1b72307 100644
 --- a/src/third_party/xxhash.h
 +++ b/src/third_party/xxhash.h
-@@ -1501,7 +1501,7 @@ static void* XXH_memcpy(void* dest, const void* src, size_t size)
+@@ -2107,7 +2107,7 @@ static void* XXH_memcpy(void* dest, const void* src, size_t size)
  #  define XXH_NO_INLINE static
  /* enable inlining hints */
  #elif defined(__GNUC__) || defined(__clang__)
-- 
2.34.1


