Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35483D46C01
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 03:54:24 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7766.1769658857027692502
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jan 2026 19:54:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DFhETNEI;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769658857; x=1801194857;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=6J1EudrmG3pCMUCKLcZulDpVSzUqsrA40UvaU1R1uUE=;
  b=DFhETNEI/aeTJZhpwQIzks9iSTIO3wPUe6iSl3YUYxjP3ziwf8vK8l35
   sAFmbqNrhx5HOf1Hxl7ZdSKLfgWnQdHUF8tYd10UxkwN897jzDDLPvvgu
   LKXURq9HGhpX0Oay5VCTLu4ttu7y6RoJwIjerlfPzQ8Xw+hTvzGS6aT/N
   J7+KbsCq8gbppNZ6M2uP8J5tyyGOxSCV2gasSrpRt8cJun75RdsjWvp5f
   Kc6wGs0bCphkfXZWJLJokcvSwh51/yKSIPlnxC6IRvu/8YqmPfcdU9TvR
   cDbNyAe3tSS63B5m4TsrS3XD2otff1smKGiwq+oCervkpdZSeyNIsnriR
   Q==;
X-CSE-ConnectionGUID: lgnLCOZ7QQSrXDaEJj7npQ==
X-CSE-MsgGUID: UHsHOftLTtyGQsp3lcXiUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="216257441"
X-IronPort-AV: E=Sophos;i="6.21,260,1763391600"; 
   d="scan'208";a="216257441"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 12:54:15 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 987F481C4
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 03:54:15 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 3C138C0370A
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 03:54:15 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id E74A51401F20
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 03:54:12 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 6/6] orc: Enable hotdoc to produce doc
Date: Thu, 29 Jan 2026 11:53:53 +0800
Message-ID: <20260129035353.8982-7-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129035353.8982-1-liuyd.fnst@fujitsu.com>
References: <20260129035353.8982-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 03:54:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230118

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../orc/orc/0001-Fix-hotdoc-run-error.patch   | 37 +++++++++++++++++++
 meta/recipes-devtools/orc/orc_0.4.42.bb       |  5 ++-
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/orc/orc/0001-Fix-hotdoc-run-error.patch

diff --git a/meta/recipes-devtools/orc/orc/0001-Fix-hotdoc-run-error.patch b/meta/recipes-devtools/orc/orc/0001-Fix-hotdoc-run-error.patch
new file mode 100644
index 0000000000..277ce038f8
--- /dev/null
+++ b/meta/recipes-devtools/orc/orc/0001-Fix-hotdoc-run-error.patch
@@ -0,0 +1,36 @@
+Subject: [PATCH] Fix hotdoc run error.
+
+Fix the following error.
+| Running custom install script 'tmp/work/x86-64-v3-poky-linux/orc/0.4.42/recipe-sysroot-native/usr/bin/meson.real --internal hotdoc --install orc-doc/html --docdir /usr/share/doc/orc/html --name orc --builddir tmp/work/x86-64-v3-poky-linux/orc/0.4.42/build/doc tmp/work/x86-64-v3-poky-linux/orc/0.4.42/recipe-sysroot-native/usr/bin/hotdoc run --conf-file orc-doc.json'
+| --- stdout ---
+|
+| --- stderr ---
+| ERROR: [doc-tree]: (index-extension-not-found): tmp/work/x86-64-v3-poky-linux/orc/0.4.42/sources/orc-0.4.42/doc/sitemap.txt:8:10: No extension named c for index page
+| 00006:                tutorial.md
+| 00007:                opcodes.md
+| 00008:        c-index
+|               ^
+| 00009:
+|
+
+Remove c-index as it is not in the doc directory.
+
+Upstream-Status: Pending
+
+Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
+---
+ doc/sitemap.txt | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/doc/sitemap.txt b/doc/sitemap.txt
+index 568b367..40a7f99 100644
+--- a/doc/sitemap.txt
++++ b/doc/sitemap.txt
+@@ -5,4 +5,3 @@ index.md
+ 		concepts.md
+ 		tutorial.md
+ 		opcodes.md
+-	c-index
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/orc/orc_0.4.42.bb b/meta/recipes-devtools/orc/orc_0.4.42.bb
index f56b9058c2..b73c8df04d 100644
--- a/meta/recipes-devtools/orc/orc_0.4.42.bb
+++ b/meta/recipes-devtools/orc/orc_0.4.42.bb
@@ -4,11 +4,14 @@ DESCRIPTION = "Optimised Inner Loop Runtime Compiler is a Library and set of too
 LICENSE = "BSD-2-Clause & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1400bd9d09e8af56b9ec982b3d85797e"
 
-SRC_URI = "http://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.xz"
+SRC_URI = "http://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.xz \
+           file://0001-Fix-hotdoc-run-error.patch \
+          "
 SRC_URI[sha256sum] = "7ec912ab59af3cc97874c456a56a8ae1eec520c385ec447e8a102b2bd122c90c"
 
 inherit meson pkgconfig
 
+DEPENDS = "hotdoc-native"
 # distinguish from apache:orc
 CVE_PRODUCT = "gstreamer:orc"
 
-- 
2.43.0


