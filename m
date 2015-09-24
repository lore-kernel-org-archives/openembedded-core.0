Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A23C473D17
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 11:53:09 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 24 Sep 2015 04:53:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,580,1437462000"; d="scan'208";a="796374443"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga001.fm.intel.com with ESMTP; 24 Sep 2015 04:53:08 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Sep 2015 14:52:57 +0300
Message-Id: <1443095587-13852-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH v3 00/10] devtool: improve handling of local source files
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
X-List-Received-Date: Thu, 24 Sep 2015 11:53:09 -0000

Third iteration of the patchset to improve handling of local source files.
Functional changes after v2:
- name of the subdirectory containing local sources in srctree is now named
  'oe-local-files'
- oe-local-files directory is not automatically committed into srctree when
  doing extract operation
- devtool update-recipe now handles adding and deleting local source files


The following changes since commit 2ad7308ee7166641eff99f3b9fe6794de143f6bc:

  oeqa/utils/qemurunner.py: Remove duplicate message on LoggingThread start (2015-09-22 18:13:02 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib marquiz/devtool/localfiles
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=marquiz/devtool/localfiles
for you to fetch changes up to 986784d368c297d3b3fc04e40dd922adcca00505:

  devtool: modify: make bitbake use local files from srctree (2015-09-24 14:29:31 +0300)

----------------------------------------------------------------
Markus Lehtonen (10):
  recipeutils: implement get_recipe_local_files()
  oe.patch.GitApplyTree: add paths argument to extractPatches
  oe-selftest: devtool: add method for checking workspace dir
  oe-selftest: devtool: add method for checking srctree repo
  oe-selftest: devtool: add method for checking repo status
  devtool: update-recipe: add new patches in correct order
  devtool: update_recipe: refactor patch generation
  devtool: file mover function that creates target dir
  devtool: better support for local source files
  devtool: modify: make bitbake use local files from srctree

 meta/lib/oe/patch.py              |   5 +-
 meta/lib/oe/recipeutils.py        |  16 ++
 meta/lib/oeqa/selftest/devtool.py | 272 +++++++++++++-----------
 scripts/lib/devtool/__init__.py   |  10 +-
 scripts/lib/devtool/standard.py   | 422 ++++++++++++++++++++++++++------------
 5 files changed, 468 insertions(+), 257 deletions(-)

-- 
2.1.4


