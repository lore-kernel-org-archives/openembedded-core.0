Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id B5AF377258
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2016 09:11:46 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 12 Aug 2016 02:11:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,509,1464678000"; d="scan'208";a="1024239485"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga001.fm.intel.com with ESMTP; 12 Aug 2016 02:11:33 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Aug 2016 12:11:20 +0300
Message-Id: <1470993086-23718-4-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1470993086-23718-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1470993086-23718-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 3/9] oeqa.buildperf: add BuildPerfTestLoader class
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
X-List-Received-Date: Fri, 12 Aug 2016 09:11:47 -0000

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/__init__.py | 1 +
 meta/lib/oeqa/buildperf/base.py     | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/meta/lib/oeqa/buildperf/__init__.py b/meta/lib/oeqa/buildperf/__init__.py
index add3be2..7e51726 100644
--- a/meta/lib/oeqa/buildperf/__init__.py
+++ b/meta/lib/oeqa/buildperf/__init__.py
@@ -12,6 +12,7 @@
 """Build performance tests"""
 from .base import (perf_test_case,
                    BuildPerfTestCase,
+                   BuildPerfTestLoader,
                    BuildPerfTestRunner,
                    KernelDropCaches)
 from .test_basic import *
diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index 5b4c37c..5049ba9 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -321,3 +321,8 @@ class BuildPerfTestCase(unittest.TestCase):
         os.sync()
         # Wait a bit for all the dirty blocks to be written onto disk
         time.sleep(3)
+
+
+class BuildPerfTestLoader(unittest.TestLoader):
+    """Test loader for build performance tests"""
+    sortTestMethodsUsing = None
-- 
2.6.6


