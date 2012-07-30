Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Svzca-0003TG-Dc
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 01:43:32 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 30 Jul 2012 16:31:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="173360904"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.49])
	by orsmga001.jf.intel.com with ESMTP; 30 Jul 2012 16:31:54 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jul 2012 00:30:59 +0100
Message-Id: <cover.1343691019.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/2] Qt 4 fixes
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
X-List-Received-Date: Mon, 30 Jul 2012 23:43:32 -0000

The following changes since commit ab0187c13b2b0a041bf3d98c3a53bd3f45a624de:

  libxcb: Update for python-native changes (2012-07-30 16:53:49 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/qt4-fixes-1
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/qt4-fixes-1

Paul Eggleton (2):
  qt4: allow recipes building commercial edition
  qt4: make font packaging specific to embedded version

 meta/classes/qt4x11.bbclass          |    2 +-
 meta/recipes-qt/qt4/qt4-embedded.inc |   32 +++++++++++++++++++++++++++++++-
 meta/recipes-qt/qt4/qt4-x11-free.inc |    3 ++-
 meta/recipes-qt/qt4/qt4.inc          |   32 +++++++-------------------------
 4 files changed, 41 insertions(+), 28 deletions(-)

-- 
1.7.9.5



