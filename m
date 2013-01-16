Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TvO6L-0005bn-DH
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Jan 2013 09:12:06 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 15 Jan 2013 23:56:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,476,1355126400"; d="scan'208";a="274358861"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.213])
	by fmsmga001.fm.intel.com with ESMTP; 15 Jan 2013 23:56:38 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2013 23:56:38 -0800
Message-Id: <cover.1358322515.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
MIME-Version: 1.0
Subject: [CONSOLIDATED PULL 00/50] automake, read-only, mutlilib, and updates
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
X-List-Received-Date: Wed, 16 Jan 2013 08:12:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Richard,

This set contains updates from Marko for automake 1.13 update along
with some LIC_FILE_CHKSUM update.  Some packe update (I reorded the 
connman Update correctly).

Constaintin provided a multilib target gcc recipe, which build and Qi
Chen has the read-only, initial pass looks good, I know he has tested 
it, we will need to add read-only to the test matrix.

There was an oprofile fix from Bogdan, but Matthew is working on a proper
fix to include libpfm instead.

Check the AB for latest build status.

Sau!


The following changes since commit 6080d1dc719c38fd97c2abd38e0ad938fbf6f452:

  connman: fixed init script so connman can runs over nfs (2013-01-15 08:09:30 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Andrei Dinu (1):
  Removed undisplayed picture from connman-gnome

Chen Qi (7):
  runqemu scripts: add support for booting an ISO image
  sysvinit: add ROOTFS_READ_ONLY variable to rcS-default
  image.bbclass: add a hook funtion to support readonly rootfs
  core-image.bbclass: support read-only rootfs
  initscripts: support read-only rootfs
  volatile-conf-minimal: add recipe
  volatile-conf-sato: add recipe

Constantin Musca (5):
  gcc: remove the 64bithack patch
  multilib.conf: add TARGET_ARCH to MULTILIB_SAVE_VARNAME
  gcc: enable multilib for target gcc
  tune-mips32: add BASE_LIB to mips32 tunes
  tune-ppc603e: add BASE_LIB

Cristian Iorga (6):
  db: upgrade to 5.3.21
  iproute2: upgrade to v3.7.0
  quota: upgrade to 4.01
  qemu: machine override ability added
  connman-conf: configures connman in qemu machines
  connman: upgrade to 1.10

Emilia Ciobanu (1):
  distrodata: Updated checkpkg task

Eric Bénard (1):
  add meta-toolchain-qt

Jesse Zhang (1):
  coreutils: remove dependency on coreutils-native

Marko Lindqvist (21):
  polkit: replace obsolete automake macros with working ones
  pango: replace obsolete automake macros with working ones
  libxsettings-client: replace obsolete automake macros with working
    ones
  rgb: replace obsolete automake macros with working ones
  sysfsutils: replace obsolete automake macros with working ones
  vte: replace obsolete automake macros with working ones
  libtirpc: replace obsolete automake macros with working ones
  curl: fix build with automake-1.13
  bluez-hcidump: replace obsolete automake macros with working ones
  alsa-utils: replace obsolete automake macros with working ones
  tremor: replace obsolete automake macros with working ones
  ofono: replace obsolete automake macros with working ones
  libidn: add checksums to version 0.6.14 recipe
  gzip: fix license segment md5sum boundary
  iptables: fix license segment md5sum boundary
  shadow: fix license segment md5sum boundary
  ethtool: fix license segment md5sum boundary
  gperf: fix license segment md5sum boundary
  libidn: fix license segment md5sum boundary
  dbus: fix license segment md5sum boundary
  apmd: fix license segment md5sum boundary

Muhammad Shakeel (2):
  archiver class: Use tasks with sstate instead of pre/post funcs
  archive-*-source.bbclass: Handle all package classes

Robert P. J. Day (1):
  image_types.bbclass: Add and update comments regarding image types.

Saul Wold (1):
  xz: LICENSE field is wrong

Tom Zanussi (3):
  lttng: remove 'legacy' lttng
  lttng2-ust: rename to lttng-ust
  recipes-kernel/lttng-2.0: rename to recipes-kernel/lttng

 meta/classes/archive-configured-source.bbclass     |  66 ++++-
 meta/classes/archive-original-source.bbclass       |  66 ++++-
 meta/classes/archive-patched-source.bbclass        |  66 ++++-
 meta/classes/archiver.bbclass                      |  40 ++-
 meta/classes/core-image.bbclass                    |   5 +-
 meta/classes/distrodata.bbclass                    | 179 +++++++++----
 meta/classes/image.bbclass                         |  16 +-
 meta/classes/image_types.bbclass                   |   5 +-
 meta/conf/layer.conf                               |   1 +
 meta/conf/machine/include/qemu.inc                 |   2 +
 meta/conf/machine/include/tune-mips32.inc          |   4 +
 meta/conf/machine/include/tune-ppc603e.inc         |   1 +
 meta/conf/multilib.conf                            |   2 +-
 meta/recipes-bsp/apmd/apmd_3.2.2-14.bb             |   2 +-
 .../obsolete_automake_macros.patch                 |  14 +
 .../bluez/bluez-hcidump_2.5.bb                     |   6 +-
 meta/recipes-connectivity/connman/connman-conf.bb  |  18 ++
 .../connman/connman-conf/qemuall/main.conf         |   3 +
 ...oved-icon-from-connman-gnome-about-applet.patch |  35 +++
 .../connman/connman-gnome_0.7.bb                   |   3 +-
 ...If-there-is-no-d_type-support-use-fstatat.patch |  61 -----
 ...If-there-is-no-d_type-support-use-fstatat.patch |  38 +--
 .../connman/inet-fix-ip-cleanup-functions.patch    |  40 +++
 .../connman/{connman_1.4.bb => connman_1.10.bb}    |   8 +-
 .../iproute2/iproute2-3.5.1/configure-cross.patch  |  77 ------
 .../iproute2/iproute2/configure-cross.patch        |  32 +++
 .../{iproute2_3.5.1.bb => iproute2_3.7.0.bb}       |   6 +-
 .../ofono-1.12/obsolete_automake_macros.patch      |  14 +
 meta/recipes-connectivity/ofono/ofono_1.12.bb      |   4 +-
 meta/recipes-core/coreutils/coreutils_6.9.bb       |   3 +-
 meta/recipes-core/dbus/dbus-glib.inc               |   2 +-
 meta/recipes-core/dbus/dbus-ptest_1.6.4.bb         |   2 +-
 meta/recipes-core/dbus/dbus.inc                    |   2 +-
 meta/recipes-core/images/core-image-minimal.bb     |   3 +
 .../initscripts/initscripts-1.0/bootmisc.sh        |   9 +-
 .../initscripts-1.0/populate-volatile.sh           | 281 ++++++++++-----------
 .../initscripts/initscripts-1.0/volatiles          |   1 +
 meta/recipes-core/initscripts/initscripts_1.0.bb   |   1 +
 .../packagegroup-core-tools-profile.bb             |   2 +-
 .../files/volatiles-readonly-minimal               |   8 +
 .../volatile-conf-minimal_1.0.bb                   |  15 ++
 .../obsolete_automake_macros.patch                 |  15 ++
 meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb   |   3 +-
 meta/recipes-core/sysvinit/sysvinit/rcS-default    |   4 +
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb     |   2 +-
 meta/recipes-devtools/gcc/gcc-4.7.inc              |   3 +-
 meta/recipes-devtools/gcc/gcc-4.7/64bithack.patch  |  63 -----
 meta/recipes-devtools/gcc/gcc-common.inc           |  25 ++
 meta/recipes-devtools/gcc/gcc-configure-common.inc |   3 +-
 meta/recipes-devtools/gcc/gcc-configure-target.inc |   1 +
 meta/recipes-devtools/gcc/gcc-multilib-config.inc  | 198 +++++++++++++++
 meta/recipes-devtools/gcc/libgcc_4.7.bb            |  44 ++++
 meta/recipes-extended/ethtool/ethtool_3.7.bb       |   2 +-
 meta/recipes-extended/gperf/gperf.inc              |   2 +-
 meta/recipes-extended/gperf/gperf_3.0.3.bb         |   2 +-
 meta/recipes-extended/gzip/gzip.inc                |   2 +-
 .../recipes-extended/iptables/iptables_1.4.16.3.bb |   2 +-
 meta/recipes-extended/libidn/libidn_0.6.14.bb      |   7 +-
 .../libtirpc-0.2.2/obsolete_automake_macros.patch  |  15 ++
 meta/recipes-extended/libtirpc/libtirpc_0.2.2.bb   |   4 +-
 .../polkit-0.104/obsolete_automake_macros.patch    |  23 ++
 meta/recipes-extended/polkit/polkit_0.104.bb       |   3 +-
 .../quota/{quota_4.00.bb => quota_4.01.bb}         |   4 +-
 .../shadow/shadow-native_4.1.4.3.bb                |   2 +-
 meta/recipes-extended/shadow/shadow_4.1.4.3.bb     |   2 +-
 meta/recipes-extended/xz/xz_5.1.2alpha.bb          |   2 +-
 .../obsolete_automake_macros.patch                 |  14 +
 .../libxsettings-client_0.10.bb                    |   6 +-
 .../pango-1.32.5/obsolete_automake_macros.patch    |  15 ++
 meta/recipes-graphics/pango/pango_1.32.5.bb        |   6 +-
 .../rgb-1.0.4/obsolete_automake_macros.patch       |  15 ++
 meta/recipes-graphics/xorg-app/rgb_1.0.4.bb        |   4 +-
 .../{lttng-2.0 => lttng}/babeltrace_1.0.0.bb       |   0
 meta/recipes-kernel/lttng/lttng-control_0.89.bb    |  23 --
 ...modules-replace-KERNELDIR-with-KERNEL_SRC.patch |   0
 .../{lttng-2.0 => lttng}/lttng-modules_2.1.0.bb    |   0
 .../{lttng-2.0 => lttng}/lttng-tools_2.1.0.bb      |   2 +-
 meta/recipes-kernel/lttng/lttng-ust_0.16.bb        |  32 ---
 .../lttng-ust_2.1.0.bb}                            |   5 +
 .../lttng-viewer/add_linkage_to_lttvwindow.patch   |  42 ---
 meta/recipes-kernel/lttng/lttng-viewer_0.12.38.bb  |  40 ---
 .../obsolete_automake_macros.patch                 |  15 ++
 meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb  |   3 +-
 .../tremor-20120314/obsolete_automake_macros.patch |  15 ++
 meta/recipes-multimedia/tremor/tremor_20120314.bb  |   6 +-
 meta/recipes-qt/meta/meta-toolchain-qt.bb          |   5 +
 meta/recipes-qt/meta/meta-toolchain-qt.inc         |  31 +++
 meta/recipes-qt/meta/meta-toolchain-qte.bb         |  32 +--
 .../nativesdk-packagegroup-qt-toolchain-host.bb    |   3 +
 .../nativesdk-packagegroup-qt-toolchain-host.inc   |   6 +
 .../nativesdk-packagegroup-qte-toolchain-host.bb   |   5 +-
 .../packagegroup-qt-toolchain-target.bb            |  11 +
 .../packagegroup-qt-toolchain-target.inc           |  33 +++
 .../packagegroup-qte-toolchain-target.bb           |  32 +--
 meta/recipes-sato/images/core-image-sato.bb        |   3 +
 .../files/volatiles-readonly-sato                  |  14 +
 .../volatile-conf-sato_1.0.bb                      |  15 ++
 .../dont_override_ac_config_macro_dir.patch        |  30 +++
 .../curl-7.28.1/obsolete_automake_macros.patch     |  14 +
 meta/recipes-support/curl/curl_7.28.1.bb           |   7 +-
 .../db/{db_5.3.15.bb => db_5.3.21.bb}              |   8 +-
 .../vte/vte-0.28.2/obsolete_automake_macros.patch  |  14 +
 meta/recipes-support/vte/vte_0.28.2.bb             |   4 +-
 scripts/runqemu                                    |   6 +
 scripts/runqemu-internal                           |   7 +
 105 files changed, 1401 insertions(+), 698 deletions(-)
 create mode 100644 meta/recipes-connectivity/bluez/bluez-hcidump-2.5/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-connectivity/connman/connman-conf.bb
 create mode 100644 meta/recipes-connectivity/connman/connman-conf/qemuall/main.conf
 create mode 100644 meta/recipes-connectivity/connman/connman-gnome/0001-Removed-icon-from-connman-gnome-about-applet.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman/0001-timezone.c-If-there-is-no-d_type-support-use-fstatat.patch
 create mode 100644 meta/recipes-connectivity/connman/connman/inet-fix-ip-cleanup-functions.patch
 rename meta/recipes-connectivity/connman/{connman_1.4.bb => connman_1.10.bb} (71%)
 delete mode 100644 meta/recipes-connectivity/iproute2/iproute2-3.5.1/configure-cross.patch
 create mode 100644 meta/recipes-connectivity/iproute2/iproute2/configure-cross.patch
 rename meta/recipes-connectivity/iproute2/{iproute2_3.5.1.bb => iproute2_3.7.0.bb} (61%)
 create mode 100644 meta/recipes-connectivity/ofono/ofono-1.12/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-core/readonly-volatile-conf/files/volatiles-readonly-minimal
 create mode 100644 meta/recipes-core/readonly-volatile-conf/volatile-conf-minimal_1.0.bb
 create mode 100644 meta/recipes-core/sysfsutils/sysfsutils-2.1.0/obsolete_automake_macros.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.7/64bithack.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-multilib-config.inc
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc-0.2.2/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-extended/polkit/polkit-0.104/obsolete_automake_macros.patch
 rename meta/recipes-extended/quota/{quota_4.00.bb => quota_4.01.bb} (85%)
 create mode 100644 meta/recipes-graphics/libxsettings-client/libxsettings-client/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-graphics/pango/pango-1.32.5/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-graphics/xorg-app/rgb-1.0.4/obsolete_automake_macros.patch
 rename meta/recipes-kernel/{lttng-2.0 => lttng}/babeltrace_1.0.0.bb (100%)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-control_0.89.bb
 rename meta/recipes-kernel/{lttng-2.0 => lttng}/lttng-modules/lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch (100%)
 rename meta/recipes-kernel/{lttng-2.0 => lttng}/lttng-modules_2.1.0.bb (100%)
 rename meta/recipes-kernel/{lttng-2.0 => lttng}/lttng-tools_2.1.0.bb (97%)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-ust_0.16.bb
 rename meta/recipes-kernel/{lttng-2.0/lttng2-ust_2.1.0.bb => lttng/lttng-ust_2.1.0.bb} (87%)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-viewer/add_linkage_to_lttvwindow.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-viewer_0.12.38.bb
 create mode 100644 meta/recipes-multimedia/alsa/alsa-utils-1.0.25/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-multimedia/tremor/tremor-20120314/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-qt/meta/meta-toolchain-qt.bb
 create mode 100644 meta/recipes-qt/meta/meta-toolchain-qt.inc
 create mode 100644 meta/recipes-qt/packagegroups/nativesdk-packagegroup-qt-toolchain-host.bb
 create mode 100644 meta/recipes-qt/packagegroups/nativesdk-packagegroup-qt-toolchain-host.inc
 create mode 100644 meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.bb
 create mode 100644 meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.inc
 create mode 100644 meta/recipes-sato/readonly-volatile-conf/files/volatiles-readonly-sato
 create mode 100644 meta/recipes-sato/readonly-volatile-conf/volatile-conf-sato_1.0.bb
 create mode 100644 meta/recipes-support/curl/curl-7.28.1/dont_override_ac_config_macro_dir.patch
 create mode 100644 meta/recipes-support/curl/curl-7.28.1/obsolete_automake_macros.patch
 rename meta/recipes-support/db/{db_5.3.15.bb => db_5.3.21.bb} (93%)
 create mode 100644 meta/recipes-support/vte/vte-0.28.2/obsolete_automake_macros.patch

-- 
1.8.0.2



