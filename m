Return-Path: <george.l.musat@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7806660670
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 15:49:19 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 10 Jun 2015 08:49:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,588,1427785200"; d="scan'208";a="585452561"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 10 Jun 2015 08:49:20 -0700
Received: from localhost.localdomain (unknown [10.237.112.173])
	by linux.intel.com (Postfix) with ESMTP id 074C06A4005;
	Wed, 10 Jun 2015 08:48:44 -0700 (PDT)
From: Lucian Musat <george.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Jun 2015 18:46:49 +0300
Message-Id: <1433951209-24764-1-git-send-email-george.l.musat@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oeqa/parselogs: Added some more errors to the whitelist.
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
X-List-Received-Date: Wed, 10 Jun 2015 15:49:20 -0000

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 meta/lib/oeqa/runtime/parselogs.py | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/runtime/parselogs.py b/meta/lib/oeqa/runtime/parselogs.py
index e641366..a9ab9a3 100644
--- a/meta/lib/oeqa/runtime/parselogs.py
+++ b/meta/lib/oeqa/runtime/parselogs.py
@@ -22,12 +22,18 @@ common_errors = [
     "Failed to load module \"modesetting\"",
     "Failed to load module modesetting",
     "Failed to load module \"glx\"",
+    "Failed to load module \"fbdev\"",
+    "Failed to load module fbdev",
     "Failed to load module glx",
     "[drm] Cannot find any crtc or sizes - going 1024x768",
     "_OSC failed (AE_NOT_FOUND); disabling ASPM",
     "Open ACPI failed (/var/run/acpid.socket) (No such file or directory)",
     "NX (Execute Disable) protection cannot be enabled: non-PAE kernel!",
-    "hd.: possibly failed opcode"
+    "hd.: possibly failed opcode",
+    'NETLINK INITIALIZATION FAILED',
+    'kernel: Cannot find map file',
+    'omap_hwmod: debugss: _wait_target_disable failed',
+    'VGA arbiter: cannot open kernel arbiter, no multi-card support',
     ]
 
 x86_common = [
@@ -64,7 +70,24 @@ ignore_errors = {
         'mmci-pl18x: probe of fpga:0b failed with error -22',
         'Failed to load module "glx"'
         ] + common_errors,
-    'emenlow' : x86_common,
+    'emenlow' : [
+        '[Firmware Bug]: ACPI: No _BQC method, cannot determine initial brightness',
+        '(EE) Failed to load module "psb"',
+        '(EE) Failed to load module psb',
+        '(EE) Failed to load module "psbdrv"',
+        '(EE) Failed to load module psbdrv',
+        '(EE) open /dev/fb0: No such file or directory',
+        '(EE) AIGLX: reverting to software rendering',
+        ] + x86_common,
+    'core2_32' : [
+        '[Firmware Bug]: ACPI: No _BQC method, cannot determine initial brightness',
+        '(EE) Failed to load module "psb"',
+        '(EE) Failed to load module psb',
+        '(EE) Failed to load module "psbdrv"',
+        '(EE) Failed to load module psbdrv',
+        '(EE) open /dev/fb0: No such file or directory',
+        '(EE) AIGLX: reverting to software rendering',
+        ] + x86_common,
     'crownbay' : x86_common,
     'genericx86' : x86_common,
     'genericx86-64' : x86_common,
@@ -73,13 +96,11 @@ ignore_errors = {
         ] + common_errors,
     'minnow' : [
         'netlink init failed',
-        'NETLINK INITIALIZATION FAILED',
         ] + common_errors,
     'jasperforest' : [
         'Activated service \'org.bluez\' failed:',
         'Unable to find NFC netlink family',
         'netlink init failed',
-        'NETLINK INITIALIZATION FAILED',
         ] + common_errors,
 }
 
-- 
2.1.4


