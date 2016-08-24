Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 5B7A66FF9F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 07:13:23 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 24 Aug 2016 00:13:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,569,1464678000"; d="scan'208";a="1040620568"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga002.jf.intel.com with ESMTP; 24 Aug 2016 00:13:10 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Aug 2016 10:12:50 +0300
Message-Id: <1472022789-13028-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH 00/19] oe-build-pef-test: support saving results in a Git repo
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
X-List-Received-Date: Wed, 24 Aug 2016 07:13:24 -0000

This patchset makes it possible to store build performance test results in a
Git repository. The support is written directly in oe-build-perf-test script
which hopefully makes it easier use. The new feature is disabled by default,
and, it must be enabled with --commit-results option. Further command line
options allow customization of the branch and tag names to use for the results.

[YOCTO #9624]


The following changes since commit 25f6af8895d5f5c6dcedde0a21285d63522769c8:

  oeqa/buildiptables: Switch from netfilter.org to yoctoproject.org mirror (2016-08-23 17:59:20 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib marquiz/buildperf/git
  http://git.openembedded.org/openembedded-core-contrib/log/?h=marquiz/buildperf/git


Markus Lehtonen (19):
  oe-build-perf-test: implement --run-tests option
  oe-build-perf-test: use absolute paths in cmdline args
  oeqa.utils.git: support git commands with updated env
  oeqa.utils.git: introduce GitRepo.rev_parse()
  oeqa.utils.git: implement GitRepo.get_current_branch()
  oeqa.utils.git.GitRepo: new arg to require topdir
  oeqa.buildperf: use term commit instead of revision
  oe-build-perf-test: support committing results data to Git
  oe-build-perf-test: implement --commit-results-branch
  oeqa.utils.git: implement init() method
  oe-build-perf-test: pre-check Git repo when using --commit-results
  oe-build-perf-test: tag results committed to Git
  oe-build-perf-test: new {tag_num} keyword for --commit-results-tag
  oeqa.buildperf: add git commit count to result data
  oe-build-perf-test: add {git_commit_count} keyword for
    --commit-results-tag
  build-perf-test-wrapper.sh: parse args with getopts
  build-perf-test-wrapper.sh: allow saving results in Git
  build-perf-test-wrapper.sh: make archive dir configurable
  build-perf-test-wrapper.sh: make workdir configurable

 meta/lib/oeqa/buildperf/base.py            | 102 +++++++++++++++++++++++------
 meta/lib/oeqa/utils/git.py                 |  38 +++++++++--
 scripts/contrib/build-perf-test-wrapper.sh |  70 +++++++++++++++-----
 scripts/oe-build-perf-test                 |  51 ++++++++++++++-
 4 files changed, 218 insertions(+), 43 deletions(-)

-- 
2.6.6


