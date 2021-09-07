Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
 by mx.groups.io with SMTP id smtpd.web12.34824.1631019000526340291
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Sep 2021 05:50:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ir8202LQ;
 spf=pass (domain: gmail.com, ip: 209.85.222.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f47.google.com with SMTP id x23so5491880uav.3
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Sep 2021 05:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Uj2VUzIsGNLJTkVv1t+6iP8mQFs3KZkgYnpbNZO9swk=;
        b=ir8202LQObU8o+40qkBOHF1ZHnXEdD0GRHSVUUo+JMvp5EOy8aDU9lRP3FGf4ho6Ot
         4nItLYbCgyrHgU1RXc1O5C5YpwgRQsNQvRqxLzMLg4F5fEBf0RKoLwnVUoff/13QrHYK
         npqOJX2o+QIB9Jc3t4SBYh6J8gVnTu3aaI9+yot6ZL+89rs9CflWwCPbjp10Y6zGcPpq
         TQBxp0y+xk7cbBuvTPzULuo4MZVCtRHS1rdxOBAQfgxEg2mbjUI6Inrb1/QCjP4th7f7
         vnvaYQKDYq61vK2xVFrNesBCeMOlHuXOSSa3GoMc7ft88fRTYFvzeP/r5vP5PV5CLaQb
         Qbfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Uj2VUzIsGNLJTkVv1t+6iP8mQFs3KZkgYnpbNZO9swk=;
        b=VKB+BMxYLS525/NTynv+0a1EKmoa88UXUpliheyq9sus591DaMHxt71bb6fp4SkCSG
         Mu9sdWn2K3z/IEQA3xwzlvblrLdZ5qleB89wO6kJvwMUwOW/adID/ud/EMWB2x5FI6WZ
         YL99DxJXH5YMmjV1V5SWdLE3Izcls1F2/gjHah7xDghfWCuLcJ9EVq4Th4o498r3XRt5
         1TRGejEUYbIPeZrLjVZtayn9vC3L07aTi36GHQYVHwRjyhBdkh/+MKNLOKilp9w1/lOL
         ykwN7zzNp3gNdjKskg8o/kCLqlnmskNt5v1y+CimeKRHda15OqPJ3QM6cXqYfWxTXDip
         P+5Q==
X-Gm-Message-State: AOAM531nCA7WKd21DE5DQrpSZD8hHTRHhegPMtBe7efhxiyhqzxJtSsg
	HWPIDJepnZ4bl27F5vN+0XV/Vop33c6ogfFJ0AI=
X-Google-Smtp-Source: ABdhPJxNrOeDnFYDlzkjxkhovBkRuQuDvOATVcDct6I1csDheLLWTurAU9TG9Uwwey2URx1ip7iuBY9Ug8ExWoNN9nU=
X-Received: by 2002:ab0:25ce:: with SMTP id y14mr7977761uan.22.1631018998934;
 Tue, 07 Sep 2021 05:49:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1631006167.git.liezhi.yang@windriver.com>
 <ed036834262a67e88a58001d20c719bed37d50f5.1631006167.git.liezhi.yang@windriver.com>
 <945b8038-97c7-1264-594f-e3b424695c22@windriver.com>
In-Reply-To: <945b8038-97c7-1264-594f-e3b424695c22@windriver.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 7 Sep 2021 14:49:47 +0200
Message-ID: <CANNYZj_6j9W0KKuR68KjRk+=MTQx_EOcuWnH3Zt1aKZHJZzvHA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] assimp: Remove it
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Robert Yang <liezhi.yang@windriver.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000000db23f05cb6734c0"

--0000000000000db23f05cb6734c0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 7 Sept 2021 at 14:04, Randy MacLeod <randy.macleod@windriver.com>
wrote:

> In master, it seems that vulkan* depends on assimp:
>
>
> https://layers.openembedded.org/layerindex/branch/master/recipes/?q=3Ddep=
ends%3Aassimp
>
> and lots of recipes in meta-qt5 and meta-ros* so removing it here
> would just push the problem around.
>

I'm not sure why layerindex says otherewise, but neither vulkan nor
anything in meta-qt5 actually depend on assimp.
qt5/6 has an option, off by default, to use external assimp, vulkan has no
dependency at all.

This leaves basically meta-ros, so carrying assimp for the benefit of a
single layer is dubious at best.

Alex



>
> I'll look at the sections that you have pointed out later today.
>
> ../Randy
>
> >
> > Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > ---
> >   meta/conf/distro/include/maintainers.inc      |    1 -
> >   ...hared-lib-from-_IMPORT_CHECK_TARGETS.patch |   32 -
> >   ...hub.com-assimp-assimp-issues-2733-up.patch | 1664 ----------------=
-
> >   .../use-GNUInstallDirs-where-possible.patch   |  257 ---
> >   meta/recipes-graphics/vulkan/assimp_5.0.1.bb  |   26 -
> >   5 files changed, 1980 deletions(-)
> >   delete mode 100644
> meta/recipes-graphics/vulkan/assimp/0001-assimp-remove-shared-lib-from-_I=
MPORT_CHECK_TARGETS.patch
> >   delete mode 100644
> meta/recipes-graphics/vulkan/assimp/0001-closes-https-github.com-assimp-a=
ssimp-issues-2733-up.patch
> >   delete mode 100644
> meta/recipes-graphics/vulkan/assimp/use-GNUInstallDirs-where-possible.pat=
ch
> >   delete mode 100644 meta/recipes-graphics/vulkan/assimp_5.0.1.bb
> >
> > diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> > index 0e8185f4e3..e560ba39dd 100644
> > --- a/meta/conf/distro/include/maintainers.inc
> > +++ b/meta/conf/distro/include/maintainers.inc
> > @@ -46,7 +46,6 @@ RECIPE_MAINTAINER:pn-apt =3D "An=C3=ADbal Lim=C3=B3n =
<
> limon.anibal@gmail.com>"
> >   RECIPE_MAINTAINER:pn-argp-standalone =3D "Khem Raj <raj.khem@gmail.co=
m>"
> >   RECIPE_MAINTAINER:pn-asciidoc =3D "Yi Zhao <yi.zhao@windriver.com>"
> >   RECIPE_MAINTAINER:pn-aspell =3D "Anuj Mittal <anuj.mittal@intel.com>"
> > -RECIPE_MAINTAINER:pn-assimp =3D "Anuj Mittal <anuj.mittal@intel.com>"
> >   RECIPE_MAINTAINER:pn-at =3D "Chen Qi <Qi.Chen@windriver.com>"
> >   RECIPE_MAINTAINER:pn-at-spi2-atk =3D "Tim Orling <
> timothy.t.orling@intel.com>"
> >   RECIPE_MAINTAINER:pn-at-spi2-core =3D "Tim Orling <
> timothy.t.orling@intel.com>"
> > diff --git
> a/meta/recipes-graphics/vulkan/assimp/0001-assimp-remove-shared-lib-from-=
_IMPORT_CHECK_TARGETS.patch
> b/meta/recipes-graphics/vulkan/assimp/0001-assimp-remove-shared-lib-from-=
_IMPORT_CHECK_TARGETS.patch
> > deleted file mode 100644
> > index 1078148d6b..0000000000
> > ---
> a/meta/recipes-graphics/vulkan/assimp/0001-assimp-remove-shared-lib-from-=
_IMPORT_CHECK_TARGETS.patch
> > +++ /dev/null
> > @@ -1,32 +0,0 @@
> > -From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> > -Date: Fri, 13 Aug 2021 16:42:48 +0530
> > -Subject: [PATCH] assimp: remove shared lib from _IMPORT_CHECK_TARGETS
> > -
> > -In the target assimp::assimp shared library verification removed
> > -as it is giving configuration error when used by 3rd part component to
> > -configure itself using assimp::assimp target
> > -
> > -Upstream-Status: Inappropriate [oe specific]
> > -
> > -Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> > ----
> > - assimpTargets-release.cmake.in | 4 ++--
> > - 1 file changed, 2 insertions(+), 2 deletions(-)
> > -
> > -diff --git a/assimpTargets-release.cmake.in b/
> assimpTargets-release.cmake.in
> > -index cd2fac7e0..52edc7990 100644
> > ---- a/assimpTargets-release.cmake.in
> > -+++ b/assimpTargets-release.cmake.in
> > -@@ -72,8 +72,8 @@ else()
> > -       IMPORTED_SONAME_RELEASE "${sharedLibraryName}"
> > -       IMPORTED_LOCATION_RELEASE "@CMAKE_INSTALL_FULL_LIBDIR@
> /${sharedLibraryName}"
> > -     )
> > --    list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> > --    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> "@CMAKE_INSTALL_FULL_LIBDIR@/${sharedLibraryName}" )
> > -+    #list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> > -+    #list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> "@CMAKE_INSTALL_FULL_LIBDIR@/${sharedLibraryName}" )
> > -   else()
> > -     set(staticLibraryName
> "libassimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_STATIC_LIBRARY_SUFFIX@")
> > -     set_target_properties(assimp::assimp PROPERTIES
> > ---
> > -2.17.1
> > diff --git
> a/meta/recipes-graphics/vulkan/assimp/0001-closes-https-github.com-assimp=
-assimp-issues-2733-up.patch
> b/meta/recipes-graphics/vulkan/assimp/0001-closes-https-github.com-assimp=
-assimp-issues-2733-up.patch
> > deleted file mode 100644
> > index 87a1658710..0000000000
> > ---
> a/meta/recipes-graphics/vulkan/assimp/0001-closes-https-github.com-assimp=
-assimp-issues-2733-up.patch
> > +++ /dev/null
> > @@ -1,1664 +0,0 @@
> > -From 7fc220b2350d78942fb3935cad0b1564418ebe8f Mon Sep 17 00:00:00 2001
> > -From: Kim Kulling <kim.kulling@googlemail.com>
> > -Date: Tue, 19 Nov 2019 20:30:40 +0100
> > -Subject: [PATCH] closes https://github.com/assimp/assimp/issues/2733:
> update
> > - of zlip to fix gcc build for v9.2.0 32 bit
> > -
> > -Upstream-Status: Backport [
> https://github.com/assimp/assimp/commit/f78446b14aff46db2ef27d062a275b6a0=
1fd68b1
> ]
> > -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ----
> > - contrib/zip/.gitignore          |   2 +
> > - contrib/zip/CMakeLists.txt      |  83 +++++-
> > - contrib/zip/README.md           |  12 +-
> > - contrib/zip/appveyor.yml        |   2 +-
> > - contrib/zip/src/miniz.h         | 457 ++++++++++++++++++++++++++++---=
-
> > - contrib/zip/src/zip.c           |  62 +++--
> > - contrib/zip/src/zip.h           | 457 ++++++++++++++++---------------=
-
> > - contrib/zip/test/CMakeLists.txt |  27 +-
> > - contrib/zip/test/test.c         |  38 ++-
> > - contrib/zip/test/test_miniz.c   |  25 +-
> > - 10 files changed, 821 insertions(+), 344 deletions(-)
> > -
> > -diff --git a/contrib/zip/.gitignore b/contrib/zip/.gitignore
> > -index a7904a1e..49b2cb2f 100644
> > ---- a/contrib/zip/.gitignore
> > -+++ b/contrib/zip/.gitignore
> > -@@ -1,6 +1,7 @@
> > - /build/
> > - /test/build/
> > - /xcodeproj/
> > -+.vscode/
> > -
> > - # Object files
> > - *.o
> > -@@ -54,3 +55,4 @@ zip.dir/
> > - test/test.exe.vcxproj.filters
> > - test/test.exe.vcxproj
> > - test/test.exe.dir/
> > -+
> > -diff --git a/contrib/zip/CMakeLists.txt b/contrib/zip/CMakeLists.txt
> > -index b46dbb1d..77916d2e 100644
> > ---- a/contrib/zip/CMakeLists.txt
> > -+++ b/contrib/zip/CMakeLists.txt
> > -@@ -1,10 +1,14 @@
> > --cmake_minimum_required(VERSION 2.8)
> > --project(zip)
> > --enable_language(C)
> > -+cmake_minimum_required(VERSION 3.0)
> > -+
> > -+project(zip
> > -+  LANGUAGES C
> > -+  VERSION "0.1.15")
> > - set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake"
> ${CMAKE_MODULE_PATH})
> > -
> > -+option(CMAKE_DISABLE_TESTING "Disable test creation" OFF)
> > -+
> > - if (MSVC)
> > --  # Use secure functions by defaualt and suppress warnings about
> "deprecated" functions
> > -+  # Use secure functions by default and suppress warnings about
> "deprecated" functions
> > -   set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} /D
> _CRT_SECURE_CPP_OVERLOAD_STANDARD_NAMES=3D1")
> > -   set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} /D
> _CRT_SECURE_CPP_OVERLOAD_STANDARD_NAMES_COUNT=3D1")
> > -   set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} /D _CRT_NONSTDC_NO_WARNINGS=3D1=
 /D
