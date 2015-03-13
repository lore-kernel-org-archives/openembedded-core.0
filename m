Return-Path: <george.l.musat@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A367D71F1B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 12:56:09 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 13 Mar 2015 05:54:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,394,1422950400"; d="scan'208";a="698267578"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 13 Mar 2015 05:56:11 -0700
Received: from localhost.localdomain (unknown [10.237.112.174])
	by linux.intel.com (Postfix) with ESMTP id DDE8E300001;
	Fri, 13 Mar 2015 05:55:53 -0700 (PDT)
From: Lucian Musat <george.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Mar 2015 14:54:56 +0200
Message-Id: <1426251296-25891-1-git-send-email-george.l.musat@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] oeqa/runtime: Fixed a problem in logparser where it failed to whitelist some common errors.
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
X-List-Received-Date: Fri, 13 Mar 2015 12:56:12 -0000

And some minor tweaks like moving some errors from qemu to common.

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 meta/lib/oeqa/runtime/parselogs.py | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/runtime/parselogs.py b/meta/lib/oeqa/runtime/parselogs.py
index cf0f67c..7721912 100644
--- a/meta/lib/oeqa/runtime/parselogs.py
+++ b/meta/lib/oeqa/runtime/parselogs.py
@@ -13,8 +13,8 @@ common_errors = [
     "usbhid: probe of ",
     "_OSC failed (AE_ERROR)",
     "_OSC failed (AE_SUPPORT)",
-    "AE_ALREADY_EXISTS"
-    "ACPI _OSC request failed (AE_SUPPORT)"
+    "AE_ALREADY_EXISTS",
+    "ACPI _OSC request failed (AE_SUPPORT)",
     "can\'t disable ASPM",
     "Failed to load module \"vesa\"",
     "Failed to load module vesa",
@@ -23,6 +23,9 @@ common_errors = [
     "Failed to load module \"glx\"",
     "Failed to load module glx",
     "[drm] Cannot find any crtc or sizes - going 1024x768",
+    "_OSC failed (AE_NOT_FOUND); disabling ASPM",
+    "Open ACPI failed (/var/run/acpid.socket) (No such file or directory)",
+    "NX (Execute Disable) protection cannot be enabled: non-PAE kernel!",
     "hd.: possibly failed opcode"
     ]
 
@@ -35,8 +38,6 @@ x86_common = [
 
 qemux86_common = [
     'Fast TSC calibration', 
-    '_OSC failed (AE_NOT_FOUND); disabling ASPM',
-    'Open ACPI failed (/var/run/acpid.socket) (No such file or directory)',
     'wrong ELF class',
 ] + common_errors
 
-- 
2.1.0


