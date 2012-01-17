Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rn4ah-0006gw-7J
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 09:40:28 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 Jan 2012 00:32:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96632823"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 17 Jan 2012 00:32:49 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2012 00:31:45 -0800
Message-Id: <cover.1326786989.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
Subject: [CONSOLIDATED PULL 00/62] Major set of Changes
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
X-List-Received-Date: Tue, 17 Jan 2012 08:40:28 -0000


Richard,

I have test build this grouping of changes and theyseem good to
me at this point. One issue is with the linux-yocto change set
from Bruce seems to introduce a problem with compile perf on some
hardware Machine settings.

The openssl changes will need to be backported to 1.1.1, which
Joshua is aware of.

Please review this change set and pull as appropriate.

Thanks
	Sau!


The following changes since commit 91e17c0c0ac2330f826b95e762542cd0d0c82385:

  pango: Use gnomebase class, not gnome (2012-01-16 18:01:31 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Andrei Gherzan (1):
  wpa-supplicant: Compile without CONFIG_GNUTLS_EXTRA (PR BUMP)

Aneesh Bansal (1):
  add mfatbu/mfatbl instructions support in Valgrind

Bruce Ashfield (1):
  linux-yocto: consolidated fix SRCREV updates

Christopher Larson (5):
  ncurses-native: install to libdir, not base_libdir
  copyleft_compliance: add control of recipe types to include
  copyleft_compliance: add debug message with the reason for exclusion
  oe.license: add is_included convenience function
  oe.license: avoid the need to catch SyntaxError

Colin Walters (1):
  libtool: Put all libltdl headers in the correct libltdl-dev package

Darren Hart (1):
  bootimg: Account for FAT filesystem overhead in image size

Denis 'GNUtoo' Carikli (1):
  alsa-utils: depend on libsamplerate0

Enrico Scholz (2):
  package.bbclass: quote pathname given to objdump
  bitbake.conf: search /lib for -native builds

James Limbouris (1):
  ghostscript: build cups filters

Joshua Lock (4):
  task-base: move default definition of VIRTUAL-RUNTIME_apm
  alsa-state: add alsa-state from oe classic
  alsa-state: move state files to localstatedir
  task-base: add VIRTUAL-RUNTIME_alsa-state to task-base-alsa

Liming Wang (4):
  qemuppc: replace emulation of qemuppc from prep to mac99
  qemuppc: add pointercal file
  qemuppc: add machconfig
  tslib: enable big endian support for qemuppc

Mark Hatle (1):
  prelink: Update to latest version

Martin Jansa (2):
  xorg-*: disable xmlto where it was failing
  dbus-1.4.16: use INC_PR from dbus.inc to fix PR bump after
    dbus-launch-helper permission change

Matthew McClintock (2):
  image_types.bbclass: Fix generating uncompressed ext2 images
  image_types_uboot.bbclass: Add uncompressed ext2 image option

Nitin A Kamble (7):
  locale: fix package's "provides" tag
  diffstat: upgrade from 1.54 to 1.55
  insane.bbclass: fix elf.arch not matching error for x32 kernel
  libpcre: upgrade from 8.20 to 8.21
  btrfs-tools: upgrade to newer git commit
  distro_tracking: update manual_check_date fields
  grub-efi-native: fix errors with automake 1.11.2

Paul Eggleton (4):
  classes/base: note variable name in COMPATIBLE_* skip messages
  conf/bitbake.conf: allow wget to output error messages
  classes/package: remove out-of-date notice referring to the OE
    bugtracker
  classes/packagehistory: remove now obsolete class

Saul Wold (7):
  m4: refactor .bb and .inc files
  tcmode-eglibc: Fix PREFERRED_VERSION of eglibc
  valgrind: Update for eglibc 2.15
  python: PR bump for eglibc update
  tcl: PR bump for eglibc update
  openssl-0.9.8: Update to 0.9.8s
  openssl-1.0.0: Update to 1.0.0e and fix QA Warning

Scott Garman (3):
  libpam: upgrade to 1.1.5
  e2fsprogs: upgrade to 1.42
  distro_tracking: recipe upgrades and manual check info

Shane Wang (2):
  stat: add recipe stat with version 3.3
  hdparm: upgrade to 9.37

Tom Zanussi (5):
  base.bbclass: add support for LICENSE_FLAGS
  Add LICENSE_FLAGS to packages mentioned in COMMERCIAL_LICENSE
  base.bbclass: remove COMMERCIAL_LICENSE code
  default-distrovars.inc: remove COMMERCIAL_LICENSE et al
  documentation-audit.sh: remove COMMERCIAL_LICENSE warning

Xiaofeng Yan (1):
  distro_tracking_fields.inc: Modify the status of eds-tools and
    mingetty

Zhai Edwin (2):
  distro-tracking: Update info for webkit-gtk, web-webkit
  runqemu: Fix the wrong path of libGL.so in 64b Ubuntu 11.10

Zumeng Chen (4):
  lttng-ust: Update to 2.0
  lttng-tools: Update to 2.0-pre16
  lttng-modules: Update to 2.0
  babeltrace: Integrated from version 0.8

 meta/classes/base.bbclass                          |   16 +-
 meta/classes/bootimg.bbclass                       |   45 +-
 meta/classes/copyleft_compliance.bbclass           |   56 +-
 meta/classes/image_types.bbclass                   |    7 +-
 meta/classes/image_types_uboot.bbclass             |    6 +-
 meta/classes/insane.bbclass                        |    3 +-
 meta/classes/libc-package.bbclass                  |    3 -
 meta/classes/license.bbclass                       |   30 +
 meta/classes/package.bbclass                       |    7 +-
 meta/classes/packagehistory.bbclass                |  249 -
 meta/conf/bitbake.conf                             |   14 +-
 meta/conf/distro/include/default-distrovars.inc    |    5 -
 meta/conf/distro/include/default-providers.inc     |    2 +
 .../conf/distro/include/distro_tracking_fields.inc |   96 +-
 meta/conf/distro/include/tcmode-default.inc        |    2 +-
 meta/conf/machine/qemuppc.conf                     |    2 +-
 meta/lib/oe/license.py                             |   59 +-
 meta/lib/test.py                                   |    3 +
 meta/recipes-bsp/alsa-state/alsa-state.bb          |   59 +
 meta/recipes-bsp/alsa-state/alsa-state/alsa-state  |   29 +
 meta/recipes-bsp/alsa-state/alsa-state/asound.conf |   12 +
 .../recipes-bsp/alsa-state/alsa-state/asound.state |    1 +
 .../formfactor/files/qemuppc/machconfig            |   10 +
 .../files/grub-1.99_fix_for_automake_1.11.2.patch  | 5888 ++++++++++++++++++++
 meta/recipes-bsp/grub/grub-efi-native_1.99.bb      |    5 +-
 .../pointercal/files/qemuppc/pointercal            |  Bin 0 -> 36 bytes
 .../configure-targets.patch                        |    0
 .../debian/ca.patch                                |    0
 .../debian/config-hurd.patch                       |    0
 .../debian/debian-targets.patch                    |    0
 .../debian/engines-path.patch                      |    0
 .../debian/kfreebsd-pipe.patch                     |    0
 .../debian/make-targets.patch                      |    0
 .../debian/man-dir.patch                           |    0
 .../debian/man-section.patch                       |    0
 .../debian/no-rpath.patch                          |    0
 .../debian/no-symbolic.patch                       |    0
 .../debian/perl-path.diff                          |    0
 .../debian/pic.patch                               |    0
 .../debian/pkg-config.patch                        |    0
 .../debian/rc4-amd64.patch                         |    0
 .../debian/rehash-crt.patch                        |    0
 .../debian/rehash_pod.patch                        |    0
 .../debian/series                                  |    0
 .../debian/shared-lib-ext.patch                    |    0
 .../debian/stddef.patch                            |    0
 .../debian/version-script.patch                    |    0
 .../parallel-make-fix.patch                        |    0
 .../shared-libs.patch                              |    0
 .../configure-targets.patch                        |    0
 .../debian/c_rehash-compat.patch                   |    0
 .../debian/ca.patch                                |    0
 .../debian/debian-targets.patch                    |    0
 .../debian/make-targets.patch                      |    0
 .../debian/man-dir.patch                           |    0
 .../debian/man-section.patch                       |    0
 .../debian/no-rpath.patch                          |    0
 .../debian/no-symbolic.patch                       |    0
 .../debian/pic.patch                               |    0
 .../debian/pkg-config.patch                        |    0
 .../debian/version-script.patch                    |    0
 .../engines-install-in-libdir-ssl.patch            |    0
 .../oe-ldflags.patch                               |    0
 .../openssl-fix-link.patch                         |    0
 .../openssl_fix_for_x32.patch                      |    0
 .../shared-libs.patch                              |    0
 .../{openssl_0.9.8r.bb => openssl_0.9.8s.bb}       |    8 +-
 .../{openssl_1.0.0e.bb => openssl_1.0.0f.bb}       |    8 +-
 .../wpa-supplicant/defconfig.inc                   |    4 -
 .../wpa-supplicant-0.7.3/defconfig-gnutls          |    2 +-
 .../wpa-supplicant-0.7.3/defconfig-gnutls-nogplv3  |  409 --
 .../wpa-supplicant/wpa-supplicant-0.7.inc          |    7 +-
 .../wpa-supplicant/wpa-supplicant_0.7.3.bb         |    2 +-
 meta/recipes-core/dbus/dbus_1.4.16.bb              |    2 +
 meta/recipes-core/eglibc/eglibc-locale.inc         |    2 +-
 meta/recipes-core/ncurses/ncurses.inc              |    6 +-
 meta/recipes-core/tasks/task-base.bb               |    8 +-
 .../btrfs-tools/btrfs-tools_git.bb                 |    4 +-
 .../{diffstat_1.54.bb => diffstat_1.55.bb}         |    6 +-
 .../acinclude.m4                                   |    0
 .../mkdir.patch                                    |    0
 .../quotefix.patch                                 |   45 +-
 meta/recipes-devtools/e2fsprogs/e2fsprogs.inc      |    2 +-
 .../{e2fsprogs_1.41.14.bb => e2fsprogs_1.42.bb}    |    7 +-
 meta/recipes-devtools/libtool/libtool-2.4.2.inc    |    2 +-
 meta/recipes-devtools/m4/m4-native_1.4.16.bb       |    3 +-
 meta/recipes-devtools/m4/m4.inc                    |   19 +
 meta/recipes-devtools/m4/m4_1.4.16.bb              |   19 +-
 meta/recipes-devtools/prelink/prelink_git.bb       |    4 +-
 meta/recipes-devtools/python/python_2.7.2.bb       |    2 +-
 meta/recipes-devtools/tcltk/tcl_8.5.11.bb          |    2 +-
 ...upport-for-PPC-instructions-mfatbu-mfatbl.patch |   94 +
 .../valgrind/valgrind-3.7.0/configure-fix.patch    |   25 +-
 meta/recipes-devtools/valgrind/valgrind_3.7.0.bb   |    5 +-
 .../ghostscript/ghostscript_9.04.bb                |   29 +-
 .../recipes-extended/hdparm/hdparm-6.3/bswap.patch |   37 -
 .../hdparm/hdparm-6.3/uclibc.patch                 |   34 -
 meta/recipes-extended/hdparm/hdparm_6.3.bb         |   18 -
 meta/recipes-extended/hdparm/hdparm_9.37.bb        |   36 +
 .../pam/{libpam_1.1.4.bb => libpam_1.1.5.bb}       |   27 +-
 meta/recipes-extended/stat/stat_3.3.bb             |   26 +
 meta/recipes-graphics/tslib/tslib_1.0.bb           |    1 +
 meta/recipes-graphics/xorg-lib/xorg-lib-common.inc |    2 +-
 .../xorg-proto/xorg-proto-common.inc               |    2 +-
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |    1 +
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb    |    6 +-
 meta/recipes-kernel/linux/linux-yocto_3.0.bb       |   15 +-
 meta/recipes-kernel/lttng-2.0/babeltrace_0.8.bb    |   28 +
 ...modules-replace-KERNELDIR-with-KERNEL_SRC.patch |   41 +
 .../lttng-2.0/lttng-modules_2.0.pre11.bb           |   27 +
 ...tools-fix-compiling-error-for-powerpc-arm.patch |   27 +
 .../lttng-2.0/lttng-tools_2.0-pre16.bb             |   30 +
 meta/recipes-kernel/lttng-2.0/lttng-ust_1.9.4.bb   |   30 +
 .../recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb |    4 +-
 .../gstreamer/gst-fluendo-mp3_0.10.16.bb           |    1 +
 .../gstreamer/gst-openmax_0.10.1.bb                |    1 +
 .../gstreamer/gst-plugins-ugly_0.10.18.bb          |    1 +
 meta/recipes-multimedia/lame/lame_3.99.3.bb        |    2 +
 meta/recipes-multimedia/libmad/libmad_0.15.1b.bb   |    1 +
 meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb |    1 +
 meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb |    1 +
 meta/recipes-qt/qt-apps/qmmp_0.5.2.bb              |    1 +
 .../libpcre/{libpcre_8.20.bb => libpcre_8.21.bb}   |    5 +-
 scripts/contrib/documentation-audit.sh             |    3 +-
 scripts/runqemu                                    |    7 +-
 scripts/runqemu-internal                           |   27 +-
 126 files changed, 6777 insertions(+), 1001 deletions(-)
 delete mode 100644 meta/classes/packagehistory.bbclass
 create mode 100644 meta/lib/test.py
 create mode 100644 meta/recipes-bsp/alsa-state/alsa-state.bb
 create mode 100755 meta/recipes-bsp/alsa-state/alsa-state/alsa-state
 create mode 100644 meta/recipes-bsp/alsa-state/alsa-state/asound.conf
 create mode 100644 meta/recipes-bsp/alsa-state/alsa-state/asound.state
 create mode 100755 meta/recipes-bsp/formfactor/files/qemuppc/machconfig
 create mode 100644 meta/recipes-bsp/grub/files/grub-1.99_fix_for_automake_1.11.2.patch
 create mode 100644 meta/recipes-bsp/pointercal/files/qemuppc/pointercal
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8r => openssl-0.9.8s}/configure-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8r => openssl-0.9.8s}/debian/ca.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8r => openssl-0.9.8s}/debian/config-hurd.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8r => openssl-0.9.8s}/debian/debian-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8r => openssl-0.9.8s}/debian/engines-path.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8r => openssl-0.9.8s}/debian/kfreebsd-pipe.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8r => openssl-0.9.8s}/debian/make-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8r => openssl-0.9.8s}/debian/man-dir.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8r => openssl-0.9.8s}/debian/man-section.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8r => openssl-0.9.8s}/debian/no-rpath.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8r => openssl-0.9.8s}/debian/no-symbolic.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8r => openssl-0.9.8s}/debian/perl-path.diff (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8r => openssl-0.9.8s}/debian/pic.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8r => openssl-0.9.8s}/debian/pkg-config.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8r => openssl-0.9.8s}/debian/rc4-amd64.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8r => openssl-0.9.8s}/debian/rehash-crt.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8r => openssl-0.9.8s}/debian/rehash_pod.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8r => openssl-0.9.8s}/debian/series (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8r => openssl-0.9.8s}/debian/shared-lib-ext.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8r => openssl-0.9.8s}/debian/stddef.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8r => openssl-0.9.8s}/debian/version-script.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8r => openssl-0.9.8s}/parallel-make-fix.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8r => openssl-0.9.8s}/shared-libs.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0e => openssl-1.0.0f}/configure-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0e => openssl-1.0.0f}/debian/c_rehash-compat.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0e => openssl-1.0.0f}/debian/ca.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0e => openssl-1.0.0f}/debian/debian-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0e => openssl-1.0.0f}/debian/make-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0e => openssl-1.0.0f}/debian/man-dir.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0e => openssl-1.0.0f}/debian/man-section.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0e => openssl-1.0.0f}/debian/no-rpath.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0e => openssl-1.0.0f}/debian/no-symbolic.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0e => openssl-1.0.0f}/debian/pic.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0e => openssl-1.0.0f}/debian/pkg-config.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0e => openssl-1.0.0f}/debian/version-script.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0e => openssl-1.0.0f}/engines-install-in-libdir-ssl.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0e => openssl-1.0.0f}/oe-ldflags.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0e => openssl-1.0.0f}/openssl-fix-link.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0e => openssl-1.0.0f}/openssl_fix_for_x32.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0e => openssl-1.0.0f}/shared-libs.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl_0.9.8r.bb => openssl_0.9.8s.bb} (87%)
 rename meta/recipes-connectivity/openssl/{openssl_1.0.0e.bb => openssl_1.0.0f.bb} (84%)
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/defconfig.inc
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/defconfig-gnutls-nogplv3
 rename meta/recipes-devtools/diffstat/{diffstat_1.54.bb => diffstat_1.55.bb} (82%)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.41.14 => e2fsprogs-1.42}/acinclude.m4 (100%)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.41.14 => e2fsprogs-1.42}/mkdir.patch (100%)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.41.14 => e2fsprogs-1.42}/quotefix.patch (40%)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.41.14.bb => e2fsprogs_1.42.bb} (92%)
 create mode 100644 meta/recipes-devtools/m4/m4.inc
 create mode 100644 meta/recipes-devtools/valgrind/valgrind-3.7.0/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch
 delete mode 100644 meta/recipes-extended/hdparm/hdparm-6.3/bswap.patch
 delete mode 100644 meta/recipes-extended/hdparm/hdparm-6.3/uclibc.patch
 delete mode 100644 meta/recipes-extended/hdparm/hdparm_6.3.bb
 create mode 100644 meta/recipes-extended/hdparm/hdparm_9.37.bb
 rename meta/recipes-extended/pam/{libpam_1.1.4.bb => libpam_1.1.5.bb} (85%)
 create mode 100644 meta/recipes-extended/stat/stat_3.3.bb
 create mode 100644 meta/recipes-kernel/lttng-2.0/babeltrace_0.8.bb
 create mode 100644 meta/recipes-kernel/lttng-2.0/lttng-modules/lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch
 create mode 100644 meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.pre11.bb
 create mode 100644 meta/recipes-kernel/lttng-2.0/lttng-tools/lttng-tools-fix-compiling-error-for-powerpc-arm.patch
 create mode 100644 meta/recipes-kernel/lttng-2.0/lttng-tools_2.0-pre16.bb
 create mode 100644 meta/recipes-kernel/lttng-2.0/lttng-ust_1.9.4.bb
 rename meta/recipes-support/libpcre/{libpcre_8.20.bb => libpcre_8.21.bb} (93%)

-- 
1.7.6.5



