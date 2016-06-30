Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id A9DA86057B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2016 14:03:16 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 30 Jun 2016 07:02:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,552,1459839600"; d="scan'208";a="131263887"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga004.fm.intel.com with ESMTP; 30 Jun 2016 07:02:25 -0700
Message-ID: <1467295343.6738.48.camel@linux.intel.com>
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jun 2016 17:02:23 +0300
X-Mailer: Evolution 3.16.5 
Mime-Version: 1.0
Subject: [PATCH v2 00/28] Implement build performance test script in Python
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
X-List-Received-Date: Thu, 30 Jun 2016 14:03:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Second iteration of the patchset. Changes since last version:
* BuildPerfTest.force_rm() method removed and replaced by 
  oe.path.remove()
* File containing actual test cases renamed from 
  basic_tests.py -> test_basic.py

Only minor changes so I'm not re-sending the whole patchset. New
version is available in my contrib Git tree.


The following changes since commit
646c366c2566bd8dd6f73681cea9f5b021589a56:

  gst-player: upgrade to latest HEAD (2016-06-27 14:08:37 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib marquiz/build
-perf-python-rewrite
  http://git.openembedded.org/openembedded-core-contrib/log/?h=marquiz/
build-perf-python-rewrite


Markus Lehtonen (28):
      oeqa.utils.commands: Introduce get_bb_vars()
      oeqa.utils.commands: use get_bb_vars() in get_bb_var()
      oeqa.utils.commands: runCmd: gracefully handle empty output
      oeqa.utils.commands: runCmd: return stderr output, too
      scripts: introduce oe-build-perf-test
      oe-build-perf-test: add pre-run sanity check
      oe-build-perf-test: introduce oeqa.buildperf module
      oeqa.buildperf: functionality to drop kernel caches
      oeqa.buildperf: add BuildPerfTest class
      oeqa.buildperf: method for measuring system resource usage
      oeqa.buildperf: add method to log shell commands
      oeqa.buildperf: add method for measuring file disk usage
      oeqa.buildperf: add method for saving buildstats
      oeqa.buildperf: implement BuildPerfTestRunner class
      oeqa.buildperf: add test Test1P1
      oeqa.buildperf: add test Test1P2
      oeqa.buildperf: add test Test1P3
      oeqa.buildperf: add test Test2
      oeqa.buildperf: add test Test3
      oeqa.buildperf: add test Test4
      oeqa.buildperf: archive build/conf into test results
      oe-build-perf-test: enable logging into file
      oeqa.utils: add git module
      oeqa.buildperf: add git revision and branch to result data
      oe-build-perf-test: implement --globalres-file option
      oe-build-perf-test: enable locking
      oe-build-perf-test: add --out-dir command line argument
      scripts/contrib: introduce build-perf-test-wrapper.sh

 meta/lib/oeqa/buildperf/__init__.py        |  15 +++++
 meta/lib/oeqa/buildperf/base.py            | 323
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
++++++++++++++++++++++++++++++++++
 meta/lib/oeqa/buildperf/test_basic.py      | 134
++++++++++++++++++++++++++++++++++++++++++++
 meta/lib/oeqa/utils/commands.py            |  53 +++++++++++++-----
 meta/lib/oeqa/utils/git.py                 |  38 +++++++++++++
 scripts/contrib/build-perf-test-wrapper.sh | 102
+++++++++++++++++++++++++++++++++
 scripts/oe-build-perf-test                 | 133
+++++++++++++++++++++++++++++++++++++++++++
 7 files changed, 784 insertions(+), 14 deletions(-)
 create mode 100644 meta/lib/oeqa/buildperf/__init__.py
 create mode 100644 meta/lib/oeqa/buildperf/base.py
 create mode 100644 meta/lib/oeqa/buildperf/test_basic.py
 create mode 100644 meta/lib/oeqa/utils/git.py
 create mode 100755 scripts/contrib/build-perf-test-wrapper.sh
 create mode 100755 scripts/oe-build-perf-test

