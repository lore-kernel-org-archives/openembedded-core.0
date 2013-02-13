Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1U5fdn-0004E4-Kc
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Feb 2013 17:57:04 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 13 Feb 2013 08:41:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,658,1355126400"; d="scan'208";a="290652891"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by fmsmga002.fm.intel.com with ESMTP; 13 Feb 2013 08:40:38 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Feb 2013 18:40:27 +0200
Message-Id: <cover.1360773347.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/7] Package upgrades
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
X-List-Received-Date: Wed, 13 Feb 2013 16:57:06 -0000

Hi,

The packages were compiled successfully for all architecture, except
xf86-video-intel and xf86-video-vmware which have compatible host set to
x86 and x86_64. Basic functionality tests were done in qemu. No issues
found.

Thanks,
Laurentiu

The following changes since commit c77e1f4e14edf7a07000f0e7360d42039af5e524:

  Cleanup of upstream_tracking.inc file (2013-02-12 16:43:57 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/upgrades
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/upgrades

Laurentiu Palcu (7):
  xf86-video-intel: upgrade to 2.21.0
  xf86-input-vmmouse: upgrade to 13.0.0
  libdrm: upgrade to 2.4.42
  xkeyboard-config: upgrade to 2.8
  xf86-input-synaptics: upgrade to 1.6.3
  xf86-video-vmware: upgrade to 13.0.0
  xev: upgrade to 1.2.1

 .../drm/{libdrm_2.4.40.bb => libdrm_2.4.42.bb}     |    4 +-
 meta/recipes-graphics/xorg-app/xev_1.2.0.bb        |   12 -
 meta/recipes-graphics/xorg-app/xev_1.2.1.bb        |   12 +
 ...tics_1.6.2.bb => xf86-input-synaptics_1.6.3.bb} |    6 +-
 ...ouse_12.9.0.bb => xf86-input-vmmouse_13.0.0.bb} |    4 +-
 ...intel_2.20.17.bb => xf86-video-intel_2.21.0.bb} |    4 +-
 ...ware-port-vmware-driver-to-new-compat-API.patch |  655 --------------------
 ...mware_12.0.2.bb => xf86-video-vmware_13.0.0.bb} |    7 +-
 ...board-config_2.7.bb => xkeyboard-config_2.8.bb} |    4 +-
 9 files changed, 26 insertions(+), 682 deletions(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.40.bb => libdrm_2.4.42.bb} (50%)
 delete mode 100644 meta/recipes-graphics/xorg-app/xev_1.2.0.bb
 create mode 100644 meta/recipes-graphics/xorg-app/xev_1.2.1.bb
 rename meta/recipes-graphics/xorg-driver/{xf86-input-synaptics_1.6.2.bb => xf86-input-synaptics_1.6.3.bb} (79%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-vmmouse_12.9.0.bb => xf86-input-vmmouse_13.0.0.bb} (75%)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-intel_2.20.17.bb => xf86-video-intel_2.21.0.bb} (86%)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-vmware/vmware-port-vmware-driver-to-new-compat-API.patch
 rename meta/recipes-graphics/xorg-driver/{xf86-video-vmware_12.0.2.bb => xf86-video-vmware_13.0.0.bb} (62%)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.7.bb => xkeyboard-config_2.8.bb} (88%)

-- 
1.7.9.5



