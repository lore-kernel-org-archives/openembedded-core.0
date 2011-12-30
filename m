Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Rgck9-0008JB-HT
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Dec 2011 14:43:33 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 30 Dec 2011 05:36:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="90847954"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.56])
	by azsmga001.ch.intel.com with ESMTP; 30 Dec 2011 05:36:15 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Dec 2011 13:36:10 +0000
Message-Id: <cover.1325252095.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/1] buildhistory: improve git commit robustness
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
X-List-Received-Date: Fri, 30 Dec 2011 13:43:33 -0000

The following change since commit 8f348ccad083d6c02c200652ff6295e701e88f0d:

  coreutils: ensure --color works so DEPEND on libcap (2011-12-24 10:05:35 +0000)

is available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/buildhistory-fix2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/buildhistory-fix2

Paul Eggleton (1):
  buildhistory: improve git commit robustness

 meta/classes/buildhistory.bbclass |   21 +++++++++++++++++----
 1 files changed, 17 insertions(+), 4 deletions(-)

-- 
1.7.5.4



