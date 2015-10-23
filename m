Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id AD4817570D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Oct 2015 03:30:28 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 22 Oct 2015 20:30:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,185,1444719600"; d="scan'208";a="670011157"
Received: from bitbang.jf.intel.com ([10.7.199.99])
	by orsmga003.jf.intel.com with ESMTP; 22 Oct 2015 20:30:29 -0700
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Oct 2015 20:30:23 -0700
Message-Id: <cover.1445570852.git.randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.4.3
Subject: [PATCH 0/5] Fix live images when using the extensible sdk
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
X-List-Received-Date: Fri, 23 Oct 2015 03:30:31 -0000

The following changes since commit 505a82673ac2487df5ea343a6422c2fc47018831:

  build-appliance-image: Update to jethro head revision (2015-10-21 23:13:11 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib rewitt/codepage
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=rewitt/codepage

Randy Witt (3):
  Add 850 codepage to uninative-tarball
  mtools_4.0.18.bb: Use create_wrapper() for mcopy
  wic/utils/oe/misc.py: Preserve PATH when running native tools

Richard Purdie (2):
  scripts/oe-pkgdata-util: Fix variable name in error handling
  populate_sdk_base: Ensure PKGDATA_DIR exists

 meta/classes/populate_sdk_base.bbclass        |  2 +-
 meta/recipes-core/meta/uninative-tarball.bb   |  1 +
 meta/recipes-devtools/mtools/mtools_4.0.18.bb |  5 +++++
 scripts/lib/wic/utils/oe/misc.py              | 20 ++++++++++++++++----
 scripts/oe-pkgdata-util                       |  2 +-
 5 files changed, 24 insertions(+), 6 deletions(-)

-- 
2.4.3


