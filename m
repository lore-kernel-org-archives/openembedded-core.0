Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E07CEE7E0C2
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 10:33:17 +0000 (UTC)
Received: from esa9.hc324-48.eu.iphmx.com (esa9.hc324-48.eu.iphmx.com [207.54.69.27])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44972.1770633191447946233
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 02:33:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=OYtBTPN2;
 spf=pass (domain: bmw.de, ip: 207.54.69.27, mailfrom: prvs=49347089b=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1770633191; x=1802169191;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=oCjKRPJ9zTlZQZY5r6+qSA3Gn98AUif8RvxEluvOuRo=;
  b=OYtBTPN2lCxDg72tI9I7nZz/9pYyzTi4IK25i2WtDxCBXkw3Y6+coj5a
   IcBvUU7w5EPpcpZOjHayomWUvxYgLYiCFJkos1/JGOPpq6bF8KfDaU7TX
   Vxw0jjWjhOivDKC7AfhTyYrfnZY2509LPc/Lri5PtkD4a/HY6nyeiiSEd
   A=;
X-CSE-ConnectionGUID: +IA4myUQQfe6dTPpn4lewQ==
X-CSE-MsgGUID: l2wNYbzUR12x/43BjJAshg==
Received: from esagw2.bmwgroup.com (HELO esagw2.muc) ([160.46.252.38]) by
 esa9.hc324-48.eu.iphmx.com with ESMTP/TLS; 09 Feb 2026 11:33:09 +0100
Received: from unknown (HELO esabb5.muc) ([10.31.187.136]) by esagw2.muc with
 ESMTP/TLS; 09 Feb 2026 11:33:09 +0100
Received: from smucmp16e.bmwgroup.net (HELO smucmp16e.europe.bmw.corp)
 ([10.30.13.147]) by esabb5.muc with ESMTP/TLS; 09 Feb 2026 11:33:07 +0100
Received: from smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44) by
 smucmp16e.europe.bmw.corp (2a03:1e80:a15:58f::1:147) with Microsoft SMTP
 Server (version=TLS; Mon, 9 Feb 2026 11:33:06 +0100
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.214) by
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44) with Microsoft SMTP
 Server (version=TLS; Mon, 9 Feb 2026 11:33:06 +0100
X-CSE-ConnectionGUID: lX1lvHF+TAaEpaBEYV12/g==
X-CSE-MsgGUID: ECLSO0dUSva3Q5+j00/Lfw==
X-CSE-ConnectionGUID: CYP9pTBRQVSEGauZrvBmew==
X-CSE-MsgGUID: grYprLMTRwGYnCDZ5dHswQ==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>
Subject: [PATCH] cmake: upgrade 4.2.2 -> 4.2.3
Date: Mon, 9 Feb 2026 11:32:50 +0100
Message-ID: <20260209103250.1230535-1-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp15b.europe.bmw.corp (2a03:1e80:a15:58f::1:4b) To
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 10:33:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230778

Release notes are available at [0].

[0]: https://cmake.org/cmake/help/v4.2/release/4.2.html#id3

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
---
 .../cmake/{cmake-native_4.2.2.bb => cmake-native_4.2.3.bb}      | 0
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 ...01-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal.patch | 2 +-
 .../cmake/cmake/0002-CMakeLists.txt-disable-USE_NGHTTP2.patch   | 2 +-
 meta/recipes-devtools/cmake/{cmake_4.2.2.bb => cmake_4.2.3.bb}  | 0
 5 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_4.2.2.bb => cmake-native_4.2.3.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_4.2.2.bb => cmake_4.2.3.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_4.2.2.bb b/meta/recipes-devtools/cmake/cmake-native_4.2.3.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_4.2.2.bb
rename to meta/recipes-devtools/cmake/cmake-native_4.2.3.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index ee771a1d64..5b8c1922b1 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            "
 
-SRC_URI[sha256sum] = "bbda94dd31636e89eb1cc18f8355f6b01d9193d7676549fba282057e8b730f58"
+SRC_URI[sha256sum] = "7efaccde8c5a6b2968bad6ce0fe60e19b6e10701a12fce948c2bf79bac8a11e9"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake/0001-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal.patch b/meta/recipes-devtools/cmake/cmake/0001-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal.patch
index 0d2de28d5b..7a717f72d8 100644
--- a/meta/recipes-devtools/cmake/cmake/0001-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal.patch
+++ b/meta/recipes-devtools/cmake/cmake/0001-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal.patch
@@ -1,4 +1,4 @@
-From 3d87f9fd1071e548cf9a6718c4ade0bfde812c30 Mon Sep 17 00:00:00 2001
+From d3859840c134012b18e3bca7e4bab60c9bc8efd5 Mon Sep 17 00:00:00 2001
 From: Otavio Salvador <otavio@ossystems.com.br>
 Date: Thu, 5 Jul 2018 10:28:04 -0300
 Subject: [PATCH] Disable use of ext2fs/ext2_fs.h by cmake's internal
diff --git a/meta/recipes-devtools/cmake/cmake/0002-CMakeLists.txt-disable-USE_NGHTTP2.patch b/meta/recipes-devtools/cmake/cmake/0002-CMakeLists.txt-disable-USE_NGHTTP2.patch
index f6b6cfcf41..c03e5e2364 100644
--- a/meta/recipes-devtools/cmake/cmake/0002-CMakeLists.txt-disable-USE_NGHTTP2.patch
+++ b/meta/recipes-devtools/cmake/cmake/0002-CMakeLists.txt-disable-USE_NGHTTP2.patch
@@ -1,4 +1,4 @@
-From d4696e9d78d09366c13ba738e01f833f234b160a Mon Sep 17 00:00:00 2001
+From 811ad63aeff08fb6308203989f6cc664d00a2fa9 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Wed, 28 Dec 2022 17:51:27 +0800
 Subject: [PATCH] CMakeLists.txt: disable USE_NGHTTP2
diff --git a/meta/recipes-devtools/cmake/cmake_4.2.2.bb b/meta/recipes-devtools/cmake/cmake_4.2.3.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_4.2.2.bb
rename to meta/recipes-devtools/cmake/cmake_4.2.3.bb

