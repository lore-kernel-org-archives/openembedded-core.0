Return-Path: <maxin.john@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id BF49578DB3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 10:52:23 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 Jul 2018 03:52:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,427,1526367600"; d="scan'208";a="60884021"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga007.jf.intel.com with ESMTP; 31 Jul 2018 03:52:20 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 28C315801C1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 03:52:19 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jul 2018 13:53:31 +0300
Message-Id: <1533034411-26881-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1533034411-26881-1-git-send-email-maxin.john@intel.com>
References: <1533034411-26881-1-git-send-email-maxin.john@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] vulkan-demos: upgrade to latest commit
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
X-List-Received-Date: Tue, 31 Jul 2018 10:52:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove upstreamed patches:
        1. 0001-Fix-build-on-x86.patch
        2. 0001-Support-installing-demos-support-out-of-tree-builds.patch

Updated the following patch:
        1. 0001-Don-t-build-demos-with-questionably-licensed-data.patch

Update subcomponents gli and glm based on the new structure of
repository.

License-Update: Update in location of file. No change in checksum

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...ild-demos-with-questionably-licensed-data.patch | 51 +++++++------
 .../vulkan-demos/0001-Fix-build-on-x86.patch       | 41 -----------
 ...stalling-demos-support-out-of-tree-builds.patch | 85 ----------------------
 meta/recipes-graphics/vulkan/vulkan-demos_git.bb   | 11 ++-
 4 files changed, 36 insertions(+), 152 deletions(-)
 delete mode 100644 meta/recipes-graphics/vulkan/vulkan-demos/0001-Fix-build-on-x86.patch
 delete mode 100644 meta/recipes-graphics/vulkan/vulkan-demos/0001-Support-installing-demos-support-out-of-tree-builds.patch

diff --git a/meta/recipes-graphics/vulkan/vulkan-demos/0001-Don-t-build-demos-with-questionably-licensed-data.patch b/meta/recipes-graphics/vulkan/vulkan-demos/0001-Don-t-build-demos-with-questionably-licensed-data.patch
index d32c8f2..93bcfbf 100644
--- a/meta/recipes-graphics/vulkan/vulkan-demos/0001-Don-t-build-demos-with-questionably-licensed-data.patch
+++ b/meta/recipes-graphics/vulkan/vulkan-demos/0001-Don-t-build-demos-with-questionably-licensed-data.patch
@@ -1,6 +1,6 @@
-From 55770fb07c42fe410cf8d09f8f5976babc89b9ef Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Tue, 4 Jul 2017 17:13:45 +0300
+From 0a27144d43b70121f57f6036514d069ca9d2b971 Mon Sep 17 00:00:00 2001
+From: "Maxin B. John" <maxin.john@intel.com>
+Date: Mon, 30 Jul 2018 17:23:29 +0300
 Subject: [PATCH] Don't build demos with questionably licensed data
 
 Some of the models don't have open source compatible licenses:
@@ -9,43 +9,46 @@ resources that are not included.
 
 ssao:
 scenerendering:
-	Sibenik model, no license found
+        Sibenik model, no license found
 
 deferred:
 deferredmultisampling:
 deferredshadows:
-	armor model, CC-BY-3.0
+        armor model, CC-BY-3.0
 
 vulkanscene:
 imgui:
 shadowmapping:
-	vulkanscene model, no license found
+        vulkanscene model, no license found
 
 indirectdraw:
-	plant model, no license found
+        plant model, no license found
 
 hdr:
 pbribl:
 pbrtexture:
-	Require external Vulkan Asset Pack
+        Require external Vulkan Asset Pack
 
 Upstream-Status: Inappropriate [configuration]
+
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
 ---
