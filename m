Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A412B7318A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 07:46:42 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 24 Aug 2016 00:46:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,569,1464678000"; d="scan'208";a="1030448466"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga001.fm.intel.com with ESMTP; 24 Aug 2016 00:46:42 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Aug 2016 10:46:41 +0300
Message-Id: <1472024801-15712-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH v2 0/9] oe-build-perf-test: use Python unittest framework
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
X-List-Received-Date: Wed, 24 Aug 2016 07:46:42 -0000

Patch #8, i.e. the patch suppressing logger output was too aggressive in v1 of
this patchset. We want to get most of the logger output to stderr, after all.
In v2 the logger output to stderr is only disabled during the time the tests
are being run.

Other patches are not changed (except for rebase on top of the latest master).


The following changes since commit a92c196449c516fe51786d429078bbb1213bb029:

  Allow for simultaneous do_rootfs tasks with rpm (2016-08-11 13:36:06 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib marquiz/buildperf/unittest
  http://git.openembedded.org/openembedded-core-contrib/log/?h=marquiz/buildperf/unittest


Markus Lehtonen (9):
  oeqa.buildperf: rename module containing basic tests
  oeqa.buildperf: derive BuildPerfTestCase class from unitest.TestCase
  oeqa.buildperf: add BuildPerfTestLoader class
  oeqa.buildperf: add BuildPerfTestResult class
  oeqa.buildperf: convert test cases to unittest
  oe-build-perf-test: use new unittest based framework
  oeqa.buildperf: introduce runCmd2()
  oe-build-perf-test: suppress logger output when tests are being run
  oeqa.buildperf: be more verbose about failed commands

 meta/lib/oeqa/buildperf/__init__.py    |  10 +-
 meta/lib/oeqa/buildperf/base.py        | 245 +++++++++++++++++----------------
 meta/lib/oeqa/buildperf/basic_tests.py | 133 ------------------
 meta/lib/oeqa/buildperf/test_basic.py  | 121 ++++++++++++++++
 scripts/oe-build-perf-test             |  65 ++++++---
 5 files changed, 307 insertions(+), 267 deletions(-)
 delete mode 100644 meta/lib/oeqa/buildperf/basic_tests.py
 create mode 100644 meta/lib/oeqa/buildperf/test_basic.py

-- 
2.6.6


