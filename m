Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1SFibF-0002wN-K3
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Apr 2012 11:03:25 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Apr 2012 01:53:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="128946047"
Received: from envy.jf.intel.com ([10.7.201.175])
	by orsmga002.jf.intel.com with ESMTP; 05 Apr 2012 01:53:09 -0700
From: Beth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Apr 2012 01:57:32 -0700
Message-Id: <cover.1333615939.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/1] Modify Image Descriptions
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
X-List-Received-Date: Thu, 05 Apr 2012 09:03:25 -0000

Added more descriptive text to the image DESCRIPTIONS

The following changes since commit 5607729d9901c394b7cd4db6e38fe7fb19116f39:

  self-hosted-image: Increase space for build and allow builder user sudo access (2012-04-04 17:17:55 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib eflanagan/2227
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=eflanagan/2227

Elizabeth Flanagan (1):
  Hob: Modify Image Descriptions

 meta/recipes-core/images/core-image-core.bb        |    2 +-
 meta/recipes-core/images/core-image-minimal-dev.bb |    3 ++-
 .../images/core-image-minimal-initramfs.bb         |    6 +++---
 .../images/core-image-minimal-mtdutils.bb          |    6 +++---
 meta/recipes-core/images/self-hosted-image.bb      |    1 +
 meta/recipes-extended/images/core-image-lsb-dev.bb |    6 +++---
 meta/recipes-extended/images/core-image-lsb-sdk.bb |    6 +++---
 meta/recipes-extended/images/core-image-lsb.bb     |    3 ++-
 meta/recipes-qt/images/qt4e-demo-image.bb          |    1 +
 meta/recipes-rt/images/core-image-rt-sdk.bb        |    4 +++-
 meta/recipes-rt/images/core-image-rt.bb            |    3 ++-
 meta/recipes-sato/images/core-image-sato-dev.bb    |    6 +++---
 meta/recipes-sato/images/core-image-sato-sdk.bb    |    6 +++---
 meta/recipes-sato/images/core-image-sato.bb        |    5 +++--
 14 files changed, 33 insertions(+), 25 deletions(-)



