Return-Path: <valentin.popa@intel.com>
Received: from mga14.intel.com (unknown [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 0E2246AE3B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 May 2014 16:50:53 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 21 May 2014 09:46:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,880,1392192000"; d="scan'208";a="535553991"
Received: from vpopa-desktop.rb.intel.com ([10.237.105.76])
	by fmsmga001.fm.intel.com with ESMTP; 21 May 2014 09:50:28 -0700
From: Valentin Popa <valentin.popa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 May 2014 19:49:59 +0300
Message-Id: <5dbf22cbdb60170ecaef191c4fdddd05ff3aa518.1400690725.git.valentin.popa@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1400690725.git.valentin.popa@intel.com>
References: <cover.1400690725.git.valentin.popa@intel.com>
In-Reply-To: <cover.1400690725.git.valentin.popa@intel.com>
References: <cover.1400690725.git.valentin.popa@intel.com>
Subject: [PATCH 1/4] dri3proto: add it to oe-core
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
X-List-Received-Date: Wed, 21 May 2014 16:50:55 -0000

mesa 10+ depends on this (if the user builds mesa
with dri3 support enabled). So add it to oe-core.

Signed-off-by: Valentin Popa <valentin.popa@intel.com>
---
 meta/recipes-graphics/xorg-proto/dri3proto_1.0.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-proto/dri3proto_1.0.bb

diff --git a/meta/recipes-graphics/xorg-proto/dri3proto_1.0.bb b/meta/recipes-graphics/xorg-proto/dri3proto_1.0.bb
new file mode 100644
index 0000000..bed97b3
--- /dev/null
+++ b/meta/recipes-graphics/xorg-proto/dri3proto_1.0.bb
@@ -0,0 +1,14 @@
+require xorg-proto-common.inc
+
+SUMMARY = "Direct Rendering Infrastructure 3 Extension"
+
+DESCRIPTION = "The DRI3 extension provides mechanisms to translate between direct \
+rendered buffers and X pixmaps. When combined with the Present extension, \
+a complete direct rendering solution for OpenGL is provided."
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://dri3proto.h;endline=21;md5=ac90d1d416be3cb13e1d3c88cd5166bf"
+
+
+SRC_URI[md5sum] = "a3d2cbe60a9ca1bf3aea6c93c817fee3"
+SRC_URI[sha256sum] = "01be49d70200518b9a6b297131f6cc71f4ea2de17436896af153226a774fc074"
-- 
1.9.1


