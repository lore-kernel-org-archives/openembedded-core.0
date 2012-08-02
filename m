Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Swrnw-0002yQ-Mj
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 11:34:52 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 02 Aug 2012 02:23:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="129551528"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.75])
	by AZSMGA002.ch.intel.com with ESMTP; 02 Aug 2012 02:23:11 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Aug 2012 10:23:00 +0100
Message-Id: <cover.1343899228.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/9] buildhistory improvements
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
X-List-Received-Date: Thu, 02 Aug 2012 09:34:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A bunch of improvements for buildhistory, implementing some feature
requests and todo items of my own, as well as tidying up some of the
code.


The following changes since commit 404d2d490fc347203e89d274530c17fb5f0aa20f:

  gcc-configure-target: Set native-system-header-dir for target gcc (2012-08-01 23:11:09 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/buildhistory-fixes7
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/buildhistory-fixes7

Paul Eggleton (9):
  classes/buildhistory: remove obsolete flat package history feature
  classes/buildhistory: ensure old package info is removed
  classes/buildhistory: remove unused functions
  classes/buildhistory: save preinst/postinst/prerm/postrm
  classes/buildhistory: record PKG/PKGE/PKGV/PKGR
  scripts: add buildhistory-tag script
  buildhistory_analysis: tidy up duplicate split_version function
  buildhistory_analysis: ignore removal of self-dependencies
  classes/buildhistory: save metadata revisions

 meta/classes/buildhistory.bbclass    |  197 ++++++++++++++++++----------------
 meta/lib/oe/buildhistory_analysis.py |   96 +++++++++++++----
 scripts/buildhistory-tag             |   42 ++++++++
 3 files changed, 221 insertions(+), 114 deletions(-)
 create mode 100755 scripts/buildhistory-tag

-- 
1.7.9.5



