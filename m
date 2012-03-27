Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SCV3V-00045s-6j
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Mar 2012 13:59:17 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 Mar 2012 04:50:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="146196985"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.228])
	by fmsmga002.fm.intel.com with ESMTP; 27 Mar 2012 04:50:14 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Mar 2012 12:50:07 +0100
Message-Id: <cover.1332848153.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/3] Fixes for bitbake wrapper script
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
X-List-Received-Date: Tue, 27 Mar 2012 11:59:17 -0000

Andreas, if you could review these that would be much appreciated.


The following changes since commit 644b7503c37fd73730dd3d7841463b158b8934ed:

  guile: Deal with hardcoded path issues (2012-03-27 00:28:41 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/builddir
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/builddir

Paul Eggleton (3):
  scripts/bitbake: try harder to check if pseudo exists
  scripts/bitbake: allow switching between build directories
  scripts/bitbake: add/fix some comments

 scripts/bitbake |   43 ++++++++++++++++++++++++++++++++-----------
 1 files changed, 32 insertions(+), 11 deletions(-)

-- 
1.7.5.4



