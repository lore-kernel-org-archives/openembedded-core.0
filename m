Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1Tkvtq-0006aP-CJ
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Dec 2012 13:03:54 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 18 Dec 2012 03:47:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,308,1355126400"; d="scan'208";a="258889599"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by orsmga002.jf.intel.com with ESMTP; 18 Dec 2012 03:48:06 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Dec 2012 13:48:40 +0200
Message-Id: <cover.1355830852.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH v2 0/7] udev and multilib changes
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
X-List-Received-Date: Tue, 18 Dec 2012 12:03:54 -0000

This patchset addresses the udevdir problem (some packages hardcode udevdir
to /lib/udev) by using a arch independent variable (nonarch_base_libdir). It also includes some multilib fixes.
The following changes since commit 958162e96b4a4f23bca94500b5f20975633dd5c6:

  bitbake: hob: use base image only if it was set (2012-12-14 17:31:31 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib cmuscax/udev
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=cmuscax/udev

Constantin Musca (7):
  bitbake.conf: add nonarch_base_lib variable
  udev: use nonarch_base_libdir for files that don't vary by arch
  alsa-utils: Pass udev-rules-dir as parameter
  pcmciautils: set correct udevdir and add missing debug files
  bluez: set correct udevdir
  polkit: fix multilib packaging issue
  psplash: enable multilib

 meta/classes/staging.bbclass                       |  4 +
 meta/conf/bitbake.conf                             |  1 +
 meta/recipes-bsp/pcmciautils/pcmciautils.inc       |  3 +-
 meta/recipes-bsp/pcmciautils/pcmciautils_018.bb    |  6 +-
 .../bluez/bluez4-4.101/fix-udev-paths.patch        | 37 +++++++++
 meta/recipes-connectivity/bluez/bluez4.inc         |  2 +
 meta/recipes-connectivity/bluez/bluez4_4.101.bb    |  7 +-
 meta/recipes-core/psplash/psplash_git.bb           | 16 ++--
 meta/recipes-core/udev/udev.inc                    |  8 +-
 meta/recipes-core/udev/udev/fix-udev-paths.patch   | 94 ++++++++++++++++++++++
 meta/recipes-core/udev/udev_182.bb                 |  2 +-
 meta/recipes-extended/polkit/polkit_0.104.bb       | 12 +--
 meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb  |  6 +-
 13 files changed, 172 insertions(+), 26 deletions(-)
 create mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/fix-udev-paths.patch
 create mode 100644 meta/recipes-core/udev/udev/fix-udev-paths.patch

-- 
1.7.11.7



