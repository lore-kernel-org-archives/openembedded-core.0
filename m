Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RFXEj-0003VD-EF
	for openembedded-core@lists.openembedded.org;
	Sun, 16 Oct 2011 22:23:09 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 16 Oct 2011 13:17:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,354,1315206000"; d="scan'208";a="74375146"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.6])
	by fmsmga001.fm.intel.com with ESMTP; 16 Oct 2011 13:17:20 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 16 Oct 2011 13:17:02 -0700
Message-Id: <cover.1318796061.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
Subject: [v2 -CONSOLIDATED PULL 00/14] Updates and World Build Fixes
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
X-List-Received-Date: Sun, 16 Oct 2011 20:23:09 -0000

Richard,

This is version contains additional comments and fixes based on Khem's
notes, I also fixes the Upstream-Status to have correct capitolization.

Sau!

The following changes since commit d1b12b92439805ec9ca5d031d34d264acd0cab3b:

  mesa-dri: Enable swrast only by default and intel drivers only on IA platform (2011-10-15 00:41:12 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Dmitry Cherukhin (1):
  qt4: Added support for QtMobility 1.2

Dmitry Eremin-Solenikov (1):
  default-provider: also define a default provider for gconf-native

Paul Eggleton (2):
  pulseaudio: make bluetooth support conditional upon DISTRO_FEATURES
  bluez4: disable hidd, pand & dund

Philip Balister (1):
  cmake : Disable building ccmake.

Saul Wold (9):
  bind: update to 9.8.1
  resolvconf: Update to 1.61
  glib-2.0: Add nativesdk depends for libffi
  qmmp: Fix QA Packaging Errors
  libomxil: Fix QA Package Errors
  Distro Tracking: Fix dates
  sysprof: remove duplicated patch
  mktemp: Add patch to fix parallel make install
  screen: Add patch to fix parallel make install

 meta/conf/distro/include/default-providers.inc     |    1 +
 .../conf/distro/include/distro_tracking_fields.inc |   16 +++---
 .../bind/{bind-9.7.2-P3 => bind-9.8.1}/conf.patch  |    0
 .../cross-build-fix.patch                          |    0
 .../bind/{bind_9.7.2-P3.bb => bind_9.8.1.bb}       |   10 ++--
 meta/recipes-connectivity/bluez/bluez4.inc         |    6 +-
 meta/recipes-connectivity/bluez/bluez4_4.96.bb     |    2 +-
 .../{resolvconf_1.59.bb => resolvconf_1.61.bb}     |    6 +-
 meta/recipes-core/glib-2.0/glib-2.0_2.30.0.bb      |    3 +-
 meta/recipes-devtools/cmake/cmake_2.8.5.bb         |    3 +-
 .../mktemp/files/fix-parallel-make.patch           |   23 +++++++
 meta/recipes-extended/mktemp/mktemp_1.7.bb         |    3 +-
 .../screen/screen-4.0.3/fix-parallel-make.patch    |   19 ++++++
 meta/recipes-extended/screen/screen_4.0.3.bb       |    3 +-
 meta/recipes-gnome/libffi/libffi_3.0.9.bb          |    4 +-
 .../sysprof/files/ppc-macro-fix.patch              |   13 ----
 meta/recipes-kernel/sysprof/sysprof_git.bb         |    1 -
 meta/recipes-multimedia/libomxil/libomxil_0.3.3.bb |    9 ++-
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    5 +-
 .../pulseaudio/pulseaudio_0.9.22.bb                |    2 +-
 .../pulseaudio/pulseaudio_0.9.23.bb                |    2 +-
 meta/recipes-qt/qt-apps/qmmp_0.5.1.bb              |   36 ++++++++++--
 meta/recipes-qt/qt4/qt-mobility-embedded_1.2.0.bb  |   11 ++++
 meta/recipes-qt/qt4/qt-mobility-x11_1.2.0.bb       |   10 +++
 meta/recipes-qt/qt4/qt-mobility_1.2.0.inc          |   62 ++++++++++++++++++++
 25 files changed, 198 insertions(+), 52 deletions(-)
 rename meta/recipes-connectivity/bind/{bind-9.7.2-P3 => bind-9.8.1}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.7.2-P3 => bind-9.8.1}/cross-build-fix.patch (100%)
 rename meta/recipes-connectivity/bind/{bind_9.7.2-P3.bb => bind_9.8.1.bb} (82%)
 rename meta/recipes-connectivity/resolvconf/{resolvconf_1.59.bb => resolvconf_1.61.bb} (87%)
 create mode 100644 meta/recipes-extended/mktemp/files/fix-parallel-make.patch
 create mode 100644 meta/recipes-extended/screen/screen-4.0.3/fix-parallel-make.patch
 delete mode 100644 meta/recipes-kernel/sysprof/files/ppc-macro-fix.patch
 create mode 100644 meta/recipes-qt/qt4/qt-mobility-embedded_1.2.0.bb
 create mode 100644 meta/recipes-qt/qt4/qt-mobility-x11_1.2.0.bb
 create mode 100644 meta/recipes-qt/qt4/qt-mobility_1.2.0.inc

-- 
1.7.6.2



