Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1ScGpn-0005HD-74
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jun 2012 16:03:39 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 06 Jun 2012 06:53:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="153704041"
Received: from unknown (HELO localhost) ([10.255.12.119])
	by orsmga002.jf.intel.com with ESMTP; 06 Jun 2012 06:53:09 -0700
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Jun 2012 08:52:58 -0500
Message-Id: <cover.1338990374.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/2] gnupg build fixes
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
X-List-Received-Date: Wed, 06 Jun 2012 14:03:39 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

The yocto autobuilder was having problems generating rootfs for a bunch
of machines which this patchset was seen to fix.

The first patch adds a missing dependency that the second removes; the
patches are staged this way to easily allow the second to be reverted
if the CCID driver option is wanted, in which case the missing dependency
will still be there.

The following changes since commit df8f55a919b3cc602ce1f1c51630c7edf6e36b55:
  Cristian Iorga (1):
        ltp: Add patch to correct failing build

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/poky-master-gnupg-dependency-fix.v1
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/poky-master-gnupg-dependency-fix.v1

Tom Zanussi (2):
  gnupg: add libusb to DEPENDS
  gnupg: disable CCID driver

 meta/recipes-support/gnupg/gnupg_2.0.19.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)



