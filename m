Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SAwL0-0006eA-5V
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 05:42:54 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 22 Mar 2012 21:33:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="143705618"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.110])
	by fmsmga002.fm.intel.com with ESMTP; 22 Mar 2012 21:33:56 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Mar 2012 12:31:48 +0800
Message-Id: <cover.1332474081.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/5] Fixed packaging warnings
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
X-List-Received-Date: Fri, 23 Mar 2012 04:42:54 -0000

This patch set fixed misc packaging warnings.

The following changes since commit b92aaf764e6de94fb9fdee610e8f6643ccf74894:
  Richard Purdie (1):
        gst-plugins-bluetooth: Don't install headers, man pages or .pc files

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib llu/warningfix2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/warningfix2

Lianhao Lu (5):
  pseudo: package the var/pseudo directory.
  gdb-cross-canadian: not shipping libiberty.
  ncurses: ship clear/reset in package.
  nativesdk/misc: set PKGSUFFIX for correct variable name expansion.
  libgcc: corrected -nativesdk package namings.

 meta/classes/nativesdk.bbclass                     |    2 ++
 meta/recipes-core/eglibc/eglibc-locale.inc         |    2 +-
 meta/recipes-core/eglibc/eglibc_2.13.bb            |    2 +-
 meta/recipes-core/eglibc/eglibc_2.15.bb            |    2 +-
 meta/recipes-core/ncurses/ncurses.inc              |    6 +++---
 meta/recipes-devtools/gcc/gcc-4.6.inc              |    2 +-
 meta/recipes-devtools/gcc/libgcc_4.6.bb            |   11 +++++++----
 meta/recipes-devtools/gdb/gdb-cross-canadian.inc   |    6 ++++++
 .../recipes-devtools/gdb/gdb-cross-canadian_7.4.bb |    2 +-
 meta/recipes-devtools/opkg/opkg.inc                |    2 +-
 meta/recipes-devtools/pseudo/pseudo.inc            |    2 +-
 meta/recipes-devtools/pseudo/pseudo_1.2.bb         |    2 +-
 meta/recipes-devtools/pseudo/pseudo_git.bb         |    2 +-
 meta/recipes-multimedia/alsa/alsa-lib_1.0.25.bb    |    2 +-
 meta/recipes-support/sqlite/sqlite3_3.7.10.bb      |    2 +-
 15 files changed, 29 insertions(+), 18 deletions(-)



