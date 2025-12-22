Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5C3FE6748D
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 11:11:10 +0000 (UTC)
Received: from esa14.hc324-48.eu.iphmx.com (esa14.hc324-48.eu.iphmx.com [207.54.69.24])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.78212.1766401865304832033
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 03:11:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=OPeGF4K4;
 spf=pass (domain: bmw.de, ip: 207.54.69.24, mailfrom: prvs=44487fec1=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1766401864; x=1797937864;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+9Sf0NywSXyLO9Vp5wmlgTP+IPOubIJhzVCoLlJDq5E=;
  b=OPeGF4K4W8MTqjQuw7qe02hdQAB12NoImeyck4eU33jGVzOOo6Gi6M/g
   htmMQxRZ9OeTn7ovpko/OUy8lHCYyO+yIUWQlhpS/cOGZQBjbxLurl7lq
   HagJRlAhJjszvj45t3yqBmXsgCrzmOJ/p7oE1g7tnOTt+udIR38ahitwe
   Y=;
X-CSE-ConnectionGUID: KtF+SAS0QlSmi4OHF+dMKA==
X-CSE-MsgGUID: SfnLEJEhQ+S9iP5t6QEREQ==
Received: from esagw6.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
 esa14.hc324-48.eu.iphmx.com with ESMTP/TLS; 22 Dec 2025 12:11:02 +0100
Received: from unknown (HELO esabb4.muc) ([10.31.187.135]) by esagw6.muc with
 ESMTP/TLS; 22 Dec 2025 12:11:02 +0100
Received: from smucmp17e.bmwgroup.net (HELO smucmp17e.europe.bmw.corp)
 ([10.30.13.155]) by esabb4.muc with ESMTP/TLS; 22 Dec 2025 12:11:03 +0100
Received: from smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44) by
 smucmp17e.europe.bmw.corp (2a03:1e80:a15:58f::1:155) with Microsoft SMTP
 Server (version=TLS; Mon, 22 Dec 2025 12:11:03 +0100
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.210) by
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44) with Microsoft SMTP
 Server (version=TLS; Mon, 22 Dec 2025 12:11:02 +0100
X-CSE-ConnectionGUID: ZqgpurydQxC4ABv106d3+w==
X-CSE-MsgGUID: pg3H5qd5TbykoWeii31d3A==
X-CSE-ConnectionGUID: RLF+SfYeSPmiCcz8yb+urA==
X-CSE-MsgGUID: gCGViJnLRVScrlYiaZIrVQ==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>
Subject: [PATCH] cmake: upgrade 4.2.0 -> 4.2.1
Date: Mon, 22 Dec 2025 12:10:39 +0100
Message-ID: <20251222111039.629559-1-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp15d.europe.bmw.corp (2a03:1e80:a15:58f::1:62) To
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 11:11:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228294

Release notes are available at [0].

[0]: https://cmake.org/cmake/help/v4.2/release/4.2.html#id1

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>

---

Based on patch prepared by AUH at [1].

[1]: https://lists.openembedded.org/g/openembedded-core/message/227765
---
 .../cmake/{cmake-native_4.2.0.bb => cmake-native_4.2.1.bb}  | 0
 meta/recipes-devtools/cmake/cmake.inc                       | 2 +-
 ...isable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal.patch | 6 +++---
 .../cmake/0002-CMakeLists.txt-disable-USE_NGHTTP2.patch     | 6 +++---
 .../cmake/{cmake_4.2.0.bb => cmake_4.2.1.bb}                | 0
 5 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_4.2.0.bb => cmake-native_4.2.1.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_4.2.0.bb => cmake_4.2.1.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_4.2.0.bb b/meta/recipes-devtools/cmake/cmake-native_4.2.1.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_4.2.0.bb
rename to meta/recipes-devtools/cmake/cmake-native_4.2.1.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 0dcc5c3f55..d120638b1b 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            "
 
-SRC_URI[sha256sum] = "4104e94657d247c811cb29985405a360b78130b5d51e7f6daceb2447830bd579"
+SRC_URI[sha256sum] = "414aacfac54ba0e78e64a018720b64ed6bfca14b587047b8b3489f407a14a070"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake/0001-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal.patch b/meta/recipes-devtools/cmake/cmake/0001-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal.patch
index f31dce5644..0d2de28d5b 100644
--- a/meta/recipes-devtools/cmake/cmake/0001-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal.patch
+++ b/meta/recipes-devtools/cmake/cmake/0001-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal.patch
@@ -1,4 +1,4 @@
-From cf8210696ebbaff14612d845bc98fac447c0e6f5 Mon Sep 17 00:00:00 2001
+From 3d87f9fd1071e548cf9a6718c4ade0bfde812c30 Mon Sep 17 00:00:00 2001
 From: Otavio Salvador <otavio@ossystems.com.br>
 Date: Thu, 5 Jul 2018 10:28:04 -0300
 Subject: [PATCH] Disable use of ext2fs/ext2_fs.h by cmake's internal
@@ -18,10 +18,10 @@ Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
  1 file changed, 2 insertions(+), 6 deletions(-)
 
 diff --git a/Utilities/cmlibarchive/CMakeLists.txt b/Utilities/cmlibarchive/CMakeLists.txt
-index 04d986b6ea7d8dc0bd7e909d4e7b4e73c9e35437..014fe78063f7d30c9a4970b7cf3aeeaeb36bcdbc 100644
+index 9957052d..71a7aeb5 100644
 --- a/Utilities/cmlibarchive/CMakeLists.txt
 +++ b/Utilities/cmlibarchive/CMakeLists.txt
-@@ -745,12 +745,8 @@ LA_CHECK_INCLUDE_FILE("copyfile.h" HAVE_COPYFILE_H)
+@@ -734,12 +734,8 @@ LA_CHECK_INCLUDE_FILE("copyfile.h" HAVE_COPYFILE_H)
  LA_CHECK_INCLUDE_FILE("direct.h" HAVE_DIRECT_H)
  LA_CHECK_INCLUDE_FILE("dlfcn.h" HAVE_DLFCN_H)
  LA_CHECK_INCLUDE_FILE("errno.h" HAVE_ERRNO_H)
diff --git a/meta/recipes-devtools/cmake/cmake/0002-CMakeLists.txt-disable-USE_NGHTTP2.patch b/meta/recipes-devtools/cmake/cmake/0002-CMakeLists.txt-disable-USE_NGHTTP2.patch
index 158eea2c3e..f6b6cfcf41 100644
--- a/meta/recipes-devtools/cmake/cmake/0002-CMakeLists.txt-disable-USE_NGHTTP2.patch
+++ b/meta/recipes-devtools/cmake/cmake/0002-CMakeLists.txt-disable-USE_NGHTTP2.patch
@@ -1,4 +1,4 @@
-From e0a1996a85dcb43d69d3c7daecab4da74599e5ba Mon Sep 17 00:00:00 2001
+From d4696e9d78d09366c13ba738e01f833f234b160a Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Wed, 28 Dec 2022 17:51:27 +0800
 Subject: [PATCH] CMakeLists.txt: disable USE_NGHTTP2
@@ -22,10 +22,10 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Utilities/cmcurl/CMakeLists.txt b/Utilities/cmcurl/CMakeLists.txt
-index 75b510205984894ffa11461e7aa04d3c479709b4..83463042d82d9c7f17932753f47c47b12aeec85b 100644
+index 63d3a4f5..ab5f1c50 100644
 --- a/Utilities/cmcurl/CMakeLists.txt
 +++ b/Utilities/cmcurl/CMakeLists.txt
-@@ -105,7 +105,7 @@ set(USE_ECH OFF)
+@@ -109,7 +109,7 @@ set(USE_ECH OFF)
  set(USE_HTTPSRR OFF)
  set(USE_LIBIDN2 ON)
  set(USE_LIBRTMP OFF)
diff --git a/meta/recipes-devtools/cmake/cmake_4.2.0.bb b/meta/recipes-devtools/cmake/cmake_4.2.1.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_4.2.0.bb
rename to meta/recipes-devtools/cmake/cmake_4.2.1.bb

