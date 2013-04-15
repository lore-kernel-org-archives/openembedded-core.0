Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1URoWD-0003UC-TM
	for Openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 20:52:49 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 15 Apr 2013 11:34:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,477,1363158000"; d="scan'208";a="318580289"
Received: from yocto-hm1.jf.intel.com ([10.23.232.34])
	by orsmga002.jf.intel.com with ESMTP; 15 Apr 2013 11:33:45 -0700
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org
Date: Mon, 15 Apr 2013 11:33:44 -0700
Message-Id: <cover.1366050697.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH 0/1] a bugfix for oecore layer
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
X-List-Received-Date: Mon, 15 Apr 2013 18:52:55 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Information on the bugfix is in the commit's header.

Thanks,
Nitin

The following changes since commit 45c8cc1a58e7868f4603be08a86fef178edfc926:

  poky.conf: add Poky 1.4 and CentOS 6.4 to SANITY_TESTED_DISTROS (2013-04-15 17:21:28 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/misc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/misc

Nitin A Kamble (1):
  initramfs-live-install*: fix the "install" boot option

 .../initrdscripts/files/init-install-efi.sh        |    1 -
 .../initrdscripts/files/init-install.sh            |    1 -
 .../initramfs-live-install-efi_1.0.bb              |    2 +-
 .../initrdscripts/initramfs-live-install_1.0.bb    |    2 +-
 4 files changed, 2 insertions(+), 4 deletions(-)

-- 
1.7.3.4



