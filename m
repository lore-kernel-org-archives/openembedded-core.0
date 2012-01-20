Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1RoBxy-0001TR-Hk
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jan 2012 11:45:06 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 20 Jan 2012 02:35:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="109029965"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.2])
	by fmsmga001.fm.intel.com with ESMTP; 20 Jan 2012 02:35:23 -0800
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2012 18:51:59 +0800
Message-Id: <cover.1327056627.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/1][V2] core-image-foo: add description to each image bb file
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
X-List-Received-Date: Fri, 20 Jan 2012 10:45:06 -0000

This patch is to add description to each image bb file according to poky reference manual for Hob2 use later.
Please review.

The following changes since commit 522c6b376d067243bff20c64a1f6f8700be8e586:

  gnutls: Fix configure issue wrt to rm (2012-01-19 11:34:13 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib shane/desc-meta-change
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=shane/desc-meta-change

Shane Wang (1):
  core-image-foo: add description to each image bb file

 meta/recipes-core/images/core-image-base.bb        |    2 ++
 meta/recipes-core/images/core-image-core.bb        |    2 ++
 meta/recipes-core/images/core-image-minimal-dev.bb |    2 ++
 .../images/core-image-minimal-initramfs.bb         |    3 +++
 .../images/core-image-minimal-mtdutils.bb          |    4 ++++
 meta/recipes-core/images/core-image-minimal.bb     |    2 ++
 meta/recipes-extended/images/core-image-basic.bb   |    3 +++
 meta/recipes-extended/images/core-image-lsb-dev.bb |    4 ++++
 meta/recipes-extended/images/core-image-lsb-sdk.bb |    4 ++++
 meta/recipes-extended/images/core-image-lsb.bb     |    3 +++
 meta/recipes-graphics/images/core-image-clutter.bb |    3 +++
 meta/recipes-sato/images/core-image-sato-dev.bb    |    3 +++
 meta/recipes-sato/images/core-image-sato-sdk.bb    |    4 +++-
 meta/recipes-sato/images/core-image-sato.bb        |    2 ++
 14 files changed, 40 insertions(+), 1 deletions(-)

-- 
1.7.6



