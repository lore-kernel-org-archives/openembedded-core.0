Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4EF8E77E8C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 15:38:51 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Oct 2017 08:38:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,361,1503385200"; d="scan'208";a="1180945819"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 11 Oct 2017 08:38:51 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Oct 2017 18:34:21 +0300
Message-Id: <d1814cc209de699179d78af794882a97220cf0a8.1507735448.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
References: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 29/50] vulkan: update to 1.0.61.1
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
X-List-Received-Date: Wed, 11 Oct 2017 15:38:51 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../vulkan/{vulkan_1.0.51.0.bb => vulkan_1.0.61.1.bb}               | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan_1.0.51.0.bb => vulkan_1.0.61.1.bb} (94%)

diff --git a/meta/recipes-graphics/vulkan/vulkan_1.0.51.0.bb b/meta/recipes-graphics/vulkan/vulkan_1.0.61.1.bb
similarity index 94%
rename from meta/recipes-graphics/vulkan/vulkan_1.0.51.0.bb
rename to meta/recipes-graphics/vulkan/vulkan_1.0.61.1.bb
index 9de39bc095f..d88d50303c0 100644
--- a/meta/recipes-graphics/vulkan/vulkan_1.0.51.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan_1.0.61.1.bb
@@ -10,10 +10,10 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=99c647ca3d4f6a4b9d8628f757aad156 \
                     file://loader/loader.c;endline=25;md5=a87cd5442291c23d1fce4eece4cfde9d"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-LoaderAndValidationLayers.git;branch=sdk-1.0.51 \
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-LoaderAndValidationLayers.git;branch=sdk-1.0.61 \
            file://demos-Don-t-build-tri-or-cube.patch \
-"
-SRCREV = "8d021e4d5a9f91436f4462df1dafb222908e296d"
+           "
+SRCREV = "7e4888569f0f5d44efbcae94c1000fbea973c1c8"
 UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.14.1


