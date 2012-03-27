Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SCOMT-0000eY-0S
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Mar 2012 06:50:25 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 26 Mar 2012 21:41:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="123622827"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.110])
	by azsmga001.ch.intel.com with ESMTP; 26 Mar 2012 21:41:22 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Mar 2012 12:38:27 +0800
Message-Id: <cover.1332822880.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/1] Cleanup non shipped empty directories for gcc-cross-canadian
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
X-List-Received-Date: Tue, 27 Mar 2012 04:50:25 -0000

This patch improved the previous patch of commit id 04a08bf7 by hanlding the 
non-existent directory situation.

The following changes since commit 644b7503c37fd73730dd3d7841463b158b8934ed:
  Richard Purdie (1):
        guile: Deal with hardcoded path issues

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib llu/warningfix2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/warningfix2

Lianhao Lu (1):
  gcc-cross-canadian: Clean non shipped empty directories.

 meta/recipes-devtools/gcc/gcc-package-sdk.inc |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)



