Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8787AF33820
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 09:31:26 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71993.1773739877217173486
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Mar 2026 02:31:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ja06WDEU;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773739878; x=1805275878;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bzg93DyjzBvbImbQgG3vyPucbEaVBLgnXRXG/XhZLq0=;
  b=ja06WDEUIyh6kjNS2JikA2zyWIx+1MYlnXthBdvGLQEoEjzT+IVTS7D1
   u9+QkSbPGkm3ZuUGHldf8lLTlJanna0w3SWQ1KcQkd4Omw9ZikAU7yg1R
   uV8tu4JksyvGOu7AjwatTospYwT775VIpZw9EgZ0r6zO0/tGmP/ygVQ95
   U3EhTz7ER2lhbmAzBIGqqxN+NFdTJtiotkFl7gp/9XpPXIMhMEfl6JgHa
   mupZdG+Uq0L1v+oOxUY0bYYDPkSGONh8wt2G1jGKlagln5gtkoP7Ea6L0
   cR5Geuvinb2LWxA8LXChikZAw4i6zJk3zlyFEMhY9a1U7GSTXqreuKfei
   w==;
X-CSE-ConnectionGUID: N3TI2WyQTa6uG72uR8ceLg==
X-CSE-MsgGUID: Q369yEq8R96pubusiUprbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="233575067"
X-IronPort-AV: E=Sophos;i="6.23,124,1770562800"; 
   d="scan'208";a="233575067"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 18:31:16 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 5A7401C1C709
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 09:31:15 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 094A68D65FB
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 09:31:15 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.128.218])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 6E65A180013D
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 09:31:12 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] ccache: upgrade 4.12.3 -> 4.13.1
Date: Tue, 17 Mar 2026 17:31:08 +0800
Message-ID: <20260317093108.10885-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 09:31:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233307

1. Changelog
  https://ccache.dev/releasenotes.html#_ccache_4_13_1

2. Checksum of LICENSE.adoc changed as:
  2.1 authors.adoc location changed
  2.2 third_party fmt version update
  2.3 third_party oss nonstd-span removed

3. Remove LIC_FILES_CHKSUM of nonstd-span as it was removed from third_party

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../ccache/{ccache_4.12.3.bb => ccache_4.13.1.bb}            | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/ccache/{ccache_4.12.3.bb => ccache_4.13.1.bb} (79%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.12.3.bb b/meta/recipes-devtools/ccache/ccache_4.13.1.bb
similarity index 79%
rename from meta/recipes-devtools/ccache/ccache_4.12.3.bb
rename to meta/recipes-devtools/ccache/ccache_4.13.1.bb
index 0cd9a43a1b..f1940b75bb 100644
--- a/meta/recipes-devtools/ccache/ccache_4.12.3.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.13.1.bb
@@ -7,9 +7,8 @@ HOMEPAGE = "http://ccache.samba.org"
 SECTION = "devel"
 
 LICENSE = "GPL-3.0-or-later & MIT & BSL-1.0 & ISC"
-LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=22ef4326c8a14ac937fc2b76ef0fd233 \
+LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=e89f26e9f97d14068047871bdb2b3118 \
                     file://src/third_party/cpp-httplib/httplib.h;endline=6;md5=663aca6f84e7d67ade228aad32afc0ea \
-                    file://src/third_party/nonstd-span/nonstd/span.hpp;endline=9;md5=b4af92a7f068b38c5b3410dceb30c186 \
                     file://src/third_party/win32-compat/win32/mktemp.c;endline=17;md5=d287e9c1f1cd2bb2bd164490e1cf449a \
                     "
 
@@ -17,7 +16,7 @@ DEPENDS = "zstd fmt xxhash"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "d683d5964a395f00c1c812ea1d1d523179f1097cbff7e7e54e714fa3f99711b1"
+SRC_URI[sha256sum] = "e822547b0344c567c6f748f75d4da056c360e2196da12d213ec0caf39d72896d"
 
 inherit cmake github-releases
 
-- 
2.43.0


