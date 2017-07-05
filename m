Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A695D7782F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jul 2017 12:28:45 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Jul 2017 05:28:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,311,1496127600"; d="scan'208";a="988912737"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 05 Jul 2017 05:28:47 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 759415801CF;
	Wed,  5 Jul 2017 05:28:46 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Jul 2017 15:28:38 +0300
Message-Id: <b2b6b7edcca74bba793472f34b670d464edeff49.1499256752.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1499256752.git.jussi.kukkonen@intel.com>
References: <cover.1499256752.git.jussi.kukkonen@intel.com>
Subject: [PATCH 6/6] vulkan: RRECOMMEND mesa drivers
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
X-List-Received-Date: Wed, 05 Jul 2017 12:28:45 -0000

One less thing to remember when trying to build an image
with working vulkan.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/vulkan/vulkan_1.0.51.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/vulkan/vulkan_1.0.51.0.bb b/meta/recipes-graphics/vulkan/vulkan_1.0.51.0.bb
index fe7dac0..555d741 100644
--- a/meta/recipes-graphics/vulkan/vulkan_1.0.51.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan_1.0.51.0.bb
@@ -32,3 +32,4 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '' ,d)}
 PACKAGECONFIG[x11] = "-DBUILD_WSI_XLIB_SUPPORT=ON -DBUILD_WSI_XCB_SUPPORT=ON -DDEMOS_WSI_SELECTION=XCB, -DBUILD_WSI_XLIB_SUPPORT=OFF -DBUILD_WSI_XCB_SUPPORT=OFF -DDEMOS_WSI_SELECTION=WAYLAND, libxcb libx11 libxrandr"
 PACKAGECONFIG[wayland] = "-DBUILD_WSI_WAYLAND_SUPPORT=ON, -DBUILD_WSI_WAYLAND_SUPPORT=OFF, wayland"
 
+RRECOMMENDS_${PN} = "mesa-vulkan-drivers"
-- 
2.1.4


