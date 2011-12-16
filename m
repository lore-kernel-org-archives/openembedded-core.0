Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RbR92-0007x4-B2
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Dec 2011 07:19:48 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 15 Dec 2011 22:12:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="87177707"
Received: from unknown (HELO localhost) ([10.255.15.170])
	by orsmga001.jf.intel.com with ESMTP; 15 Dec 2011 22:12:48 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Dec 2011 22:12:29 -0800
Message-Id: <cover.1324015417.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 0/4] Fix grub efi menu, kernel messages, and live image dosfsck
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
X-List-Received-Date: Fri, 16 Dec 2011 06:19:48 -0000

This series moves the live image EFI content to the /EFI/BOOT directory where it
belongs per the specification. It also adds support for the efi_gop framebuffer.
This allows grub to start on boot and the kernel to log messages to the physical
console. Also correct some live image filesystem issues.

The following changes since commit 0eb139619301d0efee330932eba3617dcb39284e:

  Patch Upstream Status Updates (2011-12-15 14:35:27 +0000)

are available in the git repository at:
  git://git.yoctoproject.org/user-contrib/dvhart/oe-core dvhart/efi/dev
  http://git.yoctoproject.org/cgit.cgi/user-contrib/dvhart/oe-core/log/?h=dvhart/efi/dev

Darren Hart (4):
  grub-efi: Use /EFI/BOOT now that mkdosfs -d works with directories
  grub-efi: Add efi_gop module to payload for physical console support
  grub-efi: specify prefix so it can find grub.cfg
  bootimg: Use dosfsck to clean up the generated live image

 meta/classes/bootimg.bbclass                  |    1 +
 meta/classes/grub-efi.bbclass                 |   18 +++---------------
 meta/recipes-bsp/grub/grub-efi-native_1.99.bb |    6 +++---
 3 files changed, 7 insertions(+), 18 deletions(-)

-- 
1.7.6.4



