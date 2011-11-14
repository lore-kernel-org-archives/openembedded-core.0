Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RPoFe-00022z-OI
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Nov 2011 05:34:35 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 13 Nov 2011 20:28:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="75055109"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.217])
	by orsmga001.jf.intel.com with ESMTP; 13 Nov 2011 20:28:12 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Nov 2011 20:27:50 -0800
Message-Id: <cover.1321244755.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [CONSOLIDATED PULL 00/21] Updates and Fixes
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
X-List-Received-Date: Mon, 14 Nov 2011 04:34:35 -0000

Richard,

This set has been build tested and reviewed.  I did have to update
bitbake.conf for both then gnu-config and base.bblcass changes to 
modify ASSUME_PROVIDED, please review this.

Thanks
	Sau!

The following changes since commit a8ed4fcd79f6283c1d45f347dce894d784183900:

  xinit: rdepends on util-linux-mcookie to avoid brining whole util-linux (2011-11-11 11:00:56 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Martin Jansa (13):
  libatomics-ops: force ARM mode
  pulseaudio-0.9.23: force ARM mode
  aspell: force ARM mode
  webkit-gtk: force arm mode to work around binutils segfault
  subversion: add 1.7.0 with native support and negative D_P for now
  base.bbclass: add subversion-native to DEPENDS if there is svn:// in
    SRC_URI
  time: rename files dir to time-1.7 for faster lookup
  time: drop default S and 2 useless comments
  time: use u-a for time, conflicts with busybox
  util-linux: use u-a for flock and blockdev, conflicts with busybox
  util-linux: add missing u-a calls for setsid chrt
  util-linux: bump PR after u-a changes
  kbd: use u-a for chvt, deallocvt, fgconssole, openvt, conflicts with
    busybox

Otavio Salvador (1):
  dhcp: generate initial leases files for server

Saul Wold (5):
  file: update to 5.09
  gnu-config: update to git HEAD
  boost: Update to 1.47.0 & Cleanup
  bitbake.conf: Update ASSUME_PROVIDED
  distro_tracking: Refect Recipe Updates & Status

Simon Busch (1):
  qt4-x11-free: bring back pkg-config fixups

Xiaofeng Yan (1):
  directfb: update to 1.4.15

 meta/classes/base.bbclass                          |    8 +-
 meta/conf/bitbake.conf                             |    7 +-
 .../conf/distro/include/distro_tracking_fields.inc |   49 ++--
 meta/recipes-connectivity/dhcp/dhcp.inc            |    9 +-
 meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb       |    2 +-
 meta/recipes-core/kbd/kbd_1.15.2.bb                |   29 ++-
 meta/recipes-core/util-linux/util-linux.inc        |   14 +-
 meta/recipes-core/util-linux/util-linux_2.19.1.bb  |    2 +-
 .../file/file/fix_version_check.patch              |   21 ++
 .../file/{file_5.04.bb => file_5.09.bb}            |    9 +-
 .../gnu-config/config-guess-uclibc.patch           |  145 +++++------
 .../{gnu-config_20080123.bb => gnu-config_git.bb}  |   15 +-
 .../subversion/subversion-1.7.0/libtool2.patch     |   15 ++
 .../subversion/subversion_1.7.0.bb                 |   37 +++
 .../time/{files => time-1.7}/debian.patch          |    0
 meta/recipes-extended/time/time.inc                |   10 +
 meta/recipes-extended/time/time_1.7.bb             |    5 +-
 .../{directfb_1.4.12.bb => directfb_1.4.15.bb}     |    9 +-
 .../directfb-1.2.x-fix-pkgconfig-cflags.patch      |   36 ++--
 .../pulseaudio/libatomics-ops_1.2.bb               |    2 +-
 .../pulseaudio/pulseaudio_0.9.23.bb                |    2 +-
 meta/recipes-qt/qt4/qt4-x11-free.inc               |   16 ++-
 meta/recipes-sato/webkit/webkit-gtk_svn.bb         |    2 +-
 meta/recipes-support/aspell/aspell_0.60.6.1.bb     |    2 +-
 meta/recipes-support/boost/boost-jam-native.inc    |   32 ---
 .../boost/boost-jam-native_3.1.18.bb               |    8 -
 .../boost/{boost-36.inc => boost.inc}              |   42 +++-
 .../boost/{boost_1.44.0.bb => boost_1.47.0.bb}     |   13 +-
 .../recipes-support/boost/files/1.34.1-gcc43.patch |  226 -----------------
 .../boost/files/atomic_count_gcc_atomicity.patch   |   15 --
 meta/recipes-support/boost/files/gcc41.patch       |   16 --
 meta/recipes-support/boost/files/gcc43.patch       |  258 --------------------
 .../recipes-support/boost/files/linux-uclibc.patch |   12 -
 .../boost/files/unit_test_log10f.patch             |   22 --
 34 files changed, 333 insertions(+), 757 deletions(-)
 create mode 100644 meta/recipes-devtools/file/file/fix_version_check.patch
 rename meta/recipes-devtools/file/{file_5.04.bb => file_5.09.bb} (79%)
 rename meta/recipes-devtools/gnu-config/{gnu-config_20080123.bb => gnu-config_git.bb} (73%)
 create mode 100644 meta/recipes-devtools/subversion/subversion-1.7.0/libtool2.patch
 create mode 100644 meta/recipes-devtools/subversion/subversion_1.7.0.bb
 rename meta/recipes-extended/time/{files => time-1.7}/debian.patch (100%)
 rename meta/recipes-graphics/directfb/{directfb_1.4.12.bb => directfb_1.4.15.bb} (63%)
 delete mode 100644 meta/recipes-support/boost/boost-jam-native.inc
 delete mode 100644 meta/recipes-support/boost/boost-jam-native_3.1.18.bb
 rename meta/recipes-support/boost/{boost-36.inc => boost.inc} (88%)
 rename meta/recipes-support/boost/{boost_1.44.0.bb => boost_1.47.0.bb} (66%)
 delete mode 100644 meta/recipes-support/boost/files/1.34.1-gcc43.patch
 delete mode 100644 meta/recipes-support/boost/files/atomic_count_gcc_atomicity.patch
 delete mode 100644 meta/recipes-support/boost/files/gcc41.patch
 delete mode 100644 meta/recipes-support/boost/files/gcc43.patch
 delete mode 100644 meta/recipes-support/boost/files/linux-uclibc.patch
 delete mode 100644 meta/recipes-support/boost/files/unit_test_log10f.patch

-- 
1.7.6.4



