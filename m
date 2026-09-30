Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B799CA5FC1
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 08:17:13 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8575.1790756231356047059
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 01:17:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=loRJ1zMx;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AC3291A107D
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:17:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7B86960749
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:17:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B6491103298C5;
	Wed, 30 Sep 2026 10:17:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790756228; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SOSOrsst+rM/S3Di9kb/kJWfbic/C4pVh+W6yRd4cJM=;
	b=loRJ1zMxp3o/bkAwqxR6aTTiP461nzNY4/q8Tvz844AEG4E5Vx7Gzr0xB8pR0UL8cyYy3K
	Zoo7uEwXZsAmDWkfY3SfNgZvF+7nxOftOgqdsNrzPNToyDCkQz442IsLTp2DLCJ6IF6HvX
	AIxCEmiFIzk/iNrDWTavVotzyH0/z6yJJzLJSstQ01eD2E/skFdOY/K5Oxc2Eaj1qJHW1N
	eZaJYcKOKDC1LzgBFdvdsy5uWFtgRFc2ua4C6Lou1EP+yf1L5HVguG538mPmyVZ3wpJ/Ma
	G3ZdYlqHGzuheim1Phgk8T+YiDWKv7kVqdUHXmyjeGIDN6LP3tqW5Dbgm79pbw==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 30 Sep 2026 10:16:49 +0200
Subject: [PATCH 24/24] appstream: upgrade 1.2.0 -> 1.2.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-mathieu-upgrades-2026-02-29-v1-24-102c38be04df@bootlin.com>
References: <20260930-mathieu-upgrades-2026-02-29-v1-0-102c38be04df@bootlin.com>
In-Reply-To: <20260930-mathieu-upgrades-2026-02-29-v1-0-102c38be04df@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790756204; l=6502;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=peIbPiVSlKQDIJZrma4gi9LMR++9HXJ+3Alrs54j0cg=;
 b=5aQ/ZXhgn4ATKY1IpmjN2MpRseSw9uhCKx6FuB/wDqa3xpXIKcJzVz8jUM1Tlv63uVlc73ZI6
 jw3fK8WTfxrBb7EdWFkB4F1On6RtXL0FVxRHTR0n+WQrYOwt2LFkRkp
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:17:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246948

Released: 2026-09-28

Features:
 * curl: Include "libcurl" in UA string so AI bot protection hits us less
 * compose: Permit changing the downloader user agent
 * compose: Try to guess what media we actually downloaded if processing failed
 * Add support for elogind

Bugfixes:
 * meson: Make sed command cross-platform friendly
 * meson: Don't use any absolute include path to find libstemmer.h
 * system-info: Avoid overflow in physical memory total on 32-bit systems
 * compose: Flag a missing ffprobe as its own error
 * docs: Work around a rare DAPS race condition when building documentation
 * Resolve or skip failing tests on riscv64 & s390x
 * validator: Fix validation of `references` elements
 * tests: Relax fontconfig orthography data check for 2.18.3 bug

Miscellaneous:
 * compose: Move media detection to the worker process

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 .../appstream/0001-remove-hardcoded-path.patch     | 32 ----------------------
 .../appstream/0002-Do-not-build-qt-tests.patch     |  4 +--
 ..._PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch |  4 +--
 .../{appstream_1.2.0.bb => appstream_1.2.1.bb}     | 12 ++++----
 4 files changed, 9 insertions(+), 43 deletions(-)

