Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 805E177011
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Apr 2016 23:34:58 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 07 Apr 2016 16:34:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,449,1455004800"; d="scan'208";a="780431303"
Received: from bitbang.jf.intel.com ([10.7.199.152])
	by orsmga003.jf.intel.com with ESMTP; 07 Apr 2016 16:34:58 -0700
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Apr 2016 16:34:48 -0700
Message-Id: <cover.1460071932.git.randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 0/5] extensible sdk changes
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
X-List-Received-Date: Thu, 07 Apr 2016 23:34:58 -0000

This set of changes is to make sure the locked signatures are enforced as
part of the extensible sdk usage.

Therefore it also allows for the unlocking of recipes that are part of the
devtool workspace.

The following changes since commit 14e2b90893f57570c2002317b5afb0e61d15e9ca:

  toasterconf.json: Add DL_DIR and SSTATE_DIR to poky toasterconf (2016-04-07 14:58:10 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib sigs
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=sigs

Randy Witt (5):
  sstatesig.py: Split single locked sigs check into multiple checks
  sstatesig.py: Improve the SIGGEN_LOCKEDSIGS_TASKSIG_CHECK message
  populate_sdk_ext.bbclass: Enable locked sigs errors
  sstatesig.py: Add a method to "unlock" recipes
  devtool: Create unlocked-sigs.inc containing items in the workspace

 meta/classes/populate_sdk_ext.bbclass | 16 +++++++--
 meta/classes/sstate.bbclass           |  8 ++++-
 meta/lib/oe/sstatesig.py              | 63 ++++++++++++++++++++++++++++-------
 meta/lib/oeqa/selftest/signing.py     |  4 +--
 scripts/devtool                       | 20 +++++++++++
 5 files changed, 94 insertions(+), 17 deletions(-)

-- 
2.5.5


