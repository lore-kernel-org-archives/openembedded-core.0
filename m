Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id EA367605B3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Dec 2014 22:37:02 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 01 Dec 2014 14:33:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,496,1413270000"; d="scan'208";a="646489167"
Received: from alimon-thinkpad-w540.zpn.intel.com ([10.219.4.148])
	by orsmga002.jf.intel.com with ESMTP; 01 Dec 2014 14:37:01 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Dec 2014 16:36:44 -0600
Message-Id: <cover.1417466732.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/3] Upgrades for comply Intel Graphics Stack Release 2014Q3
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
X-List-Received-Date: Mon, 01 Dec 2014 22:37:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Testing was made building and running core-image-sato in qemux86, qemumips,
and qemuarm also core-image-sato/core-image-weston in Intel NUC.

Tests freedesktop piglit was run in Intel NUC with 95% of tests passes
(9251/9694), you can found full results at [1].

[YOCTO #6805]

[1] https://bugzilla.yoctoproject.org/attachment.cgi?id=2267

The following changes since commit b8631416f12b8a904ce3deb036f9d5ce632937b0:

  package_regex.inc: Update REGEX'es in order to find upstream versions correctly (2014-11-28 14:03:02 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib alimon/linux_intel_graphics_2014q3
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=alimon/linux_intel_graphics_2014q3

Aníbal Limón (3):
  libdrm: Upgrade to 2.4.58.
  mesa: Upgrade to 10.3.3
  xorg-xserver: Upgrade to 1.16.2

 .../drm/libdrm/GNU_SOURCE_definition.patch         |  30 --
 meta/recipes-graphics/drm/libdrm_2.4.54.bb         |   8 -
 meta/recipes-graphics/drm/libdrm_2.4.58.bb         |   7 +
 .../mesa/{mesa-gl_10.1.3.bb => mesa-gl_10.3.3.bb}  |   0
 ..._sw-include-xlib_sw_winsys.h-only-when-HA.patch |  52 ---
 ...ate-NativeDisplayType-depending-on-config.patch | 362 ---------------------
 .../mesa/mesa/0006-fix-out-of-tree-egl.patch       |  48 ---
 .../mesa/{mesa_10.1.3.bb => mesa_10.3.3.bb}        |   9 +-
 meta/recipes-graphics/mesa/mesa_git.bb             |   9 +-
 .../xorg-xserver/xserver-xorg/crosscompile.patch   |  22 --
 .../xserver-xorg/mips64-compiler.patch             |  29 --
 .../xorg-xserver/xserver-xorg/present-module.patch |  66 ----
 ...erver-xorg_1.15.1.bb => xserver-xorg_1.16.2.bb} |   9 +-
 13 files changed, 16 insertions(+), 635 deletions(-)
 delete mode 100644 meta/recipes-graphics/drm/libdrm/GNU_SOURCE_definition.patch
 delete mode 100644 meta/recipes-graphics/drm/libdrm_2.4.54.bb
 create mode 100644 meta/recipes-graphics/drm/libdrm_2.4.58.bb
 rename meta/recipes-graphics/mesa/{mesa-gl_10.1.3.bb => mesa-gl_10.3.3.bb} (100%)
 delete mode 100644 meta/recipes-graphics/mesa/mesa/0002-pipe_loader_sw-include-xlib_sw_winsys.h-only-when-HA.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa/0006-fix-out-of-tree-egl.patch
 rename meta/recipes-graphics/mesa/{mesa_10.1.3.bb => mesa_10.3.3.bb} (62%)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/crosscompile.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/mips64-compiler.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/present-module.patch
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.15.1.bb => xserver-xorg_1.16.2.bb} (75%)

-- 
1.9.1


