Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RaB2K-00061V-9W
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Dec 2011 19:55:40 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 12 Dec 2011 10:48:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="101352758"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.29])
	by fmsmga002.fm.intel.com with ESMTP; 12 Dec 2011 10:48:36 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Dec 2011 18:48:33 +0000
Message-Id: <cover.1323715541.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/1] re-enable packaging of qt4 tools
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
X-List-Received-Date: Mon, 12 Dec 2011 18:55:41 -0000

I'm still unable to explain why we were getting architecture warnings
about these binaries before and we don't now. It could be something to
do with the updated version of Qt we are building, or it could be
something else. In any case building for two architectures produced
no warnings and the binaries are in the correct format.

The following changes since commit c9a420be15d54a8494cb45d6c932b86895e94e13:

  connman: Default to enabling ethernet interfaces (2011-12-12 16:50:21 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/qt4-tools
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/qt4-tools

Philip Balister (1):
  qt4.inc : Add uic, moc, rcc, and lrelease to tools package.

 meta/recipes-qt/qt4/qt4-embedded.inc |    2 +-
 meta/recipes-qt/qt4/qt4-x11-free.inc |    2 +-
 meta/recipes-qt/qt4/qt4.inc          |    9 ++-------
 3 files changed, 4 insertions(+), 9 deletions(-)

-- 
1.7.5.4



