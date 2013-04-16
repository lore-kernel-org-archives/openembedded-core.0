Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1US82D-0007SG-8u
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Apr 2013 17:43:07 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 16 Apr 2013 08:25:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,486,1363158000"; d="scan'208";a="227838010"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.14.4])
	by AZSMGA002.ch.intel.com with ESMTP; 16 Apr 2013 08:25:11 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Apr 2013 16:25:06 +0100
Message-Id: <cover.1366125772.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH v2 0/3] PR bumps to allow removal of meta-oe bbappends
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Apr 2013 15:43:21 -0000

If we can apply these for 1.4 we can drop the bbappends in meta-oe,
which should avoid unnecessary rebuilds when adding that layer.

Since v1, bump by 2 as originally requested by Martin and bump INC_PR
for the qt4-* recipes as pointed out by him in feedback.


The following changes since commit 1a70a3225947aa45f3e1f377d50a5865aac64d2b:

  runqemu-internal: Drop distcc support (2013-04-16 12:39:27 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/qt-meta-oe-bbappends
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/qt-meta-oe-bbappends

Paul Eggleton (3):
  packagegroup-qte-toolchain-target: bump PR to allow removal of
    meta-oe bbappend
  qt4-embedded: bump PR to allow removal of meta-oe bbappend
  qt4-x11-free: bump PR to allow removal of meta-oe bbappend

 meta/recipes-qt/packagegroups/packagegroup-qte-toolchain-target.bb |    2 +-
 meta/recipes-qt/qt4/qt4-embedded.inc                               |    2 +-
 meta/recipes-qt/qt4/qt4-x11-free.inc                               |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
1.7.10.4



