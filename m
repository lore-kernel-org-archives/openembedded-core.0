Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1R8Y38-0006Al-S8
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Sep 2011 15:50:19 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 27 Sep 2011 06:44:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,449,1312182000"; d="scan'208";a="71186858"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by fmsmga002.fm.intel.com with ESMTP; 27 Sep 2011 06:44:52 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Sep 2011 21:52:54 +0800
Message-Id: <cover.1317131373.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/4][RFC] multilib: bug fixes related with RPM backend
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
X-List-Received-Date: Tue, 27 Sep 2011 13:50:19 -0000

Hi Richard,

This pull request is to fix several multilib bugs related with RPM backend,
please help to review.

BTW, I am issuing a round of multilib testing agasint:
 - lib32 sato image on qemux86 machine
 - lib32 sato image on qemux86-64 machine
 - lib64 sato image on qemux86-64 machine
 - lib64 sato image on qemux86 machine
 - sato image on qemux86-64 with several lib32 packages (lib32-connman)

I will update you the test result once it is finished.

Thanks,
Dongxiao

The following changes since commit 684a4b517d13884c315688967fadd5e6a4845b71:

  libffi: really populate -dev package (2011-09-26 20:50:27 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dxu4/ml
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/ml

Dongxiao Xu (4):
  multilib.bbclass: map RDEPENDS and LINGUAS_INSTALL for image recipes
  multilib: remove the multilib handling to allarch
  multilib: add MLPREFIX to deploy folder
  tune-i586: fix hardcoded TUNE_PKGARCH

 meta/classes/multilib.bbclass                      |   12 +++++-------
 meta/classes/multilib_global.bbclass               |    2 +-
 meta/classes/package_rpm.bbclass                   |   10 ++++++++--
 meta/classes/rootfs_rpm.bbclass                    |    2 +-
 meta/conf/machine/include/tune-i586.inc            |    3 ++-
 meta/conf/multilib.conf                            |    7 +++++++
 .../python/python-pygobject_2.27.91.bb             |    2 +-
 7 files changed, 25 insertions(+), 13 deletions(-)



