Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QRerg-00041j-Ns
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 08:25:13 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 31 May 2011 23:22:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,302,1304319600"; d="scan'208";a="10203785"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.41])
	by fmsmga002.fm.intel.com with ESMTP; 31 May 2011 23:22:01 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 May 2011 23:21:27 -0700
Message-Id: <cover.1306909184.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [CONSOLIDATED PULL 00/32] 1-June-2011 Request
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
X-List-Received-Date: Wed, 01 Jun 2011 06:25:13 -0000

Richard,

This contains a few patches from the community, along with a batch of updates
and bug fixes from me. 

This includes the patch I submitted for the beagleboard qt4-x11-free failure.

This has been built via world.

Thanks
	Sau!


The following changes since commit 26e5e5feb695864b11e47e24017e254c28f14494:

  Improve handling of 'all' architecture recipes and their interaction with sstate (2011-05-31 12:56:38 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Koen Kooi (1):
  dbus 1.4.1: disable sysv script properly when using systemd

Martin Jansa (1):
  create-pull-request: allow '+' in git PROTO_RE, ie for 'git+ssh://'

Phil Blundell (2):
  busybox: sync do_install() with oe master (mostly)
  binconfig: improve handling of empty prefixes

Saul Wold (27):
  less: update to 443
  sysstat: update to 10.0.0
  tzdata: update to 2011g
  libmad: add Upstream-Status
  mpeg2dev: add Upstream-Status
  newt: add Upstream-Status
  util-linux: update to 2.19.1
  glew: update to 1.6.0
  gettext: Update to 0.18.1.1
  gobject-introspection: Update to 0.10.8 Git
  dtc: Cleanup and update recipe
  libiconv: update to 1.13.1
  update-alternatives-dpkg update to 1.16.0.3
  chkconfig: update to 1.3.52
  mailx: update to 12.5
  mc: update to 4.7.5.2
  msmtp: update tof 1.4.24
  gthumb: update to 2.12.3
  alsa-tools: update to 1.0.24.1
  qmmp: update to 0.5.1
  rxvt-unicode: update to 9.11
  gnutls: update to 2.12.5
  distro tracking: updates
  bitbake.conf: Create static-dev pacakge for static libraries
  tcmode-default: disable ARMv7 Optimization for qt4-x11-free
  puzzles: Update to 9175
  clutter-1.6: Add patch to update gettext macro version

Xiaofeng Yan (1):
  sudo.inc: Add do_install_prepend () to sudo.inc

 meta/classes/binconfig.bbclass                     |    4 +-
 meta/conf/bitbake.conf                             |    7 +-
 .../conf/distro/include/distro_tracking_fields.inc |   99 ++++++++++++++------
 meta/conf/distro/include/tcmode-default.inc        |    1 +
 meta/recipes-core/busybox/busybox.inc              |   99 +++++++++++---------
 meta/recipes-core/busybox/busybox_1.18.4.bb        |    2 +-
 meta/recipes-core/dbus/dbus.inc                    |    4 +
 meta/recipes-core/dbus/dbus_1.4.1.bb               |    2 +-
 .../gettext/gettext-0.16.1/disable_java.patch      |    2 +
 .../gettext-0.16.1/fix_aclocal_version.patch       |    2 +
 .../gettext-0.16.1/fix_gnu_source_circular.patch   |    2 +
 .../gettext/gettext-0.16.1/fixchicken.patch        |    2 +
 .../gettext/gettext-0.16.1/getline.m4.patch        |    2 +
 .../gettext-autoconf-lib-link-no-L.patch           |    2 +
 .../gettext-error_print_progname.patch             |    2 +
 .../gettext/gettext-0.16.1/gettext-vpath.patch     |    2 +
 .../gettext-0.16.1/hardcode_macro_version.patch    |    2 +
 .../gettext/gettext-0.16.1/linklib_from_0.17.patch |    2 +
 .../gettext/gettext-0.17/wchar-uclibc.patch        |   96 -------------------
 .../autotools.patch                                |    2 +
 .../gettext-error_print_progname.patch             |    2 +
 .../{gettext-0.17 => gettext-0.18.1.1}/m4fix.patch |    2 +
 .../use_open_properly.patch                        |    2 +
 .../gettext/gettext-0.18.1.1/wchar-uclibc.patch    |   74 +++++++++++++++
 .../{gettext_0.17.bb => gettext_0.18.1.1.bb}       |   14 +--
 .../MCONFIG                                        |    0
 .../defines.h                                      |    0
 .../make_include                                   |    0
 .../remove-lscpu.patch                             |    0
 .../swapargs.h                                     |    0
 .../uclibc-compile.patch                           |    0
 .../util-linux-ng-2.16-mount_lock_path.patch       |    0
 .../util-linux-ng-replace-siginterrupt.patch       |    0
 meta/recipes-core/util-linux/util-linux.inc        |    6 +-
 .../{util-linux_2.17.2.bb => util-linux_2.19.1.bb} |   11 +-
 ...8.7.bb => update-alternatives-dpkg_1.16.0.3.bb} |    0
 .../{chkconfig_1.3.51.bb => chkconfig_1.3.52.bb}   |    4 +-
 .../less/{less_436.bb => less_443.bb}              |    6 +-
 .../mailx/{mailx_12.4.bb => mailx_12.5.bb}         |   13 ++-
 .../mc/{mc_4.7.5.1.bb => mc_4.7.5.2.bb}            |    4 +-
 .../msmtp/{msmtp_1.4.23.bb => msmtp_1.4.24.bb}     |    4 +-
 .../newt/files/remove_slang_include.patch          |    3 +
 meta/recipes-extended/sudo/sudo.inc                |   12 +++
 meta/recipes-extended/sysstat/sysstat_10.0.0.bb    |   10 ++
 meta/recipes-extended/sysstat/sysstat_9.1.5.bb     |   10 --
 .../tzdata/{tzdata_2010o.bb => tzdata_2011g.bb}    |    4 +-
 .../gnome/gobject-introspection/configure.patch    |    2 +
 .../gnome/gobject-introspection/pathfix.patch      |    2 +
 .../gnome/gobject-introspection_git.bb             |    4 +-
 .../gthumb/{gthumb_2.12.2.bb => gthumb_2.12.3.bb}  |    4 +-
 .../recipes-graphics/clutter/clutter-1.6_1.6.14.bb |    5 +-
 .../clutter/update_gettext_macro_version.patch     |   32 +++++++
 meta/recipes-graphics/glew/files/autotools.patch   |    3 +
 .../glew/{glew_1.5.7.bb => glew_1.6.0.bb}          |    4 +-
 meta/recipes-kernel/dtc/dtc-native.inc             |    3 -
 meta/recipes-kernel/dtc/dtc-native_git.bb          |    5 -
 meta/recipes-kernel/dtc/dtc.inc                    |    8 ++-
 meta/recipes-kernel/dtc/dtc/remove_space_opt.patch |    2 +
 meta/recipes-kernel/dtc/dtc_git.bb                 |   15 +++-
 meta/recipes-kernel/dtc/dtc_git.inc                |    8 --
 ...alsa-tools_1.0.20.bb => alsa-tools_1.0.24.1.bb} |    0
 .../libmad/libmad/add-pkgconfig.patch              |    2 +
 .../libmad/fix_for_mips_with_gcc-4.5.0.patch       |    2 +
 .../libmad/libmad/no-force-mem.patch               |    2 +
 .../mpeg2dec/mpeg2dec-0.4.1/altivec_h_needed.patch |    2 +
 .../qt-apps/{qmmp_0.5.0.bb => qmmp_0.5.1.bb}       |    5 +-
 .../puzzles/{puzzles_r9173.bb => puzzles_r9175.bb} |    0
 .../rxvt.desktop                                   |    0
 .../rxvt.png                                       |  Bin 2847 -> 2847 bytes
 .../xwc.patch                                      |    0
 .../{rxvt-unicode_9.10.bb => rxvt-unicode_9.11.bb} |    0
 .../gnutls/gnutls-2.10.4/configure-fix.patch       |   66 -------------
 .../gnutls/gnutls-2.12.5/configure-fix.patch       |   67 +++++++++++++
 .../gnutls-openssl.patch                           |    0
 .../gnutls-texinfo-euro.patch                      |    0
 meta/recipes-support/gnutls/gnutls.inc             |    6 +-
 meta/recipes-support/gnutls/gnutls_2.10.4.bb       |   10 --
 meta/recipes-support/gnutls/gnutls_2.12.5.bb       |    9 ++
 .../autoconf.patch                                 |    2 +
 .../shared_preloadable_libiconv_linux.patch        |    2 +
 .../{libiconv_1.11.1.bb => libiconv_1.13.1.bb}     |    0
 scripts/create-pull-request                        |    2 +-
 82 files changed, 462 insertions(+), 329 deletions(-)
 delete mode 100644 meta/recipes-core/gettext/gettext-0.17/wchar-uclibc.patch
 rename meta/recipes-core/gettext/{gettext-0.17 => gettext-0.18.1.1}/autotools.patch (98%)
 rename meta/recipes-core/gettext/{gettext-0.17 => gettext-0.18.1.1}/gettext-error_print_progname.patch (96%)
 rename meta/recipes-core/gettext/{gettext-0.17 => gettext-0.18.1.1}/m4fix.patch (98%)
 rename meta/recipes-core/gettext/{gettext-0.17 => gettext-0.18.1.1}/use_open_properly.patch (96%)
 create mode 100644 meta/recipes-core/gettext/gettext-0.18.1.1/wchar-uclibc.patch
 rename meta/recipes-core/gettext/{gettext_0.17.bb => gettext_0.18.1.1.bb} (90%)
 rename meta/recipes-core/util-linux/{util-linux-2.17.2 => util-linux-2.19.1}/MCONFIG (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.17.2 => util-linux-2.19.1}/defines.h (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.17.2 => util-linux-2.19.1}/make_include (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.17.2 => util-linux-2.19.1}/remove-lscpu.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.17.2 => util-linux-2.19.1}/swapargs.h (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.17.2 => util-linux-2.19.1}/uclibc-compile.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.17.2 => util-linux-2.19.1}/util-linux-ng-2.16-mount_lock_path.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.17.2 => util-linux-2.19.1}/util-linux-ng-replace-siginterrupt.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux_2.17.2.bb => util-linux_2.19.1.bb} (82%)
 rename meta/recipes-devtools/update-alternatives/{update-alternatives-dpkg_1.15.8.7.bb => update-alternatives-dpkg_1.16.0.3.bb} (100%)
 rename meta/recipes-extended/chkconfig/{chkconfig_1.3.51.bb => chkconfig_1.3.52.bb} (83%)
 rename meta/recipes-extended/less/{less_436.bb => less_443.bb} (80%)
 rename meta/recipes-extended/mailx/{mailx_12.4.bb => mailx_12.5.bb} (66%)
 rename meta/recipes-extended/mc/{mc_4.7.5.1.bb => mc_4.7.5.2.bb} (78%)
 rename meta/recipes-extended/msmtp/{msmtp_1.4.23.bb => msmtp_1.4.24.bb} (81%)
 create mode 100644 meta/recipes-extended/sysstat/sysstat_10.0.0.bb
 delete mode 100644 meta/recipes-extended/sysstat/sysstat_9.1.5.bb
 rename meta/recipes-extended/tzdata/{tzdata_2010o.bb => tzdata_2011g.bb} (98%)
 rename meta/recipes-gnome/gthumb/{gthumb_2.12.2.bb => gthumb_2.12.3.bb} (76%)
 create mode 100644 meta/recipes-graphics/clutter/clutter/update_gettext_macro_version.patch
 rename meta/recipes-graphics/glew/{glew_1.5.7.bb => glew_1.6.0.bb} (80%)
 delete mode 100644 meta/recipes-kernel/dtc/dtc-native.inc
 delete mode 100644 meta/recipes-kernel/dtc/dtc-native_git.bb
 delete mode 100644 meta/recipes-kernel/dtc/dtc_git.inc
 rename meta/recipes-multimedia/alsa/{alsa-tools_1.0.20.bb => alsa-tools_1.0.24.1.bb} (100%)
 rename meta/recipes-qt/qt-apps/{qmmp_0.5.0.bb => qmmp_0.5.1.bb} (92%)
 rename meta/recipes-sato/puzzles/{puzzles_r9173.bb => puzzles_r9175.bb} (100%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.10 => rxvt-unicode-9.11}/rxvt.desktop (100%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.10 => rxvt-unicode-9.11}/rxvt.png (100%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.10 => rxvt-unicode-9.11}/xwc.patch (100%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode_9.10.bb => rxvt-unicode_9.11.bb} (100%)
 delete mode 100644 meta/recipes-support/gnutls/gnutls-2.10.4/configure-fix.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls-2.12.5/configure-fix.patch
 rename meta/recipes-support/gnutls/{gnutls-2.10.4 => gnutls-2.12.5}/gnutls-openssl.patch (100%)
 rename meta/recipes-support/gnutls/{gnutls-2.10.4 => gnutls-2.12.5}/gnutls-texinfo-euro.patch (100%)
 delete mode 100644 meta/recipes-support/gnutls/gnutls_2.10.4.bb
 create mode 100644 meta/recipes-support/gnutls/gnutls_2.12.5.bb
 rename meta/recipes-support/libiconv/{libiconv-1.11.1 => libiconv-1.13.1}/autoconf.patch (98%)
 rename meta/recipes-support/libiconv/{libiconv-1.11.1 => libiconv-1.13.1}/shared_preloadable_libiconv_linux.patch (98%)
 rename meta/recipes-support/libiconv/{libiconv_1.11.1.bb => libiconv_1.13.1.bb} (100%)

-- 
1.7.3.4



