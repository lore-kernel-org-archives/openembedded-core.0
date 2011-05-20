Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QNJqo-00083M-Bb
	for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 09:10:22 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 20 May 2011 00:07:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,241,1304319600"; d="scan'208";a="439578043"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.39])
	by azsmga001.ch.intel.com with ESMTP; 20 May 2011 00:07:04 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 May 2011 00:06:50 -0700
Message-Id: <cover.1305874831.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH 00/12] 20-May-2011 Consolidated Pull
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
X-List-Received-Date: Fri, 20 May 2011 07:10:22 -0000

Richard,

This is building green on x86 and ARM.

This contains updated pull requests from Khem and Dexuan.  I have some
non-gplv3 fixes along with a fix to the u-boot patch due to a bad checksum.

I have again included the gcc 4.6 enabler for x86 and arm, the kernel 
updates are in place. Feel free to remove it, but I think we get a good QA
pass and move forward, if not we fall back to gcc 4.5.x for RC2.

Thanks for your considersation

Sau!


The following changes since commit f2528db8f466a21ca207b310fffa7b05884b4579:

  distro/defaultsetup.conf: Append TCLIBC to TMPDIR by default (2011-05-19 23:49:37 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib.git sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Dexuan Cui (1):
  package-index.bb: add support for deb and rpm.

Khem Raj (6):
  conf: Create distro overridable IMAGE varibales
  uclibc/site_config/funcs: getloadavg is unimplemented
  nfs-utils_1.2.3.bb: Fix compile failure on uclibc
  distcc_2.18.3.bb: Fix compilation on uclibc
  opkg_svn.bb: Install rcS.d into ${D} instead of ${IMAGE_ROOTFS}
  opkg-utils: Synchronise with OE

Nitin A Kamble (1):
  tcmode-default: switch to gcc 4.6.0 for x86, x86-64 & arm

Saul Wold (4):
  modutils-cross: fix install issue
  ed (GPLv2): remove --disable-silent-rules
  gettext (gplv2): add virtual/gettext to PROVIDES list
  u-boot: fix LIC_FILE_CHKSUM

 meta/classes/image.bbclass                         |    9 +++++-
 meta/classes/package_deb.bbclass                   |    4 +++
 meta/classes/package_ipk.bbclass                   |    4 +++
 meta/classes/package_rpm.bbclass                   |    3 ++
 meta/conf/distro/include/default-distrovars.inc    |   13 +++++++++
 meta/conf/distro/include/tcmode-default.inc        |    8 ++++-
 meta/recipes-bsp/uboot/u-boot_git.bb               |    2 +-
 .../nfs-utils/nfs-utils-1.0.6-uclibc.patch         |   16 ++++++-----
 .../nfs-utils/nfs-utils-1.2.3-uclibc-libio.h.patch |   26 +++++++++++++++++
 .../nfs-utils/nfs-utils_1.2.3.bb                   |    1 +
 meta/recipes-core/gettext/gettext_0.16.1.bb        |    4 +-
 meta/recipes-core/meta/package-index.bb            |    6 +---
 meta/recipes-core/tasks/task-core-boot.bb          |    4 ---
 meta/recipes-core/uclibc/site_config/funcs         |    1 -
 meta/recipes-devtools/distcc/distcc_2.18.3.bb      |   15 +++++++---
 .../opkg-utils/opkg-utils/mtime-int.patch          |   29 ++++++++++++++++++++
 meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb |    7 +++-
 meta/recipes-devtools/opkg/opkg/headerfix.patch    |   19 -------------
 meta/recipes-devtools/opkg/opkg_svn.bb             |    3 +-
 meta/recipes-extended/ed/ed_0.5.bb                 |    4 ++-
 .../modutils/modutils-cross_2.4.27.bb              |    4 +-
 21 files changed, 129 insertions(+), 53 deletions(-)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.2.3-uclibc-libio.h.patch
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/mtime-int.patch
 delete mode 100644 meta/recipes-devtools/opkg/opkg/headerfix.patch

-- 
1.7.3.4



