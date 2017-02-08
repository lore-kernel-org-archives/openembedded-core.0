Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 7A9C671C3D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 14:15:45 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 08 Feb 2017 06:15:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,346,1477983600"; d="scan'208";a="1092332134"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 08 Feb 2017 06:15:43 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Feb 2017 16:15:36 +0200
Message-Id: <20170208141542.13484-1-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH 0/6] Implement scripts/oe-git-archive
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
X-List-Received-Date: Wed, 08 Feb 2017 14:15:46 -0000

This patchset implements a helper script for committing data to git and pushing
it into an upstream repository. The new script re-uses some code from
oe-build-perf-test script (the code is eventually removed from
oe-build-perf-test in the last patch). The script supports flexible
(pattern-based) tag and branch naming, and, similarly flexible commit and tag
messages. It is also able to directly work with (local) bare repositories.

The first four patches implement the new script. The last two patches takes the
script in use in build performance testing scripts.

[YOCTO #10582]


The following changes since commit 68da6c98841f4450736ae170e443aa744c8b77eb:

  oeqa/selftest/pkgdata: use m4 instead of bash (2017-02-07 14:48:56 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib marquiz/fixes-10582
  http://git.openembedded.org/openembedded-core-contrib/log/?h=marquiz/fixes-10582


Markus Lehtonen (6):
  oeqa.utils.git: add git_dir property
  scripts: Implement oe-git-archive
  oeqa.utils.git: support bare repos
  scripts/oe-git-archive: support creating bare repositories
  build-perf-test-wrapper.sh: use oe-git-archive
  oe-build-perf-test: drop --commit-results

 meta/lib/oeqa/utils/git.py                 |  20 ++-
 scripts/contrib/build-perf-test-wrapper.sh |  18 ++-
 scripts/oe-build-perf-test                 | 104 ------------
 scripts/oe-git-archive                     | 247 +++++++++++++++++++++++++++++
 4 files changed, 275 insertions(+), 114 deletions(-)
 create mode 100755 scripts/oe-git-archive

-- 
2.10.2


