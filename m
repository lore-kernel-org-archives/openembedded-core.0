Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
	[209.85.167.52])
	by mail.openembedded.org (Postfix) with ESMTP id 2A1947D6F9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jun 2019 18:21:21 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id y198so6094833lfa.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jun 2019 11:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=zCG7+gZ+ppaiKamZ7sIoAE/4DnezSgcA4t5OBSUZ+kM=;
	b=PlAuCt9bFBWW7FjPLrAq/GcR7oHfGWYJdabKkNn803LrePB5zLsU7igVVEuY+l72pw
	/M9sotSZP4TFlzKj4GhNzv+/Rjvk9AEJwb65uPQN8jn5fIZypVFwf7AAuTsBZbp5bxYH
	ZiejZDB8D766DlGIav0SP+qV9+y+QvbEk+9HAt495d0Q1+dpc+Loq25D6iF6CSSR8aX+
	zY+cSn9nyN8STECLQfrq1ujxbzXEHI4A23wfDzWe4ho7s8aU0Ax9BuoMUOq/CP910jrl
	SucR53TqlJqnzoPB5KJIpTM5wgze50xwIDIxa7daWh47NupbMMWODoUW1+5Be5M+ZZ5k
	zklQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zCG7+gZ+ppaiKamZ7sIoAE/4DnezSgcA4t5OBSUZ+kM=;
	b=RFHk11Q8/2wIsc4cA0saEpm/aP2iHoUtfCgb0f3ANHq05WK7RqaYzXO7dzsAShdpAn
	16kDUmqG8nsjtmmt+kAovius5RcxRoqzRMluu19dIgkW24CKGX556RJtCRZfTscU0j3/
	J9F6uCXfRUlvVz0DWexeb4RS4ty6HaMstMj0nUwgDEgP5dZykKwQUlin48A2MbHTMpEI
	IAGEKJMBU4Tb9uDPJnmn36q/ukE7XB0XCHkyz9PVr/TviSjZFgdB4+Rx65rajNUIRzwu
	t9saoQ4DRZpCXlQm3gHhJ23OqAxBthPdpHgwPpYS2o3ZjZ872LMOvd3fOip7iUmnD6U5
	2CcQ==
X-Gm-Message-State: APjAAAWcXIQUmd521HwtxkujhSX7bSDMEcpuMHF/5wuu62VBvZmrSoWS
	ruhrC8V1/ceu/sLYSZMB23uJy0lmL3w=
X-Google-Smtp-Source: APXvYqycdLqkVYQRBBdKF6DucDsgq6R8oH1qRHLPnIfrg2Lv17rzOxEjwPR6+K0k0+RmJncJqxpZhA==
X-Received: by 2002:a19:4f50:: with SMTP id a16mr6351272lfk.24.1561832482062; 
	Sat, 29 Jun 2019 11:21:22 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	j77sm1867360ljb.55.2019.06.29.11.21.21
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 29 Jun 2019 11:21:21 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Jun 2019 20:21:19 +0200
Message-Id: <20190629182119.25690-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] libsolf: update to 0.7.5
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 29 Jun 2019 18:21:22 -0000

Removed patch was upstreamed.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../0001-build-use-GNUInstallDirs.patch       | 188 ------------------
 .../{libsolv_0.7.4.bb => libsolv_0.7.5.bb}    |   3 +-
 2 files changed, 1 insertion(+), 190 deletions(-)
 delete mode 100644 meta/recipes-extended/libsolv/libsolv/0001-build-use-GNUInstallDirs.patch
 rename meta/recipes-extended/libsolv/{libsolv_0.7.4.bb => libsolv_0.7.5.bb} (87%)

