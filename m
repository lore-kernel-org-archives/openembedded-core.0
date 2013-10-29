Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 54E496D16D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 17:54:41 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 29 Oct 2013 10:51:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="400545491"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.29])
	by orsmga001.jf.intel.com with ESMTP; 29 Oct 2013 10:54:42 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Oct 2013 10:54:42 -0700
Message-Id: <cover.1383069183.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [CONSOLIDATED PULL 00/21] Updates and some patches
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
X-List-Received-Date: Tue, 29 Oct 2013 17:54:41 -0000

Richard,

This set came in last week and I pulled them together at ELC,
I will be working on catching up and syncing with the list today.

Thanks
	Sau!

The following changes since commit fa90f92e52330a9bf5836c0832412af0927b19a9:

  scripts/oe-pkgdata-util: fix global name 'debug' is not defined (2013-10-29 15:24:00 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Andreas Oberritter (1):
  cogl-1.0: depend on virtual/mesa

Cristian Iorga (3):
  bluez5: upgrade to 5.10
  glib-2.0: upgrade to 2.38.1
  connman: upgrade to 1.19

Cristiana Voicu (3):
  at: upgrade to 3.1.14
  curl: upgrade to 7.33.0
  sudo: upgrade to 1.8.8

Hongxu Jia (1):
  debugedit: fix segment fault while file's bss offset have a large
    number

Jonathan Liu (1):
  qt4: add upstream QTBUG-34218/QTBUG-34234 misaligned selection patch

Konrad Scherer (2):
  pigz: Add pigz to buildtools tarball
  pixbufcache.bbclass: gdk-pixbuf-query-loaders depends on libz

Lu Chong (1):
  dbus: no messages of status command print

Ming Liu (1):
  strace: remove += assignment of a OVERRIDES variable

Qiang Chen (1):
  openssl: create package for openssl configuration file

Roy Li (2):
  opkg: putting the service files into PN
  libcap: fix CAP_LAST_CAP

Saul Wold (3):
  cups: upgrade to 1.7.0
  gnupg: upgrade to 2.0.22
  attr: upgrade to 2.4.47

Tom Rini (1):
  udev: Update touchscreen rule for ID_INPUT_TOUCHSCREEN

Tom Zanussi (1):
  wic: Remove selinux_check()

 meta/classes/pixbufcache.bbclass                   |   2 +-
 .../{bluez5-5.7 => bluez5-5.10}/bluetooth.conf     |   0
 meta/recipes-connectivity/bluez5/bluez5_5.10.bb    |   5 +
 meta/recipes-connectivity/bluez5/bluez5_5.7.bb     |   5 -
 .../connman/{connman_1.18.bb => connman_1.19.bb}   |   6 +-
 meta/recipes-connectivity/openssl/openssl.inc      |  12 +-
 meta/recipes-core/dbus/dbus-1.6.10/dbus-1.init     |   2 +-
 .../{glib-2.0_2.38.0.bb => glib-2.0_2.38.1.bb}     |   4 +-
 meta/recipes-core/meta/buildtools-tarball.bb       |   1 +
 meta/recipes-core/udev/udev/local.rules            |   3 +-
 meta/recipes-devtools/opkg/opkg.inc                |   1 +
 ...debugedit-valid-file-to-fix-segment-fault.patch |  67 ++++++++
 meta/recipes-devtools/rpm/rpm_5.4.9.bb             |   1 +
 meta/recipes-devtools/strace/strace_4.8.bb         |   3 +-
 .../at/{at_3.1.13.bb => at_3.1.14.bb}              |   7 +-
 meta/recipes-extended/at/files/configure.patch     |  29 ----
 meta/recipes-extended/at/files/use-ldflags.patch   |  24 ---
 .../recipes-extended/cups/{cups16.inc => cups.inc} |  17 +-
 meta/recipes-extended/cups/cups_1.6.4.bb           |  19 ---
 meta/recipes-extended/cups/cups_1.7.0.bb           |   6 +
 meta/recipes-extended/pigz/pigz_2.3.1.bb           |   2 +-
 meta/recipes-extended/sudo/sudo.inc                |   2 +-
 .../sudo/{sudo_1.8.7.bb => sudo_1.8.8.bb}          |   4 +-
 meta/recipes-graphics/cogl/cogl-1.0.inc            |   2 +-
 meta/recipes-qt/qt4/qt4-4.8.5.inc                  |   1 +
 ...ned-selection-region-with-text-when-cente.patch |  75 +++++++++
 meta/recipes-support/attr/attr.inc                 |   4 +-
 meta/recipes-support/attr/attr_2.4.46.bb           |   8 -
 meta/recipes-support/attr/attr_2.4.47.bb           |   7 +
 .../attr/files/generic-syscalls.patch              | 187 ---------------------
 .../curl/{curl_7.32.0.bb => curl_7.33.0.bb}        |   4 +-
 .../gnupg/{gnupg_2.0.21.bb => gnupg_2.0.22.bb}     |   4 +-
 meta/recipes-support/libcap/libcap.inc             |   3 +-
 .../libcap/libcap/fix-CAP_LAST_CAP.patch           |  39 +++++
 scripts/lib/mic/conf.py                            |   4 -
 35 files changed, 249 insertions(+), 311 deletions(-)
 rename meta/recipes-connectivity/bluez5/{bluez5-5.7 => bluez5-5.10}/bluetooth.conf (100%)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.10.bb
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.7.bb
 rename meta/recipes-connectivity/connman/{connman_1.18.bb => connman_1.19.bb} (65%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.38.0.bb => glib-2.0_2.38.1.bb} (93%)
 create mode 100644 meta/recipes-devtools/rpm/rpm/debugedit-valid-file-to-fix-segment-fault.patch
 rename meta/recipes-extended/at/{at_3.1.13.bb => at_3.1.14.bb} (90%)
 delete mode 100644 meta/recipes-extended/at/files/configure.patch
 delete mode 100644 meta/recipes-extended/at/files/use-ldflags.patch
 rename meta/recipes-extended/cups/{cups16.inc => cups.inc} (84%)
 delete mode 100644 meta/recipes-extended/cups/cups_1.6.4.bb
 create mode 100644 meta/recipes-extended/cups/cups_1.7.0.bb
 rename meta/recipes-extended/sudo/{sudo_1.8.7.bb => sudo_1.8.8.bb} (83%)
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.5/0025-Fix-misaligned-selection-region-with-text-when-cente.patch
 delete mode 100644 meta/recipes-support/attr/attr_2.4.46.bb
 create mode 100644 meta/recipes-support/attr/attr_2.4.47.bb
 delete mode 100644 meta/recipes-support/attr/files/generic-syscalls.patch
 rename meta/recipes-support/curl/{curl_7.32.0.bb => curl_7.33.0.bb} (93%)
 rename meta/recipes-support/gnupg/{gnupg_2.0.21.bb => gnupg_2.0.22.bb} (85%)
 create mode 100644 meta/recipes-support/libcap/libcap/fix-CAP_LAST_CAP.patch

-- 
1.8.3.1


