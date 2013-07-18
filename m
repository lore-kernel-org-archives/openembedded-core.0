Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 331256AFF1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 06:34:51 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 17 Jul 2013 23:34:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,691,1367996400"; d="scan'208";a="372205660"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.97])
	by fmsmga002.fm.intel.com with ESMTP; 17 Jul 2013 23:34:32 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jul 2013 23:34:31 -0700
Message-Id: <cover.1374128654.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [CONSOLIDATED PULL 00/40] Review and ACK
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Jul 2013 06:34:51 -0000

Ross, Paul:

Please review this set and ACK as appropriate, I will rebase based
on your input.  This this is on the AB down, we have known issues with
systemd. This addresses many of the M2 related issues and fixes the 
testimage infrasturcture on teh AutoBuilder 

Please look at Qi's "EXTRA_USER" changes 

There are a couple of patches that are on Poky, that need to be merged
one is to tiny and the other is to include the securiy flags for the LSB
images. That way they get tested with 1/2 the images built

Sau!

The following changes since commit cf1790d992f067be8d5f9894458f55f6f1bdc61f:

  lib/oeqa: fix dependecy check (2013-07-15 10:29:27 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Bruce Ashfield (3):
  linux-yocto/3.8: update META srcrev
  linux-yocto/3.4: mips: fix gcc 4.8 compilation
  linux-yocto/3.8: restore qemumips64 SRCREV

Chen Qi (5):
  tar: remove an erroneous patch
  useradd_base.bbclass: add a new bbclass
  useradd.bbclass: code refactor
  extrausers.bbclass: add a new bbclass
  local.conf.sample.extended: add example for EXTRA_USERS_PARAMS

Cristian Iorga (2):
  bluez4: conflicts with bluez5
  bluez5: new package for v5.7

Felipe F. Tonello (3):
  pulseaudio: Added cli-protocol-unix to pulseaudio-misc
  valgrind: added perl dependency
  pulseaudio: Removed avahi forced dependency

Hongxu Jia (2):
  udev-extraconf: allow users in disk group to write vfat filesystem
  xuser-account: add xuser to disk group

Joe Slater (1):
  curl: add upstream status to patch

Jonathan Liu (1):
  gdb: add PACKAGECONFIG for Python support

Kai Kang (1):
  tcl: fix typo of upstream status in patch file

Khem Raj (4):
  gcc-4.8: Fix on-device SDK C++ runtime issue
  uclibc: Build ldd/ldcondif/iconv for main uclibc recipe
  eglibc-2.18: Remove unused patches
  eglibc-2.18: Update to latest snapshot

Mark Hatle (4):
  sanity.bbclass: Update gcc sanity check
  terminal.bbclass: Fix BB_RUNFMT processing
  busybox: fix ip reference in simple.script
  dbus-ptest: Disable python module check

Paul Eggleton (4):
  qt-mobility: tighten up config generation and use PACKAGECONFIG
  classes/insane: fix regression in libdir QA regex
  classes/insane: allow libdir QA check to be skipped using INSANE_SKIP
  scripts/contrib/*: fix arithmetic bashism

Roy.Li (1):
  dpkg: backport a patch to support mipsn32el and mips64el

Saul Wold (2):
  Upstream-Status: Correct capitalization
  buildtools: testimage needs the mmap python

Simon Busch (1):
  wpa-supplicant: backport patch to fix dbus interface for autoscan
    functionality

Stefan Stanacar (1):
  populate_sdk_base.bbclass: use new perm option for find

Tudor Florea (1):
  python: Install Python test suite and run it as ptest.

Yi Zhao (3):
  iproute2: Fix alternative link for ip command
  run-postinsts: Fix typo
  rpm-postinsts.bb: Fix typo

Zhenhua Luo (1):
  oprofile: add Upstream-Status for several patches

 meta/classes/extrausers.bbclass                    |   61 +
 meta/classes/insane.bbclass                        |   40 +-
 meta/classes/populate_sdk_base.bbclass             |    2 +-
 meta/classes/sanity.bbclass                        |   42 +-
 meta/classes/terminal.bbclass                      |    4 +-
 meta/classes/useradd.bbclass                       |   99 +-
 meta/classes/useradd_base.bbclass                  |  230 +
 meta/conf/local.conf.sample.extended               |   15 +
 meta/recipes-connectivity/bluez/bluez4_4.101.bb    |    2 +
 .../bluez5/bluez5-5.7/bluetooth.conf               |   16 +
 meta/recipes-connectivity/bluez5/bluez5.inc        |   68 +
 meta/recipes-connectivity/bluez5/bluez5_5.7.bb     |    5 +
 meta/recipes-connectivity/iproute2/iproute2.inc    |    2 +-
 .../wpa-supplicant/wpa-supplicant-2.0.inc          |    3 +-
 .../register-autoscan-correctly.patch              |   51 +
 meta/recipes-core/busybox/files/simple.script      |    2 +-
 .../dbus/dbus-1.6.10/python-config.patch           |   25 +
 meta/recipes-core/dbus/dbus-ptest_1.6.10.bb        |    1 +
 .../eglibc/cross-localedef-native_2.18.bb          |    6 +-
 .../eglibc-2.18/eglibc-2.17-PR15003-r22243.patch   |  207 -
 .../eglibc/eglibc-2.18/eglibc-2.17-r22178.patch    | 9472 --------------------
 meta/recipes-core/eglibc/eglibc_2.18.bb            |    6 +-
 meta/recipes-core/libxml/libxml2/runtest.patch     |    2 +-
 meta/recipes-core/meta/buildtools-tarball.bb       |    1 +
 meta/recipes-core/uclibc/uclibc.inc                |    7 +-
 meta/recipes-core/udev/udev-extraconf/mount.sh     |   11 +
 .../util-linux/util-linux/util-linux-native.patch  |    2 +-
 .../binutils-2.23.2/backport/aarch64-crn.patch     |    2 +-
 .../binutils-2.23.2/backport/aarch64-movi.patch    |    2 +-
 ...-for-mipsn32-el-and-mips64-el-to-arch-tab.patch |   78 +
 meta/recipes-devtools/dpkg/dpkg_1.16.10.bb         |    3 +-
 meta/recipes-devtools/gcc/gcc-4.8.inc              |    1 +
 .../gcc/gcc-4.8/0040-fix-g++-sysroot.patch         |   40 +
 meta/recipes-devtools/gdb/gdb_7.6.bb               |   21 +
 .../adt-installer/scripts/adt_installer_internal   |    2 +-
 .../0001-Fix-libopkg-header-installation.patch     |    2 +-
 .../python/python/fix-makefile-for-ptest.patch     |   33 +
 meta/recipes-devtools/python/python/run-ptest      |    5 +
 meta/recipes-devtools/python/python_2.7.3.bb       |   10 +
 meta/recipes-devtools/rpm/rpm-postinsts.bb         |    2 +-
 .../run-postinsts/run-postinsts/run-postinsts      |    2 +-
 .../tcl/tcl-remove-hardcoded-install-path.patch    |    2 +-
 meta/recipes-devtools/valgrind/valgrind_3.8.1.bb   |    2 +
 .../grep/grep-2.5.1a/grep-CVE-2012-5667.patch      |    2 +-
 .../tar-1.26/tar-1.26-fortifysourcessigabrt.patch  |   36 -
 meta/recipes-extended/tar/tar_1.26.bb              |    1 -
 .../clutter/clutter-gst-1.6/cogl-1.14.patch        |    2 +-
 .../recipes-graphics/mx/mx-1.4/fix-build-dir.patch |    2 +-
 .../recipes-graphics/mx/mx/fix-test-includes.patch |    2 +-
 .../latencytop-0.5/latencytop-fsync.patch          |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb    |    4 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb    |    2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb  |    2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb  |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.4.bb       |   12 +-
 meta/recipes-kernel/linux/linux-yocto_3.8.bb       |    3 +-
 ...-events-to-be-specified-with-or-without-_.patch |    2 +
 ...pecific-libpfm-usage-so-it-doesn-t-break-.patch |    2 +
 ...p-lists-events-Fix-doc-URL-for-ppc64-arch.patch |    2 +
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    5 +-
 meta/recipes-qt/qt4/qt-mobility_1.2.0.inc          |   41 +-
 meta/recipes-support/curl/curl/configure_ac.patch  |    2 +
 ...fix-lib-cache_mngr.c-two-parentheses-bugs.patch |    2 +-
 .../user-creation/xuser-account_0.1.bb             |    2 +-
 scripts/contrib/ddimage                            |    2 +-
 scripts/contrib/mkefidisk.sh                       |    2 +-
 66 files changed, 838 insertions(+), 9885 deletions(-)
 create mode 100644 meta/classes/extrausers.bbclass
 create mode 100644 meta/classes/useradd_base.bbclass
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5-5.7/bluetooth.conf
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5.inc
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.7.bb
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/register-autoscan-correctly.patch
 create mode 100644 meta/recipes-core/dbus/dbus-1.6.10/python-config.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.18/eglibc-2.17-PR15003-r22243.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.18/eglibc-2.17-r22178.patch
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/Add-support-for-mipsn32-el-and-mips64-el-to-arch-tab.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0040-fix-g++-sysroot.patch
 create mode 100644 meta/recipes-devtools/python/python/fix-makefile-for-ptest.patch
 create mode 100644 meta/recipes-devtools/python/python/run-ptest
 delete mode 100644 meta/recipes-extended/tar/tar-1.26/tar-1.26-fortifysourcessigabrt.patch

-- 
1.8.1.4


