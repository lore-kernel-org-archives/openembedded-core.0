Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SIyy7-0001Ir-HY
	for openembedded-core@lists.openembedded.org;
	Sat, 14 Apr 2012 11:08:31 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 14 Apr 2012 01:59:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="153560251"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by fmsmga002.fm.intel.com with ESMTP; 14 Apr 2012 01:59:08 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Sat, 14 Apr 2012 01:59:06 -0700
Message-Id: <cover.1334390876.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
Subject: [v2 0/4] grub & eglibc fixes for fedora 17 alpha
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
X-List-Received-Date: Sat, 14 Apr 2012 09:08:32 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

These are various grub fixes for correctly building grub recipes for various targets.
These are tested for emenlow, sugerbay, qemux86, qemux86-64 machines

The eglibc commits is thes same as in the v1 pull request.

Nitin

The following changes since commit ee71422b9893f9f77173fb2612d1ffbbc68643c3:

  linux-yocto: allow .cfg, .scc, .patch and defconfigs to be processed in order (2012-04-13 22:44:46 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/grub3
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/grub3

Nitin A Kamble (4):
  eglibc: fix builds on fedora 17 alpha
  grub-1.99: use gcc-cross for building the target binaries
  grub-efi-native, grub: fix build with gcc 4.7
  grub-1.99: fix configure error

 .../grub-1.99-fix-enable_execute_stack-check.patch |   27 ++++
 .../grub/files/grub-1.99-fpmath-sse-387-fix.patch  |   37 +++++
 ...rub-1.99-gcc-4.7.0-strict-aliasing-errors.patch |  147 ++++++++++++++++++++
 ...b-1.99-gcc-4.7.0-uninitialized-var-errors.patch |   41 ++++++
 .../grub/files/grub-1.99-gcc-4.7.0.patch           |   34 +++++
 meta/recipes-bsp/grub/grub-efi-native_1.99.bb      |   10 +-
 meta/recipes-bsp/grub/grub_1.99.bb                 |   10 +-
 meta/recipes-core/eglibc/eglibc-package.inc        |    5 +
 meta/recipes-core/eglibc/eglibc_2.13.bb            |    2 +-
 meta/recipes-core/eglibc/eglibc_2.15.bb            |    2 +-
 10 files changed, 309 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/grub-1.99-fix-enable_execute_stack-check.patch
 create mode 100644 meta/recipes-bsp/grub/files/grub-1.99-fpmath-sse-387-fix.patch
 create mode 100644 meta/recipes-bsp/grub/files/grub-1.99-gcc-4.7.0-strict-aliasing-errors.patch
 create mode 100644 meta/recipes-bsp/grub/files/grub-1.99-gcc-4.7.0-uninitialized-var-errors.patch
 create mode 100644 meta/recipes-bsp/grub/files/grub-1.99-gcc-4.7.0.patch

-- 
1.7.7



