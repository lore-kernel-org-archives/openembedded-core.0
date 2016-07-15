Return-Path: <jussi.kukkonen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3973C606D0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 10:41:34 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 15 Jul 2016 03:41:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,367,1464678000"; d="scan'208";a="734658462"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 15 Jul 2016 03:41:34 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jul 2016 13:41:29 +0300
Message-Id: <cover.1468578590.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/8] Upgrade mesa, wayland
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
X-List-Received-Date: Fri, 15 Jul 2016 10:41:35 -0000

Major releases of wayland components and especially mesa. The X
upgrades are all fairly small ones.

Mesa has been tested with piglit (looks pretty good). I did not have
a modern test device at hand so have not verified the OpenGL 4.3
support. Wayland was just smoke tested: seems to work fine.

Jussi

The following changes since commit 627d01997fcf6a0581d88047735769ffb2592b82:

  useradd-staticids: use map() instead of imap() (2016-07-12 23:12:00 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/graphics
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/graphics

Jussi Kukkonen (8):
  mesa: Upgrade 11.2.2 -> 12.0.1
  wayland-protocols: Upgrade 1.3 -> 1.4
  wayland: Upgrade 1.10.0 -> 1.11.0
  weston: Upgrade 1.10.0 -> 1.11.0
  libxfixes: Upgrade 5.0.1 -> 5.0.2
  xkeyboard-config: Upgrade 2.17 -> 2.18
  xf86-input-evdev: Upgrade 2.10.2 -> 2.10.3
  xf86-input-libinput: Upgrade 0.16.0 -> 0.19.0

 .../mesa/{mesa-gl_11.2.2.bb => mesa-gl_12.0.1.bb}  |  0
 meta/recipes-graphics/mesa/mesa.inc                |  2 +-
 .../mesa/{mesa_11.2.2.bb => mesa_12.0.1.bb}        |  4 +-
 .../wayland-protocols/dont-use-AC_CANONICAL.patch  | 29 ---------
 ...d-protocols_1.3.bb => wayland-protocols_1.4.bb} |  6 +-
 .../{wayland_1.10.0.bb => wayland_1.11.0.bb}       |  4 +-
 ...1-configure.ac-Fix-wayland-protocols-path.patch |  4 +-
 ...ch-Provide-a-default-version-that-doesn-t.patch | 68 +++++++++++-----------
 .../make-libwebp-explicitly-configurable.patch     | 37 ------------
 .../wayland/{weston_1.10.0.bb => weston_1.11.0.bb} |  7 +--
 ...-evdev_2.10.2.bb => xf86-input-evdev_2.10.3.bb} |  4 +-
 ...put_0.16.0.bb => xf86-input-libinput_0.19.0.bb} |  4 +-
 .../{libxfixes_5.0.1.bb => libxfixes_5.0.2.bb}     |  4 +-
 ...ard-config_2.17.bb => xkeyboard-config_2.18.bb} |  4 +-
 14 files changed, 56 insertions(+), 121 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_11.2.2.bb => mesa-gl_12.0.1.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_11.2.2.bb => mesa_12.0.1.bb} (80%)
 delete mode 100644 meta/recipes-graphics/wayland/wayland-protocols/dont-use-AC_CANONICAL.patch
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.3.bb => wayland-protocols_1.4.bb} (80%)
 rename meta/recipes-graphics/wayland/{wayland_1.10.0.bb => wayland_1.11.0.bb} (92%)
 delete mode 100644 meta/recipes-graphics/wayland/weston/make-libwebp-explicitly-configurable.patch
 rename meta/recipes-graphics/wayland/{weston_1.10.0.bb => weston_1.11.0.bb} (95%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-evdev_2.10.2.bb => xf86-input-evdev_2.10.3.bb} (83%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-libinput_0.16.0.bb => xf86-input-libinput_0.19.0.bb} (63%)
 rename meta/recipes-graphics/xorg-lib/{libxfixes_5.0.1.bb => libxfixes_5.0.2.bb} (79%)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.17.bb => xkeyboard-config_2.18.bb} (88%)

-- 
2.1.4


