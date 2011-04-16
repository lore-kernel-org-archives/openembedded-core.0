Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QAzPo-00069F-4N
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Apr 2011 08:55:33 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 15 Apr 2011 23:53:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,223,1301900400"; d="scan'208";a="734219438"
Received: from unknown (HELO localhost) ([10.255.12.232])
	by orsmga001.jf.intel.com with ESMTP; 15 Apr 2011 23:53:09 -0700
Message-Id: <cover.1302936483.git.sgw@linux.intel.com>
Old-Date: Fri, 15 Apr 2011 23:48:03 -0700
Date: Fri, 15 Apr 2011 23:53:08 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Sat, 16 Apr 2011 12:03:17 +0200
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Jingdong Lu <jingdong.lu@windriver.com>, Kang Kai <kai.kang@windriver.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>
Subject: [PATCH 00/58] Consolidated Updates and Bug Fixes
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
X-List-Received-Date: Sat, 16 Apr 2011 06:55:33 -0000

From: Saul Wold <sgw@linux.intel.com>

Richard, 

Folks have been busy while we were away at ELC!

There are package updates, patch classifications, and bug fixes 
including some CVEs that need to be back ported to 1.0.1

I still don't have access to openembedded-core-contrib, so please 
find these in the poky-contrib area.

Clutter-1.6 has a dependency on json-glib, which Joshua will be fixing
next week, it's not an issue for most builds right now.

I did rejects some patches due to issue with build or patch classificiations.

Hope we can get these in for next week.

Thanks
	Sau!



Pull URL: git://git.yoctoproject.org/poky-contrib.git
  Branch: distro/oe-core
  Browse: http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=distro/oe-core

Thanks,
    Saul Wold <sgw@linux.intel.com>
---


Dexuan Cui (13):
  oprofileui: upgrade to latest git version
  libxt: update from 1.0.9 to the latest version 1.1.1
  libxi: upgrade from 1.4.0 to the latest version 1.4.2
  fixesproto: upgrade from 4.1.2 to the latest version 5.0
  xproto: upgrade from 7.0.20 to the latest version 7.0.21
  gnome-doc-utils: upgrade from 0.20.4 to the latest version 0.20.5
  xextproto: upgrade from 7.1.2 to the latest version 7.2.0
  libpciaccess: upgrade from 0.12.0 to the latest version 0.12.1
  cronie: upgrade from 1.4.6 to the latest version 1.4.7
  preferred-xorg-versions.inc: update libxt, libxi, fixesproto, xproto,
    xextproto and libpciaccess
  distro_tracking_fields.inc: update the info for the following recipes
  gnu-config-native: add dependency on perl-native
  libnewt: fix parallel-make issue

Dongxiao Xu (13):
  gstreamer: upgrade to vesion 0.10.32
  gst-plugins-base: upgrade to version 0.10.32
  gst-plugins-good: upgrade to version 0.10.28
  gst-plugins-bad: upgrade to version 0.10.21
  gst-plugins-ugly: upgrade to version 0.10.17
  ofono: upgrade to version 0.45
  alsa-lib: upgrade to version 1.0.24.1
  telepathy-glib: upgrade to version 0.14.3
  telepathy-idle: upgrade to version 0.1.8
  telepathy-mission-control: upgrade to version 5.7.9
  gssdp: upgrade to version 0.10.0
  gupnp: upgrade to version 0.16.0
  distro_tracking_fields: update for gstreamer, gupnp, telepathy-glib,
    etc

Gary Thomas (1):
  setuptools: Make options for setup.py more flexible

Jingdong Lu (2):
  gcc: Add "--enable-clocale=gnu" option for LSB.
  poky-lsb: Add "largefile" feature for LSB distro.

Joshua Lock (1):
  clutter-1.6: fix tarball md5sum and add json-glib to dependencies

Kang Kai (1):
  jpeg: add link libjpeg.so.62 for LSB library test

Paul Eggleton (2):
  netbase: automatically bring up eth0
  netbase: add /etc/network/interfaces file for qemumips & qemuppc

Qing He (4):
  libexif: upgrade to 0.6.20
  libxml2: upgrade to version 2.7.8
  openssl: upgrade to version 0.9.8r
  rsync: upgrade to version 3.0.8

Saul Wold (1):
  slang: Update to 2.2.4

