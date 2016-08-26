Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id AE1FD6FF60
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 07:33:12 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 26 Aug 2016 00:33:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,580,1464678000"; d="scan'208";a="1020615506"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 26 Aug 2016 00:33:12 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2016 10:33:07 +0300
Message-Id: <1472196791-24336-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH 0/4] oe-build-perf-test: remove inter-dependencies of tests
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
X-List-Received-Date: Fri, 26 Aug 2016 07:33:14 -0000

This patchset gets rid of the dependencies between tests. This should make the
results coherent even if some tests fail, and, make it practical to run only a
subset of tests with --run-tests.


The following changes since commit 00027aee12f4bbc9a4ba607c91fcc1e0e8257fa2:

  core-image-kernel-dev.bb: Standardize use of _append and leading space. (2016-08-25 23:03:26 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib marquiz/buildperf/isolate-tests
  http://git.openembedded.org/openembedded-core-contrib/log/?h=marquiz/buildperf/isolate-tests


Markus Lehtonen (4):
  oeqa.buildperf: fix checking of invalid results
  oeqa.buildperf: make tests independent
  oeqa.buildperf: treat failed measurements as errors
  oe-build-perf-test: update globalres and git even if tests failed

 meta/lib/oeqa/buildperf/base.py       | 45 ++++++++++++++++-------------------
 meta/lib/oeqa/buildperf/test_basic.py | 10 +++++---
 scripts/oe-build-perf-test            | 12 +++++-----
 3 files changed, 34 insertions(+), 33 deletions(-)

-- 
2.6.6


