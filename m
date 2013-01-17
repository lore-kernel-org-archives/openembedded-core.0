Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Tvj1z-00058J-57
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Jan 2013 07:33:14 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 16 Jan 2013 22:17:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,484,1355126400"; d="scan'208";a="192090107"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.213])
	by AZSMGA002.ch.intel.com with ESMTP; 16 Jan 2013 22:17:30 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jan 2013 22:17:30 -0800
Message-Id: <cover.1358403327.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [CONSOLIDATED PULL 00/11] Wayland and other patches
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Jan 2013 06:33:53 -0000

Richard,

This contains the wayland code updated by Ross, it has been
built on the AB. Ross has tested it along with Alex.

Some addition updates and patches from others.

Thanks
	Sau!


The following changes since commit 169b9afcf2d357fdcf254a380d21d17701685834:

  oprofile: add AArch64 support (2013-01-16 16:10:00 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Alexandru DAMIAN (2):
  wayland: add Wayland protocol library
  mesa-dri: enable the wayland-egl platform

Christopher Larson (1):
  ptest.bbclass: don't add to PACKAGES if disabled

Cristian Iorga (1):
  iptables: upgrade to 1.4.17

Giuseppe CONDORELLI (1):
  eglibc: fix as and ld check in libc dir

Nitin A Kamble (1):
  linux-yocto_3.4: use ${KSRC_linux_yocto_3_4_repo} based SRC_URI

Paul Eggleton (3):
  classes/rootfs_*: error out if postinstalls exist with read-only
    rootfs
  dropbear: allow configuring blank password option at runtime
  classes/image: improve debug-tweaks ssh server configuration

Ross Burton (2):
  x11-common: set XDG_RUNTIME_DIR if it isn't already set
  weston: add reference Wayland compositor

 meta/classes/core-image.bbclass                    |   3 -
 meta/classes/image.bbclass                         |  16 +++-
 meta/classes/ptest.bbclass                         |   2 +-
 meta/classes/rootfs_deb.bbclass                    |   7 ++
 meta/classes/rootfs_ipk.bbclass                    |   2 +-
 meta/classes/rootfs_rpm.bbclass                    |   9 ++
 meta/recipes-core/dropbear/dropbear.inc            |   6 +-
 .../dropbear/dropbear/allow-nopw.patch             |  19 ----
 .../dropbear/dropbear/nopw-option.patch            | 106 +++++++++++++++++++++
 .../eglibc-2.16_fix_as_ld_ver_check.patch          |  23 +++++
 meta/recipes-core/eglibc/eglibc_2.16.bb            |   1 +
 .../fix-iptables-extensions-build-error.patch      |  44 +++++++++
 .../iptables/fix-link-failure-ip6t-NETMAP.patch    |  86 +++++++++++++++++
 .../{iptables_1.4.16.3.bb => iptables_1.4.17.bb}   |   9 +-
 meta/recipes-graphics/mesa/mesa-common.inc         |  10 +-
 meta/recipes-graphics/mesa/mesa-dri.inc            |   1 +
 meta/recipes-graphics/wayland/wayland_1.0.3.bb     |  37 +++++++
 .../recipes-graphics/wayland/weston/weston.desktop |   9 ++
 meta/recipes-graphics/wayland/weston/weston.png    | Bin 0 -> 2383 bytes
 meta/recipes-graphics/wayland/weston_1.0.3.bb      |  52 ++++++++++
 .../x11-common/etc/X11/Xsession.d/13xdgbasedirs.sh |  13 +++
 meta/recipes-kernel/linux/linux-yocto_3.4.bb       |   3 +-
 22 files changed, 422 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-core/dropbear/dropbear/allow-nopw.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/nopw-option.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/eglibc-2.16_fix_as_ld_ver_check.patch
 create mode 100644 meta/recipes-extended/iptables/iptables/fix-iptables-extensions-build-error.patch
 create mode 100644 meta/recipes-extended/iptables/iptables/fix-link-failure-ip6t-NETMAP.patch
 rename meta/recipes-extended/iptables/{iptables_1.4.16.3.bb => iptables_1.4.17.bb} (85%)
 create mode 100644 meta/recipes-graphics/wayland/wayland_1.0.3.bb
 create mode 100644 meta/recipes-graphics/wayland/weston/weston.desktop
 create mode 100644 meta/recipes-graphics/wayland/weston/weston.png
 create mode 100644 meta/recipes-graphics/wayland/weston_1.0.3.bb
 create mode 100644 meta/recipes-graphics/x11-common/x11-common/etc/X11/Xsession.d/13xdgbasedirs.sh

-- 
1.8.0.2



