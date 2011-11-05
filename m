Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RMk3M-00065C-E0
	for openembedded-core@lists.openembedded.org;
	Sat, 05 Nov 2011 18:29:12 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 05 Nov 2011 10:22:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,461,1315206000"; d="scan'208";a="33625101"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.12])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Nov 2011 10:22:59 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Nov 2011 10:22:30 -0700
Message-Id: <cover.1320513631.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [CONSOLIDATED PULL 00/28]
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
X-List-Received-Date: Sat, 05 Nov 2011 17:29:12 -0000

Richard,

Collection of changes over the past week or so, they have been
built and booted.

Thanks
	Sau!


The following changes since commit e3c003282afb93ec52882496400b042620ab00ef:

  rt-tests: update to 0.83 (2011-11-04 15:43:19 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Bruce Ashfield (1):
  linux-yocto_3.0: update base to v3.0.8 + meta config changes

Dmitry Cherukhin (1):
  tslib: fix the bug with loading libts-1.0.so

Elizabeth Flanagan (1):
  buildstats: Fix for buildstats on tmpfs

Koen Kooi (4):
  image_types bbclass: use 4k bytes per inode so we don't run out of
    space immediately
  connman 0.75: bump PR for iptables library change
  iproute2: update to 3.0.0 to fix build with updated iptables
  lighttpd 1.4.29: rename index.html to avoid clashes with DL_DIR

Kumar Gala (1):
  udev-164: Update init script to do an explicit add action

Martin Jansa (6):
  libcense.bbclass: fix OpenSSL mapping
  python: improve packaging
  libnl-2.0: move fix-pktloc_syntax_h-race.patch to libnl-2.0
    subdirectory and merge with fix-makefile.patch
  libnl-2.0: add patch from meta-openembedded to fix pkg-config file
  libnl-2.0: split to more packages, as meta-openembedded does
  libnl-2.0: add PE/PR bump for upgradable patch for meta-openembedded
    users

Matthew McClintock (2):
  dtc: update to latest git version
  Add new IMAGE_CLASSES variable for classes for image generation

Paul Eggleton (3):
  allarch.bbclass: disable shlib and debug symbol processing
  core-image-minimal-initramfs: force IMAGE_FSTYPES
  qemugl: switch to new git repo

Richard Purdie (3):
  bash: Ensure we fully reautoconf the recipes so site data is used
  patch: Convert to use oe_terminal
  bitbake.conf: Drop remaining TERMCMD pieces and document OE_TERMINAL
    usage instead

Saul Wold (4):
  cogl: COPYING file Updated FSF Address
  dtc: Add patch to correctly install shared libraries and links
  qmmp: Fix qmmp packaging, ensure lowercase package names
  fotowall: disable videocapture since we do not have a webcam

Scott Garman (1):
  distro_tracking_fields: updates for sudo, mtools, grep, and openssh

Xiaofeng Yan (1):
  qmmp: update to 0.5.2

 meta/classes/allarch.bbclass                       |    5 ++
 meta/classes/buildstats.bbclass                    |   37 +++++++++----
 meta/classes/image.bbclass                         |    3 +-
 meta/classes/image_types.bbclass                   |   14 +++---
 meta/classes/license.bbclass                       |    2 +-
 meta/classes/patch.bbclass                         |    4 +-
 meta/classes/sanity.bbclass                        |   13 -----
 meta/conf/bitbake.conf                             |   20 -------
 .../conf/distro/include/distro_tracking_fields.inc |   41 ++++++++------
 meta/conf/local.conf.sample                        |   18 ++++---
 meta/lib/oe/patch.py                               |   17 ++----
 meta/recipes-connectivity/connman/connman_0.75.bb  |    2 +-
 .../configure-cross.patch                          |   57 +++++++++++++-------
 meta/recipes-connectivity/iproute2/iproute2.inc    |    7 ++-
 .../iproute2/iproute2_2.6.38.bb                    |    9 ---
 .../iproute2/iproute2_3.0.0.bb                     |    8 +++
 .../recipes-connectivity/openssl/openssl_0.9.8r.bb |    2 +-
 .../images/core-image-minimal-initramfs.bb         |    1 +
 meta/recipes-core/udev/udev-164/init               |    4 +-
 meta/recipes-core/udev/udev_164.bb                 |    2 +-
 .../python/python-2.7-manifest.inc                 |   43 ++++++++-------
 meta/recipes-devtools/python/python_2.7.2.bb       |   22 +-------
 meta/recipes-extended/bash/bash.inc                |    9 ++-
 meta/recipes-extended/bash/bash_3.2.48.bb          |   11 +++--
 meta/recipes-extended/bash/bash_4.2.bb             |    2 +-
 .../files/{index.html => index.html.lighttpd}      |    0
 meta/recipes-extended/lighttpd/lighttpd_1.4.29.bb  |    6 +-
 meta/recipes-graphics/clutter/cogl_git.bb          |    2 +-
 meta/recipes-graphics/mesa/qemugl_git.bb           |    2 +-
 .../tslib/0001-Link-plugins-against-libts.patch    |   57 ++++++++++++++++++++
 meta/recipes-graphics/tslib/tslib_1.0.bb           |    3 +-
 meta/recipes-kernel/dtc/dtc.inc                    |   13 +++--
 .../dtc/fix_for_compilation_with_gcc_4.6.0.patch   |   51 -----------------
 meta/recipes-kernel/dtc/dtc/make_install.patch     |   15 +++++
 meta/recipes-kernel/dtc/dtc/remove_space_opt.patch |   18 ------
 meta/recipes-kernel/dtc/dtc_git.bb                 |   10 +---
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb    |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.0.bb       |   18 +++---
 meta/recipes-qt/qt-apps/fotowall_0.9.bb            |    4 +-
 .../qt-apps/{qmmp_0.5.1.bb => qmmp_0.5.2.bb}       |   52 +++++++++++-------
 .../libnl/libnl-2.0/fix-makefile.patch             |   32 -----------
 .../libnl/libnl-2.0/fix-pc-file.patch              |   17 ++++++
 .../{ => libnl-2.0}/fix-pktloc_syntax_h-race.patch |    5 ++-
 meta/recipes-support/libnl/libnl_2.0.bb            |   18 ++++--
 scripts/contrib/python/generate-manifest-2.7.py    |   47 ++++++++++------
 45 files changed, 375 insertions(+), 350 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2-2.6.38 => iproute2-3.0.0}/configure-cross.patch (50%)
 delete mode 100644 meta/recipes-connectivity/iproute2/iproute2_2.6.38.bb
 create mode 100644 meta/recipes-connectivity/iproute2/iproute2_3.0.0.bb
 rename meta/recipes-extended/lighttpd/files/{index.html => index.html.lighttpd} (100%)
 create mode 100644 meta/recipes-graphics/tslib/tslib/0001-Link-plugins-against-libts.patch
 delete mode 100644 meta/recipes-kernel/dtc/dtc/fix_for_compilation_with_gcc_4.6.0.patch
 create mode 100644 meta/recipes-kernel/dtc/dtc/make_install.patch
 delete mode 100644 meta/recipes-kernel/dtc/dtc/remove_space_opt.patch
 rename meta/recipes-qt/qt-apps/{qmmp_0.5.1.bb => qmmp_0.5.2.bb} (48%)
 delete mode 100644 meta/recipes-support/libnl/libnl-2.0/fix-makefile.patch
 create mode 100644 meta/recipes-support/libnl/libnl-2.0/fix-pc-file.patch
 rename meta/recipes-support/libnl/{ => libnl-2.0}/fix-pktloc_syntax_h-race.patch (86%)

-- 
1.7.6.4



