Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QlMSt-0003BC-Gx
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 16:49:03 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 25 Jul 2011 07:44:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,261,1309762800"; d="scan'208";a="32018312"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.17.240])
	by fmsmga002.fm.intel.com with ESMTP; 25 Jul 2011 07:44:49 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jul 2011 15:44:46 +0100
Message-Id: <cover.1311605016.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/2] Couple of fixes
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
X-List-Received-Date: Mon, 25 Jul 2011 14:49:03 -0000

The following changes since commit f10a3457cdfbb4a94978da998d178d4254632fa7:

  Move architecture specific TARGET_OS mangling into tune files (2011-07-25 14:19:54 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/fixes2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/fixes2

Paul Eggleton (2):
  eglibc: remove unnecessary FILESPATHPKG usage
  scripts/combo-layer: keep carriage returns at the end of lines

 meta/recipes-core/eglibc/eglibc_2.13.bb |    3 +--
 scripts/combo-layer                     |    2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

-- 
1.7.4.1