diff --git a/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch b/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
deleted file mode 100644
index d0cb5cf6f495..000000000000
--- a/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 0a532ef29855599e4761923bb38069e98d78e25f Mon Sep 17 00:00:00 2001
-From: Markus Volk <f_l_k@t-online.de>
-Date: Mon, 12 Dec 2022 15:42:42 +0100
-Subject: [PATCH] remove hardcoded path
-
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
-
-Dont include hardcoded path. This fixes:
-| cc1: error: include location "/usr/include" is unsafe for cross-compilation [-Werror=poison-system-directories]
-
-Upstream-Status: Inappropriate [oe-specific]
----
- meson.build | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 004dce3..cefb852 100644
---- a/meson.build
-+++ b/meson.build
-@@ -229,10 +229,10 @@ endif
- stemmer_inc_dirs = include_directories()
- if get_option('stemming')
-     stemmer_lib = cc.find_library('stemmer', required: true)
--    stemmer_inc_dirs = include_directories(['/usr/include'])
-+    stemmer_inc_dirs = include_directories([''])
-     if not cc.has_header('libstemmer.h')
-         if cc.has_header('libstemmer/libstemmer.h')
--            stemmer_inc_dirs = include_directories('/usr/include/libstemmer')
-+            stemmer_inc_dirs = include_directories('')
-         else
-             error('Unable to find Snowball header "libstemmer.h". Please ensure libstemmer/Snowball is installed properly in order to continue.')
-         endif
diff --git a/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch b/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch
index 861d9552a50e..5f35a8bf2300 100644
--- a/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch
+++ b/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch
@@ -1,4 +1,4 @@
-From 0d387b6cb8907dd377212de187fbe749b40eedb4 Mon Sep 17 00:00:00 2001
+From 1110cb5c658de30c63642929c1128ab4f9b9b98e Mon Sep 17 00:00:00 2001
 From: Marc Ferland <marc.ferland@sonatest.com>
 Date: Fri, 26 Jul 2024 15:41:00 -0400
 Subject: [PATCH] Do not build qt/tests
@@ -23,7 +23,7 @@ Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
  1 file changed, 2 deletions(-)
 
 diff --git a/qt/meson.build b/qt/meson.build
-index 488fe60..83c2715 100644
+index 488fe60b61c0..83c2715c5fe7 100644
 --- a/qt/meson.build
 +++ b/qt/meson.build
 @@ -144,5 +144,3 @@ install_data (
diff --git a/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch b/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch
index 9f06f789162e..3774bfa7c617 100644
--- a/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch
+++ b/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch
@@ -1,4 +1,4 @@
-From 2c0758a84741e6e91cfd1ba70e9017ba4e76143a Mon Sep 17 00:00:00 2001
+From b8d73820cdb685089c0f805c7ca8163b21a78acd Mon Sep 17 00:00:00 2001
 From: Marc Ferland <marc.ferland@sonatest.com>
 Date: Mon, 29 Jul 2024 09:35:51 -0400
 Subject: [PATCH] Fix PACKAGE_PREFIX_DIR in qt/cmake/AppStreamQtConfig.cmake.in
@@ -39,7 +39,7 @@ Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/qt/cmake/AppStreamQtConfig.cmake.in b/qt/cmake/AppStreamQtConfig.cmake.in
-index 63df65f..5ab2d0e 100644
+index 63df65f25676..5ab2d0ec7bd3 100644
 --- a/qt/cmake/AppStreamQtConfig.cmake.in
 +++ b/qt/cmake/AppStreamQtConfig.cmake.in
 @@ -1,5 +1,5 @@
diff --git a/meta/recipes-support/appstream/appstream_1.2.0.bb b/meta/recipes-support/appstream/appstream_1.2.1.bb
similarity index 80%
rename from meta/recipes-support/appstream/appstream_1.2.0.bb
rename to meta/recipes-support/appstream/appstream_1.2.1.bb
index 4a1c23e760fd..fcfc1aea6ccd 100644
--- a/meta/recipes-support/appstream/appstream_1.2.0.bb
+++ b/meta/recipes-support/appstream/appstream_1.2.1.bb
@@ -18,13 +18,11 @@ inherit meson gobject-introspection gettext gi-docgen pkgconfig vala bash-comple
 GIR_MESON_OPTION = "gir"
 GIDOCGEN_MESON_OPTION = "apidocs"
 
-SRC_URI = " \
-	https://www.freedesktop.org/software/appstream/releases/AppStream-${PV}.tar.xz \
-	file://0001-remove-hardcoded-path.patch \
-	file://0002-Do-not-build-qt-tests.patch \
-	file://0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch \
-"
-SRC_URI[sha256sum] = "901919378910550271feb2d826034c9af6522f3ad218de04d3d6d35ddba5cb45"
+SRC_URI = "https://www.freedesktop.org/software/appstream/releases/AppStream-${PV}.tar.xz \
+           file://0002-Do-not-build-qt-tests.patch \
+           file://0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch \
+           "
+SRC_URI[sha256sum] = "7df664fd3ad3b1640c6a0ff77fa84f9fabe264111bf1fe8f5df3444d6d4caaca"
 
 S = "${UNPACKDIR}/AppStream-${PV}"
 

-- 
2.47.3


