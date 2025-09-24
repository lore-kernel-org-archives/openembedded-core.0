Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C966CAC5A5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 05:56:04 +0000 (UTC)
Received: from esa2.hc324-48.eu.iphmx.com (esa2.hc324-48.eu.iphmx.com [207.54.68.120])
 by mx.groups.io with SMTP id smtpd.web10.6049.1758693362241392710
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 22:56:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=my0TFaZO;
 spf=pass (domain: bmw.de, ip: 207.54.68.120, mailfrom: prvs=35556fb92=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1758693362; x=1790229362;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=20622tdgakL1TzodIF4G5BX18I7mBs/4rZ5d5kQx5V0=;
  b=my0TFaZOpXoDN7x5xcfoHHwxmb1wDkZTgwoF4CRSvBM97SDxOVhtWRjk
   hA9QeX08MX5LvRHdC1B0jwjXrEflLXuGpGg9ur8igPiT+cvxHlrkeAdXa
   1hsVXZirhqio/A20XPdYg98QHy3v3O4iyYy6rXdXBRQca0WdbFojCY0t4
   M=;
X-CSE-ConnectionGUID: vDs645rRTWiDn5weFIJxFg==
X-CSE-MsgGUID: O+GdNefKRNemTMdpYdFqgg==
Received: from esagw1.bmwgroup.com (HELO esagw1.muc) ([160.46.252.34]) by
 esa2.hc324-48.eu.iphmx.com with ESMTP/TLS; 24 Sep 2025 07:56:00 +0200
Received: from unknown (HELO esabb2.muc) ([10.31.187.133]) by esagw1.muc with
 ESMTP/TLS; 24 Sep 2025 07:56:00 +0200
Received: from smucmp12a.bmwgroup.net (HELO smucmp12a.europe.bmw.corp) ([10.30.13.95])
 by esabb2.muc with ESMTP/TLS; 24 Sep 2025 07:56:00 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.212) by
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9) with Microsoft SMTP
 Server (version=TLS; Wed, 24 Sep 2025 07:55:59 +0200
X-CSE-ConnectionGUID: v9gIR9aMSiWQH17oIzQheg==
X-CSE-MsgGUID: CSvJRL6aQQGUNfgl4PBNIg==
X-CSE-ConnectionGUID: SIzG9rC1RleAJ+KM81CbKA==
X-CSE-MsgGUID: FCDXv3B9S2uyn7B5eK5MXA==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>
Subject: [PATCH] libwpe: upgrade 1.16.2 -> 1.16.3
Date: Wed, 24 Sep 2025 07:55:36 +0200
Message-ID: <20250924055536.907389-1-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp16f.europe.bmw.corp (2a03:1e80:a15:58f::1:148) To
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 05:56:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223946

Release notes are available at [0]. The new release contains a CMake-related
patch that we can now drop.

[0]: https://github.com/WebPlatformForEmbedded/libwpe/releases/tag/1.16.3

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
---
 ...red-CMake-version-to-3.5-to-allow-bu.patch | 38 -------------------
 .../{libwpe_1.16.2.bb => libwpe_1.16.3.bb}    |  3 +-
 2 files changed, 1 insertion(+), 40 deletions(-)
 delete mode 100644 meta/recipes-sato/webkit/libwpe/0001-cmake-Bump-required-CMake-version-to-3.5-to-allow-bu.patch
 rename meta/recipes-sato/webkit/{libwpe_1.16.2.bb => libwpe_1.16.3.bb} (80%)

diff --git a/meta/recipes-sato/webkit/libwpe/0001-cmake-Bump-required-CMake-version-to-3.5-to-allow-bu.patch b/meta/recipes-sato/webkit/libwpe/0001-cmake-Bump-required-CMake-version-to-3.5-to-allow-bu.patch
deleted file mode 100644
index 05688ee463..0000000000
--- a/meta/recipes-sato/webkit/libwpe/0001-cmake-Bump-required-CMake-version-to-3.5-to-allow-bu.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 7b227c7c1ac226498b1ea3987f87350d0f14f49f Mon Sep 17 00:00:00 2001
-From: Moritz Haase <Moritz.Haase@bmw.de>
-Date: Wed, 2 Jul 2025 09:19:44 +0200
-Subject: [PATCH] cmake: Bump required CMake version to 3.5 to allow builds
- with CMake 4+
-
-This enables builds with CMake 4+, fixing:
-
-    CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
-      Compatibility with CMake < 3.5 has been removed from CMake.
-
-      Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
-      to tell CMake that the project requires at least <min> but has been
-      updated to work with policies introduced by <max> or earlier.
-
-      Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
-
-While at it, remove the extra call to 'cmake_policy()'. When passing the same
-version as to 'cmake_minimum_required()' it's not needed, as the latter calls
-the former automatically.
-
-Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
-Upstream-Status: Submitted [https://github.com/WebPlatformForEmbedded/libwpe/pull/136]
----
- CMakeLists.txt | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index db9ae50..2a01daf 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,5 +1,4 @@
--cmake_minimum_required(VERSION 3.0)
--cmake_policy(VERSION 3.0)
-+cmake_minimum_required(VERSION 3.5)
-
- set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")
- include(VersioningUtils)
diff --git a/meta/recipes-sato/webkit/libwpe_1.16.2.bb b/meta/recipes-sato/webkit/libwpe_1.16.3.bb
similarity index 80%
rename from meta/recipes-sato/webkit/libwpe_1.16.2.bb
rename to meta/recipes-sato/webkit/libwpe_1.16.3.bb
index 6cb6818acc..abfc631a5b 100644
--- a/meta/recipes-sato/webkit/libwpe_1.16.2.bb
+++ b/meta/recipes-sato/webkit/libwpe_1.16.3.bb
@@ -11,9 +11,8 @@ inherit cmake features_check pkgconfig
 REQUIRED_DISTRO_FEATURES = "opengl"
 
 SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz \
-           file://0001-cmake-Bump-required-CMake-version-to-3.5-to-allow-bu.patch \
            "
-SRC_URI[sha256sum] = "960bdd11c3f2cf5bd91569603ed6d2aa42fd4000ed7cac930a804eac367888d7"
+SRC_URI[sha256sum] = "c880fa8d607b2aa6eadde7d6d6302b1396ebc38368fe2332fa20e193c7ee1420"
 
 # This is a tweak of upstream-version-is-even needed because
 # upstream directory contains tarballs for other components as well.

