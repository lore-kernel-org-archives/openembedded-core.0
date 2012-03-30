Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SDVAs-0004Su-62
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 08:19:02 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 29 Mar 2012 23:09:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="123477954"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.110])
	by orsmga001.jf.intel.com with ESMTP; 29 Mar 2012 23:09:41 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Mar 2012 14:06:08 +0800
Message-Id: <cover.1333087412.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/1] Fix powerpc environment file naming in adt-installer
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
X-List-Received-Date: Fri, 30 Mar 2012 06:19:02 -0000

The yocto bug #2055 was reopened due to the oe-core commit c2d96179. This patch fix this by adapting to the new powerpc environment file name in adt-installer.

The following changes since commit c8afc79b5d3205355ad61d2589221bf8babe8395:
  Noor Ahsan (1):
        libc-packgae.bbclass: Add i686 support in locale_arch_options

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib llu/bug2055
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/bug2055

Lianhao Lu (1):
  adt-installer: Adapted environment file name for powerpc.

 .../adt-installer/scripts/adt_installer_internal   |    2 --
 .../installer/adt-installer_1.0.bb                 |    2 +-
 2 files changed, 1 insertions(+), 3 deletions(-)



