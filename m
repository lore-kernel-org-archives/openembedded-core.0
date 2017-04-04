Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 60A84719B1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Apr 2017 13:56:37 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 04 Apr 2017 06:56:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,275,1486454400"; d="scan'208";a="1115246884"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 04 Apr 2017 06:56:38 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Apr 2017 16:56:37 +0300
Message-Id: <20170404135637.11284-1-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH v2 0/8] Build perf test enhancements
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
X-List-Received-Date: Tue, 04 Apr 2017 13:56:44 -0000

Only change since v1 is one new patch for oe-build-perf-report-email.py.


The following changes since commit 3b7111b30dbd9a4cdd141b594164da18c15ae970:

  automake: Adjust shebang lines to remove interpreter path hardcode (2017-04-01 08:22:04 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib marquiz/buildperf/scripts
  http://git.openembedded.org/openembedded-core-contrib/log/?h=marquiz/buildperf/scripts


Markus Lehtonen (8):
  scripts/oe-build-perf-report: better guessing of args
  scripts/oe-build-perf-report: fix 'charts ready' console message
  scripts/oe-build-perf-report: fix typo
  build-perf-test-wrapper.sh: make it possible to specify Git branch
    name
  build-perf-test-wrapper.sh: correctly check test script exit status
  build-perf-test-wrapper.sh: support pushing to remote Git
  build-perf-test-wrapper.sh: support sending email reports
  oe-build-perf-report-email.py: fix one file path

 scripts/contrib/build-perf-test-wrapper.sh         | 70 +++++++++++++++++-----
 scripts/contrib/oe-build-perf-report-email.py      |  2 +-
 scripts/lib/build_perf/html/measurement_chart.html |  6 +-
 scripts/lib/build_perf/html/report.html            |  5 +-
 scripts/oe-build-perf-report                       |  4 +-
 5 files changed, 63 insertions(+), 24 deletions(-)

-- 
2.10.2


