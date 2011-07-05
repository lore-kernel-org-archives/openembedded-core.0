Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1Qe3H7-00060V-N5
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jul 2011 12:54:41 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 05 Jul 2011 03:50:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,478,1304319600"; d="scan'208";a="23932863"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.87])
	by fmsmga002.fm.intel.com with ESMTP; 05 Jul 2011 03:50:51 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jul 2011 18:51:30 +0800
Message-Id: <cover.1309862610.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [MULTILIB_SUBTASK4 0/5] opkg support for multilib
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
X-List-Received-Date: Tue, 05 Jul 2011 10:54:41 -0000

This series of patches is the subtask 4 of https://wiki.yoctoproject.org/wiki/Multilib.

It is based on the git branch of "poky-contrib/rpurdie/ml".

It added the support to opkg backend to allow install of multilib variant packages, also fixed some other bugs.

The multilib variant packages to be installed should be set in the variable MULTILIB_IMAGE_INSTALL.

The following changes since commit b04ee632eb06650dde3e3ee8c4788a45cae0aa5e:
  Richard Purdie (1):
        multilib: First pass from RP

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib llu/ml
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=llu/ml

Lianhao Lu (5):
  libc-package.bbclass: Replace hard coded libdir.
  classes/multilib.bbclass: Change the SHLIBSDIR.
  multilib/package.bbclass: Set PACKAGE_ARCH for multilib.
  image.bbclass: Added variables for multilib support.
  package(rootfs)_ipk.bbclass: support multilib in opkg backend.

 meta/classes/image.bbclass        |   54 ++++++++++++++++++++++++++++++++++++-
 meta/classes/libc-package.bbclass |    7 +++--
 meta/classes/multilib.bbclass     |   11 ++-----
 meta/classes/package.bbclass      |   11 +++++++
 meta/classes/package_ipk.bbclass  |   51 ++++++++++++++++++++++++++++++++++
 meta/classes/rootfs_ipk.bbclass   |    3 ++
 6 files changed, 125 insertions(+), 12 deletions(-)



