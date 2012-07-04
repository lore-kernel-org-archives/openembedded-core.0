Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SmHSf-00011A-4B
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jul 2012 06:45:09 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 03 Jul 2012 21:34:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="166675769"
Received: from fear.jf.intel.com (HELO rage.local) ([10.7.201.160])
	by orsmga002.jf.intel.com with ESMTP; 03 Jul 2012 21:34:05 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Khem Raj <raj.khem@gmail.com>, Tom Zanussi <tom.zanussi@intel.com>,
	Kishore Bodke <kishore.k.bodke@intel.com>, Saul Wold <sgw@linux.intel.com>
Date: Tue,  3 Jul 2012 21:33:57 -0700
Message-Id: <cover.1341376182.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/5] Live installer fixes and EFI support
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
X-List-Received-Date: Wed, 04 Jul 2012 04:45:09 -0000

Cleanup the existing installer a bit.
Fix the grub-efi-native help2man build issue.
Add EFI support to the installer.

I have tested both PCBIOS install as well as EFI install from a live USB key to
the internal MMC device on the FRI2 BSP.

The following changes since commit a6b6df1350149c116050cb93c3c7b4802c709d31:

  task-core-tools-debug: Added openssh-sftp-server. (2012-07-03 14:52:38 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/user-contrib/dvhart/oe-core installer
  http://git.yoctoproject.org/cgit.cgi/user-contrib/dvhart/oe-core/log/?h=installer

Darren Hart (5):
  init-install: Use swap_ratio in the calulation of swap_size
  init-install: Correct ext2->ext3 typo in logging
  init-install: Clean up partition alignment
  grub-efi: Do not use help2man
  EFI: Make installer EFI aware

 meta/classes/grub-efi.bbclass                      |    2 +
 .../grub/files/grub-1.99-disable-help2man.patch    |  231 ++++++++++++++++++++
 meta/recipes-bsp/grub/grub-efi-native_1.99.bb      |   17 +-
 .../images/core-image-minimal-initramfs.bb         |    2 +-
 .../initrdscripts/files/init-install-efi.sh        |  188 ++++++++++++++++
 .../initrdscripts/files/init-install.sh            |   12 +-
 meta/recipes-core/initrdscripts/files/init-live.sh |    6 +-
 7 files changed, 440 insertions(+), 18 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/grub-1.99-disable-help2man.patch
 create mode 100644 meta/recipes-core/initrdscripts/files/init-install-efi.sh

-- 
1.7.5.4



