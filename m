Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Qe2i9-00058s-CA
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jul 2011 12:18:33 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 05 Jul 2011 03:14:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,478,1304319600"; d="scan'208";a="22761012"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.17.114])
	by azsmga001.ch.intel.com with ESMTP; 05 Jul 2011 03:14:42 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jul 2011 11:14:36 +0100
Message-Id: <cover.1309860717.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/1] Qt4 QA error fix
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
X-List-Received-Date: Tue, 05 Jul 2011 10:18:33 -0000

This patch fixes several "wrong architecture" QA errors when building
qt4-x11-free and qt4-embedded. This is really a stopgap as far as Qt4
packaging goes however, there is still more cleanup work to be done.

The following changes since commit 2b3bf5350861f62435e2fdf1c56c8a02f4b1b4ac:

  xauth: upgrade from 1.05 to 1.06 (2011-07-04 12:45:01 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/qt4-qa-fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/qt4-qa-fix

Paul Eggleton (1):
  qt4: ensure target packages don't include host binaries

 meta/recipes-qt/qt4/qt4-embedded.inc |    2 +-
 meta/recipes-qt/qt4/qt4-x11-free.inc |    2 +-
 meta/recipes-qt/qt4/qt4.inc          |   15 +++++++--------
 3 files changed, 9 insertions(+), 10 deletions(-)

-- 
1.7.4.1



