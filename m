Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T8mLf-0006lS-RG
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 08:10:56 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 03 Sep 2012 22:58:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,365,1344236400"; d="scan'208";a="217443809"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.252])
	by fmsmga002.fm.intel.com with ESMTP; 03 Sep 2012 22:58:32 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Sep 2012 22:58:32 -0700
Message-Id: <cover.1346737995.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [CONSOLIDATED REQUEST 00/57] M4 RC1 Final Pull
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
X-List-Received-Date: Tue, 04 Sep 2012 06:10:56 -0000

Richard,

This is a grouping of changes for RC1 of Milestone 4 for 1.3,
The build is still in progress on the AB infrastucture but 
looking pretty green right now.

As we are coming into RC1, we I think these are good changes, but
moving forward I will be looking for more directed bug fixes and
less feature work.

Please review these changes and pull accordingly.

I think Paul's changes are good, but may need a little more soak
time, I pulled them since we are at M4 RC1 and need to either break
LSB now or better yet, the address the LSB issues

Please remember that Paul's changes have a meta-yocto pull also.


Thanks
	Sau!

The following changes since commit c6da6b648328377ba3590fd38cb12dad26a46a13:

  crosstap: new script (2012-09-02 05:47:43 -0700)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Constantin Musca (9):
  automake: upgrade to 1.12.3
  gypsy: upgrade to 0.9
  libdrm: upgrade to 2.4.39
  lsof: upgrade to 4.86
  man-pages: upgrade to 3.42
  telepathy-glib: upgrade to 0.19.8
  freetype: upgrade to 2.4.10
  puzzles: upgrade to r9594
  iproute2: upgrade to 3.5.1

Kang Kai (3):
  wget: disable iri/idn support
  msmtp: disable libidn support
  ghostscript: disable libidn support

Khem Raj (2):
  uclibc-0.9.33: Update to latest on 0.9.33 branch
  tclibc-uclibc, tclibc-eglibc: Prefer nativesdk-eglibc to provide
    libintl

Martin Jansa (6):
  sstate-cache-management.sh: fix regexp in checksum grep
  sstate-cache-management.sh: fix regexp in AVAILTUNES grep
  sstate-cache-management.sh: look in meta* above oe-core dir when
    looking for available tunes
  sstate-cache-management.sh: don't hardcode available machines only to
    qemu*
  sstate-cache-management.sh: add option to enable debug output
  sstate-cache-management.sh: fix remove_duplicated when multiple archs
    were built

Paul Eggleton (35):
  classes/core-image: remove SSHSERVER_IMAGE_FEATURES
  classes/core-image: remove *_IMAGE_FEATURES variables
  classes/core-image: remove erroneous nfs-server comment
  Rename task to packagegroup
  packagegroup-base: remove some useless items
  classes/packagegroup: Use package group nomenclature
  packagegroup-core-nfs: remove broken glibc-utils reference
  classes/packagegroup: add ability to disable complementary packages
  packagegroup-*: change to inherit from packagegroup.bbclass
  packagegroup-core-x11: move out Sato applications
  core-image-core: rename to core-image-x11
  packagegroup-core-x11*: adjust X11 package groups
  packagegroup-qt4e: tidy up and rename
  packagegroup-core-gtk-directfb: remove superfluous -base package
  packagegroup-base: remove openswan from packagegroup-base-ipsec
  packagegroup-core-gtk-directfb: remove dropbear
  classes/packagegroup: disable superfluous tasks
  packagegroup-*: drop LIC_FILES_CHKSUM
  packagegroup-core-clutter: remove empty -apps/-tests tasks
  packagegroup-core-qt: rename -demos to -demoapps
  packagegroup-core-console: remove
  connman: add runtime dependency on dbus
  ofono: add runtime dependency on dbus
  packagegroup-*: set reasonable SUMMARY/DESCRIPTION
  packagegroup-core-basic: tidy up
  packagegroup-core-lsb: rework
  core-image-basic: tidy up
  packagegroup-*: add RPROVIDES for backwards compatibility
  qemu-config: relicense as MIT
  oprofileui: split server to separate recipe to avoid X11 dependency
  qemu-config: split out anjuta-remote-run
  oprofileui-server: move initscript from qemu-config
  qemu-config: split out shutdown icon to its own recipe
  qemu-config: split out export of root via NFS to its own recipe
  qemu-config: turn into distcc-config and a package group

