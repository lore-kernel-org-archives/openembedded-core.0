Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R1AN0-0005Ry-FD
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Sep 2011 07:08:18 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 06 Sep 2011 22:03:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,343,1312182000"; d="scan'208";a="14681780"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.148])
	by AZSMGA002.ch.intel.com with ESMTP; 06 Sep 2011 22:03:11 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Sep 2011 22:03:09 -0700
Message-Id: <cover.1315371674.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/1] Fix for beagleboard ICE when building lttng-ust
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
X-List-Received-Date: Wed, 07 Sep 2011 05:08:18 -0000

The following changes since commit 41b7c955cfdc7b4d5c667c8a8742237d5edaca4f:

  icu-3.6: fix building with big make -j (2011-09-05 20:38:50 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/gcc-fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/gcc-fix

Saul Wold (1):
  gcc: add patch for ice 50099, which caused lttng-ust not to build

 meta/recipes-devtools/gcc/gcc-4.6.inc              |    3 +-
 .../gcc/gcc-4.6/fix-for-ice-50099.patch            |   38 ++++++++++++++++++++
 2 files changed, 40 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6/fix-for-ice-50099.patch

-- 
1.7.6



