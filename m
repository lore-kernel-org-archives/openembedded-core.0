Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UPxRL-0006Je-0r
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Apr 2013 18:00:07 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 10 Apr 2013 08:42:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,447,1363158000"; d="scan'208";a="284331483"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.14.51])
	by azsmga001.ch.intel.com with ESMTP; 10 Apr 2013 08:42:39 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Apr 2013 16:42:24 +0100
Message-Id: <cover.1365608262.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/4] Fixes for read-only-rootfs
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
X-List-Received-Date: Wed, 10 Apr 2013 16:00:26 -0000

There were a number of things breaking read-only-rootfs support; this
patchset fixes the most serious issues.


The following changes since commit f9d88a559dd2479893d7570676d42955ee3b8845:

  tinylogin: Fix mix of tabs and spaces for SRC_URI indentation (2013-04-10 13:15:14 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/read-only-rootfs-fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/read-only-rootfs-fixes

Paul Eggleton (4):
  rpm-postinsts: don't create broken postinst script
  rpm-postinsts: avoid errors during boot with read-only-rootfs enabled
  initscripts: fix read-only-rootfs-hook.sh to avoid using unionfs
  initscripts: fix read-only-rootfs-hook.sh to start earlier

 .../initscripts-1.0/read-only-rootfs-hook.sh           |   16 +++++-----------
 meta/recipes-core/initscripts/initscripts_1.0.bb       |    2 +-
 meta/recipes-devtools/rpm/rpm-postinsts.bb             |   12 ++++++------
 3 files changed, 12 insertions(+), 18 deletions(-)

-- 
1.7.10.4



