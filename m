Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 550B26D298
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2013 16:14:29 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 31 Oct 2013 09:14:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="382877203"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.36])
	by azsmga001.ch.intel.com with ESMTP; 31 Oct 2013 09:14:28 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Oct 2013 09:14:28 -0700
Message-Id: <cover.1383235999.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [CONSOLIDATED PULL 00/10]
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
X-List-Received-Date: Thu, 31 Oct 2013 16:14:31 -0000


The following changes since commit 154ecc40c289b15fe9cbb33befb20dd10112e788:

  cross-canadian: Improve comment (2013-10-30 18:00:56 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Cristiana Voicu (1):
  rxvt-unicode: upgrade to 9.19

Jacob Kroon (1):
  update-rc.d.bbclass: Cleanup package scripts

Jason Wessel (2):
  syslinux.bbclass: Fix default serial port string
  grub-efi.bbclass: Fix startup.nsh to work on more EFI revs

Joao Henrique Ferreira de Freitas (1):
  grub-efi.bbclass: Fixes GRUB_IMAGE when using boot-directdisk class

Khem Raj (1):
  elfutils-native: Update the patch to include the missing pieces needed
    for tests

Qiang Chen (1):
  irda-utils: restart irda daemon correctly

Roy.Li (1):
  lttng-tools: make ptest able to work on target

Saul Wold (1):
  udev: fix typo in local.rules

Valentin Popa (1):
  Mesa: upgrade to 9.2.2

 meta/classes/grub-efi.bbclass                      |   3 +-
 meta/classes/syslinux.bbclass                      |   2 +-
 meta/classes/update-rc.d.bbclass                   |  49 +--
 .../irda-utils/irda-utils-0.9.18/init              |  38 +--
 meta/recipes-core/udev/udev/local.rules            |   2 +-
 .../elfutils/elfutils/fix-build-gcc-4.8.patch      |  21 +-
 ...ate-NativeDisplayType-depending-on-config.patch | 362 ---------------------
 .../mesa/{mesa-gl_9.1.6.bb => mesa-gl_9.2.2.bb}    |   0
 meta/recipes-graphics/mesa/mesa.inc                |   2 +-
 ...void-use-of-AC_CHECK_FILE-for-cross-compi.patch |  65 ----
 ...ate-NativeDisplayType-depending-on-config.patch |  35 +-
 ...sl-fix-builtin_compiler-cross-compilation.patch |  54 ---
 .../mesa/0005-fix-out-of-tree-builds-gallium.patch |  42 ---
 ...move-the-power-of-two-sizeof-struct-cmd_b.patch |   0
 meta/recipes-graphics/mesa/mesa_9.1.6.bb           |  16 -
 meta/recipes-graphics/mesa/mesa_9.2.2.bb           |  11 +
 meta/recipes-graphics/mesa/mesa_git.bb             |   8 +-
 meta/recipes-kernel/lttng/lttng-tools_2.3.0.bb     |  19 ++
 .../rxvt.desktop                                   |   0
 .../rxvt.png                                       | Bin
 .../xwc.patch                                      |   0
 .../{rxvt-unicode_9.18.bb => rxvt-unicode_9.19.bb} |   5 +-
 22 files changed, 119 insertions(+), 615 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/mesa-9.1.6/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch
 rename meta/recipes-graphics/mesa/{mesa-gl_9.1.6.bb => mesa-gl_9.2.2.bb} (100%)
 delete mode 100644 meta/recipes-graphics/mesa/mesa/0001-configure-Avoid-use-of-AC_CHECK_FILE-for-cross-compi.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa/0004-glsl-fix-builtin_compiler-cross-compilation.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa/0005-fix-out-of-tree-builds-gallium.patch
 rename meta/recipes-graphics/mesa/{mesa-9.1.6 => mesa}/0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch (100%)
 delete mode 100644 meta/recipes-graphics/mesa/mesa_9.1.6.bb
 create mode 100644 meta/recipes-graphics/mesa/mesa_9.2.2.bb
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.18 => rxvt-unicode-9.19}/rxvt.desktop (100%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.18 => rxvt-unicode-9.19}/rxvt.png (100%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.18 => rxvt-unicode-9.19}/xwc.patch (100%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode_9.18.bb => rxvt-unicode_9.19.bb} (93%)

-- 
1.8.3.1


