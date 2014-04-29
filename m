Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 05C5D617AA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Apr 2014 13:51:10 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 29 Apr 2014 06:51:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,951,1389772800"; d="scan'208";a="531596648"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by orsmga002.jf.intel.com with ESMTP; 29 Apr 2014 06:51:05 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Apr 2014 16:29:42 +0300
Message-Id: <cover.1398775392.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 00/12] package upgrades
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
X-List-Received-Date: Tue, 29 Apr 2014 13:51:11 -0000

The packages were individually compiled for x86, x86-64, arm, mips, ppc, then
fired the AB nightlies for the mentioned archs. Basic sanity tests, apart from
the AB ones, were performed on a core-image-sato image for qemux86.  Builds
finished successfully and no issues were spotted during tests.

laurentiu

The following changes since commit 183dac4036cb73ad6cc620002b0044d3484a398d:

  bitbake: Revert "fetch2: Cleanup file checksum generation" (2014-04-28 12:54:06 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/upgrades
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/upgrades

Laurentiu Palcu (12):
  xf86-input-synaptics: upgrade to 1.7.4
  libdrm: upgrade to 2.4.53
  xserver-xorg: upgrade to 1.15.1
  python-pygobject: upgrade to 2.28.3
  gdb: upgrade to 7.7
  xproto: upgrade to 7.0.26
  xrandr: upgrade to 1.4.2
  xtrans: upgrade to 1.3.4
  kexec-tools: upgrade to 2.0.6
  nasm: upgrade to 2.11.02
  xauth: upgrade to 1.0.9
  fontconfig: upgrade to 2.11.1

 .../gdb/{gdb-7.6.2.inc => gdb-7.7.inc}             |    6 ++--
 ...canadian_7.6.2.bb => gdb-cross-canadian_7.7.bb} |    0
 .../gdb/{gdb-cross_7.6.2.bb => gdb-cross_7.7.bb}   |    0
 .../gdb-fix-cygwin-check-in-configure-script.patch |   38 --------------------
 .../gdb/{gdb_7.6.2.bb => gdb_7.7.bb}               |    0
 .../nasm/{nasm_2.11.bb => nasm_2.11.02.bb}         |    4 +--
 ...bject_2.27.91.bb => python-pygobject_2.28.3.bb} |    5 ++-
 .../drm/{libdrm_2.4.52.bb => libdrm_2.4.53.bb}     |    4 +--
 .../fontconfig/fontconfig/sysroot-arg.patch        |   32 -----------------
 .../{fontconfig_2.11.0.bb => fontconfig_2.11.1.bb} |    8 ++---
 .../xorg-app/{xauth_1.0.8.bb => xauth_1.0.9.bb}    |    4 +--
 .../xorg-app/{xrandr_1.4.1.bb => xrandr_1.4.2.bb}  |    4 +--
 ...tics_1.7.3.bb => xf86-input-synaptics_1.7.4.bb} |    4 +--
 .../xorg-lib/{xtrans_1.3.3.bb => xtrans_1.3.4.bb}  |    4 +--
 .../{xproto_7.0.25.bb => xproto_7.0.26.bb}         |    4 +--
 ...erver-xorg_1.15.0.bb => xserver-xorg_1.15.1.bb} |    4 +--
 .../{kexec-tools_2.0.4.bb => kexec-tools_2.0.6.bb} |    4 +--
 17 files changed, 26 insertions(+), 99 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-7.6.2.inc => gdb-7.7.inc} (61%)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_7.6.2.bb => gdb-cross-canadian_7.7.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_7.6.2.bb => gdb-cross_7.7.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gdb/gdb/gdb-fix-cygwin-check-in-configure-script.patch
 rename meta/recipes-devtools/gdb/{gdb_7.6.2.bb => gdb_7.7.bb} (100%)
 rename meta/recipes-devtools/nasm/{nasm_2.11.bb => nasm_2.11.02.bb} (81%)
 rename meta/recipes-devtools/python/{python-pygobject_2.27.91.bb => python-pygobject_2.28.3.bb} (87%)
 rename meta/recipes-graphics/drm/{libdrm_2.4.52.bb => libdrm_2.4.53.bb} (46%)
 delete mode 100644 meta/recipes-graphics/fontconfig/fontconfig/sysroot-arg.patch
 rename meta/recipes-graphics/fontconfig/{fontconfig_2.11.0.bb => fontconfig_2.11.1.bb} (83%)
 rename meta/recipes-graphics/xorg-app/{xauth_1.0.8.bb => xauth_1.0.9.bb} (68%)
 rename meta/recipes-graphics/xorg-app/{xrandr_1.4.1.bb => xrandr_1.4.2.bb} (72%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-synaptics_1.7.3.bb => xf86-input-synaptics_1.7.4.bb} (81%)
 rename meta/recipes-graphics/xorg-lib/{xtrans_1.3.3.bb => xtrans_1.3.4.bb} (82%)
 rename meta/recipes-graphics/xorg-proto/{xproto_7.0.25.bb => xproto_7.0.26.bb} (74%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.15.0.bb => xserver-xorg_1.15.1.bb} (88%)
 rename meta/recipes-kernel/kexec/{kexec-tools_2.0.4.bb => kexec-tools_2.0.6.bb} (57%)

-- 
1.7.9.5


