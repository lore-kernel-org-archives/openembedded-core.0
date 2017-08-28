Return-Path: <jussi.kukkonen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5DD5978269
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Aug 2017 12:46:48 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Aug 2017 05:46:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,441,1498546800"; d="scan'208";a="145307138"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 28 Aug 2017 05:46:50 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 2F1B7580366;
	Mon, 28 Aug 2017 05:46:48 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Aug 2017 15:46:36 +0300
Message-Id: <5111d4f7e7faf8d1825d5e8bd18beb4fb3b6ced2.1503923683.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1503923683.git.jussi.kukkonen@intel.com>
References: <cover.1503923683.git.jussi.kukkonen@intel.com>
Subject: [PATCH 2/3] vulkan: rrecommended drivers unconditionally
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
X-List-Received-Date: Mon, 28 Aug 2017 12:46:49 -0000

mesa can now build vulkan drivers without opengl: remove workaround.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/vulkan/vulkan_1.0.51.0.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan_1.0.51.0.bb b/meta/recipes-graphics/vulkan/vulkan_1.0.51.0.bb
index 1893269..9de39bc 100644
--- a/meta/recipes-graphics/vulkan/vulkan_1.0.51.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan_1.0.51.0.bb
@@ -33,5 +33,4 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '' ,d)}
 PACKAGECONFIG[x11] = "-DBUILD_WSI_XLIB_SUPPORT=ON -DBUILD_WSI_XCB_SUPPORT=ON -DDEMOS_WSI_SELECTION=XCB, -DBUILD_WSI_XLIB_SUPPORT=OFF -DBUILD_WSI_XCB_SUPPORT=OFF -DDEMOS_WSI_SELECTION=WAYLAND, libxcb libx11 libxrandr"
 PACKAGECONFIG[wayland] = "-DBUILD_WSI_WAYLAND_SUPPORT=ON, -DBUILD_WSI_WAYLAND_SUPPORT=OFF, wayland"
 
-# mesa requires opengl
-RRECOMMENDS_${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'mesa-vulkan-drivers', '', d)}"
+RRECOMMENDS_${PN} = "mesa-vulkan-drivers"
-- 
2.1.4


