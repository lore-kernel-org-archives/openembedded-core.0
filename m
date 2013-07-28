Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C66B76065F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Jul 2013 06:30:43 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 Jul 2013 23:30:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,762,1367996400"; d="scan'208";a="377261675"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.47])
	by fmsmga002.fm.intel.com with ESMTP; 27 Jul 2013 23:30:43 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 27 Jul 2013 23:30:43 -0700
Message-Id: <cover.1374992925.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
MIME-Version: 1.0
Subject: [CONSOLIDATED PULL (Part 1) 00/64] Ready to pull (Acked on Friday)
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
X-List-Received-Date: Sun, 28 Jul 2013 06:30:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Richard,

This is ready to pull, this is the set that was ACK'ed on friday by Paul
and Ross, I removed the git recipe renames as requested and moved my obex
change to a part 2.

I did include a couple of priority patches from friday, Ross's revert, and
a couple of Upstream-Status changes, along with my patch to fix the 
externa-toolchain issue that was being seen.

Please pull (and review part 2, time permitting).


Thanks
	Sau!



The following changes since commit ac5d20f4adac69ea1702694fb50849c9e465b443:

  systemd: Remove systemd_unitdir if systemd is not in distro features (2013-07-23 07:49:54 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Alexandru DAMIAN (1):
  weston: add pango dependency

Andreas Müller (1):
  package.bbclass: avoid packing debug sources from other packages

Andrei Dinu (1):
  openssh: Added Upstream Status to openssh-CVE-2011-4327

Bruce Ashfield (1):
  linux-yocto/3.8: revert .gitignore: do not ignore meta directory

Chen Qi (3):
  run-postinsts: fix comment
  run-postinsts: add more logging to the log file to make things clearer
  rpm: remove the obsolete rpm-postinsts.bb

Cristian Iorga (2):
  connman: upgrade to v1.16
  pulseaudio: upgrade to v4.0

Fathi Boudra (1):
  dmidecode: add aarch64 and arm to compatible host

Gabriel Barbu (1):
  strace: Add ptest

Hongxu Jia (4):
  readline: fix importing readline in python with probably escape
    sequence output
  nss:fix postinst failed at rootfs time
  lsbinitscripts: remove x permission on functions
  sysvinit: pidof add -m option for lsbinitscripts

Ionut Radu (7):
  useradd.bbclass: fix traceback when inheriting useradd but not setting
    USERADD_PARAM or GROUPADD_PARAM
  libxfont: Update from 1.4.5 to 1.4.6
  libxrandr: Update from 1.4.0 to 1.4.1
  libxxf86dga: Updated from 1.1.3 to 1.1.4
  libuser: Updated from 0.58 to 0.59
  videoproto: Update from 2.3.1 to 2.3.2
  apt:  Add Upstream Status to patches

Jackie Huang (1):
  dbus: add -o option into start-stop-daemon arguments

Jim Somerville (1):
  rt-tests: add Upstream-Status for cyclictest patch

Jonathan Liu (1):
  gcc-4.8: fix compiling GCC when /usr/lib/libstdc++.so is present

Koen Kooi (1):
  util-linux: fix PACKAGECONFIG options

Laurentiu Palcu (2):
  elfutils: fix backends' Makefile.am
  xinput-calibrator: move it from meta-oe to oe-core

Martin Jansa (19):
  test-dependencies: add simple script to detect missing or autoenabled
    dependencies
  gst-plugins-bad: add few more PACKAGECONFIGs
  xkeyboard-config: add missing dependency on util-macros
  ccache: add zlib dependency
  cups: add PACKAGECONFIG for acl
  directfb: add PACKAGECONFIG for jpeg2000
  distcc: add PACKAGECONFIG for popt
  grub: add PACKAGECONFIG for grub-mount
  mailx: remove support for autodetection of krb5
  minicom: add configure option and PACKAGECONFIG for lockdev
  ltp: add acl, openssl dependency
  patch: add PACKAGECONFIG for attr
  python-imaging: add PACKAGECONFIG for lcms
  socat: add PACKAGECONFIG for tcp-wrappers
  sudo: add PACKAGECONFIG for zlib
  gstreamer1.0-plugins-good: add PACKAGECONFIG for v4l
  gst-plugins-good: add PACKAGECONFIG for jpeg, wavpack, gdkpixbuf, v4l,
    bzip2, orc
  gettext: disable nls when INHIBIT_DEFAULT_DEPS is set
  mesa: add PACKAGEs and PACKAGECONFIG for xvmc

Muhammad Shakeel (1):
  bash: Add ptest

Olof Johansson (1):
  cpan.bbclass: Fail unless Makefile.PL generates Makefile

Paul Eggleton (4):
  python-smartpm: fix sometimes reporting no provider instead of
    conflict
  python-smartpm: add ignore-recommends package flag
  classes/image: ensure BAD_RECOMMENDATIONS supports pre-renamed package
    names
  classes/rootfs_rpm: implement BAD_RECOMMENDATIONS for RPM

Ross Burton (2):
  sanity.bbclass: mention version when erroring on LCONF_VERSION
    mismatch
  Revert "initrdscripts: mount / as read-only when live-booting"

Roy.Li (1):
  qemu: block to build it on mips64 arch

Saul Wold (5):
  consolekit: Update to 0.4.6
  mklibs-native: Update to 0.1.38
  cups: Update to 1.6.3
  ptest: fix Upstream-status
  external-sourcery: add missing providers

Simon Busch (1):
  wpa-supplicant: enable required configuration options for connman

Yi Zhao (2):
  LSB_Test.sh: add -f option for curl
  scripts/create-lsb-image: remove

 meta/classes/cpan.bbclass                          |   9 +
 meta/classes/gettext.bbclass                       |   4 +-
 meta/classes/image.bbclass                         |   1 +
 meta/classes/package.bbclass                       |   2 +-
 meta/classes/package_rpm.bbclass                   |  11 +-
 meta/classes/rootfs_ipk.bbclass                    |   2 -
 meta/classes/rootfs_rpm.bbclass                    |   3 +-
 meta/classes/sanity.bbclass                        |   2 +-
 meta/classes/useradd.bbclass                       |   2 +-
 meta/conf/bitbake.conf                             |   2 +
 .../distro/include/tcmode-external-sourcery.inc    |   3 +
 meta/recipes-bsp/grub/grub_2.00.bb                 |   3 +
 .../connman/inet-fix-ip-cleanup-functions.patch    |  40 ----
 .../connman/{connman_1.15.bb => connman_1.16.bb}   |   5 +-
 .../openssh-6.2p2/openssh-CVE-2011-4327.patch      |   2 +
 meta/recipes-connectivity/socat/socat_1.7.2.2.bb   |   3 +
 .../wpa-supplicant/wpa-supplicant/defconfig-gnutls |  21 +-
 meta/recipes-core/dbus/dbus-1.6.10/dbus-1.init     |   4 +-
 meta/recipes-core/initrdscripts/files/init-live.sh |   6 +-
 .../meta/external-sourcery-toolchain.bb            |   2 +
 ...ly-enable-meta-key-for-a-single-call-read.patch | 114 +++++++++
 meta/recipes-core/readline/readline_6.2.bb         |   1 +
 .../sysvinit-2.88dsf/pidof-add-m-option.patch      | 189 +++++++++++++++
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb     |   1 +
 meta/recipes-core/util-linux/util-linux.inc        |   4 +-
 .../apt-0.9.8.2/fix-gcc-4.6-null-not-defined.patch |   2 +
 .../apt/apt-0.9.8.2/no-nls-dpkg.patch              |   2 +
 .../apt/apt-0.9.8.2/use-host.patch                 |   2 +
 meta/recipes-devtools/ccache/ccache.inc            |   2 +
 meta/recipes-devtools/distcc/distcc_3.1.bb         |   4 +-
 meta/recipes-devtools/dmidecode/dmidecode_2.12.bb  |   2 +-
 .../elfutils/elfutils-0.155/hppa_backend.diff      |  15 +-
 .../elfutils/elfutils-0.155/m68k_backend.diff      |  12 +-
 .../elfutils/elfutils-0.155/mips_backend.diff      |  16 +-
 meta/recipes-devtools/gcc/gcc-4.8.inc              |   1 +
 .../gcc/gcc-4.8/0041-libtool-avoid-libdir.patch    |  19 ++
 ...bs-native_0.1.37.bb => mklibs-native_0.1.38.bb} |   4 +-
 meta/recipes-devtools/patch/patch.inc              |   3 +
 .../allow.to.disable.some.features.patch           |  65 ++++++
 .../python/python-imaging_1.1.7.bb                 |  10 +-
 .../python-smartpm/smart-conflict-provider.patch   | 196 ++++++++++++++++
 .../smart-flag-ignore-recommends.patch             |  60 +++++
 .../python/python-smartpm_1.4.1.bb                 |   2 +
 meta/recipes-devtools/qemu/qemu_1.5.0.bb           |   2 +
 meta/recipes-devtools/qemu/qemu_git.bb             |   2 +
 meta/recipes-devtools/rpm/rpm-postinsts.bb         |  54 -----
 .../run-postinsts/run-postinsts/run-postinsts      |   6 +-
 .../strace/strace-4.8/Makefile-ptest.patch         |  28 +++
 meta/recipes-devtools/strace/strace-4.8/run-ptest  |   2 +
 meta/recipes-devtools/strace/strace_4.8.bb         |  19 +-
 .../bash/bash-3.2.48/build-tests.patch             |  44 ++++
 meta/recipes-extended/bash/bash-3.2.48/run-ptest   |   2 +
 .../bash/bash-3.2.48/test-output.patch             |  25 ++
 meta/recipes-extended/bash/bash_3.2.48.bb          |   3 +
 meta/recipes-extended/cups/cups16.inc              |   1 +
 .../cups/{cups_1.6.2.bb => cups_1.6.3.bb}          |   4 +-
 .../libuser/{libuser_0.58.bb => libuser_0.59.bb}   |   4 +-
 meta/recipes-extended/lsb/lsbinitscripts_9.48.bb   |   2 +-
 meta/recipes-extended/lsb/lsbtest/LSB_Test.sh      |   2 +-
 meta/recipes-extended/ltp/ltp_20130503.bb          |   2 +-
 .../explicitly.disable.krb5.support.patch          |  46 ++++
 meta/recipes-extended/mailx/mailx_12.5.bb          |   1 +
 .../minicom-2.6.2/allow.to.disable.lockdev.patch   |  21 ++
 meta/recipes-extended/minicom/minicom_2.6.2.bb     |   7 +-
 meta/recipes-extended/sudo/sudo.inc                |   3 +
 meta/recipes-graphics/directfb/directfb.inc        |   3 +
 meta/recipes-graphics/mesa/mesa.inc                |   4 +
 meta/recipes-graphics/wayland/weston_1.1.0.bb      |   2 +-
 .../pointercal-xinput/pointercal.xinput            |   1 +
 .../xinput-calibrator/pointercal-xinput_0.0.bb     |  20 ++
 .../xinput-calibrator/30xinput_calibrate.sh        |   7 +
 ...t_calibrator_pointercal.sh-to-be-run-as-n.patch |  66 ++++++
 .../xinput-calibrator/xinput-calibrator_git.bb     |  31 +++
 .../{libxfont_1.4.5.bb => libxfont_1.4.6.bb}       |   5 +-
 .../{libxrandr_1.4.0.bb => libxrandr_1.4.1.bb}     |   5 +-
 .../{libxxf86dga_1.1.3.bb => libxxf86dga_1.1.4.bb} |   7 +-
 .../xorg-lib/xkeyboard-config_2.9.bb               |   2 +-
 .../{videoproto_2.3.1.bb => videoproto_2.3.2.bb}   |   7 +-
 meta/recipes-kernel/kmod/kmod/ptest.patch          |   2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb    |   2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb  |   2 +-
 meta/recipes-kernel/linux/linux-yocto_3.8.bb       |   2 +-
 .../gstreamer/gst-plugins-bad_0.10.23.bb           |  10 +
 .../gstreamer/gst-plugins-good_0.10.31.bb          |  12 +-
 .../gstreamer/gstreamer1.0-plugins-good.inc        |   2 +-
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |   9 +-
 .../pulseaudio/pulseaudio_fix_for_x32.patch        | 238 -------------------
 .../{pulseaudio_3.0.bb => pulseaudio_4.0.bb}       |  11 +-
 ...st-finish-removal-of-1-second-first-loops.patch |   3 +
 .../{consolekit_0.4.5.bb => consolekit_0.4.6.bb}   |   8 +-
 meta/recipes-support/nss/nss.inc                   |   8 +-
 scripts/create-lsb-image                           | 228 ------------------
 scripts/test-dependencies.sh                       | 256 +++++++++++++++++++++
 93 files changed, 1428 insertions(+), 658 deletions(-)
 delete mode 100644 meta/recipes-connectivity/connman/connman/inet-fix-ip-cleanup-functions.patch
 rename meta/recipes-connectivity/connman/{connman_1.15.bb => connman_1.16.bb} (62%)
 create mode 100644 meta/recipes-core/readline/readline-6.2/readline-only-enable-meta-key-for-a-single-call-read.patch
 create mode 100644 meta/recipes-core/sysvinit/sysvinit-2.88dsf/pidof-add-m-option.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0041-libtool-avoid-libdir.patch
 rename meta/recipes-devtools/mklibs/{mklibs-native_0.1.37.bb => mklibs-native_0.1.38.bb} (80%)
 create mode 100644 meta/recipes-devtools/python/python-imaging/allow.to.disable.some.features.patch
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-conflict-provider.patch
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-flag-ignore-recommends.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm-postinsts.bb
 create mode 100644 meta/recipes-devtools/strace/strace-4.8/Makefile-ptest.patch
 create mode 100755 meta/recipes-devtools/strace/strace-4.8/run-ptest
 create mode 100644 meta/recipes-extended/bash/bash-3.2.48/build-tests.patch
 create mode 100644 meta/recipes-extended/bash/bash-3.2.48/run-ptest
 create mode 100644 meta/recipes-extended/bash/bash-3.2.48/test-output.patch
 rename meta/recipes-extended/cups/{cups_1.6.2.bb => cups_1.6.3.bb} (80%)
 rename meta/recipes-extended/libuser/{libuser_0.58.bb => libuser_0.59.bb} (88%)
 create mode 100644 meta/recipes-extended/mailx/mailx-12.5/explicitly.disable.krb5.support.patch
 create mode 100644 meta/recipes-extended/minicom/minicom-2.6.2/allow.to.disable.lockdev.patch
 create mode 100644 meta/recipes-graphics/xinput-calibrator/pointercal-xinput/pointercal.xinput
 create mode 100644 meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
 create mode 100644 meta/recipes-graphics/xinput-calibrator/xinput-calibrator/30xinput_calibrate.sh
 create mode 100644 meta/recipes-graphics/xinput-calibrator/xinput-calibrator/Allow-xinput_calibrator_pointercal.sh-to-be-run-as-n.patch
 create mode 100644 meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
 rename meta/recipes-graphics/xorg-lib/{libxfont_1.4.5.bb => libxfont_1.4.6.bb} (76%)
 rename meta/recipes-graphics/xorg-lib/{libxrandr_1.4.0.bb => libxrandr_1.4.1.bb} (80%)
 rename meta/recipes-graphics/xorg-lib/{libxxf86dga_1.1.3.bb => libxxf86dga_1.1.4.bb} (70%)
 rename meta/recipes-graphics/xorg-proto/{videoproto_2.3.1.bb => videoproto_2.3.2.bb} (53%)
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/pulseaudio_fix_for_x32.patch
 rename meta/recipes-multimedia/pulseaudio/{pulseaudio_3.0.bb => pulseaudio_4.0.bb} (51%)
 rename meta/recipes-support/consolekit/{consolekit_0.4.5.bb => consolekit_0.4.6.bb} (90%)
 delete mode 100755 scripts/create-lsb-image
 create mode 100755 scripts/test-dependencies.sh

-- 
1.8.1.4


