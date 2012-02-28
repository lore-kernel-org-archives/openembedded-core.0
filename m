Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S2R6e-0000NJ-5B
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 18:44:56 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 28 Feb 2012 09:36:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="71423179"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.68])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Feb 2012 09:36:24 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Feb 2012 17:36:21 +0000
Message-Id: <cover.1330450342.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/1] introduce pulseaudio to DISTRO_FEATURES
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
X-List-Received-Date: Tue, 28 Feb 2012 17:44:56 -0000

This patch adds a pulseaudio feature to DISTRO_FEATURES, using
DISTRO_FEATURES_BACKFILL to preserve existing distro configuration,
and makes Qt 4 respect it. There are a few other recipes that should
respect this feature as well, however I wanted to send the qt4 one in
as soon as possible as it addresses actual observed build failures.


The following changes since commit 3cb519598d9ce044ccccb2d6a52a3c0933433501:

  tcl 8.5.11: fix packaging for native version (2012-02-28 13:33:22 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/qt4-pulseaudio-fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/qt4-pulseaudio-fix

Paul Eggleton (1):
  qt4: make pulseaudio support conditional upon DISTRO_FEATURES

 meta/conf/bitbake.conf                             |    2 +-
 meta/recipes-qt/qt4/qt-4.7.4.inc                   |    1 +
 .../qt4/qt-4.7.4/pulseaudio-config.patch           |   45 ++++++++++++++++++++
 meta/recipes-qt/qt4/qt-4.8.0.inc                   |    1 +
 .../qt4/qt-4.8.0/pulseaudio-config.patch           |   45 ++++++++++++++++++++
 meta/recipes-qt/qt4/qt4.inc                        |    2 +
 6 files changed, 95 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-qt/qt4/qt-4.7.4/pulseaudio-config.patch
 create mode 100644 meta/recipes-qt/qt4/qt-4.8.0/pulseaudio-config.patch

-- 
1.7.5.4



