Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2BBD171B37
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2016 20:30:33 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP; 07 Dec 2016 12:30:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,315,1477983600"; d="scan'208";a="40172577"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.142])
	by fmsmga006.fm.intel.com with ESMTP; 07 Dec 2016 12:30:34 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Dec 2016 14:32:16 -0600
Message-Id: <fcd0a316dec2741d761ada06410d3b105b8e4c94.1481142664.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1481142664.git.anibal.limon@linux.intel.com>
References: <cover.1481142664.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1481142664.git.anibal.limon@linux.intel.com>
References: <cover.1481142664.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCHv2 11/32] oeqa/core/cases: Add example test cases
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
X-List-Received-Date: Wed, 07 Dec 2016 20:30:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Serves as an first input of how to the OEQA framework works.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/core/cases/__init__.py           |  0
 meta/lib/oeqa/core/cases/example/data.json     |  1 +
 meta/lib/oeqa/core/cases/example/test_basic.py | 20 ++++++++++++++++++++
 3 files changed, 21 insertions(+)
 create mode 100644 meta/lib/oeqa/core/cases/__init__.py
 create mode 100644 meta/lib/oeqa/core/cases/example/data.json
 create mode 100644 meta/lib/oeqa/core/cases/example/test_basic.py

diff --git a/meta/lib/oeqa/core/cases/__init__.py b/meta/lib/oeqa/core/cases/__init__.py
new file mode 100644
index 0000000..e69de29
diff --git a/meta/lib/oeqa/core/cases/example/data.json b/meta/lib/oeqa/core/cases/example/data.json
new file mode 100644
index 0000000..21d6b16
--- /dev/null
+++ b/meta/lib/oeqa/core/cases/example/data.json
@@ -0,0 +1 @@
+{"ARCH": "x86", "IMAGE": "core-image-minimal"}
\ No newline at end of file
diff --git a/meta/lib/oeqa/core/cases/example/test_basic.py b/meta/lib/oeqa/core/cases/example/test_basic.py
new file mode 100644
index 0000000..8b404fe
--- /dev/null
+++ b/meta/lib/oeqa/core/cases/example/test_basic.py
@@ -0,0 +1,20 @@
+# Copyright (C) 2016 Intel Corporation
+# Released under the MIT license (see COPYING.MIT)
+
+from oeqa.core.case import OETestCase
+from oeqa.core.decorator.depends import OETestDepends
+
+class OETestExample(OETestCase):
+    def test_example(self):
+        self.logger.info('IMAGE: %s' % self.d.get('IMAGE'))
+        self.assertEqual('core-image-minimal', self.d.get('IMAGE'))
+        self.logger.info('ARCH: %s' % self.d.get('ARCH'))
+        self.assertEqual('x86', self.d.get('ARCH'))
+
+class OETestExampleDepend(OETestCase):
+    @OETestDepends(['OETestExample.test_example'])
+    def test_example_depends(self):
+        pass
+
+    def test_example_no_depends(self):
+        pass
-- 
2.1.4


