Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id CD4326B201
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 07:16:38 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 16 Jul 2013 00:14:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,675,1367996400"; d="scan'208";a="370975898"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.97])
	by orsmga002.jf.intel.com with ESMTP; 16 Jul 2013 00:14:31 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Jul 2013 00:14:30 -0700
Message-Id: <cover.1373958076.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [CONSOLIDATED PULL 00/28] Updated C-Pull needs review
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
X-List-Received-Date: Tue, 16 Jul 2013 07:16:38 -0000

Paul, Ross:

I have added a few more patches from this mornings review
requiest, mostly well defined patches and patch Upstream-Status
corrections.

I found an old thread about the gdb/python issue that indicated
RP expected such a change and this appear correct uses PACKAGECONFIG

Please review and ACK if appropriate, I will update in the morning

***Note: this is on oe-contrib/sgw/stage2 note sgw/stage

Sau!


The following changes since commit 43c28375f97161e618fa54349c65be2058c33c53:

  distrodata.bbaclass: change in git and svn package reporting (2013-07-12 10:12:13 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage2

Alexandru Palalau (1):
  lib/oeqa/runtime: add tests for syslog and df

Chen Qi (1):
  core-image-lsb.bb: add 'package-management' to IMAGE_FEATURES

Jackie Huang (1):
  acl: fix the acl self contained test cases issue

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

Saul Wold (4):
  libidn: upgrade to 1.28
  mc: upgrade to 4.8.9
  initscripts: Update to 9.48
  Upstream-Status: Correct capitalization

Simon Busch (1):
  wpa-supplicant: backport patch to fix dbus interface for autoscan
    functionality

Stefan Stanacar (8):
  lib/oeqa/runtime/dmesg.py: whitelist dmesg message for systemd net
    interface name
  lib/oeqa/utils/sshcontrol.py: fix passing command to subprocess
  testimage.bbclass, lib/oeqa/utils/qemurunner.py: make boot timeout
    configurable and increase it
  lib/oeqa/runtime/multilib.py: use readelf instead of file
  lib/oeqa/oetest.py: provide a ps command for all tests
  classes/testimage.bbclass: use a copy of rootfs for tests
  testimage.bbclass, lib/oeqa: add headers and comments
  lib/oeqa: fix dependecy check

Zhenhua Luo (1):
  oprofile: add Upstream-Status for several patches

 meta/classes/insane.bbclass                        |  40 ++--
 meta/classes/sanity.bbclass                        |  42 +++--
 meta/classes/terminal.bbclass                      |   4 +-
 meta/classes/testimage.bbclass                     |  43 ++++-
 meta/lib/oeqa/oetest.py                            |  14 +-
 meta/lib/oeqa/runtime/connman.py                   |   5 -
 meta/lib/oeqa/runtime/df.py                        |  13 ++
 meta/lib/oeqa/runtime/dmesg.py                     |   2 +-
 meta/lib/oeqa/runtime/multilib.py                  |   9 +-
 meta/lib/oeqa/runtime/smart.py                     |   1 +
 meta/lib/oeqa/runtime/syslog.py                    |  37 ++++
 meta/lib/oeqa/utils/decorators.py                  |  12 +-
 meta/lib/oeqa/utils/qemurunner.py                  |  12 +-
 meta/lib/oeqa/utils/sshcontrol.py                  |  49 ++---
 .../wpa-supplicant/wpa-supplicant-2.0.inc          |   3 +-
 .../register-autoscan-correctly.patch              |  51 +++++
 meta/recipes-core/busybox/files/simple.script      |   2 +-
 .../dbus/dbus-1.6.10/python-config.patch           |  25 +++
 meta/recipes-core/dbus/dbus-ptest_1.6.10.bb        |   1 +
 meta/recipes-core/libxml/libxml2/runtest.patch     |   2 +-
 .../util-linux/util-linux/util-linux-native.patch  |   2 +-
 .../binutils-2.23.2/backport/aarch64-crn.patch     |   2 +-
 .../binutils-2.23.2/backport/aarch64-movi.patch    |   2 +-
 ...-for-mipsn32-el-and-mips64-el-to-arch-tab.patch |  78 ++++++++
 meta/recipes-devtools/dpkg/dpkg_1.16.10.bb         |   3 +-
 meta/recipes-devtools/gcc/gcc-4.8.inc              |   1 +
 .../gcc/gcc-4.8/0040-fix-g++-sysroot.patch         |  40 ++++
 meta/recipes-devtools/gdb/gdb_7.6.bb               |  21 +++
 .../0001-Fix-libopkg-header-installation.patch     |   2 +-
 .../tcl/tcl-remove-hardcoded-install-path.patch    |   2 +-
 .../grep/grep-2.5.1a/grep-CVE-2012-5667.patch      |   2 +-
 meta/recipes-extended/images/core-image-lsb.bb     |   2 +-
 .../libidn/{libidn_1.27.bb => libidn_1.28.bb}      |   4 +-
 ...binitscripts_9.47.bb => lsbinitscripts_9.48.bb} |   6 +-
 .../mc/{mc_4.8.8.bb => mc_4.8.9.bb}                |   4 +-
 .../clutter/clutter-gst-1.6/cogl-1.14.patch        |   2 +-
 .../recipes-graphics/mx/mx-1.4/fix-build-dir.patch |   2 +-
 .../recipes-graphics/mx/mx/fix-test-includes.patch |   2 +-
 .../latencytop-0.5/latencytop-fsync.patch          |   2 +-
 ...-events-to-be-specified-with-or-without-_.patch |   2 +
 ...pecific-libpfm-usage-so-it-doesn-t-break-.patch |   2 +
 ...p-lists-events-Fix-doc-URL-for-ppc64-arch.patch |   2 +
 meta/recipes-qt/qt4/qt-mobility_1.2.0.inc          |  41 +++-
 meta/recipes-support/attr/acl.inc                  |   4 +-
 .../attr/files/fix-acl-test-cases.patch            | 210 +++++++++++++++++++++
 ...fix-lib-cache_mngr.c-two-parentheses-bugs.patch |   2 +-
 46 files changed, 705 insertions(+), 104 deletions(-)
 create mode 100644 meta/lib/oeqa/runtime/df.py
 create mode 100644 meta/lib/oeqa/runtime/syslog.py
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/register-autoscan-correctly.patch
 create mode 100644 meta/recipes-core/dbus/dbus-1.6.10/python-config.patch
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/Add-support-for-mipsn32-el-and-mips64-el-to-arch-tab.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0040-fix-g++-sysroot.patch
 rename meta/recipes-extended/libidn/{libidn_1.27.bb => libidn_1.28.bb} (91%)
 rename meta/recipes-extended/lsb/{lsbinitscripts_9.47.bb => lsbinitscripts_9.48.bb} (78%)
 rename meta/recipes-extended/mc/{mc_4.8.8.bb => mc_4.8.9.bb} (93%)
 create mode 100644 meta/recipes-support/attr/files/fix-acl-test-cases.patch

-- 
1.8.1.4


