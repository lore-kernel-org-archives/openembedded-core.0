Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Sw0A2-0004FO-R8
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 02:18:07 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 30 Jul 2012 17:06:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="175049373"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.49])
	by azsmga001.ch.intel.com with ESMTP; 30 Jul 2012 17:06:28 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jul 2012 01:06:19 +0100
Message-Id: <cover.1343693147.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/7] combo-layer improvements
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
X-List-Received-Date: Tue, 31 Jul 2012 00:18:07 -0000

The following changes since commit ab0187c13b2b0a041bf3d98c3a53bd3f45a624de:

  libxcb: Update for python-native changes (2012-07-30 16:53:49 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/combo-layer-fixes7
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/combo-layer-fixes7

Paul Eggleton (7):
  combo-layer: remove &> bashism
  combo-layer: allow component pull to be done separately
  combo-layer: ignore patch-* temp directories in dirty check
  combo-layer: drop to a shell when apply fails during update
  combo-layer: improve patch list handling and output
  combo-layer: check that last_revision is valid
  combo-layer: allow splitting out local config

 scripts/combo-layer |  241 ++++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 192 insertions(+), 49 deletions(-)

-- 
1.7.9.5



