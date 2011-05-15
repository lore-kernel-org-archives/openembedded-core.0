Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QLQEi-00068K-Tk
	for openembedded-core@lists.openembedded.org;
	Sun, 15 May 2011 03:35:13 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 14 May 2011 18:32:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,368,1301900400"; d="scan'208";a="436235837"
Received: from unknown (HELO localhost) ([10.255.12.119])
	by azsmga001.ch.intel.com with ESMTP; 14 May 2011 18:32:20 -0700
Message-Id: <cover.1305422996.git.sgw@linux.intel.com>
Old-Date: Sat, 14 May 2011 18:29:56 -0700
Date: Sat, 14 May 2011 18:32:19 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Kang Kai <kai.kang@windriver.com>
Subject: [PATCH 00/15] 14-May Consolidated Pull
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
X-List-Received-Date: Sun, 15 May 2011 01:35:13 -0000

From: Saul Wold <sgw@linux.intel.com>

Richard,

Some LSB Fixes from Kang, ARM and MACHINEOVERRIDES tweaks from
Khem, and some glib and defaultsetup changes from Martin.
Along with a QT4 Update from Paul.

Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: sgw/stage
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Thanks,
    Saul Wold <sgw@linux.intel.com>
---


Kang Kai (4):
  libxml-sax-perl: added to create LSB olver test report
  task-core-lsb: add packages into lsb image
  lsbsetup: recreate locale fr_FR
  foomatic-filters: add a link to pass LSB printing test

Khem Raj (4):
  tune-cortexa8.inc: Define variable for controlling FP ABI
  gcc-common.inc: Consider hardfp knob for configuring toolchain
  conf/bitbake.conf: Add MACHINEOVERRIDES variable
  util-linux: inherit pkgconfig

Martin Jansa (3):
  lib/oe/process.py: import from OE
  glib-2.0: use PN instead of glib-2.0 in PACKAGES and FILES
  bitbake.conf: move VENDOR variables from bitbake.conf to
    defaultsetup.conf

Nitin A Kamble (1):
  task-core-nfs: fix a bitbake error

Paul Eggleton (3):
  qt4: update from 4.7.2 to 4.7.3
  distro_tracking_fields.inc: update for qt 4.7.3 upgrade
  qt4: split out SQL driver config flags to QT_SQL_DRIVER_FLAGS

 meta/conf/bitbake.conf                             |    7 +--
 meta/conf/distro/defaultsetup.conf                 |    5 +-
 .../conf/distro/include/distro_tracking_fields.inc |   32 ++++----
 meta/conf/machine/include/tune-cortexa8.inc        |   14 +++-
 meta/lib/oe/process.py                             |   74 ++++++++++++++++++++
 meta/recipes-core/glib-2.0/glib.inc                |    4 +-
 meta/recipes-core/tasks/task-core-nfs.bb           |    2 +-
 meta/recipes-core/util-linux/util-linux.inc        |    2 +-
 meta/recipes-devtools/gcc/gcc-common.inc           |   13 +++-
 .../foomatic/foomatic-filters_4.0.7.bb             |    9 ++-
 meta/recipes-extended/lsb/lsbsetup/LSB_Setup.sh    |    1 +
 meta/recipes-extended/lsb/lsbsetup_0.9.bb          |    2 +-
 .../perl/libxml-namespacesupport-perl_1.11.bb      |   22 ++++++
 meta/recipes-extended/perl/libxml-sax-perl_0.96.bb |   26 +++++++
 meta/recipes-extended/tasks/task-core-lsb.bb       |    5 +-
 meta/recipes-qt/qt4/{qt-4.7.2.inc => qt-4.7.3.inc} |    5 +-
 .../0001-Added-Openembedded-crossarch-option.patch |    0
 .../recipes-qt/qt4/{qt-4.7.2 => qt-4.7.3}/g++.conf |    0
 .../hack-out-pg2-4.7.0.patch                       |    0
 .../qt4/{qt-4.7.2 => qt-4.7.3}/linux.conf          |    0
 ...qt4-embedded_4.7.2.bb => qt4-embedded_4.7.3.bb} |    2 +-
 ...s-native_4.7.2.bb => qt4-tools-native_4.7.3.bb} |    4 +-
 meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.2.bb   |    6 --
 meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.3.bb   |    6 ++
 ...qt4-x11-free_4.7.2.bb => qt4-x11-free_4.7.3.bb} |    2 +-
 meta/recipes-qt/qt4/qt4.inc                        |    4 +-
 26 files changed, 197 insertions(+), 50 deletions(-)
 create mode 100644 meta/lib/oe/process.py
 create mode 100644 meta/recipes-extended/perl/libxml-namespacesupport-perl_1.11.bb
 create mode 100644 meta/recipes-extended/perl/libxml-sax-perl_0.96.bb
 rename meta/recipes-qt/qt4/{qt-4.7.2.inc => qt-4.7.3.inc} (89%)
 rename meta/recipes-qt/qt4/{qt-4.7.2 => qt-4.7.3}/0001-Added-Openembedded-crossarch-option.patch (100%)
 rename meta/recipes-qt/qt4/{qt-4.7.2 => qt-4.7.3}/g++.conf (100%)
 rename meta/recipes-qt/qt4/{qt-4.7.2 => qt-4.7.3}/hack-out-pg2-4.7.0.patch (100%)
 rename meta/recipes-qt/qt4/{qt-4.7.2 => qt-4.7.3}/linux.conf (100%)
 rename meta/recipes-qt/qt4/{qt4-embedded_4.7.2.bb => qt4-embedded_4.7.3.bb} (87%)
 rename meta/recipes-qt/qt4/{qt4-tools-native_4.7.2.bb => qt4-tools-native_4.7.3.bb} (61%)
 delete mode 100644 meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.2.bb
 create mode 100644 meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.3.bb
 rename meta/recipes-qt/qt4/{qt4-x11-free_4.7.2.bb => qt4-x11-free_4.7.3.bb} (88%)



