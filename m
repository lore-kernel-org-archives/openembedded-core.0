Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E5BEE78816
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 14:56:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 Jan 2018 06:56:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,440,1511856000"; d="scan'208";a="170603715"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 31 Jan 2018 06:56:59 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 47A175801AC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 06:56:59 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Jan 2018 16:58:58 +0200
Message-Id: <1517410738-11104-3-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1517410738-11104-1-git-send-email-maxin.john@intel.com>
References: <1517410738-11104-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 3/3] vulkan: upgrade to version 1.0.65.2
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
X-List-Received-Date: Wed, 31 Jan 2018 14:56:59 -0000

1.0.61.1 -> 1.0.65.2

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../vulkan/{vulkan_1.0.61.1.bb => vulkan_1.0.65.2.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan_1.0.61.1.bb => vulkan_1.0.65.2.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan_1.0.61.1.bb b/meta/recipes-graphics/vulkan/vulkan_1.0.65.2.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan_1.0.61.1.bb
rename to meta/recipes-graphics/vulkan/vulkan_1.0.65.2.bb
index d88d503..1c8a895 100644
--- a/meta/recipes-graphics/vulkan/vulkan_1.0.61.1.bb
+++ b/meta/recipes-graphics/vulkan/vulkan_1.0.65.2.bb
@@ -10,10 +10,10 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=99c647ca3d4f6a4b9d8628f757aad156 \
                     file://loader/loader.c;endline=25;md5=a87cd5442291c23d1fce4eece4cfde9d"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-LoaderAndValidationLayers.git;branch=sdk-1.0.61 \
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-LoaderAndValidationLayers.git;branch=sdk-1.0.65 \
            file://demos-Don-t-build-tri-or-cube.patch \
            "
-SRCREV = "7e4888569f0f5d44efbcae94c1000fbea973c1c8"
+SRCREV = "73486a1a169d862d5210e2ad520d95319a2383fa"
 UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.4.0


