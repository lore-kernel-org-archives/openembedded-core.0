Return-Path: <kevron.m.rees@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7010360557
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 May 2015 21:37:48 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 05 May 2015 14:37:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,375,1427785200"; d="scan'208";a="566801973"
Received: from unknown (HELO tripzero-desktop.jf.intel.com) ([10.7.201.48])
	by orsmga003.jf.intel.com with ESMTP; 05 May 2015 14:37:49 -0700
From: Kevron Rees <kevron.m.rees@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 May 2015 14:37:48 -0700
Message-Id: <1430861868-8043-1-git-send-email-kevron.m.rees@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] bluez: update to 5.30
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
X-List-Received-Date: Tue, 05 May 2015 21:37:49 -0000

Signed-off-by: Kevron Rees <kevron.m.rees@intel.com>
---
 meta/recipes-connectivity/bluez5/bluez5_5.29.bb | 52 -------------------------
 meta/recipes-connectivity/bluez5/bluez5_5.30.bb | 52 +++++++++++++++++++++++++
 2 files changed, 52 insertions(+), 52 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.29.bb
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.30.bb

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.29.bb b/meta/recipes-connectivity/bluez5/bluez5_5.29.bb
deleted file mode 100644
index 0fe8e7f..0000000
--- a/meta/recipes-connectivity/bluez5/bluez5_5.29.bb
+++ /dev/null
@@ -1,52 +0,0 @@
-require bluez5.inc
-SRC_URI[md5sum] = "aa9dc91689695a486c78c131cd68673e"
-SRC_URI[sha256sum] = "df216a6d5ec6133355e5d4ed6b5e7a188a940940d337374e166758513246f0e4"
-
-# noinst programs in Makefile.tools that are conditional on READLINE
-# support
-NOINST_TOOLS_READLINE ?= " \
-    attrib/gatttool \
-    tools/obex-client-tool \
-    tools/obex-server-tool \
-    tools/bluetooth-player \
-    tools/obexctl \
-"
-
-# noinst programs in Makefile.tools that are conditional on EXPERIMENTAL
-# support
-NOINST_TOOLS_EXPERIMENTAL ?= " \
-    emulator/btvirt \
-    emulator/b1ee \
-    emulator/hfp \
-    tools/3dsp \
-    tools/mgmt-tester \
-    tools/gap-tester \
-    tools/l2cap-tester \
-    tools/sco-tester \
-    tools/smp-tester \
-    tools/hci-tester \
-    tools/rfcomm-tester \
-    tools/bdaddr \
-    tools/avinfo \
-    tools/avtest \
-    tools/scotest \
-    tools/amptest \
-    tools/hwdb \
-    tools/hcieventmask \
-    tools/hcisecfilter \
-    tools/btmgmt \
-    tools/btinfo \
-    tools/btattach \
-    tools/btsnoop \
-    tools/btproxy \
-    tools/btiotest \
-    tools/mcaptest \
-    tools/cltest \
-    tools/oobtest \
-    tools/seq2bseq \
-    tools/ibeacon \
-    tools/btgatt-client \
-    tools/btgatt-server \
-    tools/gatt-service \
-    profiles/iap/iapd \
-"
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.30.bb b/meta/recipes-connectivity/bluez5/bluez5_5.30.bb
new file mode 100644
index 0000000..0741c98
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.30.bb
@@ -0,0 +1,52 @@
+require bluez5.inc
+SRC_URI[md5sum] = "24ba1d1e8e7ef5b8f4033a3059d7600e"
+SRC_URI[sha256sum] = "1e3a4adb5a097dab83b3cf58e09c9541b815c6f33e3da972e18dfd1eb05d382c"
+
+# noinst programs in Makefile.tools that are conditional on READLINE
+# support
+NOINST_TOOLS_READLINE ?= " \
+    attrib/gatttool \
+    tools/obex-client-tool \
+    tools/obex-server-tool \
+    tools/bluetooth-player \
+    tools/obexctl \
+"
+
+# noinst programs in Makefile.tools that are conditional on EXPERIMENTAL
+# support
+NOINST_TOOLS_EXPERIMENTAL ?= " \
+    emulator/btvirt \
+    emulator/b1ee \
+    emulator/hfp \
+    tools/3dsp \
+    tools/mgmt-tester \
+    tools/gap-tester \
+    tools/l2cap-tester \
+    tools/sco-tester \
+    tools/smp-tester \
+    tools/hci-tester \
+    tools/rfcomm-tester \
+    tools/bdaddr \
+    tools/avinfo \
+    tools/avtest \
+    tools/scotest \
+    tools/amptest \
+    tools/hwdb \
+    tools/hcieventmask \
+    tools/hcisecfilter \
+    tools/btmgmt \
+    tools/btinfo \
+    tools/btattach \
+    tools/btsnoop \
+    tools/btproxy \
+    tools/btiotest \
+    tools/mcaptest \
+    tools/cltest \
+    tools/oobtest \
+    tools/seq2bseq \
+    tools/ibeacon \
+    tools/btgatt-client \
+    tools/btgatt-server \
+    tools/gatt-service \
+    profiles/iap/iapd \
+"
-- 
2.1.4


