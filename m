Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1ROmhL-0000N8-HI
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Nov 2011 09:42:55 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 11 Nov 2011 00:36:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,494,1315206000"; d="scan'208";a="89010326"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.157])
	by fmsmga002.fm.intel.com with ESMTP; 11 Nov 2011 00:36:36 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Nov 2011 00:36:26 -0800
Message-Id: <cover.1321000451.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [CONSOLIDATED PULL 0/9] RPM Fixes and others
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
X-List-Received-Date: Fri, 11 Nov 2011 08:42:55 -0000

Richard,

This request includes Mark's changes along with some changes for qt-mobility
and Otavio clean-ups.

Thanks
	Sau!


The following changes since commit 379c77d1516fe8fdbd1cd7063f709b5266872b03:

  populate_*.bbclass: Correct INSTALL variable name after recent multilib changes (2011-11-10 18:05:06 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Dmitry Cherukhin (1):
  qt-mobility: qa_configure stage failed

Mark Hatle (5):
  rootfs_rpm.bbclass: Enable pre and post install scripts
  rootfs_rpm.bbclass: Turn off script debugging
  wpa-supplicant: Avoid blocking the post install script at cross
    rootfs time.
  shadow: Generate the shadow files at rootfs construction
  sudo: Avoid post install scripts

Otavio Salvador (3):
  dhcp: generate initial leases files for server
  util-linux: split mcookie into a package
  xinit: rdepends on util-linux-mcookie to avoid brining whole
    util-linux

 meta/classes/package_rpm.bbclass                   |   33 ++++-
 meta/classes/rootfs_rpm.bbclass                    |   27 +---
 meta/recipes-connectivity/dhcp/dhcp.inc            |    9 +-
 meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb       |    2 +-
 .../wpa-supplicant/wpa-supplicant-0.7.inc          |    4 +-
 .../wpa-supplicant/wpa-supplicant_0.7.3.bb         |    2 +-
 meta/recipes-core/util-linux/util-linux.inc        |    3 +-
 meta/recipes-core/util-linux/util-linux_2.19.1.bb  |    2 +-
 .../rpm/rpm/rpm-scriptletexechelper.patch          |  159 ++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    3 +-
 meta/recipes-extended/shadow/shadow_4.1.4.3.bb     |   12 +-
 meta/recipes-extended/sudo/sudo.inc                |    8 -
 meta/recipes-extended/sudo/sudo_1.8.3.bb           |    5 +-
 meta/recipes-graphics/xorg-app/xinit_1.3.0.bb      |    4 +-
 .../qt4/files/qt-mobility-configure.patch          |   17 ++
 meta/recipes-qt/qt4/qt-mobility_1.2.0.inc          |    3 +-
 16 files changed, 247 insertions(+), 46 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-scriptletexechelper.patch
 create mode 100644 meta/recipes-qt/qt4/files/qt-mobility-configure.patch

-- 
1.7.6.4



