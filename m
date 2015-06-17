Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 9248B73E65
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 17:23:36 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 17 Jun 2015 10:23:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,634,1427785200"; d="scan'208";a="729357407"
Received: from apulli-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.1.212])
	by fmsmga001.fm.intel.com with ESMTP; 17 Jun 2015 10:23:35 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jun 2015 18:23:22 +0100
Message-Id: <cover.1434559829.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/5] devtool/recipetool and related fixes
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
X-List-Received-Date: Wed, 17 Jun 2015 17:23:41 -0000

A couple of fixes for errors thrown up by oe-selftest tests on one of
my machines (plus one of the autobuilders), a supporting fix for
get_bb_var(), a bugfix for externalsrc, and an improvement for
recipetool appendfile's help text.

NOTE: These have been rebased on top of Markus's devtool refactoring
branch (marquiz/devtool/refactor), so that needs to be merged first.


The following changes since commit 5a4eb3a7b6402384e05d47cb897c685c530a8c3b:

  devtool: use DevtoolError for error handling (2015-06-17 14:09:20 +0300)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool-fixes4
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/devtool-fixes4

Paul Eggleton (5):
  recipetool: appendfile: clarify help text
  recipetool: appendfile: fix file command error handling
  classes/externalsrc: handle tasks with existing lockfiles
  lib/oeqa/utils/commands: ensure get_bb_var() works when value contains =
  devtool: deploy: fix preservation of symlinks and permissions/ownership

 meta/classes/externalsrc.bbclass  |  2 +-
 meta/lib/oeqa/selftest/devtool.py | 48 +++++++++++++++++++++++++++++++++++++--
 meta/lib/oeqa/utils/commands.py   |  2 +-
 scripts/lib/devtool/__init__.py   | 16 +++++++++++++
 scripts/lib/devtool/deploy.py     | 10 +++++---
 scripts/lib/recipetool/append.py  | 18 ++++++++-------
 6 files changed, 81 insertions(+), 15 deletions(-)

-- 
2.1.0


