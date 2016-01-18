Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 33CD960621
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 11:19:04 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 18 Jan 2016 03:19:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,312,1449561600"; d="scan'208";a="635439931"
Received: from stan94-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.180.176])
	by FMSMGA003.fm.intel.com with ESMTP; 18 Jan 2016 03:19:02 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2016 00:18:25 +1300
Message-Id: <cover.1453115842.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH 00/10] Improve recipetool metadata extraction
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
X-List-Received-Date: Mon, 18 Jan 2016 11:19:07 -0000

Improve the ability for recipetool create (or devtool add, which uses the
former) to extract dependencies from source trees, as well as a couple of
other related fixes.


The following changes since commit a42229df424552955c0ac62da1063461f97f5938:

  openssh: CVE-2016-1907 (2016-01-17 11:32:21 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/recipetool-fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/recipetool-fixes

Paul Eggleton (10):
  recipetool: create: improve extraction of pkg-config / lib deps
  recipetool: create: pick up boost macros in configure.ac
  recipetool: create: detect flex/bison dependency
  recipetool: create: support additional autoconf macros from autoconf-archive
  recipetool: create: fix overzealous mapping of git URLs
  recipetool: create: move dependency mapping code to RecipeHandler
  recipetool: create: force GL libraries to virtual/*
  recipetool: create: add basic support for extracting dependencies from cmake
  recipetool: create: add a couple more license checksums
  oe-selftest: devtool: fix test_devtool_add_library if python was built first

 meta/lib/oeqa/selftest/devtool.py         |  12 +-
 meta/lib/oeqa/selftest/recipetool.py      |  21 +-
 scripts/lib/recipetool/create.py          | 149 ++++++++++++-
 scripts/lib/recipetool/create_buildsys.py | 340 +++++++++++++++++++++++-------
 4 files changed, 432 insertions(+), 90 deletions(-)

-- 
2.5.0