Ross Burton (1):
  xserver-xorg: remove HAL option, nothing uses HAL anymore

Saul Wold (1):
  build-appliance: add zip-native, which is needed to build the final
    zip bundle

 meta/classes/archiver.bbclass                      |    4 +-
 meta/classes/core-image.bbclass                    |   53 ++--
 meta/classes/image.bbclass                         |    4 +
 meta/classes/insane.bbclass                        |    2 +-
 meta/classes/package.bbclass                       |    2 +-
 meta/classes/packagegroup.bbclass                  |   44 +++
 meta/classes/populate_sdk_base.bbclass             |    4 +-
 meta/classes/task.bbclass                          |   32 +--
 meta/conf/bitbake.conf                             |    4 +-
 meta/conf/distro/include/tclibc-eglibc.inc         |    1 +
 meta/conf/distro/include/tclibc-uclibc.inc         |    2 +
 meta/recipes-bsp/qemu-config/qemu-config.bb        |   45 ---
 .../qemu-config/qemu-config/COPYING.GPL            |  339 ------------------
 meta/recipes-connectivity/connman/connman.inc      |    3 +-
 .../fix-unused-but-set-variable-warning.patch      |   18 -
 .../gypsy/{gypsy_0.8.bb => gypsy_0.9.bb}           |   10 +-
 .../configure-cross.patch                          |    0
 .../{iproute2_3.5.0.bb => iproute2_3.5.1.bb}       |    4 +-
 meta/recipes-connectivity/ofono/ofono.inc          |    2 +
 meta/recipes-connectivity/ofono/ofono_git.bb       |    2 +-
 ...thy-glib_0.19.6.bb => telepathy-glib_0.19.8.bb} |    4 +-
 meta/recipes-core/images/build-appliance-image.bb  |    7 +-
 meta/recipes-core/images/core-image-base.bb        |    2 +-
 meta/recipes-core/images/core-image-core.bb        |    8 -
 meta/recipes-core/images/core-image-minimal.bb     |    2 +-
 meta/recipes-core/meta/meta-toolchain-gmae.bb      |    2 +-
 .../nativesdk-packagegroup-sdk-host.bb}            |   10 +-
 .../packagegroups/packagegroup-base.bb             |  356 +++++++++++++++++++
 .../packagegroup-core-boot.bb}                     |   24 +-
 .../packagegroups/packagegroup-core-nfs.bb         |   20 ++
 .../packagegroup-core-sdk.bb}                      |   24 +-
 .../packagegroup-core-ssh-dropbear.bb              |   10 +
 .../packagegroups/packagegroup-core-ssh-openssh.bb |   10 +
 .../packagegroup-core-standalone-sdk-target.bb}    |    9 +-
 .../packagegroup-core-tools-debug.bb}              |   13 +-
 .../packagegroup-core-tools-profile.bb}            |   13 +-
 .../packagegroup-core-tools-testapps.bb}           |   13 +-
 .../packagegroup-cross-canadian.bb}                |   14 +-
 .../packagegroup-self-hosted.bb}                   |   43 ++--
 meta/recipes-core/tasks/task-base.bb               |  359 --------------------
 meta/recipes-core/tasks/task-core-console.bb       |   28 --
 meta/recipes-core/tasks/task-core-nfs.bb           |   28 --
 meta/recipes-core/tasks/task-core-ssh-dropbear.bb  |   17 -
 meta/recipes-core/tasks/task-core-ssh-openssh.bb   |   17 -
 meta/recipes-core/uclibc/uclibc-0.9.33.inc         |    5 +-
 .../uclibc/uclibc-0.9.33/mount.h-update.patch      |   83 +++++
 .../uclibc/uclibc-0.9.33/posix_fallocate.patch     |   37 +-
 .../{automake_1.12.1.bb => automake_1.12.3.bb}     |    6 +-
 .../devel-config/anjuta-remote-run.bb}             |   24 +-
 .../anjuta-remote-run}/anjuta-remote-run           |    0
 .../recipes-devtools/devel-config/distcc-config.bb |   25 ++
 .../devel-config/distcc-config}/distcc.sh          |    2 +-
 .../devel-config/nfs-export-root.bb                |   17 +
 .../devel-config/nfs-export-root}/exports          |    0
 .../packagegroup-core-device-devel.bb              |   15 +
 .../ghostscript/ghostscript_9.05.bb                |    4 +-
 meta/recipes-extended/images/core-image-basic.bb   |   12 +-
 meta/recipes-extended/images/core-image-lsb-dev.bb |    6 +-
 meta/recipes-extended/images/core-image-lsb-sdk.bb |    6 +-
 meta/recipes-extended/images/core-image-lsb.bb     |    6 +-
 .../libzypp/libzypp/config-release.patch           |    4 +-
 .../lsof/{lsof_4.85.bb => lsof_4.86.bb}            |    8 +-
 .../{man-pages_3.41.bb => man-pages_3.42.bb}       |    6 +-
 meta/recipes-extended/msmtp/msmtp_1.4.24.bb        |    4 +-
 .../packagegroup-core-basic.bb}                    |   88 ++---
 .../packagegroup-core-lsb.bb}                      |  172 ++++++----
 meta/recipes-extended/wget/wget.inc                |    5 +-
 .../packagegroups/packagegroup-core-sdk-gmae.bb    |   22 ++
 ...packagegroup-core-standalone-gmae-sdk-target.bb |   22 ++
 .../packagegroup-sdk-gmae.inc}                     |    0
 .../tasks/task-core-standalone-gmae-sdk-target.bb  |   21 --
 .../drm/{libdrm_2.4.37.bb => libdrm_2.4.39.bb}     |    4 +-
 .../no-hardcode.patch                              |    0
 .../{freetype_2.4.9.bb => freetype_2.4.10.bb}      |    6 +-
 meta/recipes-graphics/images/core-image-clutter.bb |    7 +-
 .../images/core-image-gtk-directfb.bb              |   10 +-
 meta/recipes-graphics/images/core-image-x11.bb     |    7 +
 .../packagegroups/packagegroup-core-clutter.bb     |   24 ++
 .../packagegroup-core-gtk-directfb.bb}             |   15 +-
 .../packagegroups/packagegroup-core-x11-base.bb    |   20 ++
 .../packagegroups/packagegroup-core-x11.bb}        |   40 +--
 meta/recipes-graphics/tasks/task-core-clutter.bb   |   37 --
 .../xorg-xserver/xserver-xorg-common.inc           |    1 -
 .../oprofile/oprofileui-server/init}               |    8 +-
 .../oprofile/oprofileui-server_git.bb              |   24 ++
 meta/recipes-kernel/oprofile/oprofileui.inc        |   11 +-
 meta/recipes-kernel/oprofile/oprofileui_git.bb     |   10 +-
 meta/recipes-qt/images/qt4e-demo-image.bb          |   10 +-
 meta/recipes-qt/meta/meta-toolchain-qte.bb         |    4 +-
 .../nativesdk-packagegroup-qte-toolchain-host.bb}  |    3 +-
 .../packagegroups/packagegroup-core-qt.bb          |   19 +
 .../packagegroup-core-qt4e.bb}                     |   16 +-
 .../packagegroup-qte-toolchain-target.bb}          |    8 +-
 meta/recipes-qt/tasks/task-core-qt.bb              |   22 --
 meta/recipes-sato/images/core-image-sato-dev.bb    |    8 +-
 meta/recipes-sato/images/core-image-sato-sdk.bb    |   12 +-
 meta/recipes-sato/images/core-image-sato.bb        |    4 +-
 .../packagegroups/packagegroup-core-x11-sato.bb    |   67 ++++
 .../puzzles/{puzzles_r9561.bb => puzzles_r9594.bb} |    0
 .../shutdown-desktop/shutdown-desktop.bb           |   20 ++
 .../shutdown-desktop}/shutdown.desktop             |    0
 meta/recipes-sato/tasks/task-core-x11-sato.bb      |   42 ---
 meta/recipes-sato/tasks/task-core-x11.bb           |   68 ----
 scripts/contrib/documentation-audit.sh             |    2 +-
 scripts/sstate-cache-management.sh                 |   73 +++--
 105 files changed, 1258 insertions(+), 1552 deletions(-)
 create mode 100644 meta/classes/packagegroup.bbclass
 delete mode 100644 meta/recipes-bsp/qemu-config/qemu-config.bb
 delete mode 100644 meta/recipes-bsp/qemu-config/qemu-config/COPYING.GPL
 delete mode 100644 meta/recipes-connectivity/gypsy/files/fix-unused-but-set-variable-warning.patch
 rename meta/recipes-connectivity/gypsy/{gypsy_0.8.bb => gypsy_0.9.bb} (79%)
 rename meta/recipes-connectivity/iproute2/{iproute2-3.5.0 => iproute2-3.5.1}/configure-cross.patch (100%)
 rename meta/recipes-connectivity/iproute2/{iproute2_3.5.0.bb => iproute2_3.5.1.bb} (51%)
 rename meta/recipes-connectivity/telepathy/{telepathy-glib_0.19.6.bb => telepathy-glib_0.19.8.bb} (80%)
 delete mode 100644 meta/recipes-core/images/core-image-core.bb
 rename meta/recipes-core/{tasks/nativesdk-task-sdk-host.bb => packagegroups/nativesdk-packagegroup-sdk-host.bb} (60%)
 create mode 100644 meta/recipes-core/packagegroups/packagegroup-base.bb
 rename meta/recipes-core/{tasks/task-core-boot.bb => packagegroups/packagegroup-core-boot.bb} (72%)
 create mode 100644 meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
 rename meta/recipes-core/{tasks/task-core-sdk.bb => packagegroups/packagegroup-core-sdk.bb} (78%)
 create mode 100644 meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
 create mode 100644 meta/recipes-core/packagegroups/packagegroup-core-ssh-openssh.bb
 rename meta/recipes-core/{tasks/task-core-standalone-sdk-target.bb => packagegroups/packagegroup-core-standalone-sdk-target.bb} (47%)
 rename meta/recipes-core/{tasks/task-core-tools-debug.bb => packagegroups/packagegroup-core-tools-debug.bb} (48%)
 rename meta/recipes-core/{tasks/task-core-tools-profile.bb => packagegroups/packagegroup-core-tools-profile.bb} (81%)
 rename meta/recipes-core/{tasks/task-core-tools-testapps.bb => packagegroups/packagegroup-core-tools-testapps.bb} (66%)
 rename meta/recipes-core/{tasks/task-cross-canadian.bb => packagegroups/packagegroup-cross-canadian.bb} (42%)
 rename meta/recipes-core/{tasks/task-self-hosted.bb => packagegroups/packagegroup-self-hosted.bb} (77%)
 delete mode 100644 meta/recipes-core/tasks/task-base.bb
 delete mode 100644 meta/recipes-core/tasks/task-core-console.bb
 delete mode 100644 meta/recipes-core/tasks/task-core-nfs.bb
 delete mode 100644 meta/recipes-core/tasks/task-core-ssh-dropbear.bb
 delete mode 100644 meta/recipes-core/tasks/task-core-ssh-openssh.bb
 create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/mount.h-update.patch
 rename meta/recipes-devtools/automake/{automake_1.12.1.bb => automake_1.12.3.bb} (92%)
 rename meta/{recipes-gnome/tasks/task-core-sdk-gmae.bb => recipes-devtools/devel-config/anjuta-remote-run.bb} (44%)
 rename meta/{recipes-bsp/qemu-config/qemu-config => recipes-devtools/devel-config/anjuta-remote-run}/anjuta-remote-run (100%)
 create mode 100644 meta/recipes-devtools/devel-config/distcc-config.bb
 rename meta/{recipes-bsp/qemu-config/qemu-config => recipes-devtools/devel-config/distcc-config}/distcc.sh (57%)
 create mode 100644 meta/recipes-devtools/devel-config/nfs-export-root.bb
 rename meta/{recipes-bsp/qemu-config/qemu-config => recipes-devtools/devel-config/nfs-export-root}/exports (100%)
 create mode 100644 meta/recipes-devtools/packagegroups/packagegroup-core-device-devel.bb
 rename meta/recipes-extended/lsof/{lsof_4.85.bb => lsof_4.86.bb} (88%)
 rename meta/recipes-extended/man-pages/{man-pages_3.41.bb => man-pages_3.42.bb} (81%)
 rename meta/recipes-extended/{tasks/task-core-basic.bb => packagegroups/packagegroup-core-basic.bb} (40%)
 rename meta/recipes-extended/{tasks/task-core-lsb.bb => packagegroups/packagegroup-core-lsb.bb} (42%)
 create mode 100644 meta/recipes-gnome/packagegroups/packagegroup-core-sdk-gmae.bb
 create mode 100644 meta/recipes-gnome/packagegroups/packagegroup-core-standalone-gmae-sdk-target.bb
 rename meta/recipes-gnome/{tasks/task-sdk-gmae.inc => packagegroups/packagegroup-sdk-gmae.inc} (100%)
 delete mode 100644 meta/recipes-gnome/tasks/task-core-standalone-gmae-sdk-target.bb
 rename meta/recipes-graphics/drm/{libdrm_2.4.37.bb => libdrm_2.4.39.bb} (50%)
 rename meta/recipes-graphics/freetype/{freetype-2.4.9 => freetype-2.4.10}/no-hardcode.patch (100%)
 rename meta/recipes-graphics/freetype/{freetype_2.4.9.bb => freetype_2.4.10.bb} (90%)
 create mode 100644 meta/recipes-graphics/images/core-image-x11.bb
 create mode 100644 meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb
 rename meta/recipes-graphics/{tasks/task-core-gtk-directfb.bb => packagegroups/packagegroup-core-gtk-directfb.bb} (44%)
 create mode 100644 meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
 rename meta/{recipes-sato/tasks/task-core-x11-mini.bb => recipes-graphics/packagegroups/packagegroup-core-x11.bb} (47%)
 delete mode 100644 meta/recipes-graphics/tasks/task-core-clutter.bb
 rename meta/{recipes-bsp/qemu-config/qemu-config/qemu-autostart => recipes-kernel/oprofile/oprofileui-server/init} (74%)
 create mode 100644 meta/recipes-kernel/oprofile/oprofileui-server_git.bb
 rename meta/recipes-qt/{tasks/nativesdk-task-qte-toolchain-host.bb => packagegroups/nativesdk-packagegroup-qte-toolchain-host.bb} (60%)
 create mode 100644 meta/recipes-qt/packagegroups/packagegroup-core-qt.bb
 rename meta/recipes-qt/{tasks/task-qt4e.bb => packagegroups/packagegroup-core-qt4e.bb} (78%)
 rename meta/recipes-qt/{tasks/task-qte-toolchain-target.bb => packagegroups/packagegroup-qte-toolchain-target.bb} (78%)
 delete mode 100644 meta/recipes-qt/tasks/task-core-qt.bb
 create mode 100644 meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
 rename meta/recipes-sato/puzzles/{puzzles_r9561.bb => puzzles_r9594.bb} (100%)
 create mode 100644 meta/recipes-sato/shutdown-desktop/shutdown-desktop.bb
 rename meta/{recipes-bsp/qemu-config/qemu-config => recipes-sato/shutdown-desktop/shutdown-desktop}/shutdown.desktop (100%)
 delete mode 100644 meta/recipes-sato/tasks/task-core-x11-sato.bb
 delete mode 100644 meta/recipes-sato/tasks/task-core-x11.bb

-- 
1.7.7.6



