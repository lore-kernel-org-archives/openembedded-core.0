Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1RNesr-0002dl-Og
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 07:10:10 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 07 Nov 2011 22:03:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,475,1315206000"; d="scan'208";a="34328311"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by AZSMGA002.ch.intel.com with ESMTP; 07 Nov 2011 22:03:52 -0800
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Nov 2011 14:19:36 +0800
Message-Id: <cover.1320732950.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/1][PULL] multilib: drop MULTILIB_IMAGE_INSTALL variable.
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
X-List-Received-Date: Tue, 08 Nov 2011 06:10:10 -0000

Hi Richard,

This pull request is to remove the MULTILIB_IMAGE_INSTALL variable,
please help to review and pull.

I tested build and runtime with both rpm and ipk packaging for following
scenarios:

1) lib64-core-image-sato on qemux86-64.
2) lib32-core-image-sato on qemux86.
3) lib32-core-image-sato on qemux86-64.
4) lib64-core-image-sato on qemux86 (buildable, but not runnable).
5) core-image-sato on qemux86-64 with lib32-connman.

Thanks,
Dongxiao

The following changes since commit 0809f98e995d3a2ce24ad25bade3dcd5154061fd:

  lighttpd 1.4.29: rename index.html to avoid clashes with DL_DIR (2011-11-07 14:03:38 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dxu4/multilib
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/multilib

Dongxiao Xu (1):
  multilib: Drop MULTILIB_IMAGE_INSTALL

 meta/classes/image.bbclass       |    4 +---
 meta/classes/multilib.bbclass    |    5 ++---
 meta/classes/package_ipk.bbclass |   31 ++++++++++++++++++++++++++++---
 meta/classes/package_rpm.bbclass |   37 +++++++++----------------------------
 meta/classes/rootfs_ipk.bbclass  |    3 +--
 meta/classes/rootfs_rpm.bbclass  |    3 +--
 6 files changed, 42 insertions(+), 41 deletions(-)



