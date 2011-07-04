Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lei.mei@intel.com>) id 1Qdc5p-0006k6-Ge
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Jul 2011 07:53:13 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 03 Jul 2011 22:49:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,471,1304319600"; d="scan'208";a="22323845"
Received: from daocaoren-desktop.sh.intel.com (HELO localhost.localdomain)
	([10.239.47.21])
	by azsmga001.ch.intel.com with ESMTP; 03 Jul 2011 22:49:23 -0700
From: Mei Lei <lei.mei@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jul 2011 14:04:36 +0800
Message-Id: <cover.1309707957.git.lei.mei@intel.com>
X-Mailer: git-send-email 1.6.3.3
Subject: [PATCH 0/2]coreutils: Upgrade from 8.9 to 8.12
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
X-List-Received-Date: Mon, 04 Jul 2011 05:53:13 -0000

Upgrade coreutils and update the distro_tracking_fields.inc


The following changes since commit ad2363278f0ea86fcf3464f8f6073d3a3d06be63:
  Khem Raj (1):
        uclibc: Fix compilation in thumb mode

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib lmei3/coreutils
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=lmei3/coreutils

Mei Lei (2):
  coreutils: Upgrade from 8.9 to 8.12
  distro_tracking_fields.inc: update recipes upgrade information

 .../conf/distro/include/distro_tracking_fields.inc |   12 ++++++------
 .../{coreutils_8.9.bb => coreutils_8.12.bb}        |    4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-core/coreutils/{coreutils_8.9.bb => coreutils_8.12.bb} (95%)



