Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 79C2E71AFA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 11:12:49 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 19 Jan 2017 03:12:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,253,1477983600"; d="scan'208";a="1114934273"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga002.fm.intel.com with ESMTP; 19 Jan 2017 03:12:49 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2017 13:12:37 +0200
Message-Id: <20170119111239.22506-10-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170119111239.22506-1-markus.lehtonen@linux.intel.com>
References: <20170119111239.22506-1-markus.lehtonen@linux.intel.com>
Subject: [PATCH 09/11] oe-build-perf-test: remove unused imports and fix indent
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
X-List-Received-Date: Thu, 19 Jan 2017 11:12:49 -0000

[YOCTO #10590]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/base.py | 7 ++-----
 scripts/oe-build-perf-test      | 1 -
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index 4027fdb..f6faedb 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -10,16 +10,13 @@
 # more details.
 #
 """Build performance test base classes and functionality"""
-import glob
 import json
 import logging
 import os
 import re
 import resource
-import shutil
 import socket
 import time
-import traceback
 import unittest
 import xml.etree.ElementTree as ET
 from datetime import datetime, timedelta
@@ -506,5 +503,5 @@ class BuildPerfTestRunner(unittest.TextTestRunner):
         self.out_dir = out_dir
 
     def _makeResult(self):
-       return BuildPerfTestResult(self.out_dir, self.stream, self.descriptions,
-                                  self.verbosity)
+        return BuildPerfTestResult(self.out_dir, self.stream, self.descriptions,
+                                   self.verbosity)
diff --git a/scripts/oe-build-perf-test b/scripts/oe-build-perf-test
index fc4ab31..f3867ab 100755
--- a/scripts/oe-build-perf-test
+++ b/scripts/oe-build-perf-test
@@ -23,7 +23,6 @@ import os
 import re
 import shutil
 import sys
-import unittest
 from datetime import datetime
 
 sys.path.insert(0, os.path.dirname(os.path.realpath(__file__)) + '/lib')
-- 
2.10.2


