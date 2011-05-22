Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QODkY-0000sw-IZ
	for openembedded-core@lists.openembedded.org;
	Sun, 22 May 2011 20:51:38 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 22 May 2011 11:48:38 -0700
X-ExtLoop1: 1
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.133])
	by orsmga002.jf.intel.com with ESMTP; 22 May 2011 11:48:37 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 22 May 2011 11:48:24 -0700
Message-Id: <cover.1306089781.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH 0/9] UPDATED: 21/22-May 2011 Pull
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
X-List-Received-Date: Sun, 22 May 2011 18:51:38 -0000

Richard,

This is the updated pull request from the 21st, it contains both
Nitin's and Khem's Updates to their branches for GCC, eglibc along with
distcc & opkg.

Also included are some fixes for world build issues.

Thanks
	Sau!


The following changes since commit 54ecf8e3992b8a01c2e5bd16720e1819b71b68bd:

  packagedata: don't choke on empty PACKAGES (2011-05-20 17:41:34 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib.git sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Khem Raj (2):
  distcc_2.18.3.bb: Fix compilation on uclibc
  opkg_svn.bb: Install rcS.d into $D instead of $IMAGE_ROOTFS

Nitin A Kamble (3):
  tcmode-default: switch to eglibc 2.13 from 2.12
  tcmode-default: switch to gcc 4.6.0 for ppc & mips also
  gplv2 recipes update upstream status of patches

Saul Wold (4):
  gail: Add LIC_FILES_CHKSUM
  update-alternatives-dpkg: Update to dpkg base 1.15.8.7
  puzzles: update to r9173
  package_rpm.bbclass: create method for createrepo cmd

 meta/classes/package_rpm.bbclass                   |    6 +++++-
 meta/conf/distro/include/tcmode-default.inc        |    6 +-----
 meta/recipes-devtools/distcc/distcc_2.18.3.bb      |   15 +++++++++++----
 meta/recipes-devtools/opkg/opkg/headerfix.patch    |   19 -------------------
 meta/recipes-devtools/opkg/opkg_svn.bb             |    3 +--
 .../update-alternatives-dpkg.inc                   |    6 ++++--
 .../update-alternatives-dpkg_1.13.22.bb            |    7 -------
 .../update-alternatives-dpkg_1.15.8.7.bb           |   13 +++++++++++++
 meta/recipes-extended/at/at-3.1.12/configure.patch |    2 ++
 .../cpio/cpio-2.8/m4extensions.patch               |    2 ++
 meta/recipes-extended/cpio/cpio-2.8/statdef.patch  |    2 ++
 .../grep/grep-2.5.1a/uclibc-fix.patch              |    2 ++
 .../recipes-extended/tar/tar-1.17/gcc43build.patch |    2 ++
 .../tar/tar-1.17/m4extensions.patch                |    2 ++
 meta/recipes-gnome/gnome/gail_1.20.0.bb            |   10 +++++++---
 .../puzzles/{puzzles_r9163.bb => puzzles_r9173.bb} |    0
 16 files changed, 54 insertions(+), 43 deletions(-)
 delete mode 100644 meta/recipes-devtools/opkg/opkg/headerfix.patch
 delete mode 100644 meta/recipes-devtools/update-alternatives/update-alternatives-dpkg_1.13.22.bb
 create mode 100644 meta/recipes-devtools/update-alternatives/update-alternatives-dpkg_1.15.8.7.bb
 rename meta/recipes-sato/puzzles/{puzzles_r9163.bb => puzzles_r9173.bb} (100%)

-- 
1.7.3.4



