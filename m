Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 18FCA731D0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 May 2016 22:21:27 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP; 29 May 2016 15:21:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,386,1459839600"; d="scan'208";a="976886703"
Received: from jialelim-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.139.83])
	by fmsmga001.fm.intel.com with ESMTP; 29 May 2016 15:21:26 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 May 2016 10:20:55 +1200
Message-Id: <cover.1464560316.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 0/7] recipetool improvements
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
X-List-Received-Date: Sun, 29 May 2016 22:21:29 -0000

Make the following improvements to recipetool create (and by extension,
devtool add):
* Improve creation of recipes for binary deb/ipk/rpm package files with -b
* General supporting improvements to patch_recipe_* functions
* Set a fixed SRCREV when pointing to a git repo by default rather than
  using ${AUTOREV}


The following changes since commit bb4ead9b7b1400c37a72d148d9775bdf4210ec37:

  linux-yocto/4.4: integrate v4.4.11 (2016-05-25 07:49:55 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/recipetool-fixes2-oe
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/recipetool-fixes2-oe

Paul Eggleton (7):
  lib/oe/recipeutils: split out patch_recipe_lines()
  lib/oe/recipeutils: patch_recipe_lines: allow omitting trailing newlines
  lib/oe/recipeutils: fix insertion of variable values
  recipetool: create: support extracting SUMMARY and HOMEPAGE
  recipetool: create: extract variable values from .deb/.ipk/.rpm
  recipetool: create: use ${BP} for subdir for binary packages
  recipetool / devtool: set a fixed SRCREV by default when fetching from git

 meta/lib/oe/recipeutils.py                |  40 ++++++--
 meta/lib/oeqa/selftest/devtool.py         |   6 +-
 scripts/lib/devtool/standard.py           |   3 +
 scripts/lib/recipetool/create.py          | 165 +++++++++++++++++++++++-------
 scripts/lib/recipetool/create_buildsys.py |  37 ++++---
 scripts/lib/recipetool/create_npm.py      |   4 +-
 6 files changed, 193 insertions(+), 62 deletions(-)

-- 
2.5.5


