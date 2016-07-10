Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1D51E607A4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jul 2016 23:08:21 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 10 Jul 2016 16:08:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,343,1464678000"; d="scan'208";a="732288668"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.164.140])
	by FMSMGA003.fm.intel.com with ESMTP; 10 Jul 2016 16:08:20 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jul 2016 11:07:50 +1200
Message-Id: <cover.1468191874.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH v2 0/7] devtool/recipetool fixes
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
X-List-Received-Date: Sun, 10 Jul 2016 23:08:24 -0000

A bunch of fixes and minor improvements for devtool & recipetool.

Changes since v1:
* Have devtool return a specific error code on an incompatible recipe
  and then have devtool-stress look for this instead of having a
  hardcoded default skip list in devtool-stress
* Rebase on top of master


The following changes since commit b17f91ed06a604e3d356fe17756bfe2ca61594b7:

  tune-ppce500mc.inc: pass -mcpu=e500mc for ppce500mc kernel compile (2016-07-10 14:12:07 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool18
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/devtool18

Paul Eggleton (7):
  recipetool: create: fix handling of github URLs
  recipetool: create: support specifying a file as the local source
  lib/oe/patch: handle encoding differences in patch files
  devtool: update-recipe: fix --initial-rev option
  devtool: reset: allow reset to work if the recipe file has been deleted
  devtool: return specific exit code for incompatible recipes
  scripts/contrib/devtool-stress: skip incompatible recipes

 meta/lib/oe/patch.py              | 100 ++++++++++++++++++++++----------------
 scripts/contrib/devtool-stress.py |  57 +++++++++++++---------
 scripts/devtool                   |   2 +-
 scripts/lib/devtool/__init__.py   |   5 +-
 scripts/lib/devtool/standard.py   |  35 +++++++------
 scripts/lib/recipetool/create.py  |  17 ++++---
 6 files changed, 126 insertions(+), 90 deletions(-)

-- 
2.5.5