Scott Rifenbark (4):
  documentation/adt-manual/adt-eclipse.xml: Fixed link to autotools.
  documentation/adt-manual/adt-prepare.xml: Fixed URL for nightly
    builds
  documentation/adt-manual/adt-eclipse.xml: Fixed URL with
    pokylinux.org
  documentation/kernel-manual/kernel-how-to.xml: replaced 'pokylinux'
    with 'yoctoproject'

Xiaofeng Yan (1):
  task-poky-lsb.bb:Add locale resoures which is needed by LSB Test
    Suite

Yu Ke (9):
  xf86-input-synaptics: upgrade from 1.3.0 to 1.4.0
  xf86-input-vmmouse: upgrade from 12.6.10 to 12.7.0
  evieext: upgrade from 1.1.0 to 1.1.1
  xf86-input-keyboard: upgrade from 1.5.0 to 1.6.0
  xkbcomp: upgrade from 1.2.0 to 1.2.1
  libdrm: upgrade from 2.4.23 to 2.4.25
  mesa: upgrade to 7.10.2
  xf86-input-mouse: upgrade from 1.6 to 1.7
  pango: upgrade from 1.28.3 to 1.28.4

Zhai Edwin (6):
  libsoup-2.4: Upgrade to 2.32.2 (from 2.32.1)
  x11perf: Upgrade to 1.5.3 (from 1.5.2)
  libcanberry: Upgrade to 0.28 (from 0.26)
  xz: Upgrade to 5.0.2 (from 5.0.0)
  polkit-gnome: Upgrade to 0.101 (from 0.99)
  qemu: Fix the qemu GL application start failure.

 documentation/adt-manual/adt-eclipse.xml           |    4 +-
 documentation/adt-manual/adt-prepare.xml           |    2 +-
 documentation/kernel-manual/kernel-how-to.xml      |    4 +-
 meta/classes/setuptools.bbclass                    |    3 +-
 .../conf/distro/include/distro_tracking_fields.inc |  189 +-
 .../conf/distro/include/poky-default-revisions.inc |    2 +-
 .../distro/include/preferred-xorg-versions.inc     |   34 +-
 meta/conf/distro/poky-lsb.conf                     |    2 +-
 .../{files => gssdp-0.10.0}/introspection.patch    |    5 +-
 .../gupnp/{gssdp_0.9.0.bb => gssdp_0.10.0.bb}      |    4 +-
 .../gupnp/{gupnp_0.14.0.bb => gupnp_0.16.0.bb}     |    7 +-
 meta/recipes-connectivity/ofono/ofono_0.37.bb      |    9 -
 meta/recipes-connectivity/ofono/ofono_0.45.bb      |    9 +
 .../configure-targets.patch                        |    1 +
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
 .../parallel-make-fix.patch                        |    2 +
 .../shared-libs.patch                              |    2 +
 meta/recipes-connectivity/openssl/openssl.inc      |    2 +-
 .../{openssl_0.9.8p.bb => openssl_0.9.8r.bb}       |    6 +-
 ...thy-glib_0.13.6.bb => telepathy-glib_0.14.3.bb} |    4 +-
 ...pathy-idle_0.1.7.bb => telepathy-idle_0.1.8.bb} |    4 +-
 ...5.7.1.bb => telepathy-mission-control_5.7.9.bb} |    4 +-
 meta/recipes-core/jpeg/jpeg_8b.bb                  |   13 +-
 .../recipes-core/libxml/libxml2/libxml-64bit.patch |    2 +
 meta/recipes-core/libxml/libxml2_2.7.7.bb          |    6 -
 meta/recipes-core/libxml/libxml2_2.7.8.bb          |    6 +
 meta/recipes-core/netbase/netbase-4.45/interfaces  |    1 +
 .../netbase/netbase-4.45/qemumips/interfaces       |    8 +
 .../netbase/netbase-4.45/qemuppc/interfaces        |    8 +
 meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb     |    3 +-
 .../gnu-config/config-guess-uclibc.patch           |    2 +
 .../gnu-config/gnu-config_20080123.bb              |    6 +-
 .../qemu/qemu-0.14.0/qemugl-fix.patch              |   73 +
 meta/recipes-devtools/qemu/qemu_0.14.0.bb          |    1 +
 .../rsync/{rsync_3.0.7.bb => rsync_3.0.8.bb}       |    6 +-
 .../cronie/{cronie_1.4.6.bb => cronie_1.4.7.bb}    |    4 +-
 .../newt/files/fix_SHAREDDIR.patch                 |   29 +
 .../newt/files/include-without-python.patch        |    2 +
 .../newt/files/remove_slang_include.patch          |   13 +
 meta/recipes-extended/newt/libnewt_0.52.12.bb      |    8 +-
 ...{polkit-gnome_0.99.bb => polkit-gnome_0.101.bb} |    4 +-
 meta/recipes-extended/slang/slang/fix-uclibc.patch |   11 -
 .../slang/{slang_2.2.2.bb => slang_2.2.4.bb}       |   18 +-
 meta/recipes-extended/tasks/task-poky-lsb.bb       |   10 +-
 .../xz/{xz_5.0.0.bb => xz_5.0.2.bb}                |    4 +-
 ...c-utils_0.20.4.bb => gnome-doc-utils_0.20.5.bb} |    4 +-
 meta/recipes-graphics/clutter/clutter-1.6_1.6.8.bb |    5 +-
 .../drm/libdrm-2.4.23/installtests.patch           |   43 -
 .../drm/libdrm-2.4.25/installtests.patch           |   49 +
 .../drm/{libdrm_2.4.23.bb => libdrm_2.4.25.bb}     |    5 +-
 .../mesa/files/talloc-removal.patch                |15571 --------------------
 .../mesa/{mesa-dri_7.10.bb => mesa-dri_7.10.2.bb}  |    7 +-
 .../{mesa-xlib_7.10.bb => mesa-xlib_7.10.2.bb}     |    7 +-
 .../{pango-1.28.3 => pango-1.28.4}/no-tests.patch  |    4 +
 .../pango/{pango_1.28.3.bb => pango_1.28.4.bb}     |    4 +-
 .../{x11perf_1.5.2.bb => x11perf_1.5.3.bb}         |    4 +-
 .../xorg-app/xkbcomp/cross-compile-fix.patch       |   35 -
 .../{xkbcomp_1.2.0.bb => xkbcomp_1.2.1.bb}         |    5 +-
 ...board_1.5.0.bb => xf86-input-keyboard_1.6.0.bb} |    4 +-
 .../xorg-driver/xf86-input-mouse/unbreak.patch     |    2 +
 ...ut-mouse_1.6.0.bb => xf86-input-mouse_1.7.0.bb} |    4 +-
 ...tics_1.3.0.bb => xf86-input-synaptics_1.4.0.bb} |    4 +-
 ...use_12.6.10.bb => xf86-input-vmmouse_12.7.0.bb} |    4 +-
 ...bpciaccess_0.12.0.bb => libpciaccess_0.12.1.bb} |    6 +-
 .../xorg-lib/{libxi_1.4.0.bb => libxi_1.4.2.bb}    |    5 +-
 .../xorg-lib/{libxt_1.0.9.bb => libxt_1.1.1.bb}    |    6 +-
 .../{evieext_1.1.0.bb => evieext_1.1.1.bb}         |    8 +-
 .../{fixesproto_4.1.2.bb => fixesproto_5.0.bb}     |    8 +-
 .../{xextproto_7.1.2.bb => xextproto_7.2.0.bb}     |    6 +-
 .../{xproto_7.0.20.bb => xproto_7.0.21.bb}         |    6 +-
 .../oprofileui/dso_linking_change_build_fix.patch  |    2 +
 meta/recipes-kernel/oprofile/oprofileui_git.bb     |    2 +-
 .../fix-tstamp-declaration.patch                   |    2 +
 .../unbreak_plugindir.patch                        |    2 +
 .../{alsa-lib_1.0.23.bb => alsa-lib_1.0.24.1.bb}   |    4 +-
 ...s-bad_0.10.20.bb => gst-plugins-bad_0.10.21.bb} |    6 +-
 .../gst-plugins-base-tremor.patch                  |    2 +
 ...base_0.10.31.bb => gst-plugins-base_0.10.32.bb} |    6 +-
 ...good_0.10.26.bb => gst-plugins-good_0.10.28.bb} |    6 +-
 ...ugly_0.10.16.bb => gst-plugins-ugly_0.10.17.bb} |    3 +
 .../check_fix.patch                                |    2 +
 .../gst-inspect-check-error.patch                  |    2 +
 .../gstregistrybinary.c                            |    0
 .../gstregistrybinary.h                            |    0
 .../{gstreamer_0.10.31.bb => gstreamer_0.10.32.bb} |    4 +-
 .../{libcanberra_0.26.bb => libcanberra_0.28.bb}   |    4 +-
 .../{libexif_0.6.16.bb => libexif_0.6.20.bb}       |    6 +-
 ...libsoup-2.4_2.32.1.bb => libsoup-2.4_2.32.2.bb} |    4 +-
 107 files changed, 488 insertions(+), 15912 deletions(-)
 rename meta/recipes-connectivity/gupnp/{files => gssdp-0.10.0}/introspection.patch (97%)
 rename meta/recipes-connectivity/gupnp/{gssdp_0.9.0.bb => gssdp_0.10.0.bb} (83%)
 rename meta/recipes-connectivity/gupnp/{gupnp_0.14.0.bb => gupnp_0.16.0.bb} (85%)
 delete mode 100644 meta/recipes-connectivity/ofono/ofono_0.37.bb
 create mode 100644 meta/recipes-connectivity/ofono/ofono_0.45.bb
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8p => openssl-0.9.8r}/configure-targets.patch (97%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8p => openssl-0.9.8r}/debian/ca.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8p => openssl-0.9.8r}/debian/config-hurd.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8p => openssl-0.9.8r}/debian/debian-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8p => openssl-0.9.8r}/debian/engines-path.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8p => openssl-0.9.8r}/debian/kfreebsd-pipe.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8p => openssl-0.9.8r}/debian/make-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8p => openssl-0.9.8r}/debian/man-dir.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8p => openssl-0.9.8r}/debian/man-section.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8p => openssl-0.9.8r}/debian/no-rpath.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8p => openssl-0.9.8r}/debian/no-symbolic.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8p => openssl-0.9.8r}/debian/perl-path.diff (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8p => openssl-0.9.8r}/debian/pic.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8p => openssl-0.9.8r}/debian/pkg-config.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8p => openssl-0.9.8r}/debian/rc4-amd64.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8p => openssl-0.9.8r}/debian/rehash-crt.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8p => openssl-0.9.8r}/debian/rehash_pod.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8p => openssl-0.9.8r}/debian/series (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8p => openssl-0.9.8r}/debian/shared-lib-ext.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8p => openssl-0.9.8r}/debian/stddef.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8p => openssl-0.9.8r}/debian/version-script.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8p => openssl-0.9.8r}/parallel-make-fix.patch (95%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8p => openssl-0.9.8r}/shared-libs.patch (97%)
 rename meta/recipes-connectivity/openssl/{openssl_0.9.8p.bb => openssl_0.9.8r.bb} (86%)
 rename meta/recipes-connectivity/telepathy/{telepathy-glib_0.13.6.bb => telepathy-glib_0.14.3.bb} (80%)
 rename meta/recipes-connectivity/telepathy/{telepathy-idle_0.1.7.bb => telepathy-idle_0.1.8.bb} (81%)
 rename meta/recipes-connectivity/telepathy/{telepathy-mission-control_5.7.1.bb => telepathy-mission-control_5.7.9.bb} (92%)
 delete mode 100644 meta/recipes-core/libxml/libxml2_2.7.7.bb
 create mode 100644 meta/recipes-core/libxml/libxml2_2.7.8.bb
 create mode 100644 meta/recipes-core/netbase/netbase-4.45/qemumips/interfaces
 create mode 100644 meta/recipes-core/netbase/netbase-4.45/qemuppc/interfaces
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.14.0/qemugl-fix.patch
 rename meta/recipes-devtools/rsync/{rsync_3.0.7.bb => rsync_3.0.8.bb} (71%)
 rename meta/recipes-extended/cronie/{cronie_1.4.6.bb => cronie_1.4.7.bb} (93%)
 create mode 100644 meta/recipes-extended/newt/files/fix_SHAREDDIR.patch
 create mode 100644 meta/recipes-extended/newt/files/remove_slang_include.patch
 rename meta/recipes-extended/polkit/{polkit-gnome_0.99.bb => polkit-gnome_0.101.bb} (86%)
 delete mode 100644 meta/recipes-extended/slang/slang/fix-uclibc.patch
 rename meta/recipes-extended/slang/{slang_2.2.2.bb => slang_2.2.4.bb} (61%)
 rename meta/recipes-extended/xz/{xz_5.0.0.bb => xz_5.0.2.bb} (82%)
 rename meta/recipes-gnome/gnome/{gnome-doc-utils_0.20.4.bb => gnome-doc-utils_0.20.5.bb} (53%)
 delete mode 100644 meta/recipes-graphics/drm/libdrm-2.4.23/installtests.patch
 create mode 100644 meta/recipes-graphics/drm/libdrm-2.4.25/installtests.patch
 rename meta/recipes-graphics/drm/{libdrm_2.4.23.bb => libdrm_2.4.25.bb} (54%)
 delete mode 100644 meta/recipes-graphics/mesa/files/talloc-removal.patch
 rename meta/recipes-graphics/mesa/{mesa-dri_7.10.bb => mesa-dri_7.10.2.bb} (85%)
 rename meta/recipes-graphics/mesa/{mesa-xlib_7.10.bb => mesa-xlib_7.10.2.bb} (68%)
 rename meta/recipes-graphics/pango/{pango-1.28.3 => pango-1.28.4}/no-tests.patch (72%)
 rename meta/recipes-graphics/pango/{pango_1.28.3.bb => pango_1.28.4.bb} (50%)
 rename meta/recipes-graphics/xorg-app/{x11perf_1.5.2.bb => x11perf_1.5.3.bb} (76%)
 delete mode 100644 meta/recipes-graphics/xorg-app/xkbcomp/cross-compile-fix.patch
 rename meta/recipes-graphics/xorg-app/{xkbcomp_1.2.0.bb => xkbcomp_1.2.1.bb} (72%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-keyboard_1.5.0.bb => xf86-input-keyboard_1.6.0.bb} (74%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-mouse_1.6.0.bb => xf86-input-mouse_1.7.0.bb} (76%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-synaptics_1.3.0.bb => xf86-input-synaptics_1.4.0.bb} (83%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-vmmouse_12.6.10.bb => xf86-input-vmmouse_12.7.0.bb} (64%)
 rename meta/recipes-graphics/xorg-lib/{libpciaccess_0.12.0.bb => libpciaccess_0.12.1.bb} (56%)
 rename meta/recipes-graphics/xorg-lib/{libxi_1.4.0.bb => libxi_1.4.2.bb} (76%)
 rename meta/recipes-graphics/xorg-lib/{libxt_1.0.9.bb => libxt_1.1.1.bb} (85%)
 rename meta/recipes-graphics/xorg-proto/{evieext_1.1.0.bb => evieext_1.1.1.bb} (54%)
 rename meta/recipes-graphics/xorg-proto/{fixesproto_4.1.2.bb => fixesproto_5.0.bb} (56%)
 rename meta/recipes-graphics/xorg-proto/{xextproto_7.1.2.bb => xextproto_7.2.0.bb} (76%)
 rename meta/recipes-graphics/xorg-proto/{xproto_7.0.20.bb => xproto_7.0.21.bb} (57%)
 rename meta/recipes-multimedia/alsa/{alsa-lib-1.0.23 => alsa-lib-1.0.24.1}/fix-tstamp-declaration.patch (95%)
 rename meta/recipes-multimedia/alsa/{alsa-lib-1.0.23 => alsa-lib-1.0.24.1}/unbreak_plugindir.patch (91%)
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.0.23.bb => alsa-lib_1.0.24.1.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gst-plugins-bad_0.10.20.bb => gst-plugins-bad_0.10.21.bb} (86%)
 rename meta/recipes-multimedia/gstreamer/{gst-plugins-base-0.10.31 => gst-plugins-base-0.10.32}/gst-plugins-base-tremor.patch (94%)
 rename meta/recipes-multimedia/gstreamer/{gst-plugins-base_0.10.31.bb => gst-plugins-base_0.10.32.bb} (86%)
 rename meta/recipes-multimedia/gstreamer/{gst-plugins-good_0.10.26.bb => gst-plugins-good_0.10.28.bb} (82%)
 rename meta/recipes-multimedia/gstreamer/{gst-plugins-ugly_0.10.16.bb => gst-plugins-ugly_0.10.17.bb} (85%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer-0.10.31 => gstreamer-0.10.32}/check_fix.patch (93%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer-0.10.31 => gstreamer-0.10.32}/gst-inspect-check-error.patch (96%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer-0.10.31 => gstreamer-0.10.32}/gstregistrybinary.c (100%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer-0.10.31 => gstreamer-0.10.32}/gstregistrybinary.h (100%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer_0.10.31.bb => gstreamer_0.10.32.bb} (91%)
 rename meta/recipes-multimedia/pulseaudio/{libcanberra_0.26.bb => libcanberra_0.28.bb} (85%)
 rename meta/recipes-support/libexif/{libexif_0.6.16.bb => libexif_0.6.20.bb} (61%)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.32.1.bb => libsoup-2.4_2.32.2.bb} (76%)



