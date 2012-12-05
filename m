Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TgFFl-0003VD-Hj
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 14:43:09 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 05 Dec 2012 05:28:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,221,1355126400"; d="scan'208";a="257623913"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.253])
	by fmsmga001.fm.intel.com with ESMTP; 05 Dec 2012 05:28:43 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Dec 2012 13:28:30 +0000
Message-Id: <cover.1354713989.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/3] Tidy up Qt example application recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Dec 2012 13:43:09 -0000

Tidy up a few things I noticed when looking through these recipes for
Nitin's Qt Dev Days talk.


The following changes since commit b7c010e4603c33b1d3e3fcaf99a9375585471ec5:

  libxkbcommon: make the build do something (2012-12-04 20:51:36 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/qt-apps-tidy
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/qt-apps-tidy

Paul Eggleton (3):
  fotowall: tidy up
  qmmp: remove qmake2 from inherit
  quicky: tidy up inherit

 meta/recipes-qt/qt-apps/fotowall_0.9.bb |   10 +++++-----
 meta/recipes-qt/qt-apps/qmmp_0.6.1.bb   |    5 ++---
 meta/recipes-qt/qt-apps/quicky_0.4.bb   |    6 ++----
 3 files changed, 9 insertions(+), 12 deletions(-)

-- 
1.7.10.4



