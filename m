Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QHPIy-0001c8-VF
	for openembedded-core@lists.openembedded.org;
	Wed, 04 May 2011 01:47:01 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 03 May 2011 16:44:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,312,1301900400"; d="scan'208";a="741892465"
Received: from unknown (HELO localhost) ([10.255.13.11])
	by orsmga001.jf.intel.com with ESMTP; 03 May 2011 16:44:20 -0700
Message-Id: <cover.1304465724.git.sgw@linux.intel.com>
Old-Date: Tue, 3 May 2011 16:35:24 -0700
Date: Tue, 03 May 2011 16:44:20 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Xiaofeng Yan <xiaofeng.yan@windriver.com>, Ilya Yanok <yanok@emcraft.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Kang Kai <kai.kang@windriver.com>, Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 00/33] Consolidated Pull Request
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
X-List-Received-Date: Tue, 03 May 2011 23:47:01 -0000

From: Saul Wold <sgw@linux.intel.com>

Richard,

This has a dependency on your tweaks to gettext.bbclass
and base.bbclass.  Otherwise this set has been well tested.
It also contains patches that need to backported to bernard.



Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: sgw/stage
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Thanks,
    Saul Wold <sgw@linux.intel.com>
---


Darren Hart (2):
  logging: update existing oe* logging users to the bb* interface
  logging: delete the oe(note|warn|fatal|debug) functions

Gary Thomas (1):
  Fix matchbox-panel-2 compile error

Ilya Yanok (1):
  liberation-fonts: postinst can't be called offline

Jiajun Xu (1):
  qemuimagetest: Enable toolchain automation tests in qemuimagetest

Kang Kai (3):
  groff: update to 1.20.1
  lsbsetup: add commands install_initd and remove_initd
  task-core-lsb: add xdg-utils into lsb image

Khem Raj (4):
  insane.bbclass: Checking for NLS too when checking gettext dependency
  libx11: Use inherit gettext
  alsa-utils_1.0.24.2.bb: Fix build for uclibc targets
  perl-native_5.12.2.bb: Fix compliation on ubuntu 11.04-alpha

Koen Kooi (1):
  git: make it work on the target

Martin Jansa (1):
  git: use DESTDIR=$D instead prefixing all variables by $D

Mei Lei (1):
  distro_check.py: Fix some bugs in distro_check.py

Paul Eggleton (1):
  netbase: fix check for nfsroot in if-pre-up.d script

Qing He (8):
  attr: upgrade to version 2.4.46
  acl: upgrade to version 2.2.51
  augeas: upgrade to version 0.8.1
  curl: upgrade to version 7.21.6
  busybox: upgrade to version 1.18.4
  shared-mime-info: upgrade to version 0.90
  lzo: upgrade to version 2.05
  libcap: upgrade to version 2.20

Saul Wold (5):
  git: Disable gitk from by default
  puzzles: update to r9163
  linuxdoc-tools-native: add groff-native to DEPENDS
  libsoup-2.4: Update to 2.34.1
  perl: fix Configure-multilib.patch

Tom Zanussi (1):
  core-image-directdisk: add LIC_FILES_CHECKSUM

