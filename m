Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UF5pt-0004UR-CK
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 17:44:29 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 11 Mar 2013 09:27:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,824,1355126400"; d="scan'208";a="300091434"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by fmsmga001.fm.intel.com with ESMTP; 11 Mar 2013 09:27:49 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Mar 2013 18:27:39 +0200
Message-Id: <cover.1363018567.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/4] Package upgrades
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
X-List-Received-Date: Mon, 11 Mar 2013 16:44:30 -0000

Tests done:
 * built the packages for all architectures (except xf86-video-intel and
   xf86-video-vmware);
 * tested basic functionality in qemu and ideapad s10-3t;
 * I changed an xserver-xorg patch related to AArch64 but didn't test it.
   Even though, at first sight, the change is safe, it would be nice if
   someone could help testing the xserver upgrade on AArch64;

Thanks,
Laurentiu

The following changes since commit 365eb9b5d22208c967dcd91d8ab52faed20f04b5:

  bitbake: bitbake-layers: fix duplicated help info (2013-03-10 04:36:52 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/upgrades
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/upgrades

Laurentiu Palcu (4):
  inputproto: upgrade to 2.3
  xserver-xorg: upgrade to 1.14.0
  xf86-video-intel: upgrade to 2.21.3
  xf86-video-vmware: delete references to xserver's mibstore.h

 ...-intel_2.21.0.bb => xf86-video-intel_2.21.3.bb} |    4 +-
 .../xf86-video-vmware/Kill-mibstore.patch          |   63 +++++++++++++++++++
 .../xorg-driver/xf86-video-vmware_13.0.0.bb        |    2 +
 .../{inputproto_2.2.bb => inputproto_2.3.bb}       |    4 +-
 .../xorg-xserver/xserver-xorg-1.13.1/aarch64.patch |   64 --------------------
 .../xorg-xserver/xserver-xorg-1.14.0/aarch64.patch |   35 +++++++++++
 .../crosscompile.patch                             |    0
 .../fix_compilation_when_not_using_xinerama.patch  |   21 +++++++
 .../fix_open_max_preprocessor_error.patch          |    0
 .../macro_tweak.patch                              |    0
 .../mips64-compiler.patch                          |    0
 ...erver-xorg_1.13.1.bb => xserver-xorg_1.14.0.bb} |    5 +-
 12 files changed, 128 insertions(+), 70 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-intel_2.21.0.bb => xf86-video-intel_2.21.3.bb} (86%)
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-vmware/Kill-mibstore.patch
 rename meta/recipes-graphics/xorg-proto/{inputproto_2.2.bb => inputproto_2.3.bb} (78%)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.1/aarch64.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.14.0/aarch64.patch
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.13.1 => xserver-xorg-1.14.0}/crosscompile.patch (100%)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.14.0/fix_compilation_when_not_using_xinerama.patch
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.13.1 => xserver-xorg-1.14.0}/fix_open_max_preprocessor_error.patch (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.13.1 => xserver-xorg-1.14.0}/macro_tweak.patch (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.13.1 => xserver-xorg-1.14.0}/mips64-compiler.patch (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.13.1.bb => xserver-xorg_1.14.0.bb} (84%)

-- 
1.7.9.5



