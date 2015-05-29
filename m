Return-Path: <george.l.musat@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8FB3E606E8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 May 2015 11:29:53 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 29 May 2015 04:29:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,517,1427785200"; d="scan'208";a="578743524"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 29 May 2015 04:29:37 -0700
Received: from localhost.localdomain (unknown [10.237.112.174])
	by linux.intel.com (Postfix) with ESMTP id 8DB256A4005;
	Fri, 29 May 2015 04:29:03 -0700 (PDT)
From: Lucian Musat <george.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 May 2015 14:29:01 +0300
Message-Id: <1432898941-1148-1-git-send-email-george.l.musat@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oeqa/parselogs: Added another batch of errors to the whitelist.
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
X-List-Received-Date: Fri, 29 May 2015 11:29:53 -0000

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 meta/lib/oeqa/runtime/parselogs.py | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/runtime/parselogs.py b/meta/lib/oeqa/runtime/parselogs.py
index e9ccd0c..9c1b822 100644
--- a/meta/lib/oeqa/runtime/parselogs.py
+++ b/meta/lib/oeqa/runtime/parselogs.py
@@ -18,6 +18,8 @@ common_errors = [
     "can\'t disable ASPM",
     "Failed to load module \"vesa\"",
     "Failed to load module vesa",
+    "Failed to load module \"fbdev\"",
+    "Failed to load module fbdev",
     "Failed to load module \"modesetting\"",
     "Failed to load module modesetting",
     "Failed to load module \"glx\"",
@@ -26,7 +28,9 @@ common_errors = [
     "_OSC failed (AE_NOT_FOUND); disabling ASPM",
     "Open ACPI failed (/var/run/acpid.socket) (No such file or directory)",
     "NX (Execute Disable) protection cannot be enabled: non-PAE kernel!",
-    "hd.: possibly failed opcode"
+    "hd.: possibly failed opcode",
+    'NETLINK INITIALIZATION FAILED',
+    'kernel: Cannot find map file'
     ]
 
 x86_common = [
@@ -63,7 +67,12 @@ ignore_errors = {
         'mmci-pl18x: probe of fpga:0b failed with error -22',
         'Failed to load module "glx"'
         ] + common_errors,
-    'emenlow' : x86_common,
+    'emenlow' : [
+        '[Firmware Bug]: ACPI: No _BQC method, cannot determine initial brightness'
+        ] + x86_common,
+    'core2_32' : [
+        '[Firmware Bug]: ACPI: No _BQC method, cannot determine initial brightness'
+        ] + x86_common,
     'crownbay' : x86_common,
     'genericx86' : x86_common,
     'genericx86-64' : x86_common,
@@ -72,13 +81,11 @@ ignore_errors = {
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


