Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 58A5C7854D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 12:54:55 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP; 15 Sep 2017 05:54:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,396,1500966000"; d="scan'208";a="1014792742"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga003.jf.intel.com with ESMTP; 15 Sep 2017 05:54:56 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Sep 2017 15:54:48 +0300
Message-Id: <cover.1505479710.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.12.3
Subject: [PATCH 0/7] Fixes to oe-build-perf-report
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
X-List-Received-Date: Fri, 15 Sep 2017 12:54:56 -0000

A collection of miscellanious small fixes to scripts/oe-build-perf-report. No
changes in the output of the script, except for a more valid html syntax.


The following changes since commit d72d116e0228cc0e4391d0558b2d32c3fd5e399c:

  README.qemu: Add from meta-yocto as it belongs in core (2017-09-14 12:39:29 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib marquiz/buildperf/fixes
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=marquiz/buildperf/fixes

Markus Lehtonen (7):
  scripts/oe-build-perf-report: fix dumping buildstats
  scripts/oe-build-perf-report: add AggregateTestData class
  scripts/oe-build-perf-report: fix handling of --history-length
  scripts/oe-build-perf-report: use --hostname in --list
  scripts/oe-build-perf-report: remove dead code
  scripts/oe-build-perf-report: provide valid title in the html report
  scripts/oe-build-perf-report: tidy up html syntax

 scripts/lib/build_perf/html/report.html | 36 ++++++++++++++++++---------------
 scripts/lib/build_perf/report.py        |  5 ++++-
 scripts/oe-build-perf-report            | 33 ++++++++++++++++--------------
 3 files changed, 42 insertions(+), 32 deletions(-)

-- 
2.12.3


