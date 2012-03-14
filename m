Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S7cLB-0006ne-JW
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 01:45:21 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 13 Mar 2012 17:36:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="77188026"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.185])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Mar 2012 17:36:34 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Mar 2012 00:36:26 +0000
Message-Id: <cover.1331685330.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/6] Misc build failure fixes
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
X-List-Received-Date: Wed, 14 Mar 2012 00:45:21 -0000

The following changes since commit 81379dc141e245307ca391a02b7490b199128991:

  dates: Fix unpackaged files warning (2012-03-13 23:18:19 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/fixes14
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/fixes14

Paul Eggleton (6):
  scripts/bitbake: ensure user is in build directory
  pulseaudio: add X library dependencies
  gst-plugins-bad: disable directfb in configure
  mx: add dependencies
  ncurses: fix build when ENABLE_WIDEC is not set
  linux-yocto-tiny: add dependency on xz-native

 meta/recipes-core/ncurses/ncurses.inc              |    5 +++--
 meta/recipes-graphics/mx/mx_1.4.2.bb               |    2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb  |    5 ++++-
 .../gstreamer/gst-plugins-bad_0.10.22.bb           |    4 ++--
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    3 ++-
 .../pulseaudio/pulseaudio_1.1.bb                   |    2 +-
 scripts/bitbake                                    |    5 +++++
 7 files changed, 18 insertions(+), 8 deletions(-)

-- 
1.7.5.4