Xiaofeng Yan (3):
  create-lsb-iamge:Fix bugs
  task-core-lsb.bb: Add packages  liberation-fonts to lsb-imag
  LSB_Setup.sh: Add character set to lsb-image

 meta/classes/autotools.bbclass                     |   16 +-
 meta/classes/base.bbclass                          |   31 +---
 meta/classes/distutils.bbclass                     |    8 +-
 meta/classes/imagetest-qemu.bbclass                |    9 +-
 meta/classes/insane.bbclass                        |    9 +-
 meta/classes/kernel.bbclass                        |    4 +-
 meta/classes/qmake_base.bbclass                    |   10 +-
 meta/classes/scons.bbclass                         |    4 +-
 meta/classes/sip.bbclass                           |    4 +-
 meta/classes/sourcepkg.bbclass                     |    4 +-
 meta/classes/srec.bbclass                          |    2 +-
 meta/classes/utils.bbclass                         |   20 +-
 meta/conf/local.conf.sample                        |    2 +-
 meta/lib/oe/distro_check.py                        |   17 +-
 .../busybox/busybox-1.17.3/make-382-fix.patch      |   25 --
 .../B921600.patch                                  |    0
 .../busybox-appletlib-dependency.patch             |    0
 .../busybox-udhcpc-no_deconfig.patch               |   19 +-
 .../{busybox-1.17.3 => busybox-1.18.4}/defconfig   |    0
 .../get_header_tar.patch                           |    4 +-
 .../run-parts.in.usr-bin.patch                     |    0
 .../udhcpc-fix-nfsroot.patch                       |    0
 .../udhcpscript.patch                              |    0
 .../{busybox_1.17.3.bb => busybox_1.18.4.bb}       |    7 +-
 meta/recipes-core/dropbear/dropbear.inc            |    2 +-
 meta/recipes-core/eglibc/eglibc_2.12.bb            |    2 +-
 meta/recipes-core/glibc/glibc_2.10.1.bb            |    2 +-
 meta/recipes-core/images/core-image-directdisk.inc |    3 +
 meta/recipes-core/meta/meta-toolchain.bb           |    3 +-
 meta/recipes-core/netbase/netbase-4.45/nfsroot     |    2 +-
 meta/recipes-core/netbase/netbase_4.45.bb          |    2 +-
 meta/recipes-devtools/git/git.inc                  |   37 +++-
 meta/recipes-devtools/git/git_1.7.4.3.bb           |    2 +-
 .../linuxdoc-tools/linuxdoc-tools-native_0.9.66.bb |    4 +-
 .../perl/files/Configure-multilib.patch            |   15 ++
 .../perl/perl-5.12.3/Configure-multilib.patch      |    2 +-
 meta/recipes-devtools/perl/perl-native_5.12.3.bb   |   10 +-
 meta/recipes-devtools/python/python_2.6.6.bb       |    2 +-
 meta/recipes-extended/augeas/augeas_0.7.4.bb       |    6 -
 meta/recipes-extended/augeas/augeas_0.8.1.bb       |    6 +
 .../groff-1.18.1.4/groff-1.18.1.4-remove-mom.patch |   35 ---
 .../groff/groff-1.18.1.4/man-local.patch           |   32 ---
 .../groff/groff-1.18.1.4/mdoc-local.patch          |   31 ---
 meta/recipes-extended/groff/groff_1.18.1.4.bb      |   46 ----
 meta/recipes-extended/groff/groff_1.20.1.bb        |   36 +++
 meta/recipes-extended/lsb/lsbsetup/LSB_Setup.sh    |    1 +
 meta/recipes-extended/lsb/lsbsetup_0.9.bb          |    7 +-
 meta/recipes-extended/tasks/task-core-lsb.bb       |    2 +
 .../ttf-fonts/liberation-fonts_1.04.bb             |    3 +
 .../ttf-fonts/liberation-fonts_1.06.bb             |    3 +
 meta/recipes-graphics/xorg-lib/libx11_1.3.4.bb     |    3 +-
 meta/recipes-graphics/xorg-lib/libx11_git.bb       |    6 +-
 .../uclibc-exp10-replacement.patch                 |   21 ++
 .../recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb |    4 +-
 .../matchbox-panel-2/gcc-4.6.0-compile.patch       |   51 +++++
 .../matchbox-panel-2/matchbox-panel-2_git.bb       |    5 +-
 .../puzzles/{puzzles_r9151.bb => puzzles_r9163.bb} |    0
 meta/recipes-support/attr/acl_2.2.49.bb            |    6 -
 meta/recipes-support/attr/acl_2.2.51.bb            |    6 +
 .../attr/attr-2.4.44/double-free.patch             |   18 --
 .../attr/attr-2.4.44/memory-leak-in-copy.patch     |   50 -----
 .../attr/attr-2.4.44/memory-leak2.patch            |   18 --
 .../attr/attr-2.4.44/pull-in-string.h.patch        |   21 --
 .../attr/attr-2.4.44/thinko-in-restore.patch       |   19 --
 meta/recipes-support/attr/attr_2.4.44.bb           |   12 -
 meta/recipes-support/attr/attr_2.4.46.bb           |    6 +
 meta/recipes-support/attr/ea-acl.inc               |    2 +-
 .../attr/files/no-fixed-prog-path.patch            |   99 ---------
 meta/recipes-support/curl/curl/noldlibpath.patch   |    2 +
 meta/recipes-support/curl/curl/pkgconfig_fix.patch |    5 +-
 .../curl/{curl_7.21.2.bb => curl_7.21.6.bb}        |    6 +-
 meta/recipes-support/libcap/libcap.inc             |    2 +-
 meta/recipes-support/libcap/libcap_2.19.bb         |    6 -
 meta/recipes-support/libcap/libcap_2.20.bb         |    6 +
 ...libsoup-2.4_2.32.2.bb => libsoup-2.4_2.34.1.bb} |    7 +-
 meta/recipes-support/libsoup/libsoup-2.4_2.4.1.bb  |   11 -
 .../lzo/{lzo-2.04 => lzo-2.05}/acinclude.m4        |    0
 .../lzo/{lzo-2.04 => lzo-2.05}/autoconf.patch      |    4 +-
 .../lzo/{lzo_2.04.bb => lzo_2.05.bb}               |    8 +-
 .../files/fix-parallel-build.patch                 |   33 +++
 .../shared-mime-info/shared-mime-info_0.80.bb      |    5 -
 .../shared-mime-info/shared-mime-info_0.90.bb      |    7 +
 scripts/create-lsb-image                           |    2 +-
 scripts/qemuimage-testlib                          |  232 +++++++++++++++++++-
 .../scenario/qemuarm/meta-toolchain-gmae           |    3 +
 .../scenario/qemumips/meta-toolchain-gmae          |    3 +
 .../scenario/qemuppc/meta-toolchain-gmae           |    3 +
 .../scenario/qemux86-64/meta-toolchain-gmae        |    3 +
 .../scenario/qemux86/meta-toolchain-gmae           |    3 +
 scripts/qemuimage-tests/toolchain/cvs              |   31 +++
 scripts/qemuimage-tests/toolchain/iptables         |   31 +++
 scripts/qemuimage-tests/toolchain/sudoku-savant    |   31 +++
 92 files changed, 711 insertions(+), 571 deletions(-)
 delete mode 100644 meta/recipes-core/busybox/busybox-1.17.3/make-382-fix.patch
 rename meta/recipes-core/busybox/{busybox-1.17.3 => busybox-1.18.4}/B921600.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.17.3 => busybox-1.18.4}/busybox-appletlib-dependency.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.17.3 => busybox-1.18.4}/busybox-udhcpc-no_deconfig.patch (90%)
 rename meta/recipes-core/busybox/{busybox-1.17.3 => busybox-1.18.4}/defconfig (100%)
 rename meta/recipes-core/busybox/{busybox-1.17.3 => busybox-1.18.4}/get_header_tar.patch (76%)
 rename meta/recipes-core/busybox/{busybox-1.17.3 => busybox-1.18.4}/run-parts.in.usr-bin.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.17.3 => busybox-1.18.4}/udhcpc-fix-nfsroot.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.17.3 => busybox-1.18.4}/udhcpscript.patch (100%)
 rename meta/recipes-core/busybox/{busybox_1.17.3.bb => busybox_1.18.4.bb} (81%)
 create mode 100644 meta/recipes-devtools/perl/files/Configure-multilib.patch
 delete mode 100644 meta/recipes-extended/augeas/augeas_0.7.4.bb
 create mode 100644 meta/recipes-extended/augeas/augeas_0.8.1.bb
 delete mode 100644 meta/recipes-extended/groff/groff-1.18.1.4/groff-1.18.1.4-remove-mom.patch
 delete mode 100644 meta/recipes-extended/groff/groff-1.18.1.4/man-local.patch
 delete mode 100644 meta/recipes-extended/groff/groff-1.18.1.4/mdoc-local.patch
 delete mode 100644 meta/recipes-extended/groff/groff_1.18.1.4.bb
 create mode 100644 meta/recipes-extended/groff/groff_1.20.1.bb
 create mode 100644 meta/recipes-multimedia/alsa/alsa-utils-1.0.24.2/uclibc-exp10-replacement.patch
 create mode 100644 meta/recipes-sato/matchbox-panel-2/gcc-4.6.0-compile.patch
 rename meta/recipes-sato/puzzles/{puzzles_r9151.bb => puzzles_r9163.bb} (100%)
 delete mode 100644 meta/recipes-support/attr/acl_2.2.49.bb
 create mode 100644 meta/recipes-support/attr/acl_2.2.51.bb
 delete mode 100644 meta/recipes-support/attr/attr-2.4.44/double-free.patch
 delete mode 100644 meta/recipes-support/attr/attr-2.4.44/memory-leak-in-copy.patch
 delete mode 100644 meta/recipes-support/attr/attr-2.4.44/memory-leak2.patch
 delete mode 100644 meta/recipes-support/attr/attr-2.4.44/pull-in-string.h.patch
 delete mode 100644 meta/recipes-support/attr/attr-2.4.44/thinko-in-restore.patch
 delete mode 100644 meta/recipes-support/attr/attr_2.4.44.bb
 create mode 100644 meta/recipes-support/attr/attr_2.4.46.bb
 delete mode 100644 meta/recipes-support/attr/files/no-fixed-prog-path.patch
 rename meta/recipes-support/curl/{curl_7.21.2.bb => curl_7.21.6.bb} (92%)
 delete mode 100644 meta/recipes-support/libcap/libcap_2.19.bb
 create mode 100644 meta/recipes-support/libcap/libcap_2.20.bb
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.32.2.bb => libsoup-2.4_2.34.1.bb} (65%)
 delete mode 100644 meta/recipes-support/libsoup/libsoup-2.4_2.4.1.bb
 rename meta/recipes-support/lzo/{lzo-2.04 => lzo-2.05}/acinclude.m4 (100%)
 rename meta/recipes-support/lzo/{lzo-2.04 => lzo-2.05}/autoconf.patch (84%)
 rename meta/recipes-support/lzo/{lzo_2.04.bb => lzo_2.05.bb} (59%)
 create mode 100644 meta/recipes-support/shared-mime-info/files/fix-parallel-build.patch
 delete mode 100644 meta/recipes-support/shared-mime-info/shared-mime-info_0.80.bb
 create mode 100644 meta/recipes-support/shared-mime-info/shared-mime-info_0.90.bb
 create mode 100644 scripts/qemuimage-tests/scenario/qemuarm/meta-toolchain-gmae
 create mode 100644 scripts/qemuimage-tests/scenario/qemumips/meta-toolchain-gmae
 create mode 100644 scripts/qemuimage-tests/scenario/qemuppc/meta-toolchain-gmae
 create mode 100644 scripts/qemuimage-tests/scenario/qemux86-64/meta-toolchain-gmae
 create mode 100644 scripts/qemuimage-tests/scenario/qemux86/meta-toolchain-gmae
 create mode 100644 scripts/qemuimage-tests/toolchain/cvs
 create mode 100644 scripts/qemuimage-tests/toolchain/iptables
 create mode 100644 scripts/qemuimage-tests/toolchain/sudoku-savant

-- 
1.7.4.1



