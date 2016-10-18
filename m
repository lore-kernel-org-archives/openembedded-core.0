Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 6CAFA71A80
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2016 22:16:32 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga105.jf.intel.com with ESMTP; 18 Oct 2016 15:16:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,511,1473145200"; d="scan'208";a="774280003"
Received: from yuan-mobl3.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.158.98])
	by FMSMGA003.fm.intel.com with ESMTP; 18 Oct 2016 15:16:31 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Oct 2016 11:15:54 +1300
Message-Id: <cover.1476828813.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [krogoth][PATCH 00/10] Backports from master (cover letter only)
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
X-List-Received-Date: Tue, 18 Oct 2016 22:16:33 -0000

These have passed through the devtool/recipetool/bblayers oe-selftest
tests.


The following changes since commit a8f44dff13481feaa97e494a3aeafb5b63d40f3f:

  binutils: fix AR issue when opkg is unpacking IPKs containing empty entries (2016-10-06 14:09:32 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/krogoth-fixes-oe
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/krogoth-fixes-oe

Ola x Nilsson (2):
  devtool: build_image: Fix recipe filter
  devtool: Use the wildcard flag in update_recipe_patch

Paul Eggleton (8):
  devtool: update-recipe: fix --initial-rev option
  devtool: reset: allow reset to work if the recipe file has been deleted
  recipetool: create: fix handling of github URLs
  lib/oe/recipeutils: fix patch_recipe*() with empty input
  recipetool: create: fix greedy regex that broke support for github tarballs
  oe-selftest: recipetool: add tests for git URL mangling
  devtool: add: fix error message when only specifying a recipe name
  classes/externalsrc: re-run do_configure when configure files change

 meta/classes/autotools.bbclass       |  2 ++
 meta/classes/cmake.bbclass           |  2 ++
 meta/classes/externalsrc.bbclass     | 22 ++++++++++++++++++
 meta/lib/oe/recipeutils.py           |  2 +-
 meta/lib/oeqa/selftest/recipetool.py | 43 ++++++++++++++++++++++++++++++++++++
 scripts/lib/devtool/build_image.py   |  2 +-
 scripts/lib/devtool/standard.py      | 18 +++++++--------
 scripts/lib/recipetool/create.py     |  2 +-
 8 files changed, 80 insertions(+), 13 deletions(-)

-- 
2.5.5


