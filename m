Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1US7gA-0005Wh-6V
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Apr 2013 17:20:27 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 16 Apr 2013 08:02:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,486,1363158000"; d="scan'208";a="319073477"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.14.4])
	by orsmga002.jf.intel.com with ESMTP; 16 Apr 2013 08:01:26 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Apr 2013 16:01:21 +0100
Message-Id: <cover.1366124347.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/3] PR bumps to allow removal of meta-oe bbappends
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
X-List-Received-Date: Tue, 16 Apr 2013 15:20:29 -0000

If we can apply these for 1.4 we can drop the bbappends in meta-oe,
which should avoid unnecessary rebuilds when adding that layer.


The following changes since commit 67a73bfce60dfed75653365a5c4fca85319be8cc:

  hicolor-icon-theme: bump PR to allow removal of duplicate from meta-gnome (2013-04-16 15:37:10 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/qt-meta-oe-bbappends
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/qt-meta-oe-bbappends

Paul Eggleton (3):
  packagegroup-qte-toolchain-target: bump PR to allow removal of
    meta-oe bbappend
  qt4-embedded: bump PR to allow removal of meta-oe bbappend
  qt4-x11-free: bump PR to allow removal of meta-oe bbappend

 meta/recipes-qt/packagegroups/packagegroup-qte-toolchain-target.bb |    2 +-
 meta/recipes-qt/qt4/qt4-embedded_4.8.4.bb                          |    2 +-
 meta/recipes-qt/qt4/qt4-x11-free_4.8.4.bb                          |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
1.7.10.4



