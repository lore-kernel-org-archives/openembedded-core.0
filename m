Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RVBn0-0002i2-AC
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 01:43:14 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 28 Nov 2011 16:36:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="80668295"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by orsmga001.jf.intel.com with ESMTP; 28 Nov 2011 16:36:34 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Nov 2011 16:36:32 -0800
Message-Id: <cover.1322526931.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [PATCH 0/4] Misc recipe upgrades & fixes
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
X-List-Received-Date: Tue, 29 Nov 2011 00:43:14 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

The following changes since commit 4cd96710785eb05abeff1f281878655118d4a7dd:

  bitbake: Update users of getVar/setVar to use the data store functions directly (2011-11-27 10:35:30 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/misc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/misc

Nitin A Kamble (4):
  binutils: upgrade from 2.21.1a to 2.22
  libtool: Upgrade from 2.4 -> 2.4.2
  gmp: also generate the libgmpcxx library & package it properly
  distro-tracking: update information for binutils & libtool

 .../conf/distro/include/distro_tracking_fields.inc |   10 +-
 meta/conf/distro/include/tcmode-default.inc        |    2 +-
 ..._2.21.1a.bb => binutils-cross-canadian_2.22.bb} |    2 +-
 ...ils-cross_2.21.1a.bb => binutils-cross_2.22.bb} |    0
 ...osssdk_2.21.1a.bb => binutils-crosssdk_2.22.bb} |    2 +-
 .../binutils/binutils/110-arm-eabi-conf.patch      |   24 -
 .../binutils/binutils-2.19.1-ld-sysroot.patch      |   10 +-
 .../binutils/binutils/binutils-poison.patch        |   84 ++-
 .../binutils/binutils/binutils-powerpc-e5500.patch |   52 +-
 .../binutils/binutils-uclibc-100-uclibc-conf.patch |   40 +-
 ...binutils-uclibc-300-001_ld_makefile_patch.patch |   16 +-
 ...binutils-uclibc-300-006_better_file_error.patch |    9 +-
 ...ils-uclibc-300-012_check_ldrunpath_length.patch |   12 +-
 .../binutils/binutils-uclibc-gas-needs-libm.patch  |   11 +-
 .../binutils/binutils-x86_64_i386_biarch.patch     |   10 +-
 .../binutils/binutils/clone-shadow.patch           |   18 +-
 .../binutils/binutils/libiberty_path_fix.patch     |    8 +-
 .../binutils/binutils/libtool-2.4-update.patch     |  803 ++++++++++----------
 .../binutils/binutils/libtool-rpath-fix.patch      |   11 +-
 .../{binutils_2.21.1a.bb => binutils_2.22.bb}      |    7 +-
 .../libtool/{libtool.inc => libtool-2.4.2.inc}     |   26 +-
 meta/recipes-devtools/libtool/libtool-2.4.inc      |   13 -
 ...libtool-cross_2.4.bb => libtool-cross_2.4.2.bb} |    2 +-
 ...btool-native_2.4.bb => libtool-native_2.4.2.bb} |    2 +-
 ...nativesdk_2.4.bb => libtool-nativesdk_2.4.2.bb} |    2 +-
 .../avoid_absolute_paths_for_general_utils.patch   |    8 +-
 .../libtool/libtool/fix-final-rpath.patch          |   10 +-
 .../libtool/libtool/fix-rpath.patch                |   12 +-
 .../libtool/libtool/prefix-manpage-fix.patch       |   10 +-
 meta/recipes-devtools/libtool/libtool/prefix.patch |   42 +-
 .../libtool/libtool/rename-with-sysroot.patch      |  194 +++---
 .../libtool/libtool/resolve-sysroot.patch          |   42 -
 .../libtool/libtool/trailingslash.patch            |   10 +-
 .../libtool/libtool/use-sysroot-in-libpath.patch   |    8 +-
 .../libtool/{libtool_2.4.bb => libtool_2.4.2.bb}   |    2 +-
 meta/recipes-support/gmp/gmp.inc                   |    6 +
 meta/recipes-support/gmp/gmp_5.0.2.bb              |    2 +-
 37 files changed, 726 insertions(+), 796 deletions(-)
 rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.21.1a.bb => binutils-cross-canadian_2.22.bb} (86%)
 rename meta/recipes-devtools/binutils/{binutils-cross_2.21.1a.bb => binutils-cross_2.22.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.21.1a.bb => binutils-crosssdk_2.22.bb} (96%)
 delete mode 100644 meta/recipes-devtools/binutils/binutils/110-arm-eabi-conf.patch
 rename meta/recipes-devtools/binutils/{binutils_2.21.1a.bb => binutils_2.22.bb} (84%)
 rename meta/recipes-devtools/libtool/{libtool.inc => libtool-2.4.2.inc} (57%)
 delete mode 100644 meta/recipes-devtools/libtool/libtool-2.4.inc
 rename meta/recipes-devtools/libtool/{libtool-cross_2.4.bb => libtool-cross_2.4.2.bb} (98%)
 rename meta/recipes-devtools/libtool/{libtool-native_2.4.bb => libtool-native_2.4.2.bb} (96%)
 rename meta/recipes-devtools/libtool/{libtool-nativesdk_2.4.bb => libtool-nativesdk_2.4.2.bb} (97%)
 delete mode 100644 meta/recipes-devtools/libtool/libtool/resolve-sysroot.patch
 rename meta/recipes-devtools/libtool/{libtool_2.4.bb => libtool_2.4.2.bb} (94%)

-- 
1.7.6.4



