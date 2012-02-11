Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Rw0ym-00079b-E6
	for openembedded-core@lists.openembedded.org;
	Sat, 11 Feb 2012 01:38:16 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 10 Feb 2012 16:30:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="105636743"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.14.248])
	by azsmga001.ch.intel.com with ESMTP; 10 Feb 2012 16:30:08 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2012 16:30:06 -0800
Message-Id: <cover.1328920045.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH 0/1] Fix overriding PACKAGE_ARCH for MACHINE specific SRC_URI
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
X-List-Received-Date: Sat, 11 Feb 2012 00:38:16 -0000

After the discussion following my recent netbase patch I spent some time today
looking to fixup the BSP which triggered the change and discovered that the
logic to set PACKAGE_ARCH = MACHINE_ARCH for MACHINE specific SRC_URI overrides
doesn't search for said overrides in layers.

This patch is probably an ugly fix, but it's a fix nonetheless. I couldn't find
a better fix before boarding a plane so submit this as is for review.

Cheers,
Joshua

The following changes since commit 41a83ccfe50ec69425a4828fb5836d38d3f99e67:

  guile: fix cross configure failure (2012-02-10 17:01:42 +0000)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib josh/work
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=josh/work

Joshua Lock (1):
  base.bbclass: look in layers for SRC_URI with MACHINE overrides too

 meta/classes/base.bbclass |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

-- 
1.7.7.6



