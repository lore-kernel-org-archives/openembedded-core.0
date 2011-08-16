Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1QtFA1-0001iL-KY
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Aug 2011 10:38:13 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 16 Aug 2011 01:33:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="38827060"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by orsmga001.jf.intel.com with ESMTP; 16 Aug 2011 01:33:26 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Aug 2011 16:33:43 +0800
Message-Id: <cover.1313482889.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/4 v2][PULL] multilib: RPM rootfs related fixes.
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
X-List-Received-Date: Tue, 16 Aug 2011 08:38:13 -0000

Hi Richard and Mark,

This pull request fixes some multilib issues related with RPM rootfs. Please help to review and pull.

Changes from v1:
1) Remove the original patch "multilib: remove MULTILIB_PACKAGE_ARCHS variable".
2) Add a new patch "rootfs_rpm: Fix DEFAULTTUNE setting in multilib case"
3) For the two package_rpm related patches, The first patch is to change
   strip_multilib functionality, and the second patch is to handle the package
   rename issue in multilib.
4) Add a new patch "gtk-icon-cache: Adding MLPREFIX when dynamically set
   RDEPENDS" to fix the dynamic setting of RDEPENDS in multilib case.

[YOCTO #1368]

Thanks,
Dongxiao

The following changes since commit 13db5f420ca9bff98561f80d78958278734ad1f4:

  distro-tracking: Update info for gpgme, libassuan, apr... after last upgrade. (2011-08-15 15:26:04 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dxu4/ml
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/ml

Dongxiao Xu (4):
  rootfs_rpm: Fix DEFAULTTUNE setting in multilib case
  package_rpm: enhance strip_multilib function
  package_rpm: Fix package rename issue in multilib case
  gtk-icon-cache: Adding MLPREFIX when dynamically set RDEPENDS

 meta/classes/gtk-icon-cache.bbclass |    2 +-
 meta/classes/package_rpm.bbclass    |   22 +++++++++++-----------
 meta/classes/rootfs_rpm.bbclass     |    4 ----
 3 files changed, 12 insertions(+), 16 deletions(-)



