Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1R5bdk-0007go-R9
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Sep 2011 13:03:57 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 Sep 2011 03:58:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="50049702"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.110])
	by orsmga002.jf.intel.com with ESMTP; 19 Sep 2011 03:58:38 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Sep 2011 11:58:33 +0100
Message-Id: <cover.1316429640.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/3] Dependency fixes
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
X-List-Received-Date: Mon, 19 Sep 2011 11:03:57 -0000

Fix three issues due to missing dependency race conditions as shown up on
the autobuilder.

The following changes since commit 7a0cbe6b0e5185aebabedc515b427994bc2a15dc:

  cooker.py: Fix key expansion issues in showVersions (2011-09-19 05:55:37 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib paule/dep-fixes
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=paule/dep-fixes

Paul Eggleton (3):
  libgcrypt: add libcap to DEPENDS
  libgnome-keyring: add libgcrypt to DEPENDS
  freetype: disable bzip2 compressed font support

 .../recipes-gnome/gnome/libgnome-keyring_2.32.0.bb |    4 ++--
 meta/recipes-graphics/freetype/freetype_2.4.6.bb   |    4 ++--
 meta/recipes-support/libgcrypt/libgcrypt.inc       |    2 +-
 meta/recipes-support/libgcrypt/libgcrypt_1.4.6.bb  |    2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

-- 
1.7.4.1



