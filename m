Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S4xvj-0003cc-3a
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Mar 2012 18:12:07 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 06 Mar 2012 09:03:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="125714831"
Received: from unknown (HELO swold-mobl.verilan.com) ([10.255.15.180])
	by fmsmga001.fm.intel.com with ESMTP; 06 Mar 2012 09:03:30 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Mar 2012 09:03:03 -0800
Message-Id: <cover.1331053126.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [CONSOLIDATED PULL 00/20] Kernel and GCC Updates included
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
X-List-Received-Date: Tue, 06 Mar 2012 17:12:07 -0000

Richard,

This is a set of changes that should go in early for
stabilizition of OE-Core and Poky moving.

I have built with the 4.6.3 GCC and not have seen issues at
this point, so I think this is on the safer side to take 
now.

Sau!
 
The following changes since commit d7b8c247227f3cc82f92292407f548927e9fde78:

  base.bbclass: Fix PACKAGECONFIG handling when no flags are set (2012-03-05 13:03:41 -0800)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Andreas Oberritter (1):
  libsdl: add DirectFB support

Bruce Ashfield (5):
  linux-yocto: respect FILESPATH directories
  linux-yocto: use bareclone option
  linux-yocto: v3.2.9, v3.0.23 + fixes and updates
  linux-yocto/meta: fix incorrect config references
  linux-yocto/rt: udpate SRCREVs to 3.2.9-rt16

Dongxiao Xu (1):
  multilib: extend all recipes in multilib.conf

James Limbouris (1):
  gdk-pixbuf: Pick up ${NM} from the environment.

Ken Werner (1):
  image_types: add IMAGE_ROOTFS_ALIGNMENT

Khem Raj (1):
  gcc: Upgrade to 4.6.3 release

Koen Kooi (1):
  xz: split out liblzma as seperate packages

Mike Crowe (1):
  valgrind: Support compilation without X11

Otavio Salvador (1):
  image.bbclass: fix rootfs generation without package management tools

Peter Tworek (1):
  psplash: Add mising commands module import.

Robert Yang (1):
  logrotate 3.7.9: Allow rotate log across filesystems

Samuel Stirtzel (1):
  mime.bbclass: Fix bracket error.

Saul Wold (2):
  glib-2.0: Add Upstream Status for nodbus.patch
  polkit: Fix Upstream-Status tag

Zhai Edwin (2):
  self-hosted: Fix multiple libx11 error
  shadow-sysroot: Fix for multilib

 meta/classes/core-image.bbclass                    |    2 -
 meta/classes/image.bbclass                         |    7 +-
 meta/classes/image_types.bbclass                   |   12 +-
 meta/classes/kernel-yocto.bbclass                  |   30 ++-
 meta/classes/mime.bbclass                          |    2 +-
 meta/classes/useradd.bbclass                       |    2 +-
 meta/conf/multilib.conf                            |  313 +++++++++++++++++++-
 meta/recipes-core/glib-2.0/glib-2.0/nodbus.patch   |    2 +
 meta/recipes-core/psplash/psplash_git.bb           |    2 +-
 meta/recipes-core/tasks/task-self-hosted.bb        |    4 +-
 meta/recipes-devtools/gcc/gcc-4.6.inc              |    9 +-
 .../GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch       |   32 +-
 .../gcc/gcc-4.6/gcc-flags-for-build.patch          |   97 ++++---
 .../gcc-4.6/gcc-poison-system-directories.patch    |   80 +++---
 .../gcc/gcc-4.6/gcc-with-linker-hash-style.patch   |   36 ++--
 .../gcc/gcc-4.6/volatile_access_backport.patch     |   28 --
 meta/recipes-devtools/valgrind/valgrind_3.7.0.bb   |    6 +-
 .../allow-across-different-filesystems.patch       |  154 ++++++++++
 meta/recipes-extended/logrotate/logrotate_3.7.9.bb |    5 +-
 ...ession-Set-error-if-we-cannot-find-a-sess.patch |    2 +-
 ...ession-Actually-return-TRUE-if-a-session-.patch |    2 +-
 meta/recipes-extended/xz/xz_5.0.3.bb               |    9 +-
 .../gdk-pixbuf-2.24.0/configure_nm.patch           |   18 ++
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb |    3 +-
 meta/recipes-graphics/libsdl/libsdl_1.2.14.bb      |    8 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb    |   12 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb    |   13 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb  |   10 +-
 meta/recipes-kernel/linux/linux-yocto_2.6.37.bb    |    4 +-
 meta/recipes-kernel/linux/linux-yocto_3.0.bb       |   20 +-
 meta/recipes-kernel/linux/linux-yocto_3.2.bb       |   21 +-
 31 files changed, 712 insertions(+), 233 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/volatile_access_backport.patch
 create mode 100644 meta/recipes-extended/logrotate/logrotate-3.7.9/allow-across-different-filesystems.patch
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.0/configure_nm.patch

-- 
1.7.7.6



