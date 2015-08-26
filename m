Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id AB30F734B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 15:49:47 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 26 Aug 2015 08:49:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,416,1437462000"; d="scan'208";a="548961132"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by FMSMGA003.fm.intel.com with ESMTP; 26 Aug 2015 08:49:47 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Aug 2015 07:43:22 +0000
Message-Id: <cover.1440574631.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH v2 0/1] devtool: upgrade feature
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
X-List-Received-Date: Wed, 26 Aug 2015 15:49:49 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Complete RE-IMPLEMENTATION since v1. This patch does not use any of the 
auto-upgrade-helper code [1] and the reason is that this code needs
some (i.e. use the oe.recipeutils module, auh touchs tracked recipes, etc.)
work before it can be reused into the devtool framework. Instead
of AUH, the recipetool script is used to get the new checksums. 
Bugzilla Tracking page is [2]

[1] http://git.yoctoproject.org/cgit/cgit.cgi/auto-upgrade-helper/
[2] https://bugzilla.yoctoproject.org/show_bug.cgi?id=7642

The following changes since commit 645435a645a0817cec94ce1433eb74fbe7388416:

  bitbake: toastergui: Added IDs to elements used in testing (2015-08-17 08:48:28 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lsandov1/devtool-upgrade
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lsandov1/devtool-upgrade

Leonardo Sandoval (2):
  devtool: upgrade feature
  oeqa/selftest: new tests for devtool upgrage feature

 meta/lib/oeqa/selftest/devtool.py |  36 +++++
 scripts/lib/devtool/standard.py   |   4 +-
 scripts/lib/devtool/upgrade.py    | 314 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 353 insertions(+), 1 deletion(-)
 create mode 100644 scripts/lib/devtool/upgrade.py

-- 
1.8.4.5


