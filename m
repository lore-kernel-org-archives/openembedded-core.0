Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 21B8C7FA47
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Dec 2019 18:09:58 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id f129so8259599wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Dec 2019 10:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6Huf5YQpxbqg2+duCe4v9a4YUnTl+5MKd5hcPVYIRoY=;
	b=Uij9yUyVJG0/EK7+vElfYyYDkximeU0l41lfHaVfhjl9krMX5vEboPOzqZLGqEmlmB
	nMgd8BKBNGiQQbaDPPxwJxip1n/ykXZeHrujqSD3BZ2oBgaE9qew8qNXKbLZITTepDCq
	gCF8WC8q54tpCrzr0XEJrZx5B5SyOzI1ro7TF6uzoCHMLMycnoR8XeYbcv2PXo8aWME/
	7Cfn9W45EhFKQOMLTVWqdbiKbbvgqhWHZt/tIWC6U/arIb95AbVwYzG4xEHngFnOTYTv
	NQaH4xgplav6/slgN2kdcIH8S5CENnJVgdjEjd92O3kSG4i4IZR22ad1qCyAhL7YJRtb
	gFLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6Huf5YQpxbqg2+duCe4v9a4YUnTl+5MKd5hcPVYIRoY=;
	b=dAnv3VGQmc2DIhSMB++9rw+dnvcfnW/gS0jGV3P11HcGM0MMzEMlsirzQm9ZmHVwVl
	qUwDCxQ9NzzMxibIj20CeVf7VyMoveJXj739ddc8tkkEoOxTGAdAtKynOZ86T67PJPgf
	XtVybGWEvEcqIjGzVvc8ldgdiV2iisKugMNZRc0kXnBb4q95KH8x9F0+SRZgDyXt8Fwe
	4dT3yXhP+VwmDPLXKeIkoT5572cN1iCDzMQU1BCyqkEj3nt6Di7DJhyZasllXMDMAbay
	X94HDnCNINPribZI6oBnWO0pkTl8tYjdgj8+vCFb7HAOnUQao/473QUV9ZxgVM6I3Kmb
	je2w==
X-Gm-Message-State: APjAAAXe2OZRxaJGRCCPPsu+7YrU5PlgaDeXMO7Q35QzKx82K0EmV4br
	RywaXji5v726yOBAsHIrdQhexgV2
X-Google-Smtp-Source: APXvYqxFlMGUYkCr5+Q24TqdJ7cmu4IcVgMroBfX9mxLV+j9cwr+BJV4Lb94lz5hVfWzcxnrDiBj+A==
X-Received: by 2002:a1c:99d4:: with SMTP id
	b203mr12179964wme.169.1575655798729; 
	Fri, 06 Dec 2019 10:09:58 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	v14sm17011347wrm.28.2019.12.06.10.09.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Dec 2019 10:09:58 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Dec 2019 19:09:42 +0100
Message-Id: <20191206180949.59953-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191206180949.59953-1-alex.kanavin@gmail.com>
References: <20191206180949.59953-1-alex.kanavin@gmail.com>
Subject: [PATCH 03/10] vulkan-demos: update to latest revision
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
X-List-Received-Date: Fri, 06 Dec 2019 18:09:58 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...emos-with-questionably-licensed-data.patch | 21 ++++++++-----------
 .../vulkan/vulkan-demos_git.bb                | 10 ++++-----
 2 files changed, 14 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-demos/0001-Don-t-build-demos-with-questionably-licensed-data.patch b/meta/recipes-graphics/vulkan/vulkan-demos/0001-Don-t-build-demos-with-questionably-licensed-data.patch
index 93bcfbf8513..76240610f58 100644
--- a/meta/recipes-graphics/vulkan/vulkan-demos/0001-Don-t-build-demos-with-questionably-licensed-data.patch
+++ b/meta/recipes-graphics/vulkan/vulkan-demos/0001-Don-t-build-demos-with-questionably-licensed-data.patch
@@ -1,4 +1,4 @@
-From 0a27144d43b70121f57f6036514d069ca9d2b971 Mon Sep 17 00:00:00 2001
+From 0cbf9c9831f773e0da66209be9a6ff28d57c2321 Mon Sep 17 00:00:00 2001
 From: "Maxin B. John" <maxin.john@intel.com>
 Date: Mon, 30 Jul 2018 17:23:29 +0300
 Subject: [PATCH] Don't build demos with questionably licensed data
