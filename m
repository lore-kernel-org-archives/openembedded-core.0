Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 3C54F7742C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Sep 2016 10:03:56 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga104.jf.intel.com with ESMTP; 06 Sep 2016 03:03:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,291,1470726000"; 
   d="scan'208";a="5042667"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.181.236])
	by fmsmga006.fm.intel.com with ESMTP; 06 Sep 2016 03:03:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Sep 2016 22:03:21 +1200
Message-Id: <cover.1473155977.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 0/9] devtool / recipetool fixes
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
X-List-Received-Date: Tue, 06 Sep 2016 10:03:57 -0000

Very late for M3 I know, but here are some fixes for issues I found
recently in devtool / recipetool as well as support for creating
recipes to package node.js code without using npm.


The following changes since commit 55bb6816aca39bfa25d4f7e2158a57a5f0ac1cca:

  oeqa.buildperf: correct globalres time format (2016-09-06 10:24:00 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool20-oe
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/devtool20-oe

Paul Eggleton (9):
  lib/oe/patch: handle non-UTF8 encoding when reading patches
  devtool: update-recipe: support files with subdir=
  recipetool: create: AX_PKG_SWIG should add dependency on swig-native
  recipetool: create: fix mapping python dependencies to python-dbg package
  recipetool: create: support git submodules
  recipetool: create: add --keep-temp command line option
  recipetool: create: allow license variable handling to be rerun
  recipetool: create: support node.js code outside of npm
  recipetool: create: avoid extra blank lines in output recipe

 meta/classes/npm.bbclass                         |   4 +
 meta/lib/oe/patch.py                             |  28 +++--
 meta/lib/oe/recipeutils.py                       |  12 ++-
 scripts/lib/devtool/standard.py                  |  38 ++++++-
 scripts/lib/recipetool/create.py                 | 129 +++++++++++++----------
 scripts/lib/recipetool/create_buildsys.py        |   2 +-
 scripts/lib/recipetool/create_buildsys_python.py |   4 +
 scripts/lib/recipetool/create_npm.py             | 111 ++++++++++++++++++-
 8 files changed, 258 insertions(+), 70 deletions(-)

-- 
2.5.5


