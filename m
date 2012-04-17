Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SKGNX-0001IB-TR
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Apr 2012 23:56:04 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 17 Apr 2012 14:46:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="133663345"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.25])
	by orsmga002.jf.intel.com with ESMTP; 17 Apr 2012 14:46:36 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Apr 2012 14:46:31 -0700
Message-Id: <cover.1334699033.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH 0/3] Self-Hosted Image patches
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
X-List-Received-Date: Tue, 17 Apr 2012 21:56:04 -0000

Richard,

This set of changes adds the lsb_release command and 
sets the i/etc/lsb-release file up correctly for the 
release.

I also am removing the BB_NO_NETWORK from the self-hosted
image to allow it to have network, and updating the SRCREV,
which you might have to do again to get these patches actaully 
into the image.

Thanks
	Sau!

The following changes since commit 89788fbd10fdfbbe54927339d7ec516d0e4d7ef5:

  libproxy: Allow to build in non-gplv3 configuration (2012-04-17 14:08:27 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Saul Wold (3):
  lsb: Add DISTRO Info to the lsb-release
  task-self-hosted: Add LSB for distro info
  self-hosted-image: remove BB_NO_NETWORK and update Poky SRCREV

 meta/recipes-core/images/self-hosted-image.bb |    5 ++---
 meta/recipes-core/tasks/task-self-hosted.bb   |    1 +
 meta/recipes-extended/lsb/lsb_1.4.bb          |    5 +++++
 3 files changed, 8 insertions(+), 3 deletions(-)

-- 
1.7.7.6



