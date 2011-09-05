Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1R0bTS-0006Mw-T3
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Sep 2011 17:52:39 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 05 Sep 2011 08:47:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,333,1312182000"; d="scan'208";a="14180656"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.53])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Sep 2011 08:47:36 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Sep 2011 16:47:34 +0100
Message-Id: <cover.1315237572.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/1] fix sstate relocation for git-native
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
X-List-Received-Date: Mon, 05 Sep 2011 15:52:39 -0000

The following changes since commit 0616557a8c29b42bae0ffd5fd665a046810047e4:

  populate_sdk: We need to ensure that the SDK sysroot reflects PACKAGE_ARCH (2011-09-02 23:38:00 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/sstate-git
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/sstate-git

Paul Eggleton (1):
  git: fix sstate relocation for git-native

 meta/recipes-devtools/git/git.inc        |    6 ++++++
 meta/recipes-devtools/git/git_1.7.5.1.bb |    2 +-
 2 files changed, 7 insertions(+), 1 deletions(-)

-- 
1.7.4.1



