Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3715460797
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 19:48:39 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 29 Aug 2016 12:48:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,252,1470726000"; d="scan'208";a="872304220"
Received: from dthoumin-mobl2.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.6.138])
	by orsmga003.jf.intel.com with ESMTP; 29 Aug 2016 12:48:35 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Aug 2016 22:48:19 +0300
Message-Id: <1472500111-12358-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH 00/12] oe-build-perf-test: new format for test output data
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
X-List-Received-Date: Mon, 29 Aug 2016 19:48:40 -0000

This patchset changes the structure and format of the test output data. The
goal is to make the test result format more consolidated and easier to consume.
The major change is that the test results are stored in JSON format, in
addition to the (optional) csv-formatted "globalres file". Also, buildstats are
converted into JSON.

This patchset is based on top of the earlier "test inter-dependency removal"
patchset for oe-build-perf-test.

[YOCTO #9625]

The following changes since commit 74a62a0a9e4758de4bd2d891f9a133f028e86913:

  oe-build-perf-test: update globalres and git even if tests failed (2016-08-26 10:11:38 +0300)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib marquiz/buildperf/new-result-fmt
  http://git.openembedded.org/openembedded-core-contrib/log/?h=marquiz/buildperf/new-result-fmt


Markus Lehtonen (12):
  oeqa.buildperf: add 'product' to test result data
  oeqa.buildperf: enable json-formatted results
  oe-build-perf-test: rename log file and implement --log-file
  oeqa.buildperf: strip date from buildstats directory path
  oeqa.buildperf: separate output dir for each test
  oeqa.buildperf: rename buildstats directories
  oeqa.buildperf: don't use Gnu time
  oeqa.buildperf: measure io stat
  oeqa.buildperf: convert buildstats into json format
  oeqa.buildperf: show skipped tests in results, too
  oeqa.buildperf: include buildstats file name in results.json
  oeqa.buildperf: include commands log file name in results.json

 meta/lib/oeqa/buildperf/base.py       | 228 +++++++++++++++++++++++++++-------
 meta/lib/oeqa/buildperf/test_basic.py |   7 +-
 scripts/oe-build-perf-test            |   5 +-
 3 files changed, 190 insertions(+), 50 deletions(-)

-- 
2.6.6


