Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1Slv69-0002t6-St
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 06:52:26 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 02 Jul 2012 21:41:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="187795485"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.116])
	by fmsmga002.fm.intel.com with ESMTP; 02 Jul 2012 21:41:23 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jul 2012 12:43:30 +0800
Message-Id: <cover.1341290500.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH V2 0/2] remaining ssh IMAGE_FEATURE fixings
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
X-List-Received-Date: Tue, 03 Jul 2012 04:52:26 -0000

V2:
  Please ignore the previous wrong patch set.

These are the remaining patches to fix the bug [YOCTO #2605]

It adds the "openssh-sftp-server" into the task-core-debug-tools so any image built with image feature "tools-debug" allow the user to use sftp.

It processes conflicting IMAGE_FEATURES, i.e. ssh-server-dropbear and ssh-server-openssh.

The following changes since commit 64422f7c5da160050a5454817c8fa9d070104b34:
  Richard Purdie (1):
        package.bbclass: Add missing PKGR, PKGV, PKGE and ALTERNATIVE variables from PACKAGEVARS

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib llu/ssh
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=llu/ssh

Lianhao Lu (2):
  task-core-tools-debug: Added openssh-sftp-server.
  image/core-image: Handle conflicting IMAGE_FEATURES.

 meta/classes/core-image.bbclass                  |   11 ++++++++++-
 meta/classes/image.bbclass                       |   17 +++++++++++++++++
 meta/recipes-core/tasks/task-core-tools-debug.bb |    3 +++
 meta/recipes-sato/images/core-image-sato-sdk.bb  |    2 ++
 4 files changed, 32 insertions(+), 1 deletions(-)



