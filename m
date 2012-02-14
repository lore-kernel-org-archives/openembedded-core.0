Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RxInx-0005Be-Ot
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Feb 2012 14:52:25 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 14 Feb 2012 05:44:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="117410010"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.250])
	by fmsmga001.fm.intel.com with ESMTP; 14 Feb 2012 05:44:13 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Feb 2012 13:44:02 +0000
Message-Id: <cover.1329226937.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/4] combo-layer improvements
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
X-List-Received-Date: Tue, 14 Feb 2012 13:52:26 -0000

Allow updating only a single component, fix a couple of minor bugs and
update the example config file.

The following changes since commit e5ad03093dfc4364d1407183f458df79f347c7a1:

  guile: fix cross configure failure (2012-02-10 13:38:16 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/combo-layer-fixes3
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/combo-layer-fixes3

Paul Eggleton (4):
  scripts/combo-layer: allow updating a specific component(s) only
  scripts/combo-layer: avoid error when config file is outside repo
  scripts/combo-layer: avoid saving last revision if unchanged
  scripts/combo-layer: add branch option to example config

 scripts/combo-layer              |   41 ++++++++++++++++++++++++++-----------
 scripts/combo-layer.conf.example |   13 ++++++++---
 2 files changed, 38 insertions(+), 16 deletions(-)

-- 
1.7.5.4



