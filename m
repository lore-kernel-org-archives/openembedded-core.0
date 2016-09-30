Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id CA43D6E668
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 10:06:07 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 30 Sep 2016 03:06:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,271,1473145200"; d="scan'208";a="1047864465"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga001.fm.intel.com with ESMTP; 30 Sep 2016 03:06:08 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Sep 2016 13:06:05 +0300
Message-Id: <1475229967-12685-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH 0/2] build-perf-test: improve handling of test case failures
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
X-List-Received-Date: Fri, 30 Sep 2016 10:06:12 -0000

This patchset makes build-perf-test wrapper script behave more reasonably if
some build perf test cases fail. Previously, there was no distinction between
failed test cases or more serious errors, e.g. runtime failures of
oe-build-perf-test itself. In both cases the wrapper script just exited
prematurely with an error. This patch makes the wrapper script to "tolerate"
test case failures, allowing it to display and archive the results even in
their presence.

Markus Lehtonen (2):
  oe-build-perf-test: return 2 if some tests failed
  build-perf-test-wrapper.sh: accept test case failures

 scripts/contrib/build-perf-test-wrapper.sh | 23 ++++++++++++++---------
 scripts/oe-build-perf-test                 |  2 +-
 2 files changed, 15 insertions(+), 10 deletions(-)

-- 
2.6.6


