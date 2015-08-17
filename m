Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 00CA5606E8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 11:23:10 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 17 Aug 2015 04:23:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,694,1432623600"; d="scan'208";a="626925800"
Received: from jwanrooi-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.11.216])
	by orsmga003.jf.intel.com with ESMTP; 17 Aug 2015 04:23:10 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Aug 2015 12:23:02 +0100
Message-Id: <cover.1439810551.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/4] devtool fixes
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
X-List-Received-Date: Mon, 17 Aug 2015 11:23:11 -0000

Three bugfixes for devtool plus one refactoring patch to improve a
related function in the recipeutils module.


The following changes since commit 059db140885bad379534e6ec713f3ceb4e18faea:

  adt-installer: use DEPLOY_DIR in ANT_DEPLOY expansion (2015-08-16 17:28:14 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool-fixes5
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/devtool-fixes5

Paul Eggleton (4):
  devtool: extract: prevent externalsrc from interfering with extraction
  devtool: extract: remove patches subdirectory when S == WORKDIR
  devtool: fix handling of BBCLASSEXTENDed recipes
  lib/oe/recipeutils: avoid parsing in get_var_files()

 meta/lib/oe/recipeutils.py        |  3 +--
 meta/lib/oeqa/selftest/devtool.py | 30 ++++++++++++++++++++++++++++++
 scripts/devtool                   | 12 ++++++------
 scripts/lib/devtool/standard.py   | 29 +++++++++++++++++------------
 4 files changed, 54 insertions(+), 20 deletions(-)

-- 
2.1.0


