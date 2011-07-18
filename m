Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1Qih0i-0002RO-1X
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Jul 2011 08:08:57 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 17 Jul 2011 23:04:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,221,1309762800"; d="scan'208";a="28794731"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by orsmga001.jf.intel.com with ESMTP; 17 Jul 2011 23:04:43 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jul 2011 14:01:44 +0800
Message-Id: <cover.1310968787.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/4][PULL] multilib: change hard coded /usr/lib path.
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
X-List-Received-Date: Mon, 18 Jul 2011 06:08:57 -0000

Hi Richard,

This pull request fixes some hard coded /usr/lib path in recipes within
minimal image. Please help to review and pull.

Thanks,
Dongxiao

The following changes since commit fa4bcfdb73167f8159b88e5a4d711c0d37627a70:

  bb-matrix: correct BB and PM number canonicalization (2011-07-14 22:23:09 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dxu4/multilib
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/multilib

Dongxiao Xu (3):
  xcb-proto: add multilib support.
  pciutils: Change the hardcoded /usr/lib to support multilib.
  udev: Change hard coded /usr/lib to support multilib

Yu Ke (1):
  perl: revise the RRECOMMENDS_perl-modules for multilib case

 .../pciutils/pciutils-3.1.7/makefile.patch         |   12 ++++++++++++
 meta/recipes-bsp/pciutils/pciutils_3.1.7.bb        |    5 +++--
 meta/recipes-core/udev/udev-164/makefile.patch     |   14 ++++++++++++++
 meta/recipes-core/udev/udev-new.inc                |    1 +
 meta/recipes-core/udev/udev_145.bb                 |    2 +-
 meta/recipes-devtools/perl/perl_5.12.3.bb          |    2 +-
 .../xcb/xcb-proto-1.6/aclocal.patch                |   20 ++++++++++++++++++++
 meta/recipes-graphics/xcb/xcb-proto.inc            |    3 ++-
 8 files changed, 54 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-bsp/pciutils/pciutils-3.1.7/makefile.patch
 create mode 100644 meta/recipes-core/udev/udev-164/makefile.patch
 create mode 100644 meta/recipes-graphics/xcb/xcb-proto-1.6/aclocal.patch



