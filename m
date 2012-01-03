Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Ri4jb-0007dr-AI
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 14:49:01 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 Jan 2012 05:41:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="92470642"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.79])
	by orsmga001.jf.intel.com with ESMTP; 03 Jan 2012 05:41:37 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jan 2012 13:41:31 +0000
Message-Id: <cover.1325597850.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/3] Qt 4.8.0 upgrade, Qt 4.7.4 architecture fix
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
X-List-Received-Date: Tue, 03 Jan 2012 13:49:01 -0000

This pull request fixes the architecture warnings for Qt 4.7.4 and adds
recipes for building the recently released Qt 4.8.0 (with
DEFAULT_PREFERENCE = "-1").

The following changes since commit de679a3036ebef1c7d7b8ee23f05590c95e498d9:

  pseudo: ensure libs are included in package (2012-01-03 12:10:59 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/qt-4.8.0
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/qt-4.8.0

Paul Eggleton (3):
  qt4: fix incorrect architecture for qt4 tools
  qt4: add version 4.8.0
  distro-tracking-fields: update qt recipe info

 .../conf/distro/include/distro_tracking_fields.inc |   38 ++++++------
 meta/recipes-qt/qt4/qt-4.7.4.inc                   |    4 -
 meta/recipes-qt/qt4/qt-4.8.0.inc                   |   61 ++++++++++++++++++
 .../0001-Added-Openembedded-crossarch-option.patch |   47 ++++++++++++++
 .../recipes-qt/qt4/qt-4.8.0/fix-translations.patch |   32 ++++++++++
 meta/recipes-qt/qt4/qt-4.8.0/g++.conf              |   56 +++++++++++++++++
 .../qt4/qt-4.8.0/hack-out-pg2-4.7.0.patch          |   31 +++++++++
 meta/recipes-qt/qt4/qt-4.8.0/linux.conf            |   66 ++++++++++++++++++++
 meta/recipes-qt/qt4/qt-4.8.0/qmake_cxx_eval.patch  |   20 ++++++
 meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb          |    2 +-
 meta/recipes-qt/qt4/qt4-embedded_4.8.0.bb          |   13 ++++
 meta/recipes-qt/qt4/qt4-native.inc                 |   13 +++-
 meta/recipes-qt/qt4/qt4-native_4.8.0.bb            |   14 ++++
 meta/recipes-qt/qt4/qt4-tools-nativesdk.inc        |    2 +-
 meta/recipes-qt/qt4/qt4-tools-nativesdk_4.8.0.bb   |    8 +++
 meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb          |    2 +-
 meta/recipes-qt/qt4/qt4-x11-free_4.8.0.bb          |   13 ++++
 meta/recipes-qt/qt4/qt4.inc                        |   12 +++-
 18 files changed, 403 insertions(+), 31 deletions(-)
 create mode 100644 meta/recipes-qt/qt4/qt-4.8.0.inc
 create mode 100644 meta/recipes-qt/qt4/qt-4.8.0/0001-Added-Openembedded-crossarch-option.patch
 create mode 100644 meta/recipes-qt/qt4/qt-4.8.0/fix-translations.patch
 create mode 100644 meta/recipes-qt/qt4/qt-4.8.0/g++.conf
 create mode 100644 meta/recipes-qt/qt4/qt-4.8.0/hack-out-pg2-4.7.0.patch
 create mode 100644 meta/recipes-qt/qt4/qt-4.8.0/linux.conf
 create mode 100644 meta/recipes-qt/qt4/qt-4.8.0/qmake_cxx_eval.patch
 create mode 100644 meta/recipes-qt/qt4/qt4-embedded_4.8.0.bb
 create mode 100644 meta/recipes-qt/qt4/qt4-native_4.8.0.bb
 create mode 100644 meta/recipes-qt/qt4/qt4-tools-nativesdk_4.8.0.bb
 create mode 100644 meta/recipes-qt/qt4/qt4-x11-free_4.8.0.bb

-- 
1.7.5.4



