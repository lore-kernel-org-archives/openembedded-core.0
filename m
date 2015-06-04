Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 289D96AD0D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 10:44:09 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 04 Jun 2015 03:43:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,552,1427785200"; d="scan'208";a="740833411"
Received: from theory.fi.intel.com ([10.237.72.51])
	by orsmga002.jf.intel.com with ESMTP; 04 Jun 2015 03:43:52 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jun 2015 13:44:06 +0300
Message-Id: <cover.1433414236.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/6] Upgrade X drivers and xkeyboard-config
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
X-List-Received-Date: Thu, 04 Jun 2015 10:44:10 -0000

Some of the drivers I am not able to test: all upgrades are fairly
small point upgrades though.

The following changes since commit fcc67ae90feeceee204bdb36e45eacf8d056779a:

  xserver-xorg: Upgrade 1.16.3 -> 1.17.1 (OELAYOUT_ABI change) (2015-06-03 16:38:49 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/xorg-drivers
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/xorg-drivers

Jussi Kukkonen (6):
  xf86-input-evdev: Upgrade 2.9.1 -> 2.9.2
  xf86-input-keyboard: Upgrade 1.8.0 -> 1.8.1
  xf86-input-synaptics: Upgrade 1.8.1 -> 1.8.2
  xf86-video-omap: Upgrade to 0.4.3
  xf86-video-vmware: Upgrade 13.0.2 -> 13.1.0
  xkeyboard-config: Upgrade 2.14 -> 2.15

 ...ut-evdev_2.9.1.bb => xf86-input-evdev_2.9.2.bb} |  4 +-
 ...board_1.8.0.bb => xf86-input-keyboard_1.8.1.bb} |  4 +-
 ...tics_1.8.1.bb => xf86-input-synaptics_1.8.2.bb} |  4 +-
 .../xorg-driver/xf86-video-omap/configure.patch    | 74 ----------------------
 ...-video-omap_git.bb => xf86-video-omap_0.4.3.bb} | 11 +---
 ...001-configure-fix-build-without-xatracker.patch | 37 -----------
 ...mware_13.0.2.bb => xf86-video-vmware_13.1.0.bb} |  7 +-
 .../0001-Remove-GPLv3-content.patch                | 51 ---------------
 ...ard-config_2.14.bb => xkeyboard-config_2.15.bb} |  8 +--
 9 files changed, 15 insertions(+), 185 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-evdev_2.9.1.bb => xf86-input-evdev_2.9.2.bb} (83%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-keyboard_1.8.0.bb => xf86-input-keyboard_1.8.1.bb} (73%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-synaptics_1.8.1.bb => xf86-input-synaptics_1.8.2.bb} (80%)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-omap/configure.patch
 rename meta/recipes-graphics/xorg-driver/{xf86-video-omap_git.bb => xf86-video-omap_0.4.3.bb} (85%)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-vmware/0001-configure-fix-build-without-xatracker.patch
 rename meta/recipes-graphics/xorg-driver/{xf86-video-vmware_13.0.2.bb => xf86-video-vmware_13.1.0.bb} (59%)
 delete mode 100644 meta/recipes-graphics/xorg-lib/xkeyboard-config/0001-Remove-GPLv3-content.patch
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.14.bb => xkeyboard-config_2.15.bb} (82%)

-- 
2.1.4


