Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1UKXMb-0006z6-Um
	for Openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 18:08:51 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 26 Mar 2013 09:51:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,913,1355126400"; d="scan'208";a="276214721"
Received: from yocto-hm1.jf.intel.com ([10.23.232.34])
	by azsmga001.ch.intel.com with ESMTP; 26 Mar 2013 09:51:44 -0700
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org
Date: Tue, 26 Mar 2013 09:51:41 -0700
Message-Id: <cover.1364316538.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH 0/1] A single commit to fix grub-efi-native build
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Mar 2013 17:09:00 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Due to recent changes in the oecore layer to use separate builddir, the 
grub-efi-native recipe need to change to avoid build errors.

Thanks,
Nitin

The following changes since commit c376f1f49cea182a2887945840ab97a20970a373:

  package.bbclass: Ensure debug source file is generated correctly (2013-03-25 17:42:58 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/misc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/misc

Nitin A Kamble (1):
  grub-efi-native_2.00.bb: fix a build issue

 meta/recipes-bsp/grub/grub-efi-native_2.00.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

-- 
1.7.3.4



