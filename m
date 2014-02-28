Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A4FC36F3A7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 09:35:04 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 28 Feb 2014 01:30:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,560,1389772800"; d="scan'208";a="463992433"
Received: from unknown (HELO localhost.localdomain) ([10.255.12.193])
	by orsmga001.jf.intel.com with ESMTP; 28 Feb 2014 01:35:04 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Feb 2014 11:35:00 +0200
Message-Id: <cover.1393579948.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [CONSOLIDATED PULL 00/30] Kernel Update, updates & misc fixes
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
X-List-Received-Date: Fri, 28 Feb 2014 09:35:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Richard,

Here is a set of patches that are currently on the Autobuilder, I have 
reviewed them.

THe qt-mobility is a back-ported mega-patch, otherwise I most of the 
other patches look OK to me.

Sau!

The following changes since commit 010d5b437413156c3f4dc90a14698231bb195c2e:

  security-flags: Avoid lttng-tools issue on arm (2014-02-26 13:48:17 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Alexandru Palalau (1):
  libnotify: don't use gnome.bbclass

Alexandru-Cezar Sardan (1):
  gcc: Enable SPE & AltiVec generation on powepc*linux target.

Bruce Ashfield (4):
  kernel-yocto: always checkout machine branch when existing
    validate_branches
  linux-yocto/3.10: update to v3.10.32
  linux-yocto/3.4: update to v3.4.82 and latest LTSI
  linux-yocto/3.10: integrate latest LTSI changes

Corneliu Stoicescu (1):
  oe-selftest: Fix for test_rm_old_image

Cristian Iorga (3):
  bluez5: upgrade to 5.15
  telepathy-glib: upgrade to 0.23.2
  telepathy-mission-control: upgrade to 5.16.1

David Nyström (2):
  do_rootfs: Added PACKAGE_FEED_URIS functionality
  do_rootfs: Add PACKAGE_FEED_URIS as a vardep

Hongxu Jia (1):
  qt-mobility: fix metaobjectbuilder build errors

Jackie Huang (1):
  mailx: fix the path to sendmail interface

Khem Raj (1):
  python3: Fix race condition at high parallelism factor

Laurentiu Palcu (1):
  adt_installer: fix issue with x86_64

Otavio Salvador (1):
  uboot-config.bbclass: Skip the package if no valid configuration is
    found

Richard Purdie (4):
  base: Remove pointless createCopy/update_data calls
  libnotify: Fix separate build dir support
  webkit-gtk: Fix separate builddir support
  dpkg: Fix dpkg-native dependency on target xz

Robert Yang (1):
  weston: fix build without wayland in distro_features

Roy Li (1):
  dbus: proper error handler should be given after
    send_negotiate_unix_fd failed

Saul Wold (6):
  initrdscripts: Add rootimage option
  base-files: sed installed file instead of original
  base-passwd: sed installed file instead of original
  systemd: sed installed file instead of original
  core-image-minimal-initramfs: Use PACKAGE_INSTALL instead of
    IMAGE_INSTALL
  man-pages: Update to 3.60

Stefan Stanacar (1):
  oeqa/targetcontrol: make BaseTarget an abstract class

 meta/classes/base.bbclass                          |   17 +-
 meta/classes/kernel-yocto.bbclass                  |   37 +-
 meta/classes/rootfs_deb.bbclass                    |    1 +
 meta/classes/rootfs_ipk.bbclass                    |    1 +
 meta/classes/rootfs_rpm.bbclass                    |    1 +
 meta/classes/uboot-config.bbclass                  |    4 +-
 meta/lib/oe/package_manager.py                     |   89 +-
 meta/lib/oe/rootfs.py                              |   16 +-
 meta/lib/oeqa/selftest/buildoptions.py             |   12 +-
 meta/lib/oeqa/targetcontrol.py                     |   16 +
 meta/recipes-connectivity/bluez5/bluez5_5.14.bb    |    5 -
 meta/recipes-connectivity/bluez5/bluez5_5.15.bb    |    4 +
 ...thy-glib_0.23.0.bb => telepathy-glib_0.23.2.bb} |    7 +-
 ...16.0.bb => telepathy-mission-control_5.16.1.bb} |   10 +-
 meta/recipes-core/base-files/base-files_3.0.14.bb  |    2 +-
 .../recipes-core/base-passwd/base-passwd_3.5.29.bb |    2 +-
 meta/recipes-core/dbus/dbus-ptest_1.6.18.bb        |    1 +
 meta/recipes-core/dbus/dbus.inc                    |    1 +
 ...guid_from_server-if-send_negotiate_unix_f.patch |  104 +
 .../images/core-image-minimal-initramfs.bb         |    2 +-
 meta/recipes-core/initrdscripts/files/init-live.sh |    4 +-
 meta/recipes-core/systemd/systemd_208.bb           |    5 +
 meta/recipes-devtools/dpkg/dpkg.inc                |    2 +-
 meta/recipes-devtools/gcc/gcc-4.8.inc              |    1 +
 ...AltiVec-generation-on-powepc-linux-target.patch |   42 +
 meta/recipes-devtools/gcc/libgcc.inc               |   24 +-
 .../adt-installer/scripts/adt_installer_internal   |   61 +-
 .../python/python3-native_3.3.3.bb                 |    1 +
 .../python/python3/fix-ast.h-dependency.patch      |   26 +
 meta/recipes-devtools/python/python3_3.3.3.bb      |    1 +
 meta/recipes-extended/mailx/mailx_12.5.bb          |    1 +
 .../{man-pages_3.57.bb => man-pages_3.60.bb}       |    4 +-
 meta/recipes-gnome/libnotify/libnotify_0.6.0.bb    |    6 +-
 meta/recipes-graphics/wayland/weston_1.4.0.bb      |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |    8 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb    |    8 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |    6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb  |    6 +-
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      |   18 +-
 meta/recipes-kernel/linux/linux-yocto_3.4.bb       |   16 +-
 .../fix_metaobjectbuilder_build_err.patch          | 4707 ++++++++++++++++++++
 meta/recipes-qt/qt4/qt-mobility_1.2.0.inc          |    1 +
 meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb       |    2 +-
 43 files changed, 5148 insertions(+), 136 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.14.bb
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.15.bb
 rename meta/recipes-connectivity/telepathy/{telepathy-glib_0.23.0.bb => telepathy-glib_0.23.2.bb} (76%)
 rename meta/recipes-connectivity/telepathy/{telepathy-mission-control_5.16.0.bb => telepathy-mission-control_5.16.1.bb} (89%)
 create mode 100644 meta/recipes-core/dbus/dbus/clear-guid_from_server-if-send_negotiate_unix_f.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0049-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
 create mode 100644 meta/recipes-devtools/python/python3/fix-ast.h-dependency.patch
 rename meta/recipes-extended/man-pages/{man-pages_3.57.bb => man-pages_3.60.bb} (82%)
 create mode 100644 meta/recipes-qt/qt4/qt-mobility-1.2.0/fix_metaobjectbuilder_build_err.patch

-- 
1.8.3.1


