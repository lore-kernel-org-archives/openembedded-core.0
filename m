Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QevCY-000390-OH
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jul 2011 22:29:38 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 07 Jul 2011 13:25:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,495,1304319600"; d="scan'208";a="27588171"
Received: from nbuild2.sc.intel.com ([172.25.110.37])
	by fmsmga001.fm.intel.com with ESMTP; 07 Jul 2011 13:25:41 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jul 2011 13:25:39 -0700
Message-Id: <cover.1310070283.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.4.4
Subject: [PATCH 0/7] upgrades & misc fixes
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
X-List-Received-Date: Thu, 07 Jul 2011 20:29:43 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

The following changes since commit 2c79c9eb7ef8ef0aef8c3096c3c4387e28e56ea2:

  pulseaudio: add 0.9.23 (2011-07-07 13:45:32 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/misc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/misc

Nitin A Kamble (7):
  binutils: upgrade from 2.21 to 2.21.1
  gmp: upgrade from 5.0.1 to 5.0.2
  distro tracking: update devel.toolchain recipes's fields
  binutils: package unpackaged files
  eglibc: fix installed but not packaged files
  gcc-runtime: fix installed but unpackaged files
  elfutils: fix compilations issue with the gcc 4.7

 .../conf/distro/include/distro_tracking_fields.inc |   33 +-
 meta/recipes-core/eglibc/eglibc-package.inc        |    6 +-
 meta/recipes-core/eglibc/eglibc_2.13.bb            |    2 +-
 ...n_2.21.bb => binutils-cross-canadian_2.21.1.bb} |    2 +-
 ...tils-cross_2.21.bb => binutils-cross_2.21.1.bb} |    0
 ...rosssdk_2.21.bb => binutils-crosssdk_2.21.1.bb} |    2 +-
 meta/recipes-devtools/binutils/binutils.inc        |    2 +
 .../110-arm-eabi-conf.patch                        |    0
 .../binutils-2.19.1-ld-sysroot.patch               |    0
 .../binutils-poison.patch                          |    0
 .../binutils-pr12366.patch                         |    0
 .../binutils-uclibc-100-uclibc-conf.patch          |    0
 ...binutils-uclibc-300-001_ld_makefile_patch.patch |    0
 ...binutils-uclibc-300-006_better_file_error.patch |    0
 ...ils-uclibc-300-012_check_ldrunpath_length.patch |    0
 .../binutils-uclibc-gas-needs-libm.patch           |    0
 .../binutils-x86_64_i386_biarch.patch              |    0
 .../libiberty_path_fix.patch                       |    0
 .../libtool-2.4-update.patch                       | 1725 ++++++++++----------
 .../libtool-rpath-fix.patch                        |    0
 .../{binutils_2.21.bb => binutils_2.21.1.bb}       |    5 +-
 .../{elfutils-0.148 => elfutils}/arm_backend.diff  |    0
 .../do-autoreconf.diff                             |    0
 .../elf_additions.diff                             |    0
 .../elfutils-fsize.patch                           |    0
 .../elfutils/elfutils/fix_for_gcc-4.7.patch        |   73 +
 .../{elfutils-0.148 => elfutils}/hppa_backend.diff |    0
 .../{elfutils-0.148 => elfutils}/i386_dis.h        |    0
 .../{elfutils-0.148 => elfutils}/m68k_backend.diff |    0
 .../{elfutils-0.148 => elfutils}/mempcpy.patch     |    0
 .../{elfutils-0.148 => elfutils}/mips_backend.diff |    0
 .../redhat-portability.diff                        |    0
 .../redhat-robustify.diff                          |    0
 .../remove-unused.patch                            |    0
 .../testsuite-ignore-elflint.diff                  |    0
 .../uclibc-support.patch                           |    0
 .../{elfutils-0.148 => elfutils}/x86_64_dis.h      |    0
 meta/recipes-devtools/elfutils/elfutils_0.148.bb   |    3 +-
 meta/recipes-devtools/gcc/gcc-package-runtime.inc  |    2 +-
 .../gmp/{gmp_5.0.1.bb => gmp_5.0.2.bb}             |    4 +-
 40 files changed, 977 insertions(+), 882 deletions(-)
 rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.21.bb => binutils-cross-canadian_2.21.1.bb} (86%)
 rename meta/recipes-devtools/binutils/{binutils-cross_2.21.bb => binutils-cross_2.21.1.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.21.bb => binutils-crosssdk_2.21.1.bb} (96%)
 rename meta/recipes-devtools/binutils/{binutils-2.21 => binutils}/110-arm-eabi-conf.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.21 => binutils}/binutils-2.19.1-ld-sysroot.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.21 => binutils}/binutils-poison.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.21 => binutils}/binutils-pr12366.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.21 => binutils}/binutils-uclibc-100-uclibc-conf.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.21 => binutils}/binutils-uclibc-300-001_ld_makefile_patch.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.21 => binutils}/binutils-uclibc-300-006_better_file_error.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.21 => binutils}/binutils-uclibc-300-012_check_ldrunpath_length.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.21 => binutils}/binutils-uclibc-gas-needs-libm.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.21 => binutils}/binutils-x86_64_i386_biarch.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.21 => binutils}/libiberty_path_fix.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.21 => binutils}/libtool-2.4-update.patch (94%)
 rename meta/recipes-devtools/binutils/{binutils-2.21 => binutils}/libtool-rpath-fix.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils_2.21.bb => binutils_2.21.1.bb} (88%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.148 => elfutils}/arm_backend.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.148 => elfutils}/do-autoreconf.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.148 => elfutils}/elf_additions.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.148 => elfutils}/elfutils-fsize.patch (100%)
 create mode 100644 meta/recipes-devtools/elfutils/elfutils/fix_for_gcc-4.7.patch
 rename meta/recipes-devtools/elfutils/{elfutils-0.148 => elfutils}/hppa_backend.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.148 => elfutils}/i386_dis.h (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.148 => elfutils}/m68k_backend.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.148 => elfutils}/mempcpy.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.148 => elfutils}/mips_backend.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.148 => elfutils}/redhat-portability.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.148 => elfutils}/redhat-robustify.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.148 => elfutils}/remove-unused.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.148 => elfutils}/testsuite-ignore-elflint.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.148 => elfutils}/uclibc-support.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.148 => elfutils}/x86_64_dis.h (100%)
 rename meta/recipes-support/gmp/{gmp_5.0.1.bb => gmp_5.0.2.bb} (67%)

-- 
1.7.4.4



