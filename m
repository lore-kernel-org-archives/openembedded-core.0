Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 530756B516
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 17:49:20 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 13 Aug 2013 10:49:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,871,1367996400"; d="scan'208";a="385743088"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.106])
	by fmsmga002.fm.intel.com with ESMTP; 13 Aug 2013 10:49:17 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Aug 2013 10:49:17 -0700
Message-Id: <cover.1376414097.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
MIME-Version: 1.0
Subject: [CONSOLIDATED PULL 00/24] Final Review & ACK
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
X-List-Received-Date: Tue, 13 Aug 2013 17:49:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Richard:

This will be ready to pull after Paul and Ross Ack.

I fixed the groff patches for GPLv2 and updated Stefan's patch,
other than that no changes.

Sau!

The following changes since commit 5c11cf4db8f43003fb7132b92a78659f70f07ce0:

  checkroot.sh: respect the value of ENABLE_ROOTFS_FSCK (2013-08-09 08:54:47 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Alexandru Palalau (1):
  lib/oeqa/runtime: add new systemd tests

Chen Qi (1):
  grub_0.97: Fix to correctly ship files under /usr/lib

Darren Hart (1):
  kernel.bbclass: Correct post(inst|rm) package association

Jukka Rissanen (1):
  procps: Add cgroup support

Kai Kang (1):
  dpkg: fix include header caused compile error

Mark Hatle (3):
  rpm: Change references from RPM_VENDOR_POKY to RPM_VENDOR_OE
  rpm: Enable compatibility with older RPM packages that have invalid
    platforms
  image.bbclass: Move runtime_mapping_rename to avoid conflict w/
    multilib

Mike Looijmans (1):
  linux-dtb.inc: Replace /boot/ with /${KERNEL_IMAGEDEST}/

Otavio Salvador (1):
  blacklist.bbclass: Avoid blacklist specific handle in base.bbclass

Paul Barker (1):
  opkg: Fix possible installation of GPLv3 header

Paul Eggleton (6):
  yasm: add from meta-oe and tweak
  x264: add from meta-oe, update and tweak
  libav: add from meta-oe, update and tweak
  gst-ffmpeg: merge in bbappend from meta-oe
  gst-ffmpeg: enable using yasm during build
  gst-ffmpeg: set SUMMARY instead of DESCRIPTION

Ross Burton (2):
  mesa: fix and enable out-of-tree builds
  oe-setup-builddir: substitute ##OEROOT## when using templates

Saul Wold (2):
  groff: Fix License to be GPLv3
  groff: Add GPLv2 version

Stefan Stanacar (3):
  classes/testimage: create a link for qemu boot log
  oeqa/utils/qemurunner: get ip old fashioned way and use tcp serial
    console
  lib/oeqa/runtime: rework syslog test

 meta/classes/base.bbclass                          |  10 --
 meta/classes/blacklist.bbclass                     |  25 ++++
 meta/classes/image.bbclass                         |  17 ++-
 meta/classes/kernel.bbclass                        |  29 +++--
 meta/classes/testimage.bbclass                     |  20 +++-
 meta/conf/distro/include/seperatebuilddir.inc      |   2 +-
 meta/lib/oeqa/runtime/syslog.py                    |  23 ++--
 meta/lib/oeqa/runtime/systemd.py                   |  35 ++++++
 meta/lib/oeqa/utils/oeqemuconsole.py               |  45 -------
 meta/lib/oeqa/utils/qemurunner.py                  | 123 +++++++++++++-------
 .../grub-0.97/grub_fix_for_automake-1.12.patch     |  50 ++++++--
 .../dpkg/dpkg/fix-abs-redefine.patch               |  40 +++++++
 meta/recipes-devtools/dpkg/dpkg_1.17.1.bb          |   1 +
 .../opkg/opkg/obsolete_automake_macros.patch       |  15 ---
 meta/recipes-devtools/opkg/opkg_svn.bb             |   6 +-
 .../rpm/rpm/python-rpm-rpmsense.patch              |   4 +-
 .../rpm/rpm/rpm-lsb-compatibility.patch            |  24 ++++
 meta/recipes-devtools/rpm/rpm/rpm-no-loopmsg.patch |   2 +-
 .../rpm/rpm/rpm-platform-file-fix.patch            |   2 +-
 meta/recipes-devtools/rpm/rpm/rpm-platform.patch   |   8 +-
 meta/recipes-devtools/rpm/rpm/rpm-platform2.patch  |   6 +-
 .../rpm/rpm/rpm-scriptletexechelper.patch          |  22 ++--
 meta/recipes-devtools/rpm/rpm_5.4.9.bb             |   3 +-
 meta/recipes-devtools/yasm/yasm_1.2.0.bb           |  13 +++
 .../groff-1.18.1.4/groff-1.18.1.4-remove-mom.patch |  39 +++++++
 .../groff/groff-1.18.1.4/man-local.patch           |  36 ++++++
 .../groff/groff-1.18.1.4/mdoc-local.patch          |  36 ++++++
 meta/recipes-extended/groff/groff_1.18.1.4.bb      |  45 +++++++
 meta/recipes-extended/groff/groff_1.22.2.bb        |   2 +-
 .../procps-3.2.8/procps-3.2.8-ps-cgroup.patch      |  82 +++++++++++++
 meta/recipes-extended/procps/procps_3.2.8.bb       |   1 +
 .../mesa/0005-fix-out-of-tree-builds-gallium.patch |  42 +++++++
 .../mesa/mesa/0006-fix-out-of-tree-egl.patch       |  48 ++++++++
 meta/recipes-graphics/mesa/mesa_9.1.6.bb           |   2 +
 meta/recipes-graphics/mesa/mesa_git.bb             |   2 +
 meta/recipes-kernel/linux/linux-dtb.inc            |   4 +-
 .../gstreamer/gst-ffmpeg_0.10.13.bb                |  12 +-
 .../0001-configure-enable-pic-for-AArch64.patch    |  23 ++++
 meta/recipes-multimedia/libav/libav.inc            | 129 +++++++++++++++++++++
 meta/recipes-multimedia/libav/libav_0.8.8.bb       |  18 +++
 meta/recipes-multimedia/libav/libav_git.bb         |  16 +++
 .../don-t-default-to-cortex-a9-with-neon.patch     |  20 ++++
 meta/recipes-multimedia/x264/x264_git.bb           |  52 +++++++++
 scripts/oe-setup-builddir                          |   5 +-
 44 files changed, 942 insertions(+), 197 deletions(-)
 delete mode 100644 meta/lib/oeqa/utils/oeqemuconsole.py
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/fix-abs-redefine.patch
 delete mode 100644 meta/recipes-devtools/opkg/opkg/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-lsb-compatibility.patch
 create mode 100644 meta/recipes-devtools/yasm/yasm_1.2.0.bb
 create mode 100644 meta/recipes-extended/groff/groff-1.18.1.4/groff-1.18.1.4-remove-mom.patch
 create mode 100644 meta/recipes-extended/groff/groff-1.18.1.4/man-local.patch
 create mode 100644 meta/recipes-extended/groff/groff-1.18.1.4/mdoc-local.patch
 create mode 100644 meta/recipes-extended/groff/groff_1.18.1.4.bb
 create mode 100644 meta/recipes-extended/procps/procps-3.2.8/procps-3.2.8-ps-cgroup.patch
 create mode 100644 meta/recipes-graphics/mesa/mesa/0005-fix-out-of-tree-builds-gallium.patch
 create mode 100644 meta/recipes-graphics/mesa/mesa/0006-fix-out-of-tree-egl.patch
 create mode 100644 meta/recipes-multimedia/libav/libav-0.8.8/0001-configure-enable-pic-for-AArch64.patch
 create mode 100644 meta/recipes-multimedia/libav/libav.inc
 create mode 100644 meta/recipes-multimedia/libav/libav_0.8.8.bb
 create mode 100644 meta/recipes-multimedia/libav/libav_git.bb
 create mode 100644 meta/recipes-multimedia/x264/x264/don-t-default-to-cortex-a9-with-neon.patch
 create mode 100644 meta/recipes-multimedia/x264/x264_git.bb

-- 
1.8.1.4


