Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72E1FC04E69
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 07:19:35 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.7576.1687850372972499989
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 00:19:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="101083418"
X-IronPort-AV: E=Sophos;i="6.01,161,1684767600"; 
   d="scan'208";a="101083418"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 16:19:30 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 810EBCA1EE
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 16:19:28 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id B4049D540F
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 16:19:27 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 333406C833;
	Tue, 27 Jun 2023 16:19:27 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] ccache: upgrade 4.8.1 -> 4.8.2
Date: Tue, 27 Jun 2023 15:17:11 +0800
Message-Id: <1687850250-20040-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687850250-20040-1-git-send-email-wangmy@fujitsu.com>
References: <1687850250-20040-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27716.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27716.005
X-TMASE-Result: 10--3.989800-10.000000
X-TMASE-MatchedRID: 6IstDyeExSCjz0nOeth/ySAWHOR37+ATpxAd6mi1Ga0EJz1+WlwFQuze
	iquv6lvKerzSZ/wbfVuYlVLttZCaENPxsjeTKRpTHWRJEfGP5nmUq+GQ/zyJdBluwBR5lxHPEZu
	8+uPpk1fgK2NiZClvaQXURz+hQhGVWkIi5GvRHEpO5y1KmK5bJRSLgSFq3TnjM/dZg2GSzOV25l
	G5ErCg9h0Dxc9hDIBQBhQWw3lZ+IWNtyCkWX3XWgN+CmNIOQU3TfK5j0EZbytXGTbsQqHbkhF6L
	kMDvK1JWyXEB937q1d5OPD8XJFfpB8TzIzimOwPFnjKVTYbDMDEQdG7H66TyHEqm8QYBtMOIhXR
	IXUY9AMXBL5Z/5D6U5aBd9YorfT2OOinlyHwX6FM93M51Y62ViQJ9k7qBwPOw390V6AKbnmGx74
	/Pt8+lUopW8XUBqHDgr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 07:19:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183455

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
  BLAKE3 updated to 1.4.0
  cpp-httplib updated to 0.12.6

Changelog:
==========
Fixed parsing of Windows drive letter in file URLs for remote storage.
Fixed a bug affecting depend mode with MSVC.
Ccache no longer passes -v to the preprocessor. This improves preprocessor mode hit rate when -v is on the compiler command line.
Made --trim-max-size accept 0 for no limit.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ccache/{ccache_4.8.1.bb => ccache_4.8.2.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/ccache/{ccache_4.8.1.bb => ccache_4.8.2.bb} (82%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.8.1.bb b/meta/recipes-devtools/ccache/ccache_4.8.2.bb
similarity index 82%
rename from meta/recipes-devtools/ccache/ccache_4.8.1.bb
rename to meta/recipes-devtools/ccache/ccache_4.8.2.bb
index b0ae7fb25c..22a6b385b0 100644
--- a/meta/recipes-devtools/ccache/ccache_4.8.1.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.8.2.bb
@@ -7,14 +7,14 @@ HOMEPAGE = "http://ccache.samba.org"
 SECTION = "devel"
 
 LICENSE = "GPL-3.0-or-later"
-LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=1601d62d6828fbe19b6f6c2d01fdff4c"
+LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=cd54b7abfc462470b0f505273c38f0ff"
 
 DEPENDS = "zstd"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
            file://0001-xxhash.h-Fix-build-with-gcc-12.patch \
            "
-SRC_URI[sha256sum] = "869903c1891beb8bee87f1ec94d8a0dad18c2add4072c456acbc85cdfc23ca63"
+SRC_URI[sha256sum] = "75eef15b8b9da48db9c91e1d0ff58b3645fc70c0e4ca2ef1b6825a12f21f217d"
 
 inherit cmake github-releases
 
-- 
2.34.1


