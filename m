Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A434F6AC24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 16:19:07 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 23 Apr 2015 09:18:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,632,1422950400"; d="scan'208";a="484753669"
Received: from kreynold-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.25.159])
	by FMSMGA003.fm.intel.com with ESMTP; 23 Apr 2015 09:18:40 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Apr 2015 17:18:23 +0100
Message-Id: <cover.1429805738.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/8] devtool fixes
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
X-List-Received-Date: Thu, 23 Apr 2015 16:19:08 -0000

This series rolls up 5 patches previously posted by Markus (with very
minor tweaks to a couple of the commit messages), and adds three new
patches from me.


The following changes since commit 166f2587468ae71988c610858aad3f7ef67eccba:

  bison: don't depend on help2man (2015-04-21 11:29:30 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool-fixes2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/devtool-fixes2

Markus Lehtonen (5):
  devtool: modify: use B=S if that is the default for the recipe
  devtool: modify: implement --no-same-dir
  oe-selftest: devtool: fix update-recipe test after bd1aa28
  devtool: extract: remove patches when S=WORKDIR
  devtool: include bbappends in recipe parsing

Paul Eggleton (3):
  devtool: handle . in recipe name
  devtool: add: use correct bbappend file name with -V option
  devtool: reset: avoid errors in case file no longer exists

 meta/lib/oe/recipeutils.py        | 10 ++---
 meta/lib/oeqa/selftest/devtool.py | 15 +++++--
 scripts/devtool                   |  2 +-
 scripts/lib/devtool/standard.py   | 90 ++++++++++++++++++++++++++++++---------
 4 files changed, 86 insertions(+), 31 deletions(-)

-- 
2.1.0


