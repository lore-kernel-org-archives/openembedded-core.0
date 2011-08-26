Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qx2KZ-0006Xu-QB
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 21:44:43 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 26 Aug 2011 12:39:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,286,1312182000"; d="scan'208";a="45450487"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.251])
	by fmsmga001.fm.intel.com with ESMTP; 26 Aug 2011 12:39:53 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2011 12:39:30 -0700
Message-Id: <cover.1314387279.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [CONSOLIDATED PULL 00/21]
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
X-List-Received-Date: Fri, 26 Aug 2011 19:44:44 -0000

Richard,

A variety of changes

Sau!


The following changes since commit 81aa4bfbde871af1d569b64499c34a315bf6218e:

  classes/sanity: enhance the network connectivity test (2011-08-25 08:49:12 -0700)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Bruce Ashfield (1):
  linux-yocto-rt: qemumips: fix boot panic

Dmitry Eremin-Solenikov (1):
  opkg-utils: ignore packages disapperaring filelist generation

Dongxiao Xu (6):
  package.bbclass: Fix recrdeptask of image type recipes
  base-passwd: Use BPN in FILES paths
  bitbake.conf: Use BPN in FILES paths
  multilib.bbclass: Fix renaming logic for "FILES_", "RDEPENDS_", etc
  multilib.bbclass: add "pkg_postinst" and "pkg_postrm" as renaming
    elements
  multilib.bbclass: add renaming for INITSCRIPT related variables

Jessica Zhang (1):
  [YOCTO #1396] Fix adt-installer for consistent naming for powerpc and
    add all arch template for installation

Kang Kai (3):
  bitbake.conf: set includedir_nativesdk
  qt4-tools-nativesdk: remove gcc standard paths
  cmake-nativesdk: remove gcc standard paths

Kumar Gala (2):
  gcc-4.6: Drop gcc-poison-parameters.patch as its not need
  gcc-4.5.1: Drop gcc-poison-parameters.patch, replace with bug fix
    patch

Liming Wang (2):
  script/runqemu: change boot command line for qemuppc
  scripts/runqemu: disable unfs boot mode for qemuppc

Martin Jansa (1):
  eglibc: fix gconv packaging after
    5486cac29db6e67051fff7637a0abc9aeab661e5

Mike Crowe (2):
  kernel.bbclass: support kernel image type of vmlinux.gz
  kernel.bbclass: Find the kernel consistently.

Phil Blundell (1):
  pango: make x11 support conditional on DISTRO_FEATURES

Xiaofeng Yan (1):
  qt4e-demo-image: Fix bug 999

 meta/classes/kernel.bbclass                        |   13 +-
 meta/classes/multilib.bbclass                      |   19 +-
 meta/classes/package.bbclass                       |    2 +-
 meta/conf/bitbake.conf                             |    5 +-
 .../recipes-core/base-passwd/base-passwd_3.5.22.bb |   10 +-
 meta/recipes-core/eglibc/eglibc-package.inc        |    4 +-
 meta/recipes-core/eglibc/eglibc_2.12.bb            |    2 +-
 meta/recipes-core/eglibc/eglibc_2.13.bb            |    2 +-
 meta/recipes-devtools/cmake/cmake_2.8.5.bb         |    8 +-
 meta/recipes-devtools/gcc/gcc-4.5.1.inc            |    4 +-
 .../gcc/gcc-4.5.1/gcc-poison-parameters.patch      |   85 ------
 meta/recipes-devtools/gcc/gcc-4.5.1/pr44618.patch  |  314 ++++++++++++++++++++
 meta/recipes-devtools/gcc/gcc-4.6.inc              |    3 +-
 .../gcc/gcc-4.6/gcc-poison-parameters.patch        |   76 -----
 .../installer/adt-installer/adt_installer.conf     |   17 +-
 .../adt-installer/scripts/adt_installer_internal   |    2 +-
 .../installer/adt-installer/scripts/data_define    |    2 +-
 .../opkg-utils/index-ignore-filenotfound.patch     |   17 +
 meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb |    2 +-
 meta/recipes-graphics/pango/pango.inc              |   10 +-
 meta/recipes-graphics/pango/pango_1.28.4.bb        |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb    |    4 +-
 meta/recipes-qt/images/qt4e-demo-image.bb          |   19 ++
 meta/recipes-qt/qt4/qt4-tools-nativesdk.inc        |    9 +-
 meta/recipes-qt/tasks/task-qt4e.bb                 |   56 ++++
 scripts/runqemu                                    |    6 +
 scripts/runqemu-internal                           |    4 +-
 27 files changed, 478 insertions(+), 219 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.5.1/gcc-poison-parameters.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.5.1/pr44618.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/gcc-poison-parameters.patch
 create mode 100644 meta/recipes-qt/images/qt4e-demo-image.bb
 create mode 100644 meta/recipes-qt/tasks/task-qt4e.bb

-- 
1.7.6



