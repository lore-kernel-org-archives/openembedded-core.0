Return-Path: <george.l.musat@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9DC5D73899
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2015 12:02:34 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 Mar 2015 05:00:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,367,1422950400"; d="scan'208";a="662471710"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 09 Mar 2015 05:02:35 -0700
Received: from localhost.localdomain (unknown [10.237.112.174])
	by linux.intel.com (Postfix) with ESMTP id 2E94C300001;
	Mon,  9 Mar 2015 05:02:18 -0700 (PDT)
From: Lucian Musat <george.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Mar 2015 14:01:29 +0200
Message-Id: <1425902489-1040-1-git-send-email-george.l.musat@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] oeqa/runtime: Some new tweaks to the error log parser.
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
X-List-Received-Date: Mon, 09 Mar 2015 12:02:37 -0000

These errors keep showing up in the automated tests and should be whitelisted.

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 meta/lib/oeqa/runtime/parselogs.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/parselogs.py b/meta/lib/oeqa/runtime/parselogs.py
index b1dcc1e..97e5bb0 100644
--- a/meta/lib/oeqa/runtime/parselogs.py
+++ b/meta/lib/oeqa/runtime/parselogs.py
@@ -22,6 +22,8 @@ common_errors = [
     "Failed to load module modesetting",
     "Failed to load module \"glx\"",
     "Failed to load module glx",
+    "Open ACPI failed (/var/run/acpid.socket) (No such file or directory)",
+    "NX (Execute Disable) protection cannot be enabled: non-PAE kernel",
     "[drm] Cannot find any crtc or sizes - going 1024x768"
     ]
 
@@ -35,7 +37,6 @@ x86_common = [
 qemux86_common = [
     'Fast TSC calibration', 
     '_OSC failed (AE_NOT_FOUND); disabling ASPM',
-    'Open ACPI failed (/var/run/acpid.socket) (No such file or directory)',
     'wrong ELF class',
 ] + common_errors
 
-- 
2.1.0


