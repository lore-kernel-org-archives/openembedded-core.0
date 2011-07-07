Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qey6f-0002Ta-LD
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 01:35:41 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 07 Jul 2011 16:31:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,496,1304319600"; d="scan'208";a="22846262"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.236])
	by orsmga002.jf.intel.com with ESMTP; 07 Jul 2011 16:31:41 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jul 2011 16:31:32 -0700
Message-Id: <cover.1310081443.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH 0/8] Bug Fixes for M2 Rc2
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
X-List-Received-Date: Thu, 07 Jul 2011 23:35:41 -0000

Richard,

This address the bash, xcb missing from libx11, locale issue and
the lack of space due to zypper eating space.

Sau!


The following changes since commit f1fc6d084b079dea21ff1a30b815496452042490:

  pulseaudio: add 0.9.23 (2011-07-07 13:44:36 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/fix

Saul Wold (8):
  rootfs_rpm: Add 50Meg to image size for zypper
  image.bbclass: add LINGUAS_INSTALL to depends list
  gnome-doc-utils: Add RDEPENDS on bash
  quilt: Add RDEPENDS on bash
  console-tools: Add RDEPENDS on bash
  usbutils: Add RDEPENDS on bash
  eglibc: Add RDEPENDS on bash
  libx11: enable xcb support

 meta/classes/image.bbclass                         |    2 +-
 meta/classes/image_types.bbclass                   |    2 +-
 meta/classes/rootfs_rpm.bbclass                    |    5 +++++
 meta/recipes-bsp/usbutils/usbutils_0.91.bb         |    5 +++--
 .../console-tools/console-tools_0.3.2.bb           |    3 ++-
 meta/recipes-core/eglibc/eglibc-package.inc        |    2 +-
 meta/recipes-core/eglibc/eglibc.inc                |    2 +-
 meta/recipes-core/eglibc/eglibc_2.12.bb            |    2 +-
 meta/recipes-core/eglibc/eglibc_2.13.bb            |    2 +-
 meta/recipes-devtools/quilt/quilt.inc              |    2 ++
 meta/recipes-devtools/quilt/quilt_0.48.bb          |    2 +-
 meta/recipes-gnome/gnome/gnome-doc-utils.inc       |    2 ++
 meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb |    2 +-
 meta/recipes-graphics/xorg-lib/libx11_1.3.4.bb     |   11 ++++++++---
 14 files changed, 30 insertions(+), 14 deletions(-)

-- 
1.7.3.4



