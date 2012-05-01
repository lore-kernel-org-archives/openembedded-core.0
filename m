Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SPLHC-0000o2-2B
	for openembedded-core@lists.openembedded.org;
	Wed, 02 May 2012 00:10:30 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 01 May 2012 15:00:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="137620685"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 01 May 2012 15:00:45 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 May 2012 15:00:43 -0700
Message-Id: <cover.1335909595.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
Subject: [PATCH 0/6] Recipe upgrades
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
X-List-Received-Date: Tue, 01 May 2012 22:10:30 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

The following changes since commit d89f7b9cab1946a3267e3b0402f168f946d480b2:

  documentation/Makefile: Fixed figures publishing bug (2012-05-01 20:50:56 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/upgrades
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/upgrades

Nitin A Kamble (6):
  qt4: fix compilation issue
  makedepend: upgrade from 1.0.3 to 1.0.4
  quilt: upgrade from 0.51 to 0.60
  gdb: upgrade from 7.4 to 7.4.1
  python: upgrade from 2.7.2 to 2.7.3
  distro-tracking: update as per recent recipe upgrades

 meta/conf/distro/include/default-versions.inc      |    4 +-
 .../conf/distro/include/distro_tracking_fields.inc |   20 +++++-----
 meta/recipes-devtools/gdb/gdb-common.inc           |    6 ++--
 ...canadian_7.4.bb => gdb-cross-canadian_7.4.1.bb} |    2 +-
 .../gdb/{gdb-cross_7.4.bb => gdb-cross_7.4.1.bb}   |    0
 .../gdb/{gdb_7.4.bb => gdb_7.4.1.bb}               |    0
 ...thon-native_2.7.2.bb => python-native_2.7.3.bb} |    6 +---
 meta/recipes-devtools/python/python.inc            |    8 ++--
 .../python/python/04-default-is-optimized.patch    |   30 +++++++++------
 .../python/fix_for_using_different_libdir.patch    |   30 +++++++++-------
 .../python/sys_platform_is_now_always_linux2.patch |   39 --------------------
 .../python/{python_2.7.2.bb => python_2.7.3.bb}    |    3 +-
 .../quilt/{quilt-0.51.inc => quilt-0.60.inc}       |    4 +-
 .../{quilt-native_0.51.bb => quilt-native_0.60.bb} |    2 +-
 .../quilt/{quilt_0.51.bb => quilt_0.60.bb}         |    2 +-
 .../{makedepend_1.0.3.bb => makedepend_1.0.4.bb}   |    5 +--
 meta/recipes-qt/qt4/qt-4.8.1.inc                   |    1 +
 .../qt4/qt-4.8.1/fix_conflicting_types.patch       |   29 +++++++++++++++
 meta/recipes-qt/qt4/qt4-x11-free.inc               |    2 +-
 19 files changed, 94 insertions(+), 99 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_7.4.bb => gdb-cross-canadian_7.4.1.bb} (88%)
 rename meta/recipes-devtools/gdb/{gdb-cross_7.4.bb => gdb-cross_7.4.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb_7.4.bb => gdb_7.4.1.bb} (100%)
 rename meta/recipes-devtools/python/{python-native_2.7.2.bb => python-native_2.7.3.bb} (92%)
 delete mode 100644 meta/recipes-devtools/python/python/sys_platform_is_now_always_linux2.patch
 rename meta/recipes-devtools/python/{python_2.7.2.bb => python_2.7.3.bb} (98%)
 rename meta/recipes-devtools/quilt/{quilt-0.51.inc => quilt-0.60.inc} (84%)
 rename meta/recipes-devtools/quilt/{quilt-native_0.51.bb => quilt-native_0.60.bb} (83%)
 rename meta/recipes-devtools/quilt/{quilt_0.51.bb => quilt_0.60.bb} (98%)
 rename meta/recipes-graphics/xorg-util/{makedepend_1.0.3.bb => makedepend_1.0.4.bb} (82%)
 create mode 100644 meta/recipes-qt/qt4/qt-4.8.1/fix_conflicting_types.patch

-- 
1.7.7



