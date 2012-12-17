Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1TkX1m-00046J-Rk
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Dec 2012 10:30:27 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 17 Dec 2012 01:15:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,299,1355126400"; d="scan'208";a="265310922"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by fmsmga002.fm.intel.com with ESMTP; 17 Dec 2012 01:15:44 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Dec 2012 11:16:16 +0200
Message-Id: <cover.1355732782.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH 0/7] udev and multilib changes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Dec 2012 09:30:27 -0000

This patchset addresses the udevdir problem (some packages hardcode udevdir
to /lib/udev) by using a arch independent variable (nonarch_base_libdir). It also includes some multilib fixes.
The following changes since commit 958162e96b4a4f23bca94500b5f20975633dd5c6:

  bitbake: hob: use base image only if it was set (2012-12-14 17:31:31 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib cmuscax/udev
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=cmuscax/udev

Constantin Musca (7):
  bitbake.conf: add nonarch_base_lib variable
  udev: replace base_libdir with nonarch_base_libdir
  alsa-utils: Pass udev-rules-dir as parameter
  pcmciautils: set correct udevdir and add missing debug files
  bluez: set correct udevdir
  polkit: fix multilib packaging issue
  psplash: enable multilib

 meta/classes/staging.bbclass                      |  4 ++++
 meta/conf/bitbake.conf                            |  1 +
 meta/recipes-bsp/pcmciautils/pcmciautils.inc      |  3 ++-
 meta/recipes-bsp/pcmciautils/pcmciautils_018.bb   |  6 +++---
 meta/recipes-connectivity/bluez/bluez4_4.101.bb   |  6 +++---
 meta/recipes-core/psplash/psplash_git.bb          | 16 +++++++++------
 meta/recipes-core/udev/udev.inc                   | 24 +++++++++++------------
 meta/recipes-core/udev/udev_182.bb                |  2 +-
 meta/recipes-extended/polkit/polkit_0.104.bb      | 12 ++++++------
 meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb |  6 +++---
 10 files changed, 45 insertions(+), 35 deletions(-)

-- 
1.7.11.7



