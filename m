Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1Sru2i-0001lW-Sx
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 18:57:37 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Jul 2012 09:46:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="174349423"
Received: from fear.jf.intel.com (HELO rage.local) ([10.7.201.160])
	by orsmga002.jf.intel.com with ESMTP; 19 Jul 2012 09:46:02 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Khem Raj <raj.khem@gmail.com>, Tom Zanussi <tom.zanussi@intel.com>,
	Kishore Bodke <kishore.k.bodke@intel.com>, Saul Wold <sgw@linux.intel.com>
Date: Thu, 19 Jul 2012 09:45:09 -0700
Message-Id: <cover.1342716197.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH V3 0/1] EFI: Make installer EFI aware
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
X-List-Received-Date: Thu, 19 Jul 2012 16:57:37 -0000

Rebased on top of Radu's console param changes.

The following changes since commit 5b7da937cd298abd6f8f0eecfede2810b157179f:

  grub: fix error stating the root device (2012-07-19 17:19:45 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/user-contrib/dvhart/oe-core installer
  http://git.yoctoproject.org/cgit.cgi/user-contrib/dvhart/oe-core/log/?h=installer

Darren Hart (1):
  EFI: Make installer EFI aware

 meta/classes/grub-efi.bbclass                      |    2 +
 .../images/core-image-minimal-initramfs.bb         |    2 +-
 .../initrdscripts/files/init-install-efi.sh        |  175 ++++++++++++++++++++
 meta/recipes-core/initrdscripts/files/init-live.sh |    6 +-
 .../initramfs-live-install-efi_1.0.bb              |   22 +++
 5 files changed, 203 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-core/initrdscripts/files/init-install-efi.sh
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb

-- 
1.7.5.4



