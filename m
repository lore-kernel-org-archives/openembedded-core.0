Return-Path: <cristina-danielax.agurida@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D0715762B4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Sep 2015 11:37:10 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 07 Sep 2015 04:37:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,484,1437462000"; d="scan'208";a="640072196"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 07 Sep 2015 04:37:10 -0700
Received: from localhost.localdomain (unknown [10.237.112.210])
	by linux.intel.com (Postfix) with ESMTP id 7B4656A4087;
	Mon,  7 Sep 2015 04:36:18 -0700 (PDT)
From: Cristina Agurida <cristina-danielax.agurida@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Sep 2015 23:51:09 +1200
Message-Id: <1441713069-15402-1-git-send-email-cristina-danielax.agurida@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oeqa/parselogs: Updated error log whitelist.
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
X-List-Received-Date: Mon, 07 Sep 2015 11:37:11 -0000

[YOCTO #7898]
[YOCTO #7760]
[YOCTO #7761]
[YOCTO #7804]

Signed-off-by: Cristina Agurida <cristina-danielax.agurida@intel.com>
---
 meta/lib/oeqa/runtime/parselogs.py | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/lib/oeqa/runtime/parselogs.py b/meta/lib/oeqa/runtime/parselogs.py
index ed43510..367ee6d 100644
--- a/meta/lib/oeqa/runtime/parselogs.py
+++ b/meta/lib/oeqa/runtime/parselogs.py
@@ -88,6 +88,7 @@ ignore_errors = {
         '(EE) AIGLX: reverting to software rendering',
         ] + x86_common,
     'core2_32' : [
+        'ACPI: No _BQC method, cannot determine initial brightness',
         '[Firmware Bug]: ACPI: No _BQC method, cannot determine initial brightness',
         '(EE) Failed to load module "psb"',
         '(EE) Failed to load module psb',
@@ -96,6 +97,14 @@ ignore_errors = {
         '(EE) open /dev/fb0: No such file or directory',
         '(EE) AIGLX: reverting to software rendering',
         ] + x86_common,
+    'intel-corei7-64' : [
+        'Failed to find URL:http://ipv4.connman.net/online/status.html',
+        'Online check failed for',
+        "controller can't do DEVSLP, turning off",
+        ] + common_errors,
+    'nuc' : [
+        '(EE) Failed to load module "fbdev"',
+        ] + common_errors,
     'crownbay' : x86_common,
     'genericx86' : x86_common,
     'genericx86-64' : x86_common,
-- 
2.1.4


