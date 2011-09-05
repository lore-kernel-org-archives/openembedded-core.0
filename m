Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1R0SYJ-00051W-1W
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Sep 2011 08:21:03 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 04 Sep 2011 23:16:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,331,1312182000"; d="scan'208";a="45593785"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.146])
	by azsmga001.ch.intel.com with ESMTP; 04 Sep 2011 23:16:01 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Sep 2011 14:15:21 +0800
Message-Id: <cover.1315203166.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/1] Make initramfs-live-install consistent to grub
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
X-List-Received-Date: Mon, 05 Sep 2011 06:21:03 -0000

This patch fixed bug #1428. Since the grub 0.97 on which the initramfs-live-install 
RDEPENDS doesn't support x86_64 target, remove it from the COMPATIBLE_HOST in 
initramfs-live-install.

The following changes since commit 0616557a8c29b42bae0ffd5fd665a046810047e4:
  Richard Purdie (1):
        populate_sdk: We need to ensure that the SDK sysroot reflects PACKAGE_ARCH

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib llu/bug1428
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/bug1428

Lianhao Lu (1):
  initramfs-live-install: Be consistent with grub.

 .../initrdscripts/initramfs-live-install_1.0.bb    |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)



