Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QsuEP-0002c1-NM
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 12:17:19 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 15 Aug 2011 03:12:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,373,1309762800"; d="scan'208";a="41534186"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.18.70])
	by fmsmga001.fm.intel.com with ESMTP; 15 Aug 2011 03:12:40 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Aug 2011 11:12:34 +0100
Message-Id: <cover.1313402929.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/4] qt4-native, Qt QA fixes
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
X-List-Received-Date: Mon, 15 Aug 2011 10:17:19 -0000

Bring over qt4-native from OE and tidy up some QA warnings.

The following changes since commit d126e22f6b3f27196144f87e22b36ebccd6dea65:

  rt-tests: use an explicit commit ID (2011-08-12 17:51:18 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/qt4-fixes4
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/qt4-fixes4

Paul Eggleton (4):
  qt4: replace qt4-tools-native with qt4-native
  qt4-native: restore build of uic3, qdbuscpp2xml and qdbusxml2cpp
  qt4: package QML plugins and correct their install directory
  qt4: delete unpackaged uic3 to avoid unpackaged file warning

 meta/recipes-qt/qt4/qt4-embedded.inc               |    2 +-
 .../qt4/{qt4-tools-native.inc => qt4-native.inc}   |   25 ++++++++++++++-----
 ...4-tools-native_4.7.3.bb => qt4-native_4.7.3.bb} |    2 +-
 meta/recipes-qt/qt4/qt4-x11-free.inc               |    2 +-
 meta/recipes-qt/qt4/qt4.inc                        |   15 +++++++++--
 5 files changed, 33 insertions(+), 13 deletions(-)
 rename meta/recipes-qt/qt4/{qt4-tools-native.inc => qt4-native.inc} (82%)
 rename meta/recipes-qt/qt4/{qt4-tools-native_4.7.3.bb => qt4-native_4.7.3.bb} (92%)

-- 
1.7.4.1



