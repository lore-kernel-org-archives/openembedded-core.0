Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1SXBWJ-0002y6-Sx
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 15:22:32 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 23 May 2012 06:11:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="147416683"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by orsmga002.jf.intel.com with ESMTP; 23 May 2012 06:11:15 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 May 2012 16:10:52 +0300
Message-Id: <cover.1337777033.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 00/19] Package updates
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 May 2012 13:22:32 -0000

The updates in this patchset are mainly related to graphics functionality area.

The following changes since commit 33c4bf2096effc850720009564e3d1adbda24452:

  fetch2: Also exclude urls containing wildcards from checksumming for now (2012-05-22 12:18:53 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/updates
  http://git.yoctoproject.org/cgit.cgi//log/?h=lpalcu/updates

Laurentiu Palcu (19):
  mdadm: upgrade to 3.2.5
  libdrm: upgrade to 2.4.34
  xproto: upgrade to 7.0.23
  kbproto: upgrade to 1.0.6
  fontsproto: upgrade to 2.1.2
  xextproto: upgrade to 7.2.1
  xcmiscproto: upgrade to 1.2.2
  scrnsaverproto: upgrade to 1.2.2
  recordproto: upgrade to 1.14.2
  xcb-proto: upgrade to 1.7.1
  libxt: upgrade to 1.1.3
  xtrans: upgrade to 1.2.7
  fontconfig: upgrade to 2.9.0
  libpciaccess: upgrade to 0.13.1
  xf86-input-mouse: upgrade to 1.7.2
  xf86-video-vesa: upgrade to 2.3.1
  xf86-video-intel: upgrade to 2.19.0
  xf86-input-synaptics: upgrade to 1.6.1
  Update to distro_tracking_fields.inc

 .../conf/distro/include/distro_tracking_fields.inc |  180 ++++++++++----------
 .../mdadm/{mdadm_3.2.3.bb => mdadm_3.2.5.bb}       |    4 +-
 .../drm/{libdrm_2.4.31.bb => libdrm_2.4.34.bb}     |    4 +-
 .../97_fontconfig                                  |    0
 .../fix-pkgconfig.patch                            |    4 +-
 ...-native_2.8.0.bb => fontconfig-native_2.9.0.bb} |    0
 .../{fontconfig_2.8.0.bb => fontconfig_2.9.0.bb}   |   12 +-
 .../xcb/{xcb-proto_1.7.bb => xcb-proto_1.7.1.bb}   |    4 +-
 ...ut-mouse_1.7.1.bb => xf86-input-mouse_1.7.2.bb} |    4 +-
 ...tics_1.5.0.bb => xf86-input-synaptics_1.6.1.bb} |    6 +-
 ...-intel_2.18.0.bb => xf86-video-intel_2.19.0.bb} |    4 +-
 ...ideo-vesa_2.3.0.bb => xf86-video-vesa_2.3.1.bb} |    6 +-
 .../fix_deletion_of_last_handle.patch              |   51 ------
 ...ciaccess_0.12.902.bb => libpciaccess_0.13.1.bb} |    6 +-
 .../xorg-lib/{libxt_1.1.2.bb => libxt_1.1.3.bb}    |    4 +-
 .../xorg-lib/{xtrans_1.2.6.bb => xtrans_1.2.7.bb}  |    4 +-
 .../{fontsproto_2.1.1.bb => fontsproto_2.1.2.bb}   |    4 +-
 .../{kbproto_1.0.5.bb => kbproto_1.0.6.bb}         |    6 +-
 ...recordproto_1.14.1.bb => recordproto_1.14.2.bb} |    4 +-
 ...saverproto_1.2.1.bb => scrnsaverproto_1.2.2.bb} |    5 +-
 .../{xcmiscproto_1.2.1.bb => xcmiscproto_1.2.2.bb} |    4 +-
 .../{xextproto_7.2.0.bb => xextproto_7.2.1.bb}     |    4 +-
 .../{xproto_7.0.22.bb => xproto_7.0.23.bb}         |    6 +-
 23 files changed, 133 insertions(+), 193 deletions(-)
 rename meta/recipes-extended/mdadm/{mdadm_3.2.3.bb => mdadm_3.2.5.bb} (85%)
 rename meta/recipes-graphics/drm/{libdrm_2.4.31.bb => libdrm_2.4.34.bb} (62%)
 rename meta/recipes-graphics/fontconfig/{fontconfig-2.8.0 => fontconfig-2.9.0}/97_fontconfig (100%)
 rename meta/recipes-graphics/fontconfig/{fontconfig-2.8.0 => fontconfig-2.9.0}/fix-pkgconfig.patch (84%)
 rename meta/recipes-graphics/fontconfig/{fontconfig-native_2.8.0.bb => fontconfig-native_2.9.0.bb} (100%)
 rename meta/recipes-graphics/fontconfig/{fontconfig_2.8.0.bb => fontconfig_2.9.0.bb} (84%)
 rename meta/recipes-graphics/xcb/{xcb-proto_1.7.bb => xcb-proto_1.7.1.bb} (61%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-mouse_1.7.1.bb => xf86-input-mouse_1.7.2.bb} (76%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-synaptics_1.5.0.bb => xf86-input-synaptics_1.6.1.bb} (79%)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-intel_2.18.0.bb => xf86-video-intel_2.19.0.bb} (84%)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-vesa_2.3.0.bb => xf86-video-vesa_2.3.1.bb} (74%)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libpciaccess-0.12.902/fix_deletion_of_last_handle.patch
 rename meta/recipes-graphics/xorg-lib/{libpciaccess_0.12.902.bb => libpciaccess_0.13.1.bb} (64%)
 rename meta/recipes-graphics/xorg-lib/{libxt_1.1.2.bb => libxt_1.1.3.bb} (91%)
 rename meta/recipes-graphics/xorg-lib/{xtrans_1.2.6.bb => xtrans_1.2.7.bb} (82%)
 rename meta/recipes-graphics/xorg-proto/{fontsproto_2.1.1.bb => fontsproto_2.1.2.bb} (77%)
 rename meta/recipes-graphics/xorg-proto/{kbproto_1.0.5.bb => kbproto_1.0.6.bb} (68%)
 rename meta/recipes-graphics/xorg-proto/{recordproto_1.14.1.bb => recordproto_1.14.2.bb} (76%)
 rename meta/recipes-graphics/xorg-proto/{scrnsaverproto_1.2.1.bb => scrnsaverproto_1.2.2.bb} (80%)
 rename meta/recipes-graphics/xorg-proto/{xcmiscproto_1.2.1.bb => xcmiscproto_1.2.2.bb} (73%)
 rename meta/recipes-graphics/xorg-proto/{xextproto_7.2.0.bb => xextproto_7.2.1.bb} (82%)
 rename meta/recipes-graphics/xorg-proto/{xproto_7.0.22.bb => xproto_7.0.23.bb} (72%)

-- 
1.7.9.5



