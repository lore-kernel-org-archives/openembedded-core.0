Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Rb0WX-0002x7-6m
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Dec 2011 02:54:17 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 14 Dec 2011 17:47:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="85863762"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 14 Dec 2011 17:47:18 -0800
From: nitin.a.kamble@intel.com
To: dvhart@linux.intel.com,
	openembedded-core@lists.openembedded.org
Date: Wed, 14 Dec 2011 17:47:14 -0800
Message-Id: <cover.1323913192.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [PATCH 0/1] mkdosfs populated image creation fix version:2
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
X-List-Received-Date: Thu, 15 Dec 2011 01:54:17 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

This has enhanced the commit for fixing mkdosfs. We noticed some 
issues with the generated image with the earlier sent-out commit. 
This version 2 commit has improved the the mkdosfs further. Now 
the outstanding issues in the image are fixable by dosfsck.
  More details are in the patch documentation.

Thanks,
Nitin

The following changes since commit 9d136b2db8f906c562cbdb23a9b238f0e237074b:

  gdk-pixbuf: Ensure the binaries can be relocated (2011-12-13 18:00:25 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/bugfix
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/bugfix

Nitin A Kamble (1):
  dosfstools: fix populated image creation with dirs

 .../dosfstools/fix_populated_dosfs_creation.patch  |  489 ++++++++++++++++++++
 .../recipes-devtools/dosfstools/dosfstools_2.11.bb |    5 +-
 2 files changed, 492 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/dosfstools/dosfstools/fix_populated_dosfs_creation.patch

-- 
1.7.6.4



