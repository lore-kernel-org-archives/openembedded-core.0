Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RxISv-0004HK-92
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Feb 2012 14:30:41 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 14 Feb 2012 05:22:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="117403919"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.250])
	by fmsmga001.fm.intel.com with ESMTP; 14 Feb 2012 05:22:28 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Feb 2012 13:22:23 +0000
Message-Id: <cover.1329225663.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/4] Misc tidy-ups
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
X-List-Received-Date: Tue, 14 Feb 2012 13:30:41 -0000

The following changes since commit e5ad03093dfc4364d1407183f458df79f347c7a1:

  guile: fix cross configure failure (2012-02-10 13:38:16 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/fixes12
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/fixes12

Paul Eggleton (4):
  scripts/bitbake: pass through debug options to initial pseudo build
  conf/bitbake.conf: remove Opie definitions
  classes/sdl: remove Opie-specific desktop file/packaging
  stat: remove NATIVE_INSTALL_WORKS

 meta/classes/sdl.bbclass               |   38 --------------------------------
 meta/conf/bitbake.conf                 |   10 --------
 meta/recipes-extended/stat/stat_3.3.bb |    1 -
 scripts/bitbake                        |   14 +++++++++++-
 4 files changed, 13 insertions(+), 50 deletions(-)

-- 
1.7.5.4



