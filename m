Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4E945766F3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 10:05:44 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 23 Sep 2015 03:05:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,577,1437462000"; d="scan'208";a="795471339"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.252.4.127])
	by fmsmga001.fm.intel.com with ESMTP; 23 Sep 2015 03:05:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Sep 2015 11:05:22 +0100
Message-Id: <cover.1443002672.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH v2 0/3] devtool fixes
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
X-List-Received-Date: Wed, 23 Sep 2015 10:05:48 -0000

A couple of patches Markus previously sent rebased on top of master
(also applicable on top of poky master-next) to fix some minor issues in
devtool, plus one minor optimisation from me.


The following changes since commit 2ad7308ee7166641eff99f3b9fe6794de143f6bc:

  oeqa/utils/qemurunner.py: Remove duplicate message on LoggingThread start (2015-09-22 18:13:02 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool-fixes6
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/devtool-fixes6

Markus Lehtonen (2):
  devtool: second fix for running from a different directory
  devtool: upgrade: use shutil.move instead of os.rename

Paul Eggleton (1):
  devtool: runqemu: avoid recipe parse

 scripts/devtool                    |  5 +----
 scripts/lib/devtool/__init__.py    |  6 +++++-
 scripts/lib/devtool/build-image.py |  2 +-
 scripts/lib/devtool/deploy.py      |  2 +-
 scripts/lib/devtool/package.py     |  2 +-
 scripts/lib/devtool/runqemu.py     |  2 +-
 scripts/lib/devtool/search.py      |  2 +-
 scripts/lib/devtool/standard.py    | 10 +++++-----
 scripts/lib/devtool/upgrade.py     |  4 ++--
 9 files changed, 18 insertions(+), 17 deletions(-)

-- 
2.1.0


