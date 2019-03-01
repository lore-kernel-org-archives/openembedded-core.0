Return-Path: <naveen.kumar.saini@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id C45507C929
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Mar 2019 05:53:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Feb 2019 21:53:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,426,1544515200"; d="scan'208";a="121734963"
Received: from optimus-prime.png.intel.com ([172.30.199.130])
	by orsmga008.jf.intel.com with ESMTP; 28 Feb 2019 21:53:28 -0800
From: Naveen Saini <naveen.kumar.saini@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Mar 2019 13:53:09 +0800
Message-Id: <20190301055309.33755-1-naveen.kumar.saini@intel.com>
X-Mailer: git-send-email 2.17.0
Subject: [PATCH] parselogs.py: ignore regulatory.db load failure messages for x86*
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
X-List-Received-Date: Fri, 01 Mar 2019 05:53:28 -0000

[YOCTO #13098]

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index e3465ea71e..d2f0f70dcf 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -136,6 +136,8 @@ ignore_errors = {
         '(EE) AIGLX: reverting to software rendering',
         'dmi: Firmware registration failed.',
         'ioremap error for 0x78',
+        'Direct firmware load for regulatory.db',
+        'failed to load regulatory.db',
         ] + x86_common,
     'intel-corei7-64' : [
         'can\'t set Max Payload Size to 256',
@@ -151,6 +153,8 @@ ignore_errors = {
         'ttyS2 - failed to request DMA',
         'Bluetooth: hci0: Failed to send firmware data (-38)',
         'atkbd serio0: Failed to enable keyboard on isa0060/serio0',
+        'Direct firmware load for regulatory.db',
+        'failed to load regulatory.db',
         ] + x86_common,
     'genericx86' : x86_common,
     'genericx86-64' : [
@@ -160,6 +164,8 @@ ignore_errors = {
         'Failed to initialize GuC',
         'Failed to load DMC firmware',
         'The driver is built-in, so to load the firmware you need to',
+        'Direct firmware load for regulatory.db',
+        'failed to load regulatory.db',
         ] + x86_common,
     'edgerouter' : [
         'not creating \'/sys/firmware/fdt\'',
-- 
2.17.0


