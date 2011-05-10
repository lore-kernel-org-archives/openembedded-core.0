Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJfVD-0001SF-Mm
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 07:29:00 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 09 May 2011 22:26:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,345,1301900400"; d="scan'208";a="640479283"
Received: from unknown (HELO localhost) ([10.255.12.75])
	by orsmga002.jf.intel.com with ESMTP; 09 May 2011 22:26:13 -0700
Message-Id: <cover.1305004776.git.sgw@linux.intel.com>
Old-Date: Mon, 9 May 2011 22:19:36 -0700
MIME-Version: 1.0
Date: Mon, 09 May 2011 22:26:13 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 00/30] Consolidated Pull Request for 5/10/2011
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
X-List-Received-Date: Tue, 10 May 2011 05:29:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Saul Wold <sgw@linux.intel.com>

Richard,

There is a matching request to poky - master for the kernel
recipe, please ensure you pull that one also.

This contains support for the microblaze from Adrian and some 
uclibc from Khem, along with some changes from Otavio. I passed
through the insane LICENSE == CLOSED check, but need to think more
about this (ie we should never see this kind of license in oe-core).


Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: sgw/stage
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Thanks,
    Saul Wold <sgw@linux.intel.com>
---


Adrian Alonso (7):
  insane: add micrblaze target info
  kernel-arch: add microblaze to valid archs
  siteinfo: add microblaze target info
  linux-libc-headers: add microblaze ARCH definition
  image-mklibs: add microblaze arch support
  package_rpm: use target vendor information
  readline: update version

Bruce Ashfield (2):
  linux-yocto: remove non-core (qemu) machine compatibility
  linux-yocto: error if meta data not present

Ilya Yanok (1):
  toolchain-qte: include cross-compiler and fix env script

Khem Raj (6):
  recipes: Replace gconf-dbus with gconf
  conf/layer.conf: Use .= to append to BBPATH and =+ for BBFILES
  libgalago_0.5.2.bb: Fix compile for uclibc
  liburcu_0.5.4.bb: Let it build on uclibc targets
  lttng-ust_0.12.bb: Fix compilation on uclibc
  oe/patch.py: Remove series file during Clean()

Otavio Salvador (9):
  scripts/oe-setup-builddir: fix typo
  syslinux: improve packaging
  meta/conf/local.conf.sample: fix mklibs comment line split and typo
  busybox: add support to mdev
  libxkbfile: disable xcb
  insane.bbclass: skip license checksum if LICENSE is "CLOSED"
  cmake.bbclass: fix qmake and rpath issues
  qmake_base.bbclass: add generate_qt_config_file task
  fuse: drop since it is not used by other recipes

Saul Wold (2):
  web-sato: Update for svn -> git transtion
  gtkhtml2: Update to 1161

Scott Garman (1):
  gnome-doc-utils: Add additional missing -nonet options to xsltproc

Xiaofeng Yan (1):
  libxmu: Add native function

Zhai Edwin (1):
  qemu-script: Fix qemu seg fault if install Nvidia proprietary driver.

 .../recipes-gnome/gnome/libgnomekbd_2.26.0.bb      |    2 +-
 .../fuse-2.7.2/not-run-updaterc.d-on-host.patch    |   15 ----
 meta-demoapps/recipes-kernel/fuse/fuse.inc         |   13 ----
 meta-demoapps/recipes-kernel/fuse/fuse_2.7.2.bb    |   22 ------
 meta/classes/cmake.bbclass                         |   19 +++++-
 meta/classes/image-mklibs.bbclass                  |    2 +-
 meta/classes/insane.bbclass                        |    8 ++-
 meta/classes/kernel-arch.bbclass                   |    3 +-
 meta/classes/kernel-yocto.bbclass                  |    5 +-
 meta/classes/package_rpm.bbclass                   |    3 +-
 meta/classes/qmake_base.bbclass                    |   15 ++++
 meta/classes/siteinfo.bbclass                      |    1 +
 meta/conf/layer.conf                               |   10 +++-
 meta/conf/local.conf.sample                        |    7 +-
 meta/lib/oe/patch.py                               |    1 +
 .../recipes-connectivity/galago/libgalago_0.5.2.bb |    4 +
 meta/recipes-core/busybox/busybox.inc              |   14 ++++-
 meta/recipes-core/busybox/busybox_1.18.4.bb        |    2 +
 meta/recipes-core/busybox/files/mdev               |    7 ++
 meta/recipes-core/busybox/files/mdev.conf          |   35 ++++++++++
 meta/recipes-core/readline/readline_6.2.bb         |    6 ++
 meta/recipes-devtools/syslinux/syslinux_4.03.bb    |   12 +++-
 meta/recipes-gnome/gnome/gnome-desktop.inc         |    2 +-
 .../gnome/gnome-doc-utils/xsltproc_nonet.patch     |   70 +++++++++++++++++++-
 meta/recipes-gnome/gnome/gnome-doc-utils_0.20.5.bb |    2 +-
 meta/recipes-gnome/gthumb/gthumb_2.12.2.bb         |    2 +-
 meta/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb        |    2 +-
 meta/recipes-gnome/tasks/task-sdk-gmae.inc         |    2 +-
 meta/recipes-graphics/xorg-lib/libxkbfile_1.0.7.bb |    4 +-
 meta/recipes-graphics/xorg-lib/libxmu_1.1.0.bb     |    2 +
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 .../linux-libc-headers_2.6.37.2.bb                 |    3 +-
 .../recipes-kernel/linux/linux-yocto-stable_git.bb |   10 +---
 meta/recipes-kernel/linux/linux-yocto_git.bb       |   15 +---
 .../lttng/lttng-ust/uclibc-sched_getcpu.patch      |   50 ++++++++++++++
 meta/recipes-kernel/lttng/lttng-ust_0.12.bb        |    4 +-
 meta/recipes-qt/meta/meta-toolchain-qte.bb         |   33 +++++-----
 meta/recipes-sato/web/{web_svn.bb => web_git.bb}   |   10 ++--
 meta/recipes-support/libproxy/libproxy_0.4.6.bb    |    2 +-
 meta/recipes-support/liburcu/liburcu_0.5.4.bb      |    2 +-
 scripts/oe-setup-builddir                          |    2 +-
 scripts/runqemu-internal                           |   13 +++-
 42 files changed, 316 insertions(+), 122 deletions(-)
 delete mode 100644 meta-demoapps/recipes-kernel/fuse/fuse-2.7.2/not-run-updaterc.d-on-host.patch
 delete mode 100644 meta-demoapps/recipes-kernel/fuse/fuse.inc
 delete mode 100644 meta-demoapps/recipes-kernel/fuse/fuse_2.7.2.bb
 create mode 100755 meta/recipes-core/busybox/files/mdev
 create mode 100644 meta/recipes-core/busybox/files/mdev.conf
 create mode 100644 meta/recipes-core/readline/readline_6.2.bb
 create mode 100644 meta/recipes-kernel/lttng/lttng-ust/uclibc-sched_getcpu.patch
 rename meta/recipes-sato/web/{web_svn.bb => web_git.bb} (72%)



