Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1R9Rxv-00027W-VF
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 03:32:40 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 29 Sep 2011 18:27:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="57410752"
Received: from nbuild2.sc.intel.com ([172.25.110.37])
	by orsmga001.jf.intel.com with ESMTP; 29 Sep 2011 18:27:10 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Sep 2011 18:27:08 -0700
Message-Id: <cover.1317344910.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.4.4
Subject: [PATCH 0/4] Recipes upgrades
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
X-List-Received-Date: Fri, 30 Sep 2011 01:32:40 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

The following changes since commit 9d1db6cc928199f8ac4960e8d4648563ef141427:

  python: fix sqlite RPATH issue (2011-09-29 16:57:30 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/upgrades
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/upgrades

Nitin A Kamble (4):
  gdb: upgrade from 7.3a to 7.3.1
  byacc: upgrade from 20101229 to 20110908
  python-dbus: upgrade from 0.83.2 to 0.84.0
  python, python-native: upgrade from 2.6.6 to 2.7.2

 meta/conf/distro/include/default-versions.inc      |    6 +-
 meta/recipes-devtools/gdb/gdb-common.inc           |    4 +-
 ...anadian_7.3a.bb => gdb-cross-canadian_7.3.1.bb} |    2 +-
 .../gdb/{gdb-cross_7.3a.bb => gdb-cross_7.3.1.bb}  |    2 +-
 .../gdb/{gdb_7.3a.bb => gdb_7.3.1.bb}              |    2 +-
 ...on-2.6-manifest.inc => python-2.7-manifest.inc} |    0
 ...python-dbus_0.83.2.bb => python-dbus_0.84.0.bb} |    4 +-
 .../python/python-native/multilib.patch            |  240 ++++++++++++++++++++
 .../python/python-native/nohostlibs.patch          |   36 ++-
 ...thon-native_2.6.6.bb => python-native_2.7.2.bb} |   13 +-
 meta/recipes-devtools/python/python.inc            |   16 +-
 .../01-use-proper-tools-for-cross-build.patch      |  118 +++++++---
 .../python/python/02-remove-test-for-cross.patch   |  108 ---------
 .../06-avoid_usr_lib_termcap_path_in_linking.patch |   16 +-
 .../python/06-ctypes-libffi-fix-configure.patch    |   42 ++---
 meta/recipes-devtools/python/python/multilib.patch |  126 ++++++-----
 .../python/python/security_issue_2254_fix.patch    |  184 ---------------
 .../python/{python_2.6.6.bb => python_2.7.2.bb}    |   10 +-
 .../byacc/{byacc_20101229.bb => byacc_20110908.bb} |    4 +-
 meta/site/arm-common                               |    3 +
 meta/site/mips-common                              |    3 +
 21 files changed, 476 insertions(+), 463 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_7.3a.bb => gdb-cross-canadian_7.3.1.bb} (83%)
 rename meta/recipes-devtools/gdb/{gdb-cross_7.3a.bb => gdb-cross_7.3.1.bb} (78%)
 rename meta/recipes-devtools/gdb/{gdb_7.3a.bb => gdb_7.3.1.bb} (91%)
 rename meta/recipes-devtools/python/{python-2.6-manifest.inc => python-2.7-manifest.inc} (100%)
 rename meta/recipes-devtools/python/{python-dbus_0.83.2.bb => python-dbus_0.84.0.bb} (83%)
 create mode 100644 meta/recipes-devtools/python/python-native/multilib.patch
 rename meta/recipes-devtools/python/{python-native_2.6.6.bb => python-native_2.7.2.bb} (74%)
 delete mode 100644 meta/recipes-devtools/python/python/02-remove-test-for-cross.patch
 delete mode 100644 meta/recipes-devtools/python/python/security_issue_2254_fix.patch
 rename meta/recipes-devtools/python/{python_2.6.6.bb => python_2.7.2.bb} (92%)
 rename meta/recipes-extended/byacc/{byacc_20101229.bb => byacc_20110908.bb} (49%)

-- 
1.7.4.4



