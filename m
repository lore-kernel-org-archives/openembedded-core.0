Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1S809g-00034R-1x
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 03:11:04 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 14 Mar 2012 19:02:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="129155913"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by fmsmga001.fm.intel.com with ESMTP; 14 Mar 2012 19:02:17 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Mar 2012 19:02:15 -0700
Message-Id: <cover.1331776831.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [PATCH 0/8] fixes, recipe upgrades, & gcc multilib enabling commits
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
X-List-Received-Date: Thu, 15 Mar 2012 02:11:04 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

For more information look at the individual commit logs.

The following changes since commit 8bae18bb358755131f13865abb279ac687a03848:

  slang: Fix rpath QA warnings (2012-03-15 00:11:40 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib gcc-multilib-2-for-push
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gcc-multilib-2-for-push

Nitin A Kamble (8):
  gmp: upgrade from 5.0.3 to 5.0.4
  automake: upgrade from 1.11.2 to 1.11.3
  distro-tracking: update status of recipes
  ncurses: fix install error
  python: fix install when libdir is not "lib"
  multilib.conf: add other abi packages to target gcc's dependencies
  gcc: remove the 64bithack patch
  gcc: enable multilib for target gcc

 .../conf/distro/include/distro_tracking_fields.inc |   24 ++--
 meta/conf/multilib.conf                            |    3 +
 meta/recipes-core/ncurses/ncurses.inc              |    2 +-
 meta/recipes-devtools/automake/automake.inc        |    2 +-
 ...utomake_1.11.2_fix_for_pkglibexec_SCRIPTS.patch |  118 ---------------
 .../prefer-cpio-over-pax-for-ustar-archives.patch  |   30 ++--
 .../automake/automake/python-libdir.patch          |   32 ++---
 .../{automake_1.11.2.bb => automake_1.11.3.bb}     |    8 +-
 meta/recipes-devtools/gcc/gcc-4.6.inc              |    1 -
 meta/recipes-devtools/gcc/gcc-4.6/64bithack.patch  |   68 ---------
 meta/recipes-devtools/gcc/gcc-common.inc           |   23 +++
 meta/recipes-devtools/gcc/gcc-configure-common.inc |    2 +-
 meta/recipes-devtools/gcc/gcc-configure-target.inc |    1 +
 meta/recipes-devtools/gcc/gcc-multilib-config.inc  |  155 ++++++++++++++++++++
 meta/recipes-devtools/gcc/libgcc_4.6.bb            |   42 ++++++
 .../python/fix_for_using_different_libdir.patch    |   78 ++++++++++
 meta/recipes-devtools/python/python_2.7.2.bb       |    3 +-
 meta/recipes-support/gmp/gmp/gmp_bugfix.patch      |   94 ------------
 .../gmp/{gmp_5.0.3.bb => gmp_5.0.4.bb}             |    7 +-
 19 files changed, 358 insertions(+), 335 deletions(-)
 delete mode 100644 meta/recipes-devtools/automake/automake/automake_1.11.2_fix_for_pkglibexec_SCRIPTS.patch
 rename meta/recipes-devtools/automake/{automake_1.11.2.bb => automake_1.11.3.bb} (85%)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/64bithack.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-multilib-config.inc
 create mode 100644 meta/recipes-devtools/python/python/fix_for_using_different_libdir.patch
 delete mode 100644 meta/recipes-support/gmp/gmp/gmp_bugfix.patch
 rename meta/recipes-support/gmp/{gmp_5.0.3.bb => gmp_5.0.4.bb} (54%)

-- 
1.7.6.4



