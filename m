Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id BA7EB77173
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 09:39:33 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 19 Feb 2016 01:39:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,469,1449561600"; d="scan'208";a="50773644"
Received: from eyeoh10-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.132.216])
	by fmsmga004.fm.intel.com with ESMTP; 19 Feb 2016 01:39:32 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Feb 2016 22:38:48 +1300
Message-Id: <cover.1455874585.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH 00/14] devtool / recipetool improvements
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
X-List-Received-Date: Fri, 19 Feb 2016 09:39:34 -0000

More devtool / recipetool work - some improvements to the help output,
behaviour of (un)deploy-target, extensibility of autoconf/cmake
handling, and improvements to cmake dependency extraction, plus one
or two other minor fixes.


The following changes since commit 58b45240739da210ef2fecea931c8b8daa9a4c07:

  epiphany: Add libxml2-native to DEPENDS (2016-02-18 22:55:12 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool14-oe
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/devtool14-oe

Paul Eggleton (14):
  devtool: minor fix for error message
  devtool / recipetool: use common code for launching editor
  devtool: reset: fix preserving patches/other files next to recipes
  devtool: update-recipe: don't show workspace recipe warning if no update
  devtool: categorise and order subcommands in help output
  scripts/lib/argparse_oe: tweak title above options
  devtool: (un)deploy-target: add help descriptions
  devtool: sdk-update: tweak command-line handling of updateserver
  devtool: deploy-target: write deployed files list to target
  devtool: undeploy-target: support undeploying all recipes
  devtool: deploy-target: preserve existing files
  devtool: modify: tweak help description for behaviour change
  recipetool: create: add additional extension mechanisms
  recipetool: create: improve CMake package mapping

 scripts/devtool                                  |  10 +-
 scripts/lib/argparse_oe.py                       |  63 ++++++
 scripts/lib/devtool/build-image.py               |   3 +-
 scripts/lib/devtool/build.py                     |   3 +-
 scripts/lib/devtool/deploy.py                    | 248 ++++++++++++++++++-----
 scripts/lib/devtool/package.py                   |   5 +-
 scripts/lib/devtool/runqemu.py                   |   3 +-
 scripts/lib/devtool/sdk.py                       |  19 +-
 scripts/lib/devtool/search.py                    |   3 +-
 scripts/lib/devtool/standard.py                  |  47 +++--
 scripts/lib/devtool/upgrade.py                   |   3 +-
 scripts/lib/devtool/utilcmds.py                  |  19 +-
 scripts/lib/recipetool/create.py                 |  15 +-
 scripts/lib/recipetool/create_buildsys.py        | 154 ++++++++++++--
 scripts/lib/recipetool/create_buildsys_python.py |   2 +-
 scripts/lib/recipetool/newappend.py              |   8 +-
 scripts/lib/scriptutils.py                       |  15 ++
 17 files changed, 505 insertions(+), 115 deletions(-)

-- 
2.5.0


