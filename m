Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B8D416E744
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2014 07:42:34 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 11 Feb 2014 23:38:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,831,1384329600"; d="scan'208";a="482038612"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga002.jf.intel.com with ESMTP; 11 Feb 2014 23:38:45 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Feb 2014 09:41:31 +0200
Message-Id: <cover.1392189255.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH 0/3] PUs and telepathy-mission-control fix
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
X-List-Received-Date: Wed, 12 Feb 2014 07:42:35 -0000

The following changes since commit 92cad721d764ec28c3570dfe4a80847c3df19453:

  curl: fix https certificate problems (2014-02-11 17:15:55 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/PUs
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/PUs

Cristian Iorga (3):
  telepathy-mission-control: typo in connectivity switch
  harfbuzz: upgrade to 0.9.26
  flac: upgrade to 1.3.0

 .../telepathy/telepathy-mission-control_5.16.0.bb  |   2 +-
 .../{harfbuzz_0.9.25.bb => harfbuzz_0.9.26.bb}     |   6 +-
 .../flac/flac-1.2.1/0001-No-AltiVec-on-SPE.patch   |  78 -----------
 .../flac/flac-1.2.1/asm-pic.patch                  |  99 --------------
 .../flac/flac-1.2.1/disable-xmms-plugin.patch      |  25 ----
 .../flac/flac-1.2.1/flac-gcc43-fixes.patch         |  15 ---
 .../flac/flac-1.2.1/obsolete_automake_macros.patch |  14 --
 meta/recipes-multimedia/flac/flac-1.2.1/xmms.m4    | 149 ---------------------
 .../0001-Fix-Makefile.am-altivec-logic.patch       |  35 +++++
 .../flac/{flac_1.2.1.bb => flac_1.3.0.bb}          |  46 +++----
 10 files changed, 56 insertions(+), 413 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_0.9.25.bb => harfbuzz_0.9.26.bb} (86%)
 delete mode 100644 meta/recipes-multimedia/flac/flac-1.2.1/0001-No-AltiVec-on-SPE.patch
 delete mode 100644 meta/recipes-multimedia/flac/flac-1.2.1/asm-pic.patch
 delete mode 100644 meta/recipes-multimedia/flac/flac-1.2.1/disable-xmms-plugin.patch
 delete mode 100644 meta/recipes-multimedia/flac/flac-1.2.1/flac-gcc43-fixes.patch
 delete mode 100644 meta/recipes-multimedia/flac/flac-1.2.1/obsolete_automake_macros.patch
 delete mode 100644 meta/recipes-multimedia/flac/flac-1.2.1/xmms.m4
 create mode 100644 meta/recipes-multimedia/flac/flac-1.3.0/0001-Fix-Makefile.am-altivec-logic.patch
 rename meta/recipes-multimedia/flac/{flac_1.2.1.bb => flac_1.3.0.bb} (46%)

-- 
1.8.3.2


