Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3EB6671A49
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 04:00:15 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga103.jf.intel.com with ESMTP; 30 Oct 2016 21:00:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,573,1473145200"; d="scan'208";a="25576788"
Received: from mbi370x-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.185.81])
	by fmsmga005.fm.intel.com with ESMTP; 30 Oct 2016 21:00:14 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Oct 2016 16:59:42 +1300
Message-Id: <cover.1477886344.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 0/7] devtool/recipetool improvements
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
X-List-Received-Date: Mon, 31 Oct 2016 04:00:16 -0000

The following changes since commit b18fa5f2f2f46afc6fdc58f4d29679dea9c36c43:

  Remove LIC_FILES_CHKSUM from recipes without SRC_URI (2016-10-28 11:27:33 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool22-oe
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/devtool22-oe

Paul Eggleton (7):
  classes/license: fix handling of symlinks pointed to in LIC_FILES_CHKSUM
  devtool: add: show recipetool create output
  devtool: finish: fix error if destination layer is not in bblayers.conf
  devtool: finish: warn if moving recipe to unconfigured destination layer
  recipetool: create: separate LICENSE items with & by default
  oe-selftest: devtool: fix error message in _test_recipe_contents()
  devtool: add "rename" subcommand

 meta/classes/license.bbclass      |   2 +
 meta/lib/oeqa/selftest/devtool.py |  67 +++++++++++-
 scripts/lib/devtool/build.py      |   2 +-
 scripts/lib/devtool/standard.py   | 216 +++++++++++++++++++++++++++++++++++++-
 scripts/lib/recipetool/create.py  |  37 +++++--
 5 files changed, 307 insertions(+), 17 deletions(-)

-- 
2.5.5


