Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1Qgui1-0005Eu-TE
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 10:22:18 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 13 Jul 2011 01:18:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,523,1304319600"; d="scan'208";a="29762180"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.187])
	by fmsmga001.fm.intel.com with ESMTP; 13 Jul 2011 01:18:15 -0700
From: Yu Ke <ke.yu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jul 2011 16:17:09 +0800
Message-Id: <cover.1310544875.git.ke.yu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/1] add upstream status info
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
X-List-Received-Date: Wed, 13 Jul 2011 08:22:18 -0000

The following changes since commit 7354fc9213f27aa1b643dbe88070437f1ee4c063:
  Paul Eggleton (1):
        insane.bbclass: skip rdepends QA checks for kernel / modules

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kyu3/xserver-kdrive
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kyu3/xserver-kdrive

Yu Ke (1):
  xserver-kdrive: add patch upstream status info

 .../enable-builtin-fonts.patch                     |   12 -
 .../xserver-kdrive-1.3.0.0/enable-epson.patch      |   11 -
 .../xserver-kdrive-1.3.0.0/enable-tslib.patch      |   12 -
 .../xserver-kdrive-1.3.0.0/enable-xcalibrate.patch |  110 -----
 .../xserver-kdrive-1.3.0.0/fbdev_use_current.patch |   41 --
 .../fix-newer-xorg-headers.patch                   |   18 -
 .../hide-cursor-and-ppm-root.patch                 |  307 ------------
 .../xserver-kdrive-1.3.0.0/kdrive-evdev.patch      |  515 --------------------
 .../xserver-kdrive-1.3.0.0/kdrive-use-evdev.patch  |   54 --
 .../xserver-kdrive-1.3.0.0/optional-xkb.patch      |   58 ---
 .../report-correct-randr12.patch                   |   29 --
 .../xserver-kdrive-1.3.0.0/scheduler.patch         |  151 ------
 .../xserver-kdrive-1.3.0.0/xcalibrate_coords.patch |  122 -----
 .../xserver-kdrive-1.7.99.2/crosscompile.patch     |    4 +
 .../xserver-kdrive-1.7.99.2/disable-apm.patch      |    4 +
 .../enable-builtin-fonts.patch                     |    4 +
 .../enable-xcalibrate.patch                        |    4 +
 .../xserver-kdrive-1.7.99.2/extra-kmodes.patch     |    4 +
 .../fbdev_xrandr_ioctl.patch                       |    4 +
 .../fix-newer-xorg-headers.patch                   |    4 +
 .../hide-cursor-and-ppm-root.patch                 |    4 +
 .../xserver-kdrive-1.7.99.2/kdrive-evdev.patch     |    5 +
 .../xserver-kdrive-1.7.99.2/kdrive-use-evdev.patch |    4 +
 .../keyboard-resume-workaround.patch               |    4 +
 .../no-serial-probing.patch                        |    4 +
 .../xserver-kdrive-1.7.99.2/nodolt.patch           |    4 +
 .../xserver-kdrive-1.7.99.2/optional-xkb.patch     |    4 +
 .../xorg-xserver/xserver-kdrive/disable-apm.patch  |    4 +
 .../xserver-kdrive/disable-xf86-dga-xorgcfg.patch  |    4 +
 .../xorg-xserver/xserver-kdrive/extra-kmodes.patch |    4 +
 .../xserver-kdrive/no-serial-probing.patch         |    4 +
 31 files changed, 73 insertions(+), 1440 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/enable-builtin-fonts.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/enable-epson.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/enable-tslib.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/enable-xcalibrate.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/fbdev_use_current.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/fix-newer-xorg-headers.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/hide-cursor-and-ppm-root.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/kdrive-evdev.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/kdrive-use-evdev.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/optional-xkb.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/report-correct-randr12.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/scheduler.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/xcalibrate_coords.patch



