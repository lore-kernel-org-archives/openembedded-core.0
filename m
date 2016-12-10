Return-Path: <california.l.sullivan@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id CD40A71985
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Dec 2016 01:00:27 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 Dec 2016 17:00:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,325,1477983600"; d="scan'208";a="1070280352"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga001.jf.intel.com with ESMTP; 09 Dec 2016 17:00:28 -0800
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Dec 2016 17:00:27 -0800
Message-Id: <1481331627-12315-1-git-send-email-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 1/1] parselogs.py: Don't clog QA with Joule errors
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
X-List-Received-Date: Sat, 10 Dec 2016 01:00:27 -0000

The Joule is very new hardware and there is ongoing kernel and firmware
work to fix these issues, which will be available in future kernel and
firmware releases. In the meantime, don't clog QA reports.

[YOCTO #10611]

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 meta/lib/oeqa/runtime/parselogs.py | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/parselogs.py b/meta/lib/oeqa/runtime/parselogs.py
index aa5008b..3e1c7d0 100644
--- a/meta/lib/oeqa/runtime/parselogs.py
+++ b/meta/lib/oeqa/runtime/parselogs.py
@@ -134,7 +134,19 @@ ignore_errors = {
         'dmi: Firmware registration failed.',
         'ioremap error for 0x78',
         ] + x86_common,
-    'intel-corei7-64' : x86_common,
+    'intel-corei7-64' : [
+        'can\'t set Max Payload Size to 256',
+        'intel_punit_ipc: can\'t request region for resource',
+        '[drm] parse error at position 4 in video mode \'efifb\'',
+        'ACPI Error: Could not enable RealTimeClock event',
+        'ACPI Warning: Could not enable fixed event - RealTimeClock',
+        'hci_intel INT33E1:00: Unable to retrieve gpio',
+        'hci_intel: probe of INT33E1:00 failed',
+        'can\'t derive routing for PCI INT A',
+        'failed to read out thermal zone',
+        'Bluetooth: hci0: Setting Intel event mask failed',
+        'ttyS2 - failed to request DMA',
+        ] + x86_common,
     'crownbay' : x86_common,
     'genericx86' : x86_common,
     'genericx86-64' : [
-- 
2.5.5


