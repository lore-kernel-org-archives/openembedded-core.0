Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TCCOh-0001sf-Vn
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Sep 2012 18:36:12 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 13 Sep 2012 09:23:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,417,1344236400"; d="scan'208";a="144736928"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.214])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Sep 2012 09:23:15 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Sep 2012 17:23:10 +0100
Message-Id: <cover.1347553357.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/2] Couple of fixes for combo-layer
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
X-List-Received-Date: Thu, 13 Sep 2012 16:36:12 -0000

The following changes since commit 835654994574c158d6324218ebe000bd2ef9a792:

  rt: Add hwlatdetect to rt images (2012-09-12 15:11:12 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/combo-layer-fixes8
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/combo-layer-fixes8

Paul Eggleton (2):
  scripts/combo-layer: use last_revision if specified in init
  scripts/combo-layer: ensure we validate branch/revision on init

 scripts/combo-layer |   31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

-- 
1.7.9.5



