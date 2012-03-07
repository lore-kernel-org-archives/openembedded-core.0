Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1S56TU-0005xv-GX
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Mar 2012 03:19:32 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 06 Mar 2012 18:10:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="74496354"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.62])
	by AZSMGA002.ch.intel.com with ESMTP; 06 Mar 2012 18:10:54 -0800
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Mar 2012 10:06:44 +0800
Message-Id: <cover.1331085934.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/1] fixed errors in adt-installer
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
X-List-Received-Date: Wed, 07 Mar 2012 02:19:32 -0000

This patch fixed Yocto bug #2055.

The following changes since commit d7b8c247227f3cc82f92292407f548927e9fde78:
  Richard Purdie (1):
        base.bbclass: Fix PACKAGECONFIG handling when no flags are set

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib llu/bug2055
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/bug2055

Lianhao Lu (1):
  adt-installer: Corrected wrong environment file names.

 .../adt-installer/scripts/adt_installer_internal   |    2 ++
 .../installer/adt-installer_1.0.bb                 |    5 +----
 2 files changed, 3 insertions(+), 4 deletions(-)



