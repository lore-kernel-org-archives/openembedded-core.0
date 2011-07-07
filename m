Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QecZN-0001tS-Cl
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jul 2011 02:35:53 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 06 Jul 2011 17:32:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,490,1304319600"; d="scan'208";a="22400124"
Received: from nbuild2.sc.intel.com ([172.25.110.37])
	by orsmga002.jf.intel.com with ESMTP; 06 Jul 2011 17:32:01 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Jul 2011 17:31:59 -0700
Message-Id: <cover.1309998644.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.4.4
Subject: [PATCH 0/3] recipe upgrades
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
X-List-Received-Date: Thu, 07 Jul 2011 00:35:53 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

And update distro tracking data


The following changes since commit d4132fa12885fc050313a5c9aa6903e4fa92c94f:

  ui/depexp: If we're parsing zero files we need to ensure the cache progress bar gets hidden (2011-07-05 23:45:10 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/upgrades
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/upgrades

Nitin A Kamble (3):
  binutils: upgrade from 2.21 to 2.21.1
  gmp: upgrade from 5.0.1 to 5.0.2
  distro tracking: update devel.toolchain recipes's fields

 .../conf/distro/include/distro_tracking_fields.inc |   33 +-
 ...n_2.21.bb => binutils-cross-canadian_2.21.1.bb} |    0
 ...tils-cross_2.21.bb => binutils-cross_2.21.1.bb} |    0
 ...rosssdk_2.21.bb => binutils-crosssdk_2.21.1.bb} |    0
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
 .../{binutils_2.21.bb => binutils_2.21.1.bb}       |    7 +-
 .../gmp/{gmp_5.0.1.bb => gmp_5.0.2.bb}             |    4 +-
 19 files changed, 892 insertions(+), 877 deletions(-)
 rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.21.bb => binutils-cross-canadian_2.21.1.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-cross_2.21.bb => binutils-cross_2.21.1.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.21.bb => binutils-crosssdk_2.21.1.bb} (100%)
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
 rename meta/recipes-devtools/binutils/{binutils_2.21.bb => binutils_2.21.1.bb} (87%)
 rename meta/recipes-support/gmp/{gmp_5.0.1.bb => gmp_5.0.2.bb} (67%)

-- 
1.7.4.4



