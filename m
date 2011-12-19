Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RchMj-0001gc-LS
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 18:51:09 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Dec 2011 09:44:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="89158304"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.37])
	by orsmga002.jf.intel.com with ESMTP; 19 Dec 2011 09:44:05 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Dec 2011 17:43:20 +0000
Message-Id: <cover.1324316137.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/2] psplash fixes
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
X-List-Received-Date: Mon, 19 Dec 2011 17:51:09 -0000

Set the default psplash image to the OpenEmbedded logo, and provide a
script to allow people to use their own custom image.

Note: there's a corresponding meta-yocto patch which should be applied
after this set.

The following changes since commit ae4118a1f78f113c3d687c3aa6a86007cf977cae:

  libsdl 1.2.14: fix packaging (2011-12-19 12:17:36 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/oe-psplash
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/oe-psplash

Paul Eggleton (2):
  psplash: use OpenEmbedded logo
  scripts/contrib: add a script to create a psplash image header

 meta/recipes-core/psplash/files/psplash-img.h      | 1062 ++++++++++++++++++++
 meta/recipes-core/psplash/files/psplash-poky-img.h |  909 -----------------
 meta/recipes-core/psplash/psplash_git.bb           |    6 +-
 scripts/contrib/make-psplash-img-header.sh         |   22 +
 4 files changed, 1087 insertions(+), 912 deletions(-)
 create mode 100644 meta/recipes-core/psplash/files/psplash-img.h
 delete mode 100644 meta/recipes-core/psplash/files/psplash-poky-img.h
 create mode 100755 scripts/contrib/make-psplash-img-header.sh

-- 
1.7.5.4



