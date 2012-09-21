Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1TF83R-0008Pa-8W
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Sep 2012 20:34:23 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 21 Sep 2012 11:21:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,463,1344236400"; d="scan'208";a="196034213"
Received: from unknown (HELO localhost) ([10.255.13.250])
	by orsmga001.jf.intel.com with ESMTP; 21 Sep 2012 11:21:33 -0700
From: tom.zanussi@intel.com
To: scott.a.garman@intel.com,
	openembedded-core@lists.openembedded.org
Date: Fri, 21 Sep 2012 13:21:30 -0500
Message-Id: <cover.1348251066.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.11.4
Subject: [PATCH 0/1][denzil] udev: don't mount with -o sync
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
X-List-Received-Date: Fri, 21 Sep 2012 18:34:23 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

This is the same patch that exists in master and that fixes a problem
with slow writes still seen in denzil; the only change I made was to
match the PR bump to denzil.

Fixes [YOCTO #3049]

The following changes since commit 65ffa7395055f7e012cb973f63f92380828eed0d:

  yocto-bsp: use base branches for qemu 'newbranch' case (2012-08-21 11:35:22 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/denzil-mount-nosync
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/denzil-mount-nosync

Jesse Zhang (1):
  udev: don't mount with -o sync

 meta/recipes-core/udev/udev/mount.sh | 2 +-
 meta/recipes-core/udev/udev_164.bb   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.11.4



