Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.32994.1631005255511740811
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Sep 2021 02:00:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: liezhi.yang@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 18790sYP014924
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 7 Sep 2021 02:00:54 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 18790s02016061
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 7 Sep 2021 02:00:54 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 7 Sep 2021 02:00:52 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 7 Sep 2021 02:00:51 -0700
From: "Robert Yang" <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH 1/1] assimp: Remove it
Date: Tue, 7 Sep 2021 17:31:21 +0800
Message-ID: <a03aa223ea9b8857e63f234481ff71f9f8e2b87a.1631006990.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
In-Reply-To: <cover.1631006990.git.liezhi.yang@windriver.com>
References: <cover.1631006990.git.liezhi.yang@windriver.com>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.wrs.com id 18790sYP014924
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Remove it since it has license issues:

* scripts/StepImporter/schema_ifc2x3.exp
Copyright by: International Alliance for Interoperability, 1996-2005 All =
rights
reserved. No part of this documentation may be reproduced, stored in a
retrieval system, or transmitted in any form or by any means, without the=
 prior
written permission of the owner

* test/models-nonbsd/X/dwarf-Read-Me.txt
RESTRICTIONS: This model pack is available for use in freeware, shareware=
,
commercial games/software with the following restrictions:- **You may not
sell/re-sell this model pack or claim it as your own. ***You may not
redistribute this pack in some other model pack through a website or on a
compilation CD of any kind, without my written consent. Psi
http://www.psionic3d.co.uk

* test/models-nonbsd/B3D/turtle.source.txt
Copyright 2004, Psionic Design e-mail: psionic@blueyonder.co.uk Used with
permission. RESTRICTIONS: This model pack is available for use in freewar=
e,
shareware, commercial games/software with the following restrictions:- **=
You
may not sell/re-sell this model pack or claim it as your own. ***You may =
not
redistribute this pack in some other model pack through a website or on a
compilation CD of any kind, without my written consent.

And no recipes depend on it, so remove it.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/conf/distro/include/maintainers.inc      |    1 -
 ...MP_LIB_INSTALL_DIR-to-search-library.patch |   68 -
 ...hub.com-assimp-assimp-issues-2733-up.patch | 1664 -----------------
 meta/recipes-graphics/vulkan/assimp_5.0.1.bb  |   23 -
 4 files changed, 1756 deletions(-)
 delete mode 100644 meta/recipes-graphics/vulkan/assimp/0001-Use-ASSIMP_L=
IB_INSTALL_DIR-to-search-library.patch
 delete mode 100644 meta/recipes-graphics/vulkan/assimp/0001-closes-https=
-github.com-assimp-assimp-issues-2733-up.patch
 delete mode 100644 meta/recipes-graphics/vulkan/assimp_5.0.1.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 6276331857..e6b8180731 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -46,7 +46,6 @@ RECIPE_MAINTAINER_pn-apt =3D "An=C3=ADbal Lim=C3=B3n <l=
imon.anibal@gmail.com>"
 RECIPE_MAINTAINER_pn-argp-standalone =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-asciidoc =3D "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-aspell =3D "Anuj Mittal <anuj.mittal@intel.com>"
-RECIPE_MAINTAINER_pn-assimp =3D "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-at =3D "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-at-spi2-atk =3D "Tim Orling <timothy.t.orling@linux=
.intel.com>"
 RECIPE_MAINTAINER_pn-at-spi2-core =3D "Tim Orling <timothy.t.orling@linu=