> _CRT_SECURE_NO_WARNINGS=3D1")
> > -@@ -12,28 +16,80 @@ elseif ("${CMAKE_C_COMPILER_ID}" STREQUAL "GNU" OR
> > -         "${CMAKE_C_COMPILER_ID}" STREQUAL "Clang" OR
> > -         "${CMAKE_C_COMPILER_ID}" STREQUAL "AppleClang")
> > -   set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -std=3Dc99 -Wall -Wextra -Werro=
r
> -pedantic")
> > -+  if(ENABLE_COVERAGE)
> > -+    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -g -O0 -fprofile-arcs
> -ftest-coverage")
> > -+    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} --coverage"=
)
> > -+  endif()
> > - endif (MSVC)
> > -
> > - # zip
> > - set(SRC src/miniz.h src/zip.h src/zip.c)
> > - add_library(${PROJECT_NAME} ${SRC})
> > --target_include_directories(${PROJECT_NAME} INTERFACE src)
> > -+target_include_directories(${PROJECT_NAME} PUBLIC
> > -+  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/src>
> > -+  $<INSTALL_INTERFACE:include>
> > -+)
> > -
> > - # test
> > - if (NOT CMAKE_DISABLE_TESTING)
> > -   enable_testing()
> > -   add_subdirectory(test)
> > -   find_package(Sanitizers)
> > --  add_sanitizers(${PROJECT_NAME} test.exe)
> > --  add_sanitizers(${PROJECT_NAME} test_miniz.exe)
> > -+  add_sanitizers(${PROJECT_NAME} ${test_out} ${test_miniz_out})
> > - endif()
> > -
> > -+####
> > -+# Installation (https://github.com/forexample/package-example) {
> > -+
> > -+set(CONFIG_INSTALL_DIR "lib/cmake/${PROJECT_NAME}")
> > -+set(INCLUDE_INSTALL_DIR "include")
> > -+
> > -+set(GENERATED_DIR "${CMAKE_CURRENT_BINARY_DIR}/generated")
> > -+
> > -+# Configuration
> > -+set(VERSION_CONFIG
> "${GENERATED_DIR}/${PROJECT_NAME}ConfigVersion.cmake")
> > -+set(PROJECT_CONFIG "${GENERATED_DIR}/${PROJECT_NAME}Config.cmake")
> > -+set(TARGETS_EXPORT_NAME "${PROJECT_NAME}Targets")
> > -+set(NAMESPACE "${PROJECT_NAME}::")
> > -+
> > -+# Include module with fuction 'write_basic_package_version_file'
> > -+include(CMakePackageConfigHelpers)
> > -+
> > -+# Note: PROJECT_VERSION is used as a VERSION
> > -+write_basic_package_version_file(
> > -+    "${VERSION_CONFIG}" COMPATIBILITY SameMajorVersion
> > -+)
> > -+
> > -+# Use variables:
> > -+#   * TARGETS_EXPORT_NAME
> > -+#   * PROJECT_NAME
> > -+configure_package_config_file(
> > -+    "cmake/Config.cmake.in"
> > -+    "${PROJECT_CONFIG}"
> > -+    INSTALL_DESTINATION "${CONFIG_INSTALL_DIR}"
> > -+)
> > -+
> > -+install(
> > -+    FILES "${PROJECT_CONFIG}" "${VERSION_CONFIG}"
> > -+    DESTINATION "${CONFIG_INSTALL_DIR}"
> > -+)
> > -+
> > -+install(
> > -+    EXPORT "${TARGETS_EXPORT_NAME}"
> > -+    NAMESPACE "${NAMESPACE}"
> > -+    DESTINATION "${CONFIG_INSTALL_DIR}"
> > -+)
> > -+
> > -+# }
> > -+
> > - install(TARGETS ${PROJECT_NAME}
> > -+        EXPORT ${TARGETS_EXPORT_NAME}
> > -         RUNTIME DESTINATION bin
> > -         ARCHIVE DESTINATION lib
> > -         LIBRARY DESTINATION lib
> > --        COMPONENT library)
> > --install(FILES ${PROJECT_SOURCE_DIR}/src/zip.h DESTINATION include)
> > -+        INCLUDES DESTINATION ${INCLUDE_INSTALL_DIR}
> > -+)
> > -+install(FILES ${PROJECT_SOURCE_DIR}/src/zip.h DESTINATION
> ${INCLUDE_INSTALL_DIR}/zip)
> > -
> > - # uninstall target (
> https://gitlab.kitware.com/cmake/community/wikis/FAQ#can-i-do-make-uninst=
all-with-cmake
> )
> > - if(NOT TARGET uninstall)
> > -@@ -45,3 +101,12 @@ if(NOT TARGET uninstall)
> > -     add_custom_target(uninstall
> > -         COMMAND ${CMAKE_COMMAND} -P
> ${CMAKE_CURRENT_BINARY_DIR}/cmake/cmake_uninstall.cmake)
> > - endif()
> > -+
> > -+find_package(Doxygen)
> > -+if(DOXYGEN_FOUND)
> > -+    configure_file(${CMAKE_CURRENT_SOURCE_DIR}/Doxyfile.in
> ${CMAKE_CURRENT_BINARY_DIR}/Doxyfile @ONLY)
> > -+    add_custom_target(doc
> > -+        ${DOXYGEN_EXECUTABLE} ${CMAKE_CURRENT_BINARY_DIR}/Doxyfile
> > -+        WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
> > -+        COMMENT "Generating API documentation with Doxygen" VERBATIM)
> > -+endif()
> > -diff --git a/contrib/zip/README.md b/contrib/zip/README.md
> > -index d5fb8cd2..14eb9a34 100644
> > ---- a/contrib/zip/README.md
> > -+++ b/contrib/zip/README.md
> > -@@ -71,7 +71,7 @@ int arg =3D 2;
> > - zip_extract("foo.zip", "/tmp", on_extract_entry, &arg);
> > - ```
> > -
> > --*   Extract a zip entry into memory.
> > -+* Extract a zip entry into memory.
> > - ```c
> > - void *buf =3D NULL;
> > - size_t bufsize;
> > -@@ -89,7 +89,7 @@ zip_close(zip);
> > - free(buf);
> > - ```
> > -
> > --*   Extract a zip entry into memory (no internal allocation).
> > -+* Extract a zip entry into memory (no internal allocation).
> > - ```c
> > - unsigned char *buf;
> > - size_t bufsize;
> > -@@ -110,7 +110,7 @@ zip_close(zip);
> > - free(buf);
> > - ```
> > -
> > --*   Extract a zip entry into memory using callback.
> > -+* Extract a zip entry into memory using callback.
> > - ```c
> > - struct buffer_t {
> > -     char *data;
> > -@@ -144,7 +144,7 @@ free(buf.data);
> > - ```
> > -
> > -
> > --*   Extract a zip entry into a file.
> > -+* Extract a zip entry into a file.
> > - ```c
> > - struct zip_t *zip =3D zip_open("foo.zip", 0, 'r');
> > - {
> > -@@ -157,7 +157,7 @@ struct zip_t *zip =3D zip_open("foo.zip", 0, 'r');
> > - zip_close(zip);
> > - ```
> > -
> > --*   List of all zip entries
> > -+* List of all zip entries
> > - ```c
> > - struct zip_t *zip =3D zip_open("foo.zip", 0, 'r');
> > - int i, n =3D zip_total_entries(zip);
> > -@@ -174,7 +174,7 @@ for (i =3D 0; i < n; ++i) {
> > - zip_close(zip);
> > - ```
> > -
> > --## Bindings
> > -+# Bindings
> > - Compile zip library as a dynamic library.
> > - ```shell
> > - $ mkdir build
> > -diff --git a/contrib/zip/appveyor.yml b/contrib/zip/appveyor.yml
> > -index 0be6373c..ea17f5de 100644
> > ---- a/contrib/zip/appveyor.yml
> > -+++ b/contrib/zip/appveyor.yml
> > -@@ -1,4 +1,4 @@
> > --version: zip-0.1.9.{build}
> > -+version: zip-0.1.15.{build}
> > - build_script:
> > - - cmd: >-
> > -     cd c:\projects\zip
> > -diff --git a/contrib/zip/src/miniz.h b/contrib/zip/src/miniz.h
> > -index 2c27a94d..c4fcfb83 100644
> > ---- a/contrib/zip/src/miniz.h
> > -+++ b/contrib/zip/src/miniz.h
> > -@@ -221,6 +221,7 @@
> > - #ifndef MINIZ_HEADER_INCLUDED
> > - #define MINIZ_HEADER_INCLUDED
> > -
> > -+#include <stdint.h>
> > - #include <stdlib.h>
> > -
> > - // Defines to completely disable specific portions of miniz.c:
> > -@@ -284,7 +285,8 @@
> > - /* Set MINIZ_USE_UNALIGNED_LOADS_AND_STORES only if not set */
> > - #if !defined(MINIZ_USE_UNALIGNED_LOADS_AND_STORES)
> > - #if MINIZ_X86_OR_X64_CPU
> > --/* Set MINIZ_USE_UNALIGNED_LOADS_AND_STORES to 1 on CPU's that permit
> efficient integer loads and stores from unaligned addresses. */
> > -+/* Set MINIZ_USE_UNALIGNED_LOADS_AND_STORES to 1 on CPU's that permit
> efficient
> > -+ * integer loads and stores from unaligned addresses. */
> > - #define MINIZ_USE_UNALIGNED_LOADS_AND_STORES 1
> > - #define MINIZ_UNALIGNED_USE_MEMCPY
> > - #else
> > -@@ -354,6 +356,44 @@ enum {
> > -   MZ_FIXED =3D 4
> > - };
> > -
> > -+/* miniz error codes. Be sure to update mz_zip_get_error_string() if
> you add or
> > -+ * modify this enum. */
> > -+typedef enum {
> > -+  MZ_ZIP_NO_ERROR =3D 0,
> > -+  MZ_ZIP_UNDEFINED_ERROR,
> > -+  MZ_ZIP_TOO_MANY_FILES,
> > -+  MZ_ZIP_FILE_TOO_LARGE,
> > -+  MZ_ZIP_UNSUPPORTED_METHOD,
> > -+  MZ_ZIP_UNSUPPORTED_ENCRYPTION,
> > -+  MZ_ZIP_UNSUPPORTED_FEATURE,
> > -+  MZ_ZIP_FAILED_FINDING_CENTRAL_DIR,
> > -+  MZ_ZIP_NOT_AN_ARCHIVE,
> > -+  MZ_ZIP_INVALID_HEADER_OR_CORRUPTED,
> > -+  MZ_ZIP_UNSUPPORTED_MULTIDISK,
> > -+  MZ_ZIP_DECOMPRESSION_FAILED,
> > -+  MZ_ZIP_COMPRESSION_FAILED,
> > -+  MZ_ZIP_UNEXPECTED_DECOMPRESSED_SIZE,
> > -+  MZ_ZIP_CRC_CHECK_FAILED,
> > -+  MZ_ZIP_UNSUPPORTED_CDIR_SIZE,
> > -+  MZ_ZIP_ALLOC_FAILED,
> > -+  MZ_ZIP_FILE_OPEN_FAILED,
> > -+  MZ_ZIP_FILE_CREATE_FAILED,
> > -+  MZ_ZIP_FILE_WRITE_FAILED,
> > -+  MZ_ZIP_FILE_READ_FAILED,
> > -+  MZ_ZIP_FILE_CLOSE_FAILED,
> > -+  MZ_ZIP_FILE_SEEK_FAILED,
> > -+  MZ_ZIP_FILE_STAT_FAILED,
> > -+  MZ_ZIP_INVALID_PARAMETER,
> > -+  MZ_ZIP_INVALID_FILENAME,
> > -+  MZ_ZIP_BUF_TOO_SMALL,
> > -+  MZ_ZIP_INTERNAL_ERROR,
> > -+  MZ_ZIP_FILE_NOT_FOUND,
> > -+  MZ_ZIP_ARCHIVE_TOO_LARGE,
> > -+  MZ_ZIP_VALIDATION_FAILED,
> > -+  MZ_ZIP_WRITE_CALLBACK_FAILED,
> > -+  MZ_ZIP_TOTAL_ERRORS
> > -+} mz_zip_error;
> > -+
> > - // Method
> > - #define MZ_DEFLATED 8
> > -
> > -@@ -696,6 +736,7 @@ typedef size_t (*mz_file_read_func)(void *pOpaque,
> mz_uint64 file_ofs,
> > -                                     void *pBuf, size_t n);
> > - typedef size_t (*mz_file_write_func)(void *pOpaque, mz_uint64 file_of=
s,
> > -                                      const void *pBuf, size_t n);
> > -+typedef mz_bool (*mz_file_needs_keepalive)(void *pOpaque);
> > -
> > - struct mz_zip_internal_state_tag;
> > - typedef struct mz_zip_internal_state_tag mz_zip_internal_state;
> > -@@ -707,13 +748,27 @@ typedef enum {
> > -   MZ_ZIP_MODE_WRITING_HAS_BEEN_FINALIZED =3D 3
> > - } mz_zip_mode;
> > -
> > --typedef struct mz_zip_archive_tag {
> > -+typedef enum {
> > -+  MZ_ZIP_TYPE_INVALID =3D 0,
> > -+  MZ_ZIP_TYPE_USER,
> > -+  MZ_ZIP_TYPE_MEMORY,
> > -+  MZ_ZIP_TYPE_HEAP,
> > -+  MZ_ZIP_TYPE_FILE,
> > -+  MZ_ZIP_TYPE_CFILE,
> > -+  MZ_ZIP_TOTAL_TYPES
> > -+} mz_zip_type;
> > -+
> > -+typedef struct {
> > -   mz_uint64 m_archive_size;
> > -   mz_uint64 m_central_directory_file_ofs;
> > --  mz_uint m_total_files;
> > -+
> > -+  /* We only support up to UINT32_MAX files in zip64 mode. */
> > -+  mz_uint32 m_total_files;
> > -   mz_zip_mode m_zip_mode;
> > -+  mz_zip_type m_zip_type;
> > -+  mz_zip_error m_last_error;
> > -
> > --  mz_uint m_file_offset_alignment;
> > -+  mz_uint64 m_file_offset_alignment;
> > -
> > -   mz_alloc_func m_pAlloc;
> > -   mz_free_func m_pFree;
> > -@@ -722,6 +777,7 @@ typedef struct mz_zip_archive_tag {
> > -
> > -   mz_file_read_func m_pRead;
> > -   mz_file_write_func m_pWrite;
> > -+  mz_file_needs_keepalive m_pNeeds_keepalive;
> > -   void *m_pIO_opaque;
> > -
> > -   mz_zip_internal_state *m_pState;
> > -@@ -1263,6 +1319,9 @@ mz_uint
> tdefl_create_comp_flags_from_zip_params(int level, int window_bits,
> > -                                                 int strategy);
> > - #endif // #ifndef MINIZ_NO_ZLIB_APIS
> > -
> > -+#define MZ_UINT16_MAX (0xFFFFU)
> > -+#define MZ_UINT32_MAX (0xFFFFFFFFU)
> > -+
> > - #ifdef __cplusplus
> > - }
> > - #endif
> > -@@ -1311,6 +1370,11 @@ typedef unsigned char
> mz_validate_uint64[sizeof(mz_uint64) =3D=3D 8 ? 1 : -1];
> > -    ((mz_uint32)(((const mz_uint8 *)(p))[3]) << 24U))
> > - #endif
> > -
> > -+#define MZ_READ_LE64(p)
>         \
> > -+  (((mz_uint64)MZ_READ_LE32(p)) |
>         \
> > -+   (((mz_uint64)MZ_READ_LE32((const mz_uint8 *)(p) +
> sizeof(mz_uint32)))       \
> > -+    << 32U))
> > -+
> > - #ifdef _MSC_VER
> > - #define MZ_FORCEINLINE __forceinline
> > - #elif defined(__GNUC__)
> > -@@ -4160,6 +4224,17 @@ enum {
> > -   MZ_ZIP_LOCAL_DIR_HEADER_SIZE =3D 30,
> > -   MZ_ZIP_CENTRAL_DIR_HEADER_SIZE =3D 46,
> > -   MZ_ZIP_END_OF_CENTRAL_DIR_HEADER_SIZE =3D 22,
> > -+
> > -+  /* ZIP64 archive identifier and record sizes */
> > -+  MZ_ZIP64_END_OF_CENTRAL_DIR_HEADER_SIG =3D 0x06064b50,
> > -+  MZ_ZIP64_END_OF_CENTRAL_DIR_LOCATOR_SIG =3D 0x07064b50,
> > -+  MZ_ZIP64_END_OF_CENTRAL_DIR_HEADER_SIZE =3D 56,
> > -+  MZ_ZIP64_END_OF_CENTRAL_DIR_LOCATOR_SIZE =3D 20,
> > -+  MZ_ZIP64_EXTENDED_INFORMATION_FIELD_HEADER_ID =3D 0x0001,
> > -+  MZ_ZIP_DATA_DESCRIPTOR_ID =3D 0x08074b50,
> > -+  MZ_ZIP_DATA_DESCRIPTER_SIZE64 =3D 24,
> > -+  MZ_ZIP_DATA_DESCRIPTER_SIZE32 =3D 16,
> > -+
> > -   // Central directory header record offsets
> > -   MZ_ZIP_CDH_SIG_OFS =3D 0,
> > -   MZ_ZIP_CDH_VERSION_MADE_BY_OFS =3D 4,
> > -@@ -4199,6 +4274,31 @@ enum {
> > -   MZ_ZIP_ECDH_CDIR_SIZE_OFS =3D 12,
> > -   MZ_ZIP_ECDH_CDIR_OFS_OFS =3D 16,
> > -   MZ_ZIP_ECDH_COMMENT_SIZE_OFS =3D 20,
> > -+
> > -+  /* ZIP64 End of central directory locator offsets */
> > -+  MZ_ZIP64_ECDL_SIG_OFS =3D 0,                    /* 4 bytes */
> > -+  MZ_ZIP64_ECDL_NUM_DISK_CDIR_OFS =3D 4,          /* 4 bytes */
> > -+  MZ_ZIP64_ECDL_REL_OFS_TO_ZIP64_ECDR_OFS =3D 8,  /* 8 bytes */
> > -+  MZ_ZIP64_ECDL_TOTAL_NUMBER_OF_DISKS_OFS =3D 16, /* 4 bytes */
> > -+
> > -+  /* ZIP64 End of central directory header offsets */
> > -+  MZ_ZIP64_ECDH_SIG_OFS =3D 0,                       /* 4 bytes */
> > -+  MZ_ZIP64_ECDH_SIZE_OF_RECORD_OFS =3D 4,            /* 8 bytes */
> > -+  MZ_ZIP64_ECDH_VERSION_MADE_BY_OFS =3D 12,          /* 2 bytes */
> > -+  MZ_ZIP64_ECDH_VERSION_NEEDED_OFS =3D 14,           /* 2 bytes */
> > -+  MZ_ZIP64_ECDH_NUM_THIS_DISK_OFS =3D 16,            /* 4 bytes */
> > -+  MZ_ZIP64_ECDH_NUM_DISK_CDIR_OFS =3D 20,            /* 4 bytes */
> > -+  MZ_ZIP64_ECDH_CDIR_NUM_ENTRIES_ON_DISK_OFS =3D 24, /* 8 bytes */
> > -+  MZ_ZIP64_ECDH_CDIR_TOTAL_ENTRIES_OFS =3D 32,       /* 8 bytes */
> > -+  MZ_ZIP64_ECDH_CDIR_SIZE_OFS =3D 40,                /* 8 bytes */
> > -+  MZ_ZIP64_ECDH_CDIR_OFS_OFS =3D 48,                 /* 8 bytes */
> > -+  MZ_ZIP_VERSION_MADE_BY_DOS_FILESYSTEM_ID =3D 0,
> > -+  MZ_ZIP_DOS_DIR_ATTRIBUTE_BITFLAG =3D 0x10,
> > -+  MZ_ZIP_GENERAL_PURPOSE_BIT_FLAG_IS_ENCRYPTED =3D 1,
> > -+  MZ_ZIP_GENERAL_PURPOSE_BIT_FLAG_COMPRESSED_PATCH_FLAG =3D 32,
> > -+  MZ_ZIP_GENERAL_PURPOSE_BIT_FLAG_USES_STRONG_ENCRYPTION =3D 64,
> > -+  MZ_ZIP_GENERAL_PURPOSE_BIT_FLAG_LOCAL_DIR_IS_MASKED =3D 8192,
> > -+  MZ_ZIP_GENERAL_PURPOSE_BIT_FLAG_UTF8 =3D 1 << 11
> > - };
> > -
> > - typedef struct {
> > -@@ -4211,7 +4311,24 @@ struct mz_zip_internal_state_tag {
> > -   mz_zip_array m_central_dir;
> > -   mz_zip_array m_central_dir_offsets;
> > -   mz_zip_array m_sorted_central_dir_offsets;
> > -+
> > -+  /* The flags passed in when the archive is initially opened. */
> > -+  uint32_t m_init_flags;
> > -+
> > -+  /* MZ_TRUE if the archive has a zip64 end of central directory
> headers, etc.
> > -+   */
> > -+  mz_bool m_zip64;
> > -+
> > -+  /* MZ_TRUE if we found zip64 extended info in the central directory
> (m_zip64
> > -+   * will also be slammed to true too, even if we didn't find a zip64
> end of
> > -+   * central dir header, etc.) */
> > -+  mz_bool m_zip64_has_extended_info_fields;
> > -+
> > -+  /* These fields are used by the file, FILE, memory, and memory/heap
> read/write
> > -+   * helpers. */
> > -   MZ_FILE *m_pFile;
> > -+  mz_uint64 m_file_archive_start_ofs;
> > -+
> > -   void *m_pMem;
> > -   size_t m_mem_size;
> > -   size_t m_mem_capacity;
> > -@@ -4363,6 +4480,13 @@ static mz_bool mz_zip_set_file_times(const char
> *pFilename, time_t access_time,
> > - #endif /* #ifndef MINIZ_NO_STDIO */
> > - #endif /* #ifndef MINIZ_NO_TIME */
> > -
> > -+static MZ_FORCEINLINE mz_bool mz_zip_set_error(mz_zip_archive *pZip,
> > -+                                               mz_zip_error err_num) =
{
> > -+  if (pZip)
> > -+    pZip->m_last_error =3D err_num;
> > -+  return MZ_FALSE;
> > -+}
> > -+
> > - static mz_bool mz_zip_reader_init_internal(mz_zip_archive *pZip,
> > -                                            mz_uint32 flags) {
> > -   (void)flags;
> > -@@ -4480,127 +4604,346 @@
> mz_zip_reader_sort_central_dir_offsets_by_filename(mz_zip_archive *pZip) =
{
> > -   }
> > - }
> > -
> > --static mz_bool mz_zip_reader_read_central_dir(mz_zip_archive *pZip,
> > --                                              mz_uint32 flags) {
> > --  mz_uint cdir_size, num_this_disk, cdir_disk_index;
> > --  mz_uint64 cdir_ofs;
> > -+static mz_bool mz_zip_reader_locate_header_sig(mz_zip_archive *pZip,
> > -+                                               mz_uint32 record_sig,
> > -+                                               mz_uint32 record_size,
> > -+                                               mz_int64 *pOfs) {
> > -   mz_int64 cur_file_ofs;
> > --  const mz_uint8 *p;
> > -   mz_uint32 buf_u32[4096 / sizeof(mz_uint32)];
> > -   mz_uint8 *pBuf =3D (mz_uint8 *)buf_u32;
> > --  mz_bool sort_central_dir =3D
> > --      ((flags & MZ_ZIP_FLAG_DO_NOT_SORT_CENTRAL_DIRECTORY) =3D=3D 0);
> > --  // Basic sanity checks - reject files which are too small, and chec=
k
> the first
> > --  // 4 bytes of the file to make sure a local header is there.
> > --  if (pZip->m_archive_size < MZ_ZIP_END_OF_CENTRAL_DIR_HEADER_SIZE)
> > -+
> > -+  /* Basic sanity checks - reject files which are too small */
> > -+  if (pZip->m_archive_size < record_size)
> > -     return MZ_FALSE;
> > --  // Find the end of central directory record by scanning the file
> from the end
> > --  // towards the beginning.
> > -+
> > -+  /* Find the record by scanning the file from the end towards the
> beginning. */
> > -   cur_file_ofs =3D
> > -       MZ_MAX((mz_int64)pZip->m_archive_size -
> (mz_int64)sizeof(buf_u32), 0);
> > -   for (;;) {
> > -     int i,
> > -         n =3D (int)MZ_MIN(sizeof(buf_u32), pZip->m_archive_size -
> cur_file_ofs);
> > -+
> > -     if (pZip->m_pRead(pZip->m_pIO_opaque, cur_file_ofs, pBuf, n) !=3D
> (mz_uint)n)
> > -       return MZ_FALSE;
> > --    for (i =3D n - 4; i >=3D 0; --i)
> > --      if (MZ_READ_LE32(pBuf + i) =3D=3D
> MZ_ZIP_END_OF_CENTRAL_DIR_HEADER_SIG)
> > --        break;
> > -+
> > -+    for (i =3D n - 4; i >=3D 0; --i) {
> > -+      mz_uint s =3D MZ_READ_LE32(pBuf + i);
> > -+      if (s =3D=3D record_sig) {
> > -+        if ((pZip->m_archive_size - (cur_file_ofs + i)) >=3D record_s=
ize)
> > -+          break;
> > -+      }
> > -+    }
> > -+
> > -     if (i >=3D 0) {
> > -       cur_file_ofs +=3D i;
> > -       break;
> > -     }
> > -+
> > -+    /* Give up if we've searched the entire file, or we've gone back
> "too far"
> > -+     * (~64kb) */
> > -     if ((!cur_file_ofs) || ((pZip->m_archive_size - cur_file_ofs) >=
=3D
> > --                            (0xFFFF +
> MZ_ZIP_END_OF_CENTRAL_DIR_HEADER_SIZE)))
> > -+                            (MZ_UINT16_MAX + record_size)))
> > -       return MZ_FALSE;
> > -+
> > -     cur_file_ofs =3D MZ_MAX(cur_file_ofs - (sizeof(buf_u32) - 3), 0);
> > -   }
> > --  // Read and verify the end of central directory record.
> > -+
> > -+  *pOfs =3D cur_file_ofs;
> > -+  return MZ_TRUE;
> > -+}
> > -+
> > -+static mz_bool mz_zip_reader_read_central_dir(mz_zip_archive *pZip,
> > -+                                              mz_uint flags) {
> > -+  mz_uint cdir_size =3D 0, cdir_entries_on_this_disk =3D 0, num_this_=
disk
> =3D 0,
> > -+          cdir_disk_index =3D 0;
> > -+  mz_uint64 cdir_ofs =3D 0;
> > -+  mz_int64 cur_file_ofs =3D 0;
> > -+  const mz_uint8 *p;
> > -+
> > -+  mz_uint32 buf_u32[4096 / sizeof(mz_uint32)];
> > -+  mz_uint8 *pBuf =3D (mz_uint8 *)buf_u32;
> > -+  mz_bool sort_central_dir =3D
> > -+      ((flags & MZ_ZIP_FLAG_DO_NOT_SORT_CENTRAL_DIRECTORY) =3D=3D 0);
> > -+  mz_uint32 zip64_end_of_central_dir_locator_u32
> > -+      [(MZ_ZIP64_END_OF_CENTRAL_DIR_LOCATOR_SIZE + sizeof(mz_uint32) =
-
> 1) /
> > -+       sizeof(mz_uint32)];
> > -+  mz_uint8 *pZip64_locator =3D (mz_uint8
> *)zip64_end_of_central_dir_locator_u32;
> > -+
> > -+  mz_uint32 zip64_end_of_central_dir_header_u32
> > -+      [(MZ_ZIP64_END_OF_CENTRAL_DIR_HEADER_SIZE + sizeof(mz_uint32) -
> 1) /
> > -+       sizeof(mz_uint32)];
> > -+  mz_uint8 *pZip64_end_of_central_dir =3D
> > -+      (mz_uint8 *)zip64_end_of_central_dir_header_u32;
> > -+
> > -+  mz_uint64 zip64_end_of_central_dir_ofs =3D 0;
> > -+
> > -+  /* Basic sanity checks - reject files which are too small, and chec=
k
> the first
> > -+   * 4 bytes of the file to make sure a local header is there. */
> > -+  if (pZip->m_archive_size < MZ_ZIP_END_OF_CENTRAL_DIR_HEADER_SIZE)
> > -+    return mz_zip_set_error(pZip, MZ_ZIP_NOT_AN_ARCHIVE);
> > -+
> > -+  if (!mz_zip_reader_locate_header_sig(
> > -+          pZip, MZ_ZIP_END_OF_CENTRAL_DIR_HEADER_SIG,
> > -+          MZ_ZIP_END_OF_CENTRAL_DIR_HEADER_SIZE, &cur_file_ofs))
> > -+    return mz_zip_set_error(pZip, MZ_ZIP_FAILED_FINDING_CENTRAL_DIR);
> > -+
> > -+  /* Read and verify the end of central directory record. */
> > -   if (pZip->m_pRead(pZip->m_pIO_opaque, cur_file_ofs, pBuf,
> > -                     MZ_ZIP_END_OF_CENTRAL_DIR_HEADER_SIZE) !=3D
> > -       MZ_ZIP_END_OF_CENTRAL_DIR_HEADER_SIZE)
> > --    return MZ_FALSE;
> > --  if ((MZ_READ_LE32(pBuf + MZ_ZIP_ECDH_SIG_OFS) !=3D
> > --       MZ_ZIP_END_OF_CENTRAL_DIR_HEADER_SIG) ||
> > --      ((pZip->m_total_files =3D
> > --            MZ_READ_LE16(pBuf + MZ_ZIP_ECDH_CDIR_TOTAL_ENTRIES_OFS)) =
!=3D
> > --       MZ_READ_LE16(pBuf + MZ_ZIP_ECDH_CDIR_NUM_ENTRIES_ON_DISK_OFS))=
)
> > --    return MZ_FALSE;
> > -+    return mz_zip_set_error(pZip, MZ_ZIP_FILE_READ_FAILED);
> > -+
> > -+  if (MZ_READ_LE32(pBuf + MZ_ZIP_ECDH_SIG_OFS) !=3D
> > -+      MZ_ZIP_END_OF_CENTRAL_DIR_HEADER_SIG)
> > -+    return mz_zip_set_error(pZip, MZ_ZIP_NOT_AN_ARCHIVE);
> > -+
> > -+  if (cur_file_ofs >=3D (MZ_ZIP64_END_OF_CENTRAL_DIR_LOCATOR_SIZE +
> > -+                       MZ_ZIP64_END_OF_CENTRAL_DIR_HEADER_SIZE)) {
> > -+    if (pZip->m_pRead(pZip->m_pIO_opaque,
> > -+                      cur_file_ofs -
> MZ_ZIP64_END_OF_CENTRAL_DIR_LOCATOR_SIZE,
> > -+                      pZip64_locator,
> > -+                      MZ_ZIP64_END_OF_CENTRAL_DIR_LOCATOR_SIZE) =3D=
=3D
> > -+        MZ_ZIP64_END_OF_CENTRAL_DIR_LOCATOR_SIZE) {
> > -+      if (MZ_READ_LE32(pZip64_locator + MZ_ZIP64_ECDL_SIG_OFS) =3D=3D
> > -+          MZ_ZIP64_END_OF_CENTRAL_DIR_LOCATOR_SIG) {
> > -+        zip64_end_of_central_dir_ofs =3D MZ_READ_LE64(
> > -+            pZip64_locator + MZ_ZIP64_ECDL_REL_OFS_TO_ZIP64_ECDR_OFS)=
;
> > -+        if (zip64_end_of_central_dir_ofs >
> > -+            (pZip->m_archive_size -
> MZ_ZIP64_END_OF_CENTRAL_DIR_HEADER_SIZE))
> > -+          return mz_zip_set_error(pZip, MZ_ZIP_NOT_AN_ARCHIVE);
> > -+
> > -+        if (pZip->m_pRead(pZip->m_pIO_opaque,
> zip64_end_of_central_dir_ofs,
> > -+                          pZip64_end_of_central_dir,
> > -+                          MZ_ZIP64_END_OF_CENTRAL_DIR_HEADER_SIZE) =
=3D=3D
> > -+            MZ_ZIP64_END_OF_CENTRAL_DIR_HEADER_SIZE) {
> > -+          if (MZ_READ_LE32(pZip64_end_of_central_dir +
> MZ_ZIP64_ECDH_SIG_OFS) =3D=3D
> > -+              MZ_ZIP64_END_OF_CENTRAL_DIR_HEADER_SIG) {
> > -+            pZip->m_pState->m_zip64 =3D MZ_TRUE;
> > -+          }
> > -+        }
> > -+      }
> > -+    }
> > -+  }
> > -
> > -+  pZip->m_total_files =3D MZ_READ_LE16(pBuf +
> MZ_ZIP_ECDH_CDIR_TOTAL_ENTRIES_OFS);
> > -+  cdir_entries_on_this_disk =3D
> > -+      MZ_READ_LE16(pBuf + MZ_ZIP_ECDH_CDIR_NUM_ENTRIES_ON_DISK_OFS);
> > -   num_this_disk =3D MZ_READ_LE16(pBuf + MZ_ZIP_ECDH_NUM_THIS_DISK_OFS=
);
> > -   cdir_disk_index =3D MZ_READ_LE16(pBuf + MZ_ZIP_ECDH_NUM_DISK_CDIR_O=
FS);
> > -+  cdir_size =3D MZ_READ_LE32(pBuf + MZ_ZIP_ECDH_CDIR_SIZE_OFS);
> > -+  cdir_ofs =3D MZ_READ_LE32(pBuf + MZ_ZIP_ECDH_CDIR_OFS_OFS);
> > -+
> > -+  if (pZip->m_pState->m_zip64) {
> > -+    mz_uint32 zip64_total_num_of_disks =3D
> > -+        MZ_READ_LE32(pZip64_locator +
> MZ_ZIP64_ECDL_TOTAL_NUMBER_OF_DISKS_OFS);
> > -+    mz_uint64 zip64_cdir_total_entries =3D MZ_READ_LE64(
> > -+        pZip64_end_of_central_dir +
> MZ_ZIP64_ECDH_CDIR_TOTAL_ENTRIES_OFS);
> > -+    mz_uint64 zip64_cdir_total_entries_on_this_disk =3D MZ_READ_LE64(
> > -+        pZip64_end_of_central_dir +
> MZ_ZIP64_ECDH_CDIR_NUM_ENTRIES_ON_DISK_OFS);
> > -+    mz_uint64 zip64_size_of_end_of_central_dir_record =3D MZ_READ_LE6=
4(
> > -+        pZip64_end_of_central_dir + MZ_ZIP64_ECDH_SIZE_OF_RECORD_OFS)=
;
> > -+    mz_uint64 zip64_size_of_central_directory =3D
> > -+        MZ_READ_LE64(pZip64_end_of_central_dir +
> MZ_ZIP64_ECDH_CDIR_SIZE_OFS);
> > -+
> > -+    if (zip64_size_of_end_of_central_dir_record <
> > -+        (MZ_ZIP64_END_OF_CENTRAL_DIR_HEADER_SIZE - 12))
> > -+      return mz_zip_set_error(pZip,
> MZ_ZIP_INVALID_HEADER_OR_CORRUPTED);
> > -+
> > -+    if (zip64_total_num_of_disks !=3D 1U)
> > -+      return mz_zip_set_error(pZip, MZ_ZIP_UNSUPPORTED_MULTIDISK);
> > -+
> > -+    /* Check for miniz's practical limits */
> > -+    if (zip64_cdir_total_entries > MZ_UINT32_MAX)
> > -+      return mz_zip_set_error(pZip, MZ_ZIP_TOO_MANY_FILES);
> > -+
> > -+    pZip->m_total_files =3D (mz_uint32)zip64_cdir_total_entries;
> > -+
> > -+    if (zip64_cdir_total_entries_on_this_disk > MZ_UINT32_MAX)
> > -+      return mz_zip_set_error(pZip, MZ_ZIP_TOO_MANY_FILES);
> > -+
> > -+    cdir_entries_on_this_disk =3D
> > -+        (mz_uint32)zip64_cdir_total_entries_on_this_disk;
> > -+
> > -+    /* Check for miniz's current practical limits (sorry, this should
> be enough
> > -+     * for millions of files) */
> > -+    if (zip64_size_of_central_directory > MZ_UINT32_MAX)
> > -+      return mz_zip_set_error(pZip, MZ_ZIP_UNSUPPORTED_CDIR_SIZE);
> > -+
> > -+    cdir_size =3D (mz_uint32)zip64_size_of_central_directory;
> > -+
> > -+    num_this_disk =3D MZ_READ_LE32(pZip64_end_of_central_dir +
> > -+                                 MZ_ZIP64_ECDH_NUM_THIS_DISK_OFS);
> > -+
> > -+    cdir_disk_index =3D MZ_READ_LE32(pZip64_end_of_central_dir +
> > -+                                   MZ_ZIP64_ECDH_NUM_DISK_CDIR_OFS);
> > -+
> > -+    cdir_ofs =3D
> > -+        MZ_READ_LE64(pZip64_end_of_central_dir +
> MZ_ZIP64_ECDH_CDIR_OFS_OFS);
> > -+  }
> > -+
> > -+  if (pZip->m_total_files !=3D cdir_entries_on_this_disk)
> > -+    return mz_zip_set_error(pZip, MZ_ZIP_UNSUPPORTED_MULTIDISK);
> > -+
> > -   if (((num_this_disk | cdir_disk_index) !=3D 0) &&
> > -       ((num_this_disk !=3D 1) || (cdir_disk_index !=3D 1)))
> > --    return MZ_FALSE;
> > -+    return mz_zip_set_error(pZip, MZ_ZIP_UNSUPPORTED_MULTIDISK);
> > -
> > --  if ((cdir_size =3D MZ_READ_LE32(pBuf + MZ_ZIP_ECDH_CDIR_SIZE_OFS)) =
<
> > --      pZip->m_total_files * MZ_ZIP_CENTRAL_DIR_HEADER_SIZE)
> > --    return MZ_FALSE;
> > -+  if (cdir_size < pZip->m_total_files * MZ_ZIP_CENTRAL_DIR_HEADER_SIZ=
E)
> > -+    return mz_zip_set_error(pZip, MZ_ZIP_INVALID_HEADER_OR_CORRUPTED)=
;
> > -
> > --  cdir_ofs =3D MZ_READ_LE32(pBuf + MZ_ZIP_ECDH_CDIR_OFS_OFS);
> > -   if ((cdir_ofs + (mz_uint64)cdir_size) > pZip->m_archive_size)
> > --    return MZ_FALSE;
> > -+    return mz_zip_set_error(pZip, MZ_ZIP_INVALID_HEADER_OR_CORRUPTED)=
;
> > -
> > -   pZip->m_central_directory_file_ofs =3D cdir_ofs;
> > -
> > -   if (pZip->m_total_files) {
> > -     mz_uint i, n;
> > --
> > --    // Read the entire central directory into a heap block, and
> allocate another
> > --    // heap block to hold the unsorted central dir file record
> offsets, and
> > --    // another to hold the sorted indices.
> > -+    /* Read the entire central directory into a heap block, and
> allocate another
> > -+     * heap block to hold the unsorted central dir file record
> offsets, and
> > -+     * possibly another to hold the sorted indices. */
> > -     if ((!mz_zip_array_resize(pZip, &pZip->m_pState->m_central_dir,
> cdir_size,
> > -                               MZ_FALSE)) ||
> > -         (!mz_zip_array_resize(pZip,
> &pZip->m_pState->m_central_dir_offsets,
> > -                               pZip->m_total_files, MZ_FALSE)))
> > --      return MZ_FALSE;
> > -+      return mz_zip_set_error(pZip, MZ_ZIP_ALLOC_FAILED);
> > -
> > -     if (sort_central_dir) {
> > -       if (!mz_zip_array_resize(pZip,
> > -
> &pZip->m_pState->m_sorted_central_dir_offsets,
> > -                                pZip->m_total_files, MZ_FALSE))
> > --        return MZ_FALSE;
> > -+        return mz_zip_set_error(pZip, MZ_ZIP_ALLOC_FAILED);
> > -     }
> > -
> > -     if (pZip->m_pRead(pZip->m_pIO_opaque, cdir_ofs,
> > -                       pZip->m_pState->m_central_dir.m_p,
> > -                       cdir_size) !=3D cdir_size)
> > --      return MZ_FALSE;
> > -+      return mz_zip_set_error(pZip, MZ_ZIP_FILE_READ_FAILED);
> > -
> > --    // Now create an index into the central directory file records, d=
o
> some
> > --    // basic sanity checking on each record, and check for zip64
> entries (which
> > --    // are not yet supported).
> > -+    /* Now create an index into the central directory file records, d=
o
> some
> > -+     * basic sanity checking on each record */
> > -     p =3D (const mz_uint8 *)pZip->m_pState->m_central_dir.m_p;
> > -     for (n =3D cdir_size, i =3D 0; i < pZip->m_total_files; ++i) {
> > --      mz_uint total_header_size, comp_size, decomp_size, disk_index;
> > -+      mz_uint total_header_size, disk_index, bit_flags, filename_size=
,
> > -+          ext_data_size;
> > -+      mz_uint64 comp_size, decomp_size, local_header_ofs;
> > -+
> > -       if ((n < MZ_ZIP_CENTRAL_DIR_HEADER_SIZE) ||
> > -           (MZ_READ_LE32(p) !=3D MZ_ZIP_CENTRAL_DIR_HEADER_SIG))
> > --        return MZ_FALSE;
> > -+        return mz_zip_set_error(pZip,
> MZ_ZIP_INVALID_HEADER_OR_CORRUPTED);
> > -+
> > -       MZ_ZIP_ARRAY_ELEMENT(&pZip->m_pState->m_central_dir_offsets,
> mz_uint32,
> > -                            i) =3D
> > -           (mz_uint32)(p - (const mz_uint8
> *)pZip->m_pState->m_central_dir.m_p);
> > -+
> > -       if (sort_central_dir)
> > -
>  MZ_ZIP_ARRAY_ELEMENT(&pZip->m_pState->m_sorted_central_dir_offsets,
> > -                              mz_uint32, i) =3D i;
> > -+
> > -       comp_size =3D MZ_READ_LE32(p + MZ_ZIP_CDH_COMPRESSED_SIZE_OFS);
> > -       decomp_size =3D MZ_READ_LE32(p + MZ_ZIP_CDH_DECOMPRESSED_SIZE_O=
FS);
> > --      if (((!MZ_READ_LE32(p + MZ_ZIP_CDH_METHOD_OFS)) &&
> > --           (decomp_size !=3D comp_size)) ||
> > --          (decomp_size && !comp_size) || (decomp_size =3D=3D 0xFFFFFF=
FF) ||
> > --          (comp_size =3D=3D 0xFFFFFFFF))
> > --        return MZ_FALSE;
> > -+      local_header_ofs =3D MZ_READ_LE32(p + MZ_ZIP_CDH_LOCAL_HEADER_O=
FS);
> > -+      filename_size =3D MZ_READ_LE16(p + MZ_ZIP_CDH_FILENAME_LEN_OFS)=
;
> > -+      ext_data_size =3D MZ_READ_LE16(p + MZ_ZIP_CDH_EXTRA_LEN_OFS);
> > -+
> > -+      if ((!pZip->m_pState->m_zip64_has_extended_info_fields) &&
> > -+          (ext_data_size) &&
> > -+          (MZ_MAX(MZ_MAX(comp_size, decomp_size), local_header_ofs) =
=3D=3D
> > -+           MZ_UINT32_MAX)) {
> > -+        /* Attempt to find zip64 extended information field in the
> entry's extra
> > -+         * data */
> > -+        mz_uint32 extra_size_remaining =3D ext_data_size;
> > -+
> > -+        if (extra_size_remaining) {
> > -+          const mz_uint8 *pExtra_data;
> > -+          void *buf =3D NULL;
> > -+
> > -+          if (MZ_ZIP_CENTRAL_DIR_HEADER_SIZE + filename_size +
> ext_data_size >
> > -+              n) {
> > -+            buf =3D MZ_MALLOC(ext_data_size);
> > -+            if (buf =3D=3D NULL)
> > -+              return mz_zip_set_error(pZip, MZ_ZIP_ALLOC_FAILED);
> > -+
> > -+            if (pZip->m_pRead(pZip->m_pIO_opaque,
> > -+                              cdir_ofs +
> MZ_ZIP_CENTRAL_DIR_HEADER_SIZE +
> > -+                                  filename_size,
> > -+                              buf, ext_data_size) !=3D ext_data_size)=
 {
> > -+              MZ_FREE(buf);
> > -+              return mz_zip_set_error(pZip, MZ_ZIP_FILE_READ_FAILED);
> > -+            }
> > -+
> > -+            pExtra_data =3D (mz_uint8 *)buf;
> > -+          } else {
> > -+            pExtra_data =3D p + MZ_ZIP_CENTRAL_DIR_HEADER_SIZE +
> filename_size;
> > -+          }
> > -+
> > -+          do {
> > -+            mz_uint32 field_id;
> > -+            mz_uint32 field_data_size;
> > -+
> > -+            if (extra_size_remaining < (sizeof(mz_uint16) * 2)) {
> > -+              MZ_FREE(buf);
> > -+              return mz_zip_set_error(pZip,
> MZ_ZIP_INVALID_HEADER_OR_CORRUPTED);
> > -+            }
> > -+
> > -+            field_id =3D MZ_READ_LE16(pExtra_data);
> > -+            field_data_size =3D MZ_READ_LE16(pExtra_data +
> sizeof(mz_uint16));
> > -+
> > -+            if ((field_data_size + sizeof(mz_uint16) * 2) >
> > -+                extra_size_remaining) {
> > -+              MZ_FREE(buf);
> > -+              return mz_zip_set_error(pZip,
> MZ_ZIP_INVALID_HEADER_OR_CORRUPTED);
> > -+            }
> > -+
> > -+            if (field_id =3D=3D
> MZ_ZIP64_EXTENDED_INFORMATION_FIELD_HEADER_ID) {
> > -+              /* Ok, the archive didn't have any zip64 headers but it
> uses a
> > -+               * zip64 extended information field so mark it as zip64
> anyway
> > -+               * (this can occur with infozip's zip util when it read=
s
> > -+               * compresses files from stdin). */
> > -+              pZip->m_pState->m_zip64 =3D MZ_TRUE;
> > -+              pZip->m_pState->m_zip64_has_extended_info_fields =3D
> MZ_TRUE;
> > -+              break;
> > -+            }
> > -+
> > -+            pExtra_data +=3D sizeof(mz_uint16) * 2 + field_data_size;
> > -+            extra_size_remaining =3D
> > -+                extra_size_remaining - sizeof(mz_uint16) * 2 -
> field_data_size;
> > -+          } while (extra_size_remaining);
> > -+
> > -+          MZ_FREE(buf);
> > -+        }
> > -+      }
> > -+
> > -+      /* I've seen archives that aren't marked as zip64 that uses
> zip64 ext
> > -+       * data, argh */
> > -+      if ((comp_size !=3D MZ_UINT32_MAX) && (decomp_size !=3D
> MZ_UINT32_MAX)) {
> > -+        if (((!MZ_READ_LE32(p + MZ_ZIP_CDH_METHOD_OFS)) &&
> > -+             (decomp_size !=3D comp_size)) ||
> > -+            (decomp_size && !comp_size))
> > -+          return mz_zip_set_error(pZip,
> MZ_ZIP_INVALID_HEADER_OR_CORRUPTED);
> > -+      }
> > -+
> > -       disk_index =3D MZ_READ_LE16(p + MZ_ZIP_CDH_DISK_START_OFS);
> > --      if ((disk_index !=3D num_this_disk) && (disk_index !=3D 1))
> > --        return MZ_FALSE;
> > --      if (((mz_uint64)MZ_READ_LE32(p + MZ_ZIP_CDH_LOCAL_HEADER_OFS) +
> > --           MZ_ZIP_LOCAL_DIR_HEADER_SIZE + comp_size) >
> pZip->m_archive_size)
> > --        return MZ_FALSE;
> > -+      if ((disk_index =3D=3D MZ_UINT16_MAX) ||
> > -+          ((disk_index !=3D num_this_disk) && (disk_index !=3D 1)))
> > -+        return mz_zip_set_error(pZip, MZ_ZIP_UNSUPPORTED_MULTIDISK);
> > -+
> > -+      if (comp_size !=3D MZ_UINT32_MAX) {
> > -+        if (((mz_uint64)MZ_READ_LE32(p + MZ_ZIP_CDH_LOCAL_HEADER_OFS)=
 +
> > -+             MZ_ZIP_LOCAL_DIR_HEADER_SIZE + comp_size) >
> pZip->m_archive_size)
> > -+          return mz_zip_set_error(pZip,
> MZ_ZIP_INVALID_HEADER_OR_CORRUPTED);
> > -+      }
> > -+
> > -+      bit_flags =3D MZ_READ_LE16(p + MZ_ZIP_CDH_BIT_FLAG_OFS);
> > -+      if (bit_flags &
> MZ_ZIP_GENERAL_PURPOSE_BIT_FLAG_LOCAL_DIR_IS_MASKED)
> > -+        return mz_zip_set_error(pZip, MZ_ZIP_UNSUPPORTED_ENCRYPTION);
> > -+
> > -       if ((total_header_size =3D MZ_ZIP_CENTRAL_DIR_HEADER_SIZE +
> > -                                MZ_READ_LE16(p +
> MZ_ZIP_CDH_FILENAME_LEN_OFS) +
> > -                                MZ_READ_LE16(p +
> MZ_ZIP_CDH_EXTRA_LEN_OFS) +
> > -                                MZ_READ_LE16(p +
> MZ_ZIP_CDH_COMMENT_LEN_OFS)) >
> > -           n)
> > --        return MZ_FALSE;
> > -+        return mz_zip_set_error(pZip,
> MZ_ZIP_INVALID_HEADER_OR_CORRUPTED);
> > -+
> > -       n -=3D total_header_size;
> > -       p +=3D total_header_size;
> > -     }
> > -diff --git a/contrib/zip/src/zip.c b/contrib/zip/src/zip.c
> > -index ff3a8fe1..1abcfd8f 100644
> > ---- a/contrib/zip/src/zip.c
> > -+++ b/contrib/zip/src/zip.c
> > -@@ -24,7 +24,6 @@
> > -   ((((P)[0] >=3D 'A' && (P)[0] <=3D 'Z') || ((P)[0] >=3D 'a' && (P)[0=
] <=3D
> 'z')) &&   \
> > -    (P)[1] =3D=3D ':')
> > - #define FILESYSTEM_PREFIX_LEN(P) (HAS_DEVICE(P) ? 2 : 0)
> > --#define ISSLASH(C) ((C) =3D=3D '/' || (C) =3D=3D '\\')
> > -
> > - #else
> > -
> > -@@ -48,7 +47,7 @@ int symlink(const char *target, const char
> *linkpath); // needed on Linux
> > - #endif
> > -
> > - #ifndef ISSLASH
> > --#define ISSLASH(C) ((C) =3D=3D '/')
> > -+#define ISSLASH(C) ((C) =3D=3D '/' || (C) =3D=3D '\\')
> > - #endif
> > -
> > - #define CLEANUP(ptr)
>          \
> > -@@ -78,26 +77,34 @@ static const char *base_name(const char *name) {
> > -   return base;
> > - }
> > -
> > --static int mkpath(const char *path) {
> > --  char const *p;
> > -+static int mkpath(char *path) {
> > -+  char *p;
> > -   char npath[MAX_PATH + 1];
> > -   int len =3D 0;
> > -   int has_device =3D HAS_DEVICE(path);
> > -
> > -   memset(npath, 0, MAX_PATH + 1);
> > --
> > --#ifdef _WIN32
> > --  // only on windows fix the path
> > --  npath[0] =3D path[0];
> > --  npath[1] =3D path[1];
> > --  len =3D 2;
> > --#endif // _WIN32
> > --
> > -+  if (has_device) {
> > -+    // only on windows
> > -+    npath[0] =3D path[0];
> > -+    npath[1] =3D path[1];
> > -+    len =3D 2;
> > -+  }
> > -   for (p =3D path + len; *p && len < MAX_PATH; p++) {
> > -     if (ISSLASH(*p) && ((!has_device && len > 0) || (has_device && le=
n
> > 2))) {
> > --      if (MKDIR(npath) =3D=3D -1)
> > --        if (errno !=3D EEXIST)
> > -+#if defined(_WIN32) || defined(__WIN32__) || defined(_MSC_VER) ||
>         \
> > -+    defined(__MINGW32__)
> > -+#else
> > -+      if ('\\' =3D=3D *p) {
> > -+        *p =3D '/';
> > -+      }
> > -+#endif
> > -+
> > -+      if (MKDIR(npath) =3D=3D -1) {
> > -+        if (errno !=3D EEXIST) {
> > -           return -1;
> > -+        }
> > -+      }
> > -     }
> > -     npath[len++] =3D *p;
> > -   }
> > -@@ -279,7 +286,14 @@ int zip_entry_open(struct zip_t *zip, const char
> *entryname) {
> > -   zip->entry.header_offset =3D zip->archive.m_archive_size;
> > -   memset(zip->entry.header, 0, MZ_ZIP_LOCAL_DIR_HEADER_SIZE *
> sizeof(mz_uint8));
> > -   zip->entry.method =3D 0;
> > -+
> > -+  // UNIX or APPLE
> > -+#if MZ_PLATFORM =3D=3D 3 || MZ_PLATFORM =3D=3D 19
> > -+  // regular file with rw-r--r-- persmissions
> > -+  zip->entry.external_attr =3D (mz_uint32)(0100644) << 16;
> > -+#else
> > -   zip->entry.external_attr =3D 0;
> > -+#endif
> > -
> > -   num_alignment_padding_bytes =3D
> > -       mz_zip_writer_compute_padding_needed_for_file_alignment(pzip);
> > -@@ -660,7 +674,7 @@ ssize_t zip_entry_noallocread(struct zip_t *zip,
> void *buf, size_t bufsize) {
> > -   }
> > -
> > -   if (!mz_zip_reader_extract_to_mem_no_alloc(pzip,
> (mz_uint)zip->entry.index,
> > --  buf, bufsize, 0, NULL,  0)) {
> > -+                                             buf, bufsize, 0, NULL,
> 0)) {
> > -     return -1;
> > -   }
> > -
> > -@@ -670,10 +684,7 @@ ssize_t zip_entry_noallocread(struct zip_t *zip,
> void *buf, size_t bufsize) {
> > - int zip_entry_fread(struct zip_t *zip, const char *filename) {
> > -   mz_zip_archive *pzip =3D NULL;
> > -   mz_uint idx;
> > --#if defined(_MSC_VER)
> > --#else
> > -   mz_uint32 xattr =3D 0;
> > --#endif
> > -   mz_zip_archive_file_stat info;
> > -
> > -   if (!zip) {
> > -@@ -875,12 +886,19 @@ int zip_extract(const char *zipname, const char
> *dir,
> > -       goto out;
> > -     }
> > -
> > --    if ((((info.m_version_made_by >> 8) =3D=3D 3) ||
> ((info.m_version_made_by >> 8) =3D=3D 19)) // if zip is produced on Unix =
or
> macOS (3 and 19 from section 4.4.2.2 of zip standard)
> > --        && info.m_external_attr & (0x20 << 24)) { // and has sym link
> attribute (0x80 is file, 0x40 is directory)
> > -+    if ((((info.m_version_made_by >> 8) =3D=3D 3) ||
> > -+         ((info.m_version_made_by >> 8) =3D=3D
> > -+          19)) // if zip is produced on Unix or macOS (3 and 19 from
> > -+               // section 4.4.2.2 of zip standard)
> > -+        && info.m_external_attr &
> > -+               (0x20 << 24)) { // and has sym link attribute (0x80 is
> file, 0x40
> > -+                               // is directory)
> > - #if defined(_WIN32) || defined(__WIN32__) || defined(_MSC_VER) ||
>         \
> > -     defined(__MINGW32__)
> > --#else
> > --      if (info.m_uncomp_size > MAX_PATH ||
> !mz_zip_reader_extract_to_mem_no_alloc(&zip_archive, i, symlink_to,
> MAX_PATH, 0, NULL, 0)) {
> > -+#else
> > -+      if (info.m_uncomp_size > MAX_PATH ||
> > -+          !mz_zip_reader_extract_to_mem_no_alloc(&zip_archive, i,
> symlink_to,
> > -+                                                 MAX_PATH, 0, NULL,
> 0)) {
> > -         goto out;
> > -       }
> > -       symlink_to[info.m_uncomp_size] =3D '\0';
> > -diff --git a/contrib/zip/src/zip.h b/contrib/zip/src/zip.h
> > -index 5f39df50..a48d64d6 100644
> > ---- a/contrib/zip/src/zip.h
> > -+++ b/contrib/zip/src/zip.h
> > -@@ -20,241 +20,240 @@ extern "C" {
> > - #endif
> > -
> > - #if !defined(_SSIZE_T_DEFINED) && !defined(_SSIZE_T_DEFINED_) &&
>          \
> > --    !defined(_SSIZE_T) && !defined(_SSIZE_T_) &&
> !defined(__ssize_t_defined)
> > --#define _SSIZE_T
> > -+    !defined(__DEFINED_ssize_t) && !defined(__ssize_t_defined) &&
>         \
> > -+    !defined(_SSIZE_T) && !defined(_SSIZE_T_)
> > -+
> > - // 64-bit Windows is the only mainstream platform
> > - // where sizeof(long) !=3D sizeof(void*)
> > - #ifdef _WIN64
> > --typedef long long  ssize_t;  /* byte count or error */
> > -+typedef long long ssize_t; /* byte count or error */
> > - #else
> > --typedef long  ssize_t;  /* byte count or error */
> > -+typedef long ssize_t; /* byte count or error */
> > - #endif
> > -+
> > -+#define _SSIZE_T_DEFINED
> > -+#define _SSIZE_T_DEFINED_
> > -+#define __DEFINED_ssize_t
> > -+#define __ssize_t_defined
> > -+#define _SSIZE_T
> > -+#define _SSIZE_T_
> > -+
> > - #endif
> > -
> > - #ifndef MAX_PATH
> > - #define MAX_PATH 32767 /* # chars in a path name including NULL */
> > - #endif
> > -
> > -+/**
> > -+ * @mainpage
> > -+ *
> > -+ * Documenation for @ref zip.
> > -+ */
> > -+
> > -+/**
> > -+ * @addtogroup zip
> > -+ * @{
> > -+ */
> > -+
> > -+/**
> > -+ * Default zip compression level.
> > -+ */
> > -+
> > - #define ZIP_DEFAULT_COMPRESSION_LEVEL 6
> > -
> > --/*
> > --  This data structure is used throughout the library to represent zip
> archive
> > --  - forward declaration.
> > --*/
> > -+/**
> > -+ * @struct zip_t
> > -+ *
> > -+ * This data structure is used throughout the library to represent zi=
p
> archive -
> > -+ * forward declaration.
> > -+ */
> > - struct zip_t;
> > -
> > --/*
> > --  Opens zip archive with compression level using the given mode.
> > --
> > --  Args:
> > --    zipname: zip archive file name.
> > --    level: compression level (0-9 are the standard zlib-style levels)=
.
> > --    mode: file access mode.
> > --        'r': opens a file for reading/extracting (the file must
> exists).
> > --        'w': creates an empty file for writing.
> > --        'a': appends to an existing archive.
> > --
> > --  Returns:
> > --    The zip archive handler or NULL on error
> > --*/
> > -+/**
> > -+ * Opens zip archive with compression level using the given mode.
> > -+ *
> > -+ * @param zipname zip archive file name.
> > -+ * @param level compression level (0-9 are the standard zlib-style
> levels).
> > -+ * @param mode file access mode.
> > -+ *        - 'r': opens a file for reading/extracting (the file must
> exists).
> > -+ *        - 'w': creates an empty file for writing.
> > -+ *        - 'a': appends to an existing archive.
> > -+ *
> > -+ * @return the zip archive handler or NULL on error
> > -+ */
> > - extern struct zip_t *zip_open(const char *zipname, int level, char
> mode);
> > -
> > --/*
> > --  Closes the zip archive, releases resources - always finalize.
> > --
> > --  Args:
> > --    zip: zip archive handler.
> > --*/
> > -+/**
> > -+ * Closes the zip archive, releases resources - always finalize.
> > -+ *
> > -+ * @param zip zip archive handler.
> > -+ */
> > - extern void zip_close(struct zip_t *zip);
> > -
> > --/*
> > --  Opens an entry by name in the zip archive.
> > --  For zip archive opened in 'w' or 'a' mode the function will append
> > --  a new entry. In readonly mode the function tries to locate the entr=
y
> > --  in global dictionary.
> > --
> > --  Args:
> > --    zip: zip archive handler.
> > --    entryname: an entry name in local dictionary.
> > --
> > --  Returns:
> > --    The return code - 0 on success, negative number (< 0) on error.
> > --*/
> > -+/**
> > -+ * Opens an entry by name in the zip archive.
> > -+ *
> > -+ * For zip archive opened in 'w' or 'a' mode the function will append
> > -+ * a new entry. In readonly mode the function tries to locate the ent=
ry
> > -+ * in global dictionary.
> > -+ *
> > -+ * @param zip zip archive handler.
> > -+ * @param entryname an entry name in local dictionary.
> > -+ *
> > -+ * @return the return code - 0 on success, negative number (< 0) on
> error.
> > -+ */
> > - extern int zip_entry_open(struct zip_t *zip, const char *entryname);
> > -
> > --/*
> > --  Opens a new entry by index in the zip archive.
> > --  This function is only valid if zip archive was opened in 'r'
> (readonly) mode.
> > --
> > --  Args:
> > --    zip: zip archive handler.
> > --    index: index in local dictionary.
> > --
> > --  Returns:
> > --    The return code - 0 on success, negative number (< 0) on error.
> > --*/
> > -+/**
> > -+ * Opens a new entry by index in the zip archive.
> > -+ *
> > -+ * This function is only valid if zip archive was opened in 'r'
> (readonly) mode.
> > -+ *
> > -+ * @param zip zip archive handler.
> > -+ * @param index index in local dictionary.
> > -+ *
> > -+ * @return the return code - 0 on success, negative number (< 0) on
> error.
> > -+ */
> > - extern int zip_entry_openbyindex(struct zip_t *zip, int index);
> > -
> > --/*
> > --  Closes a zip entry, flushes buffer and releases resources.
> > --
> > --  Args:
> > --    zip: zip archive handler.
> > --
> > --  Returns:
> > --    The return code - 0 on success, negative number (< 0) on error.
> > --*/
> > -+/**
> > -+ * Closes a zip entry, flushes buffer and releases resources.
> > -+ *
> > -+ * @param zip zip archive handler.
> > -+ *
> > -+ * @return the return code - 0 on success, negative number (< 0) on
> error.
> > -+ */
> > - extern int zip_entry_close(struct zip_t *zip);
> > -
> > --/*
> > --  Returns a local name of the current zip entry.
> > --  The main difference between user's entry name and local entry name
> > --  is optional relative path.
> > --  Following .ZIP File Format Specification - the path stored MUST not
> contain
> > --  a drive or device letter, or a leading slash.
> > --  All slashes MUST be forward slashes '/' as opposed to backwards
> slashes '\'
> > --  for compatibility with Amiga and UNIX file systems etc.
> > --
> > --  Args:
> > --    zip: zip archive handler.
> > --
> > --  Returns:
> > --    The pointer to the current zip entry name, or NULL on error.
> > --*/
> > -+/**
> > -+ * Returns a local name of the current zip entry.
> > -+ *
> > -+ * The main difference between user's entry name and local entry name
> > -+ * is optional relative path.
> > -+ * Following .ZIP File Format Specification - the path stored MUST no=
t
> contain
> > -+ * a drive or device letter, or a leading slash.
> > -+ * All slashes MUST be forward slashes '/' as opposed to backwards
> slashes '\'
> > -+ * for compatibility with Amiga and UNIX file systems etc.
> > -+ *
> > -+ * @param zip: zip archive handler.
> > -+ *
> > -+ * @return the pointer to the current zip entry name, or NULL on erro=
r.
> > -+ */
> > - extern const char *zip_entry_name(struct zip_t *zip);
> > -
> > --/*
> > --  Returns an index of the current zip entry.
> > --
> > --  Args:
> > --    zip: zip archive handler.
> > --
> > --  Returns:
> > --    The index on success, negative number (< 0) on error.
> > --*/
> > -+/**
> > -+ * Returns an index of the current zip entry.
> > -+ *
> > -+ * @param zip zip archive handler.
> > -+ *
> > -+ * @return the index on success, negative number (< 0) on error.
> > -+ */
> > - extern int zip_entry_index(struct zip_t *zip);
> > -
> > --/*
> > --  Determines if the current zip entry is a directory entry.
> > --
> > --  Args:
> > --    zip: zip archive handler.
> > --
> > --  Returns:
> > --    The return code - 1 (true), 0 (false), negative number (< 0) on
> error.
> > --*/
> > -+/**
> > -+ * Determines if the current zip entry is a directory entry.
> > -+ *
> > -+ * @param zip zip archive handler.
> > -+ *
> > -+ * @return the return code - 1 (true), 0 (false), negative number (<
> 0) on
> > -+ *         error.
> > -+ */
> > - extern int zip_entry_isdir(struct zip_t *zip);
> > -
> > --/*
> > --  Returns an uncompressed size of the current zip entry.
> > --
> > --  Args:
> > --    zip: zip archive handler.
> > --
> > --  Returns:
> > --    The uncompressed size in bytes.
> > --*/
> > -+/**
> > -+ * Returns an uncompressed size of the current zip entry.
> > -+ *
> > -+ * @param zip zip archive handler.
> > -+ *
> > -+ * @return the uncompressed size in bytes.
> > -+ */
> > - extern unsigned long long zip_entry_size(struct zip_t *zip);
> > -
> > --/*
> > --  Returns CRC-32 checksum of the current zip entry.
> > --
> > --  Args:
> > --    zip: zip archive handler.
> > --
> > --  Returns:
> > --    The CRC-32 checksum.
> > --*/
> > -+/**
> > -+ * Returns CRC-32 checksum of the current zip entry.
> > -+ *
> > -+ * @param zip zip archive handler.
> > -+ *
> > -+ * @return the CRC-32 checksum.
> > -+ */
> > - extern unsigned int zip_entry_crc32(struct zip_t *zip);
> > -
> > --/*
> > --  Compresses an input buffer for the current zip entry.
> > --
> > --  Args:
> > --    zip: zip archive handler.
> > --    buf: input buffer.
> > --    bufsize: input buffer size (in bytes).
> > --
> > --  Returns:
> > --    The return code - 0 on success, negative number (< 0) on error.
> > --*/
> > -+/**
> > -+ * Compresses an input buffer for the current zip entry.
> > -+ *
> > -+ * @param zip zip archive handler.
> > -+ * @param buf input buffer.
> > -+ * @param bufsize input buffer size (in bytes).
> > -+ *
> > -+ * @return the return code - 0 on success, negative number (< 0) on
> error.
> > -+ */
> > - extern int zip_entry_write(struct zip_t *zip, const void *buf, size_t
> bufsize);
> > -
> > --/*
> > --  Compresses a file for the current zip entry.
> > --
> > --  Args:
> > --    zip: zip archive handler.
> > --    filename: input file.
> > --
> > --  Returns:
> > --    The return code - 0 on success, negative number (< 0) on error.
> > --*/
> > -+/**
> > -+ * Compresses a file for the current zip entry.
> > -+ *
> > -+ * @param zip zip archive handler.
> > -+ * @param filename input file.
> > -+ *
> > -+ * @return the return code - 0 on success, negative number (< 0) on
> error.
> > -+ */
> > - extern int zip_entry_fwrite(struct zip_t *zip, const char *filename);
> > -
> > --/*
> > --  Extracts the current zip entry into output buffer.
> > --  The function allocates sufficient memory for a output buffer.
> > --
> > --  Args:
> > --    zip: zip archive handler.
> > --    buf: output buffer.
> > --    bufsize: output buffer size (in bytes).
> > --
> > --  Note:
> > --    - remember to release memory allocated for a output buffer.
> > --    - for large entries, please take a look at zip_entry_extract
> function.
> > --
> > --  Returns:
> > --    The return code - the number of bytes actually read on success.
> > --    Otherwise a -1 on error.
> > --*/
> > -+/**
> > -+ * Extracts the current zip entry into output buffer.
> > -+ *
> > -+ * The function allocates sufficient memory for a output buffer.
> > -+ *
> > -+ * @param zip zip archive handler.
> > -+ * @param buf output buffer.
> > -+ * @param bufsize output buffer size (in bytes).
> > -+ *
> > -+ * @note remember to release memory allocated for a output buffer.
> > -+ *       for large entries, please take a look at zip_entry_extract
> function.
> > -+ *
> > -+ * @return the return code - the number of bytes actually read on
> success.
> > -+ *         Otherwise a -1 on error.
> > -+ */
> > - extern ssize_t zip_entry_read(struct zip_t *zip, void **buf, size_t
> *bufsize);
> > -
> > --/*
> > --  Extracts the current zip entry into a memory buffer using no memory
> > --  allocation.
> > --
> > --  Args:
> > --    zip: zip archive handler.
> > --    buf: preallocated output buffer.
> > --    bufsize: output buffer size (in bytes).
> > --
> > --  Note:
> > --    - ensure supplied output buffer is large enough.
> > --    - zip_entry_size function (returns uncompressed size for the
> current entry)
> > --      can be handy to estimate how big buffer is needed.
> > --    - for large entries, please take a look at zip_entry_extract
> function.
> > --
> > --  Returns:
> > --    The return code - the number of bytes actually read on success.
> > --    Otherwise a -1 on error (e.g. bufsize is not large enough).
> > --*/
> > --extern ssize_t zip_entry_noallocread(struct zip_t *zip, void *buf,
> size_t bufsize);
> > --
> > --/*
> > --  Extracts the current zip entry into output file.
> > --
> > --  Args:
> > --    zip: zip archive handler.
> > --    filename: output file.
> > --
> > --  Returns:
> > --    The return code - 0 on success, negative number (< 0) on error.
> > --*/
> > -+/**
> > -+ * Extracts the current zip entry into a memory buffer using no memor=
y
> > -+ * allocation.
> > -+ *
> > -+ * @param zip zip archive handler.
> > -+ * @param buf preallocated output buffer.
> > -+ * @param bufsize output buffer size (in bytes).
> > -+ *
> > -+ * @note ensure supplied output buffer is large enough.
> > -+ *       zip_entry_size function (returns uncompressed size for the
> current
> > -+ *       entry) can be handy to estimate how big buffer is needed. fo=
r
> large
> > -+ * entries, please take a look at zip_entry_extract function.
> > -+ *
> > -+ * @return the return code - the number of bytes actually read on
> success.
> > -+ *         Otherwise a -1 on error (e.g. bufsize is not large enough)=
.
> > -+ */
> > -+extern ssize_t zip_entry_noallocread(struct zip_t *zip, void *buf,
> > -+                                     size_t bufsize);
> > -+
> > -+/**
> > -+ * Extracts the current zip entry into output file.
> > -+ *
> > -+ * @param zip zip archive handler.
> > -+ * @param filename output file.
> > -+ *
> > -+ * @return the return code - 0 on success, negative number (< 0) on
> error.
> > -+ */
> > - extern int zip_entry_fread(struct zip_t *zip, const char *filename);
> > -
> > --/*
> > --  Extracts the current zip entry using a callback function
> (on_extract).
> > --
> > --  Args:
> > --    zip: zip archive handler.
> > --    on_extract: callback function.
> > --    arg: opaque pointer (optional argument,
> > --                         which you can pass to the on_extract callbac=
k)
> > --
> > --   Returns:
> > --    The return code - 0 on success, negative number (< 0) on error.
> > -+/**
> > -+ * Extracts the current zip entry using a callback function
> (on_extract).
> > -+ *
> > -+ * @param zip zip archive handler.
> > -+ * @param on_extract callback function.
> > -+ * @param arg opaque pointer (optional argument, which you can pass t=
o
> the
> > -+ *        on_extract callback)
> > -+ *
> > -+ * @return the return code - 0 on success, negative number (< 0) on
> error.
> > -  */
> > - extern int
> > - zip_entry_extract(struct zip_t *zip,
> > -@@ -262,53 +261,49 @@ zip_entry_extract(struct zip_t *zip,
> > -                                        const void *data, size_t size)=
,
> > -                   void *arg);
> > -
> > --/*
> > --  Returns the number of all entries (files and directories) in the zi=
p
> archive.
> > --
> > --  Args:
> > --    zip: zip archive handler.
> > --
> > --  Returns:
> > --    The return code - the number of entries on success,
> > --    negative number (< 0) on error.
> > --*/
> > -+/**
> > -+ * Returns the number of all entries (files and directories) in the
> zip archive.
> > -+ *
> > -+ * @param zip zip archive handler.
> > -+ *
> > -+ * @return the return code - the number of entries on success,
> negative number
> > -+ *         (< 0) on error.
> > -+ */
> > - extern int zip_total_entries(struct zip_t *zip);
> > -
> > --/*
> > --  Creates a new archive and puts files into a single zip archive.
> > --
> > --  Args:
> > --    zipname: zip archive file.
> > --    filenames: input files.
> > --    len: number of input files.
> > --
> > --  Returns:
> > --    The return code - 0 on success, negative number (< 0) on error.
> > --*/
> > -+/**
> > -+ * Creates a new archive and puts files into a single zip archive.
> > -+ *
> > -+ * @param zipname zip archive file.
> > -+ * @param filenames input files.
> > -+ * @param len: number of input files.
> > -+ *
> > -+ * @return the return code - 0 on success, negative number (< 0) on
> error.
> > -+ */
> > - extern int zip_create(const char *zipname, const char *filenames[],
> size_t len);
> > -
> > --/*
> > --  Extracts a zip archive file into directory.
> > --
> > --  If on_extract_entry is not NULL, the callback will be called after
> > --  successfully extracted each zip entry.
> > --  Returning a negative value from the callback will cause abort and
> return an
> > --  error. The last argument (void *arg) is optional, which you can use
> to pass
> > --  data to the on_extract_entry callback.
> > --
> > --  Args:
> > --    zipname: zip archive file.
> > --    dir: output directory.
> > --    on_extract_entry: on extract callback.
> > --    arg: opaque pointer.
> > --
> > --  Returns:
> > --    The return code - 0 on success, negative number (< 0) on error.
> > --*/
> > -+/**
> > -+ * Extracts a zip archive file into directory.
> > -+ *
> > -+ * If on_extract_entry is not NULL, the callback will be called after
> > -+ * successfully extracted each zip entry.
> > -+ * Returning a negative value from the callback will cause abort and
> return an
> > -+ * error. The last argument (void *arg) is optional, which you can us=
e
> to pass
> > -+ * data to the on_extract_entry callback.
> > -+ *
> > -+ * @param zipname zip archive file.
> > -+ * @param dir output directory.
> > -+ * @param on_extract_entry on extract callback.
> > -+ * @param arg opaque pointer.
> > -+ *
> > -+ * @return the return code - 0 on success, negative number (< 0) on
> error.
> > -+ */
> > - extern int zip_extract(const char *zipname, const char *dir,
> > -                        int (*on_extract_entry)(const char *filename,
> void *arg),
> > -                        void *arg);
> > -
> > -+/** @} */
> > -+
> > - #ifdef __cplusplus
> > - }
> > - #endif
> > -diff --git a/contrib/zip/test/CMakeLists.txt
> b/contrib/zip/test/CMakeLists.txt
> > -index 9b2a8db1..cc060b00 100644
> > ---- a/contrib/zip/test/CMakeLists.txt
> > -+++ b/contrib/zip/test/CMakeLists.txt
> > -@@ -1,19 +1,16 @@
> > - cmake_minimum_required(VERSION 2.8)
> > -
> > --if ("${CMAKE_C_COMPILER_ID}" STREQUAL "GNU" OR
> "${CMAKE_C_COMPILER_ID}" STREQUAL "Clang" OR "${CMAKE_C_COMPILER_ID}"
> STREQUAL "AppleClang")
> > --  if(ENABLE_COVERAGE)
> > --    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -g ")
> > --    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -O0")
> > --    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fprofile-arcs")
> > --    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -ftest-coverage")
> > --    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} --coverage"=
)
> > --  endif()
> > --endif ()
> > --
> > - # test
> > --include_directories(../src)
> > --add_executable(test.exe test.c ../src/zip.c)
> > --add_executable(test_miniz.exe test_miniz.c)
> > -+set(test_out test.out)
> > -+set(test_miniz_out test_miniz.out)
> > -+
> > -+add_executable(${test_out} test.c)
> > -+target_link_libraries(${test_out} zip)
> > -+add_executable(${test_miniz_out} test_miniz.c)
> > -+target_link_libraries(${test_miniz_out} zip)
> > -+
> > -+add_test(NAME ${test_out} COMMAND ${test_out})
> > -+add_test(NAME ${test_miniz_out} COMMAND ${test_miniz_out})
> > -
> > --add_test(NAME test COMMAND test.exe)
> > --add_test(NAME test_miniz COMMAND test_miniz.exe)
> > -+set(test_out ${test_out} PARENT_SCOPE)
> > -+set(test_miniz_out ${test_miniz_out} PARENT_SCOPE)
> > -diff --git a/contrib/zip/test/test.c b/contrib/zip/test/test.c
> > -index 45443053..a9b2ddab 100644
> > ---- a/contrib/zip/test/test.c
> > -+++ b/contrib/zip/test/test.c
> > -@@ -29,6 +29,8 @@
> > - #define XFILE "7.txt\0"
> > - #define XMODE 0100777
> > -
> > -+#define UNIXMODE 0100644
> > -+
> > - #define UNUSED(x) (void)x
> > -
> > - static int total_entries =3D 0;
> > -@@ -102,7 +104,8 @@ static void test_read(void) {
> > -   assert(0 =3D=3D zip_entry_close(zip));
> > -   free(buf);
> > -   buf =3D NULL;
> > --
> > -+  bufsize =3D 0;
> > -+
> > -   assert(0 =3D=3D zip_entry_open(zip, "test/test-2.txt"));
> > -   assert(strlen(TESTDATA2) =3D=3D zip_entry_size(zip));
> > -   assert(CRC32DATA2 =3D=3D zip_entry_crc32(zip));
> > -@@ -131,7 +134,8 @@ static void test_read(void) {
> > -   assert(0 =3D=3D zip_entry_close(zip));
> > -   free(buf);
> > -   buf =3D NULL;
> > --
> > -+  bufsize =3D 0;
> > -+
> > -   buftmp =3D strlen(TESTDATA1);
> > -   buf =3D calloc(buftmp, sizeof(char));
> > -   assert(0 =3D=3D zip_entry_open(zip, "test/test-1.txt"));
> > -@@ -433,6 +437,35 @@ static void test_mtime(void) {
> > -   remove(ZIPNAME);
> > - }
> > -
> > -+static void test_unix_permissions(void) {
> > -+#if defined(_WIN64) || defined(_WIN32) || defined(__WIN32__)
> > -+#else
> > -+  // UNIX or APPLE
> > -+  struct MZ_FILE_STAT_STRUCT file_stats;
> > -+
> > -+  remove(ZIPNAME);
> > -+
> > -+  struct zip_t *zip =3D zip_open(ZIPNAME, ZIP_DEFAULT_COMPRESSION_LEV=
EL,
> 'w');
> > -+  assert(zip !=3D NULL);
> > -+
> > -+  assert(0 =3D=3D zip_entry_open(zip, RFILE));
> > -+  assert(0 =3D=3D zip_entry_write(zip, TESTDATA1, strlen(TESTDATA1)))=
;
> > -+  assert(0 =3D=3D zip_entry_close(zip));
> > -+
> > -+  zip_close(zip);
> > -+
> > -+  remove(RFILE);
> > -+
> > -+  assert(0 =3D=3D zip_extract(ZIPNAME, ".", NULL, NULL));
> > -+
> > -+  assert(0 =3D=3D MZ_FILE_STAT(RFILE, &file_stats));
> > -+  assert(UNIXMODE =3D=3D file_stats.st_mode);
> > -+
> > -+  remove(RFILE);
> > -+  remove(ZIPNAME);
> > -+#endif
> > -+}
> > -+
> > - int main(int argc, char *argv[]) {
> > -   UNUSED(argc);
> > -   UNUSED(argv);
> > -@@ -453,6 +486,7 @@ int main(int argc, char *argv[]) {
> > -   test_write_permissions();
> > -   test_exe_permissions();
> > -   test_mtime();
> > -+  test_unix_permissions();
> > -
> > -   remove(ZIPNAME);
> > -   return 0;
> > -diff --git a/contrib/zip/test/test_miniz.c
> b/contrib/zip/test/test_miniz.c
> > -index ebc0564d..babcaecd 100644
> > ---- a/contrib/zip/test/test_miniz.c
> > -+++ b/contrib/zip/test/test_miniz.c
> > -@@ -23,16 +23,39 @@ int main(int argc, char *argv[]) {
> > -   uint step =3D 0;
> > -   int cmp_status;
> > -   uLong src_len =3D (uLong)strlen(s_pStr);
> > --  uLong cmp_len =3D compressBound(src_len);
> > -   uLong uncomp_len =3D src_len;
> > -+  uLong cmp_len;
> > -   uint8 *pCmp, *pUncomp;
> > -+  size_t sz;
> > -   uint total_succeeded =3D 0;
> > -   (void)argc, (void)argv;
> > -
> > -   printf("miniz.c version: %s\n", MZ_VERSION);
> > -
> > -   do {
> > -+    pCmp =3D (uint8 *)tdefl_compress_mem_to_heap(s_pStr, src_len,
> &cmp_len, 0);
> > -+    if (!pCmp) {
> > -+      printf("tdefl_compress_mem_to_heap failed\n");
> > -+      return EXIT_FAILURE;
> > -+    }
> > -+    if (src_len <=3D cmp_len) {
> > -+      printf("tdefl_compress_mem_to_heap failed: from %u to %u
> bytes\n",
> > -+             (mz_uint32)uncomp_len, (mz_uint32)cmp_len);
> > -+      free(pCmp);
> > -+      return EXIT_FAILURE;
> > -+    }
> > -+
> > -+    sz =3D tdefl_compress_mem_to_mem(pCmp, cmp_len, s_pStr, src_len, =
0);
> > -+    if (sz !=3D cmp_len) {
> > -+      printf("tdefl_compress_mem_to_mem failed: expected %u, got %u\n=
",
> > -+             (mz_uint32)cmp_len, (mz_uint32)sz);
> > -+      free(pCmp);
> > -+      return EXIT_FAILURE;
> > -+    }
> > -+
> > -     // Allocate buffers to hold compressed and uncompressed data.
> > -+    free(pCmp);
> > -+    cmp_len =3D compressBound(src_len);
> > -     pCmp =3D (mz_uint8 *)malloc((size_t)cmp_len);
> > -     pUncomp =3D (mz_uint8 *)malloc((size_t)src_len);
> > -     if ((!pCmp) || (!pUncomp)) {
> > diff --git
> a/meta/recipes-graphics/vulkan/assimp/use-GNUInstallDirs-where-possible.p=
atch
> b/meta/recipes-graphics/vulkan/assimp/use-GNUInstallDirs-where-possible.p=
atch
> > deleted file mode 100644
> > index e4f5b9ccbd..0000000000
> > ---
> a/meta/recipes-graphics/vulkan/assimp/use-GNUInstallDirs-where-possible.p=
atch
> > +++ /dev/null
> > @@ -1,257 +0,0 @@
> > -From cbf94fd62ff831879d10f99aa7766d391ae8a9b7 Mon Sep 17 00:00:00 2001
> > -From: =3D?UTF-8?q?Victor=3D20Matar=3DC3=3DA9?=3D <matare@fh-aachen.de>
> > -Date: Tue, 31 Mar 2020 21:30:07 +0200
> > -Subject: [PATCH] use GNUInstallDirs where possible
> > -
> > -Emulate the CMAKE_INSTALL_FULL_* variables on non-Unix systems and
> > -disable redefining FHS-mandated install locations via user-editable
> > -ASSIMP_*_INSTALL_DIR variables. Instead, if it REALLY proves necessary=
,
> > -Unix users can edit the advanced, canonical CMAKE_INSTALL_* variables.
> > ----
> > - CMakeLists.txt                 | 36 ++++++++++++++++++++++-----------=
-
> > - assimp.pc.in                   |  6 ++----
> > - assimpTargets-debug.cmake.in   | 20 +++++++++----------
> > - assimpTargets-release.cmake.in | 18 ++++++++---------
> > - assimpTargets.cmake.in         | 15 +-------------
> > - 5 files changed, 45 insertions(+), 50 deletions(-)
> > -
> > -Upstream-Status: Backport
> > -Comment: Additionally remove setting of ASSIMP_LIBRARY_DIRS,
> ASSIMP_INCLUDE_DIRS
> > -         and INTERFACE_INCLUDE_DIRECTORIES as default cross compile
> paths are enough
> > -         and setting them manually adds non-existing paths to CMake
> modules
> > -
> > -Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> > -
> > -diff --git a/CMakeLists.txt b/CMakeLists.txt
> > -index dcafb649f5..c23c0df33e 100644
> > ---- a/CMakeLists.txt
> > -+++ b/CMakeLists.txt
> > -@@ -230,11 +230,6 @@ SET(LIBASSIMP-DEV_COMPONENT
> "libassimp${ASSIMP_VERSION_MAJOR}.${ASSIMP_VERSION_M
> > - SET(CPACK_COMPONENTS_ALL assimp-bin ${LIBASSIMP_COMPONENT}
> ${LIBASSIMP-DEV_COMPONENT} assimp-dev)
> > - SET(ASSIMP_LIBRARY_SUFFIX "" CACHE STRING "Suffix to append to librar=
y
> names")
> > -
> > --IF( UNIX )
> > --  # Use GNUInstallDirs for Unix predefined directories
> > --  INCLUDE(GNUInstallDirs)
> > --ENDIF( UNIX )
> > --
> > - # Grouped compiler settings
> > - IF ((CMAKE_C_COMPILER_ID MATCHES "GNU") AND NOT
> CMAKE_COMPILER_IS_MINGW)
> > -   IF(NOT HUNTER_ENABLED)
> > -@@ -329,14 +324,6 @@ IF ( CMAKE_SOURCE_DIR STREQUAL CMAKE_BINARY_DIR )
> > -   SET( CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_HOME_DIRECTORY}/bin" )
> > - ENDIF ( CMAKE_SOURCE_DIR STREQUAL CMAKE_BINARY_DIR )
> > -
> > --# Cache these to allow the user to override them manually.
> > --SET( ASSIMP_LIB_INSTALL_DIR "lib" CACHE STRING
> > --  "Path the built library files are installed to." )
> > --SET( ASSIMP_INCLUDE_INSTALL_DIR "include" CACHE STRING
> > --  "Path the header files are installed to." )
> > --SET( ASSIMP_BIN_INSTALL_DIR "bin" CACHE STRING
> > --  "Path the tool executables are installed to." )
> > --
> > - get_cmake_property(is_multi_config GENERATOR_IS_MULTI_CONFIG)
> > -
> > - IF (INJECT_DEBUG_POSTFIX AND (is_multi_config OR CMAKE_BUILD_TYPE
> STREQUAL "Debug"))
> > -@@ -391,6 +378,29 @@ IF(HUNTER_ENABLED)
> > -   )
> > - ELSE(HUNTER_ENABLED)
> > -   # cmake configuration files
> > -+
> > -+  IF( UNIX )
> > -+    # Use GNUInstallDirs for Unix predefined directories
> > -+    INCLUDE(GNUInstallDirs)
> > -+
> > -+    SET( ASSIMP_LIB_INSTALL_DIR ${CMAKE_INSTALL_LIBDIR})
> > -+    SET( ASSIMP_INCLUDE_INSTALL_DIR ${CMAKE_INSTALL_INCLUDEDIR})
> > -+    SET( ASSIMP_BIN_INSTALL_DIR ${CMAKE_INSTALL_BINDIR})
> > -+  ELSE( UNIX )
> > -+    # Cache these to allow the user to override them on non-Unix
> platforms
> > -+    SET( ASSIMP_LIB_INSTALL_DIR "lib" CACHE STRING
> > -+      "Path the built library files are installed to." )
> > -+    SET( ASSIMP_INCLUDE_INSTALL_DIR "include" CACHE STRING
> > -+      "Path the header files are installed to." )
> > -+    SET( ASSIMP_BIN_INSTALL_DIR "bin" CACHE STRING
> > -+      "Path the tool executables are installed to." )
> > -+
> > -+    SET(CMAKE_INSTALL_FULL_INCLUDEDIR
> ${CMAKE_INSTALL_PREFIX}/${ASSIMP_INCLUDE_INSTALL_DIR})
> > -+    SET(CMAKE_INSTALL_FULL_LIBDIR
> ${CMAKE_INSTALL_PREFIX}/${ASSIMP_LIB_INSTALL_DIR})
> > -+    SET(CMAKE_INSTALL_FULL_BINDIR
> ${CMAKE_INSTALL_PREFIX}/${ASSIMP_BIN_INSTALL_DIR})
> > -+  ENDIF( UNIX )
> > -+
> > -+
> > -   CONFIGURE_FILE("${CMAKE_CURRENT_SOURCE_DIR}/assimp-config.cmake.in"
>        "${CMAKE_CURRENT_BINARY_DIR}/assimp-config.cmake" @ONLY IMMEDIATE)
> > -   CONFIGURE_FILE("${CMAKE_CURRENT_SOURCE_DIR}/assimpTargets.cmake.in"
>        "${CMAKE_CURRENT_BINARY_DIR}/assimpTargets.cmake" @ONLY IMMEDIATE)
> > -   IF (is_multi_config)
> > -diff --git a/assimp.pc.in b/assimp.pc.in
> > -index c659e19f2c..555a3a1d3b 100644
> > ---- a/assimp.pc.in
> > -+++ b/assimp.pc.in
> > -@@ -1,7 +1,5 @@
> > --prefix=3D@CMAKE_INSTALL_PREFIX@
> > --exec_prefix=3D@CMAKE_INSTALL_PREFIX@/
> > --libdir=3D@CMAKE_INSTALL_PREFIX@/@ASSIMP_LIB_INSTALL_DIR@
> > --includedir=3D@CMAKE_INSTALL_PREFIX@
> /../include/@ASSIMP_INCLUDE_INSTALL_DIR@
> > -+libdir=3D@CMAKE_INSTALL_FULL_LIBDIR@
> > -+includedir=3D@CMAKE_INSTALL_FULL_INCLUDEDIR@
> > -
> > - Name: @CMAKE_PROJECT_NAME@
> > - Description: Import various well-known 3D model formats in an uniform
> manner.
> > -diff --git a/assimpTargets-debug.cmake.in b/
> assimpTargets-debug.cmake.in
> > -index 1ebe2a6081..f5034c9349 100644
> > ---- a/assimpTargets-debug.cmake.in
> > -+++ b/assimpTargets-debug.cmake.in
> > -@@ -42,22 +42,22 @@ if(MSVC)
> > -     # Import target "assimp::assimp" for configuration "Debug"
> > -     set_property(TARGET assimp::assimp APPEND PROPERTY
> IMPORTED_CONFIGURATIONS DEBUG)
> > -     set_target_properties(assimp::assimp PROPERTIES
> > --      IMPORTED_IMPLIB_DEBUG
> "${_IMPORT_PREFIX}/lib/${importLibraryName}"
> > --      IMPORTED_LOCATION_DEBUG
> "${_IMPORT_PREFIX}/bin/${sharedLibraryName}"
> > -+      IMPORTED_IMPLIB_DEBUG "@CMAKE_INSTALL_FULL_LIBDIR@
> /${importLibraryName}"
> > -+      IMPORTED_LOCATION_DEBUG "@CMAKE_INSTALL_FULL_BINDIR@
> /${sharedLibraryName}"
> > -     )
> > -     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> > --    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> "${_IMPORT_PREFIX}/lib/${importLibraryName}")
> > --    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> "${_IMPORT_PREFIX}/bin/${sharedLibraryName}" )
> > -+    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> "@CMAKE_INSTALL_FULL_LIBDIR@/${importLibraryName}")
> > -+    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> "@CMAKE_INSTALL_FULL_BINDIR@/${sharedLibraryName}" )
> > -   else()
> > -     set(staticLibraryName
> "assimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_DEBUG_POSTFIX
> @@CMAKE_STATIC_LIBRARY_SUFFIX@")
> > -
> > -     # Import target "assimp::assimp" for configuration "Debug"
> > -     set_property(TARGET assimp::assimp APPEND PROPERTY
> IMPORTED_CONFIGURATIONS DEBUG)
> > -     set_target_properties(assimp::assimp PROPERTIES
> > --      IMPORTED_LOCATION_DEBUG
> "${_IMPORT_PREFIX}/lib/${staticLibraryName}"
> > -+      IMPORTED_LOCATION_DEBUG "@CMAKE_INSTALL_FULL_LIBDIR@
> /${staticLibraryName}"
> > -     )
> > -     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> > --    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> "${_IMPORT_PREFIX}/lib/${staticLibraryName}")
> > -+    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> "@CMAKE_INSTALL_FULL_LIBDIR@/${staticLibraryName}")
> > -   endif()
> > -
> > - else()
> > -@@ -66,17 +66,17 @@ else()
> > -     set(sharedLibraryName
> "libassimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_DEBUG_POSTFIX
> @@CMAKE_SHARED_LIBRARY_SUFFIX@.@ASSIMP_VERSION_MAJOR@")
> > -     set_target_properties(assimp::assimp PROPERTIES
> > -       IMPORTED_SONAME_DEBUG "${sharedLibraryName}"
> > --      IMPORTED_LOCATION_DEBUG
> "${_IMPORT_PREFIX}/lib/${sharedLibraryName}"
> > -+      IMPORTED_LOCATION_DEBUG "@CMAKE_INSTALL_FULL_LIBDIR@
> /${sharedLibraryName}"
> > -     )
> > -     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> > --    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> "${_IMPORT_PREFIX}/lib/${sharedLibraryName}" )
> > -+    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> "@CMAKE_INSTALL_FULL_LIBDIR@/${sharedLibraryName}" )
> > -   else()
> > -     set(staticLibraryName
> "libassimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_DEBUG_POSTFIX
> @@CMAKE_STATIC_LIBRARY_SUFFIX@")
> > -     set_target_properties(assimp::assimp PROPERTIES
> > --      IMPORTED_LOCATION_DEBUG
> "${_IMPORT_PREFIX}/lib/${staticLibraryName}"
> > -+      IMPORTED_LOCATION_DEBUG "@CMAKE_INSTALL_FULL_LIBDIR@
> /${staticLibraryName}"
> > -     )
> > -     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> > --    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> "${_IMPORT_PREFIX}/lib/${staticLibraryName}" )
> > -+    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> "@CMAKE_INSTALL_FULL_LIBDIR@/${staticLibraryName}" )
> > -   endif()
> > - endif()
> > -
> > -diff --git a/assimpTargets-release.cmake.in b/
> assimpTargets-release.cmake.in
> > -index f3db8f12cd..a416e8899b 100644
> > ---- a/assimpTargets-release.cmake.in
> > -+++ b/assimpTargets-release.cmake.in
> > -@@ -42,12 +42,12 @@ if(MSVC)
> > -     # Import target "assimp::assimp" for configuration "Release"
> > -     set_property(TARGET assimp::assimp APPEND PROPERTY
> IMPORTED_CONFIGURATIONS RELEASE)
> > -     set_target_properties(assimp::assimp PROPERTIES
> > --      IMPORTED_IMPLIB_RELEASE
> "${_IMPORT_PREFIX}/lib/${importLibraryName}"
> > --      IMPORTED_LOCATION_RELEASE
> "${_IMPORT_PREFIX}/bin/${sharedLibraryName}"
> > -+      IMPORTED_IMPLIB_RELEASE "@CMAKE_INSTALL_FULL_LIBDIR@
> /${importLibraryName}"
> > -+      IMPORTED_LOCATION_RELEASE "@CMAKE_INSTALL_FULL_BINDIR@
> /${sharedLibraryName}"
> > -     )
> > -     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> > --    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> "${_IMPORT_PREFIX}/lib/${importLibraryName}")
> > --    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> "${_IMPORT_PREFIX}/bin/${sharedLibraryName}" )
> > -+    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> "@CMAKE_INSTALL_FULL_LIBDIR@/${importLibraryName}")
> > -+    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> "@CMAKE_INSTALL_FULL_BINDIR@/${sharedLibraryName}" )
> > -   else()
> > -     set(staticLibraryName
> "assimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_STATIC_LIBRARY_SUFFIX@")
> > -
> > -@@ -57,7 +57,7 @@ if(MSVC)
> > -       IMPORTED_LOCATION_RELEASE
> "${_IMPORT_PREFIX}/lib/${staticLibraryName}"
> > -     )
> > -     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> > --    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> "${_IMPORT_PREFIX}/lib/${staticLibraryName}")
> > -+    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> "@CMAKE_INSTALL_FULL_LIBDIR@/${staticLibraryName}")
> > -   endif()
> > -
> > - else()
> > -@@ -70,17 +70,17 @@ else()
> > -     endif()
> > -     set_target_properties(assimp::assimp PROPERTIES
> > -       IMPORTED_SONAME_RELEASE "${sharedLibraryName}"
> > --      IMPORTED_LOCATION_RELEASE
> "${_IMPORT_PREFIX}/lib/${sharedLibraryName}"
> > -+      IMPORTED_LOCATION_RELEASE "@CMAKE_INSTALL_FULL_LIBDIR@
> /${sharedLibraryName}"
> > -     )
> > -     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> > --    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> "${_IMPORT_PREFIX}/lib/${sharedLibraryName}" )
> > -+    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> "@CMAKE_INSTALL_FULL_LIBDIR@/${sharedLibraryName}" )
> > -   else()
> > -     set(staticLibraryName
> "libassimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_STATIC_LIBRARY_SUFFIX@")
> > -     set_target_properties(assimp::assimp PROPERTIES
> > --      IMPORTED_LOCATION_RELEASE
> "${_IMPORT_PREFIX}/lib/${staticLibraryName}"
> > -+      IMPORTED_LOCATION_RELEASE "@CMAKE_INSTALL_FULL_LIBDIR@
> /${staticLibraryName}"
> > -     )
> > -     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> > --    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> "${_IMPORT_PREFIX}/lib/${staticLibraryName}" )
> > -+    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> "@CMAKE_INSTALL_FULL_LIBDIR@/${staticLibraryName}" )
> > -   endif()
> > - endif()
> > -
> > -@@ -91,8 +91,6 @@ get_filename_component(ASSIMP_ROOT_DIR
> "@CMAKE_INSTALL_PREFIX@" REALPATH)
> > -
> > - set( ASSIMP_CXX_FLAGS ) # dynamically linked library
> > - set( ASSIMP_LINK_FLAGS "" )
> > --set( ASSIMP_LIBRARY_DIRS "${ASSIMP_ROOT_DIR}/@ASSIMP_LIB_INSTALL_DIR@
> ")
> > --set( ASSIMP_INCLUDE_DIRS
> "${ASSIMP_ROOT_DIR}/@ASSIMP_INCLUDE_INSTALL_DIR@")
> > - if(ASSIMP_BUILD_SHARED_LIBS)
> > -   set( ASSIMP_LIBRARIES ${sharedLibraryName})
> > - else()
> > -
> > -diff --git a/assimpTargets.cmake.in b/assimpTargets.cmake.in
> > -index ab1a8d2c7b..ef90c834a6 100644
> > ---- a/assimpTargets.cmake.in
> > -+++ b/assimpTargets.cmake.in
> > -@@ -40,16 +40,6 @@ unset(_targetsDefined)
> > - unset(_targetsNotDefined)
> > - unset(_expectedTargets)
> > -
> > --
> > --# Compute the installation prefix relative to this file.
> > --get_filename_component(_IMPORT_PREFIX "${CMAKE_CURRENT_LIST_FILE}"
> PATH)
> > --get_filename_component(_IMPORT_PREFIX "${_IMPORT_PREFIX}" PATH)
> > --get_filename_component(_IMPORT_PREFIX "${_IMPORT_PREFIX}" PATH)
> > --get_filename_component(_IMPORT_PREFIX "${_IMPORT_PREFIX}" PATH)
> > --if(_IMPORT_PREFIX STREQUAL "/")
> > --  set(_IMPORT_PREFIX "")
> > --endif()
> > --
> > - # Create imported target assimp::assimp
> > - if(@BUILD_SHARED_LIBS@)
> > -   add_library(assimp::assimp SHARED IMPORTED)
> > -@@ -60,7 +50,7 @@ endif()
> > - set_target_properties(assimp::assimp PROPERTIES
> > -   COMPATIBLE_INTERFACE_STRING "assimp_MAJOR_VERSION"
> > -   INTERFACE_assimp_MAJOR_VERSION "1"
> > --  INTERFACE_INCLUDE_DIRECTORIES
> "${_IMPORT_PREFIX}/include;${_IMPORT_PREFIX}/include"
> > -+  #INTERFACE_INCLUDE_DIRECTORIES "@CMAKE_INSTALL_FULL_INCLUDEDIR@"
> > -   #INTERFACE_LINK_LIBRARIES
> "TxtUtils::TxtUtils;MealyMachine::MealyMachine"
> > - )
> > -
> > -@@ -75,9 +65,6 @@ foreach(f ${CONFIG_FILES})
> > -   include(${f})
> > - endforeach()
> > -
> > --# Cleanup temporary variables.
> > --set(_IMPORT_PREFIX)
> > --
> > - # Loop over all imported files and verify that they actually exist
> > - foreach(target ${_IMPORT_CHECK_TARGETS} )
> > -   foreach(file ${_IMPORT_CHECK_FILES_FOR_${target}} )
> > -
> > diff --git a/meta/recipes-graphics/vulkan/assimp_5.0.1.bb
> b/meta/recipes-graphics/vulkan/assimp_5.0.1.bb
> > deleted file mode 100644
> > index 89c555f08e..0000000000
> > --- a/meta/recipes-graphics/vulkan/assimp_5.0.1.bb
> > +++ /dev/null
> > @@ -1,26 +0,0 @@
> > -DESCRIPTION =3D "Open Asset Import Library is a portable Open Source
> library to import \
> > -               various well-known 3D model formats in a uniform manner=
."
> > -HOMEPAGE =3D "http://www.assimp.org/"
> > -SECTION =3D "devel"
> > -
> > -LICENSE =3D "BSD-3-Clause"
> > -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2119edef0916b0bd511cb3c7310=
76271"
> > -
> > -DEPENDS =3D "zlib"
> > -
> > -SRC_URI =3D "git://github.com/assimp/assimp.git;branch=3Dassimp_5.0_re=
lease
> \
> > -
>  file://0001-closes-https-github.com-assimp-assimp-issues-2733-up.patch \
> > -           file://use-GNUInstallDirs-where-possible.patch \
> > -
>  file://0001-assimp-remove-shared-lib-from-_IMPORT_CHECK_TARGETS.patch \
> > -           "
> > -UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>(\d+(\.\d+)+))"
> > -
> > -SRCREV =3D "8f0c6b04b2257a520aaab38421b2e090204b69df"
> > -
> > -S =3D "${WORKDIR}/git"
> > -
> > -inherit cmake
> > -
> > -EXTRA_OECMAKE =3D "-DASSIMP_BUILD_ASSIMP_TOOLS=3DOFF
> -DASSIMP_BUILD_TESTS=3DOFF -DASSIMP_LIB_INSTALL_DIR=3D${baselib}"
> > -
> > -BBCLASSEXTEND =3D "native nativesdk"
> >
> >
> >
> >
> >
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>
>=20
>
>

--0000000000000db23f05cb6734c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, 7 Sept 2021 at 14:04, Randy MacLeod &lt;<a href=3D"mailto:ra=
ndy.macleod@windriver.com">randy.macleod@windriver.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">In master, it seems t=
hat vulkan* depends on assimp:<br>
<br>
<a href=3D"https://layers.openembedded.org/layerindex/branch/master/recipes=
/?q=3Ddepends%3Aassimp" rel=3D"noreferrer" target=3D"_blank">https://layers=
.openembedded.org/layerindex/branch/master/recipes/?q=3Ddepends%3Aassimp</a=
><br>
<br>
and lots of recipes in meta-qt5 and meta-ros* so removing it here<br>
would just push the problem around.<br></blockquote><div><br></div><div>I&#=
39;m not sure why layerindex says otherewise, but neither vulkan nor anythi=
ng in meta-qt5 actually depend on assimp.</div><div>qt5/6 has an option, of=
f by default, to use external assimp, vulkan has no dependency at all.</div=
><div><br></div><div>This leaves basically meta-ros, so carrying assimp for=
 the benefit of a single layer is dubious at best.<br></div><div><br></div>=
<div>Alex<br></div><div><br></div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
<br>
I&#39;ll look at the sections that you have pointed out later today.<br>
<br>
../Randy<br>
<br>
&gt; <br>
&gt; Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver=
.com" target=3D"_blank">liezhi.yang@windriver.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A0 1 -<br>
&gt;=C2=A0 =C2=A0...hared-lib-from-_IMPORT_CHECK_TARGETS.patch |=C2=A0 =C2=
=A032 -<br>
&gt;=C2=A0 =C2=A0...hub.com-assimp-assimp-issues-2733-up.patch | 1664 -----=
------------<br>
&gt;=C2=A0 =C2=A0.../use-GNUInstallDirs-where-possible.patch=C2=A0 =C2=A0|=
=C2=A0 257 ---<br>
&gt;=C2=A0 =C2=A0meta/recipes-graphics/vulkan/<a href=3D"http://assimp_5.0.=
1.bb" rel=3D"noreferrer" target=3D"_blank">assimp_5.0.1.bb</a>=C2=A0 |=C2=
=A0 =C2=A026 -<br>
&gt;=C2=A0 =C2=A05 files changed, 1980 deletions(-)<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta/recipes-graphics/vulkan/assimp/000=
1-assimp-remove-shared-lib-from-_IMPORT_CHECK_TARGETS.patch<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta/recipes-graphics/vulkan/assimp/000=
1-closes-https-github.com-assimp-assimp-issues-2733-up.patch<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta/recipes-graphics/vulkan/assimp/use=
-GNUInstallDirs-where-possible.patch<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta/recipes-graphics/vulkan/<a href=3D=
"http://assimp_5.0.1.bb" rel=3D"noreferrer" target=3D"_blank">assimp_5.0.1.=
bb</a><br>
&gt; <br>
&gt; diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/dist=
ro/include/maintainers.inc<br>
&gt; index 0e8185f4e3..e560ba39dd 100644<br>
&gt; --- a/meta/conf/distro/include/maintainers.inc<br>
&gt; +++ b/meta/conf/distro/include/maintainers.inc<br>
&gt; @@ -46,7 +46,6 @@ RECIPE_MAINTAINER:pn-apt =3D &quot;An=C3=ADbal Lim=
=C3=B3n &lt;<a href=3D"mailto:limon.anibal@gmail.com" target=3D"_blank">lim=
on.anibal@gmail.com</a>&gt;&quot;<br>
&gt;=C2=A0 =C2=A0RECIPE_MAINTAINER:pn-argp-standalone =3D &quot;Khem Raj &l=
t;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.co=
m</a>&gt;&quot;<br>
&gt;=C2=A0 =C2=A0RECIPE_MAINTAINER:pn-asciidoc =3D &quot;Yi Zhao &lt;<a hre=
f=3D"mailto:yi.zhao@windriver.com" target=3D"_blank">yi.zhao@windriver.com<=
/a>&gt;&quot;<br>
&gt;=C2=A0 =C2=A0RECIPE_MAINTAINER:pn-aspell =3D &quot;Anuj Mittal &lt;<a h=
ref=3D"mailto:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.co=
m</a>&gt;&quot;<br>
&gt; -RECIPE_MAINTAINER:pn-assimp =3D &quot;Anuj Mittal &lt;<a href=3D"mail=
to:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.com</a>&gt;&q=
uot;<br>
&gt;=C2=A0 =C2=A0RECIPE_MAINTAINER:pn-at =3D &quot;Chen Qi &lt;<a href=3D"m=
ailto:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt=
;&quot;<br>
&gt;=C2=A0 =C2=A0RECIPE_MAINTAINER:pn-at-spi2-atk =3D &quot;Tim Orling &lt;=
<a href=3D"mailto:timothy.t.orling@intel.com" target=3D"_blank">timothy.t.o=
rling@intel.com</a>&gt;&quot;<br>
&gt;=C2=A0 =C2=A0RECIPE_MAINTAINER:pn-at-spi2-core =3D &quot;Tim Orling &lt=
;<a href=3D"mailto:timothy.t.orling@intel.com" target=3D"_blank">timothy.t.=
orling@intel.com</a>&gt;&quot;<br>
&gt; diff --git a/meta/recipes-graphics/vulkan/assimp/0001-assimp-remove-sh=
ared-lib-from-_IMPORT_CHECK_TARGETS.patch b/meta/recipes-graphics/vulkan/as=
simp/0001-assimp-remove-shared-lib-from-_IMPORT_CHECK_TARGETS.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 1078148d6b..0000000000<br>
&gt; --- a/meta/recipes-graphics/vulkan/assimp/0001-assimp-remove-shared-li=
b-from-_IMPORT_CHECK_TARGETS.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,32 +0,0 @@<br>
&gt; -From: Ranjitsinh Rathod &lt;<a href=3D"mailto:ranjitsinh.rathod@kpit.=
com" target=3D"_blank">ranjitsinh.rathod@kpit.com</a>&gt;<br>
&gt; -Date: Fri, 13 Aug 2021 16:42:48 +0530<br>
&gt; -Subject: [PATCH] assimp: remove shared lib from _IMPORT_CHECK_TARGETS=
<br>
&gt; -<br>
&gt; -In the target assimp::assimp shared library verification removed<br>
&gt; -as it is giving configuration error when used by 3rd part component t=
o<br>
&gt; -configure itself using assimp::assimp target<br>
&gt; -<br>
&gt; -Upstream-Status: Inappropriate [oe specific]<br>
&gt; -<br>
&gt; -Signed-off-by: Ranjitsinh Rathod &lt;<a href=3D"mailto:ranjitsinh.rat=
hod@kpit.com" target=3D"_blank">ranjitsinh.rathod@kpit.com</a>&gt;<br>
&gt; ----<br>
&gt; - <a href=3D"http://assimpTargets-release.cmake.in" rel=3D"noreferrer"=
 target=3D"_blank">assimpTargets-release.cmake.in</a> | 4 ++--<br>
&gt; - 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/<a href=3D"http://assimpTargets-release.cmake.in" rel=3D=
"noreferrer" target=3D"_blank">assimpTargets-release.cmake.in</a> b/<a href=
=3D"http://assimpTargets-release.cmake.in" rel=3D"noreferrer" target=3D"_bl=
ank">assimpTargets-release.cmake.in</a><br>
&gt; -index cd2fac7e0..52edc7990 100644<br>
&gt; ---- a/<a href=3D"http://assimpTargets-release.cmake.in" rel=3D"norefe=
rrer" target=3D"_blank">assimpTargets-release.cmake.in</a><br>
&gt; -+++ b/<a href=3D"http://assimpTargets-release.cmake.in" rel=3D"norefe=
rrer" target=3D"_blank">assimpTargets-release.cmake.in</a><br>
&gt; -@@ -72,8 +72,8 @@ else()<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0IMPORTED_SONAME_RELEASE &quot;${sharedLibr=
aryName}&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0IMPORTED_LOCATION_RELEASE &quot;@CMAKE_INS=
TALL_FULL_LIBDIR@/${sharedLibraryName}&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0)<br>
&gt; --=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )<br>
&gt; --=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp &qu=
ot;@CMAKE_INSTALL_FULL_LIBDIR@/${sharedLibraryName}&quot; )<br>
&gt; -+=C2=A0 =C2=A0 #list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )<br=
>
&gt; -+=C2=A0 =C2=A0 #list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp &q=
uot;@CMAKE_INSTALL_FULL_LIBDIR@/${sharedLibraryName}&quot; )<br>
&gt; -=C2=A0 =C2=A0else()<br>
&gt; -=C2=A0 =C2=A0 =C2=A0set(staticLibraryName &quot;libassimp${ASSIMP_LIB=
RARY_SUFFIX}@CMAKE_STATIC_LIBRARY_SUFFIX@&quot;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0set_target_properties(assimp::assimp PROPERTIES<b=
r>
&gt; ---<br>
&gt; -2.17.1<br>
&gt; diff --git a/meta/recipes-graphics/vulkan/assimp/0001-closes-https-git=
hub.com-assimp-assimp-issues-2733-up.patch b/meta/recipes-graphics/vulkan/a=
ssimp/0001-closes-https-github.com-assimp-assimp-issues-2733-up.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 87a1658710..0000000000<br>
&gt; --- a/meta/recipes-graphics/vulkan/assimp/0001-closes-https-github.com=
-assimp-assimp-issues-2733-up.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,1664 +0,0 @@<br>
&gt; -From 7fc220b2350d78942fb3935cad0b1564418ebe8f Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Kim Kulling &lt;<a href=3D"mailto:kim.kulling@googlemail.com" t=
arget=3D"_blank">kim.kulling@googlemail.com</a>&gt;<br>
&gt; -Date: Tue, 19 Nov 2019 20:30:40 +0100<br>
&gt; -Subject: [PATCH] closes <a href=3D"https://github.com/assimp/assimp/i=
ssues/2733" rel=3D"noreferrer" target=3D"_blank">https://github.com/assimp/=
assimp/issues/2733</a>: update<br>
&gt; - of zlip to fix gcc build for v9.2.0 32 bit<br>
&gt; -<br>
&gt; -Upstream-Status: Backport [<a href=3D"https://github.com/assimp/assim=
p/commit/f78446b14aff46db2ef27d062a275b6a01fd68b1" rel=3D"noreferrer" targe=
t=3D"_blank">https://github.com/assimp/assimp/commit/f78446b14aff46db2ef27d=
062a275b6a01fd68b1</a>]<br>
&gt; -Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ----<br>
&gt; - contrib/zip/.gitignore=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A02 +<br>
&gt; - contrib/zip/CMakeLists.txt=C2=A0 =C2=A0 =C2=A0 |=C2=A0 83 +++++-<br>
&gt; - contrib/zip/README.md=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 12 +-<br>
&gt; - contrib/zip/appveyor.yml=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 =
+-<br>
&gt; - contrib/zip/src/miniz.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 457 +++++=
+++++++++++++++++++++++----<br>
&gt; - contrib/zip/src/zip.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 62 +++--<br>
&gt; - contrib/zip/src/zip.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 457 =
++++++++++++++++----------------<br>
&gt; - contrib/zip/test/CMakeLists.txt |=C2=A0 27 +-<br>
&gt; - contrib/zip/test/test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 38 =
++-<br>
&gt; - contrib/zip/test/test_miniz.c=C2=A0 =C2=A0|=C2=A0 25 +-<br>
&gt; - 10 files changed, 821 insertions(+), 344 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/contrib/zip/.gitignore b/contrib/zip/.gitignore<br>
&gt; -index a7904a1e..49b2cb2f 100644<br>
&gt; ---- a/contrib/zip/.gitignore<br>
&gt; -+++ b/contrib/zip/.gitignore<br>
&gt; -@@ -1,6 +1,7 @@<br>
&gt; - /build/<br>
&gt; - /test/build/<br>
&gt; - /xcodeproj/<br>
&gt; -+.vscode/<br>
&gt; -<br>
&gt; - # Object files<br>
&gt; - *.o<br>
&gt; -@@ -54,3 +55,4 @@ zip.dir/<br>
&gt; - test/test.exe.vcxproj.filters<br>
&gt; - test/test.exe.vcxproj<br>
&gt; - test/test.exe.dir/<br>
&gt; -+<br>
&gt; -diff --git a/contrib/zip/CMakeLists.txt b/contrib/zip/CMakeLists.txt<=
br>
&gt; -index b46dbb1d..77916d2e 100644<br>
&gt; ---- a/contrib/zip/CMakeLists.txt<br>
&gt; -+++ b/contrib/zip/CMakeLists.txt<br>
&gt; -@@ -1,10 +1,14 @@<br>
&gt; --cmake_minimum_required(VERSION 2.8)<br>
&gt; --project(zip)<br>
&gt; --enable_language(C)<br>
&gt; -+cmake_minimum_required(VERSION 3.0)<br>
&gt; -+<br>
&gt; -+project(zip<br>
&gt; -+=C2=A0 LANGUAGES C<br>
&gt; -+=C2=A0 VERSION &quot;0.1.15&quot;)<br>
&gt; - set(CMAKE_MODULE_PATH &quot;${PROJECT_SOURCE_DIR}/cmake&quot; ${CMAK=
E_MODULE_PATH})<br>
&gt; -<br>
&gt; -+option(CMAKE_DISABLE_TESTING &quot;Disable test creation&quot; OFF)<=
br>
&gt; -+<br>
&gt; - if (MSVC)<br>
&gt; --=C2=A0 # Use secure functions by defaualt and suppress warnings abou=
t &quot;deprecated&quot; functions<br>
&gt; -+=C2=A0 # Use secure functions by default and suppress warnings about=
 &quot;deprecated&quot; functions<br>
&gt; -=C2=A0 =C2=A0set(CMAKE_C_FLAGS &quot;${CMAKE_C_FLAGS} /D _CRT_SECURE_=
CPP_OVERLOAD_STANDARD_NAMES=3D1&quot;)<br>
&gt; -=C2=A0 =C2=A0set(CMAKE_C_FLAGS &quot;${CMAKE_C_FLAGS} /D _CRT_SECURE_=
CPP_OVERLOAD_STANDARD_NAMES_COUNT=3D1&quot;)<br>
&gt; -=C2=A0 =C2=A0set(CMAKE_C_FLAGS &quot;${CMAKE_C_FLAGS} /D _CRT_NONSTDC=
_NO_WARNINGS=3D1 /D _CRT_SECURE_NO_WARNINGS=3D1&quot;)<br>
&gt; -@@ -12,28 +16,80 @@ elseif (&quot;${CMAKE_C_COMPILER_ID}&quot; STREQU=
AL &quot;GNU&quot; OR<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${CMAKE_C_COMPILER_ID}&quot; =
STREQUAL &quot;Clang&quot; OR<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${CMAKE_C_COMPILER_ID}&quot; =
STREQUAL &quot;AppleClang&quot;)<br>
&gt; -=C2=A0 =C2=A0set(CMAKE_C_FLAGS &quot;${CMAKE_C_FLAGS} -std=3Dc99 -Wal=
l -Wextra -Werror -pedantic&quot;)<br>
&gt; -+=C2=A0 if(ENABLE_COVERAGE)<br>
&gt; -+=C2=A0 =C2=A0 set(CMAKE_C_FLAGS &quot;${CMAKE_C_FLAGS} -g -O0 -fprof=
ile-arcs -ftest-coverage&quot;)<br>
&gt; -+=C2=A0 =C2=A0 set(CMAKE_EXE_LINKER_FLAGS &quot;${CMAKE_EXE_LINKER_FL=
AGS} --coverage&quot;)<br>
&gt; -+=C2=A0 endif()<br>
&gt; - endif (MSVC)<br>
&gt; -<br>
&gt; - # zip<br>
&gt; - set(SRC src/miniz.h src/zip.h src/zip.c)<br>
&gt; - add_library(${PROJECT_NAME} ${SRC})<br>
&gt; --target_include_directories(${PROJECT_NAME} INTERFACE src)<br>
&gt; -+target_include_directories(${PROJECT_NAME} PUBLIC<br>
&gt; -+=C2=A0 $&lt;BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/src&gt;<br>
&gt; -+=C2=A0 $&lt;INSTALL_INTERFACE:include&gt;<br>
&gt; -+)<br>
&gt; -<br>
&gt; - # test<br>
&gt; - if (NOT CMAKE_DISABLE_TESTING)<br>
&gt; -=C2=A0 =C2=A0enable_testing()<br>
&gt; -=C2=A0 =C2=A0add_subdirectory(test)<br>
&gt; -=C2=A0 =C2=A0find_package(Sanitizers)<br>
&gt; --=C2=A0 add_sanitizers(${PROJECT_NAME} test.exe)<br>
&gt; --=C2=A0 add_sanitizers(${PROJECT_NAME} test_miniz.exe)<br>
&gt; -+=C2=A0 add_sanitizers(${PROJECT_NAME} ${test_out} ${test_miniz_out})=
<br>
&gt; - endif()<br>
&gt; -<br>
&gt; -+####<br>
&gt; -+# Installation (<a href=3D"https://github.com/forexample/package-exa=
mple" rel=3D"noreferrer" target=3D"_blank">https://github.com/forexample/pa=
ckage-example</a>) {<br>
&gt; -+<br>
&gt; -+set(CONFIG_INSTALL_DIR &quot;lib/cmake/${PROJECT_NAME}&quot;)<br>
&gt; -+set(INCLUDE_INSTALL_DIR &quot;include&quot;)<br>
&gt; -+<br>
&gt; -+set(GENERATED_DIR &quot;${CMAKE_CURRENT_BINARY_DIR}/generated&quot;)=
<br>
&gt; -+<br>
&gt; -+# Configuration<br>
&gt; -+set(VERSION_CONFIG &quot;${GENERATED_DIR}/${PROJECT_NAME}ConfigVersi=
on.cmake&quot;)<br>
&gt; -+set(PROJECT_CONFIG &quot;${GENERATED_DIR}/${PROJECT_NAME}Config.cmak=
e&quot;)<br>
&gt; -+set(TARGETS_EXPORT_NAME &quot;${PROJECT_NAME}Targets&quot;)<br>
&gt; -+set(NAMESPACE &quot;${PROJECT_NAME}::&quot;)<br>
&gt; -+<br>
&gt; -+# Include module with fuction &#39;write_basic_package_version_file&=
#39;<br>
&gt; -+include(CMakePackageConfigHelpers)<br>
&gt; -+<br>
&gt; -+# Note: PROJECT_VERSION is used as a VERSION<br>
&gt; -+write_basic_package_version_file(<br>
&gt; -+=C2=A0 =C2=A0 &quot;${VERSION_CONFIG}&quot; COMPATIBILITY SameMajorV=
ersion<br>
&gt; -+)<br>
&gt; -+<br>
&gt; -+# Use variables:<br>
&gt; -+#=C2=A0 =C2=A0* TARGETS_EXPORT_NAME<br>
&gt; -+#=C2=A0 =C2=A0* PROJECT_NAME<br>
&gt; -+configure_package_config_file(<br>
&gt; -+=C2=A0 =C2=A0 &quot;cmake/<a href=3D"http://Config.cmake.in" rel=3D"=
noreferrer" target=3D"_blank">Config.cmake.in</a>&quot;<br>
&gt; -+=C2=A0 =C2=A0 &quot;${PROJECT_CONFIG}&quot;<br>
&gt; -+=C2=A0 =C2=A0 INSTALL_DESTINATION &quot;${CONFIG_INSTALL_DIR}&quot;<=
br>
&gt; -+)<br>
&gt; -+<br>
&gt; -+install(<br>
&gt; -+=C2=A0 =C2=A0 FILES &quot;${PROJECT_CONFIG}&quot; &quot;${VERSION_CO=
NFIG}&quot;<br>
&gt; -+=C2=A0 =C2=A0 DESTINATION &quot;${CONFIG_INSTALL_DIR}&quot;<br>
&gt; -+)<br>
&gt; -+<br>
&gt; -+install(<br>
&gt; -+=C2=A0 =C2=A0 EXPORT &quot;${TARGETS_EXPORT_NAME}&quot;<br>
&gt; -+=C2=A0 =C2=A0 NAMESPACE &quot;${NAMESPACE}&quot;<br>
&gt; -+=C2=A0 =C2=A0 DESTINATION &quot;${CONFIG_INSTALL_DIR}&quot;<br>
&gt; -+)<br>
&gt; -+<br>
&gt; -+# }<br>
&gt; -+<br>
&gt; - install(TARGETS ${PROJECT_NAME}<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 EXPORT ${TARGETS_EXPORT_NAME}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RUNTIME DESTINATION bin<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ARCHIVE DESTINATION lib<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LIBRARY DESTINATION lib<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 COMPONENT library)<br>
&gt; --install(FILES ${PROJECT_SOURCE_DIR}/src/zip.h DESTINATION include)<b=
r>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 INCLUDES DESTINATION ${INCLUDE_INSTALL_D=
IR}<br>
&gt; -+)<br>
&gt; -+install(FILES ${PROJECT_SOURCE_DIR}/src/zip.h DESTINATION ${INCLUDE_=
INSTALL_DIR}/zip)<br>
&gt; -<br>
&gt; - # uninstall target (<a href=3D"https://gitlab.kitware.com/cmake/comm=
unity/wikis/FAQ#can-i-do-make-uninstall-with-cmake" rel=3D"noreferrer" targ=
et=3D"_blank">https://gitlab.kitware.com/cmake/community/wikis/FAQ#can-i-do=
-make-uninstall-with-cmake</a>)<br>
&gt; - if(NOT TARGET uninstall)<br>
&gt; -@@ -45,3 +101,12 @@ if(NOT TARGET uninstall)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0add_custom_target(uninstall<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0COMMAND ${CMAKE_COMMAND} -P ${CMAKE=
_CURRENT_BINARY_DIR}/cmake/cmake_uninstall.cmake)<br>
&gt; - endif()<br>
&gt; -+<br>
&gt; -+find_package(Doxygen)<br>
&gt; -+if(DOXYGEN_FOUND)<br>
&gt; -+=C2=A0 =C2=A0 configure_file(${CMAKE_CURRENT_SOURCE_DIR}/Doxyfile.in=
 ${CMAKE_CURRENT_BINARY_DIR}/Doxyfile @ONLY)<br>
&gt; -+=C2=A0 =C2=A0 add_custom_target(doc<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${DOXYGEN_EXECUTABLE} ${CMAKE_CURRENT_BI=
NARY_DIR}/Doxyfile<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY=
_DIR}<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 COMMENT &quot;Generating API documentati=
on with Doxygen&quot; VERBATIM)<br>
&gt; -+endif()<br>
&gt; -diff --git a/contrib/zip/README.md b/contrib/zip/README.md<br>
&gt; -index d5fb8cd2..14eb9a34 100644<br>
&gt; ---- a/contrib/zip/README.md<br>
&gt; -+++ b/contrib/zip/README.md<br>
&gt; -@@ -71,7 +71,7 @@ int arg =3D 2;<br>
&gt; - zip_extract(&quot;foo.zip&quot;, &quot;/tmp&quot;, on_extract_entry,=
 &amp;arg);<br>
&gt; - ```<br>
&gt; -<br>
&gt; --*=C2=A0 =C2=A0Extract a zip entry into memory.<br>
&gt; -+* Extract a zip entry into memory.<br>
&gt; - ```c<br>
&gt; - void *buf =3D NULL;<br>
&gt; - size_t bufsize;<br>
&gt; -@@ -89,7 +89,7 @@ zip_close(zip);<br>
&gt; - free(buf);<br>
&gt; - ```<br>
&gt; -<br>
&gt; --*=C2=A0 =C2=A0Extract a zip entry into memory (no internal allocatio=
n).<br>
&gt; -+* Extract a zip entry into memory (no internal allocation).<br>
&gt; - ```c<br>
&gt; - unsigned char *buf;<br>
&gt; - size_t bufsize;<br>
&gt; -@@ -110,7 +110,7 @@ zip_close(zip);<br>
&gt; - free(buf);<br>
&gt; - ```<br>
&gt; -<br>
&gt; --*=C2=A0 =C2=A0Extract a zip entry into memory using callback.<br>
&gt; -+* Extract a zip entry into memory using callback.<br>
&gt; - ```c<br>
&gt; - struct buffer_t {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0char *data;<br>
&gt; -@@ -144,7 +144,7 @@ free(buf.data);<br>
&gt; - ```<br>
&gt; -<br>
&gt; -<br>
&gt; --*=C2=A0 =C2=A0Extract a zip entry into a file.<br>
&gt; -+* Extract a zip entry into a file.<br>
&gt; - ```c<br>
&gt; - struct zip_t *zip =3D zip_open(&quot;foo.zip&quot;, 0, &#39;r&#39;);=
<br>
&gt; - {<br>
&gt; -@@ -157,7 +157,7 @@ struct zip_t *zip =3D zip_open(&quot;foo.zip&quot=
;, 0, &#39;r&#39;);<br>
&gt; - zip_close(zip);<br>
&gt; - ```<br>
&gt; -<br>
&gt; --*=C2=A0 =C2=A0List of all zip entries<br>
&gt; -+* List of all zip entries<br>
&gt; - ```c<br>
&gt; - struct zip_t *zip =3D zip_open(&quot;foo.zip&quot;, 0, &#39;r&#39;);=
<br>
&gt; - int i, n =3D zip_total_entries(zip);<br>
&gt; -@@ -174,7 +174,7 @@ for (i =3D 0; i &lt; n; ++i) {<br>
&gt; - zip_close(zip);<br>
&gt; - ```<br>
&gt; -<br>
&gt; --## Bindings<br>
&gt; -+# Bindings<br>
&gt; - Compile zip library as a dynamic library.<br>
&gt; - ```shell<br>
&gt; - $ mkdir build<br>
&gt; -diff --git a/contrib/zip/appveyor.yml b/contrib/zip/appveyor.yml<br>
&gt; -index 0be6373c..ea17f5de 100644<br>
&gt; ---- a/contrib/zip/appveyor.yml<br>
&gt; -+++ b/contrib/zip/appveyor.yml<br>
&gt; -@@ -1,4 +1,4 @@<br>
&gt; --version: zip-0.1.9.{build}<br>
&gt; -+version: zip-0.1.15.{build}<br>
&gt; - build_script:<br>
&gt; - - cmd: &gt;-<br>
&gt; -=C2=A0 =C2=A0 =C2=A0cd c:\projects\zip<br>
&gt; -diff --git a/contrib/zip/src/miniz.h b/contrib/zip/src/miniz.h<br>
&gt; -index 2c27a94d..c4fcfb83 100644<br>
&gt; ---- a/contrib/zip/src/miniz.h<br>
&gt; -+++ b/contrib/zip/src/miniz.h<br>
&gt; -@@ -221,6 +221,7 @@<br>
&gt; - #ifndef MINIZ_HEADER_INCLUDED<br>
&gt; - #define MINIZ_HEADER_INCLUDED<br>
&gt; -<br>
&gt; -+#include &lt;stdint.h&gt;<br>
&gt; - #include &lt;stdlib.h&gt;<br>
&gt; -<br>
&gt; - // Defines to completely disable specific portions of miniz.c:<br>
&gt; -@@ -284,7 +285,8 @@<br>
&gt; - /* Set MINIZ_USE_UNALIGNED_LOADS_AND_STORES only if not set */<br>
&gt; - #if !defined(MINIZ_USE_UNALIGNED_LOADS_AND_STORES)<br>
&gt; - #if MINIZ_X86_OR_X64_CPU<br>
&gt; --/* Set MINIZ_USE_UNALIGNED_LOADS_AND_STORES to 1 on CPU&#39;s that p=
ermit efficient integer loads and stores from unaligned addresses. */<br>
&gt; -+/* Set MINIZ_USE_UNALIGNED_LOADS_AND_STORES to 1 on CPU&#39;s that p=
ermit efficient<br>
&gt; -+ * integer loads and stores from unaligned addresses. */<br>
&gt; - #define MINIZ_USE_UNALIGNED_LOADS_AND_STORES 1<br>
&gt; - #define MINIZ_UNALIGNED_USE_MEMCPY<br>
&gt; - #else<br>
&gt; -@@ -354,6 +356,44 @@ enum {<br>
&gt; -=C2=A0 =C2=A0MZ_FIXED =3D 4<br>
&gt; - };<br>
&gt; -<br>
&gt; -+/* miniz error codes. Be sure to update mz_zip_get_error_string() if=
 you add or<br>
&gt; -+ * modify this enum. */<br>
&gt; -+typedef enum {<br>
&gt; -+=C2=A0 MZ_ZIP_NO_ERROR =3D 0,<br>
&gt; -+=C2=A0 MZ_ZIP_UNDEFINED_ERROR,<br>
&gt; -+=C2=A0 MZ_ZIP_TOO_MANY_FILES,<br>
&gt; -+=C2=A0 MZ_ZIP_FILE_TOO_LARGE,<br>
&gt; -+=C2=A0 MZ_ZIP_UNSUPPORTED_METHOD,<br>
&gt; -+=C2=A0 MZ_ZIP_UNSUPPORTED_ENCRYPTION,<br>
&gt; -+=C2=A0 MZ_ZIP_UNSUPPORTED_FEATURE,<br>
&gt; -+=C2=A0 MZ_ZIP_FAILED_FINDING_CENTRAL_DIR,<br>
&gt; -+=C2=A0 MZ_ZIP_NOT_AN_ARCHIVE,<br>
&gt; -+=C2=A0 MZ_ZIP_INVALID_HEADER_OR_CORRUPTED,<br>
&gt; -+=C2=A0 MZ_ZIP_UNSUPPORTED_MULTIDISK,<br>
&gt; -+=C2=A0 MZ_ZIP_DECOMPRESSION_FAILED,<br>
&gt; -+=C2=A0 MZ_ZIP_COMPRESSION_FAILED,<br>
&gt; -+=C2=A0 MZ_ZIP_UNEXPECTED_DECOMPRESSED_SIZE,<br>
&gt; -+=C2=A0 MZ_ZIP_CRC_CHECK_FAILED,<br>
&gt; -+=C2=A0 MZ_ZIP_UNSUPPORTED_CDIR_SIZE,<br>
&gt; -+=C2=A0 MZ_ZIP_ALLOC_FAILED,<br>
&gt; -+=C2=A0 MZ_ZIP_FILE_OPEN_FAILED,<br>
&gt; -+=C2=A0 MZ_ZIP_FILE_CREATE_FAILED,<br>
&gt; -+=C2=A0 MZ_ZIP_FILE_WRITE_FAILED,<br>
&gt; -+=C2=A0 MZ_ZIP_FILE_READ_FAILED,<br>
&gt; -+=C2=A0 MZ_ZIP_FILE_CLOSE_FAILED,<br>
&gt; -+=C2=A0 MZ_ZIP_FILE_SEEK_FAILED,<br>
&gt; -+=C2=A0 MZ_ZIP_FILE_STAT_FAILED,<br>
&gt; -+=C2=A0 MZ_ZIP_INVALID_PARAMETER,<br>
&gt; -+=C2=A0 MZ_ZIP_INVALID_FILENAME,<br>
&gt; -+=C2=A0 MZ_ZIP_BUF_TOO_SMALL,<br>
&gt; -+=C2=A0 MZ_ZIP_INTERNAL_ERROR,<br>
&gt; -+=C2=A0 MZ_ZIP_FILE_NOT_FOUND,<br>
&gt; -+=C2=A0 MZ_ZIP_ARCHIVE_TOO_LARGE,<br>
&gt; -+=C2=A0 MZ_ZIP_VALIDATION_FAILED,<br>
&gt; -+=C2=A0 MZ_ZIP_WRITE_CALLBACK_FAILED,<br>
&gt; -+=C2=A0 MZ_ZIP_TOTAL_ERRORS<br>
&gt; -+} mz_zip_error;<br>
&gt; -+<br>
&gt; - // Method<br>
&gt; - #define MZ_DEFLATED 8<br>
&gt; -<br>
&gt; -@@ -696,6 +736,7 @@ typedef size_t (*mz_file_read_func)(void *pOpaque=
, mz_uint64 file_ofs,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *pBuf, =
size_t n);<br>
&gt; - typedef size_t (*mz_file_write_func)(void *pOpaque, mz_uint64 file_o=
fs,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const void =
*pBuf, size_t n);<br>
&gt; -+typedef mz_bool (*mz_file_needs_keepalive)(void *pOpaque);<br>
&gt; -<br>
&gt; - struct mz_zip_internal_state_tag;<br>
&gt; - typedef struct mz_zip_internal_state_tag mz_zip_internal_state;<br>
&gt; -@@ -707,13 +748,27 @@ typedef enum {<br>
&gt; -=C2=A0 =C2=A0MZ_ZIP_MODE_WRITING_HAS_BEEN_FINALIZED =3D 3<br>
&gt; - } mz_zip_mode;<br>
&gt; -<br>
&gt; --typedef struct mz_zip_archive_tag {<br>
&gt; -+typedef enum {<br>
&gt; -+=C2=A0 MZ_ZIP_TYPE_INVALID =3D 0,<br>
&gt; -+=C2=A0 MZ_ZIP_TYPE_USER,<br>
&gt; -+=C2=A0 MZ_ZIP_TYPE_MEMORY,<br>
&gt; -+=C2=A0 MZ_ZIP_TYPE_HEAP,<br>
&gt; -+=C2=A0 MZ_ZIP_TYPE_FILE,<br>
&gt; -+=C2=A0 MZ_ZIP_TYPE_CFILE,<br>
&gt; -+=C2=A0 MZ_ZIP_TOTAL_TYPES<br>
&gt; -+} mz_zip_type;<br>
&gt; -+<br>
&gt; -+typedef struct {<br>
&gt; -=C2=A0 =C2=A0mz_uint64 m_archive_size;<br>
&gt; -=C2=A0 =C2=A0mz_uint64 m_central_directory_file_ofs;<br>
&gt; --=C2=A0 mz_uint m_total_files;<br>
&gt; -+<br>
&gt; -+=C2=A0 /* We only support up to UINT32_MAX files in zip64 mode. */<b=
r>
&gt; -+=C2=A0 mz_uint32 m_total_files;<br>
&gt; -=C2=A0 =C2=A0mz_zip_mode m_zip_mode;<br>
&gt; -+=C2=A0 mz_zip_type m_zip_type;<br>
&gt; -+=C2=A0 mz_zip_error m_last_error;<br>
&gt; -<br>
&gt; --=C2=A0 mz_uint m_file_offset_alignment;<br>
&gt; -+=C2=A0 mz_uint64 m_file_offset_alignment;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0mz_alloc_func m_pAlloc;<br>
&gt; -=C2=A0 =C2=A0mz_free_func m_pFree;<br>
&gt; -@@ -722,6 +777,7 @@ typedef struct mz_zip_archive_tag {<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0mz_file_read_func m_pRead;<br>
&gt; -=C2=A0 =C2=A0mz_file_write_func m_pWrite;<br>
&gt; -+=C2=A0 mz_file_needs_keepalive m_pNeeds_keepalive;<br>
&gt; -=C2=A0 =C2=A0void *m_pIO_opaque;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0mz_zip_internal_state *m_pState;<br>
&gt; -@@ -1263,6 +1319,9 @@ mz_uint tdefl_create_comp_flags_from_zip_params=
(int level, int window_bits,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int strategy);<br>
&gt; - #endif // #ifndef MINIZ_NO_ZLIB_APIS<br>
&gt; -<br>
&gt; -+#define MZ_UINT16_MAX (0xFFFFU)<br>
&gt; -+#define MZ_UINT32_MAX (0xFFFFFFFFU)<br>
&gt; -+<br>
&gt; - #ifdef __cplusplus<br>
&gt; - }<br>
&gt; - #endif<br>
&gt; -@@ -1311,6 +1370,11 @@ typedef unsigned char mz_validate_uint64[sizeo=
f(mz_uint64) =3D=3D 8 ? 1 : -1];<br>
&gt; -=C2=A0 =C2=A0 ((mz_uint32)(((const mz_uint8 *)(p))[3]) &lt;&lt; 24U))=
<br>
&gt; - #endif<br>
&gt; -<br>
&gt; -+#define MZ_READ_LE64(p)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 \<br>
&gt; -+=C2=A0 (((mz_uint64)MZ_READ_LE32(p)) |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; -+=C2=A0 =C2=A0(((mz_uint64)MZ_READ_LE32((const mz_uint8 *)(p) + sizeo=
f(mz_uint32)))=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; -+=C2=A0 =C2=A0 &lt;&lt; 32U))<br>
&gt; -+<br>
&gt; - #ifdef _MSC_VER<br>
&gt; - #define MZ_FORCEINLINE __forceinline<br>
&gt; - #elif defined(__GNUC__)<br>
&gt; -@@ -4160,6 +4224,17 @@ enum {<br>
&gt; -=C2=A0 =C2=A0MZ_ZIP_LOCAL_DIR_HEADER_SIZE =3D 30,<br>
&gt; -=C2=A0 =C2=A0MZ_ZIP_CENTRAL_DIR_HEADER_SIZE =3D 46,<br>
&gt; -=C2=A0 =C2=A0MZ_ZIP_END_OF_CENTRAL_DIR_HEADER_SIZE =3D 22,<br>
&gt; -+<br>
&gt; -+=C2=A0 /* ZIP64 archive identifier and record sizes */<br>
&gt; -+=C2=A0 MZ_ZIP64_END_OF_CENTRAL_DIR_HEADER_SIG =3D 0x06064b50,<br>
&gt; -+=C2=A0 MZ_ZIP64_END_OF_CENTRAL_DIR_LOCATOR_SIG =3D 0x07064b50,<br>
&gt; -+=C2=A0 MZ_ZIP64_END_OF_CENTRAL_DIR_HEADER_SIZE =3D 56,<br>
&gt; -+=C2=A0 MZ_ZIP64_END_OF_CENTRAL_DIR_LOCATOR_SIZE =3D 20,<br>
&gt; -+=C2=A0 MZ_ZIP64_EXTENDED_INFORMATION_FIELD_HEADER_ID =3D 0x0001,<br>
&gt; -+=C2=A0 MZ_ZIP_DATA_DESCRIPTOR_ID =3D 0x08074b50,<br>
&gt; -+=C2=A0 MZ_ZIP_DATA_DESCRIPTER_SIZE64 =3D 24,<br>
&gt; -+=C2=A0 MZ_ZIP_DATA_DESCRIPTER_SIZE32 =3D 16,<br>
&gt; -+<br>
&gt; -=C2=A0 =C2=A0// Central directory header record offsets<br>
&gt; -=C2=A0 =C2=A0MZ_ZIP_CDH_SIG_OFS =3D 0,<br>
&gt; -=C2=A0 =C2=A0MZ_ZIP_CDH_VERSION_MADE_BY_OFS =3D 4,<br>
&gt; -@@ -4199,6 +4274,31 @@ enum {<br>
&gt; -=C2=A0 =C2=A0MZ_ZIP_ECDH_CDIR_SIZE_OFS =3D 12,<br>
&gt; -=C2=A0 =C2=A0MZ_ZIP_ECDH_CDIR_OFS_OFS =3D 16,<br>
&gt; -=C2=A0 =C2=A0MZ_ZIP_ECDH_COMMENT_SIZE_OFS =3D 20,<br>
&gt; -+<br>
&gt; -+=C2=A0 /* ZIP64 End of central directory locator offsets */<br>
&gt; -+=C2=A0 MZ_ZIP64_ECDL_SIG_OFS =3D 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* 4 bytes */<br>
&gt; -+=C2=A0 MZ_ZIP64_ECDL_NUM_DISK_CDIR_OFS =3D 4,=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /* 4 bytes */<br>
&gt; -+=C2=A0 MZ_ZIP64_ECDL_REL_OFS_TO_ZIP64_ECDR_OFS =3D 8,=C2=A0 /* 8 byt=
es */<br>
&gt; -+=C2=A0 MZ_ZIP64_ECDL_TOTAL_NUMBER_OF_DISKS_OFS =3D 16, /* 4 bytes */=
<br>
&gt; -+<br>
&gt; -+=C2=A0 /* ZIP64 End of central directory header offsets */<br>
&gt; -+=C2=A0 MZ_ZIP64_ECDH_SIG_OFS =3D 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* 4 bytes */<br>
&gt; -+=C2=A0 MZ_ZIP64_ECDH_SIZE_OF_RECORD_OFS =3D 4,=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 /* 8 bytes */<br>
&gt; -+=C2=A0 MZ_ZIP64_ECDH_VERSION_MADE_BY_OFS =3D 12,=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 /* 2 bytes */<br>
&gt; -+=C2=A0 MZ_ZIP64_ECDH_VERSION_NEEDED_OFS =3D 14,=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0/* 2 bytes */<br>
&gt; -+=C2=A0 MZ_ZIP64_ECDH_NUM_THIS_DISK_OFS =3D 16,=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 /* 4 bytes */<br>
&gt; -+=C2=A0 MZ_ZIP64_ECDH_NUM_DISK_CDIR_OFS =3D 20,=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 /* 4 bytes */<br>
&gt; -+=C2=A0 MZ_ZIP64_ECDH_CDIR_NUM_ENTRIES_ON_DISK_OFS =3D 24, /* 8 bytes=
 */<br>
&gt; -+=C2=A0 MZ_ZIP64_ECDH_CDIR_TOTAL_ENTRIES_OFS =3D 32,=C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* 8 bytes */<br>
&gt; -+=C2=A0 MZ_ZIP64_ECDH_CDIR_SIZE_OFS =3D 40,=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* 8 bytes */<br>
&gt; -+=C2=A0 MZ_ZIP64_ECDH_CDIR_OFS_OFS =3D 48,=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* 8 bytes */<br>
&gt; -+=C2=A0 MZ_ZIP_VERSION_MADE_BY_DOS_FILESYSTEM_ID =3D 0,<br>
&gt; -+=C2=A0 MZ_ZIP_DOS_DIR_ATTRIBUTE_BITFLAG =3D 0x10,<br>
&gt; -+=C2=A0 MZ_ZIP_GENERAL_PURPOSE_BIT_FLAG_IS_ENCRYPTED =3D 1,<br>
&gt; -+=C2=A0 MZ_ZIP_GENERAL_PURPOSE_BIT_FLAG_COMPRESSED_PATCH_FLAG =3D 32,=
<br>
&gt; -+=C2=A0 MZ_ZIP_GENERAL_PURPOSE_BIT_FLAG_USES_STRONG_ENCRYPTION =3D 64=
,<br>
&gt; -+=C2=A0 MZ_ZIP_GENERAL_PURPOSE_BIT_FLAG_LOCAL_DIR_IS_MASKED =3D 8192,=
<br>
&gt; -+=C2=A0 MZ_ZIP_GENERAL_PURPOSE_BIT_FLAG_UTF8 =3D 1 &lt;&lt; 11<br>
&gt; - };<br>
&gt; -<br>
&gt; - typedef struct {<br>
&gt; -@@ -4211,7 +4311,24 @@ struct mz_zip_internal_state_tag {<br>
&gt; -=C2=A0 =C2=A0mz_zip_array m_central_dir;<br>
&gt; -=C2=A0 =C2=A0mz_zip_array m_central_dir_offsets;<br>
&gt; -=C2=A0 =C2=A0mz_zip_array m_sorted_central_dir_offsets;<br>
&gt; -+<br>
&gt; -+=C2=A0 /* The flags passed in when the archive is initially opened. =
*/<br>
&gt; -+=C2=A0 uint32_t m_init_flags;<br>
&gt; -+<br>
&gt; -+=C2=A0 /* MZ_TRUE if the archive has a zip64 end of central director=
y headers, etc.<br>
&gt; -+=C2=A0 =C2=A0*/<br>
&gt; -+=C2=A0 mz_bool m_zip64;<br>
&gt; -+<br>
&gt; -+=C2=A0 /* MZ_TRUE if we found zip64 extended info in the central dir=
ectory (m_zip64<br>
&gt; -+=C2=A0 =C2=A0* will also be slammed to true too, even if we didn&#39=
;t find a zip64 end of<br>
&gt; -+=C2=A0 =C2=A0* central dir header, etc.) */<br>
&gt; -+=C2=A0 mz_bool m_zip64_has_extended_info_fields;<br>
&gt; -+<br>
&gt; -+=C2=A0 /* These fields are used by the file, FILE, memory, and memor=
y/heap read/write<br>
&gt; -+=C2=A0 =C2=A0* helpers. */<br>
&gt; -=C2=A0 =C2=A0MZ_FILE *m_pFile;<br>
&gt; -+=C2=A0 mz_uint64 m_file_archive_start_ofs;<br>
&gt; -+<br>
&gt; -=C2=A0 =C2=A0void *m_pMem;<br>
&gt; -=C2=A0 =C2=A0size_t m_mem_size;<br>
&gt; -=C2=A0 =C2=A0size_t m_mem_capacity;<br>
&gt; -@@ -4363,6 +4480,13 @@ static mz_bool mz_zip_set_file_times(const cha=
r *pFilename, time_t access_time,<br>
&gt; - #endif /* #ifndef MINIZ_NO_STDIO */<br>
&gt; - #endif /* #ifndef MINIZ_NO_TIME */<br>
&gt; -<br>
&gt; -+static MZ_FORCEINLINE mz_bool mz_zip_set_error(mz_zip_archive *pZip,=
<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0mz_zip_error err_num) {<br>
&gt; -+=C2=A0 if (pZip)<br>
&gt; -+=C2=A0 =C2=A0 pZip-&gt;m_last_error =3D err_num;<br>
&gt; -+=C2=A0 return MZ_FALSE;<br>
&gt; -+}<br>
&gt; -+<br>
&gt; - static mz_bool mz_zip_reader_init_internal(mz_zip_archive *pZip,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 mz_uint32 flags) {<br>
&gt; -=C2=A0 =C2=A0(void)flags;<br>
&gt; -@@ -4480,127 +4604,346 @@ mz_zip_reader_sort_central_dir_offsets_by_f=
ilename(mz_zip_archive *pZip) {<br>
&gt; -=C2=A0 =C2=A0}<br>
&gt; - }<br>
&gt; -<br>
&gt; --static mz_bool mz_zip_reader_read_central_dir(mz_zip_archive *pZip,<=
br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 mz_uint32 flags) {<br>
&gt; --=C2=A0 mz_uint cdir_size, num_this_disk, cdir_disk_index;<br>
&gt; --=C2=A0 mz_uint64 cdir_ofs;<br>
&gt; -+static mz_bool mz_zip_reader_locate_header_sig(mz_zip_archive *pZip,=
<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0mz_uint32 record_sig,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0mz_uint32 record_size,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0mz_int64 *pOfs) {<br>
&gt; -=C2=A0 =C2=A0mz_int64 cur_file_ofs;<br>
&gt; --=C2=A0 const mz_uint8 *p;<br>
&gt; -=C2=A0 =C2=A0mz_uint32 buf_u32[4096 / sizeof(mz_uint32)];<br>
&gt; -=C2=A0 =C2=A0mz_uint8 *pBuf =3D (mz_uint8 *)buf_u32;<br>
&gt; --=C2=A0 mz_bool sort_central_dir =3D<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 ((flags &amp; MZ_ZIP_FLAG_DO_NOT_SORT_CENTRAL_D=
IRECTORY) =3D=3D 0);<br>
&gt; --=C2=A0 // Basic sanity checks - reject files which are too small, an=
d check the first<br>
&gt; --=C2=A0 // 4 bytes of the file to make sure a local header is there.<=
br>
&gt; --=C2=A0 if (pZip-&gt;m_archive_size &lt; MZ_ZIP_END_OF_CENTRAL_DIR_HE=
ADER_SIZE)<br>
&gt; -+<br>
&gt; -+=C2=A0 /* Basic sanity checks - reject files which are too small */<=
br>
&gt; -+=C2=A0 if (pZip-&gt;m_archive_size &lt; record_size)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0return MZ_FALSE;<br>
&gt; --=C2=A0 // Find the end of central directory record by scanning the f=
ile from the end<br>
&gt; --=C2=A0 // towards the beginning.<br>
&gt; -+<br>
&gt; -+=C2=A0 /* Find the record by scanning the file from the end towards =
the beginning. */<br>
&gt; -=C2=A0 =C2=A0cur_file_ofs =3D<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0MZ_MAX((mz_int64)pZip-&gt;m_archive_size -=
 (mz_int64)sizeof(buf_u32), 0);<br>
&gt; -=C2=A0 =C2=A0for (;;) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0int i,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0n =3D (int)MZ_MIN(sizeof(buf_u32), =
pZip-&gt;m_archive_size - cur_file_ofs);<br>
&gt; -+<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (pZip-&gt;m_pRead(pZip-&gt;m_pIO_opaque, cur_f=
ile_ofs, pBuf, n) !=3D (mz_uint)n)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return MZ_FALSE;<br>
&gt; --=C2=A0 =C2=A0 for (i =3D n - 4; i &gt;=3D 0; --i)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 if (MZ_READ_LE32(pBuf + i) =3D=3D MZ_ZIP_END_OF=
_CENTRAL_DIR_HEADER_SIG)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 for (i =3D n - 4; i &gt;=3D 0; --i) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 mz_uint s =3D MZ_READ_LE32(pBuf + i);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 if (s =3D=3D record_sig) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((pZip-&gt;m_archive_size - (cur_file=
_ofs + i)) &gt;=3D record_size)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -+=C2=A0 =C2=A0 }<br>
&gt; -+<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (i &gt;=3D 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0cur_file_ofs +=3D i;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 /* Give up if we&#39;ve searched the entire file, or w=
e&#39;ve gone back &quot;too far&quot;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* (~64kb) */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if ((!cur_file_ofs) || ((pZip-&gt;m_archive_size =
- cur_file_ofs) &gt;=3D<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0xFFFF + MZ_ZIP_END_OF_CENTRAL_DIR_HEADER_=
SIZE)))<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (MZ_UINT16_MAX + record_size)))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return MZ_FALSE;<br>
&gt; -+<br>
&gt; -=C2=A0 =C2=A0 =C2=A0cur_file_ofs =3D MZ_MAX(cur_file_ofs - (sizeof(bu=
f_u32) - 3), 0);<br>
&gt; -=C2=A0 =C2=A0}<br>
&gt; --=C2=A0 // Read and verify the end of central directory record.<br>
&gt; -+<br>
&gt; -+=C2=A0 *pOfs =3D cur_file_ofs;<br>
&gt; -+=C2=A0 return MZ_TRUE;<br>
&gt; -+}<br>
&gt; -+<br>
&gt; -+static mz_bool mz_zip_reader_read_central_dir(mz_zip_archive *pZip,<=
br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 mz_uint flags) {<br>
&gt; -+=C2=A0 mz_uint cdir_size =3D 0, cdir_entries_on_this_disk =3D 0, num=
_this_disk =3D 0,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cdir_disk_index =3D 0;<br>
&gt; -+=C2=A0 mz_uint64 cdir_ofs =3D 0;<br>
&gt; -+=C2=A0 mz_int64 cur_file_ofs =3D 0;<br>
&gt; -+=C2=A0 const mz_uint8 *p;<br>
&gt; -+<br>
&gt; -+=C2=A0 mz_uint32 buf_u32[4096 / sizeof(mz_uint32)];<br>
&gt; -+=C2=A0 mz_uint8 *pBuf =3D (mz_uint8 *)buf_u32;<br>
&gt; -+=C2=A0 mz_bool sort_central_dir =3D<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 ((flags &amp; MZ_ZIP_FLAG_DO_NOT_SORT_CENTRAL_D=
IRECTORY) =3D=3D 0);<br>
&gt; -+=C2=A0 mz_uint32 zip64_end_of_central_dir_locator_u32<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 [(MZ_ZIP64_END_OF_CENTRAL_DIR_LOCATOR_SIZE + si=
zeof(mz_uint32) - 1) /<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(mz_uint32)];<br>
&gt; -+=C2=A0 mz_uint8 *pZip64_locator =3D (mz_uint8 *)zip64_end_of_central=
_dir_locator_u32;<br>
&gt; -+<br>
&gt; -+=C2=A0 mz_uint32 zip64_end_of_central_dir_header_u32<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 [(MZ_ZIP64_END_OF_CENTRAL_DIR_HEADER_SIZE + siz=
eof(mz_uint32) - 1) /<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(mz_uint32)];<br>
&gt; -+=C2=A0 mz_uint8 *pZip64_end_of_central_dir =3D<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 (mz_uint8 *)zip64_end_of_central_dir_header_u32=
;<br>
&gt; -+<br>
&gt; -+=C2=A0 mz_uint64 zip64_end_of_central_dir_ofs =3D 0;<br>
&gt; -+<br>
&gt; -+=C2=A0 /* Basic sanity checks - reject files which are too small, an=
d check the first<br>
&gt; -+=C2=A0 =C2=A0* 4 bytes of the file to make sure a local header is th=
ere. */<br>
&gt; -+=C2=A0 if (pZip-&gt;m_archive_size &lt; MZ_ZIP_END_OF_CENTRAL_DIR_HE=
ADER_SIZE)<br>
&gt; -+=C2=A0 =C2=A0 return mz_zip_set_error(pZip, MZ_ZIP_NOT_AN_ARCHIVE);<=
br>
&gt; -+<br>
&gt; -+=C2=A0 if (!mz_zip_reader_locate_header_sig(<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pZip, MZ_ZIP_END_OF_CENTRAL_DIR_H=
EADER_SIG,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MZ_ZIP_END_OF_CENTRAL_DIR_HEADER_=
SIZE, &amp;cur_file_ofs))<br>
&gt; -+=C2=A0 =C2=A0 return mz_zip_set_error(pZip, MZ_ZIP_FAILED_FINDING_CE=
NTRAL_DIR);<br>
&gt; -+<br>
&gt; -+=C2=A0 /* Read and verify the end of central directory record. */<br=
>
&gt; -=C2=A0 =C2=A0if (pZip-&gt;m_pRead(pZip-&gt;m_pIO_opaque, cur_file_ofs=
, pBuf,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0MZ_ZIP_END_OF_CENTRAL_DIR_HEADER_SIZE) !=3D<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0MZ_ZIP_END_OF_CENTRAL_DIR_HEADER_SIZE)<br>
&gt; --=C2=A0 =C2=A0 return MZ_FALSE;<br>
&gt; --=C2=A0 if ((MZ_READ_LE32(pBuf + MZ_ZIP_ECDH_SIG_OFS) !=3D<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0MZ_ZIP_END_OF_CENTRAL_DIR_HEADER_SIG) ||<=
br>
&gt; --=C2=A0 =C2=A0 =C2=A0 ((pZip-&gt;m_total_files =3D<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MZ_READ_LE16(pBuf + MZ_ZIP=
_ECDH_CDIR_TOTAL_ENTRIES_OFS)) !=3D<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0MZ_READ_LE16(pBuf + MZ_ZIP_ECDH_CDIR_NUM_=
ENTRIES_ON_DISK_OFS)))<br>
&gt; --=C2=A0 =C2=A0 return MZ_FALSE;<br>
&gt; -+=C2=A0 =C2=A0 return mz_zip_set_error(pZip, MZ_ZIP_FILE_READ_FAILED)=
;<br>
&gt; -+<br>
&gt; -+=C2=A0 if (MZ_READ_LE32(pBuf + MZ_ZIP_ECDH_SIG_OFS) !=3D<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 MZ_ZIP_END_OF_CENTRAL_DIR_HEADER_SIG)<br>
&gt; -+=C2=A0 =C2=A0 return mz_zip_set_error(pZip, MZ_ZIP_NOT_AN_ARCHIVE);<=
br>
&gt; -+<br>
&gt; -+=C2=A0 if (cur_file_ofs &gt;=3D (MZ_ZIP64_END_OF_CENTRAL_DIR_LOCATOR=
_SIZE +<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0MZ_ZIP64_END_OF_CENTRAL_DIR_HEADER_SIZE)) {<br>
&gt; -+=C2=A0 =C2=A0 if (pZip-&gt;m_pRead(pZip-&gt;m_pIO_opaque,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 cur_file_ofs - MZ_ZIP64_END_OF_CENTRAL_DIR_LOCATOR_SIZE,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 pZip64_locator,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 MZ_ZIP64_END_OF_CENTRAL_DIR_LOCATOR_SIZE) =3D=3D<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 MZ_ZIP64_END_OF_CENTRAL_DIR_LOCATOR_SIZE=
) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 if (MZ_READ_LE32(pZip64_locator + MZ_ZIP64_ECDL=
_SIG_OFS) =3D=3D<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MZ_ZIP64_END_OF_CENTRAL_DIR_LOCAT=
OR_SIG) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 zip64_end_of_central_dir_ofs =3D MZ_READ=
_LE64(<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pZip64_locator + MZ_ZIP64_=
ECDL_REL_OFS_TO_ZIP64_ECDR_OFS);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (zip64_end_of_central_dir_ofs &gt;<br=
>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (pZip-&gt;m_archive_size -=
 MZ_ZIP64_END_OF_CENTRAL_DIR_HEADER_SIZE))<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return mz_zip_set_error(pZip, MZ_=
ZIP_NOT_AN_ARCHIVE);<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pZip-&gt;m_pRead(pZip-&gt;m_pIO_opaq=
ue, zip64_end_of_central_dir_ofs,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 pZip64_end_of_central_dir,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 MZ_ZIP64_END_OF_CENTRAL_DIR_HEADER_SIZE) =3D=3D<br=
>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MZ_ZIP64_END_OF_CENTRAL_DI=
R_HEADER_SIZE) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (MZ_READ_LE32(pZip64_end_of_ce=
ntral_dir + MZ_ZIP64_ECDH_SIG_OFS) =3D=3D<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MZ_ZIP64_END_OF_CEN=
TRAL_DIR_HEADER_SIG) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pZip-&gt;m_pState-&gt;m_zi=
p64 =3D MZ_TRUE;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -+=C2=A0 =C2=A0 }<br>
&gt; -+=C2=A0 }<br>
&gt; -<br>
&gt; -+=C2=A0 pZip-&gt;m_total_files =3D MZ_READ_LE16(pBuf + MZ_ZIP_ECDH_CD=
IR_TOTAL_ENTRIES_OFS);<br>
&gt; -+=C2=A0 cdir_entries_on_this_disk =3D<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 MZ_READ_LE16(pBuf + MZ_ZIP_ECDH_CDIR_NUM_ENTRIE=
S_ON_DISK_OFS);<br>
&gt; -=C2=A0 =C2=A0num_this_disk =3D MZ_READ_LE16(pBuf + MZ_ZIP_ECDH_NUM_TH=
IS_DISK_OFS);<br>
&gt; -=C2=A0 =C2=A0cdir_disk_index =3D MZ_READ_LE16(pBuf + MZ_ZIP_ECDH_NUM_=
DISK_CDIR_OFS);<br>
&gt; -+=C2=A0 cdir_size =3D MZ_READ_LE32(pBuf + MZ_ZIP_ECDH_CDIR_SIZE_OFS);=
<br>
&gt; -+=C2=A0 cdir_ofs =3D MZ_READ_LE32(pBuf + MZ_ZIP_ECDH_CDIR_OFS_OFS);<b=
r>
&gt; -+<br>
&gt; -+=C2=A0 if (pZip-&gt;m_pState-&gt;m_zip64) {<br>
&gt; -+=C2=A0 =C2=A0 mz_uint32 zip64_total_num_of_disks =3D<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 MZ_READ_LE32(pZip64_locator + MZ_ZIP64_E=
CDL_TOTAL_NUMBER_OF_DISKS_OFS);<br>
&gt; -+=C2=A0 =C2=A0 mz_uint64 zip64_cdir_total_entries =3D MZ_READ_LE64(<b=
r>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pZip64_end_of_central_dir + MZ_ZIP64_ECD=
H_CDIR_TOTAL_ENTRIES_OFS);<br>
&gt; -+=C2=A0 =C2=A0 mz_uint64 zip64_cdir_total_entries_on_this_disk =3D MZ=
_READ_LE64(<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pZip64_end_of_central_dir + MZ_ZIP64_ECD=
H_CDIR_NUM_ENTRIES_ON_DISK_OFS);<br>
&gt; -+=C2=A0 =C2=A0 mz_uint64 zip64_size_of_end_of_central_dir_record =3D =
MZ_READ_LE64(<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pZip64_end_of_central_dir + MZ_ZIP64_ECD=
H_SIZE_OF_RECORD_OFS);<br>
&gt; -+=C2=A0 =C2=A0 mz_uint64 zip64_size_of_central_directory =3D<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 MZ_READ_LE64(pZip64_end_of_central_dir +=
 MZ_ZIP64_ECDH_CDIR_SIZE_OFS);<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 if (zip64_size_of_end_of_central_dir_record &lt;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (MZ_ZIP64_END_OF_CENTRAL_DIR_HEADER_SIZE=
 - 12))<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 return mz_zip_set_error(pZip, MZ_ZIP_INVALID_HE=
ADER_OR_CORRUPTED);<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 if (zip64_total_num_of_disks !=3D 1U)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 return mz_zip_set_error(pZip, MZ_ZIP_UNSUPPORTE=
D_MULTIDISK);<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 /* Check for miniz&#39;s practical limits */<br>
&gt; -+=C2=A0 =C2=A0 if (zip64_cdir_total_entries &gt; MZ_UINT32_MAX)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 return mz_zip_set_error(pZip, MZ_ZIP_TOO_MANY_F=
ILES);<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 pZip-&gt;m_total_files =3D (mz_uint32)zip64_cdir_total=
_entries;<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 if (zip64_cdir_total_entries_on_this_disk &gt; MZ_UINT=
32_MAX)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 return mz_zip_set_error(pZip, MZ_ZIP_TOO_MANY_F=
ILES);<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 cdir_entries_on_this_disk =3D<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (mz_uint32)zip64_cdir_total_entries_on_t=
his_disk;<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 /* Check for miniz&#39;s current practical limits (sor=
ry, this should be enough<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* for millions of files) */<br>
&gt; -+=C2=A0 =C2=A0 if (zip64_size_of_central_directory &gt; MZ_UINT32_MAX=
)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 return mz_zip_set_error(pZip, MZ_ZIP_UNSUPPORTE=
D_CDIR_SIZE);<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 cdir_size =3D (mz_uint32)zip64_size_of_central_directo=
ry;<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 num_this_disk =3D MZ_READ_LE32(pZip64_end_of_central_d=
ir +<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MZ_ZIP64_ECDH_NUM_THIS_=
DISK_OFS);<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 cdir_disk_index =3D MZ_READ_LE32(pZip64_end_of_central=
_dir +<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MZ_ZIP64_ECDH_NU=
M_DISK_CDIR_OFS);<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 cdir_ofs =3D<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 MZ_READ_LE64(pZip64_end_of_central_dir +=
 MZ_ZIP64_ECDH_CDIR_OFS_OFS);<br>
&gt; -+=C2=A0 }<br>
&gt; -+<br>
&gt; -+=C2=A0 if (pZip-&gt;m_total_files !=3D cdir_entries_on_this_disk)<br=
>
&gt; -+=C2=A0 =C2=A0 return mz_zip_set_error(pZip, MZ_ZIP_UNSUPPORTED_MULTI=
DISK);<br>
&gt; -+<br>
&gt; -=C2=A0 =C2=A0if (((num_this_disk | cdir_disk_index) !=3D 0) &amp;&amp=
;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0((num_this_disk !=3D 1) || (cdir_disk_inde=
x !=3D 1)))<br>
&gt; --=C2=A0 =C2=A0 return MZ_FALSE;<br>
&gt; -+=C2=A0 =C2=A0 return mz_zip_set_error(pZip, MZ_ZIP_UNSUPPORTED_MULTI=
DISK);<br>
&gt; -<br>
&gt; --=C2=A0 if ((cdir_size =3D MZ_READ_LE32(pBuf + MZ_ZIP_ECDH_CDIR_SIZE_=
OFS)) &lt;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 pZip-&gt;m_total_files * MZ_ZIP_CENTRAL_DIR_HEA=
DER_SIZE)<br>
&gt; --=C2=A0 =C2=A0 return MZ_FALSE;<br>
&gt; -+=C2=A0 if (cdir_size &lt; pZip-&gt;m_total_files * MZ_ZIP_CENTRAL_DI=
R_HEADER_SIZE)<br>
&gt; -+=C2=A0 =C2=A0 return mz_zip_set_error(pZip, MZ_ZIP_INVALID_HEADER_OR=
_CORRUPTED);<br>
&gt; -<br>
&gt; --=C2=A0 cdir_ofs =3D MZ_READ_LE32(pBuf + MZ_ZIP_ECDH_CDIR_OFS_OFS);<b=
r>
&gt; -=C2=A0 =C2=A0if ((cdir_ofs + (mz_uint64)cdir_size) &gt; pZip-&gt;m_ar=
chive_size)<br>
&gt; --=C2=A0 =C2=A0 return MZ_FALSE;<br>
&gt; -+=C2=A0 =C2=A0 return mz_zip_set_error(pZip, MZ_ZIP_INVALID_HEADER_OR=
_CORRUPTED);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0pZip-&gt;m_central_directory_file_ofs =3D cdir_ofs;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0if (pZip-&gt;m_total_files) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0mz_uint i, n;<br>
&gt; --<br>
&gt; --=C2=A0 =C2=A0 // Read the entire central directory into a heap block=
, and allocate another<br>
&gt; --=C2=A0 =C2=A0 // heap block to hold the unsorted central dir file re=
cord offsets, and<br>
&gt; --=C2=A0 =C2=A0 // another to hold the sorted indices.<br>
&gt; -+=C2=A0 =C2=A0 /* Read the entire central directory into a heap block=
, and allocate another<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* heap block to hold the unsorted central dir fi=
le record offsets, and<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* possibly another to hold the sorted indices. *=
/<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if ((!mz_zip_array_resize(pZip, &amp;pZip-&gt;m_p=
State-&gt;m_central_dir, cdir_size,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MZ_FALSE)) ||<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(!mz_zip_array_resize(pZip, &amp;pZ=
ip-&gt;m_pState-&gt;m_central_dir_offsets,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pZip-&gt;m_total_files, MZ_FALSE)=
))<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 return MZ_FALSE;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 return mz_zip_set_error(pZip, MZ_ZIP_ALLOC_FAIL=
ED);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (sort_central_dir) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!mz_zip_array_resize(pZip,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;pZip-&gt;m_pState-&gt;m_sor=
ted_central_dir_offsets,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pZip-&gt;m_total_files, MZ_FALSE=
))<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 return MZ_FALSE;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return mz_zip_set_error(pZip, MZ_ZIP_ALL=
OC_FAILED);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (pZip-&gt;m_pRead(pZip-&gt;m_pIO_opaque, cdir_=
ofs,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0pZip-&gt;m_pState-&gt;m_central_dir.m_p,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0cdir_size) !=3D cdir_size)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 return MZ_FALSE;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 return mz_zip_set_error(pZip, MZ_ZIP_FILE_READ_=
FAILED);<br>
&gt; -<br>
&gt; --=C2=A0 =C2=A0 // Now create an index into the central directory file=
 records, do some<br>
&gt; --=C2=A0 =C2=A0 // basic sanity checking on each record, and check for=
 zip64 entries (which<br>
&gt; --=C2=A0 =C2=A0 // are not yet supported).<br>
&gt; -+=C2=A0 =C2=A0 /* Now create an index into the central directory file=
 records, do some<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0* basic sanity checking on each record */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0p =3D (const mz_uint8 *)pZip-&gt;m_pState-&gt;m_c=
entral_dir.m_p;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0for (n =3D cdir_size, i =3D 0; i &lt; pZip-&gt;m_=
total_files; ++i) {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 mz_uint total_header_size, comp_size, decomp_si=
ze, disk_index;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 mz_uint total_header_size, disk_index, bit_flag=
s, filename_size,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ext_data_size;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 mz_uint64 comp_size, decomp_size, local_header_=
ofs;<br>
&gt; -+<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((n &lt; MZ_ZIP_CENTRAL_DIR_HEADER_SIZE=
) ||<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(MZ_READ_LE32(p) !=3D MZ_ZIP=
_CENTRAL_DIR_HEADER_SIG))<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 return MZ_FALSE;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return mz_zip_set_error(pZip, MZ_ZIP_INV=
ALID_HEADER_OR_CORRUPTED);<br>
&gt; -+<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0MZ_ZIP_ARRAY_ELEMENT(&amp;pZip-&gt;m_pStat=
e-&gt;m_central_dir_offsets, mz_uint32,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i) =3D<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(mz_uint32)(p - (const mz_ui=
nt8 *)pZip-&gt;m_pState-&gt;m_central_dir.m_p);<br>
&gt; -+<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (sort_central_dir)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MZ_ZIP_ARRAY_ELEMENT(&amp;pZip-&gt;=
m_pState-&gt;m_sorted_central_dir_offsets,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mz_uint32, i) =3D i;<br>
&gt; -+<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0comp_size =3D MZ_READ_LE32(p + MZ_ZIP_CDH_=
COMPRESSED_SIZE_OFS);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0decomp_size =3D MZ_READ_LE32(p + MZ_ZIP_CD=
H_DECOMPRESSED_SIZE_OFS);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 if (((!MZ_READ_LE32(p + MZ_ZIP_CDH_METHOD_OFS))=
 &amp;&amp;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(decomp_size !=3D comp_size=
)) ||<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (decomp_size &amp;&amp; !comp_siz=
e) || (decomp_size =3D=3D 0xFFFFFFFF) ||<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (comp_size =3D=3D 0xFFFFFFFF))<br=
>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 return MZ_FALSE;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 local_header_ofs =3D MZ_READ_LE32(p + MZ_ZIP_CD=
H_LOCAL_HEADER_OFS);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 filename_size =3D MZ_READ_LE16(p + MZ_ZIP_CDH_F=
ILENAME_LEN_OFS);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 ext_data_size =3D MZ_READ_LE16(p + MZ_ZIP_CDH_E=
XTRA_LEN_OFS);<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 if ((!pZip-&gt;m_pState-&gt;m_zip64_has_extende=
d_info_fields) &amp;&amp;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (ext_data_size) &amp;&amp;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (MZ_MAX(MZ_MAX(comp_size, decomp_=
size), local_header_ofs) =3D=3D<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MZ_UINT32_MAX)) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Attempt to find zip64 extended inform=
ation field in the entry&#39;s extra<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* data */<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mz_uint32 extra_size_remaining =3D ext_d=
ata_size;<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (extra_size_remaining) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const mz_uint8 *pExtra_data;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void *buf =3D NULL;<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (MZ_ZIP_CENTRAL_DIR_HEADER_SIZ=
E + filename_size + ext_data_size &gt;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 n) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf =3D MZ_MALLOC(ext_data=
_size);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (buf =3D=3D NULL)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return mz_zip_set_e=
rror(pZip, MZ_ZIP_ALLOC_FAILED);<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pZip-&gt;m_pRead(pZip-=
&gt;m_pIO_opaque,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cdir_ofs + MZ_ZIP_CENTRAL_DIR_HEADER=
_SIZE +<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 filename_size,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf, ext_data_size) !=3D ext_data_si=
ze) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MZ_FREE(buf);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return mz_zip_set_e=
rror(pZip, MZ_ZIP_FILE_READ_FAILED);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pExtra_data =3D (mz_uint8 =
*)buf;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pExtra_data =3D p + MZ_ZIP=
_CENTRAL_DIR_HEADER_SIZE + filename_size;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 do {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mz_uint32 field_id;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mz_uint32 field_data_size;=
<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (extra_size_remaining &=
lt; (sizeof(mz_uint16) * 2)) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MZ_FREE(buf);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return mz_zip_set_e=
rror(pZip, MZ_ZIP_INVALID_HEADER_OR_CORRUPTED);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 field_id =3D MZ_READ_LE16(=
pExtra_data);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 field_data_size =3D MZ_REA=
D_LE16(pExtra_data + sizeof(mz_uint16));<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((field_data_size + siz=
eof(mz_uint16) * 2) &gt;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 extra_size_r=
emaining) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MZ_FREE(buf);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return mz_zip_set_e=
rror(pZip, MZ_ZIP_INVALID_HEADER_OR_CORRUPTED);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (field_id =3D=3D MZ_ZIP=
64_EXTENDED_INFORMATION_FIELD_HEADER_ID) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Ok, the archive =
didn&#39;t have any zip64 headers but it uses a<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* zip64 exten=
ded information field so mark it as zip64 anyway<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* (this can o=
ccur with infozip&#39;s zip util when it reads<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* compresses =
files from stdin). */<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pZip-&gt;m_pState-&=
gt;m_zip64 =3D MZ_TRUE;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pZip-&gt;m_pState-&=
gt;m_zip64_has_extended_info_fields =3D MZ_TRUE;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pExtra_data +=3D sizeof(mz=
_uint16) * 2 + field_data_size;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 extra_size_remaining =3D<b=
r>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 extra_size_r=
emaining - sizeof(mz_uint16) * 2 - field_data_size;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } while (extra_size_remaining);<b=
r>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MZ_FREE(buf);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 /* I&#39;ve seen archives that aren&#39;t marke=
d as zip64 that uses zip64 ext<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0* data, argh */<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 if ((comp_size !=3D MZ_UINT32_MAX) &amp;&amp; (=
decomp_size !=3D MZ_UINT32_MAX)) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (((!MZ_READ_LE32(p + MZ_ZIP_CDH_METHO=
D_OFS)) &amp;&amp;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(decomp_size !=3D co=
mp_size)) ||<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (decomp_size &amp;&amp; !c=
omp_size))<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return mz_zip_set_error(pZip, MZ_=
ZIP_INVALID_HEADER_OR_CORRUPTED);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -+<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0disk_index =3D MZ_READ_LE16(p + MZ_ZIP_CDH=
_DISK_START_OFS);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 if ((disk_index !=3D num_this_disk) &amp;&amp; =
(disk_index !=3D 1))<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 return MZ_FALSE;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 if (((mz_uint64)MZ_READ_LE32(p + MZ_ZIP_CDH_LOC=
AL_HEADER_OFS) +<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MZ_ZIP_LOCAL_DIR_HEADER_SIZ=
E + comp_size) &gt; pZip-&gt;m_archive_size)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 return MZ_FALSE;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 if ((disk_index =3D=3D MZ_UINT16_MAX) ||<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((disk_index !=3D num_this_disk) =
&amp;&amp; (disk_index !=3D 1)))<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return mz_zip_set_error(pZip, MZ_ZIP_UNS=
UPPORTED_MULTIDISK);<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 if (comp_size !=3D MZ_UINT32_MAX) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (((mz_uint64)MZ_READ_LE32(p + MZ_ZIP_=
CDH_LOCAL_HEADER_OFS) +<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MZ_ZIP_LOCAL_DIR_HEA=
DER_SIZE + comp_size) &gt; pZip-&gt;m_archive_size)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return mz_zip_set_error(pZip, MZ_=
ZIP_INVALID_HEADER_OR_CORRUPTED);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 bit_flags =3D MZ_READ_LE16(p + MZ_ZIP_CDH_BIT_F=
LAG_OFS);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 if (bit_flags &amp; MZ_ZIP_GENERAL_PURPOSE_BIT_=
FLAG_LOCAL_DIR_IS_MASKED)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return mz_zip_set_error(pZip, MZ_ZIP_UNS=
UPPORTED_ENCRYPTION);<br>
&gt; -+<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((total_header_size =3D MZ_ZIP_CENTRAL_=
DIR_HEADER_SIZE +<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MZ_READ_LE16(p + MZ_ZIP_CDH_FILE=
NAME_LEN_OFS) +<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MZ_READ_LE16(p + MZ_ZIP_CDH_EXTR=
A_LEN_OFS) +<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MZ_READ_LE16(p + MZ_ZIP_CDH_COMM=
ENT_LEN_OFS)) &gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0n)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 return MZ_FALSE;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return mz_zip_set_error(pZip, MZ_ZIP_INV=
ALID_HEADER_OR_CORRUPTED);<br>
&gt; -+<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0n -=3D total_header_size;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0p +=3D total_header_size;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -diff --git a/contrib/zip/src/zip.c b/contrib/zip/src/zip.c<br>
&gt; -index ff3a8fe1..1abcfd8f 100644<br>
&gt; ---- a/contrib/zip/src/zip.c<br>
&gt; -+++ b/contrib/zip/src/zip.c<br>
&gt; -@@ -24,7 +24,6 @@<br>
&gt; -=C2=A0 =C2=A0((((P)[0] &gt;=3D &#39;A&#39; &amp;&amp; (P)[0] &lt;=3D =
&#39;Z&#39;) || ((P)[0] &gt;=3D &#39;a&#39; &amp;&amp; (P)[0] &lt;=3D &#39;=
z&#39;)) &amp;&amp;=C2=A0 =C2=A0\<br>
&gt; -=C2=A0 =C2=A0 (P)[1] =3D=3D &#39;:&#39;)<br>
&gt; - #define FILESYSTEM_PREFIX_LEN(P) (HAS_DEVICE(P) ? 2 : 0)<br>
&gt; --#define ISSLASH(C) ((C) =3D=3D &#39;/&#39; || (C) =3D=3D &#39;\\&#39=
;)<br>
&gt; -<br>
&gt; - #else<br>
&gt; -<br>
&gt; -@@ -48,7 +47,7 @@ int symlink(const char *target, const char *linkpat=
h); // needed on Linux<br>
&gt; - #endif<br>
&gt; -<br>
&gt; - #ifndef ISSLASH<br>
&gt; --#define ISSLASH(C) ((C) =3D=3D &#39;/&#39;)<br>
&gt; -+#define ISSLASH(C) ((C) =3D=3D &#39;/&#39; || (C) =3D=3D &#39;\\&#39=
;)<br>
&gt; - #endif<br>
&gt; -<br>
&gt; - #define CLEANUP(ptr)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0\<br>
&gt; -@@ -78,26 +77,34 @@ static const char *base_name(const char *name) {<=
br>
&gt; -=C2=A0 =C2=A0return base;<br>
&gt; - }<br>
&gt; -<br>
&gt; --static int mkpath(const char *path) {<br>
&gt; --=C2=A0 char const *p;<br>
&gt; -+static int mkpath(char *path) {<br>
&gt; -+=C2=A0 char *p;<br>
&gt; -=C2=A0 =C2=A0char npath[MAX_PATH + 1];<br>
&gt; -=C2=A0 =C2=A0int len =3D 0;<br>
&gt; -=C2=A0 =C2=A0int has_device =3D HAS_DEVICE(path);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0memset(npath, 0, MAX_PATH + 1);<br>
&gt; --<br>
&gt; --#ifdef _WIN32<br>
&gt; --=C2=A0 // only on windows fix the path<br>
&gt; --=C2=A0 npath[0] =3D path[0];<br>
&gt; --=C2=A0 npath[1] =3D path[1];<br>
&gt; --=C2=A0 len =3D 2;<br>
&gt; --#endif // _WIN32<br>
&gt; --<br>
&gt; -+=C2=A0 if (has_device) {<br>
&gt; -+=C2=A0 =C2=A0 // only on windows<br>
&gt; -+=C2=A0 =C2=A0 npath[0] =3D path[0];<br>
&gt; -+=C2=A0 =C2=A0 npath[1] =3D path[1];<br>
&gt; -+=C2=A0 =C2=A0 len =3D 2;<br>
&gt; -+=C2=A0 }<br>
&gt; -=C2=A0 =C2=A0for (p =3D path + len; *p &amp;&amp; len &lt; MAX_PATH; =
p++) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (ISSLASH(*p) &amp;&amp; ((!has_device &amp;&am=
p; len &gt; 0) || (has_device &amp;&amp; len &gt; 2))) {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 if (MKDIR(npath) =3D=3D -1)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (errno !=3D EEXIST)<br>
&gt; -+#if defined(_WIN32) || defined(__WIN32__) || defined(_MSC_VER) ||=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; -+=C2=A0 =C2=A0 defined(__MINGW32__)<br>
&gt; -+#else<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 if (&#39;\\&#39; =3D=3D *p) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *p =3D &#39;/&#39;;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -+#endif<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 if (MKDIR(npath) =3D=3D -1) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (errno !=3D EEXIST) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0npath[len++] =3D *p;<br>
&gt; -=C2=A0 =C2=A0}<br>
&gt; -@@ -279,7 +286,14 @@ int zip_entry_open(struct zip_t *zip, const char=
 *entryname) {<br>
&gt; -=C2=A0 =C2=A0zip-&gt;entry.header_offset =3D zip-&gt;archive.m_archiv=
e_size;<br>
&gt; -=C2=A0 =C2=A0memset(zip-&gt;entry.header, 0, MZ_ZIP_LOCAL_DIR_HEADER_=
SIZE * sizeof(mz_uint8));<br>
&gt; -=C2=A0 =C2=A0zip-&gt;entry.method =3D 0;<br>
&gt; -+<br>
&gt; -+=C2=A0 // UNIX or APPLE<br>
&gt; -+#if MZ_PLATFORM =3D=3D 3 || MZ_PLATFORM =3D=3D 19<br>
&gt; -+=C2=A0 // regular file with rw-r--r-- persmissions<br>
&gt; -+=C2=A0 zip-&gt;entry.external_attr =3D (mz_uint32)(0100644) &lt;&lt;=
 16;<br>
&gt; -+#else<br>
&gt; -=C2=A0 =C2=A0zip-&gt;entry.external_attr =3D 0;<br>
&gt; -+#endif<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0num_alignment_padding_bytes =3D<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0mz_zip_writer_compute_padding_needed_for_f=
ile_alignment(pzip);<br>
&gt; -@@ -660,7 +674,7 @@ ssize_t zip_entry_noallocread(struct zip_t *zip, =
void *buf, size_t bufsize) {<br>
&gt; -=C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0if (!mz_zip_reader_extract_to_mem_no_alloc(pzip, (mz_uin=
t)zip-&gt;entry.index,<br>
&gt; --=C2=A0 buf, bufsize, 0, NULL,=C2=A0 0)) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0buf, bufsize, 0, NULL, 0)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0return -1;<br>
&gt; -=C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; -@@ -670,10 +684,7 @@ ssize_t zip_entry_noallocread(struct zip_t *zip,=
 void *buf, size_t bufsize) {<br>
&gt; - int zip_entry_fread(struct zip_t *zip, const char *filename) {<br>
&gt; -=C2=A0 =C2=A0mz_zip_archive *pzip =3D NULL;<br>
&gt; -=C2=A0 =C2=A0mz_uint idx;<br>
&gt; --#if defined(_MSC_VER)<br>
&gt; --#else<br>
&gt; -=C2=A0 =C2=A0mz_uint32 xattr =3D 0;<br>
&gt; --#endif<br>
&gt; -=C2=A0 =C2=A0mz_zip_archive_file_stat info;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0if (!zip) {<br>
&gt; -@@ -875,12 +886,19 @@ int zip_extract(const char *zipname, const char=
 *dir,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; --=C2=A0 =C2=A0 if ((((info.m_version_made_by &gt;&gt; 8) =3D=3D 3) ||=
 ((info.m_version_made_by &gt;&gt; 8) =3D=3D 19)) // if zip is produced on =
Unix or macOS (3 and 19 from section 4.4.2.2 of zip standard)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; info.m_external_attr &amp; (0=
x20 &lt;&lt; 24)) { // and has sym link attribute (0x80 is file, 0x40 is di=
rectory)<br>
&gt; -+=C2=A0 =C2=A0 if ((((info.m_version_made_by &gt;&gt; 8) =3D=3D 3) ||=
<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((info.m_version_made_by &gt;&gt; =
8) =3D=3D<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 19)) // if zip is produced on Uni=
x or macOS (3 and 19 from<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// section 4.=
4.2.2 of zip standard)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; info.m_external_attr &amp;<br=
>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x20 &lt;&lt=
; 24)) { // and has sym link attribute (0x80 is file, 0x40<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// is directory)<br>
&gt; - #if defined(_WIN32) || defined(__WIN32__) || defined(_MSC_VER) ||=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0defined(__MINGW32__)<br>
&gt; --#else<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 if (info.m_uncomp_size &gt; MAX_PATH || !mz_zip=
_reader_extract_to_mem_no_alloc(&amp;zip_archive, i, symlink_to, MAX_PATH, =
0, NULL, 0)) {<br>
&gt; -+#else<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 if (info.m_uncomp_size &gt; MAX_PATH ||<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !mz_zip_reader_extract_to_mem_no_=
alloc(&amp;zip_archive, i, symlink_to,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MAX_PATH, 0, NULL, 0)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0symlink_to[info.m_uncomp_size] =3D &#39;\0=
&#39;;<br>
&gt; -diff --git a/contrib/zip/src/zip.h b/contrib/zip/src/zip.h<br>
&gt; -index 5f39df50..a48d64d6 100644<br>
&gt; ---- a/contrib/zip/src/zip.h<br>
&gt; -+++ b/contrib/zip/src/zip.h<br>
&gt; -@@ -20,241 +20,240 @@ extern &quot;C&quot; {<br>
&gt; - #endif<br>
&gt; -<br>
&gt; - #if !defined(_SSIZE_T_DEFINED) &amp;&amp; !defined(_SSIZE_T_DEFINED_=
) &amp;&amp;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; --=C2=A0 =C2=A0 !defined(_SSIZE_T) &amp;&amp; !defined(_SSIZE_T_) &amp=
;&amp; !defined(__ssize_t_defined)<br>
&gt; --#define _SSIZE_T<br>
&gt; -+=C2=A0 =C2=A0 !defined(__DEFINED_ssize_t) &amp;&amp; !defined(__ssiz=
e_t_defined) &amp;&amp;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<b=
r>
&gt; -+=C2=A0 =C2=A0 !defined(_SSIZE_T) &amp;&amp; !defined(_SSIZE_T_)<br>
&gt; -+<br>
&gt; - // 64-bit Windows is the only mainstream platform<br>
&gt; - // where sizeof(long) !=3D sizeof(void*)<br>
&gt; - #ifdef _WIN64<br>
&gt; --typedef long long=C2=A0 ssize_t;=C2=A0 /* byte count or error */<br>
&gt; -+typedef long long ssize_t; /* byte count or error */<br>
&gt; - #else<br>
&gt; --typedef long=C2=A0 ssize_t;=C2=A0 /* byte count or error */<br>
&gt; -+typedef long ssize_t; /* byte count or error */<br>
&gt; - #endif<br>
&gt; -+<br>
&gt; -+#define _SSIZE_T_DEFINED<br>
&gt; -+#define _SSIZE_T_DEFINED_<br>
&gt; -+#define __DEFINED_ssize_t<br>
&gt; -+#define __ssize_t_defined<br>
&gt; -+#define _SSIZE_T<br>
&gt; -+#define _SSIZE_T_<br>
&gt; -+<br>
&gt; - #endif<br>
&gt; -<br>
&gt; - #ifndef MAX_PATH<br>
&gt; - #define MAX_PATH 32767 /* # chars in a path name including NULL */<b=
r>
&gt; - #endif<br>
&gt; -<br>
&gt; -+/**<br>
&gt; -+ * @mainpage<br>
&gt; -+ *<br>
&gt; -+ * Documenation for @ref zip.<br>
&gt; -+ */<br>
&gt; -+<br>
&gt; -+/**<br>
&gt; -+ * @addtogroup zip<br>
&gt; -+ * @{<br>
&gt; -+ */<br>
&gt; -+<br>
&gt; -+/**<br>
&gt; -+ * Default zip compression level.<br>
&gt; -+ */<br>
&gt; -+<br>
&gt; - #define ZIP_DEFAULT_COMPRESSION_LEVEL 6<br>
&gt; -<br>
&gt; --/*<br>
&gt; --=C2=A0 This data structure is used throughout the library to represe=
nt zip archive<br>
&gt; --=C2=A0 - forward declaration.<br>
&gt; --*/<br>
&gt; -+/**<br>
&gt; -+ * @struct zip_t<br>
&gt; -+ *<br>
&gt; -+ * This data structure is used throughout the library to represent z=
ip archive -<br>
&gt; -+ * forward declaration.<br>
&gt; -+ */<br>
&gt; - struct zip_t;<br>
&gt; -<br>
&gt; --/*<br>
&gt; --=C2=A0 Opens zip archive with compression level using the given mode=
.<br>
&gt; --<br>
&gt; --=C2=A0 Args:<br>
&gt; --=C2=A0 =C2=A0 zipname: zip archive file name.<br>
&gt; --=C2=A0 =C2=A0 level: compression level (0-9 are the standard zlib-st=
yle levels).<br>
&gt; --=C2=A0 =C2=A0 mode: file access mode.<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;r&#39;: opens a file for reading/ex=
tracting (the file must exists).<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;w&#39;: creates an empty file for w=
riting.<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;a&#39;: appends to an existing arch=
ive.<br>
&gt; --<br>
&gt; --=C2=A0 Returns:<br>
&gt; --=C2=A0 =C2=A0 The zip archive handler or NULL on error<br>
&gt; --*/<br>
&gt; -+/**<br>
&gt; -+ * Opens zip archive with compression level using the given mode.<br=
>
&gt; -+ *<br>
&gt; -+ * @param zipname zip archive file name.<br>
&gt; -+ * @param level compression level (0-9 are the standard zlib-style l=
evels).<br>
&gt; -+ * @param mode file access mode.<br>
&gt; -+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 - &#39;r&#39;: opens a file for readin=
g/extracting (the file must exists).<br>
&gt; -+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 - &#39;w&#39;: creates an empty file f=
or writing.<br>
&gt; -+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 - &#39;a&#39;: appends to an existing =
archive.<br>
&gt; -+ *<br>
&gt; -+ * @return the zip archive handler or NULL on error<br>
&gt; -+ */<br>
&gt; - extern struct zip_t *zip_open(const char *zipname, int level, char m=
ode);<br>
&gt; -<br>
&gt; --/*<br>
&gt; --=C2=A0 Closes the zip archive, releases resources - always finalize.=
<br>
&gt; --<br>
&gt; --=C2=A0 Args:<br>
&gt; --=C2=A0 =C2=A0 zip: zip archive handler.<br>
&gt; --*/<br>
&gt; -+/**<br>
&gt; -+ * Closes the zip archive, releases resources - always finalize.<br>
&gt; -+ *<br>
&gt; -+ * @param zip zip archive handler.<br>
&gt; -+ */<br>
&gt; - extern void zip_close(struct zip_t *zip);<br>
&gt; -<br>
&gt; --/*<br>
&gt; --=C2=A0 Opens an entry by name in the zip archive.<br>
&gt; --=C2=A0 For zip archive opened in &#39;w&#39; or &#39;a&#39; mode the=
 function will append<br>
&gt; --=C2=A0 a new entry. In readonly mode the function tries to locate th=
e entry<br>
&gt; --=C2=A0 in global dictionary.<br>
&gt; --<br>
&gt; --=C2=A0 Args:<br>
&gt; --=C2=A0 =C2=A0 zip: zip archive handler.<br>
&gt; --=C2=A0 =C2=A0 entryname: an entry name in local dictionary.<br>
&gt; --<br>
&gt; --=C2=A0 Returns:<br>
&gt; --=C2=A0 =C2=A0 The return code - 0 on success, negative number (&lt; =
0) on error.<br>
&gt; --*/<br>
&gt; -+/**<br>
&gt; -+ * Opens an entry by name in the zip archive.<br>
&gt; -+ *<br>
&gt; -+ * For zip archive opened in &#39;w&#39; or &#39;a&#39; mode the fun=
ction will append<br>
&gt; -+ * a new entry. In readonly mode the function tries to locate the en=
try<br>
&gt; -+ * in global dictionary.<br>
&gt; -+ *<br>
&gt; -+ * @param zip zip archive handler.<br>
&gt; -+ * @param entryname an entry name in local dictionary.<br>
&gt; -+ *<br>
&gt; -+ * @return the return code - 0 on success, negative number (&lt; 0) =
on error.<br>
&gt; -+ */<br>
&gt; - extern int zip_entry_open(struct zip_t *zip, const char *entryname);=
<br>
&gt; -<br>
&gt; --/*<br>
&gt; --=C2=A0 Opens a new entry by index in the zip archive.<br>
&gt; --=C2=A0 This function is only valid if zip archive was opened in &#39=
;r&#39; (readonly) mode.<br>
&gt; --<br>
&gt; --=C2=A0 Args:<br>
&gt; --=C2=A0 =C2=A0 zip: zip archive handler.<br>
&gt; --=C2=A0 =C2=A0 index: index in local dictionary.<br>
&gt; --<br>
&gt; --=C2=A0 Returns:<br>
&gt; --=C2=A0 =C2=A0 The return code - 0 on success, negative number (&lt; =
0) on error.<br>
&gt; --*/<br>
&gt; -+/**<br>
&gt; -+ * Opens a new entry by index in the zip archive.<br>
&gt; -+ *<br>
&gt; -+ * This function is only valid if zip archive was opened in &#39;r&#=
39; (readonly) mode.<br>
&gt; -+ *<br>
&gt; -+ * @param zip zip archive handler.<br>
&gt; -+ * @param index index in local dictionary.<br>
&gt; -+ *<br>
&gt; -+ * @return the return code - 0 on success, negative number (&lt; 0) =
on error.<br>
&gt; -+ */<br>
&gt; - extern int zip_entry_openbyindex(struct zip_t *zip, int index);<br>
&gt; -<br>
&gt; --/*<br>
&gt; --=C2=A0 Closes a zip entry, flushes buffer and releases resources.<br=
>
&gt; --<br>
&gt; --=C2=A0 Args:<br>
&gt; --=C2=A0 =C2=A0 zip: zip archive handler.<br>
&gt; --<br>
&gt; --=C2=A0 Returns:<br>
&gt; --=C2=A0 =C2=A0 The return code - 0 on success, negative number (&lt; =
0) on error.<br>
&gt; --*/<br>
&gt; -+/**<br>
&gt; -+ * Closes a zip entry, flushes buffer and releases resources.<br>
&gt; -+ *<br>
&gt; -+ * @param zip zip archive handler.<br>
&gt; -+ *<br>
&gt; -+ * @return the return code - 0 on success, negative number (&lt; 0) =
on error.<br>
&gt; -+ */<br>
&gt; - extern int zip_entry_close(struct zip_t *zip);<br>
&gt; -<br>
&gt; --/*<br>
&gt; --=C2=A0 Returns a local name of the current zip entry.<br>
&gt; --=C2=A0 The main difference between user&#39;s entry name and local e=
ntry name<br>
&gt; --=C2=A0 is optional relative path.<br>
&gt; --=C2=A0 Following .ZIP File Format Specification - the path stored MU=
ST not contain<br>
&gt; --=C2=A0 a drive or device letter, or a leading slash.<br>
&gt; --=C2=A0 All slashes MUST be forward slashes &#39;/&#39; as opposed to=
 backwards slashes &#39;\&#39;<br>
&gt; --=C2=A0 for compatibility with Amiga and UNIX file systems etc.<br>
&gt; --<br>
&gt; --=C2=A0 Args:<br>
&gt; --=C2=A0 =C2=A0 zip: zip archive handler.<br>
&gt; --<br>
&gt; --=C2=A0 Returns:<br>
&gt; --=C2=A0 =C2=A0 The pointer to the current zip entry name, or NULL on =
error.<br>
&gt; --*/<br>
&gt; -+/**<br>
&gt; -+ * Returns a local name of the current zip entry.<br>
&gt; -+ *<br>
&gt; -+ * The main difference between user&#39;s entry name and local entry=
 name<br>
&gt; -+ * is optional relative path.<br>
&gt; -+ * Following .ZIP File Format Specification - the path stored MUST n=
ot contain<br>
&gt; -+ * a drive or device letter, or a leading slash.<br>
&gt; -+ * All slashes MUST be forward slashes &#39;/&#39; as opposed to bac=
kwards slashes &#39;\&#39;<br>
&gt; -+ * for compatibility with Amiga and UNIX file systems etc.<br>
&gt; -+ *<br>
&gt; -+ * @param zip: zip archive handler.<br>
&gt; -+ *<br>
&gt; -+ * @return the pointer to the current zip entry name, or NULL on err=
or.<br>
&gt; -+ */<br>
&gt; - extern const char *zip_entry_name(struct zip_t *zip);<br>
&gt; -<br>
&gt; --/*<br>
&gt; --=C2=A0 Returns an index of the current zip entry.<br>
&gt; --<br>
&gt; --=C2=A0 Args:<br>
&gt; --=C2=A0 =C2=A0 zip: zip archive handler.<br>
&gt; --<br>
&gt; --=C2=A0 Returns:<br>
&gt; --=C2=A0 =C2=A0 The index on success, negative number (&lt; 0) on erro=
r.<br>
&gt; --*/<br>
&gt; -+/**<br>
&gt; -+ * Returns an index of the current zip entry.<br>
&gt; -+ *<br>
&gt; -+ * @param zip zip archive handler.<br>
&gt; -+ *<br>
&gt; -+ * @return the index on success, negative number (&lt; 0) on error.<=
br>
&gt; -+ */<br>
&gt; - extern int zip_entry_index(struct zip_t *zip);<br>
&gt; -<br>
&gt; --/*<br>
&gt; --=C2=A0 Determines if the current zip entry is a directory entry.<br>
&gt; --<br>
&gt; --=C2=A0 Args:<br>
&gt; --=C2=A0 =C2=A0 zip: zip archive handler.<br>
&gt; --<br>
&gt; --=C2=A0 Returns:<br>
&gt; --=C2=A0 =C2=A0 The return code - 1 (true), 0 (false), negative number=
 (&lt; 0) on error.<br>
&gt; --*/<br>
&gt; -+/**<br>
&gt; -+ * Determines if the current zip entry is a directory entry.<br>
&gt; -+ *<br>
&gt; -+ * @param zip zip archive handler.<br>
&gt; -+ *<br>
&gt; -+ * @return the return code - 1 (true), 0 (false), negative number (&=
lt; 0) on<br>
&gt; -+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error.<br>
&gt; -+ */<br>
&gt; - extern int zip_entry_isdir(struct zip_t *zip);<br>
&gt; -<br>
&gt; --/*<br>
&gt; --=C2=A0 Returns an uncompressed size of the current zip entry.<br>
&gt; --<br>
&gt; --=C2=A0 Args:<br>
&gt; --=C2=A0 =C2=A0 zip: zip archive handler.<br>
&gt; --<br>
&gt; --=C2=A0 Returns:<br>
&gt; --=C2=A0 =C2=A0 The uncompressed size in bytes.<br>
&gt; --*/<br>
&gt; -+/**<br>
&gt; -+ * Returns an uncompressed size of the current zip entry.<br>
&gt; -+ *<br>
&gt; -+ * @param zip zip archive handler.<br>
&gt; -+ *<br>
&gt; -+ * @return the uncompressed size in bytes.<br>
&gt; -+ */<br>
&gt; - extern unsigned long long zip_entry_size(struct zip_t *zip);<br>
&gt; -<br>
&gt; --/*<br>
&gt; --=C2=A0 Returns CRC-32 checksum of the current zip entry.<br>
&gt; --<br>
&gt; --=C2=A0 Args:<br>
&gt; --=C2=A0 =C2=A0 zip: zip archive handler.<br>
&gt; --<br>
&gt; --=C2=A0 Returns:<br>
&gt; --=C2=A0 =C2=A0 The CRC-32 checksum.<br>
&gt; --*/<br>
&gt; -+/**<br>
&gt; -+ * Returns CRC-32 checksum of the current zip entry.<br>
&gt; -+ *<br>
&gt; -+ * @param zip zip archive handler.<br>
&gt; -+ *<br>
&gt; -+ * @return the CRC-32 checksum.<br>
&gt; -+ */<br>
&gt; - extern unsigned int zip_entry_crc32(struct zip_t *zip);<br>
&gt; -<br>
&gt; --/*<br>
&gt; --=C2=A0 Compresses an input buffer for the current zip entry.<br>
&gt; --<br>
&gt; --=C2=A0 Args:<br>
&gt; --=C2=A0 =C2=A0 zip: zip archive handler.<br>
&gt; --=C2=A0 =C2=A0 buf: input buffer.<br>
&gt; --=C2=A0 =C2=A0 bufsize: input buffer size (in bytes).<br>
&gt; --<br>
&gt; --=C2=A0 Returns:<br>
&gt; --=C2=A0 =C2=A0 The return code - 0 on success, negative number (&lt; =
0) on error.<br>
&gt; --*/<br>
&gt; -+/**<br>
&gt; -+ * Compresses an input buffer for the current zip entry.<br>
&gt; -+ *<br>
&gt; -+ * @param zip zip archive handler.<br>
&gt; -+ * @param buf input buffer.<br>
&gt; -+ * @param bufsize input buffer size (in bytes).<br>
&gt; -+ *<br>
&gt; -+ * @return the return code - 0 on success, negative number (&lt; 0) =
on error.<br>
&gt; -+ */<br>
&gt; - extern int zip_entry_write(struct zip_t *zip, const void *buf, size_=
t bufsize);<br>
&gt; -<br>
&gt; --/*<br>
&gt; --=C2=A0 Compresses a file for the current zip entry.<br>
&gt; --<br>
&gt; --=C2=A0 Args:<br>
&gt; --=C2=A0 =C2=A0 zip: zip archive handler.<br>
&gt; --=C2=A0 =C2=A0 filename: input file.<br>
&gt; --<br>
&gt; --=C2=A0 Returns:<br>
&gt; --=C2=A0 =C2=A0 The return code - 0 on success, negative number (&lt; =
0) on error.<br>
&gt; --*/<br>
&gt; -+/**<br>
&gt; -+ * Compresses a file for the current zip entry.<br>
&gt; -+ *<br>
&gt; -+ * @param zip zip archive handler.<br>
&gt; -+ * @param filename input file.<br>
&gt; -+ *<br>
&gt; -+ * @return the return code - 0 on success, negative number (&lt; 0) =
on error.<br>
&gt; -+ */<br>
&gt; - extern int zip_entry_fwrite(struct zip_t *zip, const char *filename)=
;<br>
&gt; -<br>
&gt; --/*<br>
&gt; --=C2=A0 Extracts the current zip entry into output buffer.<br>
&gt; --=C2=A0 The function allocates sufficient memory for a output buffer.=
<br>
&gt; --<br>
&gt; --=C2=A0 Args:<br>
&gt; --=C2=A0 =C2=A0 zip: zip archive handler.<br>
&gt; --=C2=A0 =C2=A0 buf: output buffer.<br>
&gt; --=C2=A0 =C2=A0 bufsize: output buffer size (in bytes).<br>
&gt; --<br>
&gt; --=C2=A0 Note:<br>
&gt; --=C2=A0 =C2=A0 - remember to release memory allocated for a output bu=
ffer.<br>
&gt; --=C2=A0 =C2=A0 - for large entries, please take a look at zip_entry_e=
xtract function.<br>
&gt; --<br>
&gt; --=C2=A0 Returns:<br>
&gt; --=C2=A0 =C2=A0 The return code - the number of bytes actually read on=
 success.<br>
&gt; --=C2=A0 =C2=A0 Otherwise a -1 on error.<br>
&gt; --*/<br>
&gt; -+/**<br>
&gt; -+ * Extracts the current zip entry into output buffer.<br>
&gt; -+ *<br>
&gt; -+ * The function allocates sufficient memory for a output buffer.<br>
&gt; -+ *<br>
&gt; -+ * @param zip zip archive handler.<br>
&gt; -+ * @param buf output buffer.<br>
&gt; -+ * @param bufsize output buffer size (in bytes).<br>
&gt; -+ *<br>
&gt; -+ * @note remember to release memory allocated for a output buffer.<b=
r>
&gt; -+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0for large entries, please take a look a=
t zip_entry_extract function.<br>
&gt; -+ *<br>
&gt; -+ * @return the return code - the number of bytes actually read on su=
ccess.<br>
&gt; -+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Otherwise a -1 on error.<br>
&gt; -+ */<br>
&gt; - extern ssize_t zip_entry_read(struct zip_t *zip, void **buf, size_t =
*bufsize);<br>
&gt; -<br>
&gt; --/*<br>
&gt; --=C2=A0 Extracts the current zip entry into a memory buffer using no =
memory<br>
&gt; --=C2=A0 allocation.<br>
&gt; --<br>
&gt; --=C2=A0 Args:<br>
&gt; --=C2=A0 =C2=A0 zip: zip archive handler.<br>
&gt; --=C2=A0 =C2=A0 buf: preallocated output buffer.<br>
&gt; --=C2=A0 =C2=A0 bufsize: output buffer size (in bytes).<br>
&gt; --<br>
&gt; --=C2=A0 Note:<br>
&gt; --=C2=A0 =C2=A0 - ensure supplied output buffer is large enough.<br>
&gt; --=C2=A0 =C2=A0 - zip_entry_size function (returns uncompressed size f=
or the current entry)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 can be handy to estimate how big buffer is need=
ed.<br>
&gt; --=C2=A0 =C2=A0 - for large entries, please take a look at zip_entry_e=
xtract function.<br>
&gt; --<br>
&gt; --=C2=A0 Returns:<br>
&gt; --=C2=A0 =C2=A0 The return code - the number of bytes actually read on=
 success.<br>
&gt; --=C2=A0 =C2=A0 Otherwise a -1 on error (e.g. bufsize is not large eno=
ugh).<br>
&gt; --*/<br>
&gt; --extern ssize_t zip_entry_noallocread(struct zip_t *zip, void *buf, s=
ize_t bufsize);<br>
&gt; --<br>
&gt; --/*<br>
&gt; --=C2=A0 Extracts the current zip entry into output file.<br>
&gt; --<br>
&gt; --=C2=A0 Args:<br>
&gt; --=C2=A0 =C2=A0 zip: zip archive handler.<br>
&gt; --=C2=A0 =C2=A0 filename: output file.<br>
&gt; --<br>
&gt; --=C2=A0 Returns:<br>
&gt; --=C2=A0 =C2=A0 The return code - 0 on success, negative number (&lt; =
0) on error.<br>
&gt; --*/<br>
&gt; -+/**<br>
&gt; -+ * Extracts the current zip entry into a memory buffer using no memo=
ry<br>
&gt; -+ * allocation.<br>
&gt; -+ *<br>
&gt; -+ * @param zip zip archive handler.<br>
&gt; -+ * @param buf preallocated output buffer.<br>
&gt; -+ * @param bufsize output buffer size (in bytes).<br>
&gt; -+ *<br>
&gt; -+ * @note ensure supplied output buffer is large enough.<br>
&gt; -+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0zip_entry_size function (returns uncomp=
ressed size for the current<br>
&gt; -+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0entry) can be handy to estimate how big=
 buffer is needed. for large<br>
&gt; -+ * entries, please take a look at zip_entry_extract function.<br>
&gt; -+ *<br>
&gt; -+ * @return the return code - the number of bytes actually read on su=
ccess.<br>
&gt; -+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Otherwise a -1 on error (e.g. bu=
fsize is not large enough).<br>
&gt; -+ */<br>
&gt; -+extern ssize_t zip_entry_noallocread(struct zip_t *zip, void *buf,<b=
r>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t bu=
fsize);<br>
&gt; -+<br>
&gt; -+/**<br>
&gt; -+ * Extracts the current zip entry into output file.<br>
&gt; -+ *<br>
&gt; -+ * @param zip zip archive handler.<br>
&gt; -+ * @param filename output file.<br>
&gt; -+ *<br>
&gt; -+ * @return the return code - 0 on success, negative number (&lt; 0) =
on error.<br>
&gt; -+ */<br>
&gt; - extern int zip_entry_fread(struct zip_t *zip, const char *filename);=
<br>
&gt; -<br>
&gt; --/*<br>
&gt; --=C2=A0 Extracts the current zip entry using a callback function (on_=
extract).<br>
&gt; --<br>
&gt; --=C2=A0 Args:<br>
&gt; --=C2=A0 =C2=A0 zip: zip archive handler.<br>
&gt; --=C2=A0 =C2=A0 on_extract: callback function.<br>
&gt; --=C2=A0 =C2=A0 arg: opaque pointer (optional argument,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0which you can pass to the on_extract callback)<br>
&gt; --<br>
&gt; --=C2=A0 =C2=A0Returns:<br>
&gt; --=C2=A0 =C2=A0 The return code - 0 on success, negative number (&lt; =
0) on error.<br>
&gt; -+/**<br>
&gt; -+ * Extracts the current zip entry using a callback function (on_extr=
act).<br>
&gt; -+ *<br>
&gt; -+ * @param zip zip archive handler.<br>
&gt; -+ * @param on_extract callback function.<br>
&gt; -+ * @param arg opaque pointer (optional argument, which you can pass =
to the<br>
&gt; -+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 on_extract callback)<br>
&gt; -+ *<br>
&gt; -+ * @return the return code - 0 on success, negative number (&lt; 0) =
on error.<br>
&gt; -=C2=A0 */<br>
&gt; - extern int<br>
&gt; - zip_entry_extract(struct zip_t *zip,<br>
&gt; -@@ -262,53 +261,49 @@ zip_entry_extract(struct zip_t *zip,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cons=
t void *data, size_t size),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
void *arg);<br>
&gt; -<br>
&gt; --/*<br>
&gt; --=C2=A0 Returns the number of all entries (files and directories) in =
the zip archive.<br>
&gt; --<br>
&gt; --=C2=A0 Args:<br>
&gt; --=C2=A0 =C2=A0 zip: zip archive handler.<br>
&gt; --<br>
&gt; --=C2=A0 Returns:<br>
&gt; --=C2=A0 =C2=A0 The return code - the number of entries on success,<br=
>
&gt; --=C2=A0 =C2=A0 negative number (&lt; 0) on error.<br>
&gt; --*/<br>
&gt; -+/**<br>
&gt; -+ * Returns the number of all entries (files and directories) in the =
zip archive.<br>
&gt; -+ *<br>
&gt; -+ * @param zip zip archive handler.<br>
&gt; -+ *<br>
&gt; -+ * @return the return code - the number of entries on success, negat=
ive number<br>
&gt; -+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(&lt; 0) on error.<br>
&gt; -+ */<br>
&gt; - extern int zip_total_entries(struct zip_t *zip);<br>
&gt; -<br>
&gt; --/*<br>
&gt; --=C2=A0 Creates a new archive and puts files into a single zip archiv=
e.<br>
&gt; --<br>
&gt; --=C2=A0 Args:<br>
&gt; --=C2=A0 =C2=A0 zipname: zip archive file.<br>
&gt; --=C2=A0 =C2=A0 filenames: input files.<br>
&gt; --=C2=A0 =C2=A0 len: number of input files.<br>
&gt; --<br>
&gt; --=C2=A0 Returns:<br>
&gt; --=C2=A0 =C2=A0 The return code - 0 on success, negative number (&lt; =
0) on error.<br>
&gt; --*/<br>
&gt; -+/**<br>
&gt; -+ * Creates a new archive and puts files into a single zip archive.<b=
r>
&gt; -+ *<br>
&gt; -+ * @param zipname zip archive file.<br>
&gt; -+ * @param filenames input files.<br>
&gt; -+ * @param len: number of input files.<br>
&gt; -+ *<br>
&gt; -+ * @return the return code - 0 on success, negative number (&lt; 0) =
on error.<br>
&gt; -+ */<br>
&gt; - extern int zip_create(const char *zipname, const char *filenames[], =
size_t len);<br>
&gt; -<br>
&gt; --/*<br>
&gt; --=C2=A0 Extracts a zip archive file into directory.<br>
&gt; --<br>
&gt; --=C2=A0 If on_extract_entry is not NULL, the callback will be called =
after<br>
&gt; --=C2=A0 successfully extracted each zip entry.<br>
&gt; --=C2=A0 Returning a negative value from the callback will cause abort=
 and return an<br>
&gt; --=C2=A0 error. The last argument (void *arg) is optional, which you c=
an use to pass<br>
&gt; --=C2=A0 data to the on_extract_entry callback.<br>
&gt; --<br>
&gt; --=C2=A0 Args:<br>
&gt; --=C2=A0 =C2=A0 zipname: zip archive file.<br>
&gt; --=C2=A0 =C2=A0 dir: output directory.<br>
&gt; --=C2=A0 =C2=A0 on_extract_entry: on extract callback.<br>
&gt; --=C2=A0 =C2=A0 arg: opaque pointer.<br>
&gt; --<br>
&gt; --=C2=A0 Returns:<br>
&gt; --=C2=A0 =C2=A0 The return code - 0 on success, negative number (&lt; =
0) on error.<br>
&gt; --*/<br>
&gt; -+/**<br>
&gt; -+ * Extracts a zip archive file into directory.<br>
&gt; -+ *<br>
&gt; -+ * If on_extract_entry is not NULL, the callback will be called afte=
r<br>
&gt; -+ * successfully extracted each zip entry.<br>
&gt; -+ * Returning a negative value from the callback will cause abort and=
 return an<br>
&gt; -+ * error. The last argument (void *arg) is optional, which you can u=
se to pass<br>
&gt; -+ * data to the on_extract_entry callback.<br>
&gt; -+ *<br>
&gt; -+ * @param zipname zip archive file.<br>
&gt; -+ * @param dir output directory.<br>
&gt; -+ * @param on_extract_entry on extract callback.<br>
&gt; -+ * @param arg opaque pointer.<br>
&gt; -+ *<br>
&gt; -+ * @return the return code - 0 on success, negative number (&lt; 0) =
on error.<br>
&gt; -+ */<br>
&gt; - extern int zip_extract(const char *zipname, const char *dir,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 int (*on_extract_entry)(const char *filename, void *arg),<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 void *arg);<br>
&gt; -<br>
&gt; -+/** @} */<br>
&gt; -+<br>
&gt; - #ifdef __cplusplus<br>
&gt; - }<br>
&gt; - #endif<br>
&gt; -diff --git a/contrib/zip/test/CMakeLists.txt b/contrib/zip/test/CMake=
Lists.txt<br>
&gt; -index 9b2a8db1..cc060b00 100644<br>
&gt; ---- a/contrib/zip/test/CMakeLists.txt<br>
&gt; -+++ b/contrib/zip/test/CMakeLists.txt<br>
&gt; -@@ -1,19 +1,16 @@<br>
&gt; - cmake_minimum_required(VERSION 2.8)<br>
&gt; -<br>
&gt; --if (&quot;${CMAKE_C_COMPILER_ID}&quot; STREQUAL &quot;GNU&quot; OR &=
quot;${CMAKE_C_COMPILER_ID}&quot; STREQUAL &quot;Clang&quot; OR &quot;${CMA=
KE_C_COMPILER_ID}&quot; STREQUAL &quot;AppleClang&quot;)<br>
&gt; --=C2=A0 if(ENABLE_COVERAGE)<br>
&gt; --=C2=A0 =C2=A0 set(CMAKE_C_FLAGS &quot;${CMAKE_C_FLAGS} -g &quot;)<br=
>
&gt; --=C2=A0 =C2=A0 set(CMAKE_C_FLAGS &quot;${CMAKE_C_FLAGS} -O0&quot;)<br=
>
&gt; --=C2=A0 =C2=A0 set(CMAKE_C_FLAGS &quot;${CMAKE_C_FLAGS} -fprofile-arc=
s&quot;)<br>
&gt; --=C2=A0 =C2=A0 set(CMAKE_C_FLAGS &quot;${CMAKE_C_FLAGS} -ftest-covera=
ge&quot;)<br>
&gt; --=C2=A0 =C2=A0 set(CMAKE_EXE_LINKER_FLAGS &quot;${CMAKE_EXE_LINKER_FL=
AGS} --coverage&quot;)<br>
&gt; --=C2=A0 endif()<br>
&gt; --endif ()<br>
&gt; --<br>
&gt; - # test<br>
&gt; --include_directories(../src)<br>
&gt; --add_executable(test.exe test.c ../src/zip.c)<br>
&gt; --add_executable(test_miniz.exe test_miniz.c)<br>
&gt; -+set(test_out test.out)<br>
&gt; -+set(test_miniz_out test_miniz.out)<br>
&gt; -+<br>
&gt; -+add_executable(${test_out} test.c)<br>
&gt; -+target_link_libraries(${test_out} zip)<br>
&gt; -+add_executable(${test_miniz_out} test_miniz.c)<br>
&gt; -+target_link_libraries(${test_miniz_out} zip)<br>
&gt; -+<br>
&gt; -+add_test(NAME ${test_out} COMMAND ${test_out})<br>
&gt; -+add_test(NAME ${test_miniz_out} COMMAND ${test_miniz_out})<br>
&gt; -<br>
&gt; --add_test(NAME test COMMAND test.exe)<br>
&gt; --add_test(NAME test_miniz COMMAND test_miniz.exe)<br>
&gt; -+set(test_out ${test_out} PARENT_SCOPE)<br>
&gt; -+set(test_miniz_out ${test_miniz_out} PARENT_SCOPE)<br>
&gt; -diff --git a/contrib/zip/test/test.c b/contrib/zip/test/test.c<br>
&gt; -index 45443053..a9b2ddab 100644<br>
&gt; ---- a/contrib/zip/test/test.c<br>
&gt; -+++ b/contrib/zip/test/test.c<br>
&gt; -@@ -29,6 +29,8 @@<br>
&gt; - #define XFILE &quot;7.txt\0&quot;<br>
&gt; - #define XMODE 0100777<br>
&gt; -<br>
&gt; -+#define UNIXMODE 0100644<br>
&gt; -+<br>
&gt; - #define UNUSED(x) (void)x<br>
&gt; -<br>
&gt; - static int total_entries =3D 0;<br>
&gt; -@@ -102,7 +104,8 @@ static void test_read(void) {<br>
&gt; -=C2=A0 =C2=A0assert(0 =3D=3D zip_entry_close(zip));<br>
&gt; -=C2=A0 =C2=A0free(buf);<br>
&gt; -=C2=A0 =C2=A0buf =3D NULL;<br>
&gt; --<br>
&gt; -+=C2=A0 bufsize =3D 0;<br>
&gt; -+<br>
&gt; -=C2=A0 =C2=A0assert(0 =3D=3D zip_entry_open(zip, &quot;test/test-2.tx=
t&quot;));<br>
&gt; -=C2=A0 =C2=A0assert(strlen(TESTDATA2) =3D=3D zip_entry_size(zip));<br=
>
&gt; -=C2=A0 =C2=A0assert(CRC32DATA2 =3D=3D zip_entry_crc32(zip));<br>
&gt; -@@ -131,7 +134,8 @@ static void test_read(void) {<br>
&gt; -=C2=A0 =C2=A0assert(0 =3D=3D zip_entry_close(zip));<br>
&gt; -=C2=A0 =C2=A0free(buf);<br>
&gt; -=C2=A0 =C2=A0buf =3D NULL;<br>
&gt; --<br>
&gt; -+=C2=A0 bufsize =3D 0;<br>
&gt; -+<br>
&gt; -=C2=A0 =C2=A0buftmp =3D strlen(TESTDATA1);<br>
&gt; -=C2=A0 =C2=A0buf =3D calloc(buftmp, sizeof(char));<br>
&gt; -=C2=A0 =C2=A0assert(0 =3D=3D zip_entry_open(zip, &quot;test/test-1.tx=
t&quot;));<br>
&gt; -@@ -433,6 +437,35 @@ static void test_mtime(void) {<br>
&gt; -=C2=A0 =C2=A0remove(ZIPNAME);<br>
&gt; - }<br>
&gt; -<br>
&gt; -+static void test_unix_permissions(void) {<br>
&gt; -+#if defined(_WIN64) || defined(_WIN32) || defined(__WIN32__)<br>
&gt; -+#else<br>
&gt; -+=C2=A0 // UNIX or APPLE<br>
&gt; -+=C2=A0 struct MZ_FILE_STAT_STRUCT file_stats;<br>
&gt; -+<br>
&gt; -+=C2=A0 remove(ZIPNAME);<br>
&gt; -+<br>
&gt; -+=C2=A0 struct zip_t *zip =3D zip_open(ZIPNAME, ZIP_DEFAULT_COMPRESSI=
ON_LEVEL, &#39;w&#39;);<br>
&gt; -+=C2=A0 assert(zip !=3D NULL);<br>
&gt; -+<br>
&gt; -+=C2=A0 assert(0 =3D=3D zip_entry_open(zip, RFILE));<br>
&gt; -+=C2=A0 assert(0 =3D=3D zip_entry_write(zip, TESTDATA1, strlen(TESTDA=
TA1)));<br>
&gt; -+=C2=A0 assert(0 =3D=3D zip_entry_close(zip));<br>
&gt; -+<br>
&gt; -+=C2=A0 zip_close(zip);<br>
&gt; -+<br>
&gt; -+=C2=A0 remove(RFILE);<br>
&gt; -+<br>
&gt; -+=C2=A0 assert(0 =3D=3D zip_extract(ZIPNAME, &quot;.&quot;, NULL, NUL=
L));<br>
&gt; -+<br>
&gt; -+=C2=A0 assert(0 =3D=3D MZ_FILE_STAT(RFILE, &amp;file_stats));<br>
&gt; -+=C2=A0 assert(UNIXMODE =3D=3D file_stats.st_mode);<br>
&gt; -+<br>
&gt; -+=C2=A0 remove(RFILE);<br>
&gt; -+=C2=A0 remove(ZIPNAME);<br>
&gt; -+#endif<br>
&gt; -+}<br>
&gt; -+<br>
&gt; - int main(int argc, char *argv[]) {<br>
&gt; -=C2=A0 =C2=A0UNUSED(argc);<br>
&gt; -=C2=A0 =C2=A0UNUSED(argv);<br>
&gt; -@@ -453,6 +486,7 @@ int main(int argc, char *argv[]) {<br>
&gt; -=C2=A0 =C2=A0test_write_permissions();<br>
&gt; -=C2=A0 =C2=A0test_exe_permissions();<br>
&gt; -=C2=A0 =C2=A0test_mtime();<br>
&gt; -+=C2=A0 test_unix_permissions();<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0remove(ZIPNAME);<br>
&gt; -=C2=A0 =C2=A0return 0;<br>
&gt; -diff --git a/contrib/zip/test/test_miniz.c b/contrib/zip/test/test_mi=
niz.c<br>
&gt; -index ebc0564d..babcaecd 100644<br>
&gt; ---- a/contrib/zip/test/test_miniz.c<br>
&gt; -+++ b/contrib/zip/test/test_miniz.c<br>
&gt; -@@ -23,16 +23,39 @@ int main(int argc, char *argv[]) {<br>
&gt; -=C2=A0 =C2=A0uint step =3D 0;<br>
&gt; -=C2=A0 =C2=A0int cmp_status;<br>
&gt; -=C2=A0 =C2=A0uLong src_len =3D (uLong)strlen(s_pStr);<br>
&gt; --=C2=A0 uLong cmp_len =3D compressBound(src_len);<br>
&gt; -=C2=A0 =C2=A0uLong uncomp_len =3D src_len;<br>
&gt; -+=C2=A0 uLong cmp_len;<br>
&gt; -=C2=A0 =C2=A0uint8 *pCmp, *pUncomp;<br>
&gt; -+=C2=A0 size_t sz;<br>
&gt; -=C2=A0 =C2=A0uint total_succeeded =3D 0;<br>
&gt; -=C2=A0 =C2=A0(void)argc, (void)argv;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0printf(&quot;miniz.c version: %s\n&quot;, MZ_VERSION);<b=
r>
&gt; -<br>
&gt; -=C2=A0 =C2=A0do {<br>
&gt; -+=C2=A0 =C2=A0 pCmp =3D (uint8 *)tdefl_compress_mem_to_heap(s_pStr, s=
rc_len, &amp;cmp_len, 0);<br>
&gt; -+=C2=A0 =C2=A0 if (!pCmp) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 printf(&quot;tdefl_compress_mem_to_heap failed\=
n&quot;);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 return EXIT_FAILURE;<br>
&gt; -+=C2=A0 =C2=A0 }<br>
&gt; -+=C2=A0 =C2=A0 if (src_len &lt;=3D cmp_len) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 printf(&quot;tdefl_compress_mem_to_heap failed:=
 from %u to %u bytes\n&quot;,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(mz_uint32)uncomp_le=
n, (mz_uint32)cmp_len);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 free(pCmp);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 return EXIT_FAILURE;<br>
&gt; -+=C2=A0 =C2=A0 }<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 sz =3D tdefl_compress_mem_to_mem(pCmp, cmp_len, s_pStr=
, src_len, 0);<br>
&gt; -+=C2=A0 =C2=A0 if (sz !=3D cmp_len) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 printf(&quot;tdefl_compress_mem_to_mem failed: =
expected %u, got %u\n&quot;,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(mz_uint32)cmp_len, =
(mz_uint32)sz);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 free(pCmp);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 return EXIT_FAILURE;<br>
&gt; -+=C2=A0 =C2=A0 }<br>
&gt; -+<br>
&gt; -=C2=A0 =C2=A0 =C2=A0// Allocate buffers to hold compressed and uncomp=
ressed data.<br>
&gt; -+=C2=A0 =C2=A0 free(pCmp);<br>
&gt; -+=C2=A0 =C2=A0 cmp_len =3D compressBound(src_len);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0pCmp =3D (mz_uint8 *)malloc((size_t)cmp_len);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0pUncomp =3D (mz_uint8 *)malloc((size_t)src_len);<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0if ((!pCmp) || (!pUncomp)) {<br>
&gt; diff --git a/meta/recipes-graphics/vulkan/assimp/use-GNUInstallDirs-wh=
ere-possible.patch b/meta/recipes-graphics/vulkan/assimp/use-GNUInstallDirs=
-where-possible.patch<br>
&gt; deleted file mode 100644<br>
&gt; index e4f5b9ccbd..0000000000<br>
&gt; --- a/meta/recipes-graphics/vulkan/assimp/use-GNUInstallDirs-where-pos=
sible.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,257 +0,0 @@<br>
&gt; -From cbf94fd62ff831879d10f99aa7766d391ae8a9b7 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: =3D?UTF-8?q?Victor=3D20Matar=3DC3=3DA9?=3D &lt;<a href=3D"mailt=
o:matare@fh-aachen.de" target=3D"_blank">matare@fh-aachen.de</a>&gt;<br>
&gt; -Date: Tue, 31 Mar 2020 21:30:07 +0200<br>
&gt; -Subject: [PATCH] use GNUInstallDirs where possible<br>
&gt; -<br>
&gt; -Emulate the CMAKE_INSTALL_FULL_* variables on non-Unix systems and<br=
>
&gt; -disable redefining FHS-mandated install locations via user-editable<b=
r>
&gt; -ASSIMP_*_INSTALL_DIR variables. Instead, if it REALLY proves necessar=
y,<br>
&gt; -Unix users can edit the advanced, canonical CMAKE_INSTALL_* variables=
.<br>
&gt; ----<br>
&gt; - CMakeLists.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 36 ++++++++++++++++++++++------------<br>
&gt; - <a href=3D"http://assimp.pc.in" rel=3D"noreferrer" target=3D"_blank"=
>assimp.pc.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 6 ++----<br>
&gt; - <a href=3D"http://assimpTargets-debug.cmake.in" rel=3D"noreferrer" t=
arget=3D"_blank">assimpTargets-debug.cmake.in</a>=C2=A0 =C2=A0| 20 ++++++++=
+----------<br>
&gt; - <a href=3D"http://assimpTargets-release.cmake.in" rel=3D"noreferrer"=
 target=3D"_blank">assimpTargets-release.cmake.in</a> | 18 ++++++++--------=
-<br>
&gt; - <a href=3D"http://assimpTargets.cmake.in" rel=3D"noreferrer" target=
=3D"_blank">assimpTargets.cmake.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1=
5 +-------------<br>
&gt; - 5 files changed, 45 insertions(+), 50 deletions(-)<br>
&gt; -<br>
&gt; -Upstream-Status: Backport<br>
&gt; -Comment: Additionally remove setting of ASSIMP_LIBRARY_DIRS, ASSIMP_I=
NCLUDE_DIRS<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0and INTERFACE_INCLUDE_DIRECTORIES a=
s default cross compile paths are enough<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0and setting them manually adds non-=
existing paths to CMake modules<br>
&gt; -<br>
&gt; -Signed-off-by: Ranjitsinh Rathod &lt;<a href=3D"mailto:ranjitsinh.rat=
hod@kpit.com" target=3D"_blank">ranjitsinh.rathod@kpit.com</a>&gt;<br>
&gt; -<br>
&gt; -diff --git a/CMakeLists.txt b/CMakeLists.txt<br>
&gt; -index dcafb649f5..c23c0df33e 100644<br>
&gt; ---- a/CMakeLists.txt<br>
&gt; -+++ b/CMakeLists.txt<br>
&gt; -@@ -230,11 +230,6 @@ SET(LIBASSIMP-DEV_COMPONENT &quot;libassimp${ASS=
IMP_VERSION_MAJOR}.${ASSIMP_VERSION_M<br>
&gt; - SET(CPACK_COMPONENTS_ALL assimp-bin ${LIBASSIMP_COMPONENT} ${LIBASSI=
MP-DEV_COMPONENT} assimp-dev)<br>
&gt; - SET(ASSIMP_LIBRARY_SUFFIX &quot;&quot; CACHE STRING &quot;Suffix to =
append to library names&quot;)<br>
&gt; -<br>
&gt; --IF( UNIX )<br>
&gt; --=C2=A0 # Use GNUInstallDirs for Unix predefined directories<br>
&gt; --=C2=A0 INCLUDE(GNUInstallDirs)<br>
&gt; --ENDIF( UNIX )<br>
&gt; --<br>
&gt; - # Grouped compiler settings<br>
&gt; - IF ((CMAKE_C_COMPILER_ID MATCHES &quot;GNU&quot;) AND NOT CMAKE_COMP=
ILER_IS_MINGW)<br>
&gt; -=C2=A0 =C2=A0IF(NOT HUNTER_ENABLED)<br>
&gt; -@@ -329,14 +324,6 @@ IF ( CMAKE_SOURCE_DIR STREQUAL CMAKE_BINARY_DIR =
)<br>
&gt; -=C2=A0 =C2=A0SET( CMAKE_RUNTIME_OUTPUT_DIRECTORY &quot;${CMAKE_HOME_D=
IRECTORY}/bin&quot; )<br>
&gt; - ENDIF ( CMAKE_SOURCE_DIR STREQUAL CMAKE_BINARY_DIR )<br>
&gt; -<br>
&gt; --# Cache these to allow the user to override them manually.<br>
&gt; --SET( ASSIMP_LIB_INSTALL_DIR &quot;lib&quot; CACHE STRING<br>
&gt; --=C2=A0 &quot;Path the built library files are installed to.&quot; )<=
br>
&gt; --SET( ASSIMP_INCLUDE_INSTALL_DIR &quot;include&quot; CACHE STRING<br>
&gt; --=C2=A0 &quot;Path the header files are installed to.&quot; )<br>
&gt; --SET( ASSIMP_BIN_INSTALL_DIR &quot;bin&quot; CACHE STRING<br>
&gt; --=C2=A0 &quot;Path the tool executables are installed to.&quot; )<br>
&gt; --<br>
&gt; - get_cmake_property(is_multi_config GENERATOR_IS_MULTI_CONFIG)<br>
&gt; -<br>
&gt; - IF (INJECT_DEBUG_POSTFIX AND (is_multi_config OR CMAKE_BUILD_TYPE ST=
REQUAL &quot;Debug&quot;))<br>
&gt; -@@ -391,6 +378,29 @@ IF(HUNTER_ENABLED)<br>
&gt; -=C2=A0 =C2=A0)<br>
&gt; - ELSE(HUNTER_ENABLED)<br>
&gt; -=C2=A0 =C2=A0# cmake configuration files<br>
&gt; -+<br>
&gt; -+=C2=A0 IF( UNIX )<br>
&gt; -+=C2=A0 =C2=A0 # Use GNUInstallDirs for Unix predefined directories<b=
r>
&gt; -+=C2=A0 =C2=A0 INCLUDE(GNUInstallDirs)<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 SET( ASSIMP_LIB_INSTALL_DIR ${CMAKE_INSTALL_LIBDIR})<b=
r>
&gt; -+=C2=A0 =C2=A0 SET( ASSIMP_INCLUDE_INSTALL_DIR ${CMAKE_INSTALL_INCLUD=
EDIR})<br>
&gt; -+=C2=A0 =C2=A0 SET( ASSIMP_BIN_INSTALL_DIR ${CMAKE_INSTALL_BINDIR})<b=
r>
&gt; -+=C2=A0 ELSE( UNIX )<br>
&gt; -+=C2=A0 =C2=A0 # Cache these to allow the user to override them on no=
n-Unix platforms<br>
&gt; -+=C2=A0 =C2=A0 SET( ASSIMP_LIB_INSTALL_DIR &quot;lib&quot; CACHE STRI=
NG<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 &quot;Path the built library files are installe=
d to.&quot; )<br>
&gt; -+=C2=A0 =C2=A0 SET( ASSIMP_INCLUDE_INSTALL_DIR &quot;include&quot; CA=
CHE STRING<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 &quot;Path the header files are installed to.&q=
uot; )<br>
&gt; -+=C2=A0 =C2=A0 SET( ASSIMP_BIN_INSTALL_DIR &quot;bin&quot; CACHE STRI=
NG<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 &quot;Path the tool executables are installed t=
o.&quot; )<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 SET(CMAKE_INSTALL_FULL_INCLUDEDIR ${CMAKE_INSTALL_PREF=
IX}/${ASSIMP_INCLUDE_INSTALL_DIR})<br>
&gt; -+=C2=A0 =C2=A0 SET(CMAKE_INSTALL_FULL_LIBDIR ${CMAKE_INSTALL_PREFIX}/=
${ASSIMP_LIB_INSTALL_DIR})<br>
&gt; -+=C2=A0 =C2=A0 SET(CMAKE_INSTALL_FULL_BINDIR ${CMAKE_INSTALL_PREFIX}/=
${ASSIMP_BIN_INSTALL_DIR})<br>
&gt; -+=C2=A0 ENDIF( UNIX )<br>
&gt; -+<br>
&gt; -+<br>
&gt; -=C2=A0 =C2=A0CONFIGURE_FILE(&quot;${CMAKE_CURRENT_SOURCE_DIR}/<a href=
=3D"http://assimp-config.cmake.in" rel=3D"noreferrer" target=3D"_blank">ass=
imp-config.cmake.in</a>&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${CMAK=
E_CURRENT_BINARY_DIR}/assimp-config.cmake&quot; @ONLY IMMEDIATE)<br>
&gt; -=C2=A0 =C2=A0CONFIGURE_FILE(&quot;${CMAKE_CURRENT_SOURCE_DIR}/<a href=
=3D"http://assimpTargets.cmake.in" rel=3D"noreferrer" target=3D"_blank">ass=
impTargets.cmake.in</a>&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${CMAK=
E_CURRENT_BINARY_DIR}/assimpTargets.cmake&quot; @ONLY IMMEDIATE)<br>
&gt; -=C2=A0 =C2=A0IF (is_multi_config)<br>
&gt; -diff --git a/<a href=3D"http://assimp.pc.in" rel=3D"noreferrer" targe=
t=3D"_blank">assimp.pc.in</a> b/<a href=3D"http://assimp.pc.in" rel=3D"nore=
ferrer" target=3D"_blank">assimp.pc.in</a><br>
&gt; -index c659e19f2c..555a3a1d3b 100644<br>
&gt; ---- a/<a href=3D"http://assimp.pc.in" rel=3D"noreferrer" target=3D"_b=
lank">assimp.pc.in</a><br>
&gt; -+++ b/<a href=3D"http://assimp.pc.in" rel=3D"noreferrer" target=3D"_b=
lank">assimp.pc.in</a><br>
&gt; -@@ -1,7 +1,5 @@<br>
&gt; --prefix=3D@CMAKE_INSTALL_PREFIX@<br>
&gt; --exec_prefix=3D@CMAKE_INSTALL_PREFIX@/<br>
&gt; --libdir=3D@CMAKE_INSTALL_PREFIX@/@ASSIMP_LIB_INSTALL_DIR@<br>
&gt; --includedir=3D@CMAKE_INSTALL_PREFIX@/../include/@ASSIMP_INCLUDE_INSTA=
LL_DIR@<br>
&gt; -+libdir=3D@CMAKE_INSTALL_FULL_LIBDIR@<br>
&gt; -+includedir=3D@CMAKE_INSTALL_FULL_INCLUDEDIR@<br>
&gt; -<br>
&gt; - Name: @CMAKE_PROJECT_NAME@<br>
&gt; - Description: Import various well-known 3D model formats in an unifor=
m manner.<br>
&gt; -diff --git a/<a href=3D"http://assimpTargets-debug.cmake.in" rel=3D"n=
oreferrer" target=3D"_blank">assimpTargets-debug.cmake.in</a> b/<a href=3D"=
http://assimpTargets-debug.cmake.in" rel=3D"noreferrer" target=3D"_blank">a=
ssimpTargets-debug.cmake.in</a><br>
&gt; -index 1ebe2a6081..f5034c9349 100644<br>
&gt; ---- a/<a href=3D"http://assimpTargets-debug.cmake.in" rel=3D"noreferr=
er" target=3D"_blank">assimpTargets-debug.cmake.in</a><br>
&gt; -+++ b/<a href=3D"http://assimpTargets-debug.cmake.in" rel=3D"noreferr=
er" target=3D"_blank">assimpTargets-debug.cmake.in</a><br>
&gt; -@@ -42,22 +42,22 @@ if(MSVC)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0# Import target &quot;assimp::assimp&quot; for co=
nfiguration &quot;Debug&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0set_property(TARGET assimp::assimp APPEND PROPERT=
Y IMPORTED_CONFIGURATIONS DEBUG)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0set_target_properties(assimp::assimp PROPERTIES<b=
r>
&gt; --=C2=A0 =C2=A0 =C2=A0 IMPORTED_IMPLIB_DEBUG &quot;${_IMPORT_PREFIX}/l=
ib/${importLibraryName}&quot;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 IMPORTED_LOCATION_DEBUG &quot;${_IMPORT_PREFIX}=
/bin/${sharedLibraryName}&quot;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 IMPORTED_IMPLIB_DEBUG &quot;@CMAKE_INSTALL_FULL=
_LIBDIR@/${importLibraryName}&quot;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 IMPORTED_LOCATION_DEBUG &quot;@CMAKE_INSTALL_FU=
LL_BINDIR@/${sharedLibraryName}&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp =
)<br>
&gt; --=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp &qu=
ot;${_IMPORT_PREFIX}/lib/${importLibraryName}&quot;)<br>
&gt; --=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp &qu=
ot;${_IMPORT_PREFIX}/bin/${sharedLibraryName}&quot; )<br>
&gt; -+=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp &qu=
ot;@CMAKE_INSTALL_FULL_LIBDIR@/${importLibraryName}&quot;)<br>
&gt; -+=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp &qu=
ot;@CMAKE_INSTALL_FULL_BINDIR@/${sharedLibraryName}&quot; )<br>
&gt; -=C2=A0 =C2=A0else()<br>
&gt; -=C2=A0 =C2=A0 =C2=A0set(staticLibraryName &quot;assimp${ASSIMP_LIBRAR=
Y_SUFFIX}@CMAKE_DEBUG_POSTFIX@@CMAKE_STATIC_LIBRARY_SUFFIX@&quot;)<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0# Import target &quot;assimp::assimp&quot; for co=
nfiguration &quot;Debug&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0set_property(TARGET assimp::assimp APPEND PROPERT=
Y IMPORTED_CONFIGURATIONS DEBUG)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0set_target_properties(assimp::assimp PROPERTIES<b=
r>
&gt; --=C2=A0 =C2=A0 =C2=A0 IMPORTED_LOCATION_DEBUG &quot;${_IMPORT_PREFIX}=
/lib/${staticLibraryName}&quot;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 IMPORTED_LOCATION_DEBUG &quot;@CMAKE_INSTALL_FU=
LL_LIBDIR@/${staticLibraryName}&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp =
)<br>
&gt; --=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp &qu=
ot;${_IMPORT_PREFIX}/lib/${staticLibraryName}&quot;)<br>
&gt; -+=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp &qu=
ot;@CMAKE_INSTALL_FULL_LIBDIR@/${staticLibraryName}&quot;)<br>
&gt; -=C2=A0 =C2=A0endif()<br>
&gt; -<br>
&gt; - else()<br>
&gt; -@@ -66,17 +66,17 @@ else()<br>
&gt; -=C2=A0 =C2=A0 =C2=A0set(sharedLibraryName &quot;libassimp${ASSIMP_LIB=
RARY_SUFFIX}@CMAKE_DEBUG_POSTFIX@@CMAKE_SHARED_LIBRARY_SUFFIX@.@ASSIMP_VERS=
ION_MAJOR@&quot;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0set_target_properties(assimp::assimp PROPERTIES<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0IMPORTED_SONAME_DEBUG &quot;${sharedLibrar=
yName}&quot;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 IMPORTED_LOCATION_DEBUG &quot;${_IMPORT_PREFIX}=
/lib/${sharedLibraryName}&quot;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 IMPORTED_LOCATION_DEBUG &quot;@CMAKE_INSTALL_FU=
LL_LIBDIR@/${sharedLibraryName}&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp =
)<br>
&gt; --=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp &qu=
ot;${_IMPORT_PREFIX}/lib/${sharedLibraryName}&quot; )<br>
&gt; -+=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp &qu=
ot;@CMAKE_INSTALL_FULL_LIBDIR@/${sharedLibraryName}&quot; )<br>
&gt; -=C2=A0 =C2=A0else()<br>
&gt; -=C2=A0 =C2=A0 =C2=A0set(staticLibraryName &quot;libassimp${ASSIMP_LIB=
RARY_SUFFIX}@CMAKE_DEBUG_POSTFIX@@CMAKE_STATIC_LIBRARY_SUFFIX@&quot;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0set_target_properties(assimp::assimp PROPERTIES<b=
r>
&gt; --=C2=A0 =C2=A0 =C2=A0 IMPORTED_LOCATION_DEBUG &quot;${_IMPORT_PREFIX}=
/lib/${staticLibraryName}&quot;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 IMPORTED_LOCATION_DEBUG &quot;@CMAKE_INSTALL_FU=
LL_LIBDIR@/${staticLibraryName}&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp =
)<br>
&gt; --=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp &qu=
ot;${_IMPORT_PREFIX}/lib/${staticLibraryName}&quot; )<br>
&gt; -+=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp &qu=
ot;@CMAKE_INSTALL_FULL_LIBDIR@/${staticLibraryName}&quot; )<br>
&gt; -=C2=A0 =C2=A0endif()<br>
&gt; - endif()<br>
&gt; -<br>
&gt; -diff --git a/<a href=3D"http://assimpTargets-release.cmake.in" rel=3D=
"noreferrer" target=3D"_blank">assimpTargets-release.cmake.in</a> b/<a href=
=3D"http://assimpTargets-release.cmake.in" rel=3D"noreferrer" target=3D"_bl=
ank">assimpTargets-release.cmake.in</a><br>
&gt; -index f3db8f12cd..a416e8899b 100644<br>
&gt; ---- a/<a href=3D"http://assimpTargets-release.cmake.in" rel=3D"norefe=
rrer" target=3D"_blank">assimpTargets-release.cmake.in</a><br>
&gt; -+++ b/<a href=3D"http://assimpTargets-release.cmake.in" rel=3D"norefe=
rrer" target=3D"_blank">assimpTargets-release.cmake.in</a><br>
&gt; -@@ -42,12 +42,12 @@ if(MSVC)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0# Import target &quot;assimp::assimp&quot; for co=
nfiguration &quot;Release&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0set_property(TARGET assimp::assimp APPEND PROPERT=
Y IMPORTED_CONFIGURATIONS RELEASE)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0set_target_properties(assimp::assimp PROPERTIES<b=
r>
&gt; --=C2=A0 =C2=A0 =C2=A0 IMPORTED_IMPLIB_RELEASE &quot;${_IMPORT_PREFIX}=
/lib/${importLibraryName}&quot;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 IMPORTED_LOCATION_RELEASE &quot;${_IMPORT_PREFI=
X}/bin/${sharedLibraryName}&quot;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 IMPORTED_IMPLIB_RELEASE &quot;@CMAKE_INSTALL_FU=
LL_LIBDIR@/${importLibraryName}&quot;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 IMPORTED_LOCATION_RELEASE &quot;@CMAKE_INSTALL_=
FULL_BINDIR@/${sharedLibraryName}&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp =
)<br>
&gt; --=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp &qu=
ot;${_IMPORT_PREFIX}/lib/${importLibraryName}&quot;)<br>
&gt; --=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp &qu=
ot;${_IMPORT_PREFIX}/bin/${sharedLibraryName}&quot; )<br>
&gt; -+=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp &qu=
ot;@CMAKE_INSTALL_FULL_LIBDIR@/${importLibraryName}&quot;)<br>
&gt; -+=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp &qu=
ot;@CMAKE_INSTALL_FULL_BINDIR@/${sharedLibraryName}&quot; )<br>
&gt; -=C2=A0 =C2=A0else()<br>
&gt; -=C2=A0 =C2=A0 =C2=A0set(staticLibraryName &quot;assimp${ASSIMP_LIBRAR=
Y_SUFFIX}@CMAKE_STATIC_LIBRARY_SUFFIX@&quot;)<br>
&gt; -<br>
&gt; -@@ -57,7 +57,7 @@ if(MSVC)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0IMPORTED_LOCATION_RELEASE &quot;${_IMPORT_=
PREFIX}/lib/${staticLibraryName}&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp =
)<br>
&gt; --=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp &qu=
ot;${_IMPORT_PREFIX}/lib/${staticLibraryName}&quot;)<br>
&gt; -+=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp &qu=
ot;@CMAKE_INSTALL_FULL_LIBDIR@/${staticLibraryName}&quot;)<br>
&gt; -=C2=A0 =C2=A0endif()<br>
&gt; -<br>
&gt; - else()<br>
&gt; -@@ -70,17 +70,17 @@ else()<br>
&gt; -=C2=A0 =C2=A0 =C2=A0endif()<br>
&gt; -=C2=A0 =C2=A0 =C2=A0set_target_properties(assimp::assimp PROPERTIES<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0IMPORTED_SONAME_RELEASE &quot;${sharedLibr=
aryName}&quot;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 IMPORTED_LOCATION_RELEASE &quot;${_IMPORT_PREFI=
X}/lib/${sharedLibraryName}&quot;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 IMPORTED_LOCATION_RELEASE &quot;@CMAKE_INSTALL_=
FULL_LIBDIR@/${sharedLibraryName}&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp =
)<br>
&gt; --=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp &qu=
ot;${_IMPORT_PREFIX}/lib/${sharedLibraryName}&quot; )<br>
&gt; -+=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp &qu=
ot;@CMAKE_INSTALL_FULL_LIBDIR@/${sharedLibraryName}&quot; )<br>
&gt; -=C2=A0 =C2=A0else()<br>
&gt; -=C2=A0 =C2=A0 =C2=A0set(staticLibraryName &quot;libassimp${ASSIMP_LIB=
RARY_SUFFIX}@CMAKE_STATIC_LIBRARY_SUFFIX@&quot;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0set_target_properties(assimp::assimp PROPERTIES<b=
r>
&gt; --=C2=A0 =C2=A0 =C2=A0 IMPORTED_LOCATION_RELEASE &quot;${_IMPORT_PREFI=
X}/lib/${staticLibraryName}&quot;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 IMPORTED_LOCATION_RELEASE &quot;@CMAKE_INSTALL_=
FULL_LIBDIR@/${staticLibraryName}&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp =
)<br>
&gt; --=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp &qu=
ot;${_IMPORT_PREFIX}/lib/${staticLibraryName}&quot; )<br>
&gt; -+=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp &qu=
ot;@CMAKE_INSTALL_FULL_LIBDIR@/${staticLibraryName}&quot; )<br>
&gt; -=C2=A0 =C2=A0endif()<br>
&gt; - endif()<br>
&gt; -<br>
&gt; -@@ -91,8 +91,6 @@ get_filename_component(ASSIMP_ROOT_DIR &quot;@CMAKE=
_INSTALL_PREFIX@&quot; REALPATH)<br>
&gt; -<br>
&gt; - set( ASSIMP_CXX_FLAGS ) # dynamically linked library<br>
&gt; - set( ASSIMP_LINK_FLAGS &quot;&quot; )<br>
&gt; --set( ASSIMP_LIBRARY_DIRS &quot;${ASSIMP_ROOT_DIR}/@ASSIMP_LIB_INSTAL=
L_DIR@&quot;)<br>
&gt; --set( ASSIMP_INCLUDE_DIRS &quot;${ASSIMP_ROOT_DIR}/@ASSIMP_INCLUDE_IN=
STALL_DIR@&quot;)<br>
&gt; - if(ASSIMP_BUILD_SHARED_LIBS)<br>
&gt; -=C2=A0 =C2=A0set( ASSIMP_LIBRARIES ${sharedLibraryName})<br>
&gt; - else()<br>
&gt; -<br>
&gt; -diff --git a/<a href=3D"http://assimpTargets.cmake.in" rel=3D"norefer=
rer" target=3D"_blank">assimpTargets.cmake.in</a> b/<a href=3D"http://assim=
pTargets.cmake.in" rel=3D"noreferrer" target=3D"_blank">assimpTargets.cmake=
.in</a><br>
&gt; -index ab1a8d2c7b..ef90c834a6 100644<br>
&gt; ---- a/<a href=3D"http://assimpTargets.cmake.in" rel=3D"noreferrer" ta=
rget=3D"_blank">assimpTargets.cmake.in</a><br>
&gt; -+++ b/<a href=3D"http://assimpTargets.cmake.in" rel=3D"noreferrer" ta=
rget=3D"_blank">assimpTargets.cmake.in</a><br>
&gt; -@@ -40,16 +40,6 @@ unset(_targetsDefined)<br>
&gt; - unset(_targetsNotDefined)<br>
&gt; - unset(_expectedTargets)<br>
&gt; -<br>
&gt; --<br>
&gt; --# Compute the installation prefix relative to this file.<br>
&gt; --get_filename_component(_IMPORT_PREFIX &quot;${CMAKE_CURRENT_LIST_FIL=
E}&quot; PATH)<br>
&gt; --get_filename_component(_IMPORT_PREFIX &quot;${_IMPORT_PREFIX}&quot; =
PATH)<br>
&gt; --get_filename_component(_IMPORT_PREFIX &quot;${_IMPORT_PREFIX}&quot; =
PATH)<br>
&gt; --get_filename_component(_IMPORT_PREFIX &quot;${_IMPORT_PREFIX}&quot; =
PATH)<br>
&gt; --if(_IMPORT_PREFIX STREQUAL &quot;/&quot;)<br>
&gt; --=C2=A0 set(_IMPORT_PREFIX &quot;&quot;)<br>
&gt; --endif()<br>
&gt; --<br>
&gt; - # Create imported target assimp::assimp<br>
&gt; - if(@BUILD_SHARED_LIBS@)<br>
&gt; -=C2=A0 =C2=A0add_library(assimp::assimp SHARED IMPORTED)<br>
&gt; -@@ -60,7 +50,7 @@ endif()<br>
&gt; - set_target_properties(assimp::assimp PROPERTIES<br>
&gt; -=C2=A0 =C2=A0COMPATIBLE_INTERFACE_STRING &quot;assimp_MAJOR_VERSION&q=
uot;<br>
&gt; -=C2=A0 =C2=A0INTERFACE_assimp_MAJOR_VERSION &quot;1&quot;<br>
&gt; --=C2=A0 INTERFACE_INCLUDE_DIRECTORIES &quot;${_IMPORT_PREFIX}/include=
;${_IMPORT_PREFIX}/include&quot;<br>
&gt; -+=C2=A0 #INTERFACE_INCLUDE_DIRECTORIES &quot;@CMAKE_INSTALL_FULL_INCL=
UDEDIR@&quot;<br>
&gt; -=C2=A0 =C2=A0#INTERFACE_LINK_LIBRARIES &quot;TxtUtils::TxtUtils;Mealy=
Machine::MealyMachine&quot;<br>
&gt; - )<br>
&gt; -<br>
&gt; -@@ -75,9 +65,6 @@ foreach(f ${CONFIG_FILES})<br>
&gt; -=C2=A0 =C2=A0include(${f})<br>
&gt; - endforeach()<br>
&gt; -<br>
&gt; --# Cleanup temporary variables.<br>
&gt; --set(_IMPORT_PREFIX)<br>
&gt; --<br>
&gt; - # Loop over all imported files and verify that they actually exist<b=
r>
&gt; - foreach(target ${_IMPORT_CHECK_TARGETS} )<br>
&gt; -=C2=A0 =C2=A0foreach(file ${_IMPORT_CHECK_FILES_FOR_${target}} )<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-graphics/vulkan/<a href=3D"http://assimp_5.0=
.1.bb" rel=3D"noreferrer" target=3D"_blank">assimp_5.0.1.bb</a> b/meta/reci=
pes-graphics/vulkan/<a href=3D"http://assimp_5.0.1.bb" rel=3D"noreferrer" t=
arget=3D"_blank">assimp_5.0.1.bb</a><br>
&gt; deleted file mode 100644<br>
&gt; index 89c555f08e..0000000000<br>
&gt; --- a/meta/recipes-graphics/vulkan/<a href=3D"http://assimp_5.0.1.bb" =
rel=3D"noreferrer" target=3D"_blank">assimp_5.0.1.bb</a><br>
&gt; +++ /dev/null<br>
&gt; @@ -1,26 +0,0 @@<br>
&gt; -DESCRIPTION =3D &quot;Open Asset Import Library is a portable Open So=
urce library to import \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0various well-k=
nown 3D model formats in a uniform manner.&quot;<br>
&gt; -HOMEPAGE =3D &quot;<a href=3D"http://www.assimp.org/" rel=3D"noreferr=
er" target=3D"_blank">http://www.assimp.org/</a>&quot;<br>
&gt; -SECTION =3D &quot;devel&quot;<br>
&gt; -<br>
&gt; -LICENSE =3D &quot;BSD-3-Clause&quot;<br>
&gt; -LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D2119edef0916b0bd511cb=
3c731076271&quot;<br>
&gt; -<br>
&gt; -DEPENDS =3D &quot;zlib&quot;<br>
&gt; -<br>
&gt; -SRC_URI =3D &quot;git://<a href=3D"http://github.com/assimp/assimp.gi=
t;branch=3Dassimp_5.0_release" rel=3D"noreferrer" target=3D"_blank">github.=
com/assimp/assimp.git;branch=3Dassimp_5.0_release</a> \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-closes-https-git=
hub.com-assimp-assimp-issues-2733-up.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://use-GNUInstallDirs-wh=
ere-possible.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-assimp-remove-sh=
ared-lib-from-_IMPORT_CHECK_TARGETS.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; -UPSTREAM_CHECK_GITTAGREGEX =3D &quot;v(?P&lt;pver&gt;(\d+(\.\d+)+))&q=
uot;<br>
&gt; -<br>
&gt; -SRCREV =3D &quot;8f0c6b04b2257a520aaab38421b2e090204b69df&quot;<br>
&gt; -<br>
&gt; -S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; -<br>
&gt; -inherit cmake<br>
&gt; -<br>
&gt; -EXTRA_OECMAKE =3D &quot;-DASSIMP_BUILD_ASSIMP_TOOLS=3DOFF -DASSIMP_BU=
ILD_TESTS=3DOFF -DASSIMP_LIB_INSTALL_DIR=3D${baselib}&quot;<br>
&gt; -<br>
&gt; -BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
-- <br>
# Randy MacLeod<br>
# Wind River Linux<br>
<br>
<br>
<br>
</blockquote></div></div>

--0000000000000db23f05cb6734c0--
