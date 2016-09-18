Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id CD2736FFED
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Sep 2016 20:08:44 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP; 18 Sep 2016 13:08:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,358,1470726000"; d="scan'208";a="1058565545"
Received: from yewyangh-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.182.139])
	by fmsmga002.fm.intel.com with ESMTP; 18 Sep 2016 13:08:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Sep 2016 08:08:03 +1200
Message-Id: <cover.1474229259.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 00/10] devtool add / recipetool create fixes
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
X-List-Received-Date: Sun, 18 Sep 2016 20:08:48 -0000

The following changes since commit d77fe838ab7631a19e90ff4226f0712e54aa4e22:

  scripts: add tool to scan for bashisms recipe shell scripts (2016-09-16 15:19:31 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/recipetool-fixes6
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/recipetool-fixes6

Paul Eggleton (10):
  recipetool: create: fix picking up name from local python source tree
  recipetool: create: improve python recipe license handling
  recipetool: create: fix name/version extraction from filename
  recipetool: create: fix error with git tree and no network
  recipetool: create: detect python autoconf macros
  recipetool: create: pick up AC_PROG_SWIG
  recipetool: create: tweak license crunching
  recipetool: create: support git short form URLs
  lib/oe/recipeutils: fix invalid character detection in validate_pn()
  devtool: add: drop superfluous validation for recipe name

 meta/lib/oe/recipeutils.py                       |  4 +-
 scripts/lib/devtool/standard.py                  |  8 +--
 scripts/lib/recipetool/create.py                 | 75 +++++++++++++++++-------
 scripts/lib/recipetool/create_buildsys.py        | 19 +++++-
 scripts/lib/recipetool/create_buildsys_python.py | 66 ++++++++++-----------
 scripts/lib/scriptutils.py                       | 13 ++++
 6 files changed, 118 insertions(+), 67 deletions(-)

-- 
2.5.5