x.intel.com>"
diff --git a/meta/recipes-graphics/vulkan/assimp/0001-Use-ASSIMP_LIB_INST=
ALL_DIR-to-search-library.patch b/meta/recipes-graphics/vulkan/assimp/000=
1-Use-ASSIMP_LIB_INSTALL_DIR-to-search-library.patch
deleted file mode 100644
index 34c5bfa857..0000000000
--- a/meta/recipes-graphics/vulkan/assimp/0001-Use-ASSIMP_LIB_INSTALL_DIR=
-to-search-library.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From 58f576d6f240b08957a402960cdf06c74201ac7b Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Thu, 12 Dec 2019 22:16:15 -0800
-Subject: [PATCH] Use ASSIMP_LIB_INSTALL_DIR to search library
-
-Use ASSIMP_LIB_INSTALL_DIR rather than hardcoded /lib to search library
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
----
- assimpTargets-release.cmake.in | 16 ++++++++--------
- 1 file changed, 8 insertions(+), 8 deletions(-)
-
-diff --git a/assimpTargets-release.cmake.in b/assimpTargets-release.cmak=
e.in
-index f3db8f1..b8a066a 100644
---- a/assimpTargets-release.cmake.in
-+++ b/assimpTargets-release.cmake.in
-@@ -42,11 +42,11 @@ if(MSVC)
-     # Import target "assimp::assimp" for configuration "Release"
-     set_property(TARGET assimp::assimp APPEND PROPERTY IMPORTED_CONFIGU=
RATIONS RELEASE)
-     set_target_properties(assimp::assimp PROPERTIES
--      IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/${importLibraryNam=
e}"
-+      IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/@ASSIMP_LIB_INSTALL_DI=
R@/${importLibraryName}"
-       IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/${sharedLibraryN=
ame}"
-     )
-     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
--    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp "${_IMPORT_PREFI=
X}/lib/${importLibraryName}")
-+    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp "${_IMPORT_PREFI=
X}/@ASSIMP_LIB_INSTALL_DIR@/${importLibraryName}")
-     list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp "${_IMPORT_PREFI=
X}/bin/${sharedLibraryName}" )
-   else()
-     set(staticLibraryName "assimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_STATIC_=
LIBRARY_SUFFIX@")
-@@ -54,10 +54,10 @@ if(MSVC)
-     # Import target "assimp::assimp" for configuration "Release"
-     set_property(TARGET assimp::assimp APPEND PROPERTY IMPORTED_CONFIGU=
RATIONS RELEASE)
-     set_target_properties(assimp::assimp PROPERTIES
--      IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/${staticLibraryN=
ame}"
-+      IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/@ASSIMP_LIB_INSTALL_=
DIR@/${staticLibraryName}"
-     )
-     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
--    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp "${_IMPORT_PREFI=
X}/lib/${staticLibraryName}")
-+    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp "${_IMPORT_PREFI=
X}/@ASSIMP_LIB_INSTALL_DIR@/${staticLibraryName}")
-   endif()
-=20
- else()
-@@ -70,17 +70,17 @@ else()
-     endif()
-     set_target_properties(assimp::assimp PROPERTIES
-       IMPORTED_SONAME_RELEASE "${sharedLibraryName}"
--      IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/${sharedLibraryN=
ame}"
-+      IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/@ASSIMP_LIB_INSTALL_=
DIR@/${sharedLibraryName}"
-     )
-     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
--    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp "${_IMPORT_PREFI=
X}/lib/${sharedLibraryName}" )
-+    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp "${_IMPORT_PREFI=
X}/@ASSIMP_LIB_INSTALL_DIR@/${sharedLibraryName}" )
-   else()
-     set(staticLibraryName "libassimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_STAT=
IC_LIBRARY_SUFFIX@")
-     set_target_properties(assimp::assimp PROPERTIES
--      IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/${staticLibraryN=
ame}"
-+      IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/@ASSIMP_LIB_INSTALL_=
DIR@/${staticLibraryName}"
-     )
-     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
--    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp "${_IMPORT_PREFI=
X}/lib/${staticLibraryName}" )
-+    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp "${_IMPORT_PREFI=
X}/@ASSIMP_LIB_INSTALL_DIR@/${staticLibraryName}" )
-   endif()
- endif()
-=20
diff --git a/meta/recipes-graphics/vulkan/assimp/0001-closes-https-github=
.com-assimp-assimp-issues-2733-up.patch b/meta/recipes-graphics/vulkan/as=
simp/0001-closes-https-github.com-assimp-assimp-issues-2733-up.patch
deleted file mode 100644
index 87a1658710..0000000000
--- a/meta/recipes-graphics/vulkan/assimp/0001-closes-https-github.com-as=
simp-assimp-issues-2733-up.patch
+++ /dev/null
@@ -1,1664 +0,0 @@
-From 7fc220b2350d78942fb3935cad0b1564418ebe8f Mon Sep 17 00:00:00 2001
-From: Kim Kulling <kim.kulling@googlemail.com>
-Date: Tue, 19 Nov 2019 20:30:40 +0100
-Subject: [PATCH] closes https://github.com/assimp/assimp/issues/2733: up=
date
- of zlip to fix gcc build for v9.2.0 32 bit
-
-Upstream-Status: Backport [https://github.com/assimp/assimp/commit/f7844=
6b14aff46db2ef27d062a275b6a01fd68b1]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- contrib/zip/.gitignore          |   2 +
- contrib/zip/CMakeLists.txt      |  83 +++++-
- contrib/zip/README.md           |  12 +-
- contrib/zip/appveyor.yml        |   2 +-
- contrib/zip/src/miniz.h         | 457 ++++++++++++++++++++++++++++----
- contrib/zip/src/zip.c           |  62 +++--
- contrib/zip/src/zip.h           | 457 ++++++++++++++++----------------
- contrib/zip/test/CMakeLists.txt |  27 +-
- contrib/zip/test/test.c         |  38 ++-
- contrib/zip/test/test_miniz.c   |  25 +-
- 10 files changed, 821 insertions(+), 344 deletions(-)
-
-diff --git a/contrib/zip/.gitignore b/contrib/zip/.gitignore
-index a7904a1e..49b2cb2f 100644
---- a/contrib/zip/.gitignore
-+++ b/contrib/zip/.gitignore
-@@ -1,6 +1,7 @@
- /build/
- /test/build/
- /xcodeproj/
-+.vscode/
-=20
- # Object files
- *.o
-@@ -54,3 +55,4 @@ zip.dir/
- test/test.exe.vcxproj.filters
- test/test.exe.vcxproj
- test/test.exe.dir/
-+
-diff --git a/contrib/zip/CMakeLists.txt b/contrib/zip/CMakeLists.txt
-index b46dbb1d..77916d2e 100644
---- a/contrib/zip/CMakeLists.txt
-+++ b/contrib/zip/CMakeLists.txt
-@@ -1,10 +1,14 @@
--cmake_minimum_required(VERSION 2.8)
--project(zip)
--enable_language(C)
-+cmake_minimum_required(VERSION 3.0)
-+
-+project(zip
-+  LANGUAGES C
-+  VERSION "0.1.15")
- set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake" ${CMAKE_MODULE_PATH=
})
-=20
-+option(CMAKE_DISABLE_TESTING "Disable test creation" OFF)
-+
- if (MSVC)
--  # Use secure functions by defaualt and suppress warnings about "depre=
cated" functions
-+  # Use secure functions by default and suppress warnings about "deprec=
ated" functions
-   set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} /D _CRT_SECURE_CPP_OVERLOAD_STAND=
ARD_NAMES=3D1")
-   set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} /D _CRT_SECURE_CPP_OVERLOAD_STAND=
ARD_NAMES_COUNT=3D1")
-   set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} /D _CRT_NONSTDC_NO_WARNINGS=3D1 /=
D _CRT_SECURE_NO_WARNINGS=3D1")
-@@ -12,28 +16,80 @@ elseif ("${CMAKE_C_COMPILER_ID}" STREQUAL "GNU" OR
-         "${CMAKE_C_COMPILER_ID}" STREQUAL "Clang" OR
-         "${CMAKE_C_COMPILER_ID}" STREQUAL "AppleClang")
-   set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -std=3Dc99 -Wall -Wextra -Werror =
-pedantic")
-+  if(ENABLE_COVERAGE)
-+    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -g -O0 -fprofile-arcs -ftest-co=
verage")
-+    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} --coverage")
-+  endif()
- endif (MSVC)
-=20
- # zip
- set(SRC src/miniz.h src/zip.h src/zip.c)
- add_library(${PROJECT_NAME} ${SRC})
--target_include_directories(${PROJECT_NAME} INTERFACE src)
-+target_include_directories(${PROJECT_NAME} PUBLIC
-+  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/src>
-+  $<INSTALL_INTERFACE:include>
-+)
-=20
- # test
- if (NOT CMAKE_DISABLE_TESTING)
-   enable_testing()
-   add_subdirectory(test)
-   find_package(Sanitizers)
--  add_sanitizers(${PROJECT_NAME} test.exe)
--  add_sanitizers(${PROJECT_NAME} test_miniz.exe)
-+  add_sanitizers(${PROJECT_NAME} ${test_out} ${test_miniz_out})
- endif()
-=20
-+####
-+# Installation (https://github.com/forexample/package-example) {
-+
-+set(CONFIG_INSTALL_DIR "lib/cmake/${PROJECT_NAME}")
-+set(INCLUDE_INSTALL_DIR "include")
-+
-+set(GENERATED_DIR "${CMAKE_CURRENT_BINARY_DIR}/generated")
-+
-+# Configuration
-+set(VERSION_CONFIG "${GENERATED_DIR}/${PROJECT_NAME}ConfigVersion.cmake=
")
-+set(PROJECT_CONFIG "${GENERATED_DIR}/${PROJECT_NAME}Config.cmake")
-+set(TARGETS_EXPORT_NAME "${PROJECT_NAME}Targets")
-+set(NAMESPACE "${PROJECT_NAME}::")
-+
-+# Include module with fuction 'write_basic_package_version_file'
-+include(CMakePackageConfigHelpers)
-+
-+# Note: PROJECT_VERSION is used as a VERSION
-+write_basic_package_version_file(
-+    "${VERSION_CONFIG}" COMPATIBILITY SameMajorVersion
-+)
-+
-+# Use variables:
-+#   * TARGETS_EXPORT_NAME
-+#   * PROJECT_NAME
-+configure_package_config_file(
-+    "cmake/Config.cmake.in"
-+    "${PROJECT_CONFIG}"
-+    INSTALL_DESTINATION "${CONFIG_INSTALL_DIR}"
-+)
-+
-+install(
-+    FILES "${PROJECT_CONFIG}" "${VERSION_CONFIG}"
-+    DESTINATION "${CONFIG_INSTALL_DIR}"
-+)
-+
-+install(
-+    EXPORT "${TARGETS_EXPORT_NAME}"
-+    NAMESPACE "${NAMESPACE}"
-+    DESTINATION "${CONFIG_INSTALL_DIR}"
-+)
-+
-+# }
-+
- install(TARGETS ${PROJECT_NAME}
-+        EXPORT ${TARGETS_EXPORT_NAME}
-         RUNTIME DESTINATION bin
-         ARCHIVE DESTINATION lib
-         LIBRARY DESTINATION lib
--        COMPONENT library)
--install(FILES ${PROJECT_SOURCE_DIR}/src/zip.h DESTINATION include)
-+        INCLUDES DESTINATION ${INCLUDE_INSTALL_DIR}
-+)
-+install(FILES ${PROJECT_SOURCE_DIR}/src/zip.h DESTINATION ${INCLUDE_INS=
TALL_DIR}/zip)
-=20
- # uninstall target (https://gitlab.kitware.com/cmake/community/wikis/FA=
Q#can-i-do-make-uninstall-with-cmake)
- if(NOT TARGET uninstall)
-@@ -45,3 +101,12 @@ if(NOT TARGET uninstall)
-     add_custom_target(uninstall
-         COMMAND ${CMAKE_COMMAND} -P ${CMAKE_CURRENT_BINARY_DIR}/cmake/c=
make_uninstall.cmake)
- endif()
-+
-+find_package(Doxygen)
-+if(DOXYGEN_FOUND)
-+    configure_file(${CMAKE_CURRENT_SOURCE_DIR}/Doxyfile.in ${CMAKE_CURR=
ENT_BINARY_DIR}/Doxyfile @ONLY)
-+    add_custom_target(doc
-+        ${DOXYGEN_EXECUTABLE} ${CMAKE_CURRENT_BINARY_DIR}/Doxyfile
-+        WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
-+        COMMENT "Generating API documentation with Doxygen" VERBATIM)
-+endif()
-diff --git a/contrib/zip/README.md b/contrib/zip/README.md
-index d5fb8cd2..14eb9a34 100644
---- a/contrib/zip/README.md
-+++ b/contrib/zip/README.md
-@@ -71,7 +71,7 @@ int arg =3D 2;
- zip_extract("foo.zip", "/tmp", on_extract_entry, &arg);
- ```
-=20
--*   Extract a zip entry into memory.
-+* Extract a zip entry into memory.
- ```c
- void *buf =3D NULL;
- size_t bufsize;
-@@ -89,7 +89,7 @@ zip_close(zip);
- free(buf);
- ```
-=20
--*   Extract a zip entry into memory (no internal allocation).
-+* Extract a zip entry into memory (no internal allocation).
- ```c
- unsigned char *buf;
- size_t bufsize;
-@@ -110,7 +110,7 @@ zip_close(zip);
- free(buf);
- ```
-=20
--*   Extract a zip entry into memory using callback.
-+* Extract a zip entry into memory using callback.
- ```c
- struct buffer_t {
-     char *data;
-@@ -144,7 +144,7 @@ free(buf.data);
- ```
-=20
-=20
--*   Extract a zip entry into a file.
-+* Extract a zip entry into a file.
- ```c
- struct zip_t *zip =3D zip_open("foo.zip", 0, 'r');
- {
-@@ -157,7 +157,7 @@ struct zip_t *zip =3D zip_open("foo.zip", 0, 'r');
- zip_close(zip);
- ```
-=20
--*   List of all zip entries
-+* List of all zip entries
- ```c
- struct zip_t *zip =3D zip_open("foo.zip", 0, 'r');
- int i, n =3D zip_total_entries(zip);
-@@ -174,7 +174,7 @@ for (i =3D 0; i < n; ++i) {
- zip_close(zip);
- ```
-=20
--## Bindings
-+# Bindings
- Compile zip library as a dynamic library.
- ```shell
- $ mkdir build
-diff --git a/contrib/zip/appveyor.yml b/contrib/zip/appveyor.yml
-index 0be6373c..ea17f5de 100644
---- a/contrib/zip/appveyor.yml
-+++ b/contrib/zip/appveyor.yml
-@@ -1,4 +1,4 @@
--version: zip-0.1.9.{build}
-+version: zip-0.1.15.{build}
- build_script:
- - cmd: >-
-     cd c:\projects\zip
-diff --git a/contrib/zip/src/miniz.h b/contrib/zip/src/miniz.h
-index 2c27a94d..c4fcfb83 100644
---- a/contrib/zip/src/miniz.h
-+++ b/contrib/zip/src/miniz.h
-@@ -221,6 +221,7 @@
- #ifndef MINIZ_HEADER_INCLUDED
- #define MINIZ_HEADER_INCLUDED
-=20
-+#include <stdint.h>
- #include <stdlib.h>
-=20
- // Defines to completely disable specific portions of miniz.c:
-@@ -284,7 +285,8 @@
- /* Set MINIZ_USE_UNALIGNED_LOADS_AND_STORES only if not set */
- #if !defined(MINIZ_USE_UNALIGNED_LOADS_AND_STORES)
- #if MINIZ_X86_OR_X64_CPU
--/* Set MINIZ_USE_UNALIGNED_LOADS_AND_STORES to 1 on CPU's that permit e=
fficient integer loads and stores from unaligned addresses. */
-+/* Set MINIZ_USE_UNALIGNED_LOADS_AND_STORES to 1 on CPU's that permit e=
fficient
-+ * integer loads and stores from unaligned addresses. */
- #define MINIZ_USE_UNALIGNED_LOADS_AND_STORES 1
- #define MINIZ_UNALIGNED_USE_MEMCPY
- #else
-@@ -354,6 +356,44 @@ enum {
-   MZ_FIXED =3D 4
- };
-=20
-+/* miniz error codes. Be sure to update mz_zip_get_error_string() if yo=
u add or
-+ * modify this enum. */
-+typedef enum {
-+  MZ_ZIP_NO_ERROR =3D 0,
-+  MZ_ZIP_UNDEFINED_ERROR,
-+  MZ_ZIP_TOO_MANY_FILES,
-+  MZ_ZIP_FILE_TOO_LARGE,
-+  MZ_ZIP_UNSUPPORTED_METHOD,
-+  MZ_ZIP_UNSUPPORTED_ENCRYPTION,
-+  MZ_ZIP_UNSUPPORTED_FEATURE,
-+  MZ_ZIP_FAILED_FINDING_CENTRAL_DIR,
-+  MZ_ZIP_NOT_AN_ARCHIVE,
-+  MZ_ZIP_INVALID_HEADER_OR_CORRUPTED,
-+  MZ_ZIP_UNSUPPORTED_MULTIDISK,
-+  MZ_ZIP_DECOMPRESSION_FAILED,
-+  MZ_ZIP_COMPRESSION_FAILED,
-+  MZ_ZIP_UNEXPECTED_DECOMPRESSED_SIZE,
-+  MZ_ZIP_CRC_CHECK_FAILED,
-+  MZ_ZIP_UNSUPPORTED_CDIR_SIZE,
-+  MZ_ZIP_ALLOC_FAILED,
-+  MZ_ZIP_FILE_OPEN_FAILED,
-+  MZ_ZIP_FILE_CREATE_FAILED,
-+  MZ_ZIP_FILE_WRITE_FAILED,
-+  MZ_ZIP_FILE_READ_FAILED,
-+  MZ_ZIP_FILE_CLOSE_FAILED,
-+  MZ_ZIP_FILE_SEEK_FAILED,
-+  MZ_ZIP_FILE_STAT_FAILED,
-+  MZ_ZIP_INVALID_PARAMETER,
-+  MZ_ZIP_INVALID_FILENAME,
-+  MZ_ZIP_BUF_TOO_SMALL,
-+  MZ_ZIP_INTERNAL_ERROR,
-+  MZ_ZIP_FILE_NOT_FOUND,
-+  MZ_ZIP_ARCHIVE_TOO_LARGE,
-+  MZ_ZIP_VALIDATION_FAILED,
-+  MZ_ZIP_WRITE_CALLBACK_FAILED,
-+  MZ_ZIP_TOTAL_ERRORS
-+} mz_zip_error;
-+
- // Method
- #define MZ_DEFLATED 8
-=20
-@@ -696,6 +736,7 @@ typedef size_t (*mz_file_read_func)(void *pOpaque, m=
z_uint64 file_ofs,
-                                     void *pBuf, size_t n);
- typedef size_t (*mz_file_write_func)(void *pOpaque, mz_uint64 file_ofs,
-                                      const void *pBuf, size_t n);
-+typedef mz_bool (*mz_file_needs_keepalive)(void *pOpaque);
-=20
- struct mz_zip_internal_state_tag;
- typedef struct mz_zip_internal_state_tag mz_zip_internal_state;
-@@ -707,13 +748,27 @@ typedef enum {
-   MZ_ZIP_MODE_WRITING_HAS_BEEN_FINALIZED =3D 3
- } mz_zip_mode;
-=20
--typedef struct mz_zip_archive_tag {
-+typedef enum {
-+  MZ_ZIP_TYPE_INVALID =3D 0,
-+  MZ_ZIP_TYPE_USER,
-+  MZ_ZIP_TYPE_MEMORY,
-+  MZ_ZIP_TYPE_HEAP,
-+  MZ_ZIP_TYPE_FILE,
-+  MZ_ZIP_TYPE_CFILE,
-+  MZ_ZIP_TOTAL_TYPES
-+} mz_zip_type;
-+
-+typedef struct {
-   mz_uint64 m_archive_size;
-   mz_uint64 m_central_directory_file_ofs;
--  mz_uint m_total_files;
-+
-+  /* We only support up to UINT32_MAX files in zip64 mode. */
-+  mz_uint32 m_total_files;
-   mz_zip_mode m_zip_mode;
-+  mz_zip_type m_zip_type;
-+  mz_zip_error m_last_error;
-=20
--  mz_uint m_file_offset_alignment;
-+  mz_uint64 m_file_offset_alignment;
-=20
-   mz_alloc_func m_pAlloc;
-   mz_free_func m_pFree;
-@@ -722,6 +777,7 @@ typedef struct mz_zip_archive_tag {
-=20
-   mz_file_read_func m_pRead;
-   mz_file_write_func m_pWrite;
-+  mz_file_needs_keepalive m_pNeeds_keepalive;
-   void *m_pIO_opaque;
-=20
-   mz_zip_internal_state *m_pState;
-@@ -1263,6 +1319,9 @@ mz_uint tdefl_create_comp_flags_from_zip_params(in=
t level, int window_bits,
-                                                 int strategy);
- #endif // #ifndef MINIZ_NO_ZLIB_APIS
-=20
-+#define MZ_UINT16_MAX (0xFFFFU)
-+#define MZ_UINT32_MAX (0xFFFFFFFFU)
-+
- #ifdef __cplusplus
- }
- #endif
-@@ -1311,6 +1370,11 @@ typedef unsigned char mz_validate_uint64[sizeof(m=
z_uint64) =3D=3D 8 ? 1 : -1];
-    ((mz_uint32)(((const mz_uint8 *)(p))[3]) << 24U))
- #endif
-=20
-+#define MZ_READ_LE64(p)                                                =
        \
-+  (((mz_uint64)MZ_READ_LE32(p)) |                                      =
        \
-+   (((mz_uint64)MZ_READ_LE32((const mz_uint8 *)(p) + sizeof(mz_uint32))=
)       \
-+    << 32U))
-+
- #ifdef _MSC_VER
- #define MZ_FORCEINLINE __forceinline
- #elif defined(__GNUC__)
-@@ -4160,6 +4224,17 @@ enum {
-   MZ_ZIP_LOCAL_DIR_HEADER_SIZE =3D 30,
-   MZ_ZIP_CENTRAL_DIR_HEADER_SIZE =3D 46,
-   MZ_ZIP_END_OF_CENTRAL_DIR_HEADER_SIZE =3D 22,
-+
-+  /* ZIP64 archive identifier and record sizes */
-+  MZ_ZIP64_END_OF_CENTRAL_DIR_HEADER_SIG =3D 0x06064b50,
-+  MZ_ZIP64_END_OF_CENTRAL_DIR_LOCATOR_SIG =3D 0x07064b50,
-+  MZ_ZIP64_END_OF_CENTRAL_DIR_HEADER_SIZE =3D 56,
-+  MZ_ZIP64_END_OF_CENTRAL_DIR_LOCATOR_SIZE =3D 20,
-+  MZ_ZIP64_EXTENDED_INFORMATION_FIELD_HEADER_ID =3D 0x0001,
-+  MZ_ZIP_DATA_DESCRIPTOR_ID =3D 0x08074b50,
-+  MZ_ZIP_DATA_DESCRIPTER_SIZE64 =3D 24,
-+  MZ_ZIP_DATA_DESCRIPTER_SIZE32 =3D 16,
-+
-   // Central directory header record offsets
-   MZ_ZIP_CDH_SIG_OFS =3D 0,
-   MZ_ZIP_CDH_VERSION_MADE_BY_OFS =3D 4,
-@@ -4199,6 +4274,31 @@ enum {
-   MZ_ZIP_ECDH_CDIR_SIZE_OFS =3D 12,
-   MZ_ZIP_ECDH_CDIR_OFS_OFS =3D 16,
-   MZ_ZIP_ECDH_COMMENT_SIZE_OFS =3D 20,
-+
-+  /* ZIP64 End of central directory locator offsets */
-+  MZ_ZIP64_ECDL_SIG_OFS =3D 0,                    /* 4 bytes */
-+  MZ_ZIP64_ECDL_NUM_DISK_CDIR_OFS =3D 4,          /* 4 bytes */
-+  MZ_ZIP64_ECDL_REL_OFS_TO_ZIP64_ECDR_OFS =3D 8,  /* 8 bytes */
-+  MZ_ZIP64_ECDL_TOTAL_NUMBER_OF_DISKS_OFS =3D 16, /* 4 bytes */
-+
-+  /* ZIP64 End of central directory header offsets */
-+  MZ_ZIP64_ECDH_SIG_OFS =3D 0,                       /* 4 bytes */
-+  MZ_ZIP64_ECDH_SIZE_OF_RECORD_OFS =3D 4,            /* 8 bytes */
-+  MZ_ZIP64_ECDH_VERSION_MADE_BY_OFS =3D 12,          /* 2 bytes */
-+  MZ_ZIP64_ECDH_VERSION_NEEDED_OFS =3D 14,           /* 2 bytes */
-+  MZ_ZIP64_ECDH_NUM_THIS_DISK_OFS =3D 16,            /* 4 bytes */
-+  MZ_ZIP64_ECDH_NUM_DISK_CDIR_OFS =3D 20,            /* 4 bytes */
-+  MZ_ZIP64_ECDH_CDIR_NUM_ENTRIES_ON_DISK_OFS =3D 24, /* 8 bytes */
-+  MZ_ZIP64_ECDH_CDIR_TOTAL_ENTRIES_OFS =3D 32,       /* 8 bytes */
-+  MZ_ZIP64_ECDH_CDIR_SIZE_OFS =3D 40,                /* 8 bytes */
-+  MZ_ZIP64_ECDH_CDIR_OFS_OFS =3D 48,                 /* 8 bytes */
-+  MZ_ZIP_VERSION_MADE_BY_DOS_FILESYSTEM_ID =3D 0,
-+  MZ_ZIP_DOS_DIR_ATTRIBUTE_BITFLAG =3D 0x10,
-+  MZ_ZIP_GENERAL_PURPOSE_BIT_FLAG_IS_ENCRYPTED =3D 1,
-+  MZ_ZIP_GENERAL_PURPOSE_BIT_FLAG_COMPRESSED_PATCH_FLAG =3D 32,
-+  MZ_ZIP_GENERAL_PURPOSE_BIT_FLAG_USES_STRONG_ENCRYPTION =3D 64,
-+  MZ_ZIP_GENERAL_PURPOSE_BIT_FLAG_LOCAL_DIR_IS_MASKED =3D 8192,
-+  MZ_ZIP_GENERAL_PURPOSE_BIT_FLAG_UTF8 =3D 1 << 11
- };
-=20
- typedef struct {
-@@ -4211,7 +4311,24 @@ struct mz_zip_internal_state_tag {
-   mz_zip_array m_central_dir;
-   mz_zip_array m_central_dir_offsets;
-   mz_zip_array m_sorted_central_dir_offsets;
-+
-+  /* The flags passed in when the archive is initially opened. */
-+  uint32_t m_init_flags;
-+
-+  /* MZ_TRUE if the archive has a zip64 end of central directory header=
s, etc.
-+   */
-+  mz_bool m_zip64;
-+
-+  /* MZ_TRUE if we found zip64 extended info in the central directory (=
m_zip64
-+   * will also be slammed to true too, even if we didn't find a zip64 e=
nd of
-+   * central dir header, etc.) */
-+  mz_bool m_zip64_has_extended_info_fields;
-+
-+  /* These fields are used by the file, FILE, memory, and memory/heap r=
ead/write
-+   * helpers. */
-   MZ_FILE *m_pFile;
-+  mz_uint64 m_file_archive_start_ofs;
-+
-   void *m_pMem;
-   size_t m_mem_size;
-   size_t m_mem_capacity;
-@@ -4363,6 +4480,13 @@ static mz_bool mz_zip_set_file_times(const char *=
pFilename, time_t access_time,
- #endif /* #ifndef MINIZ_NO_STDIO */
- #endif /* #ifndef MINIZ_NO_TIME */
-=20
-+static MZ_FORCEINLINE mz_bool mz_zip_set_error(mz_zip_archive *pZip,
-+                                               mz_zip_error err_num) {
-+  if (pZip)
-+    pZip->m_last_error =3D err_num;
-+  return MZ_FALSE;
-+}
-+
- static mz_bool mz_zip_reader_init_internal(mz_zip_archive *pZip,
-                                            mz_uint32 flags) {
-   (void)flags;
-@@ -4480,127 +4604,346 @@ mz_zip_reader_sort_central_dir_offsets_by_file=
name(mz_zip_archive *pZip) {
-   }
- }
-=20
--static mz_bool mz_zip_reader_read_central_dir(mz_zip_archive *pZip,
--                                              mz_uint32 flags) {
--  mz_uint cdir_size, num_this_disk, cdir_disk_index;
--  mz_uint64 cdir_ofs;
-+static mz_bool mz_zip_reader_locate_header_sig(mz_zip_archive *pZip,
-+                                               mz_uint32 record_sig,
-+                                               mz_uint32 record_size,
-+                                               mz_int64 *pOfs) {
-   mz_int64 cur_file_ofs;
--  const mz_uint8 *p;
-   mz_uint32 buf_u32[4096 / sizeof(mz_uint32)];
-   mz_uint8 *pBuf =3D (mz_uint8 *)buf_u32;
--  mz_bool sort_central_dir =3D
--      ((flags & MZ_ZIP_FLAG_DO_NOT_SORT_CENTRAL_DIRECTORY) =3D=3D 0);
--  // Basic sanity checks - reject files which are too small, and check =
the first
--  // 4 bytes of the file to make sure a local header is there.
--  if (pZip->m_archive_size < MZ_ZIP_END_OF_CENTRAL_DIR_HEADER_SIZE)
-+
-+  /* Basic sanity checks - reject files which are too small */
-+  if (pZip->m_archive_size < record_size)
-     return MZ_FALSE;
--  // Find the end of central directory record by scanning the file from=
 the end
--  // towards the beginning.
-+
-+  /* Find the record by scanning the file from the end towards the begi=
nning. */
-   cur_file_ofs =3D
-       MZ_MAX((mz_int64)pZip->m_archive_size - (mz_int64)sizeof(buf_u32)=
, 0);
-   for (;;) {
-     int i,
-         n =3D (int)MZ_MIN(sizeof(buf_u32), pZip->m_archive_size - cur_f=
ile_ofs);
-+
-     if (pZip->m_pRead(pZip->m_pIO_opaque, cur_file_ofs, pBuf, n) !=3D (=
mz_uint)n)
-       return MZ_FALSE;
--    for (i =3D n - 4; i >=3D 0; --i)
--      if (MZ_READ_LE32(pBuf + i) =3D=3D MZ_ZIP_END_OF_CENTRAL_DIR_HEADE=
R_SIG)
--        break;
-+
-+    for (i =3D n - 4; i >=3D 0; --i) {
-+      mz_uint s =3D MZ_READ_LE32(pBuf + i);
-+      if (s =3D=3D record_sig) {
-+        if ((pZip->m_archive_size - (cur_file_ofs + i)) >=3D record_siz=
e)
-+          break;
-+      }
-+    }
-+
-     if (i >=3D 0) {
-       cur_file_ofs +=3D i;
-       break;
-     }
-+
-+    /* Give up if we've searched the entire file, or we've gone back "t=
oo far"
-+     * (~64kb) */
-     if ((!cur_file_ofs) || ((pZip->m_archive_size - cur_file_ofs) >=3D
--                            (0xFFFF + MZ_ZIP_END_OF_CENTRAL_DIR_HEADER_=
SIZE)))
-+                            (MZ_UINT16_MAX + record_size)))
-       return MZ_FALSE;
-+
-     cur_file_ofs =3D MZ_MAX(cur_file_ofs - (sizeof(buf_u32) - 3), 0);
-   }
--  // Read and verify the end of central directory record.
-+
-+  *pOfs =3D cur_file_ofs;
-+  return MZ_TRUE;
-+}
-+
-+static mz_bool mz_zip_reader_read_central_dir(mz_zip_archive *pZip,
-+                                              mz_uint flags) {
-+  mz_uint cdir_size =3D 0, cdir_entries_on_this_disk =3D 0, num_this_di=
sk =3D 0,
-+          cdir_disk_index =3D 0;
-+  mz_uint64 cdir_ofs =3D 0;
-+  mz_int64 cur_file_ofs =3D 0;
-+  const mz_uint8 *p;
-+
-+  mz_uint32 buf_u32[4096 / sizeof(mz_uint32)];
-+  mz_uint8 *pBuf =3D (mz_uint8 *)buf_u32;
-+  mz_bool sort_central_dir =3D
-+      ((flags & MZ_ZIP_FLAG_DO_NOT_SORT_CENTRAL_DIRECTORY) =3D=3D 0);
-+  mz_uint32 zip64_end_of_central_dir_locator_u32
-+      [(MZ_ZIP64_END_OF_CENTRAL_DIR_LOCATOR_SIZE + sizeof(mz_uint32) - =
1) /
-+       sizeof(mz_uint32)];
-+  mz_uint8 *pZip64_locator =3D (mz_uint8 *)zip64_end_of_central_dir_loc=
ator_u32;
-+
-+  mz_uint32 zip64_end_of_central_dir_header_u32
-+      [(MZ_ZIP64_END_OF_CENTRAL_DIR_HEADER_SIZE + sizeof(mz_uint32) - 1=
) /
-+       sizeof(mz_uint32)];
-+  mz_uint8 *pZip64_end_of_central_dir =3D
-+      (mz_uint8 *)zip64_end_of_central_dir_header_u32;
-+
-+  mz_uint64 zip64_end_of_central_dir_ofs =3D 0;
-+
-+  /* Basic sanity checks - reject files which are too small, and check =
the first
-+   * 4 bytes of the file to make sure a local header is there. */
-+  if (pZip->m_archive_size < MZ_ZIP_END_OF_CENTRAL_DIR_HEADER_SIZE)
-+    return mz_zip_set_error(pZip, MZ_ZIP_NOT_AN_ARCHIVE);
-+
-+  if (!mz_zip_reader_locate_header_sig(
-+          pZip, MZ_ZIP_END_OF_CENTRAL_DIR_HEADER_SIG,
-+          MZ_ZIP_END_OF_CENTRAL_DIR_HEADER_SIZE, &cur_file_ofs))
-+    return mz_zip_set_error(pZip, MZ_ZIP_FAILED_FINDING_CENTRAL_DIR);
-+
-+  /* Read and verify the end of central directory record. */
-   if (pZip->m_pRead(pZip->m_pIO_opaque, cur_file_ofs, pBuf,
-                     MZ_ZIP_END_OF_CENTRAL_DIR_HEADER_SIZE) !=3D
-       MZ_ZIP_END_OF_CENTRAL_DIR_HEADER_SIZE)
--    return MZ_FALSE;
--  if ((MZ_READ_LE32(pBuf + MZ_ZIP_ECDH_SIG_OFS) !=3D
--       MZ_ZIP_END_OF_CENTRAL_DIR_HEADER_SIG) ||
--      ((pZip->m_total_files =3D
--            MZ_READ_LE16(pBuf + MZ_ZIP_ECDH_CDIR_TOTAL_ENTRIES_OFS)) !=3D
--       MZ_READ_LE16(pBuf + MZ_ZIP_ECDH_CDIR_NUM_ENTRIES_ON_DISK_OFS)))
--    return MZ_FALSE;
-+    return mz_zip_set_error(pZip, MZ_ZIP_FILE_READ_FAILED);
-+
-+  if (MZ_READ_LE32(pBuf + MZ_ZIP_ECDH_SIG_OFS) !=3D
-+      MZ_ZIP_END_OF_CENTRAL_DIR_HEADER_SIG)
-+    return mz_zip_set_error(pZip, MZ_ZIP_NOT_AN_ARCHIVE);
-+
-+  if (cur_file_ofs >=3D (MZ_ZIP64_END_OF_CENTRAL_DIR_LOCATOR_SIZE +
-+                       MZ_ZIP64_END_OF_CENTRAL_DIR_HEADER_SIZE)) {
-+    if (pZip->m_pRead(pZip->m_pIO_opaque,
-+                      cur_file_ofs - MZ_ZIP64_END_OF_CENTRAL_DIR_LOCATO=
R_SIZE,
-+                      pZip64_locator,
-+                      MZ_ZIP64_END_OF_CENTRAL_DIR_LOCATOR_SIZE) =3D=3D
-+        MZ_ZIP64_END_OF_CENTRAL_DIR_LOCATOR_SIZE) {
-+      if (MZ_READ_LE32(pZip64_locator + MZ_ZIP64_ECDL_SIG_OFS) =3D=3D
-+          MZ_ZIP64_END_OF_CENTRAL_DIR_LOCATOR_SIG) {
-+        zip64_end_of_central_dir_ofs =3D MZ_READ_LE64(
-+            pZip64_locator + MZ_ZIP64_ECDL_REL_OFS_TO_ZIP64_ECDR_OFS);
-+        if (zip64_end_of_central_dir_ofs >
-+            (pZip->m_archive_size - MZ_ZIP64_END_OF_CENTRAL_DIR_HEADER_=
SIZE))
-+          return mz_zip_set_error(pZip, MZ_ZIP_NOT_AN_ARCHIVE);
-+
-+        if (pZip->m_pRead(pZip->m_pIO_opaque, zip64_end_of_central_dir_=
ofs,
-+                          pZip64_end_of_central_dir,
-+                          MZ_ZIP64_END_OF_CENTRAL_DIR_HEADER_SIZE) =3D=3D
-+            MZ_ZIP64_END_OF_CENTRAL_DIR_HEADER_SIZE) {
-+          if (MZ_READ_LE32(pZip64_end_of_central_dir + MZ_ZIP64_ECDH_SI=
G_OFS) =3D=3D
-+              MZ_ZIP64_END_OF_CENTRAL_DIR_HEADER_SIG) {
-+            pZip->m_pState->m_zip64 =3D MZ_TRUE;
-+          }
-+        }
-+      }
-+    }
-+  }
-=20
-+  pZip->m_total_files =3D MZ_READ_LE16(pBuf + MZ_ZIP_ECDH_CDIR_TOTAL_EN=
TRIES_OFS);
-+  cdir_entries_on_this_disk =3D
-+      MZ_READ_LE16(pBuf + MZ_ZIP_ECDH_CDIR_NUM_ENTRIES_ON_DISK_OFS);
-   num_this_disk =3D MZ_READ_LE16(pBuf + MZ_ZIP_ECDH_NUM_THIS_DISK_OFS);
-   cdir_disk_index =3D MZ_READ_LE16(pBuf + MZ_ZIP_ECDH_NUM_DISK_CDIR_OFS=
);
-+  cdir_size =3D MZ_READ_LE32(pBuf + MZ_ZIP_ECDH_CDIR_SIZE_OFS);
-+  cdir_ofs =3D MZ_READ_LE32(pBuf + MZ_ZIP_ECDH_CDIR_OFS_OFS);
-+
-+  if (pZip->m_pState->m_zip64) {
-+    mz_uint32 zip64_total_num_of_disks =3D
-+        MZ_READ_LE32(pZip64_locator + MZ_ZIP64_ECDL_TOTAL_NUMBER_OF_DIS=
KS_OFS);
-+    mz_uint64 zip64_cdir_total_entries =3D MZ_READ_LE64(
-+        pZip64_end_of_central_dir + MZ_ZIP64_ECDH_CDIR_TOTAL_ENTRIES_OF=
S);
-+    mz_uint64 zip64_cdir_total_entries_on_this_disk =3D MZ_READ_LE64(
-+        pZip64_end_of_central_dir + MZ_ZIP64_ECDH_CDIR_NUM_ENTRIES_ON_D=
ISK_OFS);
-+    mz_uint64 zip64_size_of_end_of_central_dir_record =3D MZ_READ_LE64(
-+        pZip64_end_of_central_dir + MZ_ZIP64_ECDH_SIZE_OF_RECORD_OFS);
-+    mz_uint64 zip64_size_of_central_directory =3D
-+        MZ_READ_LE64(pZip64_end_of_central_dir + MZ_ZIP64_ECDH_CDIR_SIZ=
E_OFS);
-+
-+    if (zip64_size_of_end_of_central_dir_record <
-+        (MZ_ZIP64_END_OF_CENTRAL_DIR_HEADER_SIZE - 12))
-+      return mz_zip_set_error(pZip, MZ_ZIP_INVALID_HEADER_OR_CORRUPTED)=
;
-+
-+    if (zip64_total_num_of_disks !=3D 1U)
-+      return mz_zip_set_error(pZip, MZ_ZIP_UNSUPPORTED_MULTIDISK);
-+
-+    /* Check for miniz's practical limits */
-+    if (zip64_cdir_total_entries > MZ_UINT32_MAX)
-+      return mz_zip_set_error(pZip, MZ_ZIP_TOO_MANY_FILES);
-+
-+    pZip->m_total_files =3D (mz_uint32)zip64_cdir_total_entries;
-+
-+    if (zip64_cdir_total_entries_on_this_disk > MZ_UINT32_MAX)
-+      return mz_zip_set_error(pZip, MZ_ZIP_TOO_MANY_FILES);
-+
-+    cdir_entries_on_this_disk =3D
-+        (mz_uint32)zip64_cdir_total_entries_on_this_disk;
-+
-+    /* Check for miniz's current practical limits (sorry, this should b=
e enough
-+     * for millions of files) */
-+    if (zip64_size_of_central_directory > MZ_UINT32_MAX)
-+      return mz_zip_set_error(pZip, MZ_ZIP_UNSUPPORTED_CDIR_SIZE);
-+
-+    cdir_size =3D (mz_uint32)zip64_size_of_central_directory;
-+
-+    num_this_disk =3D MZ_READ_LE32(pZip64_end_of_central_dir +
-+                                 MZ_ZIP64_ECDH_NUM_THIS_DISK_OFS);
-+
-+    cdir_disk_index =3D MZ_READ_LE32(pZip64_end_of_central_dir +
-+                                   MZ_ZIP64_ECDH_NUM_DISK_CDIR_OFS);
-+
-+    cdir_ofs =3D
-+        MZ_READ_LE64(pZip64_end_of_central_dir + MZ_ZIP64_ECDH_CDIR_OFS=
_OFS);
-+  }
-+
-+  if (pZip->m_total_files !=3D cdir_entries_on_this_disk)
-+    return mz_zip_set_error(pZip, MZ_ZIP_UNSUPPORTED_MULTIDISK);
-+
-   if (((num_this_disk | cdir_disk_index) !=3D 0) &&
-       ((num_this_disk !=3D 1) || (cdir_disk_index !=3D 1)))
--    return MZ_FALSE;
-+    return mz_zip_set_error(pZip, MZ_ZIP_UNSUPPORTED_MULTIDISK);
-=20
--  if ((cdir_size =3D MZ_READ_LE32(pBuf + MZ_ZIP_ECDH_CDIR_SIZE_OFS)) <
--      pZip->m_total_files * MZ_ZIP_CENTRAL_DIR_HEADER_SIZE)
--    return MZ_FALSE;
-+  if (cdir_size < pZip->m_total_files * MZ_ZIP_CENTRAL_DIR_HEADER_SIZE)
-+    return mz_zip_set_error(pZip, MZ_ZIP_INVALID_HEADER_OR_CORRUPTED);
-=20
--  cdir_ofs =3D MZ_READ_LE32(pBuf + MZ_ZIP_ECDH_CDIR_OFS_OFS);
-   if ((cdir_ofs + (mz_uint64)cdir_size) > pZip->m_archive_size)
--    return MZ_FALSE;
-+    return mz_zip_set_error(pZip, MZ_ZIP_INVALID_HEADER_OR_CORRUPTED);
-=20
-   pZip->m_central_directory_file_ofs =3D cdir_ofs;
-=20
-   if (pZip->m_total_files) {
-     mz_uint i, n;
--
--    // Read the entire central directory into a heap block, and allocat=
e another
--    // heap block to hold the unsorted central dir file record offsets,=
 and
--    // another to hold the sorted indices.
-+    /* Read the entire central directory into a heap block, and allocat=
e another
-+     * heap block to hold the unsorted central dir file record offsets,=
 and
-+     * possibly another to hold the sorted indices. */
-     if ((!mz_zip_array_resize(pZip, &pZip->m_pState->m_central_dir, cdi=
r_size,
-                               MZ_FALSE)) ||
-         (!mz_zip_array_resize(pZip, &pZip->m_pState->m_central_dir_offs=
ets,
-                               pZip->m_total_files, MZ_FALSE)))
--      return MZ_FALSE;
-+      return mz_zip_set_error(pZip, MZ_ZIP_ALLOC_FAILED);
-=20
-     if (sort_central_dir) {
-       if (!mz_zip_array_resize(pZip,
-                                &pZip->m_pState->m_sorted_central_dir_of=
fsets,
-                                pZip->m_total_files, MZ_FALSE))
--        return MZ_FALSE;
-+        return mz_zip_set_error(pZip, MZ_ZIP_ALLOC_FAILED);
-     }
-=20
-     if (pZip->m_pRead(pZip->m_pIO_opaque, cdir_ofs,
-                       pZip->m_pState->m_central_dir.m_p,
-                       cdir_size) !=3D cdir_size)
--      return MZ_FALSE;
-+      return mz_zip_set_error(pZip, MZ_ZIP_FILE_READ_FAILED);
-=20
--    // Now create an index into the central directory file records, do =
some
--    // basic sanity checking on each record, and check for zip64 entrie=
s (which
--    // are not yet supported).
-+    /* Now create an index into the central directory file records, do =
some
-+     * basic sanity checking on each record */
-     p =3D (const mz_uint8 *)pZip->m_pState->m_central_dir.m_p;
-     for (n =3D cdir_size, i =3D 0; i < pZip->m_total_files; ++i) {
--      mz_uint total_header_size, comp_size, decomp_size, disk_index;
-+      mz_uint total_header_size, disk_index, bit_flags, filename_size,
-+          ext_data_size;
-+      mz_uint64 comp_size, decomp_size, local_header_ofs;
-+
-       if ((n < MZ_ZIP_CENTRAL_DIR_HEADER_SIZE) ||
-           (MZ_READ_LE32(p) !=3D MZ_ZIP_CENTRAL_DIR_HEADER_SIG))
--        return MZ_FALSE;
-+        return mz_zip_set_error(pZip, MZ_ZIP_INVALID_HEADER_OR_CORRUPTE=
D);
-+
-       MZ_ZIP_ARRAY_ELEMENT(&pZip->m_pState->m_central_dir_offsets, mz_u=
int32,
-                            i) =3D
-           (mz_uint32)(p - (const mz_uint8 *)pZip->m_pState->m_central_d=
ir.m_p);
-+
-       if (sort_central_dir)
-         MZ_ZIP_ARRAY_ELEMENT(&pZip->m_pState->m_sorted_central_dir_offs=
ets,
-                              mz_uint32, i) =3D i;
-+
-       comp_size =3D MZ_READ_LE32(p + MZ_ZIP_CDH_COMPRESSED_SIZE_OFS);
-       decomp_size =3D MZ_READ_LE32(p + MZ_ZIP_CDH_DECOMPRESSED_SIZE_OFS=
);
--      if (((!MZ_READ_LE32(p + MZ_ZIP_CDH_METHOD_OFS)) &&
--           (decomp_size !=3D comp_size)) ||
--          (decomp_size && !comp_size) || (decomp_size =3D=3D 0xFFFFFFFF=
) ||
--          (comp_size =3D=3D 0xFFFFFFFF))
--        return MZ_FALSE;
-+      local_header_ofs =3D MZ_READ_LE32(p + MZ_ZIP_CDH_LOCAL_HEADER_OFS=
);
-+      filename_size =3D MZ_READ_LE16(p + MZ_ZIP_CDH_FILENAME_LEN_OFS);
-+      ext_data_size =3D MZ_READ_LE16(p + MZ_ZIP_CDH_EXTRA_LEN_OFS);
-+
-+      if ((!pZip->m_pState->m_zip64_has_extended_info_fields) &&
-+          (ext_data_size) &&
-+          (MZ_MAX(MZ_MAX(comp_size, decomp_size), local_header_ofs) =3D=
=3D
-+           MZ_UINT32_MAX)) {
-+        /* Attempt to find zip64 extended information field in the entr=
y's extra
-+         * data */
-+        mz_uint32 extra_size_remaining =3D ext_data_size;
-+
-+        if (extra_size_remaining) {
-+          const mz_uint8 *pExtra_data;
-+          void *buf =3D NULL;
-+
-+          if (MZ_ZIP_CENTRAL_DIR_HEADER_SIZE + filename_size + ext_data=
_size >
-+              n) {
-+            buf =3D MZ_MALLOC(ext_data_size);
-+            if (buf =3D=3D NULL)
-+              return mz_zip_set_error(pZip, MZ_ZIP_ALLOC_FAILED);
-+
-+            if (pZip->m_pRead(pZip->m_pIO_opaque,
-+                              cdir_ofs + MZ_ZIP_CENTRAL_DIR_HEADER_SIZE=
 +
-+                                  filename_size,
-+                              buf, ext_data_size) !=3D ext_data_size) {
-+              MZ_FREE(buf);
-+              return mz_zip_set_error(pZip, MZ_ZIP_FILE_READ_FAILED);
-+            }
-+
-+            pExtra_data =3D (mz_uint8 *)buf;
-+          } else {
-+            pExtra_data =3D p + MZ_ZIP_CENTRAL_DIR_HEADER_SIZE + filena=
me_size;
-+          }
-+
-+          do {
-+            mz_uint32 field_id;
-+            mz_uint32 field_data_size;
-+
-+            if (extra_size_remaining < (sizeof(mz_uint16) * 2)) {
-+              MZ_FREE(buf);
-+              return mz_zip_set_error(pZip, MZ_ZIP_INVALID_HEADER_OR_CO=
RRUPTED);
-+            }
-+
-+            field_id =3D MZ_READ_LE16(pExtra_data);
-+            field_data_size =3D MZ_READ_LE16(pExtra_data + sizeof(mz_ui=
nt16));
-+
-+            if ((field_data_size + sizeof(mz_uint16) * 2) >
-+                extra_size_remaining) {
-+              MZ_FREE(buf);
-+              return mz_zip_set_error(pZip, MZ_ZIP_INVALID_HEADER_OR_CO=
RRUPTED);
-+            }
-+
-+            if (field_id =3D=3D MZ_ZIP64_EXTENDED_INFORMATION_FIELD_HEA=
DER_ID) {
-+              /* Ok, the archive didn't have any zip64 headers but it u=
ses a
-+               * zip64 extended information field so mark it as zip64 a=
nyway
-+               * (this can occur with infozip's zip util when it reads
-+               * compresses files from stdin). */
-+              pZip->m_pState->m_zip64 =3D MZ_TRUE;
-+              pZip->m_pState->m_zip64_has_extended_info_fields =3D MZ_T=
RUE;
-+              break;
-+            }
-+
-+            pExtra_data +=3D sizeof(mz_uint16) * 2 + field_data_size;
-+            extra_size_remaining =3D
-+                extra_size_remaining - sizeof(mz_uint16) * 2 - field_da=
ta_size;
-+          } while (extra_size_remaining);
-+
-+          MZ_FREE(buf);
-+        }
-+      }
-+
-+      /* I've seen archives that aren't marked as zip64 that uses zip64=
 ext
-+       * data, argh */
-+      if ((comp_size !=3D MZ_UINT32_MAX) && (decomp_size !=3D MZ_UINT32=
_MAX)) {
-+        if (((!MZ_READ_LE32(p + MZ_ZIP_CDH_METHOD_OFS)) &&
-+             (decomp_size !=3D comp_size)) ||
-+            (decomp_size && !comp_size))
-+          return mz_zip_set_error(pZip, MZ_ZIP_INVALID_HEADER_OR_CORRUP=
TED);
-+      }
-+
-       disk_index =3D MZ_READ_LE16(p + MZ_ZIP_CDH_DISK_START_OFS);
--      if ((disk_index !=3D num_this_disk) && (disk_index !=3D 1))
--        return MZ_FALSE;
--      if (((mz_uint64)MZ_READ_LE32(p + MZ_ZIP_CDH_LOCAL_HEADER_OFS) +
--           MZ_ZIP_LOCAL_DIR_HEADER_SIZE + comp_size) > pZip->m_archive_=
size)
--        return MZ_FALSE;
-+      if ((disk_index =3D=3D MZ_UINT16_MAX) ||
-+          ((disk_index !=3D num_this_disk) && (disk_index !=3D 1)))
-+        return mz_zip_set_error(pZip, MZ_ZIP_UNSUPPORTED_MULTIDISK);
-+
-+      if (comp_size !=3D MZ_UINT32_MAX) {
-+        if (((mz_uint64)MZ_READ_LE32(p + MZ_ZIP_CDH_LOCAL_HEADER_OFS) +
-+             MZ_ZIP_LOCAL_DIR_HEADER_SIZE + comp_size) > pZip->m_archiv=
e_size)
-+          return mz_zip_set_error(pZip, MZ_ZIP_INVALID_HEADER_OR_CORRUP=
TED);
-+      }
-+
-+      bit_flags =3D MZ_READ_LE16(p + MZ_ZIP_CDH_BIT_FLAG_OFS);
-+      if (bit_flags & MZ_ZIP_GENERAL_PURPOSE_BIT_FLAG_LOCAL_DIR_IS_MASK=
ED)
-+        return mz_zip_set_error(pZip, MZ_ZIP_UNSUPPORTED_ENCRYPTION);
-+
-       if ((total_header_size =3D MZ_ZIP_CENTRAL_DIR_HEADER_SIZE +
-                                MZ_READ_LE16(p + MZ_ZIP_CDH_FILENAME_LEN=
_OFS) +
-                                MZ_READ_LE16(p + MZ_ZIP_CDH_EXTRA_LEN_OF=
S) +
-                                MZ_READ_LE16(p + MZ_ZIP_CDH_COMMENT_LEN_=
OFS)) >
-           n)
--        return MZ_FALSE;
-+        return mz_zip_set_error(pZip, MZ_ZIP_INVALID_HEADER_OR_CORRUPTE=
D);
-+
-       n -=3D total_header_size;
-       p +=3D total_header_size;
-     }
-diff --git a/contrib/zip/src/zip.c b/contrib/zip/src/zip.c
-index ff3a8fe1..1abcfd8f 100644
---- a/contrib/zip/src/zip.c
-+++ b/contrib/zip/src/zip.c
-@@ -24,7 +24,6 @@
-   ((((P)[0] >=3D 'A' && (P)[0] <=3D 'Z') || ((P)[0] >=3D 'a' && (P)[0] =
<=3D 'z')) &&   \
-    (P)[1] =3D=3D ':')
- #define FILESYSTEM_PREFIX_LEN(P) (HAS_DEVICE(P) ? 2 : 0)
--#define ISSLASH(C) ((C) =3D=3D '/' || (C) =3D=3D '\\')
-=20
- #else
-=20
-@@ -48,7 +47,7 @@ int symlink(const char *target, const char *linkpath);=
 // needed on Linux
- #endif
-=20
- #ifndef ISSLASH
--#define ISSLASH(C) ((C) =3D=3D '/')
-+#define ISSLASH(C) ((C) =3D=3D '/' || (C) =3D=3D '\\')
- #endif
-=20
- #define CLEANUP(ptr)                                                   =
        \
-@@ -78,26 +77,34 @@ static const char *base_name(const char *name) {
-   return base;
- }
-=20
--static int mkpath(const char *path) {
--  char const *p;
-+static int mkpath(char *path) {
-+  char *p;
-   char npath[MAX_PATH + 1];
-   int len =3D 0;
-   int has_device =3D HAS_DEVICE(path);
-=20
-   memset(npath, 0, MAX_PATH + 1);
--
--#ifdef _WIN32
--  // only on windows fix the path
--  npath[0] =3D path[0];
--  npath[1] =3D path[1];
--  len =3D 2;
--#endif // _WIN32
--   =20
-+  if (has_device) {
-+    // only on windows
-+    npath[0] =3D path[0];
-+    npath[1] =3D path[1];
-+    len =3D 2;
-+  }
-   for (p =3D path + len; *p && len < MAX_PATH; p++) {
-     if (ISSLASH(*p) && ((!has_device && len > 0) || (has_device && len =
> 2))) {
--      if (MKDIR(npath) =3D=3D -1)
--        if (errno !=3D EEXIST)
-+#if defined(_WIN32) || defined(__WIN32__) || defined(_MSC_VER) ||      =
        \
-+    defined(__MINGW32__)
-+#else
-+      if ('\\' =3D=3D *p) {
-+        *p =3D '/';
-+      }
-+#endif
-+
-+      if (MKDIR(npath) =3D=3D -1) {
-+        if (errno !=3D EEXIST) {
-           return -1;
-+        }
-+      }
-     }
-     npath[len++] =3D *p;
-   }
-@@ -279,7 +286,14 @@ int zip_entry_open(struct zip_t *zip, const char *e=
ntryname) {
-   zip->entry.header_offset =3D zip->archive.m_archive_size;
-   memset(zip->entry.header, 0, MZ_ZIP_LOCAL_DIR_HEADER_SIZE * sizeof(mz=
_uint8));
-   zip->entry.method =3D 0;
-+
-+  // UNIX or APPLE
-+#if MZ_PLATFORM =3D=3D 3 || MZ_PLATFORM =3D=3D 19
-+  // regular file with rw-r--r-- persmissions
-+  zip->entry.external_attr =3D (mz_uint32)(0100644) << 16;
-+#else
-   zip->entry.external_attr =3D 0;
-+#endif
-=20
-   num_alignment_padding_bytes =3D
-       mz_zip_writer_compute_padding_needed_for_file_alignment(pzip);
-@@ -660,7 +674,7 @@ ssize_t zip_entry_noallocread(struct zip_t *zip, voi=
d *buf, size_t bufsize) {
-   }
-=20
-   if (!mz_zip_reader_extract_to_mem_no_alloc(pzip, (mz_uint)zip->entry.=
index,
--  buf, bufsize, 0, NULL,  0)) {
-+                                             buf, bufsize, 0, NULL, 0))=
 {
-     return -1;
-   }
-=20
-@@ -670,10 +684,7 @@ ssize_t zip_entry_noallocread(struct zip_t *zip, vo=
id *buf, size_t bufsize) {
- int zip_entry_fread(struct zip_t *zip, const char *filename) {
-   mz_zip_archive *pzip =3D NULL;
-   mz_uint idx;
--#if defined(_MSC_VER)
--#else
-   mz_uint32 xattr =3D 0;
--#endif
-   mz_zip_archive_file_stat info;
-=20
-   if (!zip) {
-@@ -875,12 +886,19 @@ int zip_extract(const char *zipname, const char *d=
ir,
-       goto out;
-     }
-=20
--    if ((((info.m_version_made_by >> 8) =3D=3D 3) || ((info.m_version_m=
ade_by >> 8) =3D=3D 19)) // if zip is produced on Unix or macOS (3 and 19=
 from section 4.4.2.2 of zip standard)
--        && info.m_external_attr & (0x20 << 24)) { // and has sym link a=
ttribute (0x80 is file, 0x40 is directory)
-+    if ((((info.m_version_made_by >> 8) =3D=3D 3) ||
-+         ((info.m_version_made_by >> 8) =3D=3D
-+          19)) // if zip is produced on Unix or macOS (3 and 19 from
-+               // section 4.4.2.2 of zip standard)
-+        && info.m_external_attr &
-+               (0x20 << 24)) { // and has sym link attribute (0x80 is f=
ile, 0x40
-+                               // is directory)
- #if defined(_WIN32) || defined(__WIN32__) || defined(_MSC_VER) ||      =
        \
-     defined(__MINGW32__)
--#else     =20
--      if (info.m_uncomp_size > MAX_PATH || !mz_zip_reader_extract_to_me=
m_no_alloc(&zip_archive, i, symlink_to, MAX_PATH, 0, NULL, 0)) {
-+#else
-+      if (info.m_uncomp_size > MAX_PATH ||
-+          !mz_zip_reader_extract_to_mem_no_alloc(&zip_archive, i, symli=
nk_to,
-+                                                 MAX_PATH, 0, NULL, 0))=
 {
-         goto out;
-       }
-       symlink_to[info.m_uncomp_size] =3D '\0';
-diff --git a/contrib/zip/src/zip.h b/contrib/zip/src/zip.h
-index 5f39df50..a48d64d6 100644
---- a/contrib/zip/src/zip.h
-+++ b/contrib/zip/src/zip.h
-@@ -20,241 +20,240 @@ extern "C" {
- #endif
-=20
- #if !defined(_SSIZE_T_DEFINED) && !defined(_SSIZE_T_DEFINED_) &&       =
        \
--    !defined(_SSIZE_T) && !defined(_SSIZE_T_) && !defined(__ssize_t_def=
ined)
--#define _SSIZE_T
-+    !defined(__DEFINED_ssize_t) && !defined(__ssize_t_defined) &&      =
        \
-+    !defined(_SSIZE_T) && !defined(_SSIZE_T_)
-+
- // 64-bit Windows is the only mainstream platform
- // where sizeof(long) !=3D sizeof(void*)
- #ifdef _WIN64
--typedef long long  ssize_t;  /* byte count or error */
-+typedef long long ssize_t; /* byte count or error */
- #else
--typedef long  ssize_t;  /* byte count or error */
-+typedef long ssize_t; /* byte count or error */
- #endif
-+
-+#define _SSIZE_T_DEFINED
-+#define _SSIZE_T_DEFINED_
-+#define __DEFINED_ssize_t
-+#define __ssize_t_defined
-+#define _SSIZE_T
-+#define _SSIZE_T_
-+
- #endif
-=20
- #ifndef MAX_PATH
- #define MAX_PATH 32767 /* # chars in a path name including NULL */
- #endif
-=20
-+/**
-+ * @mainpage
-+ *
-+ * Documenation for @ref zip.
-+ */
-+
-+/**
-+ * @addtogroup zip
-+ * @{
-+ */
-+
-+/**
-+ * Default zip compression level.
-+ */
-+
- #define ZIP_DEFAULT_COMPRESSION_LEVEL 6
-=20
--/*
--  This data structure is used throughout the library to represent zip a=
rchive
--  - forward declaration.
--*/
-+/**
-+ * @struct zip_t
-+ *
-+ * This data structure is used throughout the library to represent zip =
archive -
-+ * forward declaration.
-+ */
- struct zip_t;
-=20
--/*
--  Opens zip archive with compression level using the given mode.
--
--  Args:
--    zipname: zip archive file name.
--    level: compression level (0-9 are the standard zlib-style levels).
--    mode: file access mode.
--        'r': opens a file for reading/extracting (the file must exists).
--        'w': creates an empty file for writing.
--        'a': appends to an existing archive.
--
--  Returns:
--    The zip archive handler or NULL on error
--*/
-+/**
-+ * Opens zip archive with compression level using the given mode.
-+ *
-+ * @param zipname zip archive file name.
-+ * @param level compression level (0-9 are the standard zlib-style leve=
ls).
-+ * @param mode file access mode.
-+ *        - 'r': opens a file for reading/extracting (the file must exi=
sts).
-+ *        - 'w': creates an empty file for writing.
-+ *        - 'a': appends to an existing archive.
-+ *
-+ * @return the zip archive handler or NULL on error
-+ */
- extern struct zip_t *zip_open(const char *zipname, int level, char mode=
);
-=20
--/*
--  Closes the zip archive, releases resources - always finalize.
--
--  Args:
--    zip: zip archive handler.
--*/
-+/**
-+ * Closes the zip archive, releases resources - always finalize.
-+ *
-+ * @param zip zip archive handler.
-+ */
- extern void zip_close(struct zip_t *zip);
-=20
--/*
--  Opens an entry by name in the zip archive.
--  For zip archive opened in 'w' or 'a' mode the function will append
--  a new entry. In readonly mode the function tries to locate the entry
--  in global dictionary.
--
--  Args:
--    zip: zip archive handler.
--    entryname: an entry name in local dictionary.
--
--  Returns:
--    The return code - 0 on success, negative number (< 0) on error.
--*/
-+/**
-+ * Opens an entry by name in the zip archive.
-+ *
-+ * For zip archive opened in 'w' or 'a' mode the function will append
-+ * a new entry. In readonly mode the function tries to locate the entry
-+ * in global dictionary.
-+ *
-+ * @param zip zip archive handler.
-+ * @param entryname an entry name in local dictionary.
-+ *
-+ * @return the return code - 0 on success, negative number (< 0) on err=
or.
-+ */
- extern int zip_entry_open(struct zip_t *zip, const char *entryname);
-=20
--/*
--  Opens a new entry by index in the zip archive.
--  This function is only valid if zip archive was opened in 'r' (readonl=
y) mode.
--
--  Args:
--    zip: zip archive handler.
--    index: index in local dictionary.
--
--  Returns:
--    The return code - 0 on success, negative number (< 0) on error.
--*/
-+/**
-+ * Opens a new entry by index in the zip archive.
-+ *
-+ * This function is only valid if zip archive was opened in 'r' (readon=
ly) mode.
-+ *
-+ * @param zip zip archive handler.
-+ * @param index index in local dictionary.
-+ *
-+ * @return the return code - 0 on success, negative number (< 0) on err=
or.
-+ */
- extern int zip_entry_openbyindex(struct zip_t *zip, int index);
-=20
--/*
--  Closes a zip entry, flushes buffer and releases resources.
--
--  Args:
--    zip: zip archive handler.
--
--  Returns:
--    The return code - 0 on success, negative number (< 0) on error.
--*/
-+/**
-+ * Closes a zip entry, flushes buffer and releases resources.
-+ *
-+ * @param zip zip archive handler.
-+ *
-+ * @return the return code - 0 on success, negative number (< 0) on err=
or.
-+ */
- extern int zip_entry_close(struct zip_t *zip);
-=20
--/*
--  Returns a local name of the current zip entry.
--  The main difference between user's entry name and local entry name
--  is optional relative path.
--  Following .ZIP File Format Specification - the path stored MUST not c=
ontain
--  a drive or device letter, or a leading slash.
--  All slashes MUST be forward slashes '/' as opposed to backwards slash=
es '\'
--  for compatibility with Amiga and UNIX file systems etc.
--
--  Args:
--    zip: zip archive handler.
--
--  Returns:
--    The pointer to the current zip entry name, or NULL on error.
--*/
-+/**
-+ * Returns a local name of the current zip entry.
-+ *
-+ * The main difference between user's entry name and local entry name
-+ * is optional relative path.
-+ * Following .ZIP File Format Specification - the path stored MUST not =
contain
-+ * a drive or device letter, or a leading slash.
-+ * All slashes MUST be forward slashes '/' as opposed to backwards slas=
hes '\'
-+ * for compatibility with Amiga and UNIX file systems etc.
-+ *
-+ * @param zip: zip archive handler.
-+ *
-+ * @return the pointer to the current zip entry name, or NULL on error.
-+ */
- extern const char *zip_entry_name(struct zip_t *zip);
-=20
--/*
--  Returns an index of the current zip entry.
--
--  Args:
--    zip: zip archive handler.
--
--  Returns:
--    The index on success, negative number (< 0) on error.
--*/
-+/**
-+ * Returns an index of the current zip entry.
-+ *
-+ * @param zip zip archive handler.
-+ *
-+ * @return the index on success, negative number (< 0) on error.
-+ */
- extern int zip_entry_index(struct zip_t *zip);
-=20
--/*
--  Determines if the current zip entry is a directory entry.
--
--  Args:
--    zip: zip archive handler.
--
--  Returns:
--    The return code - 1 (true), 0 (false), negative number (< 0) on err=
or.
--*/
-+/**
-+ * Determines if the current zip entry is a directory entry.
-+ *
-+ * @param zip zip archive handler.
-+ *
-+ * @return the return code - 1 (true), 0 (false), negative number (< 0)=
 on
-+ *         error.
-+ */
- extern int zip_entry_isdir(struct zip_t *zip);
-=20
--/*
--  Returns an uncompressed size of the current zip entry.
--
--  Args:
--    zip: zip archive handler.
--
--  Returns:
--    The uncompressed size in bytes.
--*/
-+/**
-+ * Returns an uncompressed size of the current zip entry.
-+ *
-+ * @param zip zip archive handler.
-+ *
-+ * @return the uncompressed size in bytes.
-+ */
- extern unsigned long long zip_entry_size(struct zip_t *zip);
-=20
--/*
--  Returns CRC-32 checksum of the current zip entry.
--
--  Args:
--    zip: zip archive handler.
--
--  Returns:
--    The CRC-32 checksum.
--*/
-+/**
-+ * Returns CRC-32 checksum of the current zip entry.
-+ *
-+ * @param zip zip archive handler.
-+ *
-+ * @return the CRC-32 checksum.
-+ */
- extern unsigned int zip_entry_crc32(struct zip_t *zip);
-=20
--/*
--  Compresses an input buffer for the current zip entry.
--
--  Args:
--    zip: zip archive handler.
--    buf: input buffer.
--    bufsize: input buffer size (in bytes).
--
--  Returns:
--    The return code - 0 on success, negative number (< 0) on error.
--*/
-+/**
-+ * Compresses an input buffer for the current zip entry.
-+ *
-+ * @param zip zip archive handler.
-+ * @param buf input buffer.
-+ * @param bufsize input buffer size (in bytes).
-+ *
-+ * @return the return code - 0 on success, negative number (< 0) on err=
or.
-+ */
- extern int zip_entry_write(struct zip_t *zip, const void *buf, size_t b=
ufsize);
-=20
--/*
--  Compresses a file for the current zip entry.
--
--  Args:
--    zip: zip archive handler.
--    filename: input file.
--
--  Returns:
--    The return code - 0 on success, negative number (< 0) on error.
--*/
-+/**
-+ * Compresses a file for the current zip entry.
-+ *
-+ * @param zip zip archive handler.
-+ * @param filename input file.
-+ *
-+ * @return the return code - 0 on success, negative number (< 0) on err=
or.
-+ */
- extern int zip_entry_fwrite(struct zip_t *zip, const char *filename);
-=20
--/*
--  Extracts the current zip entry into output buffer.
--  The function allocates sufficient memory for a output buffer.
--
--  Args:
--    zip: zip archive handler.
--    buf: output buffer.
--    bufsize: output buffer size (in bytes).
--
--  Note:
--    - remember to release memory allocated for a output buffer.
--    - for large entries, please take a look at zip_entry_extract functi=
on.
--
--  Returns:
--    The return code - the number of bytes actually read on success.
--    Otherwise a -1 on error.
--*/
-+/**
-+ * Extracts the current zip entry into output buffer.
-+ *
-+ * The function allocates sufficient memory for a output buffer.
-+ *
-+ * @param zip zip archive handler.
-+ * @param buf output buffer.
-+ * @param bufsize output buffer size (in bytes).
-+ *
-+ * @note remember to release memory allocated for a output buffer.
-+ *       for large entries, please take a look at zip_entry_extract fun=
ction.
-+ *
-+ * @return the return code - the number of bytes actually read on succe=
ss.
-+ *         Otherwise a -1 on error.
-+ */
- extern ssize_t zip_entry_read(struct zip_t *zip, void **buf, size_t *bu=
fsize);
-=20
--/*
--  Extracts the current zip entry into a memory buffer using no memory
--  allocation.
--
--  Args:
--    zip: zip archive handler.
--    buf: preallocated output buffer.
--    bufsize: output buffer size (in bytes).
--
--  Note:
--    - ensure supplied output buffer is large enough.
--    - zip_entry_size function (returns uncompressed size for the curren=
t entry)
--      can be handy to estimate how big buffer is needed.
--    - for large entries, please take a look at zip_entry_extract functi=
on.
--
--  Returns:
--    The return code - the number of bytes actually read on success.
--    Otherwise a -1 on error (e.g. bufsize is not large enough).
--*/
--extern ssize_t zip_entry_noallocread(struct zip_t *zip, void *buf, size=
_t bufsize);
--
--/*
--  Extracts the current zip entry into output file.
--
--  Args:
--    zip: zip archive handler.
--    filename: output file.
--
--  Returns:
--    The return code - 0 on success, negative number (< 0) on error.
--*/
-+/**
-+ * Extracts the current zip entry into a memory buffer using no memory
-+ * allocation.
-+ *
-+ * @param zip zip archive handler.
-+ * @param buf preallocated output buffer.
-+ * @param bufsize output buffer size (in bytes).
-+ *
-+ * @note ensure supplied output buffer is large enough.
-+ *       zip_entry_size function (returns uncompressed size for the cur=
rent
-+ *       entry) can be handy to estimate how big buffer is needed. for =
large
-+ * entries, please take a look at zip_entry_extract function.
-+ *
-+ * @return the return code - the number of bytes actually read on succe=
ss.
-+ *         Otherwise a -1 on error (e.g. bufsize is not large enough).
-+ */
-+extern ssize_t zip_entry_noallocread(struct zip_t *zip, void *buf,
-+                                     size_t bufsize);
-+
-+/**
-+ * Extracts the current zip entry into output file.
-+ *
-+ * @param zip zip archive handler.
-+ * @param filename output file.
-+ *
-+ * @return the return code - 0 on success, negative number (< 0) on err=
or.
-+ */
- extern int zip_entry_fread(struct zip_t *zip, const char *filename);
-=20
--/*
--  Extracts the current zip entry using a callback function (on_extract).
--
--  Args:
--    zip: zip archive handler.
--    on_extract: callback function.
--    arg: opaque pointer (optional argument,
--                         which you can pass to the on_extract callback)
--
--   Returns:
--    The return code - 0 on success, negative number (< 0) on error.
-+/**
-+ * Extracts the current zip entry using a callback function (on_extract=
).
-+ *
-+ * @param zip zip archive handler.
-+ * @param on_extract callback function.
-+ * @param arg opaque pointer (optional argument, which you can pass to =
the
-+ *        on_extract callback)
-+ *
-+ * @return the return code - 0 on success, negative number (< 0) on err=
or.
-  */
- extern int
- zip_entry_extract(struct zip_t *zip,
-@@ -262,53 +261,49 @@ zip_entry_extract(struct zip_t *zip,
-                                        const void *data, size_t size),
-                   void *arg);
-=20
--/*
--  Returns the number of all entries (files and directories) in the zip =
archive.
--
--  Args:
--    zip: zip archive handler.
--
--  Returns:
--    The return code - the number of entries on success,
--    negative number (< 0) on error.
--*/
-+/**
-+ * Returns the number of all entries (files and directories) in the zip=
 archive.
-+ *
-+ * @param zip zip archive handler.
-+ *
-+ * @return the return code - the number of entries on success, negative=
 number
-+ *         (< 0) on error.
-+ */
- extern int zip_total_entries(struct zip_t *zip);
-=20
--/*
--  Creates a new archive and puts files into a single zip archive.
--
--  Args:
--    zipname: zip archive file.
--    filenames: input files.
--    len: number of input files.
--
--  Returns:
--    The return code - 0 on success, negative number (< 0) on error.
--*/
-+/**
-+ * Creates a new archive and puts files into a single zip archive.
-+ *
-+ * @param zipname zip archive file.
-+ * @param filenames input files.
-+ * @param len: number of input files.
-+ *
-+ * @return the return code - 0 on success, negative number (< 0) on err=
or.
-+ */
- extern int zip_create(const char *zipname, const char *filenames[], siz=
e_t len);
-=20
--/*
--  Extracts a zip archive file into directory.
--
--  If on_extract_entry is not NULL, the callback will be called after
--  successfully extracted each zip entry.
--  Returning a negative value from the callback will cause abort and ret=
urn an
--  error. The last argument (void *arg) is optional, which you can use t=
o pass
--  data to the on_extract_entry callback.
--
--  Args:
--    zipname: zip archive file.
--    dir: output directory.
--    on_extract_entry: on extract callback.
--    arg: opaque pointer.
--
--  Returns:
--    The return code - 0 on success, negative number (< 0) on error.
--*/
-+/**
-+ * Extracts a zip archive file into directory.
-+ *
-+ * If on_extract_entry is not NULL, the callback will be called after
-+ * successfully extracted each zip entry.
-+ * Returning a negative value from the callback will cause abort and re=
turn an
-+ * error. The last argument (void *arg) is optional, which you can use =
to pass
-+ * data to the on_extract_entry callback.
-+ *
-+ * @param zipname zip archive file.
-+ * @param dir output directory.
-+ * @param on_extract_entry on extract callback.
-+ * @param arg opaque pointer.
-+ *
-+ * @return the return code - 0 on success, negative number (< 0) on err=
or.
-+ */
- extern int zip_extract(const char *zipname, const char *dir,
-                        int (*on_extract_entry)(const char *filename, vo=
id *arg),
-                        void *arg);
-=20
-+/** @} */
-+
- #ifdef __cplusplus
- }
- #endif
-diff --git a/contrib/zip/test/CMakeLists.txt b/contrib/zip/test/CMakeLis=
ts.txt
-index 9b2a8db1..cc060b00 100644
---- a/contrib/zip/test/CMakeLists.txt
-+++ b/contrib/zip/test/CMakeLists.txt
-@@ -1,19 +1,16 @@
- cmake_minimum_required(VERSION 2.8)
-=20
--if ("${CMAKE_C_COMPILER_ID}" STREQUAL "GNU" OR "${CMAKE_C_COMPILER_ID}"=
 STREQUAL "Clang" OR "${CMAKE_C_COMPILER_ID}" STREQUAL "AppleClang")
--  if(ENABLE_COVERAGE)
--    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -g ")
--    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -O0")
--    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fprofile-arcs")
--    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -ftest-coverage")
--    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} --coverage")
--  endif()
--endif ()
--
- # test
--include_directories(../src)
--add_executable(test.exe test.c ../src/zip.c)
--add_executable(test_miniz.exe test_miniz.c)
-+set(test_out test.out)
-+set(test_miniz_out test_miniz.out)
-+
-+add_executable(${test_out} test.c)
-+target_link_libraries(${test_out} zip)
-+add_executable(${test_miniz_out} test_miniz.c)
-+target_link_libraries(${test_miniz_out} zip)
-+
-+add_test(NAME ${test_out} COMMAND ${test_out})
-+add_test(NAME ${test_miniz_out} COMMAND ${test_miniz_out})
-=20
--add_test(NAME test COMMAND test.exe)
--add_test(NAME test_miniz COMMAND test_miniz.exe)
-+set(test_out ${test_out} PARENT_SCOPE)
-+set(test_miniz_out ${test_miniz_out} PARENT_SCOPE)
-diff --git a/contrib/zip/test/test.c b/contrib/zip/test/test.c
-index 45443053..a9b2ddab 100644
---- a/contrib/zip/test/test.c
-+++ b/contrib/zip/test/test.c
-@@ -29,6 +29,8 @@
- #define XFILE "7.txt\0"
- #define XMODE 0100777
-=20
-+#define UNIXMODE 0100644
-+
- #define UNUSED(x) (void)x
-=20
- static int total_entries =3D 0;
-@@ -102,7 +104,8 @@ static void test_read(void) {
-   assert(0 =3D=3D zip_entry_close(zip));
-   free(buf);
-   buf =3D NULL;
-- =20
-+  bufsize =3D 0;
-+
-   assert(0 =3D=3D zip_entry_open(zip, "test/test-2.txt"));
-   assert(strlen(TESTDATA2) =3D=3D zip_entry_size(zip));
-   assert(CRC32DATA2 =3D=3D zip_entry_crc32(zip));
-@@ -131,7 +134,8 @@ static void test_read(void) {
-   assert(0 =3D=3D zip_entry_close(zip));
-   free(buf);
-   buf =3D NULL;
-- =20
-+  bufsize =3D 0;
-+
-   buftmp =3D strlen(TESTDATA1);
-   buf =3D calloc(buftmp, sizeof(char));
-   assert(0 =3D=3D zip_entry_open(zip, "test/test-1.txt"));
-@@ -433,6 +437,35 @@ static void test_mtime(void) {
-   remove(ZIPNAME);
- }
-=20
-+static void test_unix_permissions(void) {
-+#if defined(_WIN64) || defined(_WIN32) || defined(__WIN32__)
-+#else
-+  // UNIX or APPLE
-+  struct MZ_FILE_STAT_STRUCT file_stats;
-+
-+  remove(ZIPNAME);
-+
-+  struct zip_t *zip =3D zip_open(ZIPNAME, ZIP_DEFAULT_COMPRESSION_LEVEL=
, 'w');
-+  assert(zip !=3D NULL);
-+
-+  assert(0 =3D=3D zip_entry_open(zip, RFILE));
-+  assert(0 =3D=3D zip_entry_write(zip, TESTDATA1, strlen(TESTDATA1)));
-+  assert(0 =3D=3D zip_entry_close(zip));
-+
-+  zip_close(zip);
-+
-+  remove(RFILE);
-+
-+  assert(0 =3D=3D zip_extract(ZIPNAME, ".", NULL, NULL));
-+
-+  assert(0 =3D=3D MZ_FILE_STAT(RFILE, &file_stats));
-+  assert(UNIXMODE =3D=3D file_stats.st_mode);
-+
-+  remove(RFILE);
-+  remove(ZIPNAME);
-+#endif
-+}
-+
- int main(int argc, char *argv[]) {
-   UNUSED(argc);
-   UNUSED(argv);
-@@ -453,6 +486,7 @@ int main(int argc, char *argv[]) {
-   test_write_permissions();
-   test_exe_permissions();
-   test_mtime();
-+  test_unix_permissions();
-=20
-   remove(ZIPNAME);
-   return 0;
-diff --git a/contrib/zip/test/test_miniz.c b/contrib/zip/test/test_miniz=
.c
-index ebc0564d..babcaecd 100644
---- a/contrib/zip/test/test_miniz.c
-+++ b/contrib/zip/test/test_miniz.c
-@@ -23,16 +23,39 @@ int main(int argc, char *argv[]) {
-   uint step =3D 0;
-   int cmp_status;
-   uLong src_len =3D (uLong)strlen(s_pStr);
--  uLong cmp_len =3D compressBound(src_len);
-   uLong uncomp_len =3D src_len;
-+  uLong cmp_len;
-   uint8 *pCmp, *pUncomp;
-+  size_t sz;
-   uint total_succeeded =3D 0;
-   (void)argc, (void)argv;
-=20
-   printf("miniz.c version: %s\n", MZ_VERSION);
-=20
-   do {
-+    pCmp =3D (uint8 *)tdefl_compress_mem_to_heap(s_pStr, src_len, &cmp_=
len, 0);
-+    if (!pCmp) {
-+      printf("tdefl_compress_mem_to_heap failed\n");
-+      return EXIT_FAILURE;
-+    }
-+    if (src_len <=3D cmp_len) {
-+      printf("tdefl_compress_mem_to_heap failed: from %u to %u bytes\n"=
,
-+             (mz_uint32)uncomp_len, (mz_uint32)cmp_len);
-+      free(pCmp);
-+      return EXIT_FAILURE;
-+    }
-+
-+    sz =3D tdefl_compress_mem_to_mem(pCmp, cmp_len, s_pStr, src_len, 0)=
;
-+    if (sz !=3D cmp_len) {
-+      printf("tdefl_compress_mem_to_mem failed: expected %u, got %u\n",
-+             (mz_uint32)cmp_len, (mz_uint32)sz);
-+      free(pCmp);
-+      return EXIT_FAILURE;
-+    }
-+
-     // Allocate buffers to hold compressed and uncompressed data.
-+    free(pCmp);
-+    cmp_len =3D compressBound(src_len);
-     pCmp =3D (mz_uint8 *)malloc((size_t)cmp_len);
-     pUncomp =3D (mz_uint8 *)malloc((size_t)src_len);
-     if ((!pCmp) || (!pUncomp)) {
diff --git a/meta/recipes-graphics/vulkan/assimp_5.0.1.bb b/meta/recipes-=
graphics/vulkan/assimp_5.0.1.bb
deleted file mode 100644
index 5a8c62e64d..0000000000
--- a/meta/recipes-graphics/vulkan/assimp_5.0.1.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-DESCRIPTION =3D "Open Asset Import Library is a portable Open Source lib=
rary to import \
-               various well-known 3D model formats in a uniform manner."
-HOMEPAGE =3D "http://www.assimp.org/"
-SECTION =3D "devel"
-
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2119edef0916b0bd511cb3c731076=
271"
-
-DEPENDS =3D "zlib"
-
-SRC_URI =3D "git://github.com/assimp/assimp.git;branch=3Dassimp_5.0_rele=
ase \
-           file://0001-closes-https-github.com-assimp-assimp-issues-2733=
-up.patch \
-           file://0001-Use-ASSIMP_LIB_INSTALL_DIR-to-search-library.patc=
h \
-           "
-UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>(\d+(\.\d+)+))"
-
-SRCREV =3D "8f0c6b04b2257a520aaab38421b2e090204b69df"
-
-S =3D "${WORKDIR}/git"
-
-inherit cmake
-
-EXTRA_OECMAKE =3D "-DASSIMP_BUILD_ASSIMP_TOOLS=3DOFF -DASSIMP_BUILD_TEST=
S=3DOFF -DASSIMP_LIB_INSTALL_DIR=3D${baselib}"
--=20
2.17.1

