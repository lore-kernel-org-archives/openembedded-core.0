Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id B003F72EA1
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Jun 2018 22:22:19 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id p14-v6so14985115pfh.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Jun 2018 15:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=sBzkku7YPIyQXvMKVPsLrL6WDF1yosy8Gm0esb7uZaY=;
	b=NEjAzZmWzPtYhLRQiM3z+wbRQrqy2GpiX4qEkL3t3pLFU4gN2CIAlmhYY4fCoR3Uss
	ufnyx24kHfY2WsDUlhMgv5lxVIyrOxhGpT0Fzyp2r3Qywm7cCbSdHxDsPx/jwLUim1cp
	thxppJE0gKjYHtx68awVQGuU4T/axKByYXgrVjSzf1+mRgThW9Cpa4oQEp/DUTdVnJty
	IynAi1drD+7kk1gAAf08zcotwpymkPQbTT8ryCotk+FcryVr8CslQNA6/mjL8G2wYUS9
	+DTiNvup6XYpNrOuXm9/t9S/bPb8pLnoii+r36nCjoM2NC/9V4FkP+CVinr+QCLt0wq8
	H0xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=sBzkku7YPIyQXvMKVPsLrL6WDF1yosy8Gm0esb7uZaY=;
	b=MYu+WzyR9GiXv1IJHTzpuDxqwqzdMmV04FC5ARabLnfAKBGK7SwROdIRHPhXBSPQkA
	j2ZF4yK4oRfGa/qbXSJsPgmH4Yv1INXX4LvSl5+bVrPJx6bZ5BbiNJ2zmfgnja1Nvx7U
	HDJJlCCl1hORXxHrhI9AcfafpD76jx6J/oj/dYCIDipKJHgi0zUyEE30rD3NIde6ncHs
	xG5g5BAvAuHhWjkYbGEJOxYaQ//aGD4yMVsYZiNjoFr8kBtCX2C0EI241fu6/yh/DRby
	oKdW0ki1KHlE1u2TpQhwrMiQ4y2vzKJHup9CYJto56ULHp6SIOwuSUb8d2TfwnC1/w8Y
	/FUg==
X-Gm-Message-State: ALKqPweF1YQVY7dwhJsYmAzkMb/Ss81bXBfL4TVcfZaP2yaP9BbBDagw
	IdJ+2Wz/C5eZFkX2+8Ck/gRT2g==
X-Google-Smtp-Source: ADUXVKJeXKd98RCVOOygySTARz+jwsMRBt/klmkfJrLYgegbgUpjPcbwhxhipZBeFE9LSARNkW/xyA==
X-Received: by 2002:a63:6fcb:: with SMTP id
	k194-v6mr15377195pgc.349.1528064540715; 
	Sun, 03 Jun 2018 15:22:20 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:f1bd:c539:22b:bbf1])
	by smtp.gmail.com with ESMTPSA id
	j24-v6sm37404191pfi.84.2018.06.03.15.22.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 03 Jun 2018 15:22:20 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Sun,  3 Jun 2018 15:22:18 -0700
Message-Id: <1528064539-32128-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] cmake: fix build issue with boost 1.66.0
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
X-List-Received-Date: Sun, 03 Jun 2018 22:22:19 -0000

this fixes a build issue with boost 1.66.0

[Yocto 12762]

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/cmake/cmake.inc              |   4 +
 ...oost-1.66.0-dependency-and-release-update.patch |  52 ++++++++
 ...ix-incorrect-alphabetisation-of-headers-l.patch |  29 +++++
 ...mplement-Architecture-and-Address-Model-t.patch | 132 +++++++++++++++++++++
 ...earch-for-upstream-packaged-libs-next-to-.patch |  31 +++++
 5 files changed, 248 insertions(+)
 create mode 100644 meta/recipes-devtools/cmake/cmake/0001-FindBoost-Boost-1.66.0-dependency-and-release-update.patch
 create mode 100644 meta/recipes-devtools/cmake/cmake/0001-FindBoost-Fix-incorrect-alphabetisation-of-headers-l.patch
 create mode 100644 meta/recipes-devtools/cmake/cmake/0002-FindBoost-Implement-Architecture-and-Address-Model-t.patch
 create mode 100644 meta/recipes-devtools/cmake/cmake/0003-FindBoost-Search-for-upstream-packaged-libs-next-to-.patch

diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 9357079..394c9eb 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -16,6 +16,10 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://support-oe-qt4-tools-names.patch \
            file://qt4-fail-silent.patch \
            file://cmake-Prevent-the-detection-of-Qt5.patch \
+           file://0001-FindBoost-Boost-1.66.0-dependency-and-release-update.patch \
+           file://0001-FindBoost-Fix-incorrect-alphabetisation-of-headers-l.patch \
+           file://0002-FindBoost-Implement-Architecture-and-Address-Model-t.patch \
+           file://0003-FindBoost-Search-for-upstream-packaged-libs-next-to-.patch \
            "
 
 SRC_URI[md5sum] = "1c38c67295ca696aeafd8c059d748b38"
diff --git a/meta/recipes-devtools/cmake/cmake/0001-FindBoost-Boost-1.66.0-dependency-and-release-update.patch b/meta/recipes-devtools/cmake/cmake/0001-FindBoost-Boost-1.66.0-dependency-and-release-update.patch
new file mode 100644
index 0000000..fda60e3
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake/0001-FindBoost-Boost-1.66.0-dependency-and-release-update.patch
@@ -0,0 +1,52 @@
+From 433a2d495a2481c63b82c11a30f7c642d6abe63f Mon Sep 17 00:00:00 2001
+From: "Paul \"TBBle\" Hampson" <Paul.Hampson@Pobox.com>
+Date: Fri, 29 Dec 2017 19:55:49 +1100
+Subject: [PATCH] FindBoost: Boost 1.66.0 dependency and release update
+
+Release notes: http://www.boost.org/users/history/version_1_66_0.html
+
+* All new libraries are header-only.
+* _Boost_COMPONENT_DEPENDENCIES is unchanged from 1.65.1
+* _Boost_FIBER_COMPILER_FEATURES is unchanged from 1.64.0
+
+Upstream-Status: Backport
+[Yocto 12762]
+Signed-off-by: Armin Kuster <akuster808@gmail.com>
+
+---
+ Modules/FindBoost.cmake | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+Index: cmake-3.10.3/Modules/FindBoost.cmake
+===================================================================
+--- cmake-3.10.3.orig/Modules/FindBoost.cmake
++++ cmake-3.10.3/Modules/FindBoost.cmake
+@@ -797,7 +797,7 @@ function(_Boost_COMPONENT_DEPENDENCIES c
+       set(_Boost_WAVE_DEPENDENCIES filesystem system serialization thread chrono date_time atomic)
+       set(_Boost_WSERIALIZATION_DEPENDENCIES serialization)
+     endif()
+-    if(NOT Boost_VERSION VERSION_LESS 106600)
++    if(NOT Boost_VERSION VERSION_LESS 106700)
+       message(WARNING "New Boost version may have incorrect or missing dependencies and imported targets")
+       set(_Boost_IMPORTED_TARGETS FALSE)
+     endif()
+@@ -931,8 +931,8 @@ endfunction()
+ # `${Boost_ROOT}/libs/fiber/build/Jamfile.v2`.
+ #
+ function(_Boost_COMPILER_FEATURES component _ret)
+-  # Boost >= 1.62 and < 1.65
+-  if(NOT Boost_VERSION VERSION_LESS 106200 AND Boost_VERSION VERSION_LESS 106500)
++  # Boost >= 1.62 and < 1.67
++  if(NOT Boost_VERSION VERSION_LESS 106200 AND Boost_VERSION VERSION_LESS 106700)
+     set(_Boost_FIBER_COMPILER_FEATURES
+         cxx_alias_templates
+         cxx_auto_type
+@@ -1038,7 +1038,7 @@ else()
+   # _Boost_COMPONENT_HEADERS.  See the instructions at the top of
+   # _Boost_COMPONENT_DEPENDENCIES.
+   set(_Boost_KNOWN_VERSIONS ${Boost_ADDITIONAL_VERSIONS}
+-    "1.65.1" "1.65.0" "1.65"
++    "1.66.0" "1.66" "1.65.1" "1.65.0" "1.65"
+     "1.64.0" "1.64" "1.63.0" "1.63" "1.62.0" "1.62" "1.61.0" "1.61" "1.60.0" "1.60"
+     "1.59.0" "1.59" "1.58.0" "1.58" "1.57.0" "1.57" "1.56.0" "1.56" "1.55.0" "1.55"
+     "1.54.0" "1.54" "1.53.0" "1.53" "1.52.0" "1.52" "1.51.0" "1.51"
diff --git a/meta/recipes-devtools/cmake/cmake/0001-FindBoost-Fix-incorrect-alphabetisation-of-headers-l.patch b/meta/recipes-devtools/cmake/cmake/0001-FindBoost-Fix-incorrect-alphabetisation-of-headers-l.patch
new file mode 100644
index 0000000..a45eda5
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake/0001-FindBoost-Fix-incorrect-alphabetisation-of-headers-l.patch
@@ -0,0 +1,29 @@
+From b1e9f67137733bc109d355450fcd06edda4784c5 Mon Sep 17 00:00:00 2001
+From: "Paul \"TBBle\" Hampson" <Paul.Hampson@Pobox.com>
+Date: Fri, 29 Dec 2017 20:07:31 +1100
+Subject: [PATCH 1/6] FindBoost: Fix incorrect alphabetisation of headers list
+
+Affects cmake < 3.11.0
+
+Upsteam-Status: Backport
+[Yocto 12762]
+Signed-off-by: Armin Kuster <akuster808@gmail.com>
+
+---
+ Modules/FindBoost.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: cmake-3.10.3/Modules/FindBoost.cmake
+===================================================================
+--- cmake-3.10.3.orig/Modules/FindBoost.cmake
++++ cmake-3.10.3/Modules/FindBoost.cmake
+@@ -831,8 +831,8 @@ function(_Boost_COMPONENT_HEADERS compon
+   set(_Boost_CONTAINER_HEADERS           "boost/container/container_fwd.hpp")
+   set(_Boost_CONTEXT_HEADERS             "boost/context/all.hpp")
+   set(_Boost_COROUTINE_HEADERS           "boost/coroutine/all.hpp")
+-  set(_Boost_EXCEPTION_HEADERS           "boost/exception/exception.hpp")
+   set(_Boost_DATE_TIME_HEADERS           "boost/date_time/date.hpp")
++  set(_Boost_EXCEPTION_HEADERS           "boost/exception/exception.hpp")
+   set(_Boost_FIBER_HEADERS               "boost/fiber/all.hpp")
+   set(_Boost_FILESYSTEM_HEADERS          "boost/filesystem/path.hpp")
+   set(_Boost_GRAPH_HEADERS               "boost/graph/adjacency_list.hpp")
diff --git a/meta/recipes-devtools/cmake/cmake/0002-FindBoost-Implement-Architecture-and-Address-Model-t.patch b/meta/recipes-devtools/cmake/cmake/0002-FindBoost-Implement-Architecture-and-Address-Model-t.patch
new file mode 100644
index 0000000..88301c6
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake/0002-FindBoost-Implement-Architecture-and-Address-Model-t.patch
@@ -0,0 +1,132 @@
+From b044f69a413123f15a05034c00a8e3763764a1e5 Mon Sep 17 00:00:00 2001
+From: "Paul \"TBBle\" Hampson" <Paul.Hampson@Pobox.com>
+Date: Fri, 29 Dec 2017 21:50:54 +1100
+Subject: [PATCH 2/6] FindBoost: Implement "Architecture and Address Model" tag
+
+This tag is new in Boost 1.66.0, and is present in the 'versioned'
+library file name layout.
+
+Affects cmake < 3.11.0
+
+Upsteam-Status: Backport
+[Yocto 12762]
+Signed-off-by: Armin Kuster <akuster808@gmail.com>
+
+---
+ Modules/FindBoost.cmake | 52 +++++++++++++++++++++++++++++++++++++++----------
+ 1 file changed, 42 insertions(+), 10 deletions(-)
+
+Index: cmake-3.10.3/Modules/FindBoost.cmake
+===================================================================
+--- cmake-3.10.3.orig/Modules/FindBoost.cmake
++++ cmake-3.10.3/Modules/FindBoost.cmake
+@@ -1385,8 +1385,11 @@ if(Boost_DEBUG)
+ endif()
+ 
+ #======================
+-# Systematically build up the Boost ABI tag
+-# http://boost.org/doc/libs/1_41_0/more/getting_started/windows.html#library-naming
++# Systematically build up the Boost ABI tag for the 'tagged' and 'versioned' layouts
++# http://boost.org/doc/libs/1_66_0/more/getting_started/windows.html#library-naming
++# http://boost.org/doc/libs/1_66_0/boost/config/auto_link.hpp
++# http://boost.org/doc/libs/1_66_0/tools/build/src/tools/common.jam
++# http://boost.org/doc/libs/1_66_0/boostcpp.jam
+ set( _boost_RELEASE_ABI_TAG "-")
+ set( _boost_DEBUG_ABI_TAG   "-")
+ # Key       Use this library when:
+@@ -1418,11 +1421,40 @@ if(Boost_USE_STLPORT)
+   string(APPEND _boost_DEBUG_ABI_TAG "p")
+ endif()
+ #  n        using the STLport deprecated "native iostreams" feature
++#           removed from the documentation in 1.43.0 but still present in
++#           boost/config/auto_link.hpp
+ if(Boost_USE_STLPORT_DEPRECATED_NATIVE_IOSTREAMS)
+   string(APPEND _boost_RELEASE_ABI_TAG "n")
+   string(APPEND _boost_DEBUG_ABI_TAG "n")
+ endif()
+ 
++#  -x86     Architecture and address model tag
++#           First character is the architecture, then word-size, either 32 or 64
++#           Only used in 'versioned' layout, added in Boost 1.66.0
++set(_boost_ARCHITECTURE_TAG "")
++# {CMAKE_CXX_COMPILER_ARCHITECTURE_ID} is not currently set for all compilers
++if(NOT "x${CMAKE_CXX_COMPILER_ARCHITECTURE_ID}" STREQUAL "x" AND NOT Boost_VERSION VERSION_LESS 106600)
++  string(APPEND _boost_ARCHITECTURE_TAG "-")
++  # This needs to be kept in-sync with the section of CMakePlatformId.h.in
++  # inside 'defined(_WIN32) && defined(_MSC_VER)'
++  if(${CMAKE_CXX_COMPILER_ARCHITECTURE_ID} STREQUAL "IA64")
++    string(APPEND _boost_ARCHITECTURE_TAG "i")
++  elseif(${CMAKE_CXX_COMPILER_ARCHITECTURE_ID} STREQUAL "X86"
++            OR ${CMAKE_CXX_COMPILER_ARCHITECTURE_ID} STREQUAL "x64")
++    string(APPEND _boost_ARCHITECTURE_TAG "x")
++  elseif(${CMAKE_CXX_COMPILER_ARCHITECTURE_ID} MATCHES "^ARM")
++    string(APPEND _boost_ARCHITECTURE_TAG "a")
++  elseif(${CMAKE_CXX_COMPILER_ARCHITECTURE_ID} STREQUAL "MIPS")
++    string(APPEND _boost_ARCHITECTURE_TAG "m")
++  endif()
++
++  if(CMAKE_SIZEOF_VOID_P EQUAL 8)
++    string(APPEND _boost_ARCHITECTURE_TAG "64")
++  else()
++    string(APPEND _boost_ARCHITECTURE_TAG "32")
++  endif()
++endif()
++
+ if(Boost_DEBUG)
+   message(STATUS "[ ${CMAKE_CURRENT_LIST_FILE}:${CMAKE_CURRENT_LIST_LINE} ] "
+     "_boost_RELEASE_ABI_TAG = ${_boost_RELEASE_ABI_TAG}")
+@@ -1616,22 +1648,22 @@ foreach(COMPONENT ${Boost_FIND_COMPONENT
+   unset(_boost_RELEASE_NAMES)
+   foreach(compiler IN LISTS _boost_COMPILER)
+     list(APPEND _boost_RELEASE_NAMES
+-      ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${compiler}${_boost_MULTITHREADED}${_boost_RELEASE_ABI_TAG}-${Boost_LIB_VERSION}
++      ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${compiler}${_boost_MULTITHREADED}${_boost_RELEASE_ABI_TAG}${_boost_ARCHITECTURE_TAG}-${Boost_LIB_VERSION}
+       ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${compiler}${_boost_MULTITHREADED}${_boost_RELEASE_ABI_TAG} )
+   endforeach()
+   list(APPEND _boost_RELEASE_NAMES
+-    ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${_boost_MULTITHREADED}${_boost_RELEASE_ABI_TAG}-${Boost_LIB_VERSION}
++    ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${_boost_MULTITHREADED}${_boost_RELEASE_ABI_TAG}${_boost_ARCHITECTURE_TAG}-${Boost_LIB_VERSION}
+     ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${_boost_MULTITHREADED}${_boost_RELEASE_ABI_TAG}
+     ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT} )
+   if(_boost_STATIC_RUNTIME_WORKAROUND)
+     set(_boost_RELEASE_STATIC_ABI_TAG "-s${_boost_RELEASE_ABI_TAG}")
+     foreach(compiler IN LISTS _boost_COMPILER)
+       list(APPEND _boost_RELEASE_NAMES
+-        ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${compiler}${_boost_MULTITHREADED}${_boost_RELEASE_STATIC_ABI_TAG}-${Boost_LIB_VERSION}
++        ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${compiler}${_boost_MULTITHREADED}${_boost_RELEASE_STATIC_ABI_TAG}${_boost_ARCHITECTURE_TAG}-${Boost_LIB_VERSION}
+         ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${compiler}${_boost_MULTITHREADED}${_boost_RELEASE_STATIC_ABI_TAG} )
+     endforeach()
+     list(APPEND _boost_RELEASE_NAMES
+-      ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${_boost_MULTITHREADED}${_boost_RELEASE_STATIC_ABI_TAG}-${Boost_LIB_VERSION}
++      ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${_boost_MULTITHREADED}${_boost_RELEASE_STATIC_ABI_TAG}${_boost_ARCHITECTURE_TAG}-${Boost_LIB_VERSION}
+       ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${_boost_MULTITHREADED}${_boost_RELEASE_STATIC_ABI_TAG} )
+   endif()
+   if(Boost_THREADAPI AND ${COMPONENT} STREQUAL "thread")
+@@ -1666,11 +1698,11 @@ foreach(COMPONENT ${Boost_FIND_COMPONENT
+   unset(_boost_DEBUG_NAMES)
+   foreach(compiler IN LISTS _boost_COMPILER)
+     list(APPEND _boost_DEBUG_NAMES
+-      ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${compiler}${_boost_MULTITHREADED}${_boost_DEBUG_ABI_TAG}-${Boost_LIB_VERSION}
++      ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${compiler}${_boost_MULTITHREADED}${_boost_DEBUG_ABI_TAG}${_boost_ARCHITECTURE_TAG}-${Boost_LIB_VERSION}
+       ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${compiler}${_boost_MULTITHREADED}${_boost_DEBUG_ABI_TAG} )
+   endforeach()
+   list(APPEND _boost_DEBUG_NAMES
+-    ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${_boost_MULTITHREADED}${_boost_DEBUG_ABI_TAG}-${Boost_LIB_VERSION}
++    ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${_boost_MULTITHREADED}${_boost_DEBUG_ABI_TAG}${_boost_ARCHITECTURE_TAG}-${Boost_LIB_VERSION}
+     ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${_boost_MULTITHREADED}${_boost_DEBUG_ABI_TAG}
+     ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${_boost_MULTITHREADED}
+     ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT} )
+@@ -1678,11 +1710,11 @@ foreach(COMPONENT ${Boost_FIND_COMPONENT
+     set(_boost_DEBUG_STATIC_ABI_TAG "-s${_boost_DEBUG_ABI_TAG}")
+     foreach(compiler IN LISTS _boost_COMPILER)
+       list(APPEND _boost_DEBUG_NAMES
+-        ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${compiler}${_boost_MULTITHREADED}${_boost_DEBUG_STATIC_ABI_TAG}-${Boost_LIB_VERSION}
++        ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${compiler}${_boost_MULTITHREADED}${_boost_DEBUG_STATIC_ABI_TAG}${_boost_ARCHITECTURE_TAG}-${Boost_LIB_VERSION}
+         ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${compiler}${_boost_MULTITHREADED}${_boost_DEBUG_STATIC_ABI_TAG} )
+     endforeach()
+     list(APPEND _boost_DEBUG_NAMES
+-      ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${_boost_MULTITHREADED}${_boost_DEBUG_STATIC_ABI_TAG}-${Boost_LIB_VERSION}
++      ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${_boost_MULTITHREADED}${_boost_DEBUG_STATIC_ABI_TAG}${_boost_ARCHITECTURE_TAG}-${Boost_LIB_VERSION}
+       ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${_boost_MULTITHREADED}${_boost_DEBUG_STATIC_ABI_TAG} )
+   endif()
+   if(Boost_THREADAPI AND ${COMPONENT} STREQUAL "thread")
diff --git a/meta/recipes-devtools/cmake/cmake/0003-FindBoost-Search-for-upstream-packaged-libs-next-to-.patch b/meta/recipes-devtools/cmake/cmake/0003-FindBoost-Search-for-upstream-packaged-libs-next-to-.patch
new file mode 100644
index 0000000..5178f5c
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake/0003-FindBoost-Search-for-upstream-packaged-libs-next-to-.patch
@@ -0,0 +1,31 @@
+From d56deff7d127b030739bd0034609d0046121d8cd Mon Sep 17 00:00:00 2001
+From: "Paul \"TBBle\" Hampson" <Paul.Hampson@Pobox.com>
+Date: Fri, 29 Dec 2017 22:38:36 +1100
+Subject: [PATCH 3/6] FindBoost: Search for upstream-packaged libs next to
+ includes
+
+Upstream packages Boost binaries for Windows with the 'boost' directory
+(the INCLUDE_DIR) next to the lib-... directory (the LIBRARY_DIR).
+
+Affects cmake < 3.11.0
+
+Upsteam-Status: Backport
+[Yocto 12762]
+Signed-off-by: Armin Kuster <akuster808@gmail.com>
+
+---
+ Modules/FindBoost.cmake | 1 +
+ 1 file changed, 1 insertion(+)
+
+Index: cmake-3.10.3/Modules/FindBoost.cmake
+===================================================================
+--- cmake-3.10.3.orig/Modules/FindBoost.cmake
++++ cmake-3.10.3/Modules/FindBoost.cmake
+@@ -1502,6 +1502,7 @@ foreach(c DEBUG RELEASE)
+       ${Boost_INCLUDE_DIR}/stage/lib
+       )
+     _Boost_UPDATE_WINDOWS_LIBRARY_SEARCH_DIRS_WITH_PREBUILT_PATHS(_boost_LIBRARY_SEARCH_DIRS_${c} "${Boost_INCLUDE_DIR}/..")
++    _Boost_UPDATE_WINDOWS_LIBRARY_SEARCH_DIRS_WITH_PREBUILT_PATHS(_boost_LIBRARY_SEARCH_DIRS_${c} "${Boost_INCLUDE_DIR}")
+     if( Boost_NO_SYSTEM_PATHS )
+       list(APPEND _boost_LIBRARY_SEARCH_DIRS_${c} NO_CMAKE_SYSTEM_PATH NO_SYSTEM_ENVIRONMENT_PATH)
+     else()
-- 
2.7.4


