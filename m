Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R1KrR-0000HI-SF
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Sep 2011 18:20:26 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 07 Sep 2011 09:15:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,346,1312182000"; d="scan'208";a="14852900"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.148])
	by AZSMGA002.ch.intel.com with ESMTP; 07 Sep 2011 09:15:21 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Sep 2011 09:15:18 -0700
Message-Id: <cover.1315411996.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PULL v2 0/1] Fix for beagleboard ICE when building lttng-ust
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
X-List-Received-Date: Wed, 07 Sep 2011 16:20:26 -0000

v2 has a patch header!

Sau!


The following changes since commit cb8efc0e1ec00892b46325aabfb1b4020a46c078:

  linux-yocto: re-enable utrace (2011-09-07 14:53:38 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/gcc-fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/fix2

Saul Wold (1):
  gcc: add patch for ice 50099, which caused lttng-ust not to build

 meta/recipes-devtools/gcc/gcc-4.6.inc              |    3 +-
 .../gcc/gcc-4.6/fix-for-ice-25202.patch            |   38 +++++++++++++++
 .../gcc/gcc-4.6/fix-for-ice-50099.patch            |   49 ++++++++++++++++++++
 3 files changed, 89 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6/fix-for-ice-25202.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6/fix-for-ice-50099.patch

-- 
1.7.6



