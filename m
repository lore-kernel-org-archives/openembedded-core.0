Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RVl0K-0000H7-KD
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 15:19:20 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 30 Nov 2011 06:12:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,597,1315206000"; d="scan'208";a="80652015"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.50])
	by azsmga001.ch.intel.com with ESMTP; 30 Nov 2011 06:12:39 -0800
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2011 22:12:32 +0800
Message-Id: <05e28e6a8cd5c930a0c538121ced79d008f0fdf3.1322662245.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1322662245.git.dexuan.cui@intel.com>
References: <cover.1322662245.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1322662245.git.dexuan.cui@intel.com>
References: <cover.1322662245.git.dexuan.cui@intel.com>
Subject: [PATCH 6/8] xcb-util: upgrade from 0.3.6 to 0.3.8
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Nov 2011 14:19:20 -0000

updated LIC_FILES_CHKSUM since the code was re-organized, but the license
remains the same.

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 meta/recipes-graphics/xcb/xcb-util_0.3.6.bb |   18 ------------------
 meta/recipes-graphics/xcb/xcb-util_0.3.8.bb |    9 +++++++++
 2 files changed, 9 insertions(+), 18 deletions(-)
 delete mode 100644 meta/recipes-graphics/xcb/xcb-util_0.3.6.bb
 create mode 100644 meta/recipes-graphics/xcb/xcb-util_0.3.8.bb

diff --git a/meta/recipes-graphics/xcb/xcb-util_0.3.6.bb b/meta/recipes-graphics/xcb/xcb-util_0.3.6.bb
deleted file mode 100644
index 1057b34..0000000
--- a/meta/recipes-graphics/xcb/xcb-util_0.3.6.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-require xcb-util.inc
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://xcb-util-common.h;endline=30;md5=6c74595925fd773cc8cf387ff7bc53c7 \
-                    file://reply/reply.c;endline=27;md5=f9a1d6b55bba632d349949cbf33cd635 \
-                    file://aux/xcb_aux.c;endline=30;md5=ae305b9c2a38f9ba27060191046a6460 \
-                    file://renderutil/xcb_renderutil.h;endline=24;md5=d0ddab3052dd4949c93cfcb0891c96df \
-                    file://event/xcb_event.h;endline=27;md5=627be355aee59e1b8ade80d5bd90fad9 \
-                    file://property/xcb_property.h;endline=27;md5=f5890866ee0c655c36ef1c6c738fee6b \
-                    file://keysyms/keysyms.c;endline=30;md5=2f8de023ed823bb92f0b47900574ea9e \
-                    file://image/xcb_pixel.h;beginline=4;endline=27;md5=48cd25ae55e7de525fe1e1a3a7672e1c"
-
-
-PR = "r0"
-
-
-SRC_URI[md5sum] = "dd8968b8ee613cb027a8ef1fcbdc8fc9"
-SRC_URI[sha256sum] = "ffb8ee11ab015858a970ab7edd56bd2436b281657596561d8429d4a90df60e57"
diff --git a/meta/recipes-graphics/xcb/xcb-util_0.3.8.bb b/meta/recipes-graphics/xcb/xcb-util_0.3.8.bb
new file mode 100644
index 0000000..b7eff29
--- /dev/null
+++ b/meta/recipes-graphics/xcb/xcb-util_0.3.8.bb
@@ -0,0 +1,9 @@
+require xcb-util.inc
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://src/xcb_aux.c;endline=30;md5=ae305b9c2a38f9ba27060191046a6460 \
+                    file://src/xcb_event.h;endline=27;md5=627be355aee59e1b8ade80d5bd90fad9"
+PR = "r0"
+
+SRC_URI[md5sum] = "8ce019c4bbf20dce246b98f177cfccff"
+SRC_URI[sha256sum] = "c1eed9284750bc09352e60654df77bb585dbbe7673fdcc675e58b7f3a0b447b9"
-- 
1.7.6



