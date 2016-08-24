Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 1F519731A5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 07:13:24 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 24 Aug 2016 00:13:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,569,1464678000"; d="scan'208";a="1040620582"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga002.jf.intel.com with ESMTP; 24 Aug 2016 00:13:12 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Aug 2016 10:12:52 +0300
Message-Id: <1472022789-13028-3-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1472022789-13028-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1472022789-13028-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 02/19] oe-build-perf-test: use absolute paths in cmdline args
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
X-List-Received-Date: Wed, 24 Aug 2016 07:13:25 -0000

This is safer as the current working directory may change.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/oe-build-perf-test | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/oe-build-perf-test b/scripts/oe-build-perf-test
index 808531e..21759c6 100755
--- a/scripts/oe-build-perf-test
+++ b/scripts/oe-build-perf-test
@@ -99,11 +99,13 @@ def parse_args(argv):
     parser.add_argument('-D', '--debug', action='store_true',
                         help='Enable debug level logging')
     parser.add_argument('--globalres-file',
+                        type=os.path.abspath,
                         help="Append results to 'globalres' csv file")
     parser.add_argument('--lock-file', default='./oe-build-perf.lock',
-                        metavar='FILENAME',
+                        metavar='FILENAME', type=os.path.abspath,
                         help="Lock file to use")
     parser.add_argument('-o', '--out-dir', default='results-{date}',
+                        type=os.path.abspath,
                         help="Output directory for test results")
     parser.add_argument('--run-tests', nargs='+', metavar='TEST',
                         help="List of tests to run")
-- 
2.6.6


