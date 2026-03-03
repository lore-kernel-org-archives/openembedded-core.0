Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7425EEC048D
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 10:09:47 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14964.1772532584162741816
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 02:09:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=o/8lDOYN;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772532584; x=1804068584;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jW905U5WLprGe+HH1gkQ8Bf7qeE2+w79/lBNnaaVBcs=;
  b=o/8lDOYNUnhCmKt/YEZWwwbBUBQQ5+umReL6dIbiXMMcp9r/7r56cGvk
   IBycXf7hMzrf5pRikbSFRU6n0+zHawE0jPWRLtUGbmvgfZ89/vcEZAHCs
   Eay/snO7jSoyQyO6A+zHhQkI0BgNHWpkgYqaNbq7au6LoqrTc5Oa5DAbb
   wjYXYk/Eq+cj7EUxyfM9Wzo8mYsp6GMII/l/J5Zbqud8AgKE1jUHr7r3H
   sSFJWmUm4aCuWBDd2kPf7b0/9r5a0Bo1+TEOy0t0pBde3E6IzqIU4RtHh
   PN5GnkJNAiNPTDGgJHGxl23bv+GQTU/aBq7A/pRlY1xnnBSXIMHrLGNaW
   A==;
X-CSE-ConnectionGUID: Zn/ppRxIRduSDBIc5e6D5w==
X-CSE-MsgGUID: U3lnsN8wSmqcvuAND1WgTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="219169546"
X-IronPort-AV: E=Sophos;i="6.21,321,1763391600"; 
   d="scan'208";a="219169546"
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.fujitsu.com (Postfix) with ESMTPS id 56EF51002B96
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Mar 2026 10:09:42 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 1238DC000AE
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Mar 2026 10:09:42 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 65C771001CE3;
	Tue,  3 Mar 2026 10:09:39 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 01/23] ccache: upgrade 4.12.2 -> 4.12.3
Date: Tue,  3 Mar 2026 18:09:06 +0800
Message-ID: <20260303100929.1624-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 10:09:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232277

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2026

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ccache/{ccache_4.12.2.bb => ccache_4.12.3.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/ccache/{ccache_4.12.2.bb => ccache_4.12.3.bb} (88%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.12.2.bb b/meta/recipes-devtools/ccache/ccache_4.12.3.bb
similarity index 88%
rename from meta/recipes-devtools/ccache/ccache_4.12.2.bb
rename to meta/recipes-devtools/ccache/ccache_4.12.3.bb
index 28f36e5ed7..0cd9a43a1b 100644
--- a/meta/recipes-devtools/ccache/ccache_4.12.2.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.12.3.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://ccache.samba.org"
 SECTION = "devel"
 
 LICENSE = "GPL-3.0-or-later & MIT & BSL-1.0 & ISC"
-LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=5633f18ca110f0d4cb907eba07c920ef \
+LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=22ef4326c8a14ac937fc2b76ef0fd233 \
                     file://src/third_party/cpp-httplib/httplib.h;endline=6;md5=663aca6f84e7d67ade228aad32afc0ea \
                     file://src/third_party/nonstd-span/nonstd/span.hpp;endline=9;md5=b4af92a7f068b38c5b3410dceb30c186 \
                     file://src/third_party/win32-compat/win32/mktemp.c;endline=17;md5=d287e9c1f1cd2bb2bd164490e1cf449a \
@@ -17,7 +17,7 @@ DEPENDS = "zstd fmt xxhash"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "2a087efb66b62d4c66d4eb276748bbfa797ff3bde20adf44c53e5a8b9f3679af"
+SRC_URI[sha256sum] = "d683d5964a395f00c1c812ea1d1d523179f1097cbff7e7e54e714fa3f99711b1"
 
 inherit cmake github-releases
 
-- 
2.43.0


