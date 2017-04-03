Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id C9DE877C85
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Apr 2017 15:58:39 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga104.jf.intel.com with ESMTP; 03 Apr 2017 08:58:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,271,1486454400"; d="scan'208";a="841292434"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 03 Apr 2017 08:58:40 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Apr 2017 18:58:32 +0300
Message-Id: <20170403155839.14067-1-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH 0/7] Build perf test enhancements
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
X-List-Received-Date: Mon, 03 Apr 2017 15:58:40 -0000

This patchset contains some fixes and new features to build performance tests.

The first three patches fix some minor problems in the oe-build-perf-report
script. The last four patches implement new features (plus fix one bug) to the
build perf test wrapper script - most notably adding support for pushing data
to remote git and sending test reports by email.


The following changes since commit 3b7111b30dbd9a4cdd141b594164da18c15ae970:

  automake: Adjust shebang lines to remove interpreter path hardcode (2017-04-01 08:22:04 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib marquiz/buildperf/scripts
  http://git.openembedded.org/openembedded-core-contrib/log/?h=marquiz/buildperf/scripts


Markus Lehtonen (7):
  scripts/oe-build-perf-report: better guessing of args
  scripts/oe-build-perf-report: fix 'charts ready' console message
  scripts/oe-build-perf-report: fix typo
  build-perf-test-wrapper.sh: make it possible to specify Git branch
    name
  build-perf-test-wrapper.sh: correctly check test script exit status
  build-perf-test-wrapper.sh: support pushing to remote Git
  build-perf-test-wrapper.sh: support sending email reports

 scripts/contrib/build-perf-test-wrapper.sh         | 70 +++++++++++++++++-----
 scripts/lib/build_perf/html/measurement_chart.html |  6 +-
 scripts/lib/build_perf/html/report.html            |  5 +-
 scripts/oe-build-perf-report                       |  4 +-
 4 files changed, 62 insertions(+), 23 deletions(-)

-- 
2.10.2


