Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE6B1C3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 09:00:24 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.73893.1705309223935517905
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 01:00:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="145634243"
X-IronPort-AV: E=Sophos;i="6.04,196,1695654000"; 
   d="scan'208";a="145634243"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 18:00:21 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id BBEAFD9D9D
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:00:18 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id F18BED946F
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:00:17 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 738966895D
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:00:17 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 014141A0070;
	Mon, 15 Jan 2024 17:00:16 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libbsd: upgrade 0.11.7 -> 0.11.8
Date: Mon, 15 Jan 2024 17:00:05 +0800
Message-Id: <1705309205-23958-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28120.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28120.006
X-TMASE-Result: 10--10.373300-10.000000
X-TMASE-MatchedRID: PWXwJQp0B9ujz0nOeth/yTo39wOA02LhGEfoClqBl87fUZT83lbkEJYv
	gWqjMEzaNYCBzzxsUnvZ5eN1eJMdpVpCIuRr0RxKP0HVIeixJdDBOVz0Jwcxl0fyM5VfgjG209D
	6Rw2zIrPxq3ixYTmGC/TZ8JWgWCkySJD6DmpCD0eXZ9FWlXKjpBtuGFXrmRpjqgN67rC7tur7lo
	I15Cn3iN3BOg2Ew0Gzjr41gIZszQn08RqkuZscMd9JA2lmQRNUm/t43d5OEX6mOWRsO8Mnh2POz
	cFgcUr4+5fNMUyu4Jfq3n4SViq6NKqoNk0mVBa96nHbeBu5LnmuLG21Eb4T84Fum2PEjqt1o8WM
	kQWv6iVfx6Zf83Do5eloYgzjonrsOwBXM346/+y9R6DFn07MCDWjh9hk/M6WvR7ibrbzg+RuS+V
	HpNfRBE3FWu3vgZpi
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 09:00:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193643

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Switch arc4random(3bsd) man page from OpenBSD to NetBSD

0001-funopen-Replace-off64_t-with-off_t-in-funopen_seek.patch
removed since it's included in 0.11.8

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...e-off64_t-with-off_t-in-funopen_seek.patch | 34 -------------------
 .../{libbsd_0.11.7.bb => libbsd_0.11.8.bb}    | 11 ++----
 2 files changed, 3 insertions(+), 42 deletions(-)
 delete mode 100644 meta/recipes-support/libbsd/libbsd/0001-funopen-Replace-off64_t-with-off_t-in-funopen_seek.patch
 rename meta/recipes-support/libbsd/{libbsd_0.11.7.bb => libbsd_0.11.8.bb} (81%)

diff --git a/meta/recipes-support/libbsd/libbsd/0001-funopen-Replace-off64_t-with-off_t-in-funopen_seek.patch b/meta/recipes-support/libbsd/libbsd/0001-funopen-Replace-off64_t-with-off_t-in-funopen_seek.patch
deleted file mode 100644
index 45ecef041b..0000000000
--- a/meta/recipes-support/libbsd/libbsd/0001-funopen-Replace-off64_t-with-off_t-in-funopen_seek.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 9c4e5f8984e46344c9e150764b8aa0a7a70b6cb5 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 15 Dec 2022 09:02:22 -0800
-Subject: [PATCH] funopen: Replace off64_t with off_t in funopen_seek
-
-AC_SYS_LARGEFILE in configure.ac is setting needed defines to make
-64bit off_t on relevant platforms.
-
-Fixes build on musl
-
-| ../../../../../../../../workspace/sources/libbsd/src/funopen.c:68:28: error: unknown type name 'off64_t'; did you mean 'off_t'?
-| funopen_seek(void *cookie, off64_t *offset, int whence)
-|                            ^~~~~~~
-|                            off_t
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/libbsd/libbsd/-/merge_requests/24]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/funopen.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/funopen.c b/src/funopen.c
-index 1e6f43a..a9b40e8 100644
---- a/src/funopen.c
-+++ b/src/funopen.c
-@@ -65,7 +65,7 @@ funopen_write(void *cookie, const char *buf, size_t size)
- }
- 
- static int
--funopen_seek(void *cookie, off64_t *offset, int whence)
-+funopen_seek(void *cookie, off_t *offset, int whence)
- {
- 	struct funopen_cookie *cookiewrap = cookie;
- 	off_t soff = *offset;
diff --git a/meta/recipes-support/libbsd/libbsd_0.11.7.bb b/meta/recipes-support/libbsd/libbsd_0.11.8.bb
similarity index 81%
rename from meta/recipes-support/libbsd/libbsd_0.11.7.bb
rename to meta/recipes-support/libbsd/libbsd_0.11.8.bb
index 5c958f950e..17049c8c28 100644
--- a/meta/recipes-support/libbsd/libbsd_0.11.7.bb
+++ b/meta/recipes-support/libbsd/libbsd_0.11.8.bb
@@ -1,6 +1,3 @@
-# Copyright (C) 2013 Khem Raj <raj.khem@gmail.com>
-# Released under the MIT license (see COPYING.MIT for the terms)
-
 SUMMARY = "Library of utility functions from BSD systems"
 DESCRIPTION = "This library provides useful functions commonly found on BSD systems, \
                and lacking on others like GNU systems, thus making it easier to port \
@@ -36,14 +33,12 @@ LICENSE:${PN}-locale = "BSD-3-Clause & ISC & PD"
 LICENSE:${PN}-src = "BSD-3-Clause & ISC & PD"
 LICENSE:${PN}-staticdev = "BSD-3-Clause & ISC & PD"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=75e85c5a558f86d10fbd5abc567ea5e6"
+LIC_FILES_CHKSUM = "file://COPYING;md5=befe09fada57bdcf7f7c12f51081b08f"
 SECTION = "libs"
 
-SRC_URI = "https://libbsd.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
-           file://0001-funopen-Replace-off64_t-with-off_t-in-funopen_seek.patch \
-           "
+SRC_URI = "https://libbsd.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "9baa186059ebbf25c06308e9f991fda31f7183c0f24931826d83aa6abd8a0261"
+SRC_URI[sha256sum] = "55fdfa2696fb4d55a592fa9ad14a9df897c7b0008ddb3b30c419914841f85f33"
 
 inherit autotools pkgconfig
 
-- 
2.34.1


