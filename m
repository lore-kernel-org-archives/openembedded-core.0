Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QNr6o-0000cc-MW
	for openembedded-core@lists.openembedded.org;
	Sat, 21 May 2011 20:41:06 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 21 May 2011 11:38:07 -0700
X-ExtLoop1: 1
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.39])
	by orsmga002.jf.intel.com with ESMTP; 21 May 2011 11:38:07 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 21 May 2011 11:37:56 -0700
Message-Id: <cover.1306002889.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH 0/8] 21-May-Consolidated Pull
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
X-List-Received-Date: Sat, 21 May 2011 18:41:06 -0000

Richard,

This has a couple of fixes that are bound for M1, and will be cherry-picked
there once in oe-core / poky master.

The GCC Version update to 4.6 along with a corresponding change to eglibc 2.13
has been build tested and will be QA'ed as part of RC1 in 1.1 m1.

Thanks
	Sau!


The following changes since commit 54ecf8e3992b8a01c2e5bd16720e1819b71b68bd:

  packagedata: don't choke on empty PACKAGES (2011-05-20 17:41:34 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib.git sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Khem Raj (2):
  opkg_svn.bb: Install rcS.d into $D instead of $IMAGE_ROOTFS
  distcc_2.18.3.bb: Fix compilation on uclibc

Saul Wold (6):
  gail: Add LIC_FILES_CHKSUM
  update-alternatives-dpkg: Update to dpkg base 1.15.8.7
  puzzles: update to r9173
  tcmode-default: set *GCCVERSION to 4.6 for all Arches
  tcmode-default: Update Eglibc to 2.13
  package_rpm.bbclass: create method for createrepo cmd

 meta/classes/package_rpm.bbclass                   |    6 +++++-
 meta/conf/distro/include/tcmode-default.inc        |    6 +-----
 meta/recipes-devtools/distcc/distcc_2.18.3.bb      |   17 ++++++++++++-----
 meta/recipes-devtools/opkg/opkg/headerfix.patch    |   19 -------------------
 meta/recipes-devtools/opkg/opkg_svn.bb             |    3 +--
 .../update-alternatives-dpkg.inc                   |    6 ++++--
 .../update-alternatives-dpkg_1.13.22.bb            |    7 -------
 .../update-alternatives-dpkg_1.15.8.7.bb           |   13 +++++++++++++
 meta/recipes-gnome/gnome/gail_1.20.0.bb            |   10 +++++++---
 .../puzzles/{puzzles_r9163.bb => puzzles_r9173.bb} |    0
 10 files changed, 43 insertions(+), 44 deletions(-)
 delete mode 100644 meta/recipes-devtools/opkg/opkg/headerfix.patch
 delete mode 100644 meta/recipes-devtools/update-alternatives/update-alternatives-dpkg_1.13.22.bb
 create mode 100644 meta/recipes-devtools/update-alternatives/update-alternatives-dpkg_1.15.8.7.bb
 rename meta/recipes-sato/puzzles/{puzzles_r9163.bb => puzzles_r9173.bb} (100%)

-- 
1.7.3.4



