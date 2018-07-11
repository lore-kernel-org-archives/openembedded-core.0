Return-Path: <anuj.mittal@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 43A247714D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2018 05:20:52 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Jul 2018 22:20:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,337,1526367600"; d="scan'208";a="73846345"
Received: from anmitta2-mobl1.png.intel.com ([10.221.18.92])
	by orsmga002.jf.intel.com with ESMTP; 10 Jul 2018 22:20:52 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jul 2018 13:20:48 +0800
Message-Id: <20180711052048.21207-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] oeqa/parselogs: remove references to BSPs that no longer exist
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
X-List-Received-Date: Wed, 11 Jul 2018 05:20:52 -0000

These platform specifc BSPs were removed from meta-intel and superseded by
intel-core* BSPs.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index ba1bb71f22..f0bcd168c6 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -123,15 +123,6 @@ ignore_errors = {
         'dmi: Firmware registration failed.',
         'irq: type mismatch, failed to map hwirq-27 for /intc',
         ] + common_errors,
-    'emenlow' : [
-        '[Firmware Bug]: ACPI: No _BQC method, cannot determine initial brightness',
-        '(EE) Failed to load module "psb"',
-        '(EE) Failed to load module psb',
-        '(EE) Failed to load module "psbdrv"',
-        '(EE) Failed to load module psbdrv',
-        '(EE) open /dev/fb0: No such file or directory',
-        '(EE) AIGLX: reverting to software rendering',
-        ] + x86_common,
     'intel-core2-32' : [
         'ACPI: No _BQC method, cannot determine initial brightness',
         '[Firmware Bug]: ACPI: No _BQC method, cannot determine initial brightness',
@@ -159,7 +150,6 @@ ignore_errors = {
         'Bluetooth: hci0: Failed to send firmware data (-38)',
         'atkbd serio0: Failed to enable keyboard on isa0060/serio0',
         ] + x86_common,
-    'crownbay' : x86_common,
     'genericx86' : x86_common,
     'genericx86-64' : [
         'Direct firmware load for i915',
@@ -172,10 +162,6 @@ ignore_errors = {
     'edgerouter' : [
         'Fatal server error:',
         ] + common_errors,
-    'jasperforest' : [
-        'Activated service \'org.bluez\' failed:',
-        'Unable to find NFC netlink family',
-        ] + common_errors,
 }
 
 log_locations = ["/var/log/","/var/log/dmesg", "/tmp/dmesg_output.log"]
-- 
2.17.1


