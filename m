Return-Path: <max.eliaser@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 79F6970276
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Aug 2014 20:34:10 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 07 Aug 2014 13:34:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,820,1400050800"; d="scan'208";a="555365114"
Received: from maxtothemax-studio-xps-8000.jf.intel.com ([10.7.196.63])
	by orsmga001.jf.intel.com with ESMTP; 07 Aug 2014 13:33:45 -0700
From: Max Eliaser <max.eliaser@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Aug 2014 13:31:32 -0700
Message-Id: <67c3a9199068f3e3b0f9061a8fb765f64b2ee7fd.1407443396.git.max.eliaser@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1407443396.git.max.eliaser@intel.com>
References: <cover.1407443396.git.max.eliaser@intel.com>
In-Reply-To: <cover.1407443396.git.max.eliaser@intel.com>
References: <cover.1407443396.git.max.eliaser@intel.com>
Subject: [PATCH 1/3] xorg-drivers: xf86-video-cirrus: add a recipe for the Cirrus Logic X.Org driver
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
X-List-Received-Date: Thu, 07 Aug 2014 20:34:13 -0000

This driver allows X.Org to use the Cirrus Logic family of VGA adapters. Since
QEMU can emulate a Cirrus VGA adapter, this driver will be of use for images
that are expected to run under QEMU, if QEMU's other VGA adapters are
unavailable.

Signed-off-by: Max Eliaser <max.eliaser@intel.com>
---
 .../recipes-graphics/xorg-driver/xf86-video-cirrus_1.5.2.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-cirrus_1.5.2.bb

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-cirrus_1.5.2.bb b/meta/recipes-graphics/xorg-driver/xf86-video-cirrus_1.5.2.bb
new file mode 100644
index 0000000..f110522
--- /dev/null
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-cirrus_1.5.2.bb
@@ -0,0 +1,13 @@
+require xorg-driver-video.inc
+
+SUMMARY = "X.Org X server -- cirrus display driver"
+DESCRIPTION = "cirrus is an Xorg driver for Cirrus Logic VGA adapters. These \
+devices are not so common in the wild anymore, QEMU can emulate one, so the \
+driver is still useful."
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=6ddc7ca860dc5fd014e7f160ea699295"
+
+SRC_URI[md5sum] = "91fd6b677d62027cd3001debb587a6a6"
+SRC_URI[sha256sum] = "3361e1a65d9b84c464752fd612bdf6087622c6dd204121715366a170e5c3ccd7"
+
+DEPENDS_${PN} = "virtual/libx11"
-- 
1.8.3.2


