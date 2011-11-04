Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RMO2M-0000OA-W0
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Nov 2011 18:58:43 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 04 Nov 2011 10:52:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="71264373"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.98])
	by orsmga001.jf.intel.com with ESMTP; 04 Nov 2011 10:52:31 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Nov 2011 17:52:25 +0000
Message-Id: <cover.1320429060.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/3] Misc fixes
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
X-List-Received-Date: Fri, 04 Nov 2011 17:58:43 -0000

The following changes since commit f01fbc17b5d9bf9a227d64fe858014376cd19432:

  avahi: fix useradd race condition (2011-11-03 14:48:42 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/fixes8
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/fixes8

Paul Eggleton (3):
  allarch.bbclass: disable shlib and debug symbol processing
  core-image-minimal-initramfs: force IMAGE_FSTYPES
  qemugl: switch to new git repo

 meta/classes/allarch.bbclass                       |    5 +++++
 .../images/core-image-minimal-initramfs.bb         |    1 +
 meta/recipes-graphics/mesa/qemugl_git.bb           |    2 +-
 3 files changed, 7 insertions(+), 1 deletions(-)

-- 
1.7.5.4



