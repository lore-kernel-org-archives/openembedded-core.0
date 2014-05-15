Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (unknown [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C1DD565EA8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 May 2014 21:25:42 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 15 May 2014 14:25:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1062,1389772800"; d="scan'208";a="541228969"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.90])
	by orsmga002.jf.intel.com with ESMTP; 15 May 2014 14:25:23 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 May 2014 14:25:23 -0700
Message-Id: <cover.1400188795.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [CONSOLIDATED PULL 00/18] Patches and updates
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
X-List-Received-Date: Thu, 15 May 2014 21:25:47 -0000

Richard,

This is a subset of patches pending, these have been through 
the Autobuilder and some local testing.

Sau!


The following changes since commit 58417093d7ce83c8a2f683a356fddc23aaee5e8e:

  wic: Extend indirect string connection to support image names and rootfs (2014-05-13 19:35:06 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Andrea Adami (1):
  mips: add tune file for mips32r2 (only hard-float)

Chong Lu (1):
  dbus: Update to 1.8.2 version

Drew Moseley (1):
  glib-2.0: Do not use readlink to set target paths.

Gary S. Robertson (1):
  rt-tests: restore erroneously deleted patch files

Koen Kooi (1):
  curl: work around RRECOMMENDS problems in -native* recipes

Maxin B. John (1):
  bzip2: fix ptest execution failure

Paul Eggleton (6):
  openssh: update to 6.6p1
  openssh: move packaging definitions to the end
  ethtool: upgrade to 3.14
  nfs-utils: upgrade to 1.3.0
  dropbear: add missing patch header
  libsdl2: upgrade to 2.0.3

Richard Purdie (1):
  gstreamer: Better gcc 4.9 fix

Ross Burton (1):
  freetype: disable harfbuzz

Saul Wold (1):
  libusb1: Update to 1.0.18

Tim Orling (1):
  licenses.conf: add AGPL variations

Tudor Florea (1):
  curl: remove inapporpriate file from curl release

Yasir-Khan (1):
  bluez5: Update the bluetooth.conf

 meta/conf/licenses.conf                            |    5 +
 meta/conf/machine/include/tune-mips32r2.inc        |   17 +
 .../bluez5/bluez5/bluetooth.conf                   |    2 +-
 .../{nfs-utils_1.2.9.bb => nfs-utils_1.3.0.bb}     |    7 +-
 .../openssh/{openssh_6.5p1.bb => openssh_6.6p1.bb} |   18 +-
 .../{dbus-test_1.6.18.bb => dbus-test_1.8.2.bb}    |   13 +-
 meta/recipes-core/dbus/dbus.inc                    |   14 +-
 ...orrect-address-when-using-address-systemd.patch |  193 -
 ...y-freeing-if-error-during-listing-service.patch |   45 -
 meta/recipes-core/dbus/dbus/ptest.patch            |  154 -
 meta/recipes-core/dbus/dbus/run-ptest              |   11 +-
 meta/recipes-core/dbus/dbus_1.6.18.bb              |    4 -
 meta/recipes-core/dbus/dbus_1.8.2.bb               |    4 +
 .../dropbear/dropbear/0003-configure.patch         |    4 +-
 ...c-Do-not-use-readlink-when-cross-compilin.patch |   31 +
 meta/recipes-core/glib-2.0/glib-2.0_2.40.0.bb      |    1 +
 meta/recipes-extended/bzip2/bzip2_1.0.6.bb         |    3 +-
 .../ethtool/{ethtool_3.13.bb => ethtool_3.14.bb}   |    4 +-
 meta/recipes-graphics/freetype/freetype_2.5.3.bb   |    2 +
 .../libsdl2/{libsdl2_2.0.1.bb => libsdl2_2.0.3.bb} |    6 +-
 .../gstreamer/gst-plugins-base_0.10.36.bb          |    2 +
 .../gstreamer/gstreamer1.0-plugins-base.inc        |    1 +
 ...1-rt-tests-Allow-for-user-specified-PYLIB.patch |   35 +
 ...02-rt-tests-Break-out-install_hwlatdetect.patch |   68 +
 .../files/added-missing-dependencies.patch         |   50 +
 meta/recipes-rt/rt-tests/rt-tests.inc              |    3 +
 .../curl/remove_inappropriate_file_from_rel.patch  | 8203 ++++++++++++++++++++
 meta/recipes-support/curl/curl_7.36.0.bb           |    8 +-
 .../obsolete_automake_macros.patch                 |    0
 .../libusb/{libusb1_1.0.9.bb => libusb1_1.0.18.bb} |    7 +-
 30 files changed, 8483 insertions(+), 432 deletions(-)
 create mode 100644 meta/conf/machine/include/tune-mips32r2.inc
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_1.2.9.bb => nfs-utils_1.3.0.bb} (95%)
 rename meta/recipes-connectivity/openssh/{openssh_6.5p1.bb => openssh_6.6p1.bb} (97%)
 rename meta/recipes-core/dbus/{dbus-test_1.6.18.bb => dbus-test_1.8.2.bb} (74%)
 delete mode 100644 meta/recipes-core/dbus/dbus/Set-correct-address-when-using-address-systemd.patch
 delete mode 100644 meta/recipes-core/dbus/dbus/fixed-memory-freeing-if-error-during-listing-service.patch
 delete mode 100644 meta/recipes-core/dbus/dbus/ptest.patch
 delete mode 100644 meta/recipes-core/dbus/dbus_1.6.18.bb
 create mode 100644 meta/recipes-core/dbus/dbus_1.8.2.bb
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-configure.ac-Do-not-use-readlink-when-cross-compilin.patch
 rename meta/recipes-extended/ethtool/{ethtool_3.13.bb => ethtool_3.14.bb} (87%)
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.0.1.bb => libsdl2_2.0.3.bb} (91%)
 create mode 100644 meta/recipes-rt/rt-tests/files/0001-rt-tests-Allow-for-user-specified-PYLIB.patch
 create mode 100644 meta/recipes-rt/rt-tests/files/0002-rt-tests-Break-out-install_hwlatdetect.patch
 create mode 100644 meta/recipes-rt/rt-tests/files/added-missing-dependencies.patch
 create mode 100644 meta/recipes-support/curl/curl/remove_inappropriate_file_from_rel.patch
 rename meta/recipes-support/libusb/{libusb1-1.0.9 => libusb1}/obsolete_automake_macros.patch (100%)
 rename meta/recipes-support/libusb/{libusb1_1.0.9.bb => libusb1_1.0.18.bb} (78%)

-- 
1.8.3.1


