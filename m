Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9424A65CD0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 09:53:29 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 27 Apr 2015 02:53:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,656,1422950400"; d="scan'208";a="562337783"
Received: from dmoore26-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.4.219])
	by orsmga003.jf.intel.com with ESMTP; 27 Apr 2015 02:53:27 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Apr 2015 10:53:12 +0100
Message-Id: <cover.1430128109.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH v2 0/9] devtool fixes
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
X-List-Received-Date: Mon, 27 Apr 2015 09:53:31 -0000

This series rolls up some patches previously posted by Markus (with
very minor tweaks to a couple of the commit messages), and adds some
additional patches from me.

Changes since v1:
* Drop "devtool: extract: remove patches when S=WORKDIR" as it needs
  further work
* Replace Markus's oe-selftest fix with a rewritten one which avoids
  almost any dependency on the number/name of patches within the
  mtd-utils recipe (since a recent change just broke the old test
  again)
* Add a couple of fixes for update-recipe
* Touch up a couple of the commit messages


The following changes since commit 46869abf72c1c5babce49537f221d7a4f53ca820:

  oeqa/selftest/toaster: fix bad indent (2015-04-27 10:09:55 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool-fixes2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/devtool-fixes2

Markus Lehtonen (3):
  devtool: modify: use B=S if that is the default for the recipe
  devtool: modify: implement --no-same-dir
  devtool: include bbappends in recipe parsing

Paul Eggleton (6):
  oe-selftest: devtool: fix test_devtool_update_recipe_git
  devtool: handle . in recipe name
  devtool: add: use correct bbappend file name with -V option
  devtool: reset: avoid errors in case file no longer exists
  devtool: update-recipe: handle unversioned bbappends
  devtool: update-recipe: check if source tree is a git repository

 meta/lib/oe/recipeutils.py        |  10 ++--
 meta/lib/oeqa/selftest/devtool.py |  30 +++++++-----
 scripts/devtool                   |   2 +-
 scripts/lib/devtool/standard.py   | 100 +++++++++++++++++++++++++-------------
 4 files changed, 92 insertions(+), 50 deletions(-)

-- 
2.1.0


