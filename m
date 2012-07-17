Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SrDeJ-0001BH-55
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 21:41:35 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 17 Jul 2012 12:30:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="173332306"
Received: from fear.jf.intel.com (HELO rage.local) ([10.7.201.160])
	by orsmga002.jf.intel.com with ESMTP; 17 Jul 2012 12:30:14 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Khem Raj <raj.khem@gmail.com>, Tom Zanussi <tom.zanussi@intel.com>,
	Kishore Bodke <kishore.k.bodke@intel.com>, Saul Wold <sgw@linux.intel.com>
Date: Tue, 17 Jul 2012 12:29:05 -0700
Message-Id: <cover.1342549867.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/1 V2] EFI: Make installer EFI aware
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
X-List-Received-Date: Tue, 17 Jul 2012 19:41:35 -0000

V2: Add missing initramfs-live-install-efi_1.0.bb file.

The following changes since commit 2bd0aaf98c5d586638d82f5f22c1c24122a889a3:

  toolchain-scripts: Sync the SDK/ADT values to the build system (2012-07-17 18:02:10 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/user-contrib/dvhart/oe-core installer
  http://git.yoctoproject.org/cgit.cgi/user-contrib/dvhart/oe-core/log/?h=installer

Darren Hart (1):
  EFI: Make installer EFI aware

 meta/classes/grub-efi.bbclass                      |    2 +
 .../images/core-image-minimal-initramfs.bb         |    2 +-
 .../initrdscripts/files/init-install-efi.sh        |  188 ++++++++++++++++++++
 meta/recipes-core/initrdscripts/files/init-live.sh |    6 +-
 .../initramfs-live-install-efi_1.0.bb              |   22 +++
 5 files changed, 216 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-core/initrdscripts/files/init-install-efi.sh
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb

-- 
1.7.5.4



