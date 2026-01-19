Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27A25CCF2DB
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 10:35:00 +0000 (UTC)
Received: from esa9.hc324-48.eu.iphmx.com (esa9.hc324-48.eu.iphmx.com [207.54.69.27])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32821.1768818889505742130
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jan 2026 02:34:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=B4H33Hwq;
 spf=pass (domain: bmw.de, ip: 207.54.69.27, mailfrom: prvs=4728db818=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1768818887; x=1800354887;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=A0HXKlajX8EU4PcsyWlmxtSZIpf6samLkKiS52dPlFI=;
  b=B4H33HwqNqVAoss/UnHM0Re7mYmVmpJSL6uNoXKc66Ge/rcTnl/V1yTq
   jJP4bOxFreMI2ErL5ZwhmTa7P75EgZKDR8mBJ1YgVp9e5elJeSsvTkN2M
   P6HRkDDDxsv2uOF2hW/i4lOptYbKpf0nvY/S3yYHqqF+QtDWUaVghErCL
   M=;
X-CSE-ConnectionGUID: FRF/gs5xRh2+HvsS+xbTgQ==
X-CSE-MsgGUID: oyDkwvqiTUGW9WgHj89yQg==
Received: from esagw4.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
 esa9.hc324-48.eu.iphmx.com with ESMTP/TLS; 19 Jan 2026 11:34:45 +0100
Received: from unknown (HELO esabb1.muc) ([10.31.187.132]) by esagw4.muc with
 ESMTP/TLS; 19 Jan 2026 11:34:47 +0100
Received: from smucmp17c.bmwgroup.net (HELO smucmp17c.europe.bmw.corp)
 ([10.30.13.153]) by esabb1.muc with ESMTP/TLS; 19 Jan 2026 11:34:47 +0100
Received: from smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44) by
 smucmp17c.europe.bmw.corp (2a03:1e80:a15:58f::1:46) with Microsoft SMTP
 Server (version=TLS; Mon, 19 Jan 2026 11:34:46 +0100
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.211) by
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44) with Microsoft SMTP
 Server (version=TLS; Mon, 19 Jan 2026 11:34:46 +0100
X-CSE-ConnectionGUID: vDK7JYAsSouZ26AhW2Fgrw==
X-CSE-MsgGUID: OrwB9Cl8TheLip5bsCC2Xg==
X-CSE-ConnectionGUID: s/Ad1qykRM6dfpXTbAmPaQ==
X-CSE-MsgGUID: xhSk+n63RtabNxTnibXA3Q==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>
Subject: [PATCH] createrepo-c: upgrade 1.2.1 -> 1.2.2
Date: Mon, 19 Jan 2026 11:34:25 +0100
Message-ID: <20260119103425.137973-1-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp15c.europe.bmw.corp (2a03:1e80:a15:58f::1:49) To
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 10:35:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229603

Full list of changes in this release is available at [0].

[0]: https://github.com/rpm-software-management/createrepo_c/releases/tag/1.2.2

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
---
 .../0001-Fix-libname-of-Libs.private.patch    |  22 --
 .../0001-include-rpm-rpmstring.h.patch        |  29 ---
 ...ED_TARGET-for-3rd-party-dependencies.patch | 226 ------------------
 ...-imported-targets-of-turned-off-depe.patch |  53 ----
 ...ds-without-Doxygen-being-present-wit.patch |  50 ----
 ...erepo-c_1.2.1.bb => createrepo-c_1.2.2.bb} |   9 +-
 6 files changed, 2 insertions(+), 387 deletions(-)
 delete mode 100644 meta/recipes-devtools/createrepo-c/createrepo-c/0001-Fix-libname-of-Libs.private.patch
 delete mode 100644 meta/recipes-devtools/createrepo-c/createrepo-c/0001-include-rpm-rpmstring.h.patch
 delete mode 100644 meta/recipes-devtools/createrepo-c/createrepo-c/0002-Use-IMPORTED_TARGET-for-3rd-party-dependencies.patch
 delete mode 100644 meta/recipes-devtools/createrepo-c/createrepo-c/0003-Don-t-try-to-use-imported-targets-of-turned-off-depe.patch
 delete mode 100644 meta/recipes-devtools/createrepo-c/createrepo-c/0004-cmake-Allow-builds-without-Doxygen-being-present-wit.patch
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_1.2.1.bb => createrepo-c_1.2.2.bb} (78%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Fix-libname-of-Libs.private.patch b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Fix-libname-of-Libs.private.patch
deleted file mode 100644
index ceccbda9d63181505cc9d73346babb71e0d3017d..0000000000000000000000000000000000000000
--- a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Fix-libname-of-Libs.private.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-From 122963c764b06a4b487b32d4d1da330bd83da4d8 Mon Sep 17 00:00:00 2001
-From: fundawang <fundawang@yeah.net>
-Date: Mon, 17 Mar 2025 19:05:08 +0800
-Subject: [PATCH] Fix libname of Libs.private
-
-Upstream-Status: Backport [1c712194e604f6dd4f8a881e09d8236d4f770b67]
-Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
----
- src/createrepo_c.pc.cmake | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/createrepo_c.pc.cmake b/src/createrepo_c.pc.cmake
-index 466487e2f490db28576611924e3d9ac94a99cb51..b7eb66318781b01f2b1348ab2c9dbd24d9a5c32f 100644
---- a/src/createrepo_c.pc.cmake
-+++ b/src/createrepo_c.pc.cmake
-@@ -8,5 +8,5 @@ Version: @VERSION@
- Requires: glib-2.0 rpm libcurl sqlite3
- Requires.private: zlib libxml-2.0
- Libs: -L${libdir} -lcreaterepo_c
--Libs.private: -lbz2 -lzma
-+Libs.private: -lbz2 -llzma
- Cflags: -I${includedir}
diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-include-rpm-rpmstring.h.patch b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-include-rpm-rpmstring.h.patch
deleted file mode 100644
index 4f2f780a6417f91c7c7eaed65e45d4eca45f6694..0000000000000000000000000000000000000000
--- a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-include-rpm-rpmstring.h.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From aa508662cfa48f706bf68ace55ed311a9e820d3f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 13 Jan 2023 13:21:51 -0800
-Subject: [PATCH] include rpm/rpmstring.h
-
-Its needed for rasprintf declaration
-
-Fixes
-src/xml_file.c:341:36: error: call to undeclared functi
-on 'rasprintf'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
-
-Upstream-Status: Submitted [https://github.com/rpm-software-management/createrepo_c/pull/340]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/xml_file.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/xml_file.c b/src/xml_file.c
-index 44b38f9..de5176b 100644
---- a/src/xml_file.c
-+++ b/src/xml_file.c
-@@ -19,6 +19,7 @@
- 
- #include <glib.h>
- #include <glib/gstdio.h>
-+#include <rpm/rpmstring.h>
- #include <assert.h>
- #include <rpm/rpmstring.h>
- #include "xml_file.h"
diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c/0002-Use-IMPORTED_TARGET-for-3rd-party-dependencies.patch b/meta/recipes-devtools/createrepo-c/createrepo-c/0002-Use-IMPORTED_TARGET-for-3rd-party-dependencies.patch
deleted file mode 100644
index da50d27a762b991d85b05005b3e1cf69f86ce604..0000000000000000000000000000000000000000
--- a/meta/recipes-devtools/createrepo-c/createrepo-c/0002-Use-IMPORTED_TARGET-for-3rd-party-dependencies.patch
+++ /dev/null
@@ -1,226 +0,0 @@
-From 545532ec468d0dc768fee8a5e83153440509b273 Mon Sep 17 00:00:00 2001
-From: Pietro Cerutti <gahr@gahr.ch>
-Date: Tue, 1 Oct 2024 12:10:40 +0000
-Subject: [PATCH] Use IMPORTED_TARGET for 3rd-party dependencies
-
-The current CMakeLists.txt fails to include the required link directories for 3rd-party packages.
-As an example, on FreeBSD where packages are installed under /usr/local, the link lines include -lgio-2.0 but not -L/usr/local/lib.
-
-The suggested solution is to use the IMPORTED_TARGET mode of pkg_check_modules. This requires CMake 3.6, so I have bumped the minimum required version.
-
-Upstream-Status: Backport [89fa02828cdaf1c710c38bde5fcbcf59538a9cce]
-Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
----
- CMakeLists.txt       | 22 +++++++++++-----------
- src/CMakeLists.txt   | 36 ++++++++++++++++++------------------
- tests/CMakeLists.txt | 30 +++++++++++++++---------------
- 3 files changed, 44 insertions(+), 44 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 9a18393f526a4eb74a53d5bddc84f75afcf0499c..c4bf525200ba24eb69ad08feb68b30f065bdac22 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,4 +1,4 @@
--CMAKE_MINIMUM_REQUIRED (VERSION 2.8.12)
-+CMAKE_MINIMUM_REQUIRED (VERSION 3.7)
- PROJECT (createrepo_c C)
-
- include(GNUInstallDirs)
-@@ -39,13 +39,13 @@ find_package(LibXml2 REQUIRED)
- find_package(OpenSSL REQUIRED)
- find_package(ZLIB REQUIRED)
-
--pkg_check_modules(GLIB2 REQUIRED glib-2.0)
--pkg_check_modules(GIO REQUIRED gio-2.0)
--pkg_check_modules(GTHREAD2 REQUIRED gthread-2.0)
--pkg_check_modules(LZMA REQUIRED liblzma)
--pkg_check_modules(SQLITE3 REQUIRED sqlite3>=3.6.18)
--pkg_check_modules(RPM REQUIRED rpm)
--pkg_check_modules(ZSTD REQUIRED libzstd)
-+pkg_check_modules(GLIB2 REQUIRED IMPORTED_TARGET glib-2.0)
-+pkg_check_modules(GIO REQUIRED IMPORTED_TARGET gio-2.0)
-+pkg_check_modules(GTHREAD2 REQUIRED IMPORTED_TARGET gthread-2.0)
-+pkg_check_modules(LZMA REQUIRED IMPORTED_TARGET liblzma)
-+pkg_check_modules(SQLITE3 REQUIRED IMPORTED_TARGET sqlite3>=3.6.18)
-+pkg_check_modules(RPM REQUIRED IMPORTED_TARGET rpm)
-+pkg_check_modules(ZSTD REQUIRED IMPORTED_TARGET libzstd)
-
- # Add include dirs
-
-@@ -73,7 +73,7 @@ ENDIF (WITH_LEGACY_HASHES)
- # drpm
- OPTION (ENABLE_DRPM "Enable delta RPM support?" OFF)
- IF (ENABLE_DRPM)
--    pkg_check_modules(DRPM REQUIRED drpm>=0.4.0)
-+    pkg_check_modules(DRPM REQUIRED IMPORTED_TARGET drpm>=0.4.0)
-     include_directories (${DRPM_INCLUDE_DIRS})
-     ADD_DEFINITIONS("-DCR_DELTA_RPM_SUPPORT")
- ENDIF (ENABLE_DRPM)
-@@ -83,7 +83,7 @@ OPTION (ENABLE_PYTHON "Enable python support?" ON)
-
- OPTION (WITH_ZCHUNK "Build with zchunk support" ON)
- IF (WITH_ZCHUNK)
--    pkg_check_modules(ZCK REQUIRED zck)
-+    pkg_check_modules(ZCK REQUIRED IMPORTED_TARGET zck)
-     include_directories(${ZCK_INCLUDE_DIRS})
-     SET (CMAKE_C_FLAGS          "${CMAKE_C_FLAGS} -DWITH_ZCHUNK")
-     SET (CMAKE_C_FLAGS_DEBUG    "${CMAKE_C_FLAGS_DEBUG} -DWITH_ZCHUNK")
-@@ -91,7 +91,7 @@ ENDIF (WITH_ZCHUNK)
-
- OPTION (WITH_LIBMODULEMD "Build with libmodulemd support" ON)
- IF (WITH_LIBMODULEMD)
--    pkg_check_modules(LIBMODULEMD REQUIRED modulemd-2.0)
-+    pkg_check_modules(LIBMODULEMD REQUIRED IMPORTED_TARGET modulemd-2.0)
-     include_directories(${LIBMODULEMD_INCLUDE_DIRS})
-     SET (CMAKE_C_FLAGS          "${CMAKE_C_FLAGS} -DWITH_LIBMODULEMD")
-     SET (CMAKE_C_FLAGS_DEBUG    "${CMAKE_C_FLAGS_DEBUG} -DWITH_LIBMODULEMD")
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index 61b048044392b4204984af8969c3b1d74a9b8094..5309050bdadf6a14d9cddf4529d309ef97cc6d2c 100644
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -86,18 +86,18 @@ ENDIF ()
- ADD_LIBRARY(libcreaterepo_c ${createrepo_c_library_type} ${createrepo_c_SRCS})
- TARGET_LINK_LIBRARIES(libcreaterepo_c ${BZIP2_LIBRARIES})
- TARGET_LINK_LIBRARIES(libcreaterepo_c ${CURL_LIBRARY})
--TARGET_LINK_LIBRARIES(libcreaterepo_c ${GLIB2_LIBRARIES})
--TARGET_LINK_LIBRARIES(libcreaterepo_c ${GIO_LIBRARIES})
--TARGET_LINK_LIBRARIES(libcreaterepo_c ${LIBMODULEMD_LIBRARIES})
-+TARGET_LINK_LIBRARIES(libcreaterepo_c PkgConfig::GLIB2)
-+TARGET_LINK_LIBRARIES(libcreaterepo_c PkgConfig::GIO)
-+TARGET_LINK_LIBRARIES(libcreaterepo_c PkgConfig::LIBMODULEMD)
- TARGET_LINK_LIBRARIES(libcreaterepo_c ${LIBXML2_LIBRARIES})
--TARGET_LINK_LIBRARIES(libcreaterepo_c ${LZMA_LIBRARIES})
-+TARGET_LINK_LIBRARIES(libcreaterepo_c PkgConfig::LZMA)
- TARGET_LINK_LIBRARIES(libcreaterepo_c ${OPENSSL_LIBRARIES})
--TARGET_LINK_LIBRARIES(libcreaterepo_c ${RPM_LIBRARIES})
--TARGET_LINK_LIBRARIES(libcreaterepo_c ${SQLITE3_LIBRARIES})
-+TARGET_LINK_LIBRARIES(libcreaterepo_c PkgConfig::RPM)
-+TARGET_LINK_LIBRARIES(libcreaterepo_c PkgConfig::SQLITE3)
- TARGET_LINK_LIBRARIES(libcreaterepo_c ${ZLIB_LIBRARY})
--TARGET_LINK_LIBRARIES(libcreaterepo_c ${ZCK_LIBRARIES})
--TARGET_LINK_LIBRARIES(libcreaterepo_c ${DRPM_LIBRARIES})
--TARGET_LINK_LIBRARIES(libcreaterepo_c ${ZSTD_LIBRARIES})
-+TARGET_LINK_LIBRARIES(libcreaterepo_c PkgConfig::ZCK)
-+TARGET_LINK_LIBRARIES(libcreaterepo_c PkgConfig::DRPM)
-+TARGET_LINK_LIBRARIES(libcreaterepo_c PkgConfig::ZSTD)
-
- SET_TARGET_PROPERTIES(libcreaterepo_c PROPERTIES
-                       OUTPUT_NAME "createrepo_c"
-@@ -108,27 +108,27 @@ SET_TARGET_PROPERTIES(libcreaterepo_c PROPERTIES
- ADD_EXECUTABLE(createrepo_c createrepo_c.c cmd_parser.c)
- TARGET_LINK_LIBRARIES(createrepo_c
-                         libcreaterepo_c
--                        ${GLIB2_LIBRARIES}
--                        ${GTHREAD2_LIBRARIES})
-+                        PkgConfig::GLIB2
-+                        PkgConfig::GTHREAD2)
-
- ADD_EXECUTABLE(mergerepo_c mergerepo_c.c)
- TARGET_LINK_LIBRARIES(mergerepo_c
-                         libcreaterepo_c
--                        ${GLIB2_LIBRARIES}
--                        ${GTHREAD2_LIBRARIES}
--                        ${LIBMODULEMD_LIBRARIES})
-+                        PkgConfig::GLIB2
-+                        PkgConfig::GTHREAD2
-+                        PkgConfig::LIBMODULEMD)
-
- ADD_EXECUTABLE(modifyrepo_c modifyrepo_c.c)
- TARGET_LINK_LIBRARIES(modifyrepo_c
-                         libcreaterepo_c
--                        ${GLIB2_LIBRARIES}
--                        ${GTHREAD2_LIBRARIES})
-+                        PkgConfig::GLIB2
-+                        PkgConfig::GTHREAD2)
-
- ADD_EXECUTABLE(sqliterepo_c sqliterepo_c.c)
- TARGET_LINK_LIBRARIES(sqliterepo_c
-                         libcreaterepo_c
--                        ${GLIB2_LIBRARIES}
--                        ${GTHREAD2_LIBRARIES})
-+                        PkgConfig::GLIB2
-+                        PkgConfig::GTHREAD2)
-
- CONFIGURE_FILE("createrepo_c.pc.cmake" "${CMAKE_SOURCE_DIR}/src/createrepo_c.pc" @ONLY)
- CONFIGURE_FILE("version.h.in" "${CMAKE_CURRENT_SOURCE_DIR}/version.h" @ONLY)
-diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
-index 4ffe837edb64153a7261d19dbaf67aceac4b5746..37339ad75190827a8e501de64dbf929f9aee4cd4 100644
---- a/tests/CMakeLists.txt
-+++ b/tests/CMakeLists.txt
-@@ -1,61 +1,61 @@
- ADD_EXECUTABLE(test_checksum test_checksum.c)
--TARGET_LINK_LIBRARIES(test_checksum libcreaterepo_c ${GLIB2_LIBRARIES})
-+TARGET_LINK_LIBRARIES(test_checksum libcreaterepo_c PkgConfig::GLIB2)
- ADD_DEPENDENCIES(tests test_checksum)
-
- ADD_EXECUTABLE(test_compression_wrapper test_compression_wrapper.c)
--TARGET_LINK_LIBRARIES(test_compression_wrapper libcreaterepo_c ${GLIB2_LIBRARIES})
-+TARGET_LINK_LIBRARIES(test_compression_wrapper libcreaterepo_c PkgConfig::GLIB2)
- ADD_DEPENDENCIES(tests test_compression_wrapper)
-
- ADD_EXECUTABLE(test_load_metadata test_load_metadata.c)
--TARGET_LINK_LIBRARIES(test_load_metadata libcreaterepo_c ${GLIB2_LIBRARIES})
-+TARGET_LINK_LIBRARIES(test_load_metadata libcreaterepo_c PkgConfig::GLIB2)
- ADD_DEPENDENCIES(tests test_load_metadata)
-
- ADD_EXECUTABLE(test_locate_metadata test_locate_metadata.c)
--TARGET_LINK_LIBRARIES(test_locate_metadata libcreaterepo_c ${GLIB2_LIBRARIES})
-+TARGET_LINK_LIBRARIES(test_locate_metadata libcreaterepo_c PkgConfig::GLIB2)
- ADD_DEPENDENCIES(tests test_locate_metadata)
-
- ADD_EXECUTABLE(test_misc test_misc.c)
--TARGET_LINK_LIBRARIES(test_misc libcreaterepo_c ${GLIB2_LIBRARIES})
-+TARGET_LINK_LIBRARIES(test_misc libcreaterepo_c PkgConfig::GLIB2)
- ADD_DEPENDENCIES(tests test_misc)
-
- ADD_EXECUTABLE(test_sqlite test_sqlite.c)
--TARGET_LINK_LIBRARIES(test_sqlite libcreaterepo_c ${GLIB2_LIBRARIES})
-+TARGET_LINK_LIBRARIES(test_sqlite libcreaterepo_c PkgConfig::GLIB2)
- ADD_DEPENDENCIES(tests test_sqlite)
-
- ADD_EXECUTABLE(test_xml_file test_xml_file.c)
--TARGET_LINK_LIBRARIES(test_xml_file libcreaterepo_c ${GLIB2_LIBRARIES})
-+TARGET_LINK_LIBRARIES(test_xml_file libcreaterepo_c PkgConfig::GLIB2)
- ADD_DEPENDENCIES(tests test_xml_file)
-
- ADD_EXECUTABLE(test_xml_parser_filelists test_xml_parser_filelists.c)
--TARGET_LINK_LIBRARIES(test_xml_parser_filelists libcreaterepo_c ${GLIB2_LIBRARIES})
-+TARGET_LINK_LIBRARIES(test_xml_parser_filelists libcreaterepo_c PkgConfig::GLIB2)
- ADD_DEPENDENCIES(tests test_xml_parser_filelists)
-
- ADD_EXECUTABLE(test_xml_parser_repomd test_xml_parser_repomd.c)
--TARGET_LINK_LIBRARIES(test_xml_parser_repomd libcreaterepo_c ${GLIB2_LIBRARIES})
-+TARGET_LINK_LIBRARIES(test_xml_parser_repomd libcreaterepo_c PkgConfig::GLIB2)
- ADD_DEPENDENCIES(tests test_xml_parser_repomd)
-
- ADD_EXECUTABLE(test_xml_parser_updateinfo test_xml_parser_updateinfo.c)
--TARGET_LINK_LIBRARIES(test_xml_parser_updateinfo libcreaterepo_c ${GLIB2_LIBRARIES})
-+TARGET_LINK_LIBRARIES(test_xml_parser_updateinfo libcreaterepo_c PkgConfig::GLIB2)
- ADD_DEPENDENCIES(tests test_xml_parser_updateinfo)
-
- ADD_EXECUTABLE(test_xml_parser_main_metadata_together test_xml_parser_main_metadata_together.c)
--TARGET_LINK_LIBRARIES(test_xml_parser_main_metadata_together libcreaterepo_c ${GLIB2_LIBRARIES})
-+TARGET_LINK_LIBRARIES(test_xml_parser_main_metadata_together libcreaterepo_c PkgConfig::GLIB2)
- ADD_DEPENDENCIES(tests test_xml_parser_main_metadata_together)
-
- ADD_EXECUTABLE(test_xml_dump test_xml_dump.c)
--TARGET_LINK_LIBRARIES(test_xml_dump libcreaterepo_c ${GLIB2_LIBRARIES})
-+TARGET_LINK_LIBRARIES(test_xml_dump libcreaterepo_c PkgConfig::GLIB2)
- ADD_DEPENDENCIES(tests test_xml_dump)
-
- ADD_EXECUTABLE(test_xml_dump_primary test_xml_dump_primary.c)
--TARGET_LINK_LIBRARIES(test_xml_dump_primary libcreaterepo_c ${GLIB2_LIBRARIES})
-+TARGET_LINK_LIBRARIES(test_xml_dump_primary libcreaterepo_c PkgConfig::GLIB2)
- ADD_DEPENDENCIES(tests test_xml_dump_primary)
-
- ADD_EXECUTABLE(test_koji test_koji.c)
--TARGET_LINK_LIBRARIES(test_koji libcreaterepo_c ${GLIB2_LIBRARIES})
-+TARGET_LINK_LIBRARIES(test_koji libcreaterepo_c PkgConfig::GLIB2)
- ADD_DEPENDENCIES(tests test_koji)
-
- ADD_EXECUTABLE(test_modifyrepo_shared test_modifyrepo_shared.c)
--TARGET_LINK_LIBRARIES(test_modifyrepo_shared libcreaterepo_c ${GLIB2_LIBRARIES})
-+TARGET_LINK_LIBRARIES(test_modifyrepo_shared libcreaterepo_c PkgConfig::GLIB2)
- ADD_DEPENDENCIES(tests test_modifyrepo_shared)
-
- CONFIGURE_FILE("run_tests.sh.in"  "${CMAKE_BINARY_DIR}/tests/run_tests.sh")
diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c/0003-Don-t-try-to-use-imported-targets-of-turned-off-depe.patch b/meta/recipes-devtools/createrepo-c/createrepo-c/0003-Don-t-try-to-use-imported-targets-of-turned-off-depe.patch
deleted file mode 100644
index 769976694ef21e807e51d117da3dc1c3ee678e34..0000000000000000000000000000000000000000
--- a/meta/recipes-devtools/createrepo-c/createrepo-c/0003-Don-t-try-to-use-imported-targets-of-turned-off-depe.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From cfd899731f40695e9fd362dc64098e27636808fe Mon Sep 17 00:00:00 2001
-From: Pietro Cerutti <gahr@gahr.ch>
-Date: Mon, 14 Oct 2024 11:49:42 +0000
-Subject: [PATCH] Don't try to use imported targets of turned-off dependencies
-
-Upstream-Status: Backport [0a2da7c87ae9b7e3e11e77416a8e75633d4608a0]
-Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
----
- src/CMakeLists.txt | 18 +++++++++++++-----
- 1 file changed, 13 insertions(+), 5 deletions(-)
-
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index 5309050bdadf6a14d9cddf4529d309ef97cc6d2c..9444875ff1a2fd2ce0ccc678e121ea54ce0d1b83 100644
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -88,15 +88,21 @@ TARGET_LINK_LIBRARIES(libcreaterepo_c ${BZIP2_LIBRARIES})
- TARGET_LINK_LIBRARIES(libcreaterepo_c ${CURL_LIBRARY})
- TARGET_LINK_LIBRARIES(libcreaterepo_c PkgConfig::GLIB2)
- TARGET_LINK_LIBRARIES(libcreaterepo_c PkgConfig::GIO)
--TARGET_LINK_LIBRARIES(libcreaterepo_c PkgConfig::LIBMODULEMD)
-+IF (WITH_LIBMODULEMD)
-+    TARGET_LINK_LIBRARIES(libcreaterepo_c PkgConfig::LIBMODULEMD)
-+ENDIF (WITH_LIBMODULEMD)
- TARGET_LINK_LIBRARIES(libcreaterepo_c ${LIBXML2_LIBRARIES})
- TARGET_LINK_LIBRARIES(libcreaterepo_c PkgConfig::LZMA)
- TARGET_LINK_LIBRARIES(libcreaterepo_c ${OPENSSL_LIBRARIES})
- TARGET_LINK_LIBRARIES(libcreaterepo_c PkgConfig::RPM)
- TARGET_LINK_LIBRARIES(libcreaterepo_c PkgConfig::SQLITE3)
- TARGET_LINK_LIBRARIES(libcreaterepo_c ${ZLIB_LIBRARY})
--TARGET_LINK_LIBRARIES(libcreaterepo_c PkgConfig::ZCK)
--TARGET_LINK_LIBRARIES(libcreaterepo_c PkgConfig::DRPM)
-+IF (WITH_ZCHUNK)
-+    TARGET_LINK_LIBRARIES(libcreaterepo_c PkgConfig::ZCK)
-+ENDIF (WITH_ZCHUNK)
-+IF (ENABLE_DRPM)
-+    TARGET_LINK_LIBRARIES(libcreaterepo_c PkgConfig::DRPM)
-+ENDIF (ENABLE_DRPM)
- TARGET_LINK_LIBRARIES(libcreaterepo_c PkgConfig::ZSTD)
-
- SET_TARGET_PROPERTIES(libcreaterepo_c PROPERTIES
-@@ -115,8 +121,10 @@ ADD_EXECUTABLE(mergerepo_c mergerepo_c.c)
- TARGET_LINK_LIBRARIES(mergerepo_c
-                         libcreaterepo_c
-                         PkgConfig::GLIB2
--                        PkgConfig::GTHREAD2
--                        PkgConfig::LIBMODULEMD)
-+                        PkgConfig::GTHREAD2)
-+IF (WITH_LIBMODULEMD)
-+    TARGET_LINK_LIBRARIES(mergerepo_c PkgConfig::LIBMODULEMD)
-+ENDIF (WITH_LIBMODULEMD)
-
- ADD_EXECUTABLE(modifyrepo_c modifyrepo_c.c)
- TARGET_LINK_LIBRARIES(modifyrepo_c
diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c/0004-cmake-Allow-builds-without-Doxygen-being-present-wit.patch b/meta/recipes-devtools/createrepo-c/createrepo-c/0004-cmake-Allow-builds-without-Doxygen-being-present-wit.patch
deleted file mode 100644
index acf888e7ba4e674be0b5a8ba228f63a5b36d78b2..0000000000000000000000000000000000000000
--- a/meta/recipes-devtools/createrepo-c/createrepo-c/0004-cmake-Allow-builds-without-Doxygen-being-present-wit.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 90f39874bd122ca9e966f32c01e43e922031018e Mon Sep 17 00:00:00 2001
-From: Moritz Haase <Moritz.Haase@bmw.de>
-Date: Mon, 23 Jun 2025 09:21:07 +0200
-Subject: [PATCH] cmake: Allow builds without Doxygen being present with CMake
- 4+
-
-With CMake 4+, the initial CMake run fails with
-
-    CMake Error at doc/CMakeLists.txt:18 (ADD_DEPENDENCIES):
-      The dependency target "doc-c" of target "doc" does not exist.
-
-in case Doxygen is not installed on the system, since non-existent dependencies
-are not ignored anymore (see [0]). Rectify that by making sure that we only add
-the dependency in case Doxygen has been found.
-
-[0]: https://cmake.org/cmake/help/latest/policy/CMP0046.html
-
-Upstream-Status: Backport [908e3a4a5909ab107da41c2631a06c6b23617f3c]
-Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
----
- doc/CMakeLists.txt | 7 ++++---
- 1 file changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/doc/CMakeLists.txt b/doc/CMakeLists.txt
-index 6b2ef5e0593757c7b977cd5d228b7774b4f45641..6332b91260ff87f16e331071e652bfe0b167f518 100644
---- a/doc/CMakeLists.txt
-+++ b/doc/CMakeLists.txt
-@@ -1,11 +1,15 @@
- ADD_SUBDIRECTORY (python)
-
-+ADD_CUSTOM_TARGET (doc)
-+ADD_DEPENDENCIES (doc doc-python)
-+
- find_package(Doxygen)
- if(DOXYGEN_FOUND)
-     CONFIGURE_FILE("Doxyfile.in.in" "${CMAKE_CURRENT_BINARY_DIR}/Doxyfile.in" @ONLY)
-     add_custom_target(doc-c
-         ${DOXYGEN_EXECUTABLE} ${CMAKE_CURRENT_BINARY_DIR}/Doxyfile.in
-         COMMENT "Building C API documentation with Doxygen" VERBATIM)
-+    ADD_DEPENDENCIES (doc doc-c)
- endif(DOXYGEN_FOUND)
-
- IF(CREATEREPO_C_INSTALL_MANPAGES)
-@@ -13,6 +17,3 @@ IF(CREATEREPO_C_INSTALL_MANPAGES)
-             DESTINATION "${CMAKE_INSTALL_MANDIR}/man8"
-             COMPONENT bin)
- ENDIF(CREATEREPO_C_INSTALL_MANPAGES)
--
--ADD_CUSTOM_TARGET (doc)
--ADD_DEPENDENCIES (doc doc-python doc-c)
diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.1.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.2.bb
similarity index 78%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_1.2.1.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_1.2.2.bb
index ecd43b0c0b331010e1c831f03299b1c4f3472c92..1dd5165260718aea987b7947bdfbbd9490b53273 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.1.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.2.bb
@@ -6,21 +6,16 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/rpm-software-management/createrepo_c;branch=master;protocol=https;tag=${PV} \
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
-           file://0001-include-rpm-rpmstring.h.patch \
-           file://0001-Fix-libname-of-Libs.private.patch \
-           file://0002-Use-IMPORTED_TARGET-for-3rd-party-dependencies.patch \
-           file://0003-Don-t-try-to-use-imported-targets-of-turned-off-depe.patch \
-           file://0004-cmake-Allow-builds-without-Doxygen-being-present-wit.patch \
            "
 
-SRCREV = "8c6e6f88df86d1e34ca26d3835d77a2816326414"
+SRCREV = "46b86c9b14bd724cb6bec0bfa81a7b179847f3db"
 
 DEPENDS = "expat curl glib-2.0 libxml2 openssl bzip2 zlib file sqlite3 xz rpm"
 DEPENDS:append:class-native = " file-replacement-native"
 
 inherit cmake pkgconfig bash-completion setuptools3-base
 
-EXTRA_OECMAKE = " -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -DPYTHON_DESIRED=3 -DWITH_ZCHUNK=OFF -DENABLE_DRPM=OFF -DWITH_LIBMODULEMD=OFF"
+EXTRA_OECMAKE = " -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -DPYTHON_DESIRED=3 -DWITH_ZCHUNK=OFF -DENABLE_DRPM=OFF -DWITH_LIBMODULEMD=OFF -DBUILD_DOC_C=OFF"
 
 BBCLASSEXTEND = "native nativesdk"
 

