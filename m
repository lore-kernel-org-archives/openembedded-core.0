Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 58D8371C14
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 11:18:46 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 May 2017 04:18:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,344,1491289200"; d="scan'208";a="86877665"
Received: from bkearns-mobl.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.10.90])
	by orsmga002.jf.intel.com with ESMTP; 15 May 2017 04:18:46 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 May 2017 14:18:40 +0300
Message-Id: <cover.1494846894.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.12.0
Subject: [PATCH 0/5] Enhancements to build perf reporting
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
X-List-Received-Date: Mon, 15 May 2017 11:18:47 -0000

This patchset contains a bug fix and two new features for the
oe-build-perf-report script. There's also a patch to to the buildstats-diff
script for analyzing the JSON-based buildstats from build performance test
reports.

The following changes since commit c59fa3bd71b42410bf032846ee8fdb6e6eb1b95c:

  python*-git: Upgrade to version 2.1.3 (2017-05-12 08:49:30 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib marquiz/fixes-11355
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=marquiz/fixes-11355

Markus Lehtonen (5):
  oeqa.utils.git: use --verify in rev_parse()
  oe-build-perf-report: use correct x-axis max value in html charts
  oe-build-perf-report: two verbosity levels for --list
  oe-build-perf-report: implement --dump-buildstats
  scripts/buildstats-diff: support optimized rusage values

 meta/lib/oeqa/utils/git.py   |  2 +-
 scripts/buildstats-diff      | 20 +++++++--
 scripts/oe-build-perf-report | 96 +++++++++++++++++++++++++++++++++++++-------
 3 files changed, 99 insertions(+), 19 deletions(-)

-- 
2.12.0


