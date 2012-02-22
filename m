Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1S01QA-0001qf-NM
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 02:55:06 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 21 Feb 2012 17:46:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="119901753"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.15.54])
	by fmsmga001.fm.intel.com with ESMTP; 21 Feb 2012 17:46:46 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2012 17:46:41 -0800
Message-Id: <cover.1329875013.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH 0/3] Fix overriding PACKAGE_ARCH for MACHINE specific SRC_URI [v2]
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
X-List-Received-Date: Wed, 22 Feb 2012 01:55:06 -0000

This series includes a fix for base.bbclass so that PACKAGE_ARCH is correctly set to
MACHINE_ARCH for all recipes which include a MACHINE OVERRIDE in SRC_URI.

Cheers,
Joshua

The following changes since commit d4ffe12ca36bf10be4e0f9565d7c3d8e6f4a265a:

  iputils: Add base_libdir to VPATH in order to find the crypto library (2012-02-21 17:59:21 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib josh/work
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/work

Joshua Lock (3):
  base.bbclass: check all entries of FILESPATH for MACHINE overrides
  external-csl-toolchain: skip parsing if CSL_VER_MAIN isn't set
  netbase: remove redundant assignments

 meta/classes/base.bbclass                        |   14 ++++++++------
 meta/recipes-core/meta/external-csl-toolchain.bb |    8 ++++++++
 meta/recipes-core/netbase/netbase_4.47.bb        |    4 ----
 3 files changed, 16 insertions(+), 10 deletions(-)

-- 
1.7.7.6



