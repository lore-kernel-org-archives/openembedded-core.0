Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 72CB36A57E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 15:11:35 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 31 May 2013 08:11:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,779,1363158000"; d="scan'208";a="346217084"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.185])
	by fmsmga002.fm.intel.com with ESMTP; 31 May 2013 08:11:29 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2013 16:10:38 +0100
Message-Id: <cover.1370012780.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [dylan][PATCH 00/15] Stable branch cherry-picks (cover letter only)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 31 May 2013 15:11:35 -0000

These are cherry-picks from master to be applied to the dylan branch for
inclusion in the next 1.4 stable release (1.4.1). They have been tested
on my build machine locally.

Please review this series for suitability for inclusion into the stable
branch.

The following changes since commit f24b4c3daeba43b352977fcdb807f1ed45c1c694:

  kern-tools: refresh and make dash compliant (2013-05-22 11:57:46 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/dylan-next
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/dylan-next

Bogdan Marinescu (1):
  guile: added runtime dependency on glibc-gconv-iso8859-1

Bruce Ashfield (1):
  qemu*: restrict NFSD to linux-yocto only

Jackie Huang (1):
  guile: don't search for libreadline in host libdir

Jesse Zhang (2):
  dbus-glib: use BPN instead of PN
  initscripts: let status return 0 when proc is running well

Jessica Zhang (1):
  Make toolchain output name using SDK_VERSION instead of DISTRO_VERSION
    to be consistent [yocto #2342]

Jonathan Liu (3):
  systemd: fix ordering for machineid and run-postinsts services
  findutils: backport fixes for documentation build errors
  findutils: backport more fixes for documentation build errors

Ming Liu (1):
  dpkg-native: Fix native perl path

Nitin A Kamble (1):
  dropbear: a fix for hang in dropbearkey, built for x32

Paul Eggleton (1):
  python-smartpm: add gettext-native to DEPENDS

Richard Purdie (1):
  dpkg: Be deterministic about lzma dependency

Samuli Piippo (1):
  gdb-cross-canadian: use correct exec-prefix path for python

Xin Ouyang (1):
  qmake_base.bbclass: Add linux-gnun32-oe-g++ to QMAKESPEC

 meta/classes/populate_sdk_base.bbclass             |   2 +-
 meta/classes/qmake_base.bbclass                    |   2 +-
 meta/conf/machine/include/qemu.inc                 |   2 +-
 meta/recipes-core/dbus/dbus-glib.inc               |   8 +-
 .../0007-dropbear-fix-for-x32-abi.patch            | 140 +++++++++++++++++++++
 meta/recipes-core/dropbear/dropbear.inc            |   1 +
 .../initscripts/initscripts-1.0/functions          |   1 +
 .../systemd/systemd-compat-units/machineid.service |   2 +-
 .../systemd-compat-units/run-postinsts.service     |   2 +-
 meta/recipes-devtools/dpkg/dpkg.inc                |   4 +
 meta/recipes-devtools/gdb/gdb-cross-canadian.inc   |   2 +-
 meta/recipes-devtools/guile/guile_2.0.7.bb         |   4 +-
 .../python/python-smartpm_1.4.1.bb                 |   2 +-
 .../findutils-4.4.2/findutils_fix_doc.patch        |  84 +++++++++++++
 meta/recipes-extended/findutils/findutils_4.4.2.bb |   1 +
 15 files changed, 245 insertions(+), 12 deletions(-)
 create mode 100644 meta/recipes-core/dropbear/dropbear-2012.55/0007-dropbear-fix-for-x32-abi.patch
 create mode 100644 meta/recipes-extended/findutils/findutils-4.4.2/findutils_fix_doc.patch

-- 
1.8.1.2


