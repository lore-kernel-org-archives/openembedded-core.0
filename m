Return-Path: <cristina-danielax.agurida@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 9EA2B76104
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Sep 2015 16:31:12 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 07 Sep 2015 09:31:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,485,1437462000"; d="scan'208";a="799532070"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 07 Sep 2015 09:31:12 -0700
Received: from localhost.localdomain (unknown [10.237.112.210])
	by linux.intel.com (Postfix) with ESMTP id D80646A4005;
	Mon,  7 Sep 2015 09:30:19 -0700 (PDT)
From: Cristina Agurida <cristina-danielax.agurida@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Sep 2015 04:45:10 +1200
Message-Id: <1441730710-611-1-git-send-email-cristina-danielax.agurida@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH v2] oeqa/parselogs: Updated log error whitelist.
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
X-List-Received-Date: Mon, 07 Sep 2015 16:31:13 -0000

[YOCTO #7898]
[YOCTO #7761]
[YOCTO #7804]

Signed-off-by: Cristina Agurida <cristina-danielax.agurida@intel.com>
---
 meta/lib/oeqa/runtime/parselogs.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/lib/oeqa/runtime/parselogs.py b/meta/lib/oeqa/runtime/parselogs.py
index ed43510..e20947b 100644
--- a/meta/lib/oeqa/runtime/parselogs.py
+++ b/meta/lib/oeqa/runtime/parselogs.py
@@ -34,6 +34,8 @@ common_errors = [
     'kernel: Cannot find map file',
     'omap_hwmod: debugss: _wait_target_disable failed',
     'VGA arbiter: cannot open kernel arbiter, no multi-card support',
+    'Failed to find URL:http://ipv4.connman.net/online/status.html',
+    'Online check failed for',
     ]
 
 x86_common = [
@@ -88,6 +90,7 @@ ignore_errors = {
         '(EE) AIGLX: reverting to software rendering',
         ] + x86_common,
     'core2_32' : [
+        'ACPI: No _BQC method, cannot determine initial brightness',
         '[Firmware Bug]: ACPI: No _BQC method, cannot determine initial brightness',
         '(EE) Failed to load module "psb"',
         '(EE) Failed to load module psb',
@@ -96,6 +99,9 @@ ignore_errors = {
         '(EE) open /dev/fb0: No such file or directory',
         '(EE) AIGLX: reverting to software rendering',
         ] + x86_common,
+    'intel-corei7-64' : [
+        "controller can't do DEVSLP, turning off",
+        ] + common_errors,
     'crownbay' : x86_common,
     'genericx86' : x86_common,
     'genericx86-64' : x86_common,
-- 
2.1.4