- CMakeLists.txt | 13 -------------
- 1 file changed, 13 deletions(-)
+ examples/CMakeLists.txt | 14 --------------
+ 1 file changed, 14 deletions(-)
 
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 4958fff..0f9d3e4 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -150,17 +150,11 @@ set(EXAMPLES
- 	computeparticles
+diff --git a/examples/CMakeLists.txt b/examples/CMakeLists.txt
+index 8eee3a4..698d3b3 100644
+--- a/examples/CMakeLists.txt
++++ b/examples/CMakeLists.txt
+@@ -47,18 +47,12 @@ set(EXAMPLES
  	computeshader
+ 	conservativeraster
  	debugmarker
 -	deferred
 -	deferredmultisampling
 -	deferredshadows
+ 	descriptorsets
  	displacement
  	distancefieldfonts
  	dynamicuniformbuffer
@@ -53,32 +56,36 @@ index 4958fff..0f9d3e4 100644
  	geometryshader
 -	hdr
 -	imgui
--	indirectdraw	
+-	indirectdraw
+ 	inputattachments
  	instancing
  	mesh
- 	multisampling
-@@ -170,20 +164,14 @@ set(EXAMPLES
+@@ -70,8 +64,6 @@ set(EXAMPLES
  	parallaxmapping
  	particlefire
  	pbrbasic
 -	pbribl
 -	pbrtexture
  	pipelines
+ 	pipelinestatistics
  	pushconstants
+@@ -79,15 +71,10 @@ set(EXAMPLES
  	radialblur
  	raytracing
+ 	renderheadless
 -	scenerendering
  	screenshot
 -	shadowmapping
 -	shadowmappingomni
+-	shadowmappingcascade
  	skeletalanimation
  	specializationconstants
  	sphericalenvmapping
 -	ssao
+ 	stencilbuffer
  	subpasses
  	terraintessellation
- 	tessellation
-@@ -196,7 +184,6 @@ set(EXAMPLES
+@@ -101,7 +88,6 @@ set(EXAMPLES
  	texturesparseresidency
  	triangle
  	viewportarray
@@ -87,5 +94,5 @@ index 4958fff..0f9d3e4 100644
  
  buildExamples()
 -- 
-2.13.2
+2.4.0
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-demos/0001-Fix-build-on-x86.patch b/meta/recipes-graphics/vulkan/vulkan-demos/0001-Fix-build-on-x86.patch
deleted file mode 100644
index 681b342..0000000
--- a/meta/recipes-graphics/vulkan/vulkan-demos/0001-Fix-build-on-x86.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From b0495efb6c3ea3a530fcbaddac86da57ecce5a66 Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Mon, 10 Jul 2017 13:11:12 +0300
-Subject: [PATCH] Fix build on x86
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-| func_common.inl:193:51: error: wrong number of template arguments
-| (5, should be 6) struct compute_sign<T, P, vecType, false, Aligned>
-
-The fix is backported from the upstream glm project.
-
-Upstream-Status: Pending [https://github.com/SaschaWillems/Vulkan/issues/356]
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
----
- external/glm/glm/detail/func_common.inl | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/external/glm/glm/detail/func_common.inl b/external/glm/glm/detail/func_common.inl
-index cafaed5..2dd94e1 100644
---- a/external/glm/glm/detail/func_common.inl
-+++ b/external/glm/glm/detail/func_common.inl
-@@ -190,12 +190,12 @@ namespace detail
- 
- #	if GLM_ARCH == GLM_ARCH_X86
- 	template<length_t L, typename T, precision P, template<length_t, typename, precision> class vecType, bool Aligned>
--	struct compute_sign<T, P, vecType, false, Aligned>
-+	struct compute_sign<L, T, P, vecType, false, Aligned>
- 	{
- 		GLM_FUNC_QUALIFIER static vecType<L, T, P> call(vecType<L, T, P> const & x)
- 		{
- 			T const Shift(static_cast<T>(sizeof(T) * 8 - 1));
--			vecType<L, T, P> const y(vecType<typename make_unsigned<T>::type, P>(-x) >> typename make_unsigned<T>::type(Shift));
-+			vecType<L, T, P> const y(vecType<L, typename make_unsigned<T>::type, P>(-x) >> typename make_unsigned<T>::type(Shift));
- 
- 			return (x >> Shift) | y;
- 		}
--- 
-2.1.4
-
diff --git a/meta/recipes-graphics/vulkan/vulkan-demos/0001-Support-installing-demos-support-out-of-tree-builds.patch b/meta/recipes-graphics/vulkan/vulkan-demos/0001-Support-installing-demos-support-out-of-tree-builds.patch
deleted file mode 100644
index 4addea3..0000000
--- a/meta/recipes-graphics/vulkan/vulkan-demos/0001-Support-installing-demos-support-out-of-tree-builds.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From edca667684764cfcc0460e448e834fadf623a887 Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Mon, 3 Jul 2017 14:49:18 +0300
-Subject: [PATCH] Support installing demos, support out-of-tree builds
-
-This is especially useful for cross-compile situation where testing
-happens on target.
-
--DRESOURCE_INSTALL_DIR=<path> decides where data is installed (and
-where the binaries will load the data from): if it's left empty,
-then nothing will be installed and binaries will load the data from
-CMAKE_SOURCE_DIR.
-
-Binaries are now correctly built in CMAKE_BINARY_DIR.
-
-Upstream-Status: Submitted [https://github.com/SaschaWillems/Vulkan/pull/352]
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
----
- CMakeLists.txt             | 15 ++++++++++++++-
- base/vulkanexamplebase.cpp |  2 +-
- 2 files changed, 15 insertions(+), 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index b9886bc..4958fff 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -16,6 +16,8 @@ include_directories(base)
- OPTION(USE_D2D_WSI "Build the project using Direct to Display swapchain" OFF)
- OPTION(USE_WAYLAND_WSI "Build the project using Wayland swapchain" OFF)
- 
-+set(RESOURCE_INSTALL_DIR "" CACHE PATH "Path to install resources to (leave empty for running uninstalled)")
-+
- # Use FindVulkan module added with CMAKE 3.7
- if (NOT CMAKE_VERSION VERSION_LESS 3.7.0)
- 	message(STATUS "Using module to find Vulkan")
-@@ -108,6 +110,10 @@ function(buildExample EXAMPLE_NAME)
- 		add_executable(${EXAMPLE_NAME} ${MAIN_CPP} ${SOURCE} ${SHADERS})
- 		target_link_libraries(${EXAMPLE_NAME} ${Vulkan_LIBRARY} ${ASSIMP_LIBRARIES} ${WAYLAND_CLIENT_LIBRARIES} ${CMAKE_THREAD_LIBS_INIT})
- 	endif(WIN32)
-+
-+	if(RESOURCE_INSTALL_DIR)
-+		install(TARGETS ${EXAMPLE_NAME} DESTINATION ${CMAKE_INSTALL_BINDIR})
-+	endif()
- endfunction(buildExample)
- 
- # Build all examples
-@@ -117,6 +123,13 @@ function(buildExamples)
- 	endforeach(EXAMPLE)
- endfunction(buildExamples)
- 
-+if(RESOURCE_INSTALL_DIR)
-+	add_definitions(-DVK_EXAMPLE_DATA_DIR=\"${RESOURCE_INSTALL_DIR}/\")
-+	install(DIRECTORY data/ DESTINATION ${RESOURCE_INSTALL_DIR}/)
-+else()
-+	add_definitions(-DVK_EXAMPLE_DATA_DIR=\"${CMAKE_SOURCE_DIR}/data/\")
-+endif()
-+
- # Compiler specific stuff
- IF(MSVC)
- 	SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /EHsc")
-@@ -128,7 +141,7 @@ ELSE(WIN32)
- 	link_libraries(${XCB_LIBRARIES} ${Vulkan_LIBRARY})
- ENDIF(WIN32)
- 
--set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/bin/")
-+set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin/")
- 
- set(EXAMPLES 
- 	bloom
-diff --git a/base/vulkanexamplebase.cpp b/base/vulkanexamplebase.cpp
-index 647368a..a0f28a5 100644
---- a/base/vulkanexamplebase.cpp
-+++ b/base/vulkanexamplebase.cpp
-@@ -84,7 +84,7 @@ const std::string VulkanExampleBase::getAssetPath()
- #if defined(__ANDROID__)
- 	return "";
- #else
--	return "./../data/";
-+	return VK_EXAMPLE_DATA_DIR;
- #endif
- }
- #endif
--- 
-2.13.2
-
diff --git a/meta/recipes-graphics/vulkan/vulkan-demos_git.bb b/meta/recipes-graphics/vulkan/vulkan-demos_git.bb
index 5fc9c2d..bf30c98 100644
--- a/meta/recipes-graphics/vulkan/vulkan-demos_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-demos_git.bb
@@ -3,15 +3,18 @@ LICENSE = "MIT"
 DEPENDS = "zlib"
 
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=dcf473723faabf17baa9b5f2207599d0 \
-                    file://triangle/triangle.cpp;endline=12;md5=bccd1bf9cadd9e10086cf7872157e4fa"
+                    file://examples/triangle/triangle.cpp;endline=12;md5=bccd1bf9cadd9e10086cf7872157e4fa"
+
+SRCREV_glm = "01f9ab5b6d21e5062ac0f6e0f205c7fa2ca9d769"
+SRCREV_gli = "8e43030b3e12bb58a4663d85adc5c752f89099c0"
 
 SRC_URI = "git://github.com/SaschaWillems/Vulkan.git \
-           file://0001-Support-installing-demos-support-out-of-tree-builds.patch \
+           git://github.com/g-truc/glm;destsuffix=git/external/glm;name=glm \
+           git://github.com/g-truc/gli;destsuffix=git/external/gli;name=gli \
            file://0001-Don-t-build-demos-with-questionably-licensed-data.patch \
-           file://0001-Fix-build-on-x86.patch \
 "
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "18df00c7b4677b0889486e16977857aa987947e2"
+SRCREV = "ae0b59c6e2e8630a2ae26f4a0b7a72cbe7547948"
 UPSTREAM_CHECK_GITTAGREGEX = "These are not the releases you're looking for"
 S = "${WORKDIR}/git"
 
-- 
2.4.0


