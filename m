Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SMc9H-0006Mv-HL
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Apr 2012 11:35:03 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 24 Apr 2012 02:25:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="133160370"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.52])
	by orsmga001.jf.intel.com with ESMTP; 24 Apr 2012 02:25:27 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Apr 2012 10:25:24 +0100
Message-Id: <cover.1335227773.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/1] Fix deb-based rootfs construction
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
X-List-Received-Date: Tue, 24 Apr 2012 09:35:03 -0000

The following change since commit 85bebd85c4f6603ac8fc1290121c34b92cc434f9:

  self-hosted-image: Update poky revision to point at the 1.2 release branch (2012-04-23 23:12:29 +0100)

is available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/dpkg-fflush
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/dpkg-fflush

Paul Eggleton (1):
  dpkg-native: fix deb-based rootfs construction failure on Fedora 16

 .../dpkg/dpkg/dpkg-deb-avoid-fflush.patch          |  198 ++++++++++++++++++++
 meta/recipes-devtools/dpkg/dpkg_1.15.8.7.bb        |    5 +-
 2 files changed, 201 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/dpkg-deb-avoid-fflush.patch

-- 
1.7.5.4



