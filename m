Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QJzeS-0008O5-Sq
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 04:59:53 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 10 May 2011 19:57:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,350,1301900400"; d="scan'208";a="434039008"
Received: from yocto-build3.sh.intel.com (HELO localhost) ([10.239.48.58])
	by azsmga001.ch.intel.com with ESMTP; 10 May 2011 19:57:04 -0700
Message-Id: <cover.1305082484.git.edwin.zhai@intel.com>
Old-Date: Wed, 11 May 2011 10:54:44 +0800
Date: Wed, 11 May 2011 10:57:04 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Zhai Edwin <edwin.zhai@intel.com>
Subject: [PATCH 0/2] Some fixes, Edwin, May11, 2011,
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
X-List-Received-Date: Wed, 11 May 2011 02:59:53 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Upgrade qemu git to fix bug 1013, and removed some unused files.

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: gzhai/fix3
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/fix3

Thanks,
    Zhai Edwin <edwin.zhai@intel.com>
---


Zhai Edwin (2):
  qemu: Upgrade qemu git to the latest 0.14 branch
  clutter-cairo: remove remaining files from this obsolete recipe

 .../qemu/qemu-git/enable-i386-linux-user.patch     |   53 +
 meta/recipes-devtools/qemu/qemu-git/fix-nogl.patch |  125 +
 .../qemu/qemu-git/linker-flags.patch               |   22 +
 meta/recipes-devtools/qemu/qemu-git/no-strip.patch |   13 +
 .../qemu/qemu-git/qemu-git-qemugl-host.patch       |34366 ++++++++++++++++++++
 .../qemu/qemu-git/qemu-vmware-vga-depth.patch      |  115 +
 .../qemu-git/qemugl-allow-glxcontext-release.patch |   63 +
 .../qemu/qemu-git/qemugl-fix.patch                 |   73 +
 meta/recipes-devtools/qemu/qemu_git.bb             |   13 +-
 meta/recipes-graphics/clutter/clutter-cairo.inc    |   13 -
 .../clutter-cairo/enable_examples-0.6.patch        |   23 -
 .../clutter/clutter-cairo/enable_examples.patch    |   28 -
 12 files changed, 34837 insertions(+), 70 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu-git/enable-i386-linux-user.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu-git/fix-nogl.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu-git/linker-flags.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu-git/no-strip.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu-git/qemu-git-qemugl-host.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu-git/qemu-vmware-vga-depth.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu-git/qemugl-allow-glxcontext-release.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu-git/qemugl-fix.patch
 delete mode 100644 meta/recipes-graphics/clutter/clutter-cairo.inc
 delete mode 100644 meta/recipes-graphics/clutter/clutter-cairo/enable_examples-0.6.patch
 delete mode 100644 meta/recipes-graphics/clutter/clutter-cairo/enable_examples.patch



