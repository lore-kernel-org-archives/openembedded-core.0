Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qu9hd-0006Yk-0Q
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Aug 2011 23:00:37 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 18 Aug 2011 13:55:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,247,1312182000"; d="scan'208";a="39980155"
Received: from unknown (HELO swold-MOBL.local) ([10.255.13.226])
	by azsmga001.ch.intel.com with ESMTP; 18 Aug 2011 13:55:53 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Aug 2011 13:55:19 -0700
Message-Id: <cover.1313700595.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [CONSOLIDATED PULL 00/32] Various Fixes, Updates
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
X-List-Received-Date: Thu, 18 Aug 2011 21:00:38 -0000

Richard,

Latest batch of requests, built.  There's a perl-native patch and
a change to make udev an overridable item that might need more thought.

Sau!

The following changes since commit 2e83e6755441cb14bd907d306974338c15173189:

  kernel: restore crtsavres.o to enable building external modules on powerpc (2011-08-17 15:46:16 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Adrian Alonso (1):
  file: new file version 5.07

Anders Darander (3):
  qt4: allow a reduction in build time
  qemu: modify search paths for libgl
  scripts/runqemu: modify search paths for libgl

Dongxiao Xu (7):
  busybox: Change ${PN} to ${BPN} in file names
  sysvinit: Change ${PN} to ${BPN} in file names
  curl: Use BPN instead of PN for style like lib${PN}
  ea-acl: Use BPN instead of PN for style like lib${PN}
  attr: Use BPN instead of PN for style like lib${PN}
  acl: Use BPN instead of PN for style like lib${PN}
  procps: Fix lib path to support multilib

Jingdong Lu (1):
  initrdscripts: fix init-live.sh

Joshua Lock (1):
  glib-2.0: explicitly disable dtrace and systemtap for native varaint

Kang Kai (6):
  at: make at usable for common user
  eglibc: check dependencies among eglibc options
  mailx: update license and distro tracking fileds
  slang: add homepage and update distro tracking fields
  alsa-tools: update license and add distro tracking fields
  newt: update distro tracking fields

Khem Raj (4):
  conf,recipes: Redefine LINKER_HASH_STYLE
  gcc-4.6: Use --with-linker-hash-style configure option
  task-core-tools: Use LTTNGUST variable instead of hardcoding
    lttng-ust
  gdb: Add lttng-ust to DEPENDS only for eglibc

Koen Kooi (1):
  tcl: fix networking breakage

Martin Jansa (2):
  task-core-boot: allow distribution to override default dev_manager
    provider with VIRTUAL-RUNTIME_dev_manager
  bluez4: update recipe from meta-oe

Noor Ahsan (1):
  mtd-utils: Added recipe of newer version 1.4.4.

Paul Eggleton (2):
  image.bbclass, kernel.bbclass: create warning file about deleting
    deploydir files
  sanity.bbclass: add optional untested host distro warning

Phil Blundell (2):
  libxkbcommon: new
  libxslt: fix packaging of static libraries

Wenzong Fan (1):
  perl-native: Update find_perl to find the perl wrapper

 meta/classes/image.bbclass                         |    2 +
 meta/classes/kernel.bbclass                        |    2 +
 meta/classes/sanity.bbclass                        |   48 +++++++++++++
 meta/conf/bitbake.conf                             |    4 +-
 meta/conf/distro/include/default-distrovars.inc    |    2 +-
 .../conf/distro/include/distro_tracking_fields.inc |   29 +++++---
 meta/conf/distro/include/tcmode-default.inc        |    6 ++-
 meta/files/deploydir_readme.txt                    |    8 ++
 meta/recipes-connectivity/bluez/bluez4_4.96.bb     |   17 ++---
 meta/recipes-core/busybox/busybox.inc              |   30 ++++----
 meta/recipes-core/busybox/busybox_1.18.4.bb        |    2 +-
 meta/recipes-core/eglibc/eglibc-options.inc        |   75 +++++++++++++++++++-
 meta/recipes-core/glib-2.0/glib.inc                |    2 +-
 meta/recipes-core/initrdscripts/files/init-live.sh |    2 +-
 .../initrdscripts/initramfs-live-boot_1.0.bb       |    2 +-
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb     |   52 +++++++-------
 meta/recipes-core/tasks/task-core-boot.bb          |    5 +-
 meta/recipes-core/tasks/task-core-tools.bb         |    6 +-
 meta/recipes-core/uclibc/uclibc.inc                |    2 +-
 meta/recipes-devtools/file/file/ge-le.patch        |   72 -------------------
 .../file/file/stringb-compat.patch                 |   31 --------
 .../file/{file_5.04.bb => file_5.07.bb}            |    9 +--
 meta/recipes-devtools/gcc/gcc-4.6.inc              |    3 +-
 meta/recipes-devtools/gdb/gdb-common.inc           |   11 +++-
 .../add-exclusion-to-mkfs-jffs2-git-2.patch        |    0
 .../mtd/{mtd-utils_1.4.1.bb => mtd-utils_1.4.4.bb} |   11 ++--
 .../perl/perl-5.12.3/MM_Unix.pm.patch              |   22 ++++++
 meta/recipes-devtools/perl/perl-native_5.12.3.bb   |    5 +-
 meta/recipes-devtools/qemu/qemu.inc                |    2 +-
 meta/recipes-devtools/tcltk/tcl_8.5.9.bb           |    6 +-
 meta/recipes-extended/at/at_3.1.12.bb              |   26 ++------
 meta/recipes-extended/mailx/mailx_12.5.bb          |    4 +-
 .../procps/procps-3.2.8/install.patch              |   29 --------
 meta/recipes-extended/procps/procps.inc            |    3 +-
 meta/recipes-extended/procps/procps_3.2.8.bb       |    8 +-
 meta/recipes-extended/slang/slang_2.2.4.bb         |    3 +-
 .../xorg-lib/libxkbcommon/cross.patch              |   43 +++++++++++
 meta/recipes-graphics/xorg-lib/libxkbcommon_git.bb |   22 ++++++
 .../recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb |   11 ++-
 meta/recipes-qt/qt4/qt4.inc                        |   13 ++--
 meta/recipes-support/attr/acl.inc                  |    2 +-
 meta/recipes-support/attr/attr.inc                 |    2 +-
 meta/recipes-support/attr/ea-acl.inc               |    6 +-
 meta/recipes-support/curl/curl_7.21.7.bb           |    8 +-
 meta/recipes-support/libxslt/libxslt_1.1.26.bb     |   15 ++--
 scripts/runqemu                                    |    2 +-
 46 files changed, 380 insertions(+), 285 deletions(-)
 create mode 100644 meta/files/deploydir_readme.txt
 delete mode 100644 meta/recipes-devtools/file/file/ge-le.patch
 delete mode 100644 meta/recipes-devtools/file/file/stringb-compat.patch
 rename meta/recipes-devtools/file/{file_5.04.bb => file_5.07.bb} (79%)
 rename meta/recipes-devtools/mtd/{mtd-utils-1.4.1 => mtd-utils-1.4.4}/add-exclusion-to-mkfs-jffs2-git-2.patch (100%)
 rename meta/recipes-devtools/mtd/{mtd-utils_1.4.1.bb => mtd-utils_1.4.4.bb} (76%)
 create mode 100644 meta/recipes-devtools/perl/perl-5.12.3/MM_Unix.pm.patch
 delete mode 100644 meta/recipes-extended/procps/procps-3.2.8/install.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libxkbcommon/cross.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libxkbcommon_git.bb

-- 
1.7.6