@@ -33,16 +33,17 @@ Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Signed-off-by: Maxin B. John <maxin.john@intel.com>
+
 ---
  examples/CMakeLists.txt | 14 --------------
  1 file changed, 14 deletions(-)
 
 diff --git a/examples/CMakeLists.txt b/examples/CMakeLists.txt
-index 8eee3a4..698d3b3 100644
+index e07918c..08b6e23 100644
 --- a/examples/CMakeLists.txt
 +++ b/examples/CMakeLists.txt
-@@ -47,18 +47,12 @@ set(EXAMPLES
- 	computeshader
+@@ -55,18 +55,12 @@ set(EXAMPLES
+ 	conditionalrender
  	conservativeraster
  	debugmarker
 -	deferred
@@ -57,10 +58,10 @@ index 8eee3a4..698d3b3 100644
 -	hdr
 -	imgui
 -	indirectdraw
+ 	inlineuniformblocks
  	inputattachments
  	instancing
- 	mesh
-@@ -70,8 +64,6 @@ set(EXAMPLES
+@@ -83,23 +77,16 @@ set(EXAMPLES
  	parallaxmapping
  	particlefire
  	pbrbasic
@@ -69,9 +70,8 @@ index 8eee3a4..698d3b3 100644
  	pipelines
  	pipelinestatistics
  	pushconstants
-@@ -79,15 +71,10 @@ set(EXAMPLES
+ 	pushdescriptors
  	radialblur
- 	raytracing
  	renderheadless
 -	scenerendering
  	screenshot
@@ -85,7 +85,7 @@ index 8eee3a4..698d3b3 100644
  	stencilbuffer
  	subpasses
  	terraintessellation
-@@ -101,7 +88,6 @@ set(EXAMPLES
+@@ -113,7 +100,6 @@ set(EXAMPLES
  	texturesparseresidency
  	triangle
  	viewportarray
@@ -93,6 +93,3 @@ index 8eee3a4..698d3b3 100644
  )
  
  buildExamples()
--- 
-2.4.0
-
diff --git a/meta/recipes-graphics/vulkan/vulkan-demos_git.bb b/meta/recipes-graphics/vulkan/vulkan-demos_git.bb
index 74dc2ad6793..c94e768b527 100644
--- a/meta/recipes-graphics/vulkan/vulkan-demos_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-demos_git.bb
@@ -5,23 +5,23 @@ DEPENDS = "zlib"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=dcf473723faabf17baa9b5f2207599d0 \
                     file://examples/triangle/triangle.cpp;endline=12;md5=bccd1bf9cadd9e10086cf7872157e4fa"
 
-SRCREV_glm = "01f9ab5b6d21e5062ac0f6e0f205c7fa2ca9d769"
-SRCREV_gli = "8e43030b3e12bb58a4663d85adc5c752f89099c0"
+SRCREV_glm = "1ad55c5016339b83b7eec98c31007e0aee57d2bf"
+SRCREV_gli = "7da5f50931225e9819a26d5cb323c5f42da50bcd"
 
 SRC_URI = "git://github.com/SaschaWillems/Vulkan.git \
            git://github.com/g-truc/glm;destsuffix=git/external/glm;name=glm \
            git://github.com/g-truc/gli;destsuffix=git/external/gli;name=gli \
            file://0001-Don-t-build-demos-with-questionably-licensed-data.patch \
-"
+           "
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "ae0b59c6e2e8630a2ae26f4a0b7a72cbe7547948"
+SRCREV = "6d63dc32c320a49be0a56c365151c8f2f176bc59"
 UPSTREAM_CHECK_GITTAGREGEX = "These are not the releases you're looking for"
 S = "${WORKDIR}/git"
 
 REQUIRED_DISTRO_FEATURES = 'vulkan'
 
 inherit cmake features_check
-DEPENDS = "vulkan-loader assimp"
+DEPENDS = "vulkan-loader assimp wayland-protocols wayland-native"
 
 do_install_append () {
     # Remove assets that have uncertain licenses
-- 
2.17.1


