Return-Path: <pravin.shankarx.patil@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 7EF1F71DEE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2018 05:46:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Apr 2018 22:46:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,464,1517904000"; d="scan'208";a="221317373"
Received: from refkit.png.intel.com ([10.221.70.159])
	by fmsmga006.fm.intel.com with ESMTP; 17 Apr 2018 22:46:45 -0700
From: Pravin Patil <pravin.shankarx.patil@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Apr 2018 21:38:00 +0800
Message-Id: <1524058680-18594-1-git-send-email-pravin.shankarx.patil@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] oeqa/runtime/locales.py:added runtime test locales
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
X-List-Received-Date: Wed, 18 Apr 2018 05:46:46 -0000

    Add runtime test for locales packages to test that is it
    installed or not.

Signed-off-by: Pravin Patil <pravin.shankarx.patil@intel.com>
---
 meta/lib/oeqa/runtime/cases/locales.py | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100755 meta/lib/oeqa/runtime/cases/locales.py

diff --git a/meta/lib/oeqa/runtime/cases/locales.py b/meta/lib/oeqa/runtime/cases/locales.py
new file mode 100755
index 0000000..251bd04
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/locales.py
@@ -0,0 +1,11 @@
+import os
+
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.runtime.decorator.package import OEHasPackage
+
+class LocaleTest(OERuntimeTestCase):
+      def test_locale(self):
+        cmd = "locale -a | grep -w 'fr_FR'"
+        (status,output) = self.target.run(cmd)
+        self.assertEqual(status, 0, output)
-- 
2.7.4


