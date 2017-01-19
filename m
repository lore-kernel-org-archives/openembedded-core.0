Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4A6696093F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 11:12:40 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 19 Jan 2017 03:12:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,253,1477983600"; d="scan'208";a="1114934234"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga002.fm.intel.com with ESMTP; 19 Jan 2017 03:12:40 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2017 13:12:28 +0200
Message-Id: <20170119111239.22506-1-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH 00/11] oeqa.buildperf: improve test report format
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
X-List-Received-Date: Thu, 19 Jan 2017 11:12:42 -0000

This patchset modifies and extends formatting of the test report produced by
the oe-build-perf-test script. It is based on my former "oeqa.utils.metadata:
update xml schema (v2)" patchset, which should be merged first.

The changes in this patchset can be divided into three parts:
1.  Enable XML reports, in a JUnit compatible format
2. Align the JSON report format with the XML schema
3. Store test environment metadata in a separate file (JSON or XML)

[YOCTO #10590]


The following changes since commit c8bd57d7cf127b5ee315597408940870882a10e0:

  oeqa.utils.metadata: include BB_NUMBER_THREADS and PARALLEL_MAKE (2017-01-13 13:55:12 +0200)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib marquiz/buildperf/xml
  http://git.openembedded.org/openembedded-core-contrib/log/?h=marquiz/buildperf/xml


Markus Lehtonen (11):
  oeqa.buildperf: prevent a crash on unexpected success
  oeqa.buildperf: sync test status names with JUnit
  oeqa.buildperf: include error details in json report
  oe-build-perf-test: enable xml reporting
  oeqa.buildperf: extend xml format to contain measurement data
  oeqa.buildperf: extend xml report format with test description
  oeqa.buildperf: report results in chronological order
  oe-build-perf-test: save test metadata in a separate file
  oe-build-perf-test: remove unused imports and fix indent
  oeqa.buildperf: change sorting in json report
  oeqa.buildperf: store measurements as a dict (object) in the JSON
    report

 meta/lib/oeqa/buildperf/base.py | 318 ++++++++++++++++++----------------------
 scripts/oe-build-perf-test      | 125 +++++++++++++++-
 2 files changed, 261 insertions(+), 182 deletions(-)

-- 
2.10.2


