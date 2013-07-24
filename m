Return-Path: <ionutx.radu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1CA996028B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 12:40:16 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 24 Jul 2013 05:37:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,735,1367996400"; d="scan'208";a="350750205"
Received: from work.rb.intel.com ([10.237.105.51])
	by orsmga001.jf.intel.com with ESMTP; 24 Jul 2013 05:40:15 -0700
From: Ionut Radu <ionutx.radu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Jul 2013 15:42:45 +0300
Message-Id: <cover.1374669164.git.ionutx.radu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/4] Package upgrades
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
X-List-Received-Date: Wed, 24 Jul 2013 12:40:16 -0000

qemu: patch target-i386-Fix-aflag-logic-for-CODE64-and-the-0x67-.patch was backported
libxxf86dga: patch libxxf86dga-1.1.3_fix_for_x32.patch was backported (the use of uintptr_t
guarantees that the unsigned int has the same size as a pointer)
All updates were tested on core-image-sato on all architectures (x86, x86-64, ppc, arm, mips)

The following changes since commit 31e6eee860b5f9f4ac9ef0889bcff5648de6e3f9:

  poky-tiny.conf: blacklist core-image-weston option (2013-07-18 21:26:58 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ionutx/work
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ionutx/work

Ionut Radu (4):
  libxfont: Update from 1.4.5 to 1.4.6
  libxrandr: Update from 1.4.0 to 1.4.1
  libxxf86dga: Updated from 1.1.3 to 1.1.4
  qemu: Updated from 1.5.0 to 1.5.1

 meta/recipes-devtools/qemu/{qemu_1.5.0.bb => qemu_1.5.1.bb}     |    7 +++----
 .../xorg-lib/{libxfont_1.4.5.bb => libxfont_1.4.6.bb}           |    5 ++---
 .../xorg-lib/{libxrandr_1.4.0.bb => libxrandr_1.4.1.bb}         |    5 ++---
 .../xorg-lib/{libxxf86dga_1.1.3.bb => libxxf86dga_1.1.4.bb}     |    7 ++-----
 4 files changed, 9 insertions(+), 15 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu_1.5.0.bb => qemu_1.5.1.bb} (49%)
 rename meta/recipes-graphics/xorg-lib/{libxfont_1.4.5.bb => libxfont_1.4.6.bb} (76%)
 rename meta/recipes-graphics/xorg-lib/{libxrandr_1.4.0.bb => libxrandr_1.4.1.bb} (80%)
 rename meta/recipes-graphics/xorg-lib/{libxxf86dga_1.1.3.bb => libxxf86dga_1.1.4.bb} (70%)

-- 
1.7.10.4


