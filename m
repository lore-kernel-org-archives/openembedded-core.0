Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id BA35271AC8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2016 02:54:17 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga105.fm.intel.com with ESMTP; 02 Nov 2016 19:54:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,436,1473145200"; d="scan'208";a="781747447"
Received: from mdonthir-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.158.161])
	by FMSMGA003.fm.intel.com with ESMTP; 02 Nov 2016 19:54:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Nov 2016 15:53:52 +1300
Message-Id: <cover.1478141595.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 0/2] Fixes for devtool update-recipe
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
X-List-Received-Date: Thu, 03 Nov 2016 02:54:17 -0000

The following changes since commit 98c6ebf1e05158c689e01b785d32757847cdb10c:

  oeqa/selftest/kernel.py: Add new file destined for kernel related tests (2016-11-01 10:05:40 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool-update-recipe
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/devtool-update-recipe

Paul Eggleton (2):
  devtool: update-recipe: decode output before treating it as a string
  lib/oe/recipeutils: print just filename in bbappend_recipe() if in temp dir

 meta/lib/oe/recipeutils.py      | 6 +++++-
 scripts/lib/devtool/standard.py | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

-- 
2.5.5


