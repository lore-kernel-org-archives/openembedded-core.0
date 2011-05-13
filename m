Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QKswo-00065f-AS
	for openembedded-core@lists.openembedded.org;
	Fri, 13 May 2011 16:02:30 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 13 May 2011 06:59:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,364,1301900400"; d="scan'208";a="435610091"
Received: from unknown (HELO helios) ([10.255.16.107])
	by azsmga001.ch.intel.com with SMTP; 13 May 2011 06:59:38 -0700
Received: by helios (sSMTP sendmail emulation); Fri, 13 May 2011 14:59:37 +0100
Message-Id: <cover.1305295079.git.paul.eggleton@linux.intel.com>
Old-Date: Fri, 13 May 2011 14:57:59 +0100
Date: Fri, 13 May 2011 14:59:37 +0100
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 0/3] Qt4 fixes
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
X-List-Received-Date: Fri, 13 May 2011 14:02:30 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

These patches update Qt 4.7 series from 4.7.2 to 4.7.3, and make it easier
for other layers such as meta-oe to enable more SQL drivers.

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: paule/qt-4.7.3
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=paule/qt-4.7.3

Thanks,
    Paul Eggleton <paul.eggleton@linux.intel.com>
---


Paul Eggleton (3):
  qt4: update from 4.7.2 to 4.7.3
  distro_tracking_fields.inc: update for qt 4.7.3 upgrade
  qt4: split out SQL driver config flags to QT_SQL_DRIVER_FLAGS

 .../conf/distro/include/distro_tracking_fields.inc |   32 ++++++++++----------
 meta/recipes-qt/qt4/{qt-4.7.2.inc => qt-4.7.3.inc} |    5 +--
 .../0001-Added-Openembedded-crossarch-option.patch |    0
 .../recipes-qt/qt4/{qt-4.7.2 => qt-4.7.3}/g++.conf |    0
 .../hack-out-pg2-4.7.0.patch                       |    0
 .../qt4/{qt-4.7.2 => qt-4.7.3}/linux.conf          |    0
 ...qt4-embedded_4.7.2.bb => qt4-embedded_4.7.3.bb} |    2 +-
 ...s-native_4.7.2.bb => qt4-tools-native_4.7.3.bb} |    4 +-
 meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.2.bb   |    6 ----
 meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.3.bb   |    6 ++++
 ...qt4-x11-free_4.7.2.bb => qt4-x11-free_4.7.3.bb} |    2 +-
 meta/recipes-qt/qt4/qt4.inc                        |    4 ++-
 12 files changed, 31 insertions(+), 30 deletions(-)
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

-- 
1.7.4.4



