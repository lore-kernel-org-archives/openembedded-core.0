Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id EBA55773F9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Sep 2016 17:21:18 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 05 Sep 2016 10:21:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,287,1470726000"; d="scan'208";a="1025388122"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 05 Sep 2016 10:21:17 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Sep 2016 20:21:16 +0300
Message-Id: <1473096076-21810-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH] oe-build-perf-test: fix log file path
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
X-List-Received-Date: Mon, 05 Sep 2016 17:21:19 -0000

The --log-file command line argument was slightly broken as {out_dir}
string replacement was not working as expected.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/oe-build-perf-test | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-build-perf-test b/scripts/oe-build-perf-test
index 8d7fdf2..bb5c382 100755
--- a/scripts/oe-build-perf-test
+++ b/scripts/oe-build-perf-test
@@ -131,7 +131,7 @@ def parse_args(argv):
     parser.add_argument('-o', '--out-dir', default='results-{date}',
                         type=os.path.abspath,
                         help="Output directory for test results")
-    parser.add_argument('--log-file', type=os.path.abspath,
+    parser.add_argument('--log-file',
                         default='{out_dir}/oe-build-perf-test.log',
                         help="Log file of this script")
     parser.add_argument('--run-tests', nargs='+', metavar='TEST',
-- 
2.6.6


