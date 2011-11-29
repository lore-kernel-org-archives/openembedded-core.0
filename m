Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RVTUX-0001f7-Fz
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 20:37:21 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 29 Nov 2011 11:30:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="81010860"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by orsmga001.jf.intel.com with ESMTP; 29 Nov 2011 11:30:41 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Nov 2011 11:30:39 -0800
Message-Id: <cover.1322594901.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
Cc: Phil Blundell <philb@gnu.org>
Subject: [PATCH 0/4] Misc recipe fixes
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
X-List-Received-Date: Tue, 29 Nov 2011 19:37:21 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Earlier libtool commit is reworked to keep the SUMMARY line and clean up 
the white space changes

gmp commit is also reworked to simplify the changes as per Phils feedback.

Nitin

The following changes since commit cf02474bda67f4f1043b2e95e1b371b2354585a7:

  qt-mobility: Add missing patch (2011-11-29 14:36:18 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/misc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/misc

Nitin A Kamble (4):
  gmp: also generate the libgmpcxx library & package it properly
  binutils: fix for .debug files QA warnings
  libtool: Upgrade from 2.4 -> 2.4.2
  libx11-trip_1.4.4: fix the source tarall checksums

 .../binutils/binutils-cross-canadian_2.22.bb       |    2 +-
 .../binutils/binutils-crosssdk_2.22.bb             |    2 +-
 meta/recipes-devtools/binutils/binutils.inc        |    2 +
 meta/recipes-devtools/binutils/binutils_2.22.bb    |    2 +-
 .../libtool/{libtool.inc => libtool-2.4.2.inc}     |   19 ++-
 meta/recipes-devtools/libtool/libtool-2.4.inc      |   13 --
 ...libtool-cross_2.4.bb => libtool-cross_2.4.2.bb} |    2 +-
 ...btool-native_2.4.bb => libtool-native_2.4.2.bb} |    2 +-
 ...nativesdk_2.4.bb => libtool-nativesdk_2.4.2.bb} |    2 +-
 .../avoid_absolute_paths_for_general_utils.patch   |    8 +-
 .../libtool/libtool/fix-final-rpath.patch          |   10 +-
 .../libtool/libtool/fix-rpath.patch                |   12 +-
 .../libtool/libtool/prefix-manpage-fix.patch       |   10 +-
 meta/recipes-devtools/libtool/libtool/prefix.patch |   42 ++--
 .../libtool/libtool/rename-with-sysroot.patch      |  194 ++++++++++----------
 .../libtool/libtool/resolve-sysroot.patch          |   42 -----
 .../libtool/libtool/trailingslash.patch            |   10 +-
 .../libtool/libtool/use-sysroot-in-libpath.patch   |    8 +-
 .../libtool/{libtool_2.4.bb => libtool_2.4.2.bb}   |    2 +-
 .../recipes-graphics/xorg-lib/libx11-trim_1.4.4.bb |    5 +-
 meta/recipes-support/gmp/gmp.inc                   |    5 +
 meta/recipes-support/gmp/gmp_5.0.2.bb              |    2 +-
 22 files changed, 181 insertions(+), 215 deletions(-)
 rename meta/recipes-devtools/libtool/{libtool.inc => libtool-2.4.2.inc} (68%)
 delete mode 100644 meta/recipes-devtools/libtool/libtool-2.4.inc
 rename meta/recipes-devtools/libtool/{libtool-cross_2.4.bb => libtool-cross_2.4.2.bb} (98%)
 rename meta/recipes-devtools/libtool/{libtool-native_2.4.bb => libtool-native_2.4.2.bb} (96%)
 rename meta/recipes-devtools/libtool/{libtool-nativesdk_2.4.bb => libtool-nativesdk_2.4.2.bb} (97%)
 delete mode 100644 meta/recipes-devtools/libtool/libtool/resolve-sysroot.patch
 rename meta/recipes-devtools/libtool/{libtool_2.4.bb => libtool_2.4.2.bb} (94%)

-- 
1.7.6.4



