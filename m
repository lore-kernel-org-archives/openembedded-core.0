Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 63E1B71C20
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 16:18:55 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP; 08 Dec 2016 08:18:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,320,1477983600"; d="scan'208";a="40496497"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.142])
	by fmsmga006.fm.intel.com with ESMTP; 08 Dec 2016 08:18:56 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Dec 2016 10:20:40 -0600
Message-Id: <9d2ac5f7a40052a24ffcb7a0fc3ae38be09da98b.1481213961.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1481213961.git.anibal.limon@linux.intel.com>
References: <cover.1481213961.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCHv3 12/30] oeqa/core: Add README
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
X-List-Received-Date: Thu, 08 Dec 2016 16:18:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The README has an introduction and explains how to run the test suite
and creates a new Test component.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/core/README | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 meta/lib/oeqa/core/README

diff --git a/meta/lib/oeqa/core/README b/meta/lib/oeqa/core/README
new file mode 100644
index 0000000..0c859fd
--- /dev/null
+++ b/meta/lib/oeqa/core/README
@@ -0,0 +1,38 @@
+= OEQA Framework =
+
+== Introduction ==
+
+This is the new OEQA framework the base clases of the framework
+are in this module oeqa/core the subsequent components needs to
+extend this classes.
+
+A new/unique runner was created called oe-test and is under scripts/
+oe-test, this new runner scans over oeqa module searching for test
+components that supports OETestContextExecutor implemented in context
+module (i.e. oeqa/core/context.py).
+
+For execute an example:
+
+$ source oe-init-build-env
+$ oe-test core
+
+For list supported components:
+
+$ oe-test -h
+
+== Create new Test component ==
+
+Usally for add a new Test component the developer needs to extend
+OETestContext/OETestContextExecutor in context.py and OETestCase in
+case.py.
+
+== How to run the testing of the OEQA framework ==
+
+Run all tests:
+
+$ PATH=$PATH:../../ python3 -m unittest discover -s tests
+
+Run some test:
+
+$ cd tests/
+$ ./test_data.py
-- 
2.1.4


