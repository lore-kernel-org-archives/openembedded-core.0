Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RTEua-0002xC-BA
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 16:39:06 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 23 Nov 2011 07:32:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="79220104"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.207])
	by orsmga001.jf.intel.com with ESMTP; 23 Nov 2011 07:32:26 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Nov 2011 15:32:21 +0000
Message-Id: <cover.1322061836.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/3] Make pulseaudio a DISTRO_FEATURE
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
X-List-Received-Date: Wed, 23 Nov 2011 15:39:06 -0000

The initial driver behind this series was a failure on our autobuilder,
which resulted from qt4-x11-free detecting pulseaudio at configure time
but then since it wasn't listed in DEPENDS, when it came to compile time
pulseaudio happened to be unavailable and the build failed. Since
pulseaudio becomes a hard runtime dependency of phonon when it is enabled,
and it is an optional build-time dependency more than one recipe it makes
sense to make it a DISTRO_FEATURE.

Note that should this patchset be accepted, distro maintainers will need
to add pulseaudio to their DISTRO_FEATURES to retain the current behaviour.

The following changes since commit aaa2a70f7f1b8a299f31626d61d7ea27f29fb9e2:

  gconf: Ensure the correct backend directory is used (2011-11-23 15:10:41 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/qt4-pulseaudio
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/qt4-pulseaudio

Paul Eggleton (3):
  default-distrovars: add pulseaudio to DISTRO_FEATURES
  qt4: make pulseaudio support conditional upon DISTRO_FEATURES
  gst-plugins-good: make pulseaudio support conditional upon
    DISTRO_FEATURES

 meta/conf/distro/include/default-distrovars.inc    |    3 +-
 .../gstreamer/gst-plugins-good_0.10.30.bb          |    8 ++-
 meta/recipes-qt/qt4/files/pulseaudio-config.patch  |   44 ++++++++++++++++++++
 meta/recipes-qt/qt4/qt-4.7.4.inc                   |    7 +++-
 meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb          |    2 +-
 meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb          |    2 +-
 6 files changed, 59 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-qt/qt4/files/pulseaudio-config.patch

-- 
1.7.5.4