diff --git a/meta/recipes-extended/libsolv/libsolv/0001-build-use-GNUInstallDirs.patch b/meta/recipes-extended/libsolv/libsolv/0001-build-use-GNUInstallDirs.patch
deleted file mode 100644
index 75ef150052..0000000000
--- a/meta/recipes-extended/libsolv/libsolv/0001-build-use-GNUInstallDirs.patch
+++ /dev/null
@@ -1,188 +0,0 @@
-Backport a patch from upstream to use GNUInstallDirs instead of
-hand-coded path logic, so we have proper control over where files end up.
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From b6c9df4c686975ce5009d09dac706a4e83f02a31 Mon Sep 17 00:00:00 2001
-From: Igor Gnatenko <i.gnatenko.brain@gmail.com>
-Date: Mon, 2 Jul 2018 12:56:41 +0100
-Subject: [PATCH] build: use GNUInstallDirs
-
-Fixes: #128
-Signed-off-by: Igor Gnatenko <i.gnatenko.brain@gmail.com>
----
- CMakeLists.txt               | 34 +++++++---------------------------
- README                       |  2 +-
- doc/CMakeLists.txt           |  4 ++--
- examples/solv/CMakeLists.txt |  2 +-
- ext/CMakeLists.txt           |  8 ++++----
- libsolv.pc.in                |  4 ++--
- libsolvext.pc.in             |  4 ++--
- src/CMakeLists.txt           |  8 ++++----
- tools/CMakeLists.txt         |  3 +--
- 9 files changed, 24 insertions(+), 45 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 1deef57d..7e9ffa9b 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,6 +1,6 @@
- PROJECT (libsolv)
- 
--CMAKE_MINIMUM_REQUIRED (VERSION 2.4)
-+CMAKE_MINIMUM_REQUIRED (VERSION 2.8.5)
- 
- OPTION (ENABLE_STATIC "Build a static version of the libraries?" OFF)
- OPTION (DISABLE_SHARED "Do not build a shared version of the libraries?" OFF)
-@@ -38,34 +38,14 @@ OPTION (ENABLE_ZCHUNK_COMPRESSION "Build with zchunk compression support?" OFF)
- OPTION (WITH_SYSTEM_ZCHUNK "Use system zchunk library?" OFF)
- OPTION (WITH_LIBXML2  "Build with libxml2 instead of libexpat?" OFF)
- 
--# Library
--IF (DEFINED LIB)
--  SET (LIB_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}/${LIB}")
--ELSE (DEFINED  LIB)
--  IF (CMAKE_SIZEOF_VOID_P MATCHES "8")
--    SET (LIB_SUFFIX "64")
--  ENDIF (CMAKE_SIZEOF_VOID_P MATCHES "8")
--  SET (LIB_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}/lib${LIB_SUFFIX}")
--ENDIF (DEFINED  LIB)
--MESSAGE (STATUS "Libraries will be installed in ${LIB_INSTALL_DIR}")
--# Library
--IF (DEFINED INCLUDE)
--  SET (INCLUDE_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}/${INCLUDE}")
--else (DEFINED INCLUDE)
--  SET (INCLUDE_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}/include")
--ENDIF (DEFINED  INCLUDE)
--MESSAGE (STATUS "Header files will be installed in ${INCLUDE_INSTALL_DIR}")
--SET (BIN_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}/bin")
--IF (NOT MAN_INSTALL_DIR)
--SET (MAN_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}/share/man")
--IF (IS_DIRECTORY "${CMAKE_INSTALL_PREFIX}/man"  AND NOT IS_DIRECTORY "${CMAKE_INSTALL_PREFIX}/share/man")
--  SET (MAN_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}/man")
--ENDIF (IS_DIRECTORY "${CMAKE_INSTALL_PREFIX}/man"  AND NOT IS_DIRECTORY "${CMAKE_INSTALL_PREFIX}/share/man")
--ENDIF (NOT MAN_INSTALL_DIR)
--MESSAGE(STATUS "Man pages will be installed in ${MAN_INSTALL_DIR}")
-+include (GNUInstallDirs)
-+message (STATUS "Libraries will be installed in ${CMAKE_INSTALL_FULL_LIBDIR}")
-+message (STATUS "Header files will be installed in ${CMAKE_INSTALL_FULL_INCLUDEDIR}")
-+message (STATUS "Binaries will be installed in ${CMAKE_INSTALL_FULL_BINDIR}")
-+message (STATUS "Man pages will be installed in ${CMAKE_INSTALL_FULL_MANDIR}")
- 
- IF (NOT PKGCONFIG_INSTALL_DIR)
--  SET (PKGCONFIG_INSTALL_DIR ${LIB_INSTALL_DIR}/pkgconfig)
-+  SET (PKGCONFIG_INSTALL_DIR ${CMAKE_INSTALL_LIBDIR}/pkgconfig)
- ENDIF (NOT PKGCONFIG_INSTALL_DIR)
- ####################################################################
- # CONFIGURATION                                                    #
-diff --git a/doc/CMakeLists.txt b/doc/CMakeLists.txt
-index 66011b48..ed38274e 100644
---- a/doc/CMakeLists.txt
-+++ b/doc/CMakeLists.txt
-@@ -48,8 +48,8 @@ STRING(REGEX REPLACE "([^;]+)" "gen/\\1" libsolv_MANPAGES3 "${libsolv_MANPAGES3}
- 
- INSTALL(FILES
-     ${libsolv_MANPAGES3}
--    DESTINATION "${MAN_INSTALL_DIR}/man3")
-+    DESTINATION "${CMAKE_INSTALL_MANDIR}/man3")
- 
- INSTALL(FILES
-     ${libsolv_MANPAGES1}
--    DESTINATION "${MAN_INSTALL_DIR}/man1")
-+    DESTINATION "${CMAKE_INSTALL_MANDIR}/man1")
-diff --git a/examples/solv/CMakeLists.txt b/examples/solv/CMakeLists.txt
-index 41f45f74..0f3bd477 100644
---- a/examples/solv/CMakeLists.txt
-+++ b/examples/solv/CMakeLists.txt
-@@ -25,5 +25,5 @@ TARGET_LINK_LIBRARIES (solv libsolvext libsolv ${SYSTEM_LIBRARIES})
- 
- INSTALL(TARGETS
-     solv
--    DESTINATION ${BIN_INSTALL_DIR})
-+    DESTINATION ${CMAKE_INSTALL_BINDIR})
- 
-diff --git a/ext/CMakeLists.txt b/ext/CMakeLists.txt
-index edc2b9f9..6dd28b1a 100644
---- a/ext/CMakeLists.txt
-+++ b/ext/CMakeLists.txt
-@@ -145,14 +145,14 @@ ENDIF (DISABLE_SHARED)
- 
- SET_TARGET_PROPERTIES(libsolvext PROPERTIES OUTPUT_NAME "solvext")
- SET_TARGET_PROPERTIES(libsolvext PROPERTIES SOVERSION ${LIBSOLVEXT_SOVERSION})
--SET_TARGET_PROPERTIES(libsolvext PROPERTIES INSTALL_NAME_DIR ${LIB_INSTALL_DIR})
-+SET_TARGET_PROPERTIES(libsolvext PROPERTIES INSTALL_NAME_DIR ${CMAKE_INSTALL_LIBDIR})
- 
--INSTALL (FILES ${libsolvext_HEADERS} DESTINATION "${INCLUDE_INSTALL_DIR}/solv")
--INSTALL (TARGETS libsolvext LIBRARY DESTINATION ${LIB_INSTALL_DIR} ARCHIVE DESTINATION ${LIB_INSTALL_DIR} RUNTIME DESTINATION bin)
-+INSTALL (FILES ${libsolvext_HEADERS} DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}/solv")
-+INSTALL (TARGETS libsolvext LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR} ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR} RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})
- 
- IF (ENABLE_STATIC AND NOT DISABLE_SHARED)
- ADD_LIBRARY (libsolvext_static STATIC ${libsolvext_SRCS})
- SET_TARGET_PROPERTIES(libsolvext_static PROPERTIES OUTPUT_NAME "solvext")
- SET_TARGET_PROPERTIES(libsolvext_static PROPERTIES SOVERSION ${LIBSOLVEXT_SOVERSION})
--INSTALL (TARGETS libsolvext_static LIBRARY DESTINATION ${LIB_INSTALL_DIR} ARCHIVE DESTINATION ${LIB_INSTALL_DIR})
-+INSTALL (TARGETS libsolvext_static LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR} ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR})
- ENDIF (ENABLE_STATIC AND NOT DISABLE_SHARED)
-diff --git a/libsolv.pc.in b/libsolv.pc.in
-index 40a86230..766146c5 100644
---- a/libsolv.pc.in
-+++ b/libsolv.pc.in
-@@ -1,5 +1,5 @@
--libdir=@LIB_INSTALL_DIR@
--includedir=@INCLUDE_INSTALL_DIR@
-+libdir=@CMAKE_INSTALL_FULL_LIBDIR@
-+includedir=@CMAKE_INSTALL_FULL_INCLUDEDIR@
- 
- Name: libsolv
- Description: Library for solving packages
-diff --git a/libsolvext.pc.in b/libsolvext.pc.in
-index d48b6fab..d0078461 100644
---- a/libsolvext.pc.in
-+++ b/libsolvext.pc.in
-@@ -1,5 +1,5 @@
--libdir=@LIB_INSTALL_DIR@
--includedir=@INCLUDE_INSTALL_DIR@
-+libdir=@CMAKE_INSTALL_FULL_LIBDIR@
-+includedir=@CMAKE_INSTALL_FULL_INCLUDEDIR@
- 
- Name: libsolvext
- Description: Library for reading repositories
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index 2e32968e..03ea9119 100644
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -42,14 +42,14 @@ ENDIF (DISABLE_SHARED)
- 
- SET_TARGET_PROPERTIES(libsolv PROPERTIES OUTPUT_NAME "solv")
- SET_TARGET_PROPERTIES(libsolv PROPERTIES SOVERSION ${LIBSOLV_SOVERSION})
--SET_TARGET_PROPERTIES(libsolv PROPERTIES INSTALL_NAME_DIR ${LIB_INSTALL_DIR})
-+SET_TARGET_PROPERTIES(libsolv PROPERTIES INSTALL_NAME_DIR ${CMAKE_INSTALL_LIBDIR})
- 
--INSTALL (FILES ${libsolv_HEADERS} DESTINATION "${INCLUDE_INSTALL_DIR}/solv")
--INSTALL (TARGETS libsolv LIBRARY DESTINATION ${LIB_INSTALL_DIR} ARCHIVE DESTINATION ${LIB_INSTALL_DIR} RUNTIME DESTINATION bin)
-+INSTALL (FILES ${libsolv_HEADERS} DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}/solv")
-+INSTALL (TARGETS libsolv LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR} ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR} RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})
- 
- IF (ENABLE_STATIC AND NOT DISABLE_SHARED)
- ADD_LIBRARY (libsolv_static STATIC ${libsolv_SRCS})
- SET_TARGET_PROPERTIES(libsolv_static PROPERTIES OUTPUT_NAME "solv")
- SET_TARGET_PROPERTIES(libsolv_static PROPERTIES SOVERSION ${LIBSOLV_SOVERSION})
--INSTALL (TARGETS libsolv_static LIBRARY DESTINATION ${LIB_INSTALL_DIR} ARCHIVE DESTINATION ${LIB_INSTALL_DIR})
-+INSTALL (TARGETS libsolv_static LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR} ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR})
- ENDIF (ENABLE_STATIC AND NOT DISABLE_SHARED)
-diff --git a/tools/CMakeLists.txt b/tools/CMakeLists.txt
-index 802dc500..0d677f69 100644
---- a/tools/CMakeLists.txt
-+++ b/tools/CMakeLists.txt
-@@ -110,5 +110,4 @@ TARGET_LINK_LIBRARIES (testsolv libsolvext libsolv ${SYSTEM_LIBRARIES})
- ADD_EXECUTABLE (repo2solv repo2solv.c )
- TARGET_LINK_LIBRARIES (repo2solv toolstuff libsolvext libsolv ${SYSTEM_LIBRARIES})
- 
--INSTALL (TARGETS ${tools_list} DESTINATION ${BIN_INSTALL_DIR})
--
-+INSTALL (TARGETS ${tools_list} DESTINATION ${CMAKE_INSTALL_BINDIR})
--- 
-2.11.0
-
diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.4.bb b/meta/recipes-extended/libsolv/libsolv_0.7.5.bb
similarity index 87%
rename from meta/recipes-extended/libsolv/libsolv_0.7.4.bb
rename to meta/recipes-extended/libsolv/libsolv_0.7.5.bb
index b8653adc01..80ce76b45f 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.4.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.5.bb
@@ -8,10 +8,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.BSD;md5=62272bd11c97396d4aaf1c41bc11f7d8"
 DEPENDS = "expat zlib"
 
 SRC_URI = "git://github.com/openSUSE/libsolv.git \
-           file://0001-build-use-GNUInstallDirs.patch \
 "
 
-SRCREV = "51fc3b1214aa9677e972712fa1ce6916e438751f"
+SRCREV = "2cab7ea00d08390374b25b11d969f3740c4660f4"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.17.1


