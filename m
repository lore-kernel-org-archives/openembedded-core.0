Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RsiGs-0008TJ-Na
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Feb 2012 23:03:18 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 01 Feb 2012 13:55:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="112999999"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by fmsmga001.fm.intel.com with ESMTP; 01 Feb 2012 13:55:22 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Feb 2012 13:55:20 -0800
Message-Id: <cover.1328133261.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [PATCH 0/8] Variosu recipe upgrades
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
X-List-Received-Date: Wed, 01 Feb 2012 22:03:19 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Nitin

The following changes since commit 8d4d9a15c4947e55ed217c6035e76fcff724e544:

  package bbclass: allow per package PRIVATE_LIBS (2012-02-01 15:15:15 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/upgrades
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/upgrades

Nitin A Kamble (8):
  byacc: upggrade from 20111219 to 20120115
  gmp: upgrade from 5.0.2 to 5.0.3
  bdwgc: change the PV
  gdb: upgrade from 7.3.1 to 7.4
  quilt: upgrade from 0.50 to 0.51
  python-dbus: upgrade from 0.84.0 to 1.0.0
  linux-libc-headers: new recipes for latest upstream 3.2.2
  distro_tracking: update for current upgrades

 .../conf/distro/include/distro_tracking_fields.inc |   47 ++++++++--------
 meta/recipes-devtools/gdb/gdb-common.inc           |    4 +-
 ...canadian_7.3.1.bb => gdb-cross-canadian_7.4.bb} |    0
 .../gdb/{gdb-cross_7.3.1.bb => gdb-cross_7.4.bb}   |    0
 .../gdb/{gdb_7.3.1.bb => gdb_7.4.bb}               |    0
 ...{python-dbus_0.84.0.bb => python-dbus_1.0.0.bb} |    4 +-
 .../quilt/{quilt-0.50.inc => quilt-0.51.inc}       |    4 +-
 .../{quilt-native_0.50.bb => quilt-native_0.51.bb} |    0
 .../quilt/{quilt_0.50.bb => quilt_0.51.bb}         |    0
 .../byacc/{byacc_20111219.bb => byacc_20120115.bb} |    6 +-
 .../linux-libc-headers/linux-libc-headers_3.2.2.bb |    7 ++
 .../{bdwgc_20110107.bb => bdwgc_7_2alpha5.bb}      |    0
 meta/recipes-support/gmp/gmp/amd64.patch           |    8 ++-
 meta/recipes-support/gmp/gmp/configure.patch       |   60 ++++++++++++--------
 meta/recipes-support/gmp/gmp/sh4-asmfix.patch      |   28 ---------
 .../gmp/{gmp_5.0.2.bb => gmp_5.0.3.bb}             |    9 +--
 16 files changed, 84 insertions(+), 93 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_7.3.1.bb => gdb-cross-canadian_7.4.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_7.3.1.bb => gdb-cross_7.4.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb_7.3.1.bb => gdb_7.4.bb} (100%)
 rename meta/recipes-devtools/python/{python-dbus_0.84.0.bb => python-dbus_1.0.0.bb} (83%)
 rename meta/recipes-devtools/quilt/{quilt-0.50.inc => quilt-0.51.inc} (86%)
 rename meta/recipes-devtools/quilt/{quilt-native_0.50.bb => quilt-native_0.51.bb} (100%)
 rename meta/recipes-devtools/quilt/{quilt_0.50.bb => quilt_0.51.bb} (100%)
 rename meta/recipes-extended/byacc/{byacc_20111219.bb => byacc_20120115.bb} (59%)
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.2.2.bb
 rename meta/recipes-support/bdwgc/{bdwgc_20110107.bb => bdwgc_7_2alpha5.bb} (100%)
 delete mode 100644 meta/recipes-support/gmp/gmp/sh4-asmfix.patch
 rename meta/recipes-support/gmp/{gmp_5.0.2.bb => gmp_5.0.3.bb} (57%)

-- 
1.7.6.4



