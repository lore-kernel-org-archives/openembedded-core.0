Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UapA0-0006xz-Ef
	for openembedded-core@lists.openembedded.org;
	Fri, 10 May 2013 17:23:07 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 10 May 2013 08:04:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,648,1363158000"; d="scan'208";a="331998986"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by fmsmga001.fm.intel.com with ESMTP; 10 May 2013 08:04:26 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 May 2013 18:04:12 +0300
Message-Id: <cover.1368198012.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/8] Package upgrades
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
X-List-Received-Date: Fri, 10 May 2013 15:23:26 -0000
X-List-Received-Date: Fri, 10 May 2013 15:23:26 -0000
X-List-Received-Date: Fri, 10 May 2013 15:23:26 -0000

Hi all,

This patchset contains some X related package upgrades. Basic functional tests
were done with a qemux86 core-image-sato image and on a lenovo ideapad
s10-3t netbook.

Also, all packages were build tested for all architectures (with the exception
of xf86-video-intel and xf86-video-vmware).

Thanks,
Laurentiu

The following changes since commit 88a7b041fbf2583472aa9408a33dd8881223a0c1:

  bitbake: pysh: Say what kind of token isn't implemented (2013-05-10 13:35:10 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/upgrades
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/upgrades

Laurentiu Palcu (8):
  xf86-video-vmware: upgrade to 13.0.1
  xf86-video-intel: upgrade to 2.21.6
  xf86-input-keyboard: upgrade to 1.7.0
  xf86-input-mouse: upgrade to 1.9.0
  xf86-input-synaptics: upgrade to 1.7.0
  xf86-input-evdev: upgrade to 2.8.0
  xproto: upgrade to 7.0.24
  libdrm: upgrade to 2.4.44

 meta/recipes-graphics/drm/libdrm.inc               |    1 +
 .../recipes-graphics/drm/libdrm/installtests.patch |   26 --------
 .../drm/{libdrm_2.4.42.bb => libdrm_2.4.44.bb}     |    6 +-
 ...ut-evdev_2.7.3.bb => xf86-input-evdev_2.8.0.bb} |    6 +-
 ...board_1.6.2.bb => xf86-input-keyboard_1.7.0.bb} |    6 +-
 ...ut-mouse_1.8.1.bb => xf86-input-mouse_1.9.0.bb} |    6 +-
 ...tics_1.6.3.bb => xf86-input-synaptics_1.7.0.bb} |    8 +--
 ...-intel_2.21.3.bb => xf86-video-intel_2.21.6.bb} |    6 +-
 .../xf86-video-vmware/Kill-mibstore.patch          |   63 --------------------
 ...mware_13.0.0.bb => xf86-video-vmware_13.0.1.bb} |    8 +--
 .../{xproto_7.0.23.bb => xproto_7.0.24.bb}         |    5 +-
 11 files changed, 18 insertions(+), 123 deletions(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.42.bb => libdrm_2.4.44.bb} (43%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-evdev_2.7.3.bb => xf86-input-evdev_2.8.0.bb} (81%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-keyboard_1.6.2.bb => xf86-input-keyboard_1.7.0.bb} (70%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-mouse_1.8.1.bb => xf86-input-mouse_1.9.0.bb} (73%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-synaptics_1.6.3.bb => xf86-input-synaptics_1.7.0.bb} (70%)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-intel_2.21.3.bb => xf86-video-intel_2.21.6.bb} (84%)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-vmware/Kill-mibstore.patch
 rename meta/recipes-graphics/xorg-driver/{xf86-video-vmware_13.0.0.bb => xf86-video-vmware_13.0.1.bb} (65%)
 rename meta/recipes-graphics/xorg-proto/{xproto_7.0.23.bb => xproto_7.0.24.bb} (72%)

-- 
1.7.9.5



