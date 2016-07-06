Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E91B960123
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jul 2016 23:57:37 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 06 Jul 2016 16:57:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,322,1464678000"; d="scan'208";a="1016966557"
Received: from lynhueyo-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.176.219])
	by fmsmga002.fm.intel.com with ESMTP; 06 Jul 2016 16:57:32 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jul 2016 11:57:06 +1200
Message-Id: <cover.1467849364.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 0/6] devtool/recipetool fixes
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
X-List-Received-Date: Wed, 06 Jul 2016 23:57:38 -0000

A bunch of fixes and minor improvements for devtool & recipetool.


The following changes since commit 53fcfe4348a2ca727844f2b0bd3fca2902cbdda0:

  lib/oeqa: add Galculator to SDK and runtime tests (2016-07-01 16:08:54 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool18
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/devtool18

Paul Eggleton (6):
  recipetool: create: fix handling of github URLs
  recipetool: create: support specifying a file as the local source
  lib/oe/patch: handle encoding differences in patch files
  devtool: update-recipe: fix --initial-rev option
  devtool: reset: allow reset to work if the recipe file has been deleted
  scripts/contrib/devtool-stress: exclude more recipes by default

 meta/lib/oe/patch.py              | 100 ++++++++++++++++++++++----------------
 scripts/contrib/devtool-stress.py |   2 +-
 scripts/lib/devtool/standard.py   |  19 ++++----
 scripts/lib/recipetool/create.py  |  17 ++++---
 4 files changed, 79 insertions(+), 59 deletions(-)

-- 
2.5.5


