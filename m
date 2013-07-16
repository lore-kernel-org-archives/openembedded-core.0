Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9B0C76B216
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 14:39:06 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 16 Jul 2013 07:36:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,677,1367996400"; d="scan'208";a="371181833"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.97])
	by orsmga002.jf.intel.com with ESMTP; 16 Jul 2013 07:39:06 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Jul 2013 07:39:05 -0700
Message-Id: <cover.1373985134.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [CONSOLIDATED PULL 00/17] Rebased C-Pull, needs review
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
X-List-Received-Date: Tue, 16 Jul 2013 14:39:06 -0000

Ross, Paul:

I rebased after RP pulled, most of this has been run through the 
Autobuilder.  It contains changes to patches that missed the AB run.

Please review / ACK this email for RP.

Thanks
	Sau!


The following changes since commit cf1790d992f067be8d5f9894458f55f6f1bdc61f:

  lib/oeqa: fix dependecy check (2013-07-15 10:29:27 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Hongxu Jia (2):
  udev-extraconf: allow users in disk group to write vfat filesystem
  xuser-account: add xuser to disk group

Jonathan Liu (1):
  gdb: add PACKAGECONFIG for Python support

Kai Kang (1):
  tcl: fix typo of upstream status in patch file

Khem Raj (1):
  gcc-4.8: Fix on-device SDK C++ runtime issue

Mark Hatle (4):
  sanity.bbclass: Update gcc sanity check
  terminal.bbclass: Fix BB_RUNFMT processing
  busybox: fix ip reference in simple.script
  dbus-ptest: Disable python module check

Paul Eggleton (3):
  qt-mobility: tighten up config generation and use PACKAGECONFIG
  classes/insane: fix regression in libdir QA regex
  classes/insane: allow libdir QA check to be skipped using INSANE_SKIP

Roy.Li (1):
  dpkg: backport a patch to support mipsn32el and mips64el

Saul Wold (1):
  Upstream-Status: Correct capitalization

Simon Busch (1):
  wpa-supplicant: backport patch to fix dbus interface for autoscan
    functionality

Stefan Stanacar (1):
  populate_sdk_base.bbclass: use new perm option for find

Zhenhua Luo (1):
  oprofile: add Upstream-Status for several patches

 meta/classes/insane.bbclass                        | 40 ++++++-----
 meta/classes/populate_sdk_base.bbclass             |  2 +-
 meta/classes/sanity.bbclass                        | 42 ++++++++----
 meta/classes/terminal.bbclass                      |  4 +-
 .../wpa-supplicant/wpa-supplicant-2.0.inc          |  3 +-
 .../register-autoscan-correctly.patch              | 51 ++++++++++++++
 meta/recipes-core/busybox/files/simple.script      |  2 +-
 .../dbus/dbus-1.6.10/python-config.patch           | 25 +++++++
 meta/recipes-core/dbus/dbus-ptest_1.6.10.bb        |  1 +
 meta/recipes-core/libxml/libxml2/runtest.patch     |  2 +-
 meta/recipes-core/udev/udev-extraconf/mount.sh     | 11 +++
 .../util-linux/util-linux/util-linux-native.patch  |  2 +-
 .../binutils-2.23.2/backport/aarch64-crn.patch     |  2 +-
 .../binutils-2.23.2/backport/aarch64-movi.patch    |  2 +-
 ...-for-mipsn32-el-and-mips64-el-to-arch-tab.patch | 78 ++++++++++++++++++++++
 meta/recipes-devtools/dpkg/dpkg_1.16.10.bb         |  3 +-
 meta/recipes-devtools/gcc/gcc-4.8.inc              |  1 +
 .../gcc/gcc-4.8/0040-fix-g++-sysroot.patch         | 40 +++++++++++
 meta/recipes-devtools/gdb/gdb_7.6.bb               | 21 ++++++
 .../adt-installer/scripts/adt_installer_internal   |  2 +-
 .../0001-Fix-libopkg-header-installation.patch     |  2 +-
 .../tcl/tcl-remove-hardcoded-install-path.patch    |  2 +-
 .../grep/grep-2.5.1a/grep-CVE-2012-5667.patch      |  2 +-
 .../clutter/clutter-gst-1.6/cogl-1.14.patch        |  2 +-
 .../recipes-graphics/mx/mx-1.4/fix-build-dir.patch |  2 +-
 .../recipes-graphics/mx/mx/fix-test-includes.patch |  2 +-
 .../latencytop-0.5/latencytop-fsync.patch          |  2 +-
 ...-events-to-be-specified-with-or-without-_.patch |  2 +
 ...pecific-libpfm-usage-so-it-doesn-t-break-.patch |  2 +
 ...p-lists-events-Fix-doc-URL-for-ppc64-arch.patch |  2 +
 meta/recipes-qt/qt4/qt-mobility_1.2.0.inc          | 41 ++++++++++--
 ...fix-lib-cache_mngr.c-two-parentheses-bugs.patch |  2 +-
 .../user-creation/xuser-account_0.1.bb             |  2 +-
 33 files changed, 346 insertions(+), 53 deletions(-)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/register-autoscan-correctly.patch
 create mode 100644 meta/recipes-core/dbus/dbus-1.6.10/python-config.patch
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/Add-support-for-mipsn32-el-and-mips64-el-to-arch-tab.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0040-fix-g++-sysroot.patch

-- 
1.8.1.4


