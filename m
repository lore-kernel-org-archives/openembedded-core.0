Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id F3F1778336
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 23:54:56 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Aug 2017 16:54:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,450,1498546800"; d="scan'208";a="146494352"
Received: from ekooi-mobl5.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.141.249])
	by fmsmga006.fm.intel.com with ESMTP; 30 Aug 2017 16:54:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Aug 2017 11:54:04 +1200
Message-Id: <cover.1504137086.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
Subject: [PATCH 00/13] devtool / recipetool fixes
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
X-List-Received-Date: Wed, 30 Aug 2017 23:54:57 -0000

Some fixes for devtool / recipetool issues, along with a couple of
related changes to the oe-selftest tests. I have run the oe-selftest
tests for devtool and recipetool and they pass with these changes
applied.

NOTE: this patchset depends upon the bitbake patchset I just sent to the
bitbake-devel list.


The following changes since commit 62f1122ef166eba56441d669c6b3b3fe5f367418:

  bluez5: cosmetic fixes to bluetooth bootscript (2017-08-30 11:13:52 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool29-oe
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/devtool29-oe

Paul Eggleton (12):
  devtool: update-recipe: ensure patches get deleted in srcrev mode
  devtool: upgrade: fix handling of non-absolute paths
  devtool: upgrade: workaround for recipes which apply patches conditional upon class
  devtool: edit-recipe: fix regression
  oe-selftest: devtool: test find-recipe and edit-recipe
  devtool: add: add explicit srcrev/branch options
  recipetool: create: make recently added branch/tag handling git specific
  recipetool: create: fix SRCPV prefix for non-git SCMs
  recipetool: create: suppress npm shrinkwrap/lockdown warnings again
  recipetool: create: detect Eclipse licenses
  oe-selftest: tinfoil: add a test for variable history
  scriptutils: fix fetch_url() to use lowercase dummy recipe name

paul (1):
  devtool: upgrade: check that user has configured git properly

 meta/lib/oe/recipeutils.py              | 43 +++++++++++++++++++++++-------
 meta/lib/oeqa/selftest/cases/devtool.py | 25 ++++++++++++------
 meta/lib/oeqa/selftest/cases/tinfoil.py | 34 ++++++++++++++++++++++++
 scripts/lib/devtool/standard.py         | 20 +++++++++++---
 scripts/lib/devtool/upgrade.py          | 32 ++++++++++++++++++++--
 scripts/lib/devtool/utilcmds.py         | 15 ++++++++---
 scripts/lib/recipetool/create.py        | 47 ++++++++++++++++++++++++++++-----
 scripts/lib/scriptutils.py              |  2 +-
 8 files changed, 183 insertions(+), 35 deletions(-)

-- 
2.9.5


