Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 55330731A3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 10:38:24 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 24 Jun 2016 03:38:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,520,1459839600"; d="scan'208";a="724410466"
Received: from skenned1-mobl.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.9.142])
	by FMSMGA003.fm.intel.com with ESMTP; 24 Jun 2016 03:38:24 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jun 2016 13:37:40 +0300
Message-Id: <1466764661-24544-28-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1466764661-24544-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1466764661-24544-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 27/28] oe-build-perf-test: add --out-dir command line argument
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
X-List-Received-Date: Fri, 24 Jun 2016 10:38:24 -0000

The new option defines the output directory for the test result data.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/oe-build-perf-test | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/oe-build-perf-test b/scripts/oe-build-perf-test
index 64873c9..996996b 100755
--- a/scripts/oe-build-perf-test
+++ b/scripts/oe-build-perf-test
@@ -90,6 +90,8 @@ def parse_args(argv):
     parser.add_argument('--lock-file', default='./oe-build-perf.lock',
                         metavar='FILENAME',
                         help="Lock file to use")
+    parser.add_argument('-o', '--out-dir', default='results-{date}',
+                        help="Output directory for test results")
 
     return parser.parse_args(argv)
 
@@ -113,7 +115,7 @@ def main(argv=None):
     KernelDropCaches.check()
 
     # Set-up log file
-    out_dir = 'results-{}'.format(datetime.now().strftime('%Y%m%d%H%M%S'))
+    out_dir = args.out_dir.format(date=datetime.now().strftime('%Y%m%d%H%M%S'))
     setup_file_logging(os.path.join(out_dir, 'output.log'))
 
     # Run actual tests
-- 
2.6.6


