Return-Path: <george.l.musat@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1D4EB77029
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 11:33:20 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 25 Sep 2015 04:33:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,586,1437462000"; d="scan'208";a="812764012"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 25 Sep 2015 04:33:21 -0700
Received: from localhost.localdomain (unknown [10.237.112.173])
	by linux.intel.com (Postfix) with ESMTP id B06676A4083;
	Fri, 25 Sep 2015 04:32:24 -0700 (PDT)
From: Lucian Musat <george.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Sep 2015 14:31:20 +0300
Message-Id: <1443180680-8806-1-git-send-email-george.l.musat@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oeqa/parselogs: Updated log parser whitelist.
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
X-List-Received-Date: Fri, 25 Sep 2015 11:33:22 -0000

Added some fixes for meta-intel boards and moved some
errors from specific images to common.

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 meta/lib/oeqa/runtime/parselogs.py | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/runtime/parselogs.py b/meta/lib/oeqa/runtime/parselogs.py
index e20947b..0ce9bc8 100644
--- a/meta/lib/oeqa/runtime/parselogs.py
+++ b/meta/lib/oeqa/runtime/parselogs.py
@@ -36,6 +36,8 @@ common_errors = [
     'VGA arbiter: cannot open kernel arbiter, no multi-card support',
     'Failed to find URL:http://ipv4.connman.net/online/status.html',
     'Online check failed for',
+    'netlink init failed',
+    'Fast TSC calibration',
     ]
 
 x86_common = [
@@ -46,7 +48,6 @@ x86_common = [
 ] + common_errors
 
 qemux86_common = [
-    'Fast TSC calibration', 
     'wrong ELF class',
     "fail to add MMCONFIG information, can't access extended PCI configuration space under this bridge.",
     "can't claim BAR ",
@@ -89,7 +90,7 @@ ignore_errors = {
         '(EE) open /dev/fb0: No such file or directory',
         '(EE) AIGLX: reverting to software rendering',
         ] + x86_common,
-    'core2_32' : [
+    'intel-core2-32' : [
         'ACPI: No _BQC method, cannot determine initial brightness',
         '[Firmware Bug]: ACPI: No _BQC method, cannot determine initial brightness',
         '(EE) Failed to load module "psb"',
@@ -98,6 +99,7 @@ ignore_errors = {
         '(EE) Failed to load module psbdrv',
         '(EE) open /dev/fb0: No such file or directory',
         '(EE) AIGLX: reverting to software rendering',
+        "controller can't do DEVSLP, turning off",
         ] + x86_common,
     'intel-corei7-64' : [
         "controller can't do DEVSLP, turning off",
@@ -108,13 +110,9 @@ ignore_errors = {
     'edgerouter' : [
         'Fatal server error:',
         ] + common_errors,
-    'minnow' : [
-        'netlink init failed',
-        ] + common_errors,
     'jasperforest' : [
         'Activated service \'org.bluez\' failed:',
         'Unable to find NFC netlink family',
-        'netlink init failed',
         ] + common_errors,
 }
 
-- 
2.1.4


