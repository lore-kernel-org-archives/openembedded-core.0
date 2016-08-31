Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9D85D6010D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 01:48:42 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga103.jf.intel.com with ESMTP; 30 Aug 2016 18:48:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,259,1470726000"; 
   d="scan'208";a="2895719"
Received: from ashuvini-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.145.135])
	by fmsmga005.fm.intel.com with ESMTP; 30 Aug 2016 18:48:41 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Aug 2016 13:48:04 +1200
Message-Id: <cover.1472607521.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 0/2] Tinfoil usage fixes
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
X-List-Received-Date: Wed, 31 Aug 2016 01:48:46 -0000

NOTE: the scripts/contrib/* patch requires the bitbake series I just
sent. We may wish to consider a bitbake version and required bitbake
version bump soon.


The following changes since commit 384cf92ca9c3e66763c2c1ff2776c53d47ae25d6:

  init-install: Fixes the install script failing when not finding any mmcblk devices (2016-08-30 07:57:46 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/tinfoil-fixes-oe
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/tinfoil-fixes-oe

Paul Eggleton (2):
  scripts: ensure tinfoil is shut down correctly
  scripts/contrib: update scripts for changes to internal API

 scripts/contrib/devtool-stress.py           |   6 +-
 scripts/contrib/list-packageconfig-flags.py |  35 ++-
 scripts/contrib/verify-homepage.py          |  18 +-
 scripts/devtool                             |  10 +-
 scripts/lib/devtool/build_image.py          | 124 +++++-----
 scripts/lib/devtool/deploy.py               | 141 ++++++------
 scripts/lib/devtool/runqemu.py              |   8 +-
 scripts/lib/devtool/standard.py             | 341 ++++++++++++++--------------
 scripts/lib/devtool/upgrade.py              |  85 +++----
 scripts/oe-pkgdata-util                     |   5 +-
 scripts/recipetool                          |  63 ++---
 11 files changed, 432 insertions(+), 404 deletions(-)

-- 
2.5.5


