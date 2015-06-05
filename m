Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 402856AC43
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jun 2015 15:04:18 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 05 Jun 2015 08:04:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,559,1427785200"; d="scan'208";a="737750489"
Received: from gzdancew-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.5.87])
	by fmsmga002.fm.intel.com with ESMTP; 05 Jun 2015 08:04:19 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jun 2015 16:03:14 +0100
Message-Id: <cover.1433516373.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [fido][PATCH 00/13] devtool backports for fido (cover letter only)
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
X-List-Received-Date: Fri, 05 Jun 2015 15:04:21 -0000

Some fixes for devtool in fido. The oe-selftest tests all pass with
these applied.

The following changes since commit b266977372f2d5704d00dd07b29ea49898ebf70e:

  combo-layer: handle unset dest_dir in sanity_check() (2015-05-29 13:00:52 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool-fido
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/devtool-fido

Markus Lehtonen (4):
  devtool: call parse_recipe with correct arguments
  devtool: modify: use B=S if that is the default for the recipe
  devtool: modify: implement --no-same-dir
  devtool: include bbappends in recipe parsing

Paul Eggleton (9):
  devtool: handle . in recipe name
  devtool: add: use correct bbappend file name with -V option
  devtool: update-recipe: handle unversioned bbappends
  devtool: update-recipe: check if source tree is a git repository
  recipetool: avoid second-level subdir when extracting
  recipetool: ensure git clone is standalone when extracting
  devtool: fix build env command execution error handling
  devtool: if workspace layer exists, still ensure it's in bblayers.conf
  oe-selftest: devtool: add a proper test to see if tap devices exist

 meta/lib/oe/recipeutils.py        |  10 +--
 meta/lib/oeqa/selftest/devtool.py |  14 ++++-
 scripts/devtool                   |  38 +++++++-----
 scripts/lib/devtool/__init__.py   |   9 ++-
 scripts/lib/devtool/standard.py   | 126 ++++++++++++++++++++++++--------------
 scripts/lib/recipetool/create.py  |  15 +++--
 scripts/lib/scriptutils.py        |  11 ++++
 7 files changed, 148 insertions(+), 75 deletions(-)

-- 
2.1.0


