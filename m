Return-Path: <humberto.ibarra.lopez@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 98AB6731F9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 16:57:39 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 11 Mar 2016 08:57:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,321,1455004800"; d="scan'208";a="931869099"
Received: from humberto-desktop.zpn.intel.com ([10.219.5.162])
	by orsmga002.jf.intel.com with ESMTP; 11 Mar 2016 08:57:10 -0800
From: humberto.ibarra.lopez@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Mar 2016 10:54:03 -0600
Message-Id: <1457715243-5033-1-git-send-email-humberto.ibarra.lopez@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] scripts/oe-selftest: Add short names to most common options
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
X-List-Received-Date: Fri, 11 Mar 2016 16:57:40 -0000

From: Humberto Ibarra <humberto.ibarra.lopez@intel.com>

Add short names to most common options in oe-selftest. The options
changed were --run-tests, --run-all-tests, --list-tests and
--list-modules.

[Yocto #9079]

Signed-off-by: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
---
 scripts/oe-selftest | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index de98a6c..f13b1bd 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -73,9 +73,9 @@ def get_args_parser():
     description = "Script that runs unit tests agains bitbake and other Yocto related tools. The goal is to validate tools functionality and metadata integrity. Refer to https://wiki.yoctoproject.org/wiki/Oe-selftest for more information."
     parser = argparse_oe.ArgumentParser(description=description)
     group = parser.add_mutually_exclusive_group(required=True)
-    group.add_argument('--run-tests', required=False, action='store', nargs='*', dest="run_tests", default=None, help='Select what tests to run (modules, classes or test methods). Format should be: <module>.<class>.<test_method>')
-    group.add_argument('--run-all-tests', required=False, action="store_true", dest="run_all_tests", default=False, help='Run all (unhidden) tests')
-    group.add_argument('--list-modules', required=False, action="store_true", dest="list_modules", default=False, help='List all available test modules.')
+    group.add_argument('-r', '--run-tests', required=False, action='store', nargs='*', dest="run_tests", default=None, help='Select what tests to run (modules, classes or test methods). Format should be: <module>.<class>.<test_method>')
+    group.add_argument('-a', '--run-all-tests', required=False, action="store_true", dest="run_all_tests", default=False, help='Run all (unhidden) tests')
+    group.add_argument('-m', '--list-modules', required=False, action="store_true", dest="list_modules", default=False, help='List all available test modules.')
     group.add_argument('--list-classes', required=False, action="store_true", dest="list_allclasses", default=False, help='List all available test classes.')
     parser.add_argument('--coverage', action="store_true", help="Run code coverage when testing")
     parser.add_argument('--coverage-source', dest="coverage_source", nargs="+", help="Specifiy the directories to take coverage from")
@@ -85,7 +85,7 @@ def get_args_parser():
                        help='run-tests-by <name|class|module|id|tag> <list of tests|classes|modules|ids|tags>')
     group.add_argument('--list-tests-by', required=False, dest='list_tests_by', default=False, nargs='*',
                        help='list-tests-by <name|class|module|id|tag> <list of tests|classes|modules|ids|tags>')
-    group.add_argument('--list-tests', required=False,  action="store_true", dest="list_tests", default=False,
+    group.add_argument('-l', '--list-tests', required=False,  action="store_true", dest="list_tests", default=False,
                        help='List all available tests.')
     group.add_argument('--list-tags', required=False, dest='list_tags', default=False, action="store_true",
                        help='List all tags that have been set to test cases.')
-- 
1.9.1


