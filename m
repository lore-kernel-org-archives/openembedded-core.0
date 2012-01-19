Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1Rnr7B-0002MA-EJ
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 13:29:13 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 19 Jan 2012 04:21:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="97520990"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.2])
	by azsmga001.ch.intel.com with ESMTP; 19 Jan 2012 04:21:32 -0800
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2012 20:38:04 +0800
Message-Id: <cover.1326976547.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/1] core-image-foo: add summary to each image bb file
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
X-List-Received-Date: Thu, 19 Jan 2012 12:29:13 -0000

This path is to add summary variable to each image bb file for Hob 2 use later, according to the poky reference manual.
Please review.

The following changes since commit 522c6b376d067243bff20c64a1f6f8700be8e586:

  gnutls: Fix configure issue wrt to rm (2012-01-19 11:34:13 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib shane/summary
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=shane/summary

Shane Wang (1):
  core-image-foo: add summary to each image bb file

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



