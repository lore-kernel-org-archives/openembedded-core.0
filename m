Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 106E4724B9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 14:50:38 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 03 Jun 2015 07:50:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,547,1427785200"; d="scan'208";a="704663439"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 03 Jun 2015 07:50:34 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Jun 2015 17:50:25 +0300
Message-Id: <1433343032-4559-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH v2 0/7] devtool: improve handling of local source files
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
X-List-Received-Date: Wed, 03 Jun 2015 14:50:42 -0000

Second version of my patchset aiming to improve handling of local source files.
The only significant change since the first version is the addition of unit
tests.

The following changes since commit 968973d55d4b33e1a929ed4cdf9387fcaba2d93f:

  qt4: unconditionally disable gstreamer 0.10 support in qt webkit (2015-05-30 22:25:12 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib marquiz/devtool/localfiles
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=marquiz/devtool/localfiles

Markus Lehtonen (7):
  recipeutils: implement get_recipe_local_files()
  oe.patch.GitApplyTree: add paths argument to extractPatches
  oe-selftest: devtool: add method for checking workspace dir
  oe-selftest: devtool: add method for checking srctree repo
  devtool: update-recipe: update local files directly
  devtool: extract: always import local files to srctree
  devtool: modify: make bitbake use local files from srctree

 meta/lib/oe/patch.py              |   5 +-
 meta/lib/oe/recipeutils.py        |   8 ++
 meta/lib/oeqa/selftest/devtool.py | 204 +++++++++++++++++++++++++-------------
 scripts/lib/devtool/standard.py   |  93 +++++++++++++++--
 4 files changed, 231 insertions(+), 79 deletions(-)

-- 
2.1.4


