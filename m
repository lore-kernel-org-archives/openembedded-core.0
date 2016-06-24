Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A390E731B3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 10:37:48 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 24 Jun 2016 03:37:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,520,1459839600"; d="scan'208";a="724410328"
Received: from skenned1-mobl.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.9.142])
	by FMSMGA003.fm.intel.com with ESMTP; 24 Jun 2016 03:37:48 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jun 2016 13:37:18 +0300
Message-Id: <1466764661-24544-6-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1466764661-24544-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1466764661-24544-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 05/28] scripts: introduce oe-build-perf-test
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
X-List-Received-Date: Fri, 24 Jun 2016 10:37:48 -0000

Initial wireframe for re-writing build-perf-test.sh in Python.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/oe-build-perf-test | 51 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100755 scripts/oe-build-perf-test

diff --git a/scripts/oe-build-perf-test b/scripts/oe-build-perf-test
new file mode 100755
index 0000000..66477eb
--- /dev/null
+++ b/scripts/oe-build-perf-test
@@ -0,0 +1,51 @@
+#!/usr/bin/python3
+#
+# Build performance test script
+#
+# Copyright (c) 2016, Intel Corporation.
+#
+# This program is free software; you can redistribute it and/or modify it
+# under the terms and conditions of the GNU General Public License,
+# version 2, as published by the Free Software Foundation.
+#
+# This program is distributed in the hope it will be useful, but WITHOUT
+# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+# more details.
+#
+"""Build performance test script"""
+import argparse
+import logging
+import sys
+
+
+# Set-up logging
+LOG_FORMAT = '[%(asctime)s] %(levelname)s: %(message)s'
+logging.basicConfig(level=logging.INFO, format=LOG_FORMAT)
+log = logging.getLogger()
+
+
+def parse_args(argv):
+    """Parse command line arguments"""
+    parser = argparse.ArgumentParser(
+        formatter_class=argparse.ArgumentDefaultsHelpFormatter)
+
+    parser.add_argument('-D', '--debug', action='store_true',
+                        help='Enable debug level logging')
+
+    return parser.parse_args(argv)
+
+
+def main(argv=None):
+    """Script entry point"""
+    args = parse_args(argv)
+
+    if args.debug:
+        log.setLevel(logging.DEBUG)
+
+    return 0
+
+
+if __name__ == '__main__':
+    sys.exit(main())
+
-- 
2.6.6


