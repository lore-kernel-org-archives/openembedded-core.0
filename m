Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id AB6726D120
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 17:54:21 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 16 Oct 2013 10:54:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,508,1378882800"; d="scan'208";a="393927724"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.253])
	by orsmga001.jf.intel.com with ESMTP; 16 Oct 2013 10:54:03 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Oct 2013 10:54:03 -0700
Message-Id: <cover.1381944889.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [CONSOLIDATED PULL 00/30] Package Updated & Fixes
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
X-List-Received-Date: Wed, 16 Oct 2013 17:54:21 -0000

Richard,

This is set of updates and fixes that I have reviewed and run through
the autobuilder.

I have included the kernel-grub.bbclass as it's a standalone class, right 
now it's RPM only it seems.

Sau!



The following changes since commit 2b179d90eacc58f0b217f64407782a9174362850:

  update-rcd.bbclass: fix host/target test (2013-10-16 14:50:58 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Chase Maupin (1):
  udev: update local rules for new touchscreen device

Hongxu Jia (1):
  kernel-grub.bbclass: a method to install/update for bzImage

Jack Mitchell (2):
  grub: add patch to support 256 byte inodes
  crond: remove UID check in init script

Jeffrey C Honig (1):
  initscripts: insure checkroot.sh runs before anything writing to the
    file

Laurentiu Palcu (10):
  byacc: upgrade to 20130925
  xkeyboard-config: upgrade to 2.10.1
  xauth: upgrade to 1.0.8
  xf86-input-evdev: upgrade to 2.8.2
  libdrm: upgrade to 2.4.47
  xset: upgrade to 1.2.3
  xf86-video-intel: upgrade to 2.21.15
  xinput: upgrade to 1.6.1
  xprop: upgrade to 1.2.2
  xf86-video-fbdev: upgrade to 0.4.4

Ross Burton (4):
  cairo: add explicit dependency on zlib
  wayland: upgrade to 1.3.0
  weston: upgrade to 1.3.0
  weston-init: start weston on a new VT

Saul Wold (9):
  sysstat: upgrade to 10.1.7
  xz: Add nativesdk for Python3 nativesdk dependency
  kmod: Add patch to fix seperate build dir of ptest
  kmod: Update to Rev 15 via git
  check: add check recipe for kbd to use for creating unit tests
  kbd: Update to 2.0.0
  base-passwd: upgrade to 3.5.28
  ca-certificates: Clarify in Description that certs are Debian based
  packagegroup-core-basic: libuser has a hard depenency on libpam

Ting Liu (2):
  perf: flag __SANE_USERSPACE_TYPES__ to include int-ll64.h for
    powerpc64
  socat: add dependency on tcp-wrappers

 meta/classes/kernel-grub.bbclass                   |  79 ++++++++++++++++
 .../grub-0.97/grub-support-256byte-inode.patch     | 101 +++++++++++++++++++++
 meta/recipes-bsp/grub/grub_0.97.bb                 |  11 ++-
 meta/recipes-connectivity/socat/socat_1.7.2.2.bb   |   2 +-
 .../add_shutdown.patch                             |   0
 .../base-passwd-3.5.28/disable-docs.patch          |  24 +++++
 .../input.patch                                    |   0
 .../nobash.patch                                   |   0
 ...base-passwd_3.5.26.bb => base-passwd_3.5.28.bb} |  11 ++-
 meta/recipes-core/initscripts/initscripts_1.0.bb   |   2 +-
 .../kbd-1.15.2/Allow-resizecons-on-x86_64.patch    |  28 ------
 .../kbd/{kbd_1.15.2.bb => kbd_2.0.0.bb}            |  19 ++--
 meta/recipes-core/udev/udev/local.rules            |   4 +-
 .../byacc/{byacc_20130304.bb => byacc_20130925.bb} |   4 +-
 meta/recipes-extended/cronie/cronie/crond.init     |   8 --
 .../packagegroups/packagegroup-core-basic.bb       |   2 +-
 ...-Makefile-to-allow-for-parallel-execution.patch |  34 -------
 meta/recipes-extended/sysstat/sysstat.inc          |   4 +-
 .../{sysstat_10.1.6.bb => sysstat_10.1.7.bb}       |   4 +-
 meta/recipes-extended/xz/xz_5.1.2alpha.bb          |   2 +-
 meta/recipes-graphics/cairo/cairo.inc              |   2 +-
 .../drm/{libdrm_2.4.46.bb => libdrm_2.4.47.bb}     |   4 +-
 .../wayland/{wayland_1.1.0.bb => wayland_1.3.0.bb} |  19 ++--
 meta/recipes-graphics/wayland/weston-init.bb       |   2 +
 meta/recipes-graphics/wayland/weston-init/init     |   2 +-
 meta/recipes-graphics/wayland/weston/groups.patch  |  47 ----------
 .../wayland/weston/install-examples.patch          |  18 ----
 .../wayland/weston/weston-launch-shell.patch       |  74 ---------------
 .../wayland/{weston_1.1.0.bb => weston_1.3.0.bb}   |  17 ++--
 .../xorg-app/{xauth_1.0.7.bb => xauth_1.0.8.bb}    |   5 +-
 .../xorg-app/{xinput_1.6.0.bb => xinput_1.6.1.bb}  |   5 +-
 .../xorg-app/{xprop_1.2.1.bb => xprop_1.2.2.bb}    |   5 +-
 .../xorg-app/{xset_1.2.2.bb => xset_1.2.3.bb}      |   5 +-
 ...ut-evdev_2.8.1.bb => xf86-input-evdev_2.8.2.bb} |   4 +-
 .../xf86-video-fbdev/Remove-mibstore.h.patch       |  35 -------
 ...eo-fbdev_0.4.3.bb => xf86-video-fbdev_0.4.4.bb} |   6 +-
 ...ntel_2.21.13.bb => xf86-video-intel_2.21.15.bb} |   4 +-
 ...rd-config_2.9.bb => xkeyboard-config_2.10.1.bb} |   4 +-
 meta/recipes-kernel/kmod/kmod-native_git.bb        |   3 +-
 meta/recipes-kernel/kmod/kmod.inc                  |  13 +--
 .../kmod/kmod/fix-seperatebuilddir.patch           |  34 +++++++
 meta/recipes-kernel/kmod/kmod_git.bb               |   6 +-
 meta/recipes-kernel/perf/perf.bb                   |   6 ++
 .../ca-certificates/ca-certificates_20130610.bb    |   3 +-
 meta/recipes-support/check/check_0.9.10.bb         |  20 ++++
 meta/recipes-support/check/files/ptest.patch       |  29 ++++++
 meta/recipes-support/check/files/run-ptest         |   3 +
 47 files changed, 382 insertions(+), 332 deletions(-)
 create mode 100644 meta/classes/kernel-grub.bbclass
 create mode 100644 meta/recipes-bsp/grub/grub-0.97/grub-support-256byte-inode.patch
 rename meta/recipes-core/base-passwd/{base-passwd-3.5.26 => base-passwd-3.5.28}/add_shutdown.patch (100%)
 create mode 100644 meta/recipes-core/base-passwd/base-passwd-3.5.28/disable-docs.patch
 rename meta/recipes-core/base-passwd/{base-passwd-3.5.26 => base-passwd-3.5.28}/input.patch (100%)
 rename meta/recipes-core/base-passwd/{base-passwd-3.5.26 => base-passwd-3.5.28}/nobash.patch (100%)
 rename meta/recipes-core/base-passwd/{base-passwd_3.5.26.bb => base-passwd_3.5.28.bb} (92%)
 delete mode 100644 meta/recipes-core/kbd/kbd-1.15.2/Allow-resizecons-on-x86_64.patch
 rename meta/recipes-core/kbd/{kbd_1.15.2.bb => kbd_2.0.0.bb} (58%)
 rename meta/recipes-extended/byacc/{byacc_20130304.bb => byacc_20130925.bb} (74%)
 delete mode 100644 meta/recipes-extended/sysstat/files/0001-Update-Makefile-to-allow-for-parallel-execution.patch
 rename meta/recipes-extended/sysstat/{sysstat_10.1.6.bb => sysstat_10.1.7.bb} (40%)
 rename meta/recipes-graphics/drm/{libdrm_2.4.46.bb => libdrm_2.4.47.bb} (46%)
 rename meta/recipes-graphics/wayland/{wayland_1.1.0.bb => wayland_1.3.0.bb} (63%)
 delete mode 100644 meta/recipes-graphics/wayland/weston/groups.patch
 delete mode 100644 meta/recipes-graphics/wayland/weston/install-examples.patch
 delete mode 100644 meta/recipes-graphics/wayland/weston/weston-launch-shell.patch
 rename meta/recipes-graphics/wayland/{weston_1.1.0.bb => weston_1.3.0.bb} (83%)
 rename meta/recipes-graphics/xorg-app/{xauth_1.0.7.bb => xauth_1.0.8.bb} (65%)
 rename meta/recipes-graphics/xorg-app/{xinput_1.6.0.bb => xinput_1.6.1.bb} (64%)
 rename meta/recipes-graphics/xorg-app/{xprop_1.2.1.bb => xprop_1.2.2.bb} (77%)
 rename meta/recipes-graphics/xorg-app/{xset_1.2.2.bb => xset_1.2.3.bb} (74%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-evdev_2.8.1.bb => xf86-input-evdev_2.8.2.bb} (83%)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-fbdev/Remove-mibstore.h.patch
 rename meta/recipes-graphics/xorg-driver/{xf86-video-fbdev_0.4.3.bb => xf86-video-fbdev_0.4.4.bb} (44%)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-intel_2.21.13.bb => xf86-video-intel_2.21.15.bb} (88%)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.9.bb => xkeyboard-config_2.10.1.bb} (87%)
 create mode 100644 meta/recipes-kernel/kmod/kmod/fix-seperatebuilddir.patch
 create mode 100644 meta/recipes-support/check/check_0.9.10.bb
 create mode 100644 meta/recipes-support/check/files/ptest.patch
 create mode 100644 meta/recipes-support/check/files/run-ptest

-- 
1.8.3.1


