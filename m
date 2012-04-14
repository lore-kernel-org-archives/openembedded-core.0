Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SIvES-0001cu-3Q
	for openembedded-core@lists.openembedded.org;
	Sat, 14 Apr 2012 07:09:08 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 13 Apr 2012 21:59:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="141604946"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by fmsmga001.fm.intel.com with ESMTP; 13 Apr 2012 21:59:45 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Apr 2012 21:59:43 -0700
Message-Id: <cover.1334379293.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
Subject: [PATCH 0/3] misc critical bugfixes for fedora 17 alpha
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
X-List-Received-Date: Sat, 14 Apr 2012 05:09:08 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

The eglibc fix is done differently now.
grub recipe is fixed to use the gcc-cross compiler
grub & grub-efi-native recipes are fixed for gcc4.7 compiler

more details in the commit messages.

Nitin

The following changes since commit ee71422b9893f9f77173fb2612d1ffbbc68643c3:

  linux-yocto: allow .cfg, .scc, .patch and defconfigs to be processed in order (2012-04-13 22:44:46 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/bugfixes
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/bugfixes

Nitin A Kamble (3):
  grub-1.99: use gcc-cross for building the target binaries
  grub-efi-native, grub: fix build with gcc 4.7
  eglibc: fix builds on fedora 17 alpha

 ...rub-1.99-gcc-4.7.0-strict-aliasing-errors.patch |  147 ++++++++++++++++++++
 ...b-1.99-gcc-4.7.0-uninitialized-var-errors.patch |   41 ++++++
 .../grub/files/grub-1.99-gcc-4.7.0.patch           |   34 +++++
 meta/recipes-bsp/grub/grub-efi-native_1.99.bb      |    8 +-
 meta/recipes-bsp/grub/grub_1.99.bb                 |    7 +-
 meta/recipes-core/eglibc/eglibc-package.inc        |    5 +
 meta/recipes-core/eglibc/eglibc_2.13.bb            |    2 +-
 meta/recipes-core/eglibc/eglibc_2.15.bb            |    2 +-
 8 files changed, 241 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/grub-1.99-gcc-4.7.0-strict-aliasing-errors.patch
 create mode 100644 meta/recipes-bsp/grub/files/grub-1.99-gcc-4.7.0-uninitialized-var-errors.patch
 create mode 100644 meta/recipes-bsp/grub/files/grub-1.99-gcc-4.7.0.patch

-- 
1.7.7



