Return-Path: <wu.zheng@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 327216012A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 09:56:53 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 27 Nov 2015 01:56:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,351,1444719600"; d="scan'208";a="860780125"
Received: from wzhen12-work.bj.intel.com ([10.238.135.58])
	by fmsmga002.fm.intel.com with ESMTP; 27 Nov 2015 01:56:53 -0800
From: Wu Zheng <wu.zheng@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Nov 2015 18:03:36 +0800
Message-Id: <1448618616-30204-1-git-send-email-wu.zheng@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] bluez5:upgrade bluez5 to 5.36
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
X-List-Received-Date: Fri, 27 Nov 2015 09:56:59 -0000

Bluez5-5.36 fixes the most part of bug.
The target areas of bug are such as PBAP, AVRCP, HoG and GATT.
It fixes a fairly important bug for the GATT D-Bus interfaces too.
At the same time, Bluez will cache more information of remote GATT
databases and thereby avoid unnecessary rediscovery of remote services.

Signed-off-by: Wu Zheng <wu.zheng@intel.com>
---
 meta/recipes-connectivity/bluez5/bluez5_5.33.bb | 52 -------------------------
 meta/recipes-connectivity/bluez5/bluez5_5.36.bb | 52 +++++++++++++++++++++++++
 2 files changed, 52 insertions(+), 52 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.33.bb
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.36.bb

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.33.bb b/meta/recipes-connectivity/bluez5/bluez5_5.33.bb
deleted file mode 100644
index 23c7397..0000000
--- a/meta/recipes-connectivity/bluez5/bluez5_5.33.bb
+++ /dev/null
@@ -1,52 +0,0 @@
-require bluez5.inc
-SRC_URI[md5sum] = "78782dc33d9a8b6344c4cc1af70c8a98"
-SRC_URI[sha256sum] = "1801807a13506678cbfeb15c6a4b89ecb5739efe1067eb464da6641d731436d3"
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
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.36.bb b/meta/recipes-connectivity/bluez5/bluez5_5.36.bb
new file mode 100644
index 0000000..b94ed31
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.36.bb
@@ -0,0 +1,52 @@
+require bluez5.inc
+SRC_URI[md5sum] = "9a0ee479cacc44fac68f6a65b1cd3eba"
+SRC_URI[sha256sum] = "a343ea1aeb53d3bd139087f3b1c1e1fb70db452d9762cc7a3d23e75962e578f2"
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


