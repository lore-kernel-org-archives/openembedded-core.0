Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T2Pa3-00027e-9o
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 18:39:28 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 17 Aug 2012 09:27:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,785,1336374000"; d="scan'208";a="135457240"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.253])
	by AZSMGA002.ch.intel.com with ESMTP; 17 Aug 2012 09:27:26 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Aug 2012 09:27:26 -0700
Message-Id: <cover.1345215871.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
MIME-Version: 1.0
Subject: [CONSOLIDATED REQUEST 00/33] Package Updates & Fixes - Cover Letter Only
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
X-List-Received-Date: Fri, 17 Aug 2012 16:39:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Richard,

A load of package updates and some bugfixes from various
places.  I did not include the kernel updates due to the
current issue on the AB. 

Unless requested otherwise, I am only going send coverletters
from now, it seems that the full patch set is a bit of a mail bomb.

Sau!

The following changes since commit 99815eddd4e1eb5d939831704231537dd5a995ad:

  classes/chrpath: improve chrpath failure handling (2012-08-17 15:25:01 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Amy Fong (1):
  openssh: openssh's init fails to restart if sshd is not running

Andreas Müller (1):
  wpa-supplicant: fix paths in dbus/systemd *.service files

Andrei Gherzan (7):
  utils.py: Modify and rename distro_features_backfill python function
  bitbake.conf: Use the new form of features_backfill function
  bitbake.conf: Add MACHINE_FEATURES_BACKFILL and append to
    MACHINE_FEATURES
  bitbake.conf: Add rtc to MACHINE_FEATURES_BACKFILL
  task-core-boot: Add busybox-hwclock if MACHINE_FEATURES contains rtc
  busybox: Package hwclock.sh initscript separately
  subversion: Inherit gettext as msgfmt is needed at compile time

Constantin Musca (12):
  pixman: upgrade to 0.27.2
  dri2proto: upgrade to 2.8
  glproto: upgrade to 1.4.16
  pciutils: upgrade to 3.1.10
  dbus: upgrade to 1.6.4
  ofono: upgrade to 1.10
  iproute2: upgrade to 3.5.0
af847d36375aa53f0c1ee2a00c97ba9f38837d1b  iptables: upgrade to 1.4.15
  pulseaudio: upgrade to 2.1

Florin Sarbu (1):
  Add MPL version 2.0 license in common-licenses dir as well as adding
    a non-SPDX license name in license.bbclass

Mark Hatle (1):
  prelink: Update to latest upstream prelink

Matthew McClintock (1):
  distutils.bbclass: fix libdir for 64-bit python modules built with
    distutils

Paul Gortmaker (1):
  libproxy: add dependency on glib-2.0

Radu Moisan (2):
  grub: Update to upstream stable 2.00
  grub-efi-native: Update to version 2.00

Robert Yang (2):
  apt-native 0.7.14: remove an extra line from apt.conf
  rootfs_deb: move the lock from WORKDIR  to DEPLOY_DIR_DEB

Ross Burton (3):
  clutter: DOLT isn't used anymore
  owl-video: patches pushed upstream, so bump srcrev
  libowl-av: patches merged upstream, bump srcrev

Roy.Li (1):
  subversion: two small fixes

Saul Wold (1):
  libsamplerate: depends on libsdnfile

Scott Garman (1):
  runqemu: support booting ramfs-based images

Xin Ouyang (1):
  libatomics-ops: update to the latest version 7.2

 meta/classes/distutils.bbclass                     |    1 +
 meta/classes/license.bbclass                       |    1 +
 meta/classes/populate_sdk_deb.bbclass              |    3 +-
 meta/classes/rootfs_deb.bbclass                    |    2 +-
 meta/conf/bitbake.conf                             |    5 +-
 meta/files/common-licenses/MPL-2.0                 |  373 ++++++++++++++++++++
 meta/lib/oe/utils.py                               |    9 +-
 ...rub-1.99-gcc-4.7.0-strict-aliasing-errors.patch |  147 --------
 ...b-1.99-gcc-4.7.0-uninitialized-var-errors.patch |   41 ---
 .../grub/files/grub-1.99-gcc-4.7.0.patch           |   34 --
 .../files/grub-1.99_fix_for_automake_1.11.2.patch  |  179 ----------
 ...2man.patch => grub-2.00-disable-help2man.patch} |  117 +------
 ...grub-2.00-fix-enable_execute_stack-check.patch} |    8 +-
 ...ix.patch => grub-2.00-fpmath-sse-387-fix.patch} |    0
 .../grub/files/grub-no-unused-result.patch         |   13 +
 .../grub/grub-1.99/grub-1.99-lazy_stat.patch       |   64 ----
 .../grub/{grub-1.99 => grub-2.00}/40_custom        |    0
 .../{grub-1.99 => grub-2.00}/grub-install.in.patch |    0
 .../{grub-1.99 => grub-2.00}/remove-gets.patch     |    0
 ...-efi-native_1.99.bb => grub-efi-native_2.00.bb} |   18 +-
 .../grub/{grub_1.99.bb => grub_2.00.bb}            |   18 +-
 .../configure.patch                                |    0
 .../guess-fix.patch                                |    0
 .../lib-build-fix.patch                            |    0
 .../makefile.patch                                 |    0
 .../pcimodules-pciutils.diff                       |    0
 .../{pciutils_3.1.9.bb => pciutils_3.1.10.bb}      |    4 +-
 .../configure-cross.patch                          |    0
 .../{iproute2_3.4.0.bb => iproute2_3.5.0.bb}       |    4 +-
 .../ofono/{ofono_1.8.bb => ofono_1.10.bb}          |    6 +-
 .../openssh/openssh-6.0p1/init                     |    2 +-
 .../wpa-supplicant/wpa-supplicant-1.0.inc          |    2 +
 .../wpa-supplicant/wpa-supplicant_1.0.bb           |    2 +-
 meta/recipes-core/busybox/busybox.inc              |    5 +-
 .../dbus/{dbus-1.4.20 => dbus-1.6.4}/dbus-1.init   |    0
 .../dbus/{dbus-1.4.20 => dbus-1.6.4}/tmpdir.patch  |    0
 meta/recipes-core/dbus/dbus_1.4.20.bb              |    6 -
 meta/recipes-core/dbus/dbus_1.6.4.bb               |    6 +
 meta/recipes-core/tasks/task-core-boot.bb          |    1 +
 meta/recipes-devtools/apt/apt-native_0.7.14.bb     |    2 +-
 meta/recipes-devtools/apt/files/apt.conf           |    1 -
 meta/recipes-devtools/prelink/prelink_git.bb       |    4 +-
 .../subversion/subversion_1.6.15.bb                |    7 +-
 .../subversion/subversion_1.7.2.bb                 |    7 +-
 .../{iptables_1.4.14.bb => iptables_1.4.15.bb}     |    4 +-
 meta/recipes-graphics/clutter/clutter-1.8_1.8.4.bb |    7 +-
 meta/recipes-graphics/clutter/clutter-1.8_git.bb   |    7 +-
 meta/recipes-graphics/clutter/cogl_git.bb          |    7 +-
 .../{pixman_0.26.2.bb => pixman_0.27.2.bb}         |    4 +-
 .../{dri2proto_2.6.bb => dri2proto_2.8.bb}         |    4 +-
 .../{glproto_1.4.15.bb => glproto_1.4.16.bb}       |    4 +-
 .../libsamplerate/libsamplerate0_0.1.8.bb          |    4 +-
 .../pulseaudio/libatomics-ops/doublefix.patch      |   27 --
 .../fedora/libatomic_ops-1.2-ppclwzfix.patch       |   20 -
 .../gentoo/libatomic_ops-1.2-mips.patch            |  129 -------
 .../libatomics-ops/gentoo/sh4-atomic-ops.patch     |   70 ----
 .../libatomics-ops_fix_for_x32.patch               |   41 ---
 ...libatomics-ops_1.2.bb => libatomics-ops_7.2.bb} |   11 +-
 .../{pulseaudio_2.0.bb => pulseaudio_2.1.bb}       |    4 +-
 .../libowl-av/gst_change_state.patch               |   42 ---
 .../owl-video-widget/libowl-av/make-382.patch      |   13 -
 .../recipes-sato/owl-video-widget/libowl-av_git.bb |    8 +-
 .../owl-video/gtk_multithread_safe.patch           |   40 --
 .../owl-video-widget/owl-video/make-382.patch      |   17 -
 .../recipes-sato/owl-video-widget/owl-video_git.bb |    8 +-
 meta/recipes-support/libproxy/libproxy_0.4.7.bb    |    2 +-
 scripts/runqemu                                    |    6 +
 scripts/runqemu-internal                           |    5 +
 72 files changed, 517 insertions(+), 1119 deletions(-)
 create mode 100644 meta/files/common-licenses/MPL-2.0
 delete mode 100644 meta/recipes-bsp/grub/files/grub-1.99-gcc-4.7.0-strict-aliasing-errors.patch
 delete mode 100644 meta/recipes-bsp/grub/files/grub-1.99-gcc-4.7.0-uninitialized-var-errors.patch
 delete mode 100644 meta/recipes-bsp/grub/files/grub-1.99-gcc-4.7.0.patch
 delete mode 100644 meta/recipes-bsp/grub/files/grub-1.99_fix_for_automake_1.11.2.patch
 rename meta/recipes-bsp/grub/files/{grub-1.99-disable-help2man.patch => grub-2.00-disable-help2man.patch} (54%)
 rename meta/recipes-bsp/grub/files/{grub-1.99-fix-enable_execute_stack-check.patch => grub-2.00-fix-enable_execute_stack-check.patch} (92%)
 rename meta/recipes-bsp/grub/files/{grub-1.99-fpmath-sse-387-fix.patch => grub-2.00-fpmath-sse-387-fix.patch} (100%)
 create mode 100644 meta/recipes-bsp/grub/files/grub-no-unused-result.patch
 delete mode 100644 meta/recipes-bsp/grub/grub-1.99/grub-1.99-lazy_stat.patch
 rename meta/recipes-bsp/grub/{grub-1.99 => grub-2.00}/40_custom (100%)
 rename meta/recipes-bsp/grub/{grub-1.99 => grub-2.00}/grub-install.in.patch (100%)
 rename meta/recipes-bsp/grub/{grub-1.99 => grub-2.00}/remove-gets.patch (100%)
 rename meta/recipes-bsp/grub/{grub-efi-native_1.99.bb => grub-efi-native_2.00.bb} (80%)
 rename meta/recipes-bsp/grub/{grub_1.99.bb => grub_2.00.bb} (65%)
 rename meta/recipes-bsp/pciutils/{pciutils-3.1.9 => pciutils-3.1.10}/configure.patch (100%)
 rename meta/recipes-bsp/pciutils/{pciutils-3.1.9 => pciutils-3.1.10}/guess-fix.patch (100%)
 rename meta/recipes-bsp/pciutils/{pciutils-3.1.9 => pciutils-3.1.10}/lib-build-fix.patch (100%)
 rename meta/recipes-bsp/pciutils/{pciutils-3.1.9 => pciutils-3.1.10}/makefile.patch (100%)
 rename meta/recipes-bsp/pciutils/{pciutils-3.1.9 => pciutils-3.1.10}/pcimodules-pciutils.diff (100%)
 rename meta/recipes-bsp/pciutils/{pciutils_3.1.9.bb => pciutils_3.1.10.bb} (92%)
 delete mode 100644 meta/recipes-connectivity/connman/connman/0001-storage-check-that-the-string-isn-t-empty-before-spl.patch
 rename meta/recipes-connectivity/connman/{connman_1.3.bb => connman_1.4.bb} (69%)
 rename meta/recipes-connectivity/iproute2/{iproute2-3.4.0 => iproute2-3.5.0}/configure-cross.patch (100%)
 rename meta/recipes-connectivity/iproute2/{iproute2_3.4.0.bb => iproute2_3.5.0.bb} (51%)
 rename meta/recipes-connectivity/ofono/{ofono_1.8.bb => ofono_1.10.bb} (63%)
 rename meta/recipes-core/dbus/{dbus-1.4.20 => dbus-1.6.4}/dbus-1.init (100%)
 rename meta/recipes-core/dbus/{dbus-1.4.20 => dbus-1.6.4}/tmpdir.patch (100%)
 delete mode 100644 meta/recipes-core/dbus/dbus_1.4.20.bb
 create mode 100644 meta/recipes-core/dbus/dbus_1.6.4.bb
 rename meta/recipes-extended/iptables/{iptables_1.4.14.bb => iptables_1.4.15.bb} (91%)
 rename meta/recipes-graphics/xorg-lib/{libxrandr_1.3.2.bb => libxrandr_1.4.0.bb} (72%)
 rename meta/recipes-graphics/xorg-lib/{pixman_0.26.2.bb => pixman_0.27.2.bb} (86%)
 rename meta/recipes-graphics/xorg-proto/{dri2proto_2.6.bb => dri2proto_2.8.bb} (76%)
 rename meta/recipes-graphics/xorg-proto/{glproto_1.4.15.bb => glproto_1.4.16.bb} (77%)
 rename meta/recipes-graphics/xorg-proto/{randrproto_1.3.2.bb => randrproto_1.4.0.bb} (68%)
 delete mode 100644 meta/recipes-multimedia/pulseaudio/libatomics-ops/doublefix.patch
 delete mode 100644 meta/recipes-multimedia/pulseaudio/libatomics-ops/fedora/libatomic_ops-1.2-ppclwzfix.patch
 delete mode 100644 meta/recipes-multimedia/pulseaudio/libatomics-ops/gentoo/libatomic_ops-1.2-mips.patch
 delete mode 100644 meta/recipes-multimedia/pulseaudio/libatomics-ops/gentoo/sh4-atomic-ops.patch
 delete mode 100644 meta/recipes-multimedia/pulseaudio/libatomics-ops/libatomics-ops_fix_for_x32.patch
 rename meta/recipes-multimedia/pulseaudio/{libatomics-ops_1.2.bb => libatomics-ops_7.2.bb} (65%)
 rename meta/recipes-multimedia/pulseaudio/{pulseaudio_2.0.bb => pulseaudio_2.1.bb} (71%)
 delete mode 100644 meta/recipes-sato/owl-video-widget/libowl-av/gst_change_state.patch
 delete mode 100644 meta/recipes-sato/owl-video-widget/libowl-av/make-382.patch
 delete mode 100644 meta/recipes-sato/owl-video-widget/owl-video/gtk_multithread_safe.patch
 delete mode 100644 meta/recipes-sato/owl-video-widget/owl-video/make-382.patch

-- 
1.7.7.6



