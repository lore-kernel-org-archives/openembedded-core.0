Return-Path: <max.eliaser@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A361F65DEB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 21:31:55 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 19 Aug 2014 14:25:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,897,1400050800"; d="scan'208";a="560775875"
Received: from maxtothemax-studio-xps-8000.jf.intel.com ([10.7.196.68])
	by orsmga001.jf.intel.com with ESMTP; 19 Aug 2014 14:31:52 -0700
From: Max Eliaser <max.eliaser@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Aug 2014 14:29:22 -0700
Message-Id: <f1186585c1df35a69c67f79ee08901e6d1a713ee.1408483685.git.max.eliaser@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1408483685.git.max.eliaser@intel.com>
References: <cover.1408483685.git.max.eliaser@intel.com>
In-Reply-To: <cover.1408483685.git.max.eliaser@intel.com>
References: <cover.1408483685.git.max.eliaser@intel.com>
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
X-List-Received-Date: Tue, 19 Aug 2014 21:31:56 -0000

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
index 0000000..01cd37e
--- /dev/null
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-cirrus_1.5.2.bb
@@ -0,0 +1,13 @@
+require xorg-driver-video.inc
+
+SUMMARY = "X.Org X server -- cirrus display driver"
+DESCRIPTION = "cirrus is an Xorg driver for Cirrus Logic VGA adapters. These \
+devices are not so common in the wild anymore, but QEMU can emulate one, so \
+the driver is still useful."
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=6ddc7ca860dc5fd014e7f160ea699295"
+
+SRC_URI[md5sum] = "91fd6b677d62027cd3001debb587a6a6"
+SRC_URI[sha256sum] = "3361e1a65d9b84c464752fd612bdf6087622c6dd204121715366a170e5c3ccd7"
+
+DEPENDS += "libpciaccess"
-- 
1.8.3.2


