Return-Path: <ionutx.radu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 844D26AF56
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2013 14:48:31 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 25 Jul 2013 07:48:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,743,1367996400"; d="scan'208";a="375930687"
Received: from work.rb.intel.com ([10.237.105.51])
	by fmsmga002.fm.intel.com with ESMTP; 25 Jul 2013 07:48:30 -0700
From: Ionut Radu <ionutx.radu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Jul 2013 17:51:00 +0300
Message-Id: <cover.1374763279.git.ionutx.radu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [v2 0/6] Package upgrades
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
X-List-Received-Date: Thu, 25 Jul 2013 14:48:32 -0000

Changes from v1:
Added libuser and videoproto updates.
* qemu: Tested (displayed the version of qemu installed) on core-image-sato
on all architectures (x86, x86-64, ppc, mips, arm).
* videoproto: LIC_FILES_CHECKSUM changed (some trailing spaces have been removed)

The following changes since commit 31e6eee860b5f9f4ac9ef0889bcff5648de6e3f9:

  poky-tiny.conf: blacklist core-image-weston option (2013-07-18 21:26:58 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ionutx/work
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ionutx/work

Ionut Radu (6):
  libxfont: Update from 1.4.5 to 1.4.6
  libxrandr: Update from 1.4.0 to 1.4.1
  libxxf86dga: Updated from 1.1.3 to 1.1.4
  qemu: Updated from 1.5.0 to 1.5.1
  libuser: Updated from 0.58 to 0.59
  videoproto: Update from 2.3.1 to 2.3.2

 meta/recipes-devtools/qemu/{qemu_1.5.0.bb => qemu_1.5.1.bb}     |    7 +++----
 .../libuser/{libuser_0.58.bb => libuser_0.59.bb}                |    4 ++--
 .../xorg-lib/{libxfont_1.4.5.bb => libxfont_1.4.6.bb}           |    5 ++---
 .../xorg-lib/{libxrandr_1.4.0.bb => libxrandr_1.4.1.bb}         |    5 ++---
 .../xorg-lib/{libxxf86dga_1.1.3.bb => libxxf86dga_1.1.4.bb}     |    7 ++-----
 .../xorg-proto/{videoproto_2.3.1.bb => videoproto_2.3.2.bb}     |    7 +++----
 6 files changed, 14 insertions(+), 21 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu_1.5.0.bb => qemu_1.5.1.bb} (49%)
 rename meta/recipes-extended/libuser/{libuser_0.58.bb => libuser_0.59.bb} (88%)
 rename meta/recipes-graphics/xorg-lib/{libxfont_1.4.5.bb => libxfont_1.4.6.bb} (76%)
 rename meta/recipes-graphics/xorg-lib/{libxrandr_1.4.0.bb => libxrandr_1.4.1.bb} (80%)
 rename meta/recipes-graphics/xorg-lib/{libxxf86dga_1.1.3.bb => libxxf86dga_1.1.4.bb} (70%)
 rename meta/recipes-graphics/xorg-proto/{videoproto_2.3.1.bb => videoproto_2.3.2.bb} (53%)

-- 
1.7.10.4


