Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S0alw-0003SW-V7
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 16:39:57 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 23 Feb 2012 07:31:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="114033997"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.61])
	by orsmga002.jf.intel.com with ESMTP; 23 Feb 2012 07:31:33 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 15:31:27 +0000
Message-Id: <cover.1330010964.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/3] fixes for meta-toolchain without x11
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
X-List-Received-Date: Thu, 23 Feb 2012 15:39:57 -0000

A couple of patches that fix building meta-toolchain with x11 removed
from DISTRO_FEATURES, and a patch removing QEMU 0.14.0 which is
obsolete.

The following changes since commit 55f72b98f606c1554eb6edd151292ffdfddf1384:

  texi2html: Fix for multilib (2012-02-22 23:01:45 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/meta-toolchain-nox
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/meta-toolchain-nox

Paul Eggleton (3):
  qemu: enable building qemu-nativesdk without x11
  libsdl: allow building without x11
  qemu: remove version 0.14.0

 ...t-and-use-GCC-atomic-builtins-for-locking.patch |   86 -
 .../qemu/qemu-0.14.0/arm-bgr.patch                 |   30 -
 .../qemu/qemu-0.14.0/enable-i386-linux-user.patch  |   55 -
 .../fallback-to-safe-mmap_min_addr.patch           |   39 -
 .../qemu/qemu-0.14.0/fix-configure-checks.patch    |   22 -
 .../qemu/qemu-0.14.0/fix-nogl.patch                |  127 -
 .../qemu/qemu-0.14.0/glflags.patch                 |   15 -
 .../qemu/qemu-0.14.0/init-info.patch               |   18 -
 .../qemu/qemu-0.14.0/larger_default_ram_size.patch |   22 -
 .../qemu/qemu-0.14.0/linker-flags.patch            |   25 -
 .../qemu/qemu-0.14.0/no-strip.patch                |   15 -
 .../qemu/qemu-0.14.0/opengl-sdl-fix.patch          |   43 -
 .../qemu/qemu-0.14.0/powerpc_rom.bin               |  Bin 4096 -> 0 bytes
 .../qemu/qemu-0.14.0/qemu-git-qemugl-host.patch    |34368 --------------------
 .../qemu/qemu-0.14.0/qemu-vmware-vga-depth.patch   |  118 -
 .../qemugl-allow-glxcontext-release.patch          |   65 -
 .../qemu/qemu-0.14.0/qemugl-fix.patch              |   74 -
 .../spice-qxl-locking-fix-for-qemu-kvm.patch       |  152 -
 meta/recipes-devtools/qemu/qemu.inc                |    3 +-
 meta/recipes-devtools/qemu/qemu_0.14.0.bb          |   48 -
 meta/recipes-devtools/qemu/qemu_0.15.1.bb          |   13 +-
 meta/recipes-graphics/libsdl/libsdl_1.2.14.bb      |   11 +-
 22 files changed, 19 insertions(+), 35330 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/qemu-0.14.0/Detect-and-use-GCC-atomic-builtins-for-locking.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu-0.14.0/arm-bgr.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu-0.14.0/enable-i386-linux-user.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu-0.14.0/fallback-to-safe-mmap_min_addr.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu-0.14.0/fix-configure-checks.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu-0.14.0/fix-nogl.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu-0.14.0/glflags.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu-0.14.0/init-info.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu-0.14.0/larger_default_ram_size.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu-0.14.0/linker-flags.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu-0.14.0/no-strip.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu-0.14.0/opengl-sdl-fix.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu-0.14.0/powerpc_rom.bin
 delete mode 100644 meta/recipes-devtools/qemu/qemu-0.14.0/qemu-git-qemugl-host.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu-0.14.0/qemu-vmware-vga-depth.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu-0.14.0/qemugl-allow-glxcontext-release.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu-0.14.0/qemugl-fix.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu-0.14.0/spice-qxl-locking-fix-for-qemu-kvm.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu_0.14.0.bb

-- 
1.7.5.4



