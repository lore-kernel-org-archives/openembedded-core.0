Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id AAB4A7317D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 14:49:53 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 03 May 2016 07:49:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,572,1455004800"; d="scan'208";a="696140389"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 03 May 2016 07:49:56 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 0026E6A4006
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 08:37:28 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 May 2016 17:49:44 +0300
Message-Id: <1462286989-22848-6-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1462286989-22848-1-git-send-email-maxin.john@intel.com>
References: <1462286989-22848-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 05/10] bluez5: upgrade to 5.39
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
X-List-Received-Date: Tue, 03 May 2016 14:49:53 -0000

5.37 -> 5.39

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-connectivity/bluez5/bluez5_5.37.bb | 55 -------------------------
 meta/recipes-connectivity/bluez5/bluez5_5.39.bb | 55 +++++++++++++++++++++++++
 2 files changed, 55 insertions(+), 55 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.37.bb
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.39.bb

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.37.bb b/meta/recipes-connectivity/bluez5/bluez5_5.37.bb
deleted file mode 100644
index db20f79..0000000
--- a/meta/recipes-connectivity/bluez5/bluez5_5.37.bb
+++ /dev/null
@@ -1,55 +0,0 @@
-require bluez5.inc
-
-REQUIRED_DISTRO_FEATURES = "bluez5"
-
-SRC_URI[md5sum] = "33177e5743e24b2b3738f72be64e3ffb"
-SRC_URI[sha256sum] = "c14ba9ddcb0055522073477b8fd8bf1ddf5d219e75fdfd4699b7e0ce5350d6b0"
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
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.39.bb b/meta/recipes-connectivity/bluez5/bluez5_5.39.bb
new file mode 100644
index 0000000..57ebbf9
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.39.bb
@@ -0,0 +1,55 @@
+require bluez5.inc
+
+REQUIRED_DISTRO_FEATURES = "bluez5"
+
+SRC_URI[md5sum] = "c0c2b8d1151c7538bf3ae7bfc78aa912"
+SRC_URI[sha256sum] = "21d1bc9150d3576296595217efb98a746b592389d25d5637e8bee5da7272593b"
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
2.4.0


