Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/2] meta/meta-selftest/meta-skeleton: Update LICENSE variable to use SPDX license identifiers
Date: Fri, 18 Feb 2022 17:16:47 +0000
Message-Id: <20220218171647.3045919-2-richard.purdie@linuxfoundation.org>
In-Reply-To: <20220218171647.3045919-1-richard.purdie@linuxfoundation.org>
References: <20220218171647.3045919-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

An automated conversion using scripts/contrib/convert-spdx-licenses.py to
convert to use the standard SPDX license identifiers. Two recipes in meta-selftest
were not converted as they're that way specifically for testing.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-test/aspell/aspell_0.0.0.1.bb     |  2 +-
 .../devtool/devtool-test-local_6.03.bb        |  2 +-
 .../devtool/devtool-test-patch-gz.bb          |  2 +-
 .../devtool/devtool-upgrade-test2_git.bb      |  2 +-
 .../devtool-upgrade-test2_git.bb.upgraded     |  2 +-
 .../selftest-ed/selftest-ed_0.5.bb            |  2 +-
 .../selftest-ed/selftest-ed_1.14.1.bb         |  2 +-
 .../recipes-kernel/hello-mod/hello-mod_0.1.bb |  2 +-
 .../hello-autotools/hello_2.10.bb             |  2 +-
 .../recipes-skeleton/service/service_0.1.bb   |  2 +-
 meta/classes/devicetree.bbclass               |  2 +-
 meta/recipes-bsp/acpid/acpid.inc              |  2 +-
 meta/recipes-bsp/apmd/apmd_3.2.2-15.bb        |  2 +-
 meta/recipes-bsp/efibootmgr/efibootmgr_17.bb  |  2 +-
 meta/recipes-bsp/efivar/efivar_38.bb          |  2 +-
 meta/recipes-bsp/gnu-efi/gnu-efi_3.0.14.bb    |  2 +-
 meta/recipes-bsp/grub/grub2.inc               |  2 +-
 meta/recipes-bsp/keymaps/keymaps_1.0.bb       |  2 +-
 meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb       |  2 +-
 meta/recipes-bsp/pciutils/pciutils_3.7.0.bb   |  2 +-
 meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb   |  2 +-
 meta/recipes-bsp/setserial/setserial_2.17.bb  |  2 +-
 meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb  |  2 +-
 meta/recipes-bsp/u-boot/u-boot-common.inc     |  2 +-
 meta/recipes-bsp/usbinit/usbinit.bb           |  2 +-
 meta/recipes-bsp/usbutils/usbutils_014.bb     |  6 +++---
 meta/recipes-bsp/v86d/v86d_0.1.10.bb          |  2 +-
 meta/recipes-connectivity/avahi/avahi_0.8.bb  | 20 +++++++++----------
 meta/recipes-connectivity/bluez5/bluez5.inc   |  2 +-
 .../connman/connman-conf.bb                   |  2 +-
 .../connman/connman-gnome_0.7.bb              |  2 +-
 meta/recipes-connectivity/connman/connman.inc |  2 +-
 .../inetutils/inetutils_2.2.bb                |  2 +-
 .../iproute2/iproute2.inc                     |  2 +-
 .../libnss-mdns/libnss-mdns_0.15.1.bb         |  2 +-
 meta/recipes-connectivity/neard/neard_0.16.bb |  2 +-
 .../nfs-utils/nfs-utils_2.6.1.bb              |  2 +-
 meta/recipes-connectivity/ofono/ofono_1.34.bb |  2 +-
 meta/recipes-connectivity/ppp/ppp_2.4.9.bb    |  2 +-
 .../resolvconf/resolvconf_1.91.bb             |  2 +-
 .../base-files/base-files_3.0.14.bb           |  2 +-
 .../base-passwd/base-passwd_3.5.29.bb         |  2 +-
 .../busybox/busybox-inittab_1.35.0.bb         |  2 +-
 meta/recipes-core/busybox/busybox.inc         |  2 +-
 meta/recipes-core/coreutils/coreutils_9.0.bb  |  2 +-
 meta/recipes-core/dbus-wait/dbus-wait_git.bb  |  2 +-
 meta/recipes-core/dbus/dbus-glib_0.112.bb     |  2 +-
 meta/recipes-core/dbus/dbus.inc               |  2 +-
 meta/recipes-core/ell/ell_0.48.bb             |  2 +-
 meta/recipes-core/gettext/gettext_0.21.bb     |  2 +-
 meta/recipes-core/glib-2.0/glib.inc           |  2 +-
 .../glib-networking/glib-networking_2.70.1.bb |  2 +-
 .../glibc/cross-localedef-native_2.35.bb      |  2 +-
 meta/recipes-core/glibc/glibc-common.inc      |  2 +-
 .../glibc/ldconfig-native_2.12.1.bb           |  2 +-
 meta/recipes-core/ifupdown/ifupdown_0.8.37.bb |  2 +-
 .../init-ifupdown/init-ifupdown_1.0.bb        |  2 +-
 .../initscripts/init-system-helpers_1.60.bb   |  2 +-
 .../initscripts/initscripts_1.0.bb            |  2 +-
 meta/recipes-core/kbd/kbd_2.4.0.bb            |  2 +-
 meta/recipes-core/libcgroup/libcgroup_2.0.bb  |  2 +-
 meta/recipes-core/libxcrypt/libxcrypt.inc     |  2 +-
 meta/recipes-core/musl/musl-obstack.bb        |  2 +-
 meta/recipes-core/musl/musl-utils.bb          |  2 +-
 meta/recipes-core/netbase/netbase_6.3.bb      |  2 +-
 meta/recipes-core/newlib/newlib.inc           |  2 +-
 meta/recipes-core/psplash/psplash_git.bb      |  2 +-
 meta/recipes-core/readline/readline.inc       |  2 +-
 .../sysfsutils/sysfsutils_2.1.0.bb            |  6 +++---
 .../systemd/systemd-serialgetty.bb            |  2 +-
 meta/recipes-core/systemd/systemd.inc         |  2 +-
 .../sysvinit/sysvinit-inittab_2.88dsf.bb      |  2 +-
 meta/recipes-core/sysvinit/sysvinit_3.01.bb   |  2 +-
 meta/recipes-core/udev/eudev_3.2.10.bb        |  4 ++--
 .../update-rc.d/update-rc.d_0.8.bb            |  2 +-
 meta/recipes-core/util-linux/util-linux.inc   | 10 +++++-----
 meta/recipes-devtools/apt/apt_2.2.4.bb        |  2 +-
 .../autoconf/autoconf_2.71.bb                 |  2 +-
 meta/recipes-devtools/automake/automake.inc   |  2 +-
 .../automake/automake_1.16.5.bb               |  2 +-
 meta/recipes-devtools/binutils/binutils.inc   |  2 +-
 meta/recipes-devtools/bison/bison_3.8.2.bb    |  2 +-
 .../bootchart2/bootchart2_0.14.9.bb           |  2 +-
 .../btrfs-tools/btrfs-tools_5.16.bb           |  2 +-
 meta/recipes-devtools/ccache/ccache_4.5.1.bb  |  2 +-
 .../cdrtools/cdrtools-native_3.01.bb          |  2 +-
 meta/recipes-devtools/chrpath/chrpath_0.16.bb |  2 +-
 .../createrepo-c/createrepo-c_0.18.0.bb       |  2 +-
 .../recipes-devtools/dejagnu/dejagnu_1.6.3.bb |  2 +-
 .../desktop-file-utils_0.26.bb                |  2 +-
 meta/recipes-devtools/distcc/distcc_3.4.bb    |  2 +-
 .../dmidecode/dmidecode_3.3.bb                |  2 +-
 meta/recipes-devtools/dnf/dnf_4.10.0.bb       |  2 +-
 .../dosfstools/dosfstools_4.2.bb              |  2 +-
 meta/recipes-devtools/dpkg/dpkg.inc           |  2 +-
 .../dwarfsrcfiles/dwarfsrcfiles.bb            |  2 +-
 meta/recipes-devtools/e2fsprogs/e2fsprogs.inc | 12 +++++------
 .../elfutils/elfutils_0.186.bb                | 14 ++++++-------
 .../erofs-utils/erofs-utils_1.4.bb            |  2 +-
 meta/recipes-devtools/fdisk/gptfdisk_1.0.8.bb |  2 +-
 meta/recipes-devtools/flex/flex_2.6.4.bb      |  2 +-
 meta/recipes-devtools/gcc/gcc-11.2.inc        |  2 +-
 meta/recipes-devtools/gdb/gdb.inc             |  2 +-
 meta/recipes-devtools/git/git_2.35.1.bb       |  2 +-
 .../help2man/help2man_1.49.1.bb               |  2 +-
 .../i2c-tools/i2c-tools_4.3.bb                |  2 +-
 .../icecc-create-env/icecc-create-env_0.1.bb  |  2 +-
 .../intltool/intltool_0.51.0.bb               |  2 +-
 .../libcomps/libcomps_0.1.18.bb               |  2 +-
 meta/recipes-devtools/libdnf/libdnf_0.65.0.bb |  2 +-
 .../librepo/librepo_1.14.2.bb                 |  2 +-
 .../libtool/libtool-2.4.6.inc                 |  2 +-
 meta/recipes-devtools/m4/m4-1.4.19.inc        |  2 +-
 meta/recipes-devtools/make/make_4.3.bb        |  2 +-
 .../makedevs/makedevs_1.0.1.bb                |  2 +-
 meta/recipes-devtools/mmc/mmc-utils_git.bb    |  2 +-
 meta/recipes-devtools/mtd/mtd-utils_git.bb    |  2 +-
 meta/recipes-devtools/mtools/mtools_4.0.37.bb |  2 +-
 .../opkg-utils/opkg-utils_0.5.0.bb            |  2 +-
 meta/recipes-devtools/opkg/opkg_0.5.0.bb      |  2 +-
 meta/recipes-devtools/patch/patch_2.7.6.bb    |  2 +-
 .../patchelf/patchelf_0.14.3.bb               |  2 +-
 .../perl-cross/perlcross_1.3.6.bb             |  2 +-
 .../perl/liberror-perl_0.17029.bb             |  2 +-
 .../perl/libmodule-build-perl_0.4231.bb       |  2 +-
 .../perl/libtest-needs-perl_0.002009.bb       |  2 +-
 .../recipes-devtools/perl/liburi-perl_5.08.bb |  2 +-
 .../perl/libxml-parser-perl_2.46.bb           |  2 +-
 .../recipes-devtools/perl/libxml-perl_0.08.bb |  2 +-
 .../perl/libxml-simple-perl_2.25.bb           |  2 +-
 meta/recipes-devtools/perl/perl_5.34.0.bb     |  2 +-
 .../pkgconfig/pkgconfig_git.bb                |  2 +-
 meta/recipes-devtools/pseudo/pseudo.inc       |  2 +-
 meta/recipes-devtools/python/python-nose.inc  |  2 +-
 .../python/python3-dbusmock_0.25.0.bb         |  2 +-
 .../python/python3-docutils_0.18.1.bb         |  2 +-
 .../python/python3-iniparse_0.5.bb            |  2 +-
 .../python/python3-numpy_1.22.2.bb            |  2 +-
 .../python/python3-pycairo_1.20.1.bb          |  2 +-
 .../python/python3-pygobject_3.42.0.bb        |  2 +-
 .../python/python3-rfc3987_1.3.8.bb           |  2 +-
 .../python/python3-strict-rfc3339_0.7.bb      |  2 +-
 .../recipes-devtools/python/python3_3.10.2.bb |  2 +-
 .../qemu/nativesdk-qemu-helper_1.0.bb         |  2 +-
 .../qemu/qemu-helper-native_1.0.bb            |  2 +-
 meta/recipes-devtools/qemu/qemu.inc           |  2 +-
 meta/recipes-devtools/quilt/quilt.inc         |  2 +-
 meta/recipes-devtools/rpm/rpm_4.17.0.bb       |  2 +-
 meta/recipes-devtools/rsync/rsync_3.2.3.bb    |  2 +-
 meta/recipes-devtools/ruby/ruby.inc           |  2 +-
 .../squashfs-tools/squashfs-tools_git.bb      |  2 +-
 meta/recipes-devtools/strace/strace_5.16.bb   |  2 +-
 .../subversion/subversion_1.14.1.bb           |  2 +-
 meta/recipes-devtools/swig/swig.inc           |  2 +-
 .../syslinux/syslinux_6.04-pre2.bb            |  2 +-
 .../systemd-bootchart_234.bb                  |  2 +-
 meta/recipes-devtools/tcltk/tcl_8.6.11.bb     |  2 +-
 meta/recipes-devtools/vala/vala.inc           |  2 +-
 .../valgrind/valgrind_3.18.1.bb               |  2 +-
 meta/recipes-devtools/xmlto/xmlto_0.0.28.bb   |  2 +-
 .../acpica/acpica_20211217.bb                 |  2 +-
 .../asciidoc/asciidoc_10.1.1.bb               |  2 +-
 meta/recipes-extended/at/at_3.2.4.bb          |  2 +-
 meta/recipes-extended/bash/bash_5.1.16.bb     |  2 +-
 meta/recipes-extended/bc/bc_1.07.1.bb         |  2 +-
 .../recipes-extended/blktool/blktool_4-7.1.bb |  2 +-
 meta/recipes-extended/bzip2/bzip2_1.0.8.bb    |  4 ++--
 meta/recipes-extended/cpio/cpio_2.13.bb       |  2 +-
 .../cracklib/cracklib_2.9.7.bb                |  2 +-
 meta/recipes-extended/cronie/cronie_1.5.7.bb  |  2 +-
 .../cwautomacros/cwautomacros_20110201.bb     |  2 +-
 .../diffutils/diffutils_3.8.bb                |  2 +-
 meta/recipes-extended/ed/ed_1.18.bb           |  2 +-
 meta/recipes-extended/ethtool/ethtool_5.16.bb |  2 +-
 .../findutils/findutils_4.9.0.bb              |  2 +-
 meta/recipes-extended/gawk/gawk_5.1.1.bb      |  2 +-
 .../ghostscript/ghostscript_9.55.0.bb         |  2 +-
 meta/recipes-extended/gperf/gperf_3.1.bb      |  2 +-
 meta/recipes-extended/grep/grep_3.7.bb        |  2 +-
 meta/recipes-extended/groff/groff_1.22.4.bb   |  2 +-
 meta/recipes-extended/gzip/gzip_1.11.bb       |  2 +-
 meta/recipes-extended/hdparm/hdparm_9.63.bb   |  4 ++--
 .../iptables/iptables_1.8.7.bb                |  2 +-
 .../iputils/iputils_20211215.bb               |  2 +-
 meta/recipes-extended/less/less_600.bb        |  2 +-
 .../recipes-extended/libaio/libaio_0.3.112.bb |  2 +-
 meta/recipes-extended/libidn/libidn2_2.3.2.bb |  6 +++---
 meta/recipes-extended/libmnl/libmnl_1.0.4.bb  |  2 +-
 meta/recipes-extended/libnsl/libnsl2_git.bb   |  2 +-
 .../recipes-extended/libnss-nis/libnss-nis.bb |  2 +-
 .../libpipeline/libpipeline_1.5.5.bb          |  2 +-
 .../logrotate/logrotate_3.19.0.bb             |  2 +-
 meta/recipes-extended/lsb/lsb-release_1.4.bb  |  2 +-
 meta/recipes-extended/ltp/ltp_20220121.bb     |  2 +-
 meta/recipes-extended/lzip/lzip_1.23.bb       |  2 +-
 meta/recipes-extended/man-db/man-db_2.10.1.bb |  2 +-
 .../man-pages/man-pages_5.13.bb               |  2 +-
 meta/recipes-extended/mc/mc_4.8.27.bb         |  2 +-
 meta/recipes-extended/mdadm/mdadm_4.2.bb      |  2 +-
 .../mingetty/mingetty_1.08.bb                 |  2 +-
 meta/recipes-extended/minicom/minicom_2.8.bb  |  2 +-
 meta/recipes-extended/msmtp/msmtp_1.8.19.bb   |  2 +-
 .../net-tools/net-tools_2.10.bb               |  2 +-
 meta/recipes-extended/newt/libnewt_0.52.21.bb |  2 +-
 meta/recipes-extended/pam/libpam_1.5.2.bb     |  2 +-
 meta/recipes-extended/parted/parted_3.4.bb    |  2 +-
 .../perl/libconvert-asn1-perl_0.33.bb         |  2 +-
 .../perl/libtimedate-perl_2.30.bb             |  2 +-
 .../perl/libxml-namespacesupport-perl_1.12.bb |  2 +-
 .../perl/libxml-sax-base-perl_1.09.bb         |  2 +-
 .../perl/libxml-sax-perl_1.02.bb              |  2 +-
 meta/recipes-extended/procps/procps_3.3.17.bb |  2 +-
 meta/recipes-extended/psmisc/psmisc.inc       |  2 +-
 meta/recipes-extended/psmisc/psmisc_23.4.bb   |  2 +-
 meta/recipes-extended/quota/quota_4.06.bb     |  2 +-
 meta/recipes-extended/screen/screen_4.9.0.bb  |  2 +-
 meta/recipes-extended/sed/sed_4.8.bb          |  2 +-
 meta/recipes-extended/slang/slang_2.3.2.bb    |  2 +-
 .../stress-ng/stress-ng_0.13.11.bb            |  2 +-
 meta/recipes-extended/sysstat/sysstat.inc     |  2 +-
 meta/recipes-extended/tar/tar_1.34.bb         |  2 +-
 meta/recipes-extended/texinfo/texinfo_6.8.bb  |  2 +-
 meta/recipes-extended/time/time_1.9.bb        |  2 +-
 .../watchdog/watchdog-config.bb               |  2 +-
 .../watchdog/watchdog_5.16.bb                 |  2 +-
 meta/recipes-extended/wget/wget.inc           |  2 +-
 meta/recipes-extended/which/which_2.21.bb     |  2 +-
 meta/recipes-extended/xz/xz_5.2.5.bb          | 14 ++++++-------
 meta/recipes-extended/zstd/zstd_1.5.2.bb      |  2 +-
 meta/recipes-gnome/epiphany/epiphany_41.3.bb  |  2 +-
 meta/recipes-gnome/gcr/gcr_3.40.0.bb          |  2 +-
 .../gdk-pixbuf/gdk-pixbuf_2.42.6.bb           |  2 +-
 meta/recipes-gnome/gi-docgen/gi-docgen_git.bb |  2 +-
 .../gnome/adwaita-icon-theme_41.0.bb          |  2 +-
 meta/recipes-gnome/gnome/gconf_3.2.6.bb       |  2 +-
 .../gobject-introspection_1.70.0.bb           |  2 +-
 .../gsettings-desktop-schemas_41.0.bb         |  2 +-
 meta/recipes-gnome/gtk+/gtk+3.inc             |  2 +-
 meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb  |  2 +-
 .../hicolor-icon-theme_0.17.bb                |  2 +-
 .../json-glib/json-glib_1.6.6.bb              |  2 +-
 .../libdazzle/libdazzle_3.42.0.bb             |  2 +-
 meta/recipes-gnome/libgudev/libgudev_237.bb   |  2 +-
 meta/recipes-gnome/libhandy/libhandy_1.5.0.bb |  2 +-
 .../libnotify/libnotify_0.7.9.bb              |  2 +-
 meta/recipes-gnome/librsvg/librsvg_2.52.5.bb  |  2 +-
 .../libsecret/libsecret_0.20.4.bb             |  2 +-
 meta/recipes-graphics/cairo/cairo_1.16.0.bb   | 14 ++++++-------
 .../fontconfig/fontconfig_2.13.1.bb           |  2 +-
 .../freetype/freetype_2.11.1.bb               |  2 +-
 .../libfakekey/libfakekey_git.bb              |  2 +-
 .../libmatchbox/libmatchbox_1.12.bb           |  2 +-
 .../matchbox-session/matchbox-session_0.1.bb  |  2 +-
 .../matchbox-wm/matchbox-wm_1.2.2.bb          |  2 +-
 .../menu-cache/menu-cache_1.1.0.bb            |  2 +-
 .../mini-x-session/mini-x-session_0.1.bb      |  2 +-
 meta/recipes-graphics/pango/pango_1.50.4.bb   |  2 +-
 meta/recipes-graphics/piglit/piglit_git.bb    |  2 +-
 .../pong-clock/pong-clock_1.0.bb              |  2 +-
 .../startup-notification_0.12.bb              |  2 +-
 .../x11-common/xserver-nodm-init_3.0.bb       |  2 +-
 .../xcursor-transparent-theme_git.bb          |  2 +-
 .../xinput-calibrator_git.bb                  |  2 +-
 .../xorg-app/xorg-app-common.inc              |  2 +-
 .../xorg-driver/xorg-driver-common.inc        |  2 +-
 .../xorg-font/font-util_1.3.2.bb              |  2 +-
 .../xorg-font/xorg-font-common.inc            |  2 +-
 .../xorg-lib/libice_1.0.10.bb                 |  2 +-
 .../xorg-lib/libpciaccess_0.16.bb             |  2 +-
 meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb |  2 +-
 .../xorg-lib/libx11-compose-data_1.6.8.bb     |  2 +-
 .../xorg-lib/libx11_1.7.3.1.bb                |  2 +-
 .../recipes-graphics/xorg-lib/libxau_1.0.9.bb |  2 +-
 .../xorg-lib/libxcomposite_0.4.5.bb           |  2 +-
 .../xorg-lib/libxcursor_1.2.0.bb              |  2 +-
 .../xorg-lib/libxdmcp_1.1.3.bb                |  2 +-
 .../xorg-lib/libxext_1.3.4.bb                 |  2 +-
 .../xorg-lib/libxfixes_6.0.0.bb               |  2 +-
 .../xorg-lib/libxfont2_2.0.5.bb               |  2 +-
 .../xorg-lib/libxfont_1.5.4.bb                |  2 +-
 meta/recipes-graphics/xorg-lib/libxi_1.8.bb   |  2 +-
 .../xorg-lib/libxkbcommon_1.4.0.bb            |  2 +-
 .../xorg-lib/libxkbfile_1.1.0.bb              |  2 +-
 .../recipes-graphics/xorg-lib/libxmu_1.1.3.bb |  2 +-
 .../xorg-lib/libxrandr_1.5.2.bb               |  2 +-
 .../xorg-lib/libxrender_0.9.10.bb             |  2 +-
 .../xorg-lib/libxshmfence_1.3.bb              |  2 +-
 meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb |  2 +-
 .../xorg-lib/libxtst_1.2.3.bb                 |  2 +-
 .../recipes-graphics/xorg-lib/libxv_1.0.11.bb |  2 +-
 .../xorg-lib/pixman_0.40.0.bb                 |  2 +-
 .../xorg-lib/xkeyboard-config_2.35.1.bb       |  2 +-
 .../xorg-lib/xorg-lib-common.inc              |  2 +-
 .../recipes-graphics/xorg-lib/xtrans_1.4.0.bb |  2 +-
 .../xorg-proto/xorgproto_2021.5.bb            |  2 +-
 .../xorg-util/util-macros_1.19.3.bb           |  2 +-
 .../xorg-util/xorg-util-common.inc            |  2 +-
 .../xorg-xserver/xserver-xf86-config_0.1.bb   |  2 +-
 .../xorg-xserver/xserver-xorg.inc             |  2 +-
 meta/recipes-graphics/xrestop/xrestop_0.4.bb  |  2 +-
 .../xwayland/xwayland_21.1.4.bb               |  2 +-
 meta/recipes-kernel/blktrace/blktrace_git.bb  |  2 +-
 meta/recipes-kernel/cryptodev/cryptodev.inc   |  2 +-
 meta/recipes-kernel/dtc/dtc_1.6.1.bb          |  2 +-
 .../kern-tools/kern-tools-native_git.bb       |  2 +-
 .../kexec/kexec-tools_2.0.23.bb               |  2 +-
 meta/recipes-kernel/kmod/kmod_29.bb           |  4 ++--
 .../linux-firmware/linux-firmware_20220209.bb |  4 ++--
 .../linux-libc-headers/linux-libc-headers.inc |  2 +-
 meta/recipes-kernel/linux/kernel-devsrc.bb    |  2 +-
 meta/recipes-kernel/linux/linux-dummy.bb      |  2 +-
 meta/recipes-kernel/linux/linux-yocto.inc     |  2 +-
 .../recipes-kernel/lttng/babeltrace2_2.0.4.bb |  2 +-
 meta/recipes-kernel/lttng/babeltrace_1.5.8.bb |  2 +-
 .../lttng/lttng-modules_2.13.1.bb             |  2 +-
 .../lttng/lttng-tools_2.13.4.bb               |  2 +-
 meta/recipes-kernel/lttng/lttng-ust_2.13.1.bb |  2 +-
 .../make-mod-scripts/make-mod-scripts_1.0.bb  |  2 +-
 meta/recipes-kernel/perf/perf.bb              |  2 +-
 meta/recipes-kernel/powertop/powertop_2.14.bb |  2 +-
 .../systemtap/systemtap_git.inc               |  2 +-
 .../alsa/alsa-lib_1.2.6.1.bb                  |  2 +-
 .../alsa/alsa-plugins_1.2.6.bb                |  2 +-
 .../alsa/alsa-tools_1.2.5.bb                  |  2 +-
 meta/recipes-multimedia/alsa/alsa-utils.inc   |  2 +-
 meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.bb  | 20 +++++++++----------
 meta/recipes-multimedia/flac/flac_1.3.3.bb    |  2 +-
 .../gstreamer/gst-devtools_1.20.0.bb          |  2 +-
 .../gstreamer/gst-examples_1.18.6.bb          |  2 +-
 .../gstreamer/gstreamer1.0-libav_1.20.0.bb    |  2 +-
 .../gstreamer/gstreamer1.0-omx_1.20.0.bb      |  2 +-
 .../gstreamer1.0-plugins-bad_1.20.0.bb        |  2 +-
 .../gstreamer1.0-plugins-base_1.20.0.bb       |  2 +-
 .../gstreamer1.0-plugins-good_1.20.0.bb       |  2 +-
 .../gstreamer1.0-plugins-ugly_1.20.0.bb       |  2 +-
 .../gstreamer/gstreamer1.0-python_1.20.0.bb   |  2 +-
 .../gstreamer1.0-rtsp-server_1.20.0.bb        |  2 +-
 .../gstreamer/gstreamer1.0-vaapi_1.20.0.bb    |  2 +-
 .../gstreamer/gstreamer1.0_1.20.0.bb          |  2 +-
 meta/recipes-multimedia/lame/lame_3.100.bb    |  2 +-
 .../recipes-multimedia/liba52/liba52_0.7.4.bb |  2 +-
 .../libomxil/libomxil_0.9.3.bb                |  2 +-
 .../libsndfile/libsndfile1_1.0.28.bb          |  2 +-
 .../mpeg2dec/mpeg2dec_0.5.1.bb                |  2 +-
 .../mpg123/mpg123_1.29.3.bb                   |  2 +-
 .../pulseaudio/pulseaudio.inc                 |  2 +-
 meta/recipes-multimedia/sbc/sbc_1.5.bb        |  6 +++---
 meta/recipes-multimedia/x264/x264_git.bb      |  2 +-
 meta/recipes-rt/rt-tests/hwlatdetect_git.bb   |  2 +-
 meta/recipes-rt/rt-tests/rt-tests_git.bb      |  2 +-
 meta/recipes-sato/l3afpad/l3afpad_git.bb      |  2 +-
 meta/recipes-sato/libptytty/libptytty_2.0.bb  |  2 +-
 .../matchbox-config-gtk_0.2.bb                |  2 +-
 .../matchbox-desktop/matchbox-desktop_2.2.bb  |  2 +-
 .../matchbox-keyboard_0.1.1.bb                |  2 +-
 .../matchbox-panel-2/matchbox-panel-2_2.11.bb |  2 +-
 .../matchbox-session-sato_0.1.bb              |  2 +-
 .../matchbox-terminal_0.2.bb                  |  2 +-
 meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb    |  2 +-
 .../rxvt-unicode/rxvt-unicode_9.30.bb         |  2 +-
 .../sato-screenshot/sato-screenshot_0.3.bb    |  2 +-
 .../settings-daemon/settings-daemon_0.0.2.bb  |  2 +-
 meta/recipes-sato/webkit/webkitgtk_2.34.5.bb  |  2 +-
 .../argp-standalone/argp-standalone_1.3.bb    |  2 +-
 meta/recipes-support/aspell/aspell_0.60.8.bb  |  2 +-
 .../recipes-support/atk/at-spi2-atk_2.38.0.bb |  2 +-
 .../atk/at-spi2-core_2.42.0.bb                |  2 +-
 meta/recipes-support/atk/atk_2.36.0.bb        |  2 +-
 meta/recipes-support/attr/acl_2.3.1.bb        |  6 +++---
 meta/recipes-support/attr/attr.inc            |  6 +++---
 .../bash-completion/bash-completion_2.11.bb   |  2 +-
 .../bmap-tools/bmap-tools_3.6.bb              |  2 +-
 .../ca-certificates_20211016.bb               |  2 +-
 .../consolekit/consolekit_0.4.6.bb            |  2 +-
 .../debianutils/debianutils_5.7.bb            |  2 +-
 .../diffoscope/diffoscope_204.bb              |  2 +-
 .../recipes-support/enchant/enchant2_2.3.2.bb |  2 +-
 .../recipes-support/fribidi/fribidi_1.0.11.bb |  2 +-
 meta/recipes-support/gdbm/gdbm_1.23.bb        |  2 +-
 meta/recipes-support/gmp/gmp_6.2.1.bb         |  2 +-
 .../gnome-desktop-testing_2021.1.bb           |  2 +-
 meta/recipes-support/gnupg/gnupg_2.3.4.bb     |  2 +-
 meta/recipes-support/gnutls/gnutls_3.7.3.bb   | 10 +++++-----
 .../recipes-support/gnutls/libtasn1_4.18.0.bb |  6 +++---
 meta/recipes-support/gpgme/gpgme_1.17.0.bb    |  2 +-
 .../iso-codes/iso-codes_4.9.0.bb              |  2 +-
 meta/recipes-support/itstool/itstool_2.0.7.bb |  2 +-
 .../libassuan/libassuan_2.5.5.bb              |  6 +++---
 .../libatomic-ops/libatomic-ops_7.6.12.bb     |  2 +-
 meta/recipes-support/libcap-ng/libcap-ng.inc  |  2 +-
 meta/recipes-support/libcap/libcap_2.63.bb    |  2 +-
 .../libcheck/libcheck_0.15.2.bb               |  2 +-
 .../libcroco/libcroco_0.6.13.bb               |  2 +-
 .../libdaemon/libdaemon_0.14.bb               |  2 +-
 .../recipes-support/libexif/libexif_0.6.24.bb |  2 +-
 .../libfm/libfm-extra_1.3.2.bb                |  2 +-
 meta/recipes-support/libfm/libfm_1.3.2.bb     |  2 +-
 .../libgcrypt/libgcrypt_1.9.4.bb              |  8 ++++----
 meta/recipes-support/libgit2/libgit2_1.4.0.bb |  2 +-
 .../libgpg-error/libgpg-error_1.44.bb         |  2 +-
 .../recipes-support/libical/libical_3.0.14.bb |  2 +-
 .../libjitterentropy_3.3.1.bb                 |  2 +-
 meta/recipes-support/libksba/libksba_1.6.0.bb |  6 +++---
 .../libmicrohttpd/libmicrohttpd_0.9.75.bb     |  2 +-
 meta/recipes-support/libmpc/libmpc.inc        |  2 +-
 meta/recipes-support/libnl/libnl_3.5.0.bb     |  2 +-
 .../libproxy/libproxy_0.4.17.bb               |  2 +-
 .../libseccomp/libseccomp_2.5.3.bb            |  2 +-
 .../libsoup/libsoup-2.4_2.74.2.bb             |  2 +-
 meta/recipes-support/libsoup/libsoup_3.0.4.bb |  2 +-
 .../libunistring/libunistring_1.0.bb          |  2 +-
 .../recipes-support/liburcu/liburcu_0.13.1.bb |  2 +-
 meta/recipes-support/libusb/libusb1_1.0.25.bb |  2 +-
 meta/recipes-support/lz4/lz4_1.9.3.bb         |  2 +-
 meta/recipes-support/lzo/lzo_2.10.bb          |  2 +-
 meta/recipes-support/lzop/lzop_1.04.bb        |  2 +-
 meta/recipes-support/mpfr/mpfr_4.1.0.bb       |  2 +-
 meta/recipes-support/nettle/nettle_3.7.3.bb   |  2 +-
 meta/recipes-support/npth/npth_1.6.bb         |  2 +-
 .../nss-myhostname/nss-myhostname_0.3.bb      |  2 +-
 meta/recipes-support/numactl/numactl_git.bb   |  2 +-
 .../pinentry/pinentry_1.2.0.bb                |  2 +-
 .../ptest-runner/ptest-runner_2.4.2.bb        |  2 +-
 .../rng-tools/rng-tools_6.15.bb               |  2 +-
 .../shared-mime-info/shared-mime-info_git.bb  |  2 +-
 meta/recipes-support/taglib/taglib_1.12.bb    |  2 +-
 meta/recipes-support/vim/vim.inc              |  2 +-
 meta/recipes-support/vte/vte_0.66.2.bb        |  4 ++--
 meta/recipes-support/xxhash/xxhash_0.8.1.bb   |  2 +-
 429 files changed, 505 insertions(+), 505 deletions(-)

diff --git a/meta-selftest/recipes-test/aspell/aspell_0.0.0.1.bb b/meta-selftest/recipes-test/aspell/aspell_0.0.0.1.bb
index d6f3628e60c..e1e473fe80d 100644
--- a/meta-selftest/recipes-test/aspell/aspell_0.0.0.1.bb
+++ b/meta-selftest/recipes-test/aspell/aspell_0.0.0.1.bb
@@ -6,7 +6,7 @@ SUMMARY = "GNU Aspell spell-checker"
 SECTION = "console/utils"
 HOMEPAGE = "https://ftp.gnu.org/gnu/aspell/"
 
-LICENSE = "LGPLv2 | LGPLv2.1"
+LICENSE = "LGPL-2.0-only | LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz"
diff --git a/meta-selftest/recipes-test/devtool/devtool-test-local_6.03.bb b/meta-selftest/recipes-test/devtool/devtool-test-local_6.03.bb
index 6bfc557060a..463cfe0a7a5 100644
--- a/meta-selftest/recipes-test/devtool/devtool-test-local_6.03.bb
+++ b/meta-selftest/recipes-test/devtool/devtool-test-local_6.03.bb
@@ -1,4 +1,4 @@
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 INHIBIT_DEFAULT_DEPS = "1"
diff --git a/meta-selftest/recipes-test/devtool/devtool-test-patch-gz.bb b/meta-selftest/recipes-test/devtool/devtool-test-patch-gz.bb
index fc3799590cc..e25b3d97473 100644
--- a/meta-selftest/recipes-test/devtool/devtool-test-patch-gz.bb
+++ b/meta-selftest/recipes-test/devtool/devtool-test-patch-gz.bb
@@ -1,4 +1,4 @@
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "libxres libxext virtual/libx11 ncurses"
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb
index 8a27e3a7910..203f4b61c2e 100644
--- a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb
@@ -1,7 +1,7 @@
 SUMMARY = "A simple tool to wait for a specific signal over DBus"
 HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/dbus-wait"
 SECTION = "base"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "dbus"
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.upgraded b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.upgraded
index fbe90d6c6b9..3d45fc48572 100644
--- a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.upgraded
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.upgraded
@@ -1,7 +1,7 @@
 SUMMARY = "A simple tool to wait for a specific signal over DBus"
 HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/dbus-wait"
 SECTION = "base"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "dbus"
diff --git a/meta-selftest/recipes-test/selftest-ed/selftest-ed_0.5.bb b/meta-selftest/recipes-test/selftest-ed/selftest-ed_0.5.bb
index 7595e8ef164..4a9b94ecebd 100644
--- a/meta-selftest/recipes-test/selftest-ed/selftest-ed_0.5.bb
+++ b/meta-selftest/recipes-test/selftest-ed/selftest-ed_0.5.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Line-oriented text editor -- selftest GPLv2 version"
 HOMEPAGE = "http://www.gnu.org/software/ed/"
 SECTION = "base"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6ddd5335ef96fb858a138230af773710 \
                     file://main.c;beginline=1;endline=17;md5=36d4b85e5ae9028e918d1cc775c2475e"
 
diff --git a/meta-selftest/recipes-test/selftest-ed/selftest-ed_1.14.1.bb b/meta-selftest/recipes-test/selftest-ed/selftest-ed_1.14.1.bb
index 08fb415d9d3..b92740de32a 100644
--- a/meta-selftest/recipes-test/selftest-ed/selftest-ed_1.14.1.bb
+++ b/meta-selftest/recipes-test/selftest-ed/selftest-ed_1.14.1.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Line-oriented text editor -- selftest variant"
 HOMEPAGE = "http://www.gnu.org/software/ed/"
 
-LICENSE = "GPLv3+"
+LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0c7051aef9219dc7237f206c5c4179a7 \
                     file://ed.h;endline=20;md5=4e36b7a40e137f42aee718165590d125 \
                     file://main.c;endline=17;md5=c5b8f78f115df187af76868a2aead16a"
diff --git a/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb b/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
index 4a84a9fad85..a2fb212a688 100644
--- a/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
+++ b/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Example of how to build an external Linux kernel module"
 DESCRIPTION = "${SUMMARY}"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
 
 inherit module
diff --git a/meta-skeleton/recipes-skeleton/hello-autotools/hello_2.10.bb b/meta-skeleton/recipes-skeleton/hello-autotools/hello_2.10.bb
index aa2beb9a9b8..a64088fbaae 100644
--- a/meta-skeleton/recipes-skeleton/hello-autotools/hello_2.10.bb
+++ b/meta-skeleton/recipes-skeleton/hello-autotools/hello_2.10.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "GNU Helloworld application"
 SECTION = "examples"
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "${GNU_MIRROR}/hello/hello-${PV}.tar.gz"
diff --git a/meta-skeleton/recipes-skeleton/service/service_0.1.bb b/meta-skeleton/recipes-skeleton/service/service_0.1.bb
index 2c048aa0509..d1d8c5f3656 100644
--- a/meta-skeleton/recipes-skeleton/service/service_0.1.bb
+++ b/meta-skeleton/recipes-skeleton/service/service_0.1.bb
@@ -1,7 +1,7 @@
 SUMMARY = "The canonical example of init scripts"
 SECTION = "base"
 DESCRIPTION = "This recipe is a canonical example of init scripts"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/COPYRIGHT;md5=349c872e0066155e1818b786938876a4"
 
 SRC_URI = "file://skeleton \
diff --git a/meta/classes/devicetree.bbclass b/meta/classes/devicetree.bbclass
index 8546c1cf80c..7f3b8085729 100644
--- a/meta/classes/devicetree.bbclass
+++ b/meta/classes/devicetree.bbclass
@@ -17,7 +17,7 @@ SECTION ?= "bsp"
 # The default inclusion of kernel device tree includes and headers means that
 # device trees built with them are at least GPLv2 (and in some cases dual
 # licensed). Default to GPLv2 if the recipe does not specify a license.
-LICENSE ?= "GPLv2"
+LICENSE ?= "GPL-2.0-only"
 LIC_FILES_CHKSUM ?= "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
 
 INHIBIT_DEFAULT_DEPS = "1"
diff --git a/meta/recipes-bsp/acpid/acpid.inc b/meta/recipes-bsp/acpid/acpid.inc
index d39828e1cdc..98910bab29d 100644
--- a/meta/recipes-bsp/acpid/acpid.inc
+++ b/meta/recipes-bsp/acpid/acpid.inc
@@ -8,7 +8,7 @@ admin."
 HOMEPAGE = "http://sourceforge.net/projects/acpid2"
 BUGTRACKER = "http://sourceforge.net/p/acpid2/tickets/?source=navbar"
 SECTION = "base"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/acpid2/acpid-${PV}.tar.xz \
            file://init \
diff --git a/meta/recipes-bsp/apmd/apmd_3.2.2-15.bb b/meta/recipes-bsp/apmd/apmd_3.2.2-15.bb
index 1779e8b2a03..92c35c98969 100644
--- a/meta/recipes-bsp/apmd/apmd_3.2.2-15.bb
+++ b/meta/recipes-bsp/apmd/apmd_3.2.2-15.bb
@@ -4,7 +4,7 @@ access to battery status information and a set of tools for managing \
 notebook power consumption."
 HOMEPAGE = "http://apenwarr.ca/apmd/"
 SECTION = "base"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://apm.h;beginline=6;endline=18;md5=7d4acc1250910a89f84ce3cc6557c4c2"
 DEPENDS = "libtool-cross"
diff --git a/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb b/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb
index 3f883122e06..11d8b9061db 100644
--- a/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb
+++ b/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb
@@ -3,7 +3,7 @@ SUMMARY = "EFI Boot Manager"
 HOMEPAGE = "https://github.com/rhboot/efibootmgr"
 SECTION = "base"
 
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 DEPENDS = "efivar popt"
diff --git a/meta/recipes-bsp/efivar/efivar_38.bb b/meta/recipes-bsp/efivar/efivar_38.bb
index 5d2cd470ce5..68c4b4b914a 100644
--- a/meta/recipes-bsp/efivar/efivar_38.bb
+++ b/meta/recipes-bsp/efivar/efivar_38.bb
@@ -2,7 +2,7 @@ SUMMARY = "Tools to manipulate UEFI variables"
 DESCRIPTION = "efivar provides a simple command line interface to the UEFI variable facility"
 HOMEPAGE = "https://github.com/rhboot/efivar"
 
-LICENSE = "LGPLv2.1+"
+LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6626bb1e20189cfa95f2c508ba286393"
 
 COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.14.bb b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.14.bb
index 04dadc39d42..c746c2a1b86 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.14.bb
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.14.bb
@@ -2,7 +2,7 @@ SUMMARY = "Libraries for producing EFI binaries"
 HOMEPAGE = "http://sourceforge.net/projects/gnu-efi/"
 DESCRIPTION = "GNU-EFI aims to Develop EFI applications for ARM-64, ARM-32, x86_64, IA-64 (IPF), IA-32 (x86), and MIPS platforms using the GNU toolchain and the EFI development environment."
 SECTION = "devel"
-LICENSE = "GPLv2+ | BSD-2-Clause"
+LICENSE = "GPL-2.0-or-later | BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://gnuefi/crt0-efi-arm.S;beginline=4;endline=16;md5=e582764a4776e60c95bf9ab617343d36 \
                     file://gnuefi/crt0-efi-aarch64.S;beginline=4;endline=16;md5=e582764a4776e60c95bf9ab617343d36 \
                     file://inc/efishellintf.h;beginline=13;endline=20;md5=202766b79d708eff3cc70fce15fb80c7 \
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index a3cfe82f010..d112bcb8a79 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -8,7 +8,7 @@ standard, which allows for flexible loading of multiple boot images."
 HOMEPAGE = "http://www.gnu.org/software/grub/"
 SECTION = "bootloaders"
 
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 CVE_PRODUCT = "grub2"
diff --git a/meta/recipes-bsp/keymaps/keymaps_1.0.bb b/meta/recipes-bsp/keymaps/keymaps_1.0.bb
index 091bcc60911..020328b3ca6 100644
--- a/meta/recipes-bsp/keymaps/keymaps_1.0.bb
+++ b/meta/recipes-bsp/keymaps/keymaps_1.0.bb
@@ -4,7 +4,7 @@ SECTION = "base"
 
 RDEPENDS:${PN} = "kbd"
 
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 PR = "r31"
diff --git a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
index 5f383319e2f..a34fb4eb036 100644
--- a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
+++ b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
@@ -5,7 +5,7 @@ These programs use error correcting protocols ({z,x,y}modem) to send (sz, sx, sb
 receive (rz, rx, rb) files over a dial-in serial port from a variety of programs \
 running under various operating systems. "
 HOMEPAGE = "http://www.ohse.de/uwe/software/lrzsz.html"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 			file://src/lrz.c;beginline=1;endline=10;md5=5276956373ff7d8758837f6399a1045f"
 SECTION = "console/network"
diff --git a/meta/recipes-bsp/pciutils/pciutils_3.7.0.bb b/meta/recipes-bsp/pciutils/pciutils_3.7.0.bb
index 3afa5215972..7d1740f665a 100644
--- a/meta/recipes-bsp/pciutils/pciutils_3.7.0.bb
+++ b/meta/recipes-bsp/pciutils/pciutils_3.7.0.bb
@@ -4,7 +4,7 @@ to PCI bus configuration space and several utilities based on this library.'
 HOMEPAGE = "http://atrey.karlin.mff.cuni.cz/~mj/pciutils.shtml"
 SECTION = "console/utils"
 
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 DEPENDS = "zlib kmod"
 
diff --git a/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb b/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
index 0f6d3ff7cb1..c6a4bc49324 100644
--- a/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
+++ b/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
@@ -2,7 +2,7 @@ SECTION = "base"
 SUMMARY = "Utilities and scripts for power management"
 DESCRIPTION = "Simple shell command line tools to suspend and hibernate."
 HOMEPAGE = "http://pm-utils.freedesktop.org/wiki/"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://src/pm-pmu.c;beginline=1;endline=22;md5=3c1ddbc54e735fb4a0386e14c78a3147"
 
diff --git a/meta/recipes-bsp/setserial/setserial_2.17.bb b/meta/recipes-bsp/setserial/setserial_2.17.bb
index 8dbddd7dc52..5b31cd183b5 100644
--- a/meta/recipes-bsp/setserial/setserial_2.17.bb
+++ b/meta/recipes-bsp/setserial/setserial_2.17.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://setserial.sourceforge.net"
 AUTHOR = "Theodore Ts'o <tytso@mit.edu>"
 SECTION = "console/utils"
 
-LICENSE = "GPLv2.0"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://version.h;beginline=1;endline=6;md5=2e7c59cb9e57e356ae81f50f4e4dfd99"
 PR = "r3"
 
diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb b/meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb
index 6906e5362d7..e8f58941cf5 100644
--- a/meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb
+++ b/meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb
@@ -6,7 +6,7 @@ It provides a hardware-independent replacement for fw_printenv/setenv utilities
 provided by U-Boot"
 
 HOMEPAGE = "https://github.com/sbabic/libubootenv"
-LICENSE = "LGPL-2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://Licenses/lgpl-2.1.txt;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "libs"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index c09b1c2876b..8e78ea4a756 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -6,7 +6,7 @@ application code."
 SECTION = "bootloaders"
 DEPENDS += "flex-native bison-native"
 
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
 PE = "1"
 
diff --git a/meta/recipes-bsp/usbinit/usbinit.bb b/meta/recipes-bsp/usbinit/usbinit.bb
index ef98f0bf62e..ffaca4b58d9 100644
--- a/meta/recipes-bsp/usbinit/usbinit.bb
+++ b/meta/recipes-bsp/usbinit/usbinit.bb
@@ -4,7 +4,7 @@ all sorts of nifty things like SSH and NFS in one go plus charging over the \
 same wire, at higher speeds than most Wifi connections."
 HOMEPAGE = "http://linux-sunxi.org/USB_Gadget/Ethernet"
 
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe"
 
 PR = "r3"
diff --git a/meta/recipes-bsp/usbutils/usbutils_014.bb b/meta/recipes-bsp/usbutils/usbutils_014.bb
index ef3fd749c04..08304e61904 100644
--- a/meta/recipes-bsp/usbutils/usbutils_014.bb
+++ b/meta/recipes-bsp/usbutils/usbutils_014.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Contains the lsusb utility for inspecting the devices connected t
 HOMEPAGE = "http://www.linux-usb.org"
 SECTION = "base"
 
-LICENSE = "GPLv2+ & (GPLv2 | GPLv3)"
+LICENSE = "GPL-2.0-or-later & (GPL-2.0-only | GPLv3)"
 # License files went missing in 010, when 011 is released add LICENSES/* back
 LIC_FILES_CHKSUM = "file://lsusb.c;endline=1;md5=7226e442a172bcf25807246d7ef1eba1 \
                     file://lsusb.py.in;beginline=2;endline=2;md5=c443ada211d701156e42ea36d41625b3 \
@@ -21,8 +21,8 @@ ALTERNATIVE:${PN} = "lsusb"
 ALTERNATIVE_PRIORITY = "100"
 
 # The binaries are mostly GPLv2+ apart from lsusb.py which is GPLv2 or v3.
-LICENSE:${PN} = "GPLv2+"
-LICENSE:${PN}-python = "GPLv2 | GPLv3"
+LICENSE:${PN} = "GPL-2.0-or-later"
+LICENSE:${PN}-python = "GPL-2.0-only | GPL-3.0-only"
 
 RRECOMMENDS:${PN} = "udev-hwdb"
 
diff --git a/meta/recipes-bsp/v86d/v86d_0.1.10.bb b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
index b011276f47f..5f342b1120e 100644
--- a/meta/recipes-bsp/v86d/v86d_0.1.10.bb
+++ b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://tracker.debian.org/pkg/v86d"
 DESCRIPTION = "v86d provides a backend for kernel drivers that need to execute x86 BIOS code. The code is executed in a controlled environment and the results are passed back to the kernel via the netlink interface."
 
 # the copyright info is at the bottom of README, expect break
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://README;md5=94ac1971e4f2309dc322d598e7b1f7dd"
 
 DEPENDS = "virtual/kernel"
diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index b768ab322ed..3e020e6780d 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -12,7 +12,7 @@ SECTION = "network"
 
 # major part is under LGPLv2.1+, but several .dtd, .xsl, initscripts and
 # python scripts are under GPLv2+
-LICENSE = "GPLv2+ & LGPLv2.1+"
+LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://avahi-common/address.h;endline=25;md5=b1d1d2cda1c07eb848ea7d6215712d9d \
                     file://avahi-core/dns.h;endline=23;md5=6fe82590b81aa0ddea5095b548e2fdcb \
@@ -109,15 +109,15 @@ FILES:avahi-discover = "${datadir}/applications/avahi-discover.desktop \
                         ${bindir}/avahi-discover-standalone \
                         "
 
-LICENSE:libavahi-gobject = "LGPLv2.1+"
-LICENSE:avahi-daemon = "LGPLv2.1+"
-LICENSE:libavahi-common = "LGPLv2.1+"
-LICENSE:libavahi-core = "LGPLv2.1+"
-LICENSE:libavahi-client = "LGPLv2.1+"
-LICENSE:avahi-dnsconfd = "LGPLv2.1+"
-LICENSE:libavahi-glib = "LGPLv2.1+"
-LICENSE:avahi-autoipd = "LGPLv2.1+"
-LICENSE:avahi-utils = "LGPLv2.1+"
+LICENSE:libavahi-gobject = "LGPL-2.1-or-later"
+LICENSE:avahi-daemon = "LGPL-2.1-or-later"
+LICENSE:libavahi-common = "LGPL-2.1-or-later"
+LICENSE:libavahi-core = "LGPL-2.1-or-later"
+LICENSE:libavahi-client = "LGPL-2.1-or-later"
+LICENSE:avahi-dnsconfd = "LGPL-2.1-or-later"
+LICENSE:libavahi-glib = "LGPL-2.1-or-later"
+LICENSE:avahi-autoipd = "LGPL-2.1-or-later"
+LICENSE:avahi-utils = "LGPL-2.1-or-later"
 
 # As avahi doesn't put any files into PN, clear the files list to avoid problems
 # if extra libraries appear.
diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 0a5fc9d4b8b..79d4645ca89 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -2,7 +2,7 @@ SUMMARY = "Linux Bluetooth Stack Userland V5"
 DESCRIPTION = "Linux Bluetooth stack V5 userland components.  These include a system configurations, daemons, tools and system libraries."
 HOMEPAGE = "http://www.bluez.org"
 SECTION = "libs"
-LICENSE = "GPLv2+ & LGPLv2.1+"
+LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
                     file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
                     file://src/main.c;beginline=1;endline=24;md5=0ad83ca0dc37ab08af448777c581e7ac"
diff --git a/meta/recipes-connectivity/connman/connman-conf.bb b/meta/recipes-connectivity/connman/connman-conf.bb
index 97ac49818c9..6b9207c4cb5 100644
--- a/meta/recipes-connectivity/connman/connman-conf.bb
+++ b/meta/recipes-connectivity/connman/connman-conf.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Connman config to ignore wired interface on qemu machines"
 DESCRIPTION = "This is the ConnMan configuration to avoid touching wired \
 network interface inside qemu machines."
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
 
 PR = "r2"
diff --git a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
index 7e1619aab2a..fcd154b4b00 100644
--- a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
+++ b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
@@ -1,7 +1,7 @@
 SUMMARY = "GTK+ frontend for the ConnMan network connection manager"
 HOMEPAGE = "http://connman.net/"
 SECTION = "libs/network"
-LICENSE = "GPLv2 & LGPLv2.1"
+LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
                     file://properties/main.c;beginline=1;endline=20;md5=50c77c81871308b033ab7a1504626afb \
                     file://common/connman-dbus.c;beginline=1;endline=20;md5=de6b485c0e717a0236402d220187717a"
diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 748eefa7487..5880ecd5d46 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -9,7 +9,7 @@ configuration methods, like DHCP and domain name resolving, are \
 implemented using plug-ins."
 HOMEPAGE = "http://connman.net/"
 BUGTRACKER = "https://01.org/jira/browse/CM"
-LICENSE  = "GPLv2"
+LICENSE  = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
                     file://src/main.c;beginline=1;endline=20;md5=486a279a6ab0c8d152bcda3a5b5edc36"
 
diff --git a/meta/recipes-connectivity/inetutils/inetutils_2.2.bb b/meta/recipes-connectivity/inetutils/inetutils_2.2.bb
index 3bab137eb4a..6c9a299b71f 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_2.2.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_2.2.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://www.gnu.org/software/inetutils"
 SECTION = "net"
 DEPENDS = "ncurses netbase readline virtual/crypt"
 
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=0c7051aef9219dc7237f206c5c4179a7"
 
diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes-connectivity/iproute2/iproute2.inc
index 3f070d67993..b1bcc1434c7 100644
--- a/meta/recipes-connectivity/iproute2/iproute2.inc
+++ b/meta/recipes-connectivity/iproute2/iproute2.inc
@@ -5,7 +5,7 @@ and tc are the most important.  ip controls IPv4 and IPv6 \
 configuration and tc stands for traffic control."
 HOMEPAGE = "http://www.linuxfoundation.org/collaborate/workgroups/networking/iproute2"
 SECTION = "base"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
                     file://ip/ip.c;beginline=3;endline=8;md5=689d691d0410a4b64d3899f8d6e31817"
 
diff --git a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb
index f5c87f72913..0db609fc473 100644
--- a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb
+++ b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/lathiat/nss-mdns"
 DESCRIPTION = "nss-mdns is a plugin for the GNU Name Service Switch (NSS) functionality of the GNU C Library (glibc) providing host name resolution via Multicast DNS (aka Zeroconf, aka Apple Rendezvous, aka Apple Bonjour), effectively allowing name resolution by common Unix/Linux programs in the ad-hoc mDNS domain .local."
 SECTION = "libs"
 
-LICENSE = "LGPLv2.1+"
+LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 DEPENDS = "avahi"
diff --git a/meta/recipes-connectivity/neard/neard_0.16.bb b/meta/recipes-connectivity/neard/neard_0.16.bb
index b6cc1d6cedf..57f2a3e2e1e 100644
--- a/meta/recipes-connectivity/neard/neard_0.16.bb
+++ b/meta/recipes-connectivity/neard/neard_0.16.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Linux NFC daemon"
 DESCRIPTION = "A daemon for the Linux Near Field Communication stack"
 HOMEPAGE = "http://01.org/linux-nfc"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 
 DEPENDS = "dbus glib-2.0 libnl"
 
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.1.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.1.bb
index 4ad8a018443..bbed5aea59b 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.1.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.1.bb
@@ -4,7 +4,7 @@ NFS server and related tools."
 HOMEPAGE = "http://nfs.sourceforge.net/"
 SECTION = "console/network"
 
-LICENSE = "MIT & GPLv2+ & BSD-3-Clause"
+LICENSE = "MIT & GPL-2.0-or-later & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=95f3a93a5c3c7888de623b46ea085a84"
 
 # util-linux for libblkid
diff --git a/meta/recipes-connectivity/ofono/ofono_1.34.bb b/meta/recipes-connectivity/ofono/ofono_1.34.bb
index 24369b3ba5c..23631747a73 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.34.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.34.bb
@@ -2,7 +2,7 @@ SUMMARY = "open source telephony"
 DESCRIPTION = "oFono is a stack for mobile telephony devices on Linux. oFono supports speaking to telephony devices through specific drivers, or with generic AT commands."
 HOMEPAGE = "http://www.ofono.org"
 BUGTRACKER = "https://01.org/jira/browse/OF"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
                     file://src/ofono.h;beginline=1;endline=20;md5=3ce17d5978ef3445def265b98899c2ee"
 DEPENDS = "dbus glib-2.0 udev mobile-broadband-provider-info ell"
diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.9.bb b/meta/recipes-connectivity/ppp/ppp_2.4.9.bb
index bd6435e69cc..700ece61dce 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.4.9.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.4.9.bb
@@ -5,7 +5,7 @@ SECTION = "console/network"
 HOMEPAGE = "http://samba.org/ppp/"
 BUGTRACKER = "http://ppp.samba.org/cgi-bin/ppp-bugs"
 DEPENDS = "libpcap openssl virtual/crypt"
-LICENSE = "BSD-3-Clause & BSD-3-Clause-Attribution & GPLv2+ & LGPLv2+ & PD"
+LICENSE = "BSD-3-Clause & BSD-3-Clause-Attribution & GPL-2.0-or-later & LGPL-2.0-or-later & PD"
 LIC_FILES_CHKSUM = "file://pppd/ccp.c;beginline=1;endline=29;md5=e2c43fe6e81ff77d87dc9c290a424dea \
                     file://pppd/plugins/passprompt.c;beginline=1;endline=10;md5=3bcbcdbf0e369c9a3e0b8c8275b065d8 \
                     file://pppd/tdb.c;beginline=1;endline=27;md5=4ca3a9991b011038d085d6675ae7c4e6 \
diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb
index cb25238eba3..94fd2c1a708 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb
@@ -5,7 +5,7 @@ itself up as the intermediary between programs that supply \
 nameserver information and programs that need nameserver \
 information."
 SECTION = "console/network"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
 AUTHOR = "Thomas Hood"
 HOMEPAGE = "http://packages.debian.org/resolvconf"
diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index c3ecd81c4a0..ff83567bd91 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -2,7 +2,7 @@ SUMMARY = "Miscellaneous files for the base system"
 DESCRIPTION = "The base-files package creates the basic system directory structure and provides a small set of key configuration files for the system."
 SECTION = "base"
 PR = "r89"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://licenses/GPL-2;md5=94d55d512a9ba36caa9b7df079bae19f"
 # Removed all license related tasks in this recipe as license.bbclass 
 # now deals with this. In order to get accurate licensing on to the image:
diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
index 2926a377c6f..9a27ad3ab5a 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
@@ -2,7 +2,7 @@ SUMMARY = "Base system master password/group files"
 DESCRIPTION = "The master copies of the user database files (/etc/passwd and /etc/group).  The update-passwd tool is also provided to keep the system databases synchronized with these master files."
 HOMEPAGE = "https://launchpad.net/base-passwd"
 SECTION = "base"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 
 RECIPE_NO_UPDATE_REASON = "Version 3.5.38 requires cdebconf for update-passwd utility"
diff --git a/meta/recipes-core/busybox/busybox-inittab_1.35.0.bb b/meta/recipes-core/busybox/busybox-inittab_1.35.0.bb
index be8c06323ce..868d7a230f6 100644
--- a/meta/recipes-core/busybox/busybox-inittab_1.35.0.bb
+++ b/meta/recipes-core/busybox/busybox-inittab_1.35.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "inittab configuration for BusyBox"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
 
 SRC_URI = "file://inittab"
diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 622325aabb3..69fa4997375 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -7,7 +7,7 @@ DEPENDS += "kern-tools-native virtual/crypt"
 
 # bzip2 applet in busybox is based on lightly-modified bzip2-1.0.4 source
 # the GPL is version 2 only
-LICENSE = "GPLv2 & bzip2-1.0.4"
+LICENSE = "GPL-2.0-only & bzip2-1.0.4"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=de10de48642ab74318e893a61105afbb \
                     file://archival/libarchive/bz/LICENSE;md5=28e3301eae987e8cfe19988e98383dae"
 
diff --git a/meta/recipes-core/coreutils/coreutils_9.0.bb b/meta/recipes-core/coreutils/coreutils_9.0.bb
index de7bb982439..6a97c4d5ccc 100644
--- a/meta/recipes-core/coreutils/coreutils_9.0.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.0.bb
@@ -4,7 +4,7 @@ manipulation utilities. These are the core utilities which are expected to exist
 every system."
 HOMEPAGE = "http://www.gnu.org/software/coreutils/"
 BUGTRACKER = "http://debbugs.gnu.org/coreutils"
-LICENSE = "GPLv3+"
+LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
                     file://src/ls.c;beginline=1;endline=15;md5=3b8fbaee597c8a9bb88d30840d53048c \
                     "
diff --git a/meta/recipes-core/dbus-wait/dbus-wait_git.bb b/meta/recipes-core/dbus-wait/dbus-wait_git.bb
index b39f7523c0d..f2eb8b1874e 100644
--- a/meta/recipes-core/dbus-wait/dbus-wait_git.bb
+++ b/meta/recipes-core/dbus-wait/dbus-wait_git.bb
@@ -2,7 +2,7 @@ SUMMARY = "A simple tool to wait for a specific signal over DBus"
 HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/dbus-wait"
 DESCRIPTION = "${SUMMARY}"
 SECTION = "base"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "dbus"
diff --git a/meta/recipes-core/dbus/dbus-glib_0.112.bb b/meta/recipes-core/dbus/dbus-glib_0.112.bb
index 99b0a200048..4acf4356942 100644
--- a/meta/recipes-core/dbus/dbus-glib_0.112.bb
+++ b/meta/recipes-core/dbus/dbus-glib_0.112.bb
@@ -2,7 +2,7 @@ SUMMARY = "High level language (GLib) binding for D-Bus"
 DESCRIPTION = "GLib bindings for the D-Bus message bus that integrate \
 the D-Bus library with the GLib thread abstraction and main loop."
 HOMEPAGE = "https://www.freedesktop.org/Software/dbus"
-LICENSE = "AFL-2.1 | GPLv2+"
+LICENSE = "AFL-2.1 | GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c31c73c1d8f5d06784b2ccd22e42d641 \
                     file://dbus/dbus-glib.h;beginline=7;endline=21;md5=c374833bd817988323f3a8fda0dc7f48"
 SECTION = "base"
diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index adc138bf105..a43bf656291 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -1,6 +1,6 @@
 inherit autotools pkgconfig gettext upstream-version-is-even
 
-LICENSE = "AFL-2.1 | GPLv2+"
+LICENSE = "AFL-2.1 | GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
                     file://dbus/dbus.h;beginline=6;endline=20;md5=7755c9d7abccd5dbd25a6a974538bb3c"
 
diff --git a/meta/recipes-core/ell/ell_0.48.bb b/meta/recipes-core/ell/ell_0.48.bb
index 737302a444a..6c5d3150346 100644
--- a/meta/recipes-core/ell/ell_0.48.bb
+++ b/meta/recipes-core/ell/ell_0.48.bb
@@ -7,7 +7,7 @@ libdl (for dynamic linking). While ELL is designed to be efficient \
 and compact enough for use on embedded Linux platforms, it is not \
 limited to resource-constrained systems."
 SECTION = "libs"
-LICENSE  = "LGPLv2.1"
+LICENSE  = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
 
 DEPENDS = "dbus"
diff --git a/meta/recipes-core/gettext/gettext_0.21.bb b/meta/recipes-core/gettext/gettext_0.21.bb
index a0f34029049..30c1955d862 100644
--- a/meta/recipes-core/gettext/gettext_0.21.bb
+++ b/meta/recipes-core/gettext/gettext_0.21.bb
@@ -5,7 +5,7 @@ naming organization for the message catalogs themselves, a runtime library suppo
 a few stand-alone programs to massage in various ways the sets of translatable and already translated strings."
 HOMEPAGE = "http://www.gnu.org/software/gettext/gettext.html"
 SECTION = "libs"
-LICENSE = "GPLv3+ & LGPL-2.1+"
+LICENSE = "GPL-3.0-or-later & LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c678957b0c8e964aa6c70fd77641a71e"
 
 DEPENDS = "gettext-native virtual/libiconv"
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 0eef2e330c3..268e48a088b 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -4,7 +4,7 @@ HOMEPAGE = "https://developer.gnome.org/glib/"
 
 # pcre is under BSD;
 # docs/reference/COPYING is with a 'public domain'-like license!
-LICENSE = "LGPLv2.1+ & BSD-3-Clause & PD"
+LICENSE = "LGPL-2.1-or-later & BSD-3-Clause & PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://glib/glib.h;beginline=4;endline=17;md5=b88abb7f3ad09607e71cb9d530155906 \
                     file://gmodule/COPYING;md5=4fbd65380cdd255951079008b364516c \
diff --git a/meta/recipes-core/glib-networking/glib-networking_2.70.1.bb b/meta/recipes-core/glib-networking/glib-networking_2.70.1.bb
index f020e160680..44bc08f1596 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.70.1.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.70.1.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "glib-networking contains the implementations of certain GLib netw
 HOMEPAGE = "https://gitlab.gnome.org/GNOME/glib-networking/"
 BUGTRACKER = "http://bugzilla.gnome.org"
 
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SECTION = "libs"
diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.35.bb b/meta/recipes-core/glibc/cross-localedef-native_2.35.bb
index 893d3764592..b7b54e9ccc5 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.35.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.35.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Cross locale generation tool for glibc"
 HOMEPAGE = "http://www.gnu.org/software/libc/libc.html"
 SECTION = "libs"
-LICENSE = "LGPL-2.1"
+LICENSE = "LGPL-2.1-only"
 
 LIC_FILES_CHKSUM = "file://LICENSES;md5=1541fd8f5e8f1579512bf05f533371ba \
       file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
diff --git a/meta/recipes-core/glibc/glibc-common.inc b/meta/recipes-core/glibc/glibc-common.inc
index 098ebbc932d..90a6a534f31 100644
--- a/meta/recipes-core/glibc/glibc-common.inc
+++ b/meta/recipes-core/glibc/glibc-common.inc
@@ -2,7 +2,7 @@ SUMMARY = "GLIBC (GNU C Library)"
 DESCRIPTION = "The GNU C Library is used as the system C library in most systems with the Linux kernel."
 HOMEPAGE = "http://www.gnu.org/software/libc/libc.html"
 SECTION = "libs"
-LICENSE = "GPLv2 & LGPLv2.1"
+LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 
 LIC_FILES_CHKSUM ?= "file://LICENSES;md5=1541fd8f5e8f1579512bf05f533371ba \
       file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
diff --git a/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb b/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb
index fd1630b73b0..e867ceb3ec3 100644
--- a/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb
+++ b/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb
@@ -1,6 +1,6 @@
 SUMMARY = "A standalone native ldconfig build"
 
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 
 LIC_FILES_CHKSUM = "file://${S}/ldconfig.c;endline=17;md5=1d15f20937c055cb5de2329a4c054399"
 
diff --git a/meta/recipes-core/ifupdown/ifupdown_0.8.37.bb b/meta/recipes-core/ifupdown/ifupdown_0.8.37.bb
index 1b980abe068..57d4152a398 100644
--- a/meta/recipes-core/ifupdown/ifupdown_0.8.37.bb
+++ b/meta/recipes-core/ifupdown/ifupdown_0.8.37.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "High level tools to configure network interfaces \
 This package provides the tools ifup and ifdown which may be used to \
 configure (or, respectively, deconfigure) network interfaces, based on \
 the file /etc/network/interfaces."
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI = "git://salsa.debian.org/debian/ifupdown.git;protocol=https;branch=master \
diff --git a/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb b/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
index 741da324d03..d39323db2f5 100644
--- a/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
+++ b/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Basic TCP/IP networking init scripts and configuration files"
 DESCRIPTION = "This package provides high level tools to configure network interfaces"
 HOMEPAGE = "http://packages.debian.org/ifupdown"
 SECTION = "base"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/copyright;md5=3dd6192d306f582dee7687da3d8748ab"
 PR = "r7"
 
diff --git a/meta/recipes-core/initscripts/init-system-helpers_1.60.bb b/meta/recipes-core/initscripts/init-system-helpers_1.60.bb
index 46952e46851..187bb8326b2 100644
--- a/meta/recipes-core/initscripts/init-system-helpers_1.60.bb
+++ b/meta/recipes-core/initscripts/init-system-helpers_1.60.bb
@@ -13,7 +13,7 @@ specific to systemd at all. Maintainers of other init systems are welcome to \
 include their helpers in this package."
 HOMEPAGE = "https://salsa.debian.org/debian/init-system-helpers"
 SECTION = "base"
-LICENSE = "BSD-3-Clause & GPLv2"
+LICENSE = "BSD-3-Clause & GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=ee2b1830fcfead84d07bc060ec43e072"
 
 SRCREV = "dbd9197569c0935029acd5c9b02b84c68fd937ee"
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index e4c48132202..9429e5881df 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "SysV init scripts"
 HOMEPAGE = "https://github.com/fedora-sysv/initscripts"
 DESCRIPTION = "Initscripts provide the basic system startup initialization scripts for the system.  These scripts include actions such as filesystem mounting, fsck, RTC manipulation and other actions routinely performed at system startup.  In addition, the scripts are also used during system shutdown to reverse the actions performed at startup."
 SECTION = "base"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 PR = "r155"
 
diff --git a/meta/recipes-core/kbd/kbd_2.4.0.bb b/meta/recipes-core/kbd/kbd_2.4.0.bb
index 7cb45eff779..5328e5ec3c2 100644
--- a/meta/recipes-core/kbd/kbd_2.4.0.bb
+++ b/meta/recipes-core/kbd/kbd_2.4.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Keytable files and keyboard utilities"
 HOMEPAGE = "http://www.kbd-project.org/"
 DESCRIPTION = "The kbd project contains tools for managing Linux console (Linux console, virtual terminals, keyboard, etc.) – mainly, what they do is loading console fonts and keyboard maps."
 # everything minus console-fonts is GPLv2+
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=892f569a555ba9c07a568a7c0c4fa63a"
 
 inherit autotools gettext pkgconfig
diff --git a/meta/recipes-core/libcgroup/libcgroup_2.0.bb b/meta/recipes-core/libcgroup/libcgroup_2.0.bb
index a58dd88ea54..cb0156d9d86 100644
--- a/meta/recipes-core/libcgroup/libcgroup_2.0.bb
+++ b/meta/recipes-core/libcgroup/libcgroup_2.0.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "libcgroup is a library that abstracts the control group file syst
 in Linux. Control groups allow you to limit, account and isolate resource usage \
 (CPU, memory, disk I/O, etc.) of groups of processes."
 SECTION = "libs"
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 inherit autotools pkgconfig
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index 58d4c56ddfd..39ba2636ff8 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -2,7 +2,7 @@ SUMMARY = "Extended cryptographic library (from glibc)"
 DESCRIPTION = "Forked code from glibc libary to extract only crypto part."
 HOMEPAGE = "https://github.com/besser82/libxcrypt"
 SECTION = "libs"
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSING;md5=c0a30e2b1502c55a7f37e412cd6c6a4b \
                     file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
                     "
diff --git a/meta/recipes-core/musl/musl-obstack.bb b/meta/recipes-core/musl/musl-obstack.bb
index 74de48c2cd7..4df24c013be 100644
--- a/meta/recipes-core/musl/musl-obstack.bb
+++ b/meta/recipes-core/musl/musl-obstack.bb
@@ -4,7 +4,7 @@
 SUMMARY = "A standalone library to implement GNU libc's obstack"
 DESCRIPTION = "copy + paste of the obstack functions and macros found in GNU gcc libiberty library for use with musl libc"
 HOMEPAGE = "https://github.com/pullmoll/musl-obstack"
-LICENSE = "GPL-2.0+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3d23e4eef8243efcaab6f0a438078932"
 SECTION = "libs"
 
diff --git a/meta/recipes-core/musl/musl-utils.bb b/meta/recipes-core/musl/musl-utils.bb
index 00d088d0899..c42dff3a537 100644
--- a/meta/recipes-core/musl/musl-utils.bb
+++ b/meta/recipes-core/musl/musl-utils.bb
@@ -3,7 +3,7 @@
 
 DESCRIPTION = "getconf, getent and iconv implementations for musl"
 HOMEPAGE = "https://git.alpinelinux.org/cgit/aports/tree/main/musl"
-LICENSE = "BSD-2-Clause & GPL-2.0+"
+LICENSE = "BSD-2-Clause & GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9d08215e611db87b357e8674b4b42564"
 SECTION = "utils"
 
diff --git a/meta/recipes-core/netbase/netbase_6.3.bb b/meta/recipes-core/netbase/netbase_6.3.bb
index 0a7a9d71edb..bec6498cdd7 100644
--- a/meta/recipes-core/netbase/netbase_6.3.bb
+++ b/meta/recipes-core/netbase/netbase_6.3.bb
@@ -2,7 +2,7 @@ SUMMARY = "Basic TCP/IP networking support"
 DESCRIPTION = "This package provides the necessary infrastructure for basic TCP/IP based networking"
 HOMEPAGE = "http://packages.debian.org/netbase"
 SECTION = "base"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=3dd6192d306f582dee7687da3d8748ab"
 PE = "1"
 
diff --git a/meta/recipes-core/newlib/newlib.inc b/meta/recipes-core/newlib/newlib.inc
index bfecfe086ef..27b52a43afd 100644
--- a/meta/recipes-core/newlib/newlib.inc
+++ b/meta/recipes-core/newlib/newlib.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "https://sourceware.org/newlib/"
 DESCRIPTION = "C library intended for use on embedded systems. It is a conglomeration of several library parts, all under free software licenses that make them easily usable on embedded products."
 SECTION = "libs"
 
-LICENSE = "GPLv2 & LGPLv3 & GPLv3 & LGPLv2 & BSD-2-Clause & BSD-3-Clause & tcl"
+LICENSE = "GPL-2.0-only & LGPL-3.0-only & GPL-3.0-only & LGPL-2.0-only & BSD-2-Clause & BSD-3-Clause & TCL"
 LIC_FILES_CHKSUM = " \
 		file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 		file://COPYING3.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index ca5a1ea8e1a..edc0ac1d896 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -2,7 +2,7 @@ SUMMARY = "Userspace framebuffer boot logo based on usplash"
 DESCRIPTION = "PSplash is a userspace graphical boot splash screen for mainly embedded Linux devices supporting a 16bpp or 32bpp framebuffer. It has few dependencies (just libc), supports basic images and text and handles rotation. Its visual look is configurable by basic source changes. Also included is a 'client' command utility for sending information to psplash such as boot progress information."
 HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/psplash"
 SECTION = "base"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://psplash.h;beginline=1;endline=8;md5=8f232c1e95929eacab37f00900580224"
 DEPENDS = "gdk-pixbuf-native"
 
diff --git a/meta/recipes-core/readline/readline.inc b/meta/recipes-core/readline/readline.inc
index 569e4ff6e99..24a3301285d 100644
--- a/meta/recipes-core/readline/readline.inc
+++ b/meta/recipes-core/readline/readline.inc
@@ -7,7 +7,7 @@ SECTION = "libs"
 HOMEPAGE = "https://tiswww.case.edu/php/chet/readline/rltop.html"
 
 # GPLv2+ (< 6.0), GPLv3+ (>= 6.0)
-LICENSE = "GPLv3+"
+LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 DEPENDS += "ncurses"
diff --git a/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb b/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
index 72f8069e61e..c90a02f1319 100644
--- a/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
+++ b/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
@@ -2,9 +2,9 @@ SUMMARY = "Tools for working with sysfs"
 DESCRIPTION = "Tools for working with the sysfs virtual filesystem.  The tool 'systool' can query devices by bus, class and topology."
 HOMEPAGE = "http://linux-diag.sourceforge.net/Sysfsutils.html"
 
-LICENSE = "GPLv2 & LGPLv2.1"
-LICENSE:${PN} = "GPLv2"
-LICENSE:libsysfs = "LGPLv2.1"
+LICENSE = "GPL-2.0-only & LGPL-2.1-only"
+LICENSE:${PN} = "GPL-2.0-only"
+LICENSE:libsysfs = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3d06403ea54c7574a9e581c6478cc393 \
                     file://cmd/GPL;md5=d41d4e2e1e108554e0388ea4aecd8d27 \
                     file://lib/LGPL;md5=b75d069791103ffe1c0d6435deeff72e"
diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb b/meta/recipes-core/systemd/systemd-serialgetty.bb
index 7ca951cdbdb..fd888bb8340 100644
--- a/meta/recipes-core/systemd/systemd-serialgetty.bb
+++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Serial terminal support for systemd"
 HOMEPAGE = "https://www.freedesktop.org/wiki/Software/systemd/"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
 
 PR = "r5"
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 9a460c187b6..e69738add52 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -10,7 +10,7 @@ state, maintains mount and automount points and implements an \
 elaborate transactional dependency-based service control logic. It can \
 work as a drop-in replacement for sysvinit."
 
-LICENSE = "GPLv2 & LGPLv2.1"
+LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
index bfcf51c35a2..7aad2e2bf2e 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Inittab configuration for SysVinit"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
 
 PR = "r10"
diff --git a/meta/recipes-core/sysvinit/sysvinit_3.01.bb b/meta/recipes-core/sysvinit/sysvinit_3.01.bb
index 9952f834ecc..844f5f01756 100644
--- a/meta/recipes-core/sysvinit/sysvinit_3.01.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_3.01.bb
@@ -2,7 +2,7 @@ SUMMARY = "System-V like init"
 DESCRIPTION = "This package is required to boot in most configurations.  It provides the /sbin/init program.  This is the first process started on boot, and the last process terminated before the system halts."
 HOMEPAGE = "http://savannah.nongnu.org/projects/sysvinit/"
 SECTION = "base"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://COPYRIGHT;endline=15;md5=a1d3b3526501d3546d530bbe6ab6cdbe \
                     "
diff --git a/meta/recipes-core/udev/eudev_3.2.10.bb b/meta/recipes-core/udev/eudev_3.2.10.bb
index 347495cbdb0..dec16be046c 100644
--- a/meta/recipes-core/udev/eudev_3.2.10.bb
+++ b/meta/recipes-core/udev/eudev_3.2.10.bb
@@ -1,8 +1,8 @@
 SUMMARY = "eudev is a fork of systemd's udev"
 HOMEPAGE = "https://wiki.gentoo.org/wiki/Eudev"
 DESCRIPTION = "eudev is Gentoo's fork of udev, systemd's device file manager for the Linux kernel. It manages device nodes in /dev and handles all user space actions when adding or removing devices."
-LICENSE = "GPLv2.0+ & LGPL-2.1+"
-LICENSE:libudev = "LGPL-2.1+"
+LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
+LICENSE:libudev = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 DEPENDS = "glib-2.0 glib-2.0-native gperf-native kmod libxslt-native util-linux"
diff --git a/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb b/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
index daee5c224b4..ee491984293 100644
--- a/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
+++ b/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://github.com/philb/update-rc.d/"
 DESCRIPTION = "update-rc.d is a utility that allows the management of symlinks to the initscripts in the /etc/rcN.d directory structure."
 SECTION = "base"
 
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://update-rc.d;beginline=5;endline=15;md5=d40a07c27f535425934bb5001f2037d9"
 
 SRC_URI = "git://git.yoctoproject.org/update-rc.d;branch=master"
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index c48f9572f54..982ec669a27 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -6,11 +6,11 @@ disk partitioning, kernel message management, filesystem creation, and system lo
 
 SECTION = "base"
 
-LICENSE = "GPLv2+ & LGPLv2.1+ & BSD-3-Clause & BSD-4-Clause"
-LICENSE:${PN}-libblkid = "LGPLv2.1+"
-LICENSE:${PN}-libfdisk = "LGPLv2.1+"
-LICENSE:${PN}-libmount = "LGPLv2.1+"
-LICENSE:${PN}-libsmartcols = "LGPLv2.1+"
+LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later & BSD-3-Clause & BSD-4-Clause"
+LICENSE:${PN}-libblkid = "LGPL-2.1-or-later"
+LICENSE:${PN}-libfdisk = "LGPL-2.1-or-later"
+LICENSE:${PN}-libmount = "LGPL-2.1-or-later"
+LICENSE:${PN}-libsmartcols = "LGPL-2.1-or-later"
 
 LIC_FILES_CHKSUM = "file://README.licensing;md5=0fd5c050c6187d2bf0a4492b7f4e33da \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
diff --git a/meta/recipes-devtools/apt/apt_2.2.4.bb b/meta/recipes-devtools/apt/apt_2.2.4.bb
index 4e710e11a8e..aef309840b4 100644
--- a/meta/recipes-devtools/apt/apt_2.2.4.bb
+++ b/meta/recipes-devtools/apt/apt_2.2.4.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Advanced front-end for dpkg"
 DESCRIPTION = "APT is the Advanced Package Tool, an advanced interface to the Debian packaging system which provides the apt-get program."
 HOMEPAGE = "https://packages.debian.org/jessie/apt"
-LICENSE = "GPLv2.0+"
+LICENSE = "GPL-2.0-or-later"
 SECTION = "base"
 
 # Triehash script taken from https://github.com/julian-klode/triehash
diff --git a/meta/recipes-devtools/autoconf/autoconf_2.71.bb b/meta/recipes-devtools/autoconf/autoconf_2.71.bb
index 324e6f8de5c..799191e2ca4 100644
--- a/meta/recipes-devtools/autoconf/autoconf_2.71.bb
+++ b/meta/recipes-devtools/autoconf/autoconf_2.71.bb
@@ -2,7 +2,7 @@ SUMMARY = "A GNU tool that produce shell scripts to automatically configure soft
 DESCRIPTION = "Autoconf is an extensible package of M4 macros that produce shell scripts to automatically \ 
 configure software source code packages. Autoconf creates a configuration script for a package from a template \
 file that lists the operating system features that the package can use, in the form of M4 macro calls."
-LICENSE = "GPLv3+"
+LICENSE = "GPL-3.0-or-later"
 HOMEPAGE = "http://www.gnu.org/software/autoconf/"
 SECTION = "devel"
 DEPENDS = "m4-native autoconf-native automake-native gnu-config-native help2man-native"
diff --git a/meta/recipes-devtools/automake/automake.inc b/meta/recipes-devtools/automake/automake.inc
index ceca16ab6a0..9946c73c715 100644
--- a/meta/recipes-devtools/automake/automake.inc
+++ b/meta/recipes-devtools/automake/automake.inc
@@ -1,7 +1,7 @@
 SUMMARY = "A GNU tool for automatically generating Makefiles"
 DESCRIPTION = "Automake is a tool for automatically generating `Makefile.in' files compliant with the GNU Coding \
 Standards. Automake requires the use of Autoconf."
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 HOMEPAGE = "http://www.gnu.org/software/automake/"
 SECTION = "devel"
 
diff --git a/meta/recipes-devtools/automake/automake_1.16.5.bb b/meta/recipes-devtools/automake/automake_1.16.5.bb
index 6a9c185e4de..ba5ce7b9bb2 100644
--- a/meta/recipes-devtools/automake/automake_1.16.5.bb
+++ b/meta/recipes-devtools/automake/automake_1.16.5.bb
@@ -1,5 +1,5 @@
 require automake.inc
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 DEPENDS:class-native = "autoconf-native"
 
diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index 2f65ae54741..789c8bec21c 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -9,7 +9,7 @@ object information), and other tools and related libraries."
 HOMEPAGE = "http://www.gnu.org/software/binutils/"
 BUGTRACKER = "http://sourceware.org/bugzilla/"
 SECTION = "devel"
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 
 DEPENDS = "flex-native bison-native zlib-native gnu-config-native autoconf-native"
 
diff --git a/meta/recipes-devtools/bison/bison_3.8.2.bb b/meta/recipes-devtools/bison/bison_3.8.2.bb
index 58395c3dce4..c95f321244f 100644
--- a/meta/recipes-devtools/bison/bison_3.8.2.bb
+++ b/meta/recipes-devtools/bison/bison_3.8.2.bb
@@ -4,7 +4,7 @@ an LALR(1) or GLR parser for that grammar.  Bison is upward compatible with Yacc
 grammars ought to work with Bison with no change. Anyone familiar with Yacc should be able to use Bison with \
 little trouble."
 HOMEPAGE = "http://www.gnu.org/software/bison/"
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 SECTION = "devel"
 DEPENDS = "bison-native flex-native"
diff --git a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
index f0349dacf00..b1628075a7d 100644
--- a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
+++ b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
@@ -85,7 +85,7 @@ SUMMARY = "Booting sequence and CPU,I/O usage monitor"
 DESCRIPTION = "Monitors where the system spends its time at start, creating a graph of all processes, disk utilization, and wait time."
 AUTHOR = "Wonhong Kwon <wonhong.kwon@lge.com>"
 HOMEPAGE = "https://github.com/mmeeks/bootchart"
-LICENSE = "GPL-3.0"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=44ac4678311254db62edf8fd39cb8124"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.\d+)*)"
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.bb
index fa7abcf2ba4..e5b2057f262 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.bb
@@ -7,7 +7,7 @@ btrfs and an utility (btrfs-convert) to make a btrfs filesystem from an ext3."
 
 HOMEPAGE = "https://btrfs.wiki.kernel.org"
 
-LICENSE = "GPLv2 & LGPLv2.1+"
+LICENSE = "GPL-2.0-only & LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = " \
     file://COPYING;md5=fcb02dc552a041dee27e4b85c7396067 \
     file://libbtrfsutil/COPYING;md5=4fbd65380cdd255951079008b364516c \
diff --git a/meta/recipes-devtools/ccache/ccache_4.5.1.bb b/meta/recipes-devtools/ccache/ccache_4.5.1.bb
index 26f808978fc..11d939c7aa8 100644
--- a/meta/recipes-devtools/ccache/ccache_4.5.1.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.5.1.bb
@@ -6,7 +6,7 @@ Objective-C and Objective-C++."
 HOMEPAGE = "http://ccache.samba.org"
 SECTION = "devel"
 
-LICENSE = "GPLv3+"
+LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=8fe0fdfdc7a892516526b86c28d06a16"
 
 DEPENDS = "zstd"
diff --git a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
index cd2ca8dbe99..757132eae64 100644
--- a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
+++ b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
@@ -5,7 +5,7 @@ SUMMARY = "A set of tools for CD recording, including cdrecord"
 HOMEPAGE = "http://sourceforge.net/projects/cdrtools/"
 DESCRIPTION = "cdrecord tool is Highly portable CD/DVD/BluRay command line recording software."
 SECTION = "console/utils"
-LICENSE = "GPLv2 & CDDL-1.0 & LGPLv2.1+"
+LICENSE = "GPL-2.0-only & CDDL-1.0 & LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=32f68170be424c2cd64804337726b312"
 
 SRC_URI = " \
diff --git a/meta/recipes-devtools/chrpath/chrpath_0.16.bb b/meta/recipes-devtools/chrpath/chrpath_0.16.bb
index de734e841a2..d33c7837a17 100644
--- a/meta/recipes-devtools/chrpath/chrpath_0.16.bb
+++ b/meta/recipes-devtools/chrpath/chrpath_0.16.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "chrpath allows you to change the rpath (where the \
 application looks for libraries) in an application. It does not \
 (yet) allow you to add an rpath if there isn't one already."
 HOMEPAGE = "https://tracker.debian.org/pkg/chrpath"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/c/${BPN}/${BPN}_${PV}.orig.tar.gz \
diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.18.0.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_0.18.0.bb
index d5fa38d300d..11221140315 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.18.0.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_0.18.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "C implementation of createrepo."
 HOMEPAGE = "https://github.com/rpm-software-management/createrepo_c/wiki"
 
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/rpm-software-management/createrepo_c;branch=master;protocol=https \
diff --git a/meta/recipes-devtools/dejagnu/dejagnu_1.6.3.bb b/meta/recipes-devtools/dejagnu/dejagnu_1.6.3.bb
index bcc56e5500c..895f6d3b36a 100644
--- a/meta/recipes-devtools/dejagnu/dejagnu_1.6.3.bb
+++ b/meta/recipes-devtools/dejagnu/dejagnu_1.6.3.bb
@@ -2,7 +2,7 @@ SUMMARY = "GNU unit testing framework, written in Expect and Tcl"
 DESCRIPTION = "DejaGnu is a framework for testing other programs. Its purpose \
 is to provide a single front end for all tests."
 HOMEPAGE = "https://www.gnu.org/software/dejagnu/"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SECTION = "devel"
 
diff --git a/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb b/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb
index da9a38335cc..f6d1146e892 100644
--- a/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb
+++ b/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb
@@ -2,7 +2,7 @@ SUMMARY = "Command line utilities for working with *.desktop files"
 DESCRIPTION = "desktop-file-utils contains a few command line utilities for working with desktop entries"
 HOMEPAGE = "http://www.freedesktop.org/wiki/Software/desktop-file-utils"
 SECTION = "console/utils"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://src/validator.c;beginline=4;endline=27;md5=281e1114ee6c486a1a0a4295986b9416"
diff --git a/meta/recipes-devtools/distcc/distcc_3.4.bb b/meta/recipes-devtools/distcc/distcc_3.4.bb
index 93983f6aee2..45fc7cde532 100644
--- a/meta/recipes-devtools/distcc/distcc_3.4.bb
+++ b/meta/recipes-devtools/distcc/distcc_3.4.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "distcc is a parallel build system that distributes \
 compilation of C/C++/ObjC code across machines on a network."
 HOMEPAGE = "https://github.com/distcc/distcc"
 SECTION = "devel"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "avahi binutils"
diff --git a/meta/recipes-devtools/dmidecode/dmidecode_3.3.bb b/meta/recipes-devtools/dmidecode/dmidecode_3.3.bb
index 2fe742b7dc2..23540b2703f 100644
--- a/meta/recipes-devtools/dmidecode/dmidecode_3.3.bb
+++ b/meta/recipes-devtools/dmidecode/dmidecode_3.3.bb
@@ -1,7 +1,7 @@
 SUMMARY = "DMI (Desktop Management Interface) table related utilities"
 HOMEPAGE = "http://www.nongnu.org/dmidecode/"
 DESCRIPTION = "Dmidecode reports information about your system's hardware as described in your system BIOS according to the SMBIOS/DMI standard (see a sample output)."
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/dmidecode/${BP}.tar.xz \
diff --git a/meta/recipes-devtools/dnf/dnf_4.10.0.bb b/meta/recipes-devtools/dnf/dnf_4.10.0.bb
index 3f22c1d8f2e..f16e716b0dc 100644
--- a/meta/recipes-devtools/dnf/dnf_4.10.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.10.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Software package manager that installs, updates, and removes \
 packages on RPM-based Linux distributions. It automatically computes \
 dependencies and determines the actions required to install packages."
 HOMEPAGE = "https://github.com/rpm-software-management/dnf"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://PACKAGE-LICENSING;md5=4a0548e303dbc77f067335b4d688e745 \
                     "
diff --git a/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb b/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb
index bdebfc190ab..289d939bb96 100644
--- a/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb
+++ b/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb
@@ -6,7 +6,7 @@ SUMMARY = "DOS FAT Filesystem Utilities"
 HOMEPAGE = "https://github.com/dosfstools/dosfstools"
 
 SECTION = "base"
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "https://github.com/dosfstools/dosfstools/releases/download/v${PV}/${BP}.tar.gz \
diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index 00b1e9187a4..0d17a98b806 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -1,5 +1,5 @@
 SUMMARY = "Package maintenance system from Debian"
-LICENSE = "GPLv2.0+"
+LICENSE = "GPL-2.0-or-later"
 HOMEPAGE = "https://salsa.debian.org/dpkg-team/dpkg"
 DESCRIPTION = "The primary interface for the dpkg suite is the dselect program. A more low-level and less user-friendly interface is available in the form of the dpkg command."
 SECTION = "base"
diff --git a/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb b/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb
index 1a05a1a3871..c596497b8e5 100644
--- a/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb
+++ b/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb
@@ -1,6 +1,6 @@
 SUMMARY = "A small utility for printing debug source file locations embedded in binaries"
 DESCRIPTION = "${SUMMARY}"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://../dwarfsrcfiles.c;md5=31483894e453a77acbb67847565f1b5c;beginline=1;endline=8"
 
 SRC_URI = "file://dwarfsrcfiles.c"
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
index a030fa6fa82..f41a5d0b4ea 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
@@ -3,12 +3,12 @@ DESCRIPTION = "The Ext2 Filesystem Utilities (e2fsprogs) contain all of the stan
 fixing, configuring , and debugging ext2 filesystems."
 HOMEPAGE = "http://e2fsprogs.sourceforge.net/"
 
-LICENSE = "GPLv2 & LGPLv2 & BSD-3-Clause & MIT"
-LICENSE:e2fsprogs-dumpe2fs = "GPLv2"
-LICENSE:e2fsprogs-e2fsck = "GPLv2"
-LICENSE:e2fsprogs-mke2fs = "GPLv2"
-LICENSE:e2fsprogs-tune2fs = "GPLv2"
-LICENSE:e2fsprogs-badblocks = "GPLv2"
+LICENSE = "GPL-2.0-only & LGPL-2.0-only & BSD-3-Clause & MIT"
+LICENSE:e2fsprogs-dumpe2fs = "GPL-2.0-only"
+LICENSE:e2fsprogs-e2fsck = "GPL-2.0-only"
+LICENSE:e2fsprogs-mke2fs = "GPL-2.0-only"
+LICENSE:e2fsprogs-tune2fs = "GPL-2.0-only"
+LICENSE:e2fsprogs-badblocks = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://NOTICE;md5=d50be0580c0b0a7fbc7a4830bbe6c12b \
                       file://lib/ext2fs/ext2fs.h;beginline=1;endline=9;md5=596a8dedcb4e731c6b21c7a46fba6bef \
                       file://lib/e2p/e2p.h;beginline=1;endline=7;md5=8a74ade8f9d65095d70ef2d4bf48e36a \
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.186.bb b/meta/recipes-devtools/elfutils/elfutils_0.186.bb
index 93f53c1f2e4..f2f098eccb9 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.186.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.186.bb
@@ -2,7 +2,7 @@ SUMMARY = "Utilities and libraries for handling compiled object files"
 HOMEPAGE = "https://sourceware.org/elfutils"
 DESCRIPTION = "elfutils is a collection of utilities and libraries to read, create and modify ELF binary files, find and handle DWARF debug data, symbols, thread state and stacktraces for processes and core files on GNU/Linux."
 SECTION = "base"
-LICENSE = "GPLv2 & GPLv2+ & LGPLv3+ & GPLv3+"
+LICENSE = "GPL-2.0-only & GPL-2.0-or-later & LGPL-3.0-or-later & GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://debuginfod/debuginfod-client.c;endline=27;md5=d2adfd8f5347d4c96e3c280393ce66da \
                     "
@@ -107,12 +107,12 @@ PACKAGES =+ "${PN}-binutils libelf libasm libdw libdebuginfod"
 # "The license is now GPLv2/LGPLv3+ for the libraries and GPLv3+ for stand-alone
 # programs. There is now also a formal CONTRIBUTING document describing how to
 # submit patches."
-LICENSE:${PN}-binutils = "GPLv3+"
-LICENSE:${PN} = "GPLv3+"
-LICENSE:libelf = "GPLv2 | LGPLv3+"
-LICENSE:libasm = "GPLv2 | LGPLv3+"
-LICENSE:libdw = "GPLv2 | LGPLv3+"
-LICENSE:libdebuginfod = "GPLv2+ | LGPLv3+"
+LICENSE:${PN}-binutils = "GPL-3.0-or-later"
+LICENSE:${PN} = "GPL-3.0-or-later"
+LICENSE:libelf = "GPL-2.0-only | LGPL-3.0-or-later"
+LICENSE:libasm = "GPL-2.0-only | LGPL-3.0-or-later"
+LICENSE:libdw = "GPL-2.0-only | LGPL-3.0-or-later"
+LICENSE:libdebuginfod = "GPL-2.0-or-later | LGPL-3.0-or-later"
 
 FILES:${PN}-binutils = "\
     ${bindir}/eu-addr2line \
diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils_1.4.bb b/meta/recipes-devtools/erofs-utils/erofs-utils_1.4.bb
index 6ac8a37163a..16014d5b208 100644
--- a/meta/recipes-devtools/erofs-utils/erofs-utils_1.4.bb
+++ b/meta/recipes-devtools/erofs-utils/erofs-utils_1.4.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Tools for erofs filesystems"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 SECTION = "base"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94fa01670a2a8f2d3ab2de15004e0848"
 HOMEPAGE = "https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/tree/README"
diff --git a/meta/recipes-devtools/fdisk/gptfdisk_1.0.8.bb b/meta/recipes-devtools/fdisk/gptfdisk_1.0.8.bb
index c5a153ab0cd..67b83b6eadc 100644
--- a/meta/recipes-devtools/fdisk/gptfdisk_1.0.8.bb
+++ b/meta/recipes-devtools/fdisk/gptfdisk_1.0.8.bb
@@ -2,7 +2,7 @@ SUMMARY = "Utility for modifying GPT disk partitioning"
 DESCRIPTION = "GPT fdisk is a disk partitioning tool loosely modeled on Linux fdisk, but used for modifying GUID Partition Table (GPT) disks. The related FixParts utility fixes some common problems on Master Boot Record (MBR) disks."
 HOMEPAGE = "https://sourceforge.net/projects/gptfdisk/"
 
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 DEPENDS = "util-linux"
diff --git a/meta/recipes-devtools/flex/flex_2.6.4.bb b/meta/recipes-devtools/flex/flex_2.6.4.bb
index a3d5698adef..c7cd9653470 100644
--- a/meta/recipes-devtools/flex/flex_2.6.4.bb
+++ b/meta/recipes-devtools/flex/flex_2.6.4.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Flex is a fast lexical analyser generator.  Flex is a tool for ge
 lexical patterns in text."
 HOMEPAGE = "http://sourceforge.net/projects/flex/"
 SECTION = "devel"
-LICENSE = "BSD-3-Clause & LGPL-2.0+"
+LICENSE = "BSD-3-Clause & LGPL-2.0-or-later"
 LICENSE:${PN}-libfl = "BSD-3-Clause"
 
 DEPENDS = "${@bb.utils.contains('PTEST_ENABLED', '1', 'bison-native flex-native', '', d)}"
diff --git a/meta/recipes-devtools/gcc/gcc-11.2.inc b/meta/recipes-devtools/gcc/gcc-11.2.inc
index f789c0b5ad7..2394c86e297 100644
--- a/meta/recipes-devtools/gcc/gcc-11.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-11.2.inc
@@ -13,7 +13,7 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"
 DEPENDS =+ "mpfr gmp libmpc zlib flex-native"
 NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native flex-native"
 
-LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
+LICENSE = "GPL-3.0-with-GCC-exception & GPL-3.0-only"
 
 LIC_FILES_CHKSUM = "\
     file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index cf801b192bf..649ee287276 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -1,4 +1,4 @@
-LICENSE = "GPLv2 & GPLv3 & LGPLv2 & LGPLv3"
+LICENSE = "GPL-2.0-only & GPL-3.0-only & LGPL-2.0-only & LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 		    file://COPYING3;md5=d32239bcb673463ab874e80d47fae504 \
 		    file://COPYING3.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
diff --git a/meta/recipes-devtools/git/git_2.35.1.bb b/meta/recipes-devtools/git/git_2.35.1.bb
index a333458d5f1..0cff3ce1001 100644
--- a/meta/recipes-devtools/git/git_2.35.1.bb
+++ b/meta/recipes-devtools/git/git_2.35.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "Distributed version control system"
 HOMEPAGE = "http://git-scm.com"
 DESCRIPTION = "Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency."
 SECTION = "console/utils"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 DEPENDS = "openssl curl zlib expat"
 
 PROVIDES:append:class-native = " git-replacement-native"
diff --git a/meta/recipes-devtools/help2man/help2man_1.49.1.bb b/meta/recipes-devtools/help2man/help2man_1.49.1.bb
index a5467c0535e..32c1b2fc063 100644
--- a/meta/recipes-devtools/help2man/help2man_1.49.1.bb
+++ b/meta/recipes-devtools/help2man/help2man_1.49.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "Program for creating simple man pages"
 HOMEPAGE = "https://www.gnu.org/software/help2man/"
 DESCRIPTION = "help2man is a tool for automatically generating simple manual pages from program output."
 SECTION = "devel"
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
diff --git a/meta/recipes-devtools/i2c-tools/i2c-tools_4.3.bb b/meta/recipes-devtools/i2c-tools/i2c-tools_4.3.bb
index 51e4e5d8e98..4e43c51496b 100644
--- a/meta/recipes-devtools/i2c-tools/i2c-tools_4.3.bb
+++ b/meta/recipes-devtools/i2c-tools/i2c-tools_4.3.bb
@@ -2,7 +2,7 @@ SUMMARY = "Set of i2c tools for linux"
 HOMEPAGE = "https://i2c.wiki.kernel.org/index.php/I2C_Tools"
 DESCRIPTION = "The i2c-tools package contains a heterogeneous set of I2C tools for Linux: a bus probing tool, a chip dumper, register-level SMBus access helpers, EEPROM decoding scripts, EEPROM programming tools, and a python module for SMBus access. All versions of Linux are supported, as long as I2C support is included in the kernel."
 SECTION = "base"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 SRC_URI = "${KERNELORG_MIRROR}/software/utils/i2c-tools/${BP}.tar.gz \
diff --git a/meta/recipes-devtools/icecc-create-env/icecc-create-env_0.1.bb b/meta/recipes-devtools/icecc-create-env/icecc-create-env_0.1.bb
index 27014226b52..ea95588c8c4 100644
--- a/meta/recipes-devtools/icecc-create-env/icecc-create-env_0.1.bb
+++ b/meta/recipes-devtools/icecc-create-env/icecc-create-env_0.1.bb
@@ -4,7 +4,7 @@ been modified in order to make it work with OE."
 SECTION = "base"
 # source file has just a "GPL" word, but upstream is GPLv2+.
 # most probably just GPL would be a mistake
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://icecc-create-env;beginline=2;endline=5;md5=ae1df3d6a058bfda40b66094c5f6065f"
 
 PR = "r2"
diff --git a/meta/recipes-devtools/intltool/intltool_0.51.0.bb b/meta/recipes-devtools/intltool/intltool_0.51.0.bb
index 77be30758d5..0f90ab4f1cf 100644
--- a/meta/recipes-devtools/intltool/intltool_0.51.0.bb
+++ b/meta/recipes-devtools/intltool/intltool_0.51.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Utility scripts for internationalizing XML"
 HOMEPAGE = "https://launchpad.net/intltool"
 DESCRIPTION = "Utility scripts for internationalizing XML. This tool automatically extracts translatable strings from oaf, glade, bonobo ui, nautilus theme and other XML files into the po files."
 SECTION = "devel"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI = "http://launchpad.net/${BPN}/trunk/${PV}/+download/${BP}.tar.gz \
diff --git a/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb b/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb
index 6603275d133..dd0a1f8f952 100644
--- a/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb
+++ b/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Libcomps is alternative for yum.comps library (which is for managing rpm package groups)."
 HOMEPAGE = "https://github.com/rpm-software-management/libcomps"
 DESCRIPTION = "Libcomps is alternative for yum.comps library. It's written in pure C as library and there's bindings for python2 and python3."
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/rpm-software-management/libcomps.git;branch=master;protocol=https \
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.65.0.bb b/meta/recipes-devtools/libdnf/libdnf_0.65.0.bb
index 092ad98d4b7..03c56e934a3 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.65.0.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.65.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Library providing simplified C and Python API to libsolv"
 HOMEPAGE = "https://github.com/rpm-software-management/libdnf"
 DESCRIPTION = "This library provides a high level package-manager. It's core library of dnf, PackageKit and rpm-ostree. It's replacement for deprecated hawkey library which it contains inside and uses librepo under the hood."
-LICENSE = "LGPLv2.1+"
+LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master;protocol=https \
diff --git a/meta/recipes-devtools/librepo/librepo_1.14.2.bb b/meta/recipes-devtools/librepo/librepo_1.14.2.bb
index 6cd8090b556..8dece946b46 100644
--- a/meta/recipes-devtools/librepo/librepo_1.14.2.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.14.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "A library providing C and Python (libcURL like) API \
            for downloading linux repository metadata and packages."
 HOMEPAGE = "https://github.com/rpm-software-management/librepo"
 DESCRIPTION = "${SUMMARY}"
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://github.com/rpm-software-management/librepo.git;branch=master;protocol=https \
diff --git a/meta/recipes-devtools/libtool/libtool-2.4.6.inc b/meta/recipes-devtools/libtool/libtool-2.4.6.inc
index a636926ef93..2b5fd8fd942 100644
--- a/meta/recipes-devtools/libtool/libtool-2.4.6.inc
+++ b/meta/recipes-devtools/libtool/libtool-2.4.6.inc
@@ -4,7 +4,7 @@ Libtool hides the complexity of generating special library types \
 (such as shared libraries) behind a consistent interface."
 HOMEPAGE = "http://www.gnu.org/software/libtool/libtool.html"
 SECTION = "devel"
-LICENSE = "GPLv2 & LGPLv2.1"
+LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
     file://libltdl/COPYING.LIB;md5=4fbd65380cdd255951079008b364516c "
 
diff --git a/meta/recipes-devtools/m4/m4-1.4.19.inc b/meta/recipes-devtools/m4/m4-1.4.19.inc
index 0516e495526..2785a3d22cd 100644
--- a/meta/recipes-devtools/m4/m4-1.4.19.inc
+++ b/meta/recipes-devtools/m4/m4-1.4.19.inc
@@ -16,7 +16,7 @@ SRC_URI:append:class-target = " file://run-ptest \
 SRC_URI[md5sum] = "f4a2b0284d80353b995f8ef2385ed73c"
 SRC_URI[sha256sum] = "3be4a26d825ffdfda52a56fc43246456989a3630093cced3fbddf4771ee58a70"
 
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464\
 	            file://examples/COPYING;md5=4031593b2166d6c47cae282d944a7ede"
diff --git a/meta/recipes-devtools/make/make_4.3.bb b/meta/recipes-devtools/make/make_4.3.bb
index 3e0eb543bad..9350bed05a2 100644
--- a/meta/recipes-devtools/make/make_4.3.bb
+++ b/meta/recipes-devtools/make/make_4.3.bb
@@ -1,4 +1,4 @@
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 require make.inc
 
diff --git a/meta/recipes-devtools/makedevs/makedevs_1.0.1.bb b/meta/recipes-devtools/makedevs/makedevs_1.0.1.bb
index 79746260d06..007ebbca89f 100644
--- a/meta/recipes-devtools/makedevs/makedevs_1.0.1.bb
+++ b/meta/recipes-devtools/makedevs/makedevs_1.0.1.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Tool for creating device nodes"
 DESCRIPTION = "${SUMMARY}"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 SECTION = "base"
 SRC_URI = "file://makedevs.c \
diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index 0cd25a507eb..e4faa99e330 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Userspace tools for MMC/SD devices"
 HOMEPAGE = "http://git.kernel.org/cgit/linux/kernel/git/cjb/mmc-utils.git/"
 DESCRIPTION = "${SUMMARY}"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=20;md5=fae32792e20f4d27ade1c5a762d16b7d"
 
 SRCBRANCH ?= "master"
diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
index c05d3b7c35b..3318277477f 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -2,7 +2,7 @@ SUMMARY = "Tools for managing memory technology devices"
 HOMEPAGE = "http://www.linux-mtd.infradead.org/"
 DESCRIPTION = "mtd-utils tool is a generic Linux subsystem for memory devices, especially Flash devices."
 SECTION = "base"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://include/common.h;beginline=1;endline=17;md5=ba05b07912a44ea2bf81ce409380049c"
 
diff --git a/meta/recipes-devtools/mtools/mtools_4.0.37.bb b/meta/recipes-devtools/mtools/mtools_4.0.37.bb
index 20748a00518..3e072b0d934 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.37.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.37.bb
@@ -2,7 +2,7 @@ SUMMARY = "Utilities to access MS-DOS disks without mounting them"
 DESCRIPTION = "Mtools is a collection of utilities to access MS-DOS disks from GNU and Unix without mounting them."
 HOMEPAGE = "http://www.gnu.org/software/mtools/"
 SECTION = "optional"
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 DEPENDS += "virtual/libiconv"
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb
index 21678a27b20..e72c171b927 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Additional utilities for the opkg package manager"
 SUMMARY:update-alternatives-opkg = "Utility for managing the alternatives system"
 SECTION = "base"
 HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://opkg.py;beginline=2;endline=18;md5=ffa11ff3c15eb31c6a7ceaa00cc9f986"
 PROVIDES += "${@bb.utils.contains('PACKAGECONFIG', 'update-alternatives', 'virtual/update-alternatives', '', d)}"
diff --git a/meta/recipes-devtools/opkg/opkg_0.5.0.bb b/meta/recipes-devtools/opkg/opkg_0.5.0.bb
index f7d8abb8063..e91d7250bc9 100644
--- a/meta/recipes-devtools/opkg/opkg_0.5.0.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.5.0.bb
@@ -4,7 +4,7 @@ SECTION = "base"
 HOMEPAGE = "http://code.google.com/p/opkg/"
 DESCRIPTION = "Opkg is a lightweight package management system based on Ipkg."
 BUGTRACKER = "http://code.google.com/p/opkg/issues/list"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://src/opkg.c;beginline=4;endline=18;md5=d6200b0f2b41dee278aa5fad333eecae"
 
diff --git a/meta/recipes-devtools/patch/patch_2.7.6.bb b/meta/recipes-devtools/patch/patch_2.7.6.bb
index b4f986e33a6..e0e44f9c977 100644
--- a/meta/recipes-devtools/patch/patch_2.7.6.bb
+++ b/meta/recipes-devtools/patch/patch_2.7.6.bb
@@ -1,5 +1,5 @@
 require patch.inc
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 
 SRC_URI += "file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
             file://0002-Fix-segfault-with-mangled-rename-patch.patch \
diff --git a/meta/recipes-devtools/patchelf/patchelf_0.14.3.bb b/meta/recipes-devtools/patchelf/patchelf_0.14.3.bb
index 5d41c5edfe7..5d12ef2eb5a 100644
--- a/meta/recipes-devtools/patchelf/patchelf_0.14.3.bb
+++ b/meta/recipes-devtools/patchelf/patchelf_0.14.3.bb
@@ -2,7 +2,7 @@ SUMMARY = "Tool to allow editing of RPATH and interpreter fields in ELF binaries
 DESCRIPTION = "PatchELF is a simple utility for modifying existing ELF executables and libraries."
 HOMEPAGE = "https://github.com/NixOS/patchelf"
 
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 
 SRC_URI = "git://github.com/NixOS/patchelf;protocol=https;branch=master \
            file://handle-read-only-files.patch \
diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb b/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
index b8e1f846d77..75d5ea6d368 100644
--- a/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
+++ b/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/arsv/perl-cross"
 DESCRIPTION = "perl-cross provides configure script, top-level Makefile and some auxiliary files for perl, \
 with the primary emphasis on cross-compiling the source."
 SECTION = "devel"
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 # README.md is taken from https://github.com/arsv/perl-cross/blob/master/README.md
 # but is not provided inside the release tarballs
 LIC_FILES_CHKSUM = "file://${WORKDIR}/README.md;md5=252fcce2026b765fee1ad74d2fb07a3b"
diff --git a/meta/recipes-devtools/perl/liberror-perl_0.17029.bb b/meta/recipes-devtools/perl/liberror-perl_0.17029.bb
index e38d32ac462..497f480347c 100644
--- a/meta/recipes-devtools/perl/liberror-perl_0.17029.bb
+++ b/meta/recipes-devtools/perl/liberror-perl_0.17029.bb
@@ -5,7 +5,7 @@ Secondly Error is a base class for errors/exceptions that can \
 either be thrown, for subsequent catch, or can simply be recorded."
 HOMEPAGE = "https://github.com/shlomif/perl-error.pm"
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8f3499d09ee74a050c0319391ff9d100"
 
diff --git a/meta/recipes-devtools/perl/libmodule-build-perl_0.4231.bb b/meta/recipes-devtools/perl/libmodule-build-perl_0.4231.bb
index 8af38ba6018..e2c79d962be 100644
--- a/meta/recipes-devtools/perl/libmodule-build-perl_0.4231.bb
+++ b/meta/recipes-devtools/perl/libmodule-build-perl_0.4231.bb
@@ -10,7 +10,7 @@ SECTION = "libs"
 
 HOMEPAGE = "https://metacpan.org/release/Module-Build"
 
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=949;endline=954;md5=624c06db56a2af4d70cf9edc29fcae1b"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/Module-Build-${PV}.tar.gz \
diff --git a/meta/recipes-devtools/perl/libtest-needs-perl_0.002009.bb b/meta/recipes-devtools/perl/libtest-needs-perl_0.002009.bb
index 05383752ea8..43a9a6b7d32 100644
--- a/meta/recipes-devtools/perl/libtest-needs-perl_0.002009.bb
+++ b/meta/recipes-devtools/perl/libtest-needs-perl_0.002009.bb
@@ -6,7 +6,7 @@ that are found but fail to compile will exit with an error rather than skip."
 
 HOMEPAGE = "https://metacpan.org/release/Test-Needs"
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
 CPAN_NAME = "Test-Needs"
 CPAN_AUTHOR = "HAARG"
diff --git a/meta/recipes-devtools/perl/liburi-perl_5.08.bb b/meta/recipes-devtools/perl/liburi-perl_5.08.bb
index 0cc27e86257..5428c9ddf9f 100644
--- a/meta/recipes-devtools/perl/liburi-perl_5.08.bb
+++ b/meta/recipes-devtools/perl/liburi-perl_5.08.bb
@@ -5,7 +5,7 @@ and manipulate the various components that make up these strings."
 
 HOMEPAGE = "http://search.cpan.org/dist/URI/"
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c453e94fae672800f83bc1bd7a38b53f"
 
diff --git a/meta/recipes-devtools/perl/libxml-parser-perl_2.46.bb b/meta/recipes-devtools/perl/libxml-parser-perl_2.46.bb
index 3b9206e9841..ef7b287778b 100644
--- a/meta/recipes-devtools/perl/libxml-parser-perl_2.46.bb
+++ b/meta/recipes-devtools/perl/libxml-parser-perl_2.46.bb
@@ -1,7 +1,7 @@
 SUMMARY = "XML::Parser - A perl module for parsing XML documents"
 HOMEPAGE = "https://libexpat.github.io/"
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://Parser.pm;beginline=1;endline=7;md5=d12cc778c80fc4c518f0e5dee29fd5fb"
 
 DEPENDS += "expat"
diff --git a/meta/recipes-devtools/perl/libxml-perl_0.08.bb b/meta/recipes-devtools/perl/libxml-perl_0.08.bb
index b77ad24b58f..323853cc2f3 100644
--- a/meta/recipes-devtools/perl/libxml-perl_0.08.bb
+++ b/meta/recipes-devtools/perl/libxml-perl_0.08.bb
@@ -5,7 +5,7 @@ XML::Grove and others."
 HOMEPAGE = "http://search.cpan.org/dist/libxml-perl/"
 SUMMARY = "Collection of Perl modules for working with XML"
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 PR = "r3"
 
 LIC_FILES_CHKSUM = "file://README;beginline=33;endline=35;md5=1705549eef7577a3d6ba71123a1f0ce8"
diff --git a/meta/recipes-devtools/perl/libxml-simple-perl_2.25.bb b/meta/recipes-devtools/perl/libxml-simple-perl_2.25.bb
index e2938226a9a..791404e5bc4 100644
--- a/meta/recipes-devtools/perl/libxml-simple-perl_2.25.bb
+++ b/meta/recipes-devtools/perl/libxml-simple-perl_2.25.bb
@@ -6,7 +6,7 @@ on top of an underlying XML parsing module to maintain XML files \
 where the original uses plain Perl or SAX parsers."
 HOMEPAGE = "http://search.cpan.org/~markov/XML-LibXML-Simple-0.93/lib/XML/LibXML/Simple.pod"
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=cf206df8c9fe775f1d4c484386491eac"
 DEPENDS += "libxml-parser-perl"
 
diff --git a/meta/recipes-devtools/perl/perl_5.34.0.bb b/meta/recipes-devtools/perl/perl_5.34.0.bb
index e4bcfe3ce69..396d2d11eea 100644
--- a/meta/recipes-devtools/perl/perl_5.34.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.34.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Perl scripting language"
 HOMEPAGE = "http://www.perl.org/"
 DESCRIPTION = "Perl is a highly capable, feature-rich programming language"
 SECTION = "devel"
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://Copying;md5=5b122a36d0f6dc55279a0ebc69f3c60b \
                     file://Artistic;md5=71a4d5d9acc18c0952a6df2218bb68da \
                     "
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
index 16efcef5613..7e5860c18cd 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://pkg-config.freedesktop.org/wiki/"
 BUGTRACKER = "http://bugs.freedesktop.org/buglist.cgi?product=pkg-config"
 SECTION = "console/utils"
 
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRCREV = "d97db4fae4c1cd099b506970b285dc2afd818ea2"
diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
index 7ba414ca25d..7e09b6d58c5 100644
--- a/meta/recipes-devtools/pseudo/pseudo.inc
+++ b/meta/recipes-devtools/pseudo/pseudo.inc
@@ -7,7 +7,7 @@ HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/pseudo"
 DESCRIPTION = "The pseudo utility offers a way to run commands in a virtualized root environment."
 LIC_FILES_CHKSUM = "file://COPYING;md5=a1d8023a6f953ac6ea4af765ff62d574"
 SECTION = "base"
-LICENSE = "LGPL2.1"
+LICENSE = "LGPL-2.1-only"
 DEPENDS = "sqlite3 attr"
 
 FILES:${PN} = "${prefix}/lib/pseudo/lib*/libpseudo.so ${bindir}/* ${localstatedir}/pseudo ${prefix}/var/pseudo"
diff --git a/meta/recipes-devtools/python/python-nose.inc b/meta/recipes-devtools/python/python-nose.inc
index dfae2022995..08c380d637c 100644
--- a/meta/recipes-devtools/python/python-nose.inc
+++ b/meta/recipes-devtools/python/python-nose.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://readthedocs.org/docs/nose/"
 DESCRIPTION = "nose extends the test loading and running features of unittest, \
 making it easier to write, find and run tests."
 SECTION = "devel/python"
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://lgpl.txt;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
 SRC_URI[md5sum] = "4d3ad0ff07b61373d2cefc89c5d0b20b"
diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.25.0.bb b/meta/recipes-devtools/python/python3-dbusmock_0.25.0.bb
index e64e343a1e0..8d97f0d360e 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.25.0.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.25.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "With this program/Python library you can easily create mock objects on D-Bus"
 HOMEPAGE = "https://pypi.org/project/python-dbusmock/"
 
-LICENSE = "GPL-3.0"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
 SRC_URI[sha256sum] = "6f4ce7650ecbb022684dc158df720e199635f3a3df75f7020f4fe8f6ff0394db"
diff --git a/meta/recipes-devtools/python/python3-docutils_0.18.1.bb b/meta/recipes-devtools/python/python3-docutils_0.18.1.bb
index e0fbb2c12d1..4f60b050484 100644
--- a/meta/recipes-devtools/python/python3-docutils_0.18.1.bb
+++ b/meta/recipes-devtools/python/python3-docutils_0.18.1.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Docutils is a modular system for processing documentation into useful formats"
 HOMEPAGE = "http://docutils.sourceforge.net"
 SECTION = "devel/python"
-LICENSE = "PSF & BSD-2-Clause & GPLv3"
+LICENSE = "PSF-2.0 & BSD-2-Clause & GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=fecee07ad8df9116e1f739e2ed2ea513"
 
 SRC_URI[sha256sum] = "679987caf361a7539d76e584cbeddc311e3aee937877c87346f31debc63e9d06"
diff --git a/meta/recipes-devtools/python/python3-iniparse_0.5.bb b/meta/recipes-devtools/python/python3-iniparse_0.5.bb
index b5812d90c34..c18949014b0 100644
--- a/meta/recipes-devtools/python/python3-iniparse_0.5.bb
+++ b/meta/recipes-devtools/python/python3-iniparse_0.5.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Accessing and Modifying INI files"
 HOMEPAGE = "https://pypi.org/project/iniparse/"
-LICENSE = "MIT & PSF"
+LICENSE = "MIT & PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE-PSF;md5=1c78a5bb3584b353496d5f6f34edb4b2 \
                     file://LICENSE;md5=52f28065af11d69382693b45b5a8eb54"
 
diff --git a/meta/recipes-devtools/python/python3-numpy_1.22.2.bb b/meta/recipes-devtools/python/python3-numpy_1.22.2.bb
index ba0a7775514..52fbca94e2c 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.22.2.bb
+++ b/meta/recipes-devtools/python/python3-numpy_1.22.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "A sophisticated Numeric Processing Package for Python"
 HOMEPAGE = "https://numpy.org/"
 DESCRIPTION = "NumPy is the fundamental package needed for scientific computing with Python."
 SECTION = "devel/python"
-LICENSE = "BSD-3-Clause & BSD-2-Clause & PSF & Apache-2.0 & MIT"
+LICENSE = "BSD-3-Clause & BSD-2-Clause & PSF-2.0 & Apache-2.0 & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=8026691468924fb6ec155dadfe2a1a7f"
 
 SRCNAME = "numpy"
diff --git a/meta/recipes-devtools/python/python3-pycairo_1.20.1.bb b/meta/recipes-devtools/python/python3-pycairo_1.20.1.bb
index 9c88d998f94..5c236d40a33 100644
--- a/meta/recipes-devtools/python/python3-pycairo_1.20.1.bb
+++ b/meta/recipes-devtools/python/python3-pycairo_1.20.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "Python bindings for the Cairo canvas library"
 HOMEPAGE = "http://cairographics.org/pycairo"
 BUGTRACKER = "http://bugs.freedesktop.org"
 SECTION = "python-devel"
-LICENSE = "LGPLv2.1 & MPLv1.1"
+LICENSE = "LGPL-2.1-only & MPL-1.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f3713ca2c28d9312ad718520b6dc3eee \
                     file://COPYING-LGPL-2.1;md5=fad9b3332be894bab9bc501572864b29 \
                     file://COPYING-MPL-1.1;md5=bfe1f75d606912a4111c90743d6c7325"
diff --git a/meta/recipes-devtools/python/python3-pygobject_3.42.0.bb b/meta/recipes-devtools/python/python3-pygobject_3.42.0.bb
index 74318337bad..360996dbb7b 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.42.0.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.42.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Python GObject bindings"
 HOMEPAGE = "https://gitlab.gnome.org/GNOME/pygobject"
 DESCRIPTION = "PyGObject is a Python package which provides bindings for GObject based libraries such as GTK, GStreamer, WebKitGTK, GLib, GIO and many more."
 SECTION = "devel/python"
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
 
 GNOMEBASEBUILDCLASS = "meson"
diff --git a/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb b/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb
index ae0154080b8..316dc544de2 100644
--- a/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb
+++ b/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Parsing and validation of URIs (RFC 3986) and IRIs (RFC 3987)"
 HOMEPAGE = "https://pypi.org/project/rfc3987/"
-LICENSE = "GPLv3+"
+LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=9;md5=2b723edf67b2f3088bc5e339b1ceda2d"
 
 SRC_URI[md5sum] = "b6c4028acdc788a9ba697e1c1d6b896c"
diff --git a/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb b/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb
index aa2d5b46f05..b8e929ef886 100644
--- a/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb
+++ b/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Strict, simple, lightweight RFC3339 function.s"
 HOMEPAGE = "https://pypi.org/project/strict-rfc3339/"
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8f0e2cd40e05189ec81232da84bd6e1a"
 
 SRC_URI[md5sum] = "4d9b635b4df885bc37bc1189d66c9abc"
diff --git a/meta/recipes-devtools/python/python3_3.10.2.bb b/meta/recipes-devtools/python/python3_3.10.2.bb
index e26a739e519..429839b6226 100644
--- a/meta/recipes-devtools/python/python3_3.10.2.bb
+++ b/meta/recipes-devtools/python/python3_3.10.2.bb
@@ -1,7 +1,7 @@
 SUMMARY = "The Python Programming Language"
 HOMEPAGE = "http://www.python.org"
 DESCRIPTION = "Python is a programming language that lets you work more quickly and integrate your systems more effectively."
-LICENSE = "PSFv2"
+LICENSE = "PSF-2.0"
 SECTION = "devel/python"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4b8801e752a2c70ac41a5f9aa243f766"
diff --git a/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb b/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
index 08c5ca77004..abba7fe1595 100644
--- a/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
+++ b/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Qemu helper scripts"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 RDEPENDS:${PN} = "nativesdk-qemu \
                   nativesdk-python3-shell nativesdk-python3-fcntl nativesdk-python3-logging \
                 "
diff --git a/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb b/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
index ccf1c467835..aa9e499c772 100644
--- a/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Helper utilities needed by the runqemu script"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 RDEPENDS:${PN} = "qemu-system-native"
 PR = "r1"
 
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index ba4ca1083b4..94190b52f42 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -4,7 +4,7 @@ machine's processor through dynamic binary translation and provides a set \
 of different hardware and device models for the machine, enabling it to run \
 a variety of guest operating systems"
 HOMEPAGE = "http://qemu.org"
-LICENSE = "GPLv2 & LGPLv2.1"
+LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 
 RDEPENDS:${PN}-ptest = "bash"
 
diff --git a/meta/recipes-devtools/quilt/quilt.inc b/meta/recipes-devtools/quilt/quilt.inc
index f85de384d26..06c761ab3ad 100644
--- a/meta/recipes-devtools/quilt/quilt.inc
+++ b/meta/recipes-devtools/quilt/quilt.inc
@@ -4,7 +4,7 @@ track of the changes each patch makes. Patches can be applied, un-applied,\
 refreshed, etc."
 HOMEPAGE = "http://savannah.nongnu.org/projects/quilt/"
 SECTION = "devel"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/quilt/quilt-${PV}.tar.gz \
diff --git a/meta/recipes-devtools/rpm/rpm_4.17.0.bb b/meta/recipes-devtools/rpm/rpm_4.17.0.bb
index 0e852d04e01..c392ac0db4e 100644
--- a/meta/recipes-devtools/rpm/rpm_4.17.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.17.0.bb
@@ -21,7 +21,7 @@ supplied by the RPM Package Manager libraries."
 HOMEPAGE = "http://www.rpm.org"
 
 # libraries are also LGPL - how to express this?
-LICENSE = "GPL-2.0"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c4eec0c20c6034b9407a09945b48a43f"
 
 SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.17.x;protocol=https \
diff --git a/meta/recipes-devtools/rsync/rsync_3.2.3.bb b/meta/recipes-devtools/rsync/rsync_3.2.3.bb
index a0b8aa8336f..b950e30b466 100644
--- a/meta/recipes-devtools/rsync/rsync_3.2.3.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.2.3.bb
@@ -5,7 +5,7 @@ BUGTRACKER = "http://rsync.samba.org/bugzilla.html"
 SECTION = "console/network"
 # GPLv2+ (<< 3.0.0), GPLv3+ (>= 3.0.0)
 # Includes opennsh and xxhash dynamic link exception
-LICENSE = "GPLv3+"
+LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9e5a4f9b3a253d51520617aa54f8eb26"
 
 DEPENDS = "popt"
diff --git a/meta/recipes-devtools/ruby/ruby.inc b/meta/recipes-devtools/ruby/ruby.inc
index 35d3bfd3440..ebff5efd1f5 100644
--- a/meta/recipes-devtools/ruby/ruby.inc
+++ b/meta/recipes-devtools/ruby/ruby.inc
@@ -6,7 +6,7 @@ It is simple, straight-forward, and extensible. \
 "
 HOMEPAGE = "http://www.ruby-lang.org/"
 SECTION = "devel/ruby"
-LICENSE = "Ruby | BSD-2-Clause | BSD-3-Clause | GPLv2 | ISC | MIT"
+LICENSE = "Ruby | BSD-2-Clause | BSD-3-Clause | GPL-2.0-only | ISC | MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5b8c87559868796979806100db3f3805 \
                     file://BSDL;md5=8b50bc6de8f586dc66790ba11d064d75 \
                     file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
index 6a19cba8f78..bffc05e8122 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
@@ -4,7 +4,7 @@ SUMMARY = "Tools for manipulating SquashFS filesystems"
 HOMEPAGE = "https://github.com/plougher/squashfs-tools"
 DESCRIPTION = "Tools to create and extract Squashfs filesystems."
 SECTION = "base"
-LICENSE = "GPL-2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://../COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 PV = "4.5"
diff --git a/meta/recipes-devtools/strace/strace_5.16.bb b/meta/recipes-devtools/strace/strace_5.16.bb
index a9c22d9ae0a..4bde14f9395 100644
--- a/meta/recipes-devtools/strace/strace_5.16.bb
+++ b/meta/recipes-devtools/strace/strace_5.16.bb
@@ -2,7 +2,7 @@ SUMMARY = "System call tracing tool"
 HOMEPAGE = "http://strace.io"
 DESCRIPTION = "strace is a diagnostic, debugging and instructional userspace utility for Linux. It is used to monitor and tamper with interactions between processes and the Linux kernel, which include system calls, signal deliveries, and changes of process state."
 SECTION = "console/utils"
-LICENSE = "LGPL-2.1+ & GPL-2+"
+LICENSE = "LGPL-2.1-or-later & GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59a33f0a3e6122d67c0b3befccbdaa6b"
 
 SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
diff --git a/meta/recipes-devtools/subversion/subversion_1.14.1.bb b/meta/recipes-devtools/subversion/subversion_1.14.1.bb
index a0a9376f3de..71183ac7cec 100644
--- a/meta/recipes-devtools/subversion/subversion_1.14.1.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.14.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "Subversion (svn) version control system client"
 HOMEPAGE = "http://subversion.apache.org"
 DESCRIPTION = "Subversion is an open source version control system."
 SECTION = "console/network"
-LICENSE = "Apache-2 & MIT"
+LICENSE = "Apache-2.0 & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6487ae7094d359fa90fb9c4096e52e2b"
 
 DEPENDS = "apr-util serf sqlite3 file lz4"
diff --git a/meta/recipes-devtools/swig/swig.inc b/meta/recipes-devtools/swig/swig.inc
index e8562a91bb6..13470c10949 100644
--- a/meta/recipes-devtools/swig/swig.inc
+++ b/meta/recipes-devtools/swig/swig.inc
@@ -3,7 +3,7 @@ DESCRIPTION = "SWIG is a compiler that makes it easy to integrate C and C++ \
 code with other languages including Perl, Tcl, Ruby, Python, Java, Guile, \
 Mzscheme, Chicken, OCaml, Pike, and C#."
 HOMEPAGE = "http://swig.sourceforge.net/"
-LICENSE = "BSD-3-Clause & GPLv3"
+LICENSE = "BSD-3-Clause & GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e7807a6282784a7dde4c846626b08fc6 \
                     file://LICENSE-GPL;md5=d32239bcb673463ab874e80d47fae504 \
                     file://LICENSE-UNIVERSITIES;md5=8ce9dcc8f7c994de4a408b205c72ba08"
diff --git a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
index 62aa1b0e877..0e4a23c1b45 100644
--- a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Multi-purpose linux bootloader"
 HOMEPAGE = "http://www.syslinux.org/"
 DESCRIPTION = "The Syslinux Project covers lightweight bootloaders for MS-DOS FAT filesystems (SYSLINUX), network booting (PXELINUX), bootable "El Torito" CD-ROMs (ISOLINUX), and Linux ext2/ext3/ext4 or btrfs filesystems (EXTLINUX). The project also includes MEMDISK, a tool to boot legacy operating systems (such as DOS) from nontraditional media; it is usually used in conjunction with PXELINUX and ISOLINUX."
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://README;beginline=35;endline=41;md5=558f2c71cb1fb9ba511ccd4858e48e8a"
 
diff --git a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_234.bb b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_234.bb
index fe6f0452d45..bc3eee20932 100644
--- a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_234.bb
+++ b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_234.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "For systemd-bootchart, several proc debug interfaces are required
 below is optional, for additional info: \
   CONFIG_SCHED_DEBUG"
 HOMEPAGE = "https://github.com/systemd/systemd-bootchart"
-LICENSE = "LGPLv2.1 & GPLv2"
+LICENSE = "LGPL-2.1-only & GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c \
                     file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe"
 
diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.11.bb b/meta/recipes-devtools/tcltk/tcl_8.6.11.bb
index 66d041cdda2..9f6b003ffbc 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.11.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.11.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "Tool Command Language, is an open-source multi-purpose C library
 SECTION = "devel/tcltk"
 
 # http://www.tcl.tk/software/tcltk/license.html
-LICENSE = "tcl & BSD-3-Clause"
+LICENSE = "TCL & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://license.terms;md5=058f6229798281bbcac4239c788cfa38 \
     file://compat/license.terms;md5=058f6229798281bbcac4239c788cfa38 \
     file://library/license.terms;md5=058f6229798281bbcac4239c788cfa38 \
diff --git a/meta/recipes-devtools/vala/vala.inc b/meta/recipes-devtools/vala/vala.inc
index 1a1115739d8..90e0b77de0c 100644
--- a/meta/recipes-devtools/vala/vala.inc
+++ b/meta/recipes-devtools/vala/vala.inc
@@ -13,7 +13,7 @@ DEPENDS:append:class-target = " ${@bb.utils.contains('DISTRO_FEATURES', 'api-doc
 # vala-native contains a native version of vapigen, which we use instead of the target one
 DEPENDS:append:class-target = " vala-native"
 BBCLASSEXTEND = "native"
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.18.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.18.1.bb
index 2305889ab4e..0c297ad6b93 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.18.1.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.18.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "Valgrind memory debugger and instrumentation framework"
 HOMEPAGE = "http://valgrind.org/"
 DESCRIPTION = "Valgrind is an instrumentation framework for building dynamic analysis tools. There are Valgrind tools that can automatically detect many memory management and threading bugs, and profile your programs in detail."
 BUGTRACKER = "http://valgrind.org/support/bug_reports.html"
-LICENSE = "GPLv2 & GPLv2+ & BSD-3-Clause"
+LICENSE = "GPL-2.0-only & GPL-2.0-or-later & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://include/pub_tool_basics.h;beginline=6;endline=29;md5=41c410e8d3f305aee7aaa666b2e4f366 \
                     file://include/valgrind.h;beginline=1;endline=56;md5=ad3b317f3286b6b704575d9efe6ca5df \
diff --git a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
index 1214901b652..5cb9a4c57be 100644
--- a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
+++ b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
@@ -2,7 +2,7 @@ SUMMARY = "A shell-script tool for converting XML files to various formats"
 HOMEPAGE = "https://pagure.io/xmlto"
 DESCRIPTION = "Utility xmlto is a simple shell-script tool for converting XML files to various formats. It serves as easy to use command line frontend to make fine output without remembering many long options and searching for the syntax of the backends."
 SECTION = "docs/xmlto"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
diff --git a/meta/recipes-extended/acpica/acpica_20211217.bb b/meta/recipes-extended/acpica/acpica_20211217.bb
index f88e904a90e..d1727c1dabd 100644
--- a/meta/recipes-extended/acpica/acpica_20211217.bb
+++ b/meta/recipes-extended/acpica/acpica_20211217.bb
@@ -9,7 +9,7 @@ ACPI tables."
 HOMEPAGE = "http://www.acpica.org/"
 SECTION = "console/tools"
 
-LICENSE = "Intel | BSD-3-Clause | GPLv2"
+LICENSE = "Intel | BSD-3-Clause | GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://source/compiler/aslcompile.c;beginline=7;endline=150;md5=c33ce358fdcd142684e41e336b7992e8"
 
 COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
diff --git a/meta/recipes-extended/asciidoc/asciidoc_10.1.1.bb b/meta/recipes-extended/asciidoc/asciidoc_10.1.1.bb
index 1e7bcae1fb8..8de827f09e8 100644
--- a/meta/recipes-extended/asciidoc/asciidoc_10.1.1.bb
+++ b/meta/recipes-extended/asciidoc/asciidoc_10.1.1.bb
@@ -4,7 +4,7 @@ articles, books and UNIX man pages."
 
 HOMEPAGE = "http://asciidoc.org/"
 
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=4e5d1baf6f20559e3bec172226a47e4e \
                     file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263 "
 
diff --git a/meta/recipes-extended/at/at_3.2.4.bb b/meta/recipes-extended/at/at_3.2.4.bb
index af8c3d6b4c1..6ee9c5e0112 100644
--- a/meta/recipes-extended/at/at_3.2.4.bb
+++ b/meta/recipes-extended/at/at_3.2.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://blog.calhariz.com/"
 DESCRIPTION = "At allows for commands to be run at a particular time.  Batch will execute commands when \
 the system load levels drop to a particular level."
 SECTION = "base"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
 DEPENDS = "flex flex-native bison-native \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
diff --git a/meta/recipes-extended/bash/bash_5.1.16.bb b/meta/recipes-extended/bash/bash_5.1.16.bb
index 468964ff949..45c7c2b09c4 100644
--- a/meta/recipes-extended/bash/bash_5.1.16.bb
+++ b/meta/recipes-extended/bash/bash_5.1.16.bb
@@ -1,7 +1,7 @@
 require bash.inc
 
 # GPLv2+ (< 4.0), GPLv3+ (>= 4.0)
-LICENSE = "GPLv3+"
+LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
diff --git a/meta/recipes-extended/bc/bc_1.07.1.bb b/meta/recipes-extended/bc/bc_1.07.1.bb
index 37f06b72c2d..1bec76bb2aa 100644
--- a/meta/recipes-extended/bc/bc_1.07.1.bb
+++ b/meta/recipes-extended/bc/bc_1.07.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "Arbitrary precision calculator language"
 HOMEPAGE = "http://www.gnu.org/software/bc/bc.html"
 DESCRIPTION = "bc is an arbitrary precision numeric processing language. Syntax is similar to C, but differs in many substantial areas. It supports interactive execution of statements."
 
-LICENSE = "GPLv3+"
+LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://COPYING.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
                     file://bc/bcdefs.h;endline=17;md5=4295c06df9e833519a342f7b5d43db06 \
diff --git a/meta/recipes-extended/blktool/blktool_4-7.1.bb b/meta/recipes-extended/blktool/blktool_4-7.1.bb
index ff2eaa5352b..bb44befb564 100644
--- a/meta/recipes-extended/blktool/blktool_4-7.1.bb
+++ b/meta/recipes-extended/blktool/blktool_4-7.1.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "blktool is used for querying and/or changing settings \
 of a block device. It is like hdparm but a more general tool, as it \
 works on SCSI, IDE and SATA devices."
 HOMEPAGE = "http://packages.debian.org/unstable/admin/blktool"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://blktool.c;beginline=7;endline=8;md5=a5e798ea98fd50972088968a15e5f373"
 
diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
index ab630129225..78138d15434 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
@@ -4,14 +4,14 @@ Huffman coding. Compression is generally considerably better than that achieved
 LZ77/LZ78-based compressors, and approaches the performance of the PPM family of statistical compressors."
 HOMEPAGE = "https://sourceware.org/bzip2/"
 SECTION = "console/utils"
-LICENSE = "bzip2-1.0.6 & GPLv3+ & Apache-2.0 & MS-PL & BSD-3-Clause & Zlib"
+LICENSE = "bzip2-1.0.6 & GPL-3.0-or-later & Apache-2.0 & MS-PL & BSD-3-Clause & Zlib"
 LICENSE:${PN} = "bzip2-1.0.6"
 LICENSE:${PN}-dev = "bzip2-1.0.6"
 LICENSE:${PN}-dbg = "bzip2-1.0.6"
 LICENSE:${PN}-doc = "bzip2-1.0.6"
 LICENSE:${PN}-src = "bzip2-1.0.6"
 LICENSE:libbz2 = "bzip2-1.0.6"
-LICENSE:${PN}-ptest = "bzip2-1.0.6 & GPLv3+ & Apache-2.0 & MS-PL & BSD-3-Clause & Zlib"
+LICENSE:${PN}-ptest = "bzip2-1.0.6 & GPL-3.0-or-later & Apache-2.0 & MS-PL & BSD-3-Clause & Zlib"
 
 LIC_FILES_CHKSUM = "file://LICENSE;beginline=4;endline=37;md5=600af43c50f1fcb82e32f19b32df4664 \
                     file://${WORKDIR}/git/commons-compress/LICENSE.txt;md5=86d3f3a95c324c9479bd8986968f4327 \
diff --git a/meta/recipes-extended/cpio/cpio_2.13.bb b/meta/recipes-extended/cpio/cpio_2.13.bb
index c6015d57b21..e72a114de98 100644
--- a/meta/recipes-extended/cpio/cpio_2.13.bb
+++ b/meta/recipes-extended/cpio/cpio_2.13.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "GNU cpio is a tool for creating and extracting archives, or copyi
 another. It handles a number of cpio formats as well as reading and writing tar files."
 HOMEPAGE = "http://www.gnu.org/software/cpio/"
 SECTION = "base"
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
 
 SRC_URI = "${GNU_MIRROR}/cpio/cpio-${PV}.tar.gz \
diff --git a/meta/recipes-extended/cracklib/cracklib_2.9.7.bb b/meta/recipes-extended/cracklib/cracklib_2.9.7.bb
index 25379623360..629069e8440 100644
--- a/meta/recipes-extended/cracklib/cracklib_2.9.7.bb
+++ b/meta/recipes-extended/cracklib/cracklib_2.9.7.bb
@@ -2,7 +2,7 @@ SUMMARY = "Password strength checker library"
 HOMEPAGE = "https://github.com/cracklib/cracklib"
 DESCRIPTION = "${SUMMARY}"
 
-LICENSE = "LGPLv2.1+"
+LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
 
 DEPENDS = "cracklib-native zlib"
diff --git a/meta/recipes-extended/cronie/cronie_1.5.7.bb b/meta/recipes-extended/cronie/cronie_1.5.7.bb
index 72a45089fd1..8200bedb190 100644
--- a/meta/recipes-extended/cronie/cronie_1.5.7.bb
+++ b/meta/recipes-extended/cronie/cronie_1.5.7.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/cronie-crond/cronie/"
 BUGTRACKER = "https://bugzilla.redhat.com"
 
 # Internet Systems Consortium License
-LICENSE = "ISC & BSD-3-Clause & BSD-2-Clause & GPLv2+"
+LICENSE = "ISC & BSD-3-Clause & BSD-2-Clause & GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=dd2a592170760e1386c769e1043b3722 \
                     file://src/cron.c;endline=20;md5=b425c334265026177128353a142633b4 \
                     file://src/popen.c;beginline=3;endline=31;md5=edd50742d8def712e9472dba353668a9"
diff --git a/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb b/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb
index e726899c529..0e155b6c951 100644
--- a/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb
+++ b/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb
@@ -2,7 +2,7 @@ SUMMARY = "Collection of autoconf m4 macros"
 SECTION = "base"
 HOMEPAGE = "http://sourceforge.net/projects/cwautomacros.berlios/"
 DESCRIPTION = "A collection of autoconf macros, plus an autogen.sh script that can be used with them."
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=eb723b61539feef013de476e68b5c50a"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}.berlios/${BP}.tar.bz2"
diff --git a/meta/recipes-extended/diffutils/diffutils_3.8.bb b/meta/recipes-extended/diffutils/diffutils_3.8.bb
index 12df1598e8a..8c3b9b0e5a2 100644
--- a/meta/recipes-extended/diffutils/diffutils_3.8.bb
+++ b/meta/recipes-extended/diffutils/diffutils_3.8.bb
@@ -1,4 +1,4 @@
-LICENSE = "GPLv3+"
+LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 require diffutils.inc
diff --git a/meta/recipes-extended/ed/ed_1.18.bb b/meta/recipes-extended/ed/ed_1.18.bb
index c1ab1f5ecb7..e1548df15f0 100644
--- a/meta/recipes-extended/ed/ed_1.18.bb
+++ b/meta/recipes-extended/ed/ed_1.18.bb
@@ -2,7 +2,7 @@ SUMMARY = "Line-oriented text editor"
 HOMEPAGE = "http://www.gnu.org/software/ed/"
 DESCRIPTION = "GNU ed is a line-oriented text editor. It is used to create, display, modify and otherwise manipulate text files, both interactively and via shell scripts. A restricted version of ed, red, can only edit files in the current directory and cannot execute shell commands."
 
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=76d6e300ffd8fb9d18bd9b136a9bba13 \
                     file://ed.h;endline=20;md5=6e6a818b0593f937fc63ba08d5e314bf \
                     file://main.c;endline=17;md5=8419a08bb12936f32384a0d1c0f9e74c \
diff --git a/meta/recipes-extended/ethtool/ethtool_5.16.bb b/meta/recipes-extended/ethtool/ethtool_5.16.bb
index 861fe3bb7c8..5dca03d0821 100644
--- a/meta/recipes-extended/ethtool/ethtool_5.16.bb
+++ b/meta/recipes-extended/ethtool/ethtool_5.16.bb
@@ -2,7 +2,7 @@ SUMMARY = "Display or change ethernet card settings"
 DESCRIPTION = "A small utility for examining and tuning the settings of your ethernet-based network interfaces."
 HOMEPAGE = "http://www.kernel.org/pub/software/network/ethtool/"
 SECTION = "console/network"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://ethtool.c;beginline=4;endline=17;md5=c19b30548c582577fc6b443626fc1216"
 
diff --git a/meta/recipes-extended/findutils/findutils_4.9.0.bb b/meta/recipes-extended/findutils/findutils_4.9.0.bb
index cd9a1691e3d..63560a42999 100644
--- a/meta/recipes-extended/findutils/findutils_4.9.0.bb
+++ b/meta/recipes-extended/findutils/findutils_4.9.0.bb
@@ -1,7 +1,7 @@
 require findutils.inc
 
 # GPLv2+ (<< 4.2.32), GPLv3+ (>= 4.2.32)
-LICENSE = "GPLv3+"
+LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 DEPENDS = "bison-native"
diff --git a/meta/recipes-extended/gawk/gawk_5.1.1.bb b/meta/recipes-extended/gawk/gawk_5.1.1.bb
index 8990253c5e5..40f994ff942 100644
--- a/meta/recipes-extended/gawk/gawk_5.1.1.bb
+++ b/meta/recipes-extended/gawk/gawk_5.1.1.bb
@@ -8,7 +8,7 @@ SECTION = "console/utils"
 
 # gawk <= 3.1.5: GPLv2
 # gawk >= 3.1.6: GPLv3
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 PACKAGECONFIG ??= "readline"
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
index 8190f07c4d2..c28e62f089c 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
@@ -10,7 +10,7 @@ dot-matrix, inkjet and laser models. \
 HOMEPAGE = "http://www.ghostscript.com"
 SECTION = "console/utils"
 
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f98ffa763e50cded76f49bce73aade16"
 
 DEPENDS = "ghostscript-native tiff jpeg fontconfig cups libpng"
diff --git a/meta/recipes-extended/gperf/gperf_3.1.bb b/meta/recipes-extended/gperf/gperf_3.1.bb
index f61b2a329af..82750fca05c 100644
--- a/meta/recipes-extended/gperf/gperf_3.1.bb
+++ b/meta/recipes-extended/gperf/gperf_3.1.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "GNU gperf is a perfect hash function generator"
 HOMEPAGE = "http://www.gnu.org/software/gperf"
 SUMMARY  = "Generate a perfect hash function from a set of keywords"
-LICENSE  = "GPLv3+"
+LICENSE  = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://src/main.cc;beginline=8;endline=19;md5=dec8f611845d047387ed56b5b85fa99b"
 
diff --git a/meta/recipes-extended/grep/grep_3.7.bb b/meta/recipes-extended/grep/grep_3.7.bb
index b0b89de83da..40390c25d93 100644
--- a/meta/recipes-extended/grep/grep_3.7.bb
+++ b/meta/recipes-extended/grep/grep_3.7.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://savannah.gnu.org/projects/grep/"
 DESCRIPTION = "Grep searches one or more input files for lines containing a match to a specified pattern. By default, grep prints the matching lines."
 BUGTRACKER = "http://savannah.gnu.org/bugs/?group=grep"
 SECTION = "console/utils"
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 SRC_URI = "${GNU_MIRROR}/grep/grep-${PV}.tar.xz"
diff --git a/meta/recipes-extended/groff/groff_1.22.4.bb b/meta/recipes-extended/groff/groff_1.22.4.bb
index d0b543ab6e2..b281544aab1 100644
--- a/meta/recipes-extended/groff/groff_1.22.4.bb
+++ b/meta/recipes-extended/groff/groff_1.22.4.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "The groff (GNU troff) software is a typesetting package which rea
 formatting commands and produces formatted output."
 SECTION = "base"
 HOMEPAGE = "http://www.gnu.org/software/groff/"
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
diff --git a/meta/recipes-extended/gzip/gzip_1.11.bb b/meta/recipes-extended/gzip/gzip_1.11.bb
index eb3054cc48c..cff4ed17172 100644
--- a/meta/recipes-extended/gzip/gzip_1.11.bb
+++ b/meta/recipes-extended/gzip/gzip_1.11.bb
@@ -1,6 +1,6 @@
 require gzip.inc
 
-LICENSE = "GPLv3+"
+LICENSE = "GPL-3.0-or-later"
 
 SRC_URI = "${GNU_MIRROR}/gzip/${BP}.tar.gz \
            file://run-ptest \
diff --git a/meta/recipes-extended/hdparm/hdparm_9.63.bb b/meta/recipes-extended/hdparm/hdparm_9.63.bb
index e286610d6a2..7900a310a3a 100644
--- a/meta/recipes-extended/hdparm/hdparm_9.63.bb
+++ b/meta/recipes-extended/hdparm/hdparm_9.63.bb
@@ -4,10 +4,10 @@ DESCRIPTION = "hdparm is a Linux shell utility for viewing \
 and manipulating various IDE drive and driver parameters."
 SECTION = "console/utils"
 
-LICENSE = "BSD-2-Clause & GPLv2 & hdparm"
+LICENSE = "BSD-2-Clause & GPL-2.0-only & hdparm"
 LICENSE:${PN} = "BSD-2-Clause & hdparm"
 LICENSE:${PN}-dbg = "BSD-2-Clause & hdparm"
-LICENSE:wiper = "GPLv2"
+LICENSE:wiper = "GPL-2.0-only"
 NO_GENERIC_LICENSE[hdparm] = "LICENSE.TXT"
 
 LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=495d03e50dc6c89d6a30107ab0df5b03 \
diff --git a/meta/recipes-extended/iptables/iptables_1.8.7.bb b/meta/recipes-extended/iptables/iptables_1.8.7.bb
index 93af96b77dd..69b4a48039b 100644
--- a/meta/recipes-extended/iptables/iptables_1.8.7.bb
+++ b/meta/recipes-extended/iptables/iptables_1.8.7.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "iptables is the userspace command line program used to configure
 filtering code in Linux."
 HOMEPAGE = "http://www.netfilter.org/"
 BUGTRACKER = "http://bugzilla.netfilter.org/"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://iptables/iptables.c;beginline=13;endline=25;md5=c5cffd09974558cf27d0f763df2a12dc \
 "
diff --git a/meta/recipes-extended/iputils/iputils_20211215.bb b/meta/recipes-extended/iputils/iputils_20211215.bb
index b01100085be..3ddce0be54b 100644
--- a/meta/recipes-extended/iputils/iputils_20211215.bb
+++ b/meta/recipes-extended/iputils/iputils_20211215.bb
@@ -4,7 +4,7 @@ tracepath, tracepath6, ping, ping6 and arping."
 HOMEPAGE = "https://github.com/iputils/iputils"
 SECTION = "console/network"
 
-LICENSE = "BSD-3-Clause & GPLv2+"
+LICENSE = "BSD-3-Clause & GPL-2.0-or-later"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bb64c89bb0e23b72930d2380894c47a1"
 
diff --git a/meta/recipes-extended/less/less_600.bb b/meta/recipes-extended/less/less_600.bb
index 707870feeb4..8b715fac6bb 100644
--- a/meta/recipes-extended/less/less_600.bb
+++ b/meta/recipes-extended/less/less_600.bb
@@ -19,7 +19,7 @@ SECTION = "console/utils"
 # --Mark
 #
 
-LICENSE = "GPLv3+ | BSD-2-Clause"
+LICENSE = "GPL-3.0-or-later | BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
                     file://LICENSE;md5=38fc26d78ca8d284a2a5a4bbc263d29b \
                     "
diff --git a/meta/recipes-extended/libaio/libaio_0.3.112.bb b/meta/recipes-extended/libaio/libaio_0.3.112.bb
index 3892f3244e1..859ba65c9fa 100644
--- a/meta/recipes-extended/libaio/libaio_0.3.112.bb
+++ b/meta/recipes-extended/libaio/libaio_0.3.112.bb
@@ -2,7 +2,7 @@ SUMMARY = "Asynchronous I/O library"
 DESCRIPTION = "Asynchronous input/output library that uses the kernels native interface"
 HOMEPAGE = "http://lse.sourceforge.net/io/aio.html"
 
-LICENSE = "LGPLv2.1+"
+LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499"
 
 SRC_URI = "git://pagure.io/libaio.git;protocol=https;branch=master \
diff --git a/meta/recipes-extended/libidn/libidn2_2.3.2.bb b/meta/recipes-extended/libidn/libidn2_2.3.2.bb
index f1f6fcba052..8331efb6d92 100644
--- a/meta/recipes-extended/libidn/libidn2_2.3.2.bb
+++ b/meta/recipes-extended/libidn/libidn2_2.3.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "Internationalized Domain Name support library"
 DESCRIPTION = "Implementation of the Stringprep, Punycode and IDNA specifications defined by the IETF Internationalized Domain Names (IDN) working group."
 HOMEPAGE = "http://www.gnu.org/software/libidn/"
 SECTION = "libs"
-LICENSE = "(GPLv2+ | LGPLv3) & GPLv3+"
+LICENSE = "(GPL-2.0-or-later | LGPLv3) & GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d834ea7d480438ada04e5d846152395 \
                     file://COPYING.LESSERv3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
                     file://COPYINGv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
@@ -25,7 +25,7 @@ do_install:append() {
 	sed -i -e 's|-L${STAGING_LIBDIR}||' -e 's/  */ /g' ${D}${libdir}/pkgconfig/libidn2.pc
 }
 
-LICENSE:${PN} = "(GPLv2+ | LGPLv3)"
-LICENSE:${PN}-bin = "GPLv3+"
+LICENSE:${PN} = "(GPL-2.0-or-later | LGPLv3)"
+LICENSE:${PN}-bin = "GPL-3.0-or-later"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-extended/libmnl/libmnl_1.0.4.bb b/meta/recipes-extended/libmnl/libmnl_1.0.4.bb
index b55bb311f6e..4dbd9c24506 100644
--- a/meta/recipes-extended/libmnl/libmnl_1.0.4.bb
+++ b/meta/recipes-extended/libmnl/libmnl_1.0.4.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Minimalistic user-space library oriented to Netlink developers, p
     functions for common tasks in parsing, validating, and constructing both the Netlink header and TLVs."
 HOMEPAGE = "https://www.netfilter.org/projects/libmnl/index.html"
 SECTION = "libs"
-LICENSE = "LGPLv2.1+"
+LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://netfilter.org/projects/libmnl/files/libmnl-${PV}.tar.bz2;name=tar"
diff --git a/meta/recipes-extended/libnsl/libnsl2_git.bb b/meta/recipes-extended/libnsl/libnsl2_git.bb
index 3f6ccbad70d..7919ef9b246 100644
--- a/meta/recipes-extended/libnsl/libnsl2_git.bb
+++ b/meta/recipes-extended/libnsl/libnsl2_git.bb
@@ -5,7 +5,7 @@ SUMMARY = "Library containing NIS functions using TI-RPC (IPv6 enabled)"
 DESCRIPTION = "This library contains the public client interface for NIS(YP) and NIS+\
                it was part of glibc and now is standalone packages. it also supports IPv6"
 HOMEPAGE = "https://github.com/thkukuk/libnsl"
-LICENSE = "LGPL-2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "libs"
 DEPENDS = "libtirpc"
diff --git a/meta/recipes-extended/libnss-nis/libnss-nis.bb b/meta/recipes-extended/libnss-nis/libnss-nis.bb
index 478e9e2be3b..d0afb3ca0ae 100644
--- a/meta/recipes-extended/libnss-nis/libnss-nis.bb
+++ b/meta/recipes-extended/libnss-nis/libnss-nis.bb
@@ -8,7 +8,7 @@ This code was formerly part of glibc, but is now standalone to\
 be able to link against TI-RPC for IPv6 support."
 
 HOMEPAGE = "https://github.com/thkukuk/libnss_nis"
-LICENSE = "LGPL-2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "libs"
 DEPENDS += "libtirpc libnsl2"
diff --git a/meta/recipes-extended/libpipeline/libpipeline_1.5.5.bb b/meta/recipes-extended/libpipeline/libpipeline_1.5.5.bb
index 44d9ed24d65..67072e8c99d 100644
--- a/meta/recipes-extended/libpipeline/libpipeline_1.5.5.bb
+++ b/meta/recipes-extended/libpipeline/libpipeline_1.5.5.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "This is a C library for setting up and running pipelines of proce
 without needing to involve shell command-line parsing which is often \
 error-prone and insecure."
 HOMEPAGE = "http://libpipeline.nongnu.org/"
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/libpipeline/libpipeline-${PV}.tar.gz"
diff --git a/meta/recipes-extended/logrotate/logrotate_3.19.0.bb b/meta/recipes-extended/logrotate/logrotate_3.19.0.bb
index a61b6840961..2a60d9b31f0 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.19.0.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.19.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Rotates, compresses, removes and mails system log files"
 SECTION = "console/utils"
 HOMEPAGE = "https://github.com/logrotate/logrotate/"
 DESCRIPTION = "The logrotate utility is designed to simplify the administration of log files on a system which generates a lot of log files."
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 
 # TODO: Document coreutils dependency. Why not RDEPENDS? Why not busybox?
 
diff --git a/meta/recipes-extended/lsb/lsb-release_1.4.bb b/meta/recipes-extended/lsb/lsb-release_1.4.bb
index a3bcaf51c34..ad16554e985 100644
--- a/meta/recipes-extended/lsb/lsb-release_1.4.bb
+++ b/meta/recipes-extended/lsb/lsb-release_1.4.bb
@@ -1,7 +1,7 @@
 SUMMARY = "lsb_release support for OpenEmbedded"
 SECTION = "console/utils"
 HOMEPAGE = "https://sourceforge.net/projects/lsb/files"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 
 # lsb_release needs getopt
 RDEPENDS:${PN} += "${VIRTUAL-RUNTIME_getopt}"
diff --git a/meta/recipes-extended/ltp/ltp_20220121.bb b/meta/recipes-extended/ltp/ltp_20220121.bb
index 655f99f8381..8a13dcf9d0d 100644
--- a/meta/recipes-extended/ltp/ltp_20220121.bb
+++ b/meta/recipes-extended/ltp/ltp_20220121.bb
@@ -2,7 +2,7 @@ SUMMARY = "Linux Test Project"
 DESCRIPTION = "The Linux Test Project is a joint project with SGI, IBM, OSDL, and Bull with a goal to deliver test suites to the open source community that validate the reliability, robustness, and stability of Linux. The Linux Test Project is a collection of tools for testing the Linux kernel and related features."
 HOMEPAGE = "https://linux-test-project.github.io/"
 SECTION = "console/utils"
-LICENSE = "GPLv2 & GPLv2+ & LGPLv2+ & LGPLv2.1+ & BSD-2-Clause"
+LICENSE = "GPL-2.0-only & GPL-2.0-or-later & LGPL-2.0-or-later & LGPL-2.1-or-later & BSD-2-Clause"
 LIC_FILES_CHKSUM = "\
     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
     file://testcases/open_posix_testsuite/COPYING;md5=48b1c5ec633e3e30ec2cf884ae699947 \
diff --git a/meta/recipes-extended/lzip/lzip_1.23.bb b/meta/recipes-extended/lzip/lzip_1.23.bb
index 2bd249e787c..12e8fa6c583 100644
--- a/meta/recipes-extended/lzip/lzip_1.23.bb
+++ b/meta/recipes-extended/lzip/lzip_1.23.bb
@@ -2,7 +2,7 @@ SUMMARY = "Lossless data compressor based on the LZMA algorithm"
 HOMEPAGE = "http://lzip.nongnu.org/lzip.html"
 DESCRIPTION = "Lzip is a lossless data compressor with a user interface similar to the one of gzip or bzip2. Lzip uses a simplified form of the Lempel-Ziv-Markov chain-Algorithm (LZMA) stream format, chosen to maximize safety and interoperability."
 SECTION = "console/utils"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=76d6e300ffd8fb9d18bd9b136a9bba13 \
                     file://decoder.cc;beginline=3;endline=16;md5=18c279060cd0be128188404b45837f88 \
                     "
diff --git a/meta/recipes-extended/man-db/man-db_2.10.1.bb b/meta/recipes-extended/man-db/man-db_2.10.1.bb
index 897f8d8ce08..e8fd47a8f72 100644
--- a/meta/recipes-extended/man-db/man-db_2.10.1.bb
+++ b/meta/recipes-extended/man-db/man-db_2.10.1.bb
@@ -1,7 +1,7 @@
 SUMMARY = "An implementation of the standard Unix documentation system accessed using the man command"
 HOMEPAGE = "http://man-db.nongnu.org/"
 DESCRIPTION = "man-db is an implementation of the standard Unix documentation system accessed using the man command. It uses a Berkeley DB database in place of the traditional flat-text whatis databases."
-LICENSE = "LGPLv2.1 & GPLv2"
+LICENSE = "LGPL-2.1-only & GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
diff --git a/meta/recipes-extended/man-pages/man-pages_5.13.bb b/meta/recipes-extended/man-pages/man-pages_5.13.bb
index 2447d9fb14e..c0198b77be8 100644
--- a/meta/recipes-extended/man-pages/man-pages_5.13.bb
+++ b/meta/recipes-extended/man-pages/man-pages_5.13.bb
@@ -2,7 +2,7 @@ SUMMARY = "Linux man-pages"
 DESCRIPTION = "The Linux man-pages project documents the Linux kernel and C library interfaces that are employed by user programs"
 SECTION = "console/utils"
 HOMEPAGE = "http://www.kernel.org/pub/linux/docs/man-pages"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 
 LIC_FILES_CHKSUM = "file://README;md5=92cd5ee2e0b35d782817e7e277b6ce4b"
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.tar.gz"
diff --git a/meta/recipes-extended/mc/mc_4.8.27.bb b/meta/recipes-extended/mc/mc_4.8.27.bb
index e877780ea05..564599fdf6a 100644
--- a/meta/recipes-extended/mc/mc_4.8.27.bb
+++ b/meta/recipes-extended/mc/mc_4.8.27.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Midnight Commander is an ncurses based file manager"
 HOMEPAGE = "http://www.midnight-commander.org/"
 DESCRIPTION = "GNU Midnight Commander is a visual file manager, licensed under GNU General Public License and therefore qualifies as Free Software. It's a feature rich full-screen text mode application that allows you to copy, move and delete files and whole directory trees, search for files and run commands in the subshell. Internal viewer and editor are included."
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=270bbafe360e73f9840bd7981621f9c2"
 SECTION = "console/utils"
 DEPENDS = "ncurses glib-2.0 util-linux file-replacement-native"
diff --git a/meta/recipes-extended/mdadm/mdadm_4.2.bb b/meta/recipes-extended/mdadm/mdadm_4.2.bb
index 641b598f681..6f6e0c98adb 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.2.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.kernel.org/pub/linux/utils/raid/mdadm/"
 DESCRIPTION = "mdadm is a Linux utility used to manage and monitor software RAID devices."
 
 # Some files are GPLv2+ while others are GPLv2.
-LICENSE = "GPLv2 & GPLv2+"
+LICENSE = "GPL-2.0-only & GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://mdmon.c;beginline=4;endline=18;md5=af7d8444d9c4d3e5c7caac0d9d34039d \
                     file://mdadm.h;beglinlne=4;endline=22;md5=462bc9936ac0d3da110191a3f9994161"
diff --git a/meta/recipes-extended/mingetty/mingetty_1.08.bb b/meta/recipes-extended/mingetty/mingetty_1.08.bb
index 27feaa8cde7..7a16c652998 100644
--- a/meta/recipes-extended/mingetty/mingetty_1.08.bb
+++ b/meta/recipes-extended/mingetty/mingetty_1.08.bb
@@ -2,7 +2,7 @@ SUMMARY = "Compact getty terminal handler for virtual consoles only"
 SECTION = "console/utils"
 HOMEPAGE = "http://sourceforge.net/projects/mingetty/"
 DESCRIPTION = "This is a small Linux console getty that is started on the Linux text console, asks for a login name and then tranfers over to login directory. Is extended to allow automatic login and starting any app."
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 PR = "r3"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=0c56db0143f4f80c369ee3af7425af6e"
diff --git a/meta/recipes-extended/minicom/minicom_2.8.bb b/meta/recipes-extended/minicom/minicom_2.8.bb
index 3abd8a41ca9..2640c6b0574 100644
--- a/meta/recipes-extended/minicom/minicom_2.8.bb
+++ b/meta/recipes-extended/minicom/minicom_2.8.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://salsa.debian.org/minicom-team/minicom"
 DESCRIPTION = "Minicom is a text-based modem control and terminal emulation program for Unix-like operating systems"
 SECTION = "console/network"
 DEPENDS = "ncurses virtual/libiconv"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=420477abc567404debca0a2a1cb6b645 \
                     file://src/minicom.h;beginline=1;endline=12;md5=a58838cb709f0db517f4e42730c49e81"
 
diff --git a/meta/recipes-extended/msmtp/msmtp_1.8.19.bb b/meta/recipes-extended/msmtp/msmtp_1.8.19.bb
index 29f0e07fe4b..bdbb1daadd2 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.8.19.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.8.19.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "A sendmail replacement for use in MTAs like mutt"
 HOMEPAGE = "https://marlam.de/msmtp/"
 SECTION = "console/network"
 
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 DEPENDS = "zlib gnutls"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
diff --git a/meta/recipes-extended/net-tools/net-tools_2.10.bb b/meta/recipes-extended/net-tools/net-tools_2.10.bb
index eb5881356c3..33304297ec4 100644
--- a/meta/recipes-extended/net-tools/net-tools_2.10.bb
+++ b/meta/recipes-extended/net-tools/net-tools_2.10.bb
@@ -2,7 +2,7 @@ SUMMARY = "Basic networking tools"
 DESCRIPTION = "A collection of programs that form the base set of the NET-3 networking distribution for the Linux operating system"
 HOMEPAGE = "http://net-tools.berlios.de/"
 BUGTRACKER = "http://bugs.debian.org/net-tools"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://ifconfig.c;beginline=11;endline=15;md5=d1ca372080ad5401e23ca0afc35cf9ba"
 
diff --git a/meta/recipes-extended/newt/libnewt_0.52.21.bb b/meta/recipes-extended/newt/libnewt_0.52.21.bb
index 86301b95ebd..430e481b36b 100644
--- a/meta/recipes-extended/newt/libnewt_0.52.21.bb
+++ b/meta/recipes-extended/newt/libnewt_0.52.21.bb
@@ -11,7 +11,7 @@ slang library."
 HOMEPAGE = "https://releases.pagure.org/newt/"
 SECTION = "libs"
 
-LICENSE = "LGPLv2"
+LICENSE = "LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
 # slang needs to be >= 2.2
diff --git a/meta/recipes-extended/pam/libpam_1.5.2.bb b/meta/recipes-extended/pam/libpam_1.5.2.bb
index 28ede8ff90b..7277727745e 100644
--- a/meta/recipes-extended/pam/libpam_1.5.2.bb
+++ b/meta/recipes-extended/pam/libpam_1.5.2.bb
@@ -7,7 +7,7 @@ SECTION = "base"
 # PAM is dual licensed under GPL and BSD.
 # /etc/pam.d comes from Debian libpam-runtime in 2009-11 (at that time
 # libpam-runtime-1.0.1 is GPLv2+), by openembedded
-LICENSE = "GPLv2+ | BSD-3-Clause"
+LICENSE = "GPL-2.0-or-later | BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7eb5c1bf854e8881005d673599ee74d3 \
                     file://libpamc/License;md5=a4da476a14c093fdc73be3c3c9ba8fb3 \
                     "
diff --git a/meta/recipes-extended/parted/parted_3.4.bb b/meta/recipes-extended/parted/parted_3.4.bb
index ffab6271102..d83b002f82e 100644
--- a/meta/recipes-extended/parted/parted_3.4.bb
+++ b/meta/recipes-extended/parted/parted_3.4.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Disk partition editing/resizing utility"
 HOMEPAGE = "http://www.gnu.org/software/parted/parted.html"
 DESCRIPTION = "GNU Parted manipulates partition tables. This is useful for creating space for new operating systems, reorganizing disk usage, copying data on hard disks and disk imaging."
-LICENSE = "GPLv3+"
+LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2f31b266d3440dd7ee50f92cf67d8e6c"
 SECTION = "console/tools"
 DEPENDS = "ncurses util-linux virtual/libiconv"
diff --git a/meta/recipes-extended/perl/libconvert-asn1-perl_0.33.bb b/meta/recipes-extended/perl/libconvert-asn1-perl_0.33.bb
index 4f5a78df142..2714582957c 100644
--- a/meta/recipes-extended/perl/libconvert-asn1-perl_0.33.bb
+++ b/meta/recipes-extended/perl/libconvert-asn1-perl_0.33.bb
@@ -2,7 +2,7 @@ SUMMARY = "Convert::ASN1 - Perl ASN.1 Encode/Decode library"
 SECTION = "libs"
 HOMEPAGE = "http://search.cpan.org/dist/Convert-ASN1/"
 DESCRIPTION = "Convert::ASN1 is a perl library for encoding/decoding data using ASN.1 definitions."
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README.md;beginline=91;endline=97;md5=ceff7fd286eb6d8e8e0d3d23e096a63f"
 
 SRC_URI = "https://cpan.metacpan.org/authors/id/T/TI/TIMLEGGE/Convert-ASN1-${PV}.tar.gz"
diff --git a/meta/recipes-extended/perl/libtimedate-perl_2.30.bb b/meta/recipes-extended/perl/libtimedate-perl_2.30.bb
index 7c5e99063c8..3e0d216a032 100644
--- a/meta/recipes-extended/perl/libtimedate-perl_2.30.bb
+++ b/meta/recipes-extended/perl/libtimedate-perl_2.30.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://metacpan.org/release/TimeDate"
 DESCRIPTION = "This is the perl5 TimeDate distribution. It requires perl version 5.003 or later."
 SECTION = "libs"
 # You can redistribute it and/or modify it under the same terms as Perl itself.
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=21;md5=576b7cb41e5e821501a01ed66f0f9d9e"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GB/GBARR/TimeDate-${PV}.tar.gz"
diff --git a/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12.bb b/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12.bb
index 03bf0b6ff8b..568268d886d 100644
--- a/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12.bb
+++ b/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "XML::NamespaceSupport offers a simple way to process namespace-ba
                 basic checks. "
 
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
 SRCNAME = "XML-NamespaceSupport"
 
diff --git a/meta/recipes-extended/perl/libxml-sax-base-perl_1.09.bb b/meta/recipes-extended/perl/libxml-sax-base-perl_1.09.bb
index 790ff515586..ebec5f0462e 100644
--- a/meta/recipes-extended/perl/libxml-sax-base-perl_1.09.bb
+++ b/meta/recipes-extended/perl/libxml-sax-base-perl_1.09.bb
@@ -7,7 +7,7 @@ use this module as a base class so you don't have to, for example, \
 implement the characters() callback."
 
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 RDEPENDS:${PN} += "perl-module-extutils-makemaker"
 
 LIC_FILES_CHKSUM = "file://dist.ini;endline=5;md5=8f9c9a55340aefaee6e9704c88466446"
diff --git a/meta/recipes-extended/perl/libxml-sax-perl_1.02.bb b/meta/recipes-extended/perl/libxml-sax-perl_1.02.bb
index 9aa6fd050df..bc2aa0821eb 100644
--- a/meta/recipes-extended/perl/libxml-sax-perl_1.02.bb
+++ b/meta/recipes-extended/perl/libxml-sax-perl_1.02.bb
@@ -9,7 +9,7 @@ come from the Java JAXP specification (SAX part), only without the \
 javaness."
 
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 DEPENDS += "libxml-namespacesupport-perl-native"
 RDEPENDS:${PN} += "libxml-namespacesupport-perl libxml-sax-base-perl perl-module-file-temp"
 
diff --git a/meta/recipes-extended/procps/procps_3.3.17.bb b/meta/recipes-extended/procps/procps_3.3.17.bb
index e5e6d38d36a..0f5575c9abf 100644
--- a/meta/recipes-extended/procps/procps_3.3.17.bb
+++ b/meta/recipes-extended/procps/procps_3.3.17.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Procps contains a set of system utilities that provide system inf
 the /proc filesystem. The package includes the programs ps, top, vmstat, w, kill, and skill."
 HOMEPAGE = "https://gitlab.com/procps-ng/procps"
 SECTION = "base"
-LICENSE = "GPLv2+ & LGPLv2+"
+LICENSE = "GPL-2.0-or-later & LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LIB;md5=4cf66a4984120007c9881cc871cf49db \
                     "
diff --git a/meta/recipes-extended/psmisc/psmisc.inc b/meta/recipes-extended/psmisc/psmisc.inc
index ad6263ed948..12539dad53f 100644
--- a/meta/recipes-extended/psmisc/psmisc.inc
+++ b/meta/recipes-extended/psmisc/psmisc.inc
@@ -8,7 +8,7 @@ processes identified by name.  The fuser command identifies the PIDs \
 of processes that are using specified files or filesystems."
 SECTION = "base"
 DEPENDS = "ncurses virtual/libintl"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/psmisc/psmisc-${PV}.tar.gz"
 
diff --git a/meta/recipes-extended/psmisc/psmisc_23.4.bb b/meta/recipes-extended/psmisc/psmisc_23.4.bb
index 89fe8a709c3..94caa2ddb76 100644
--- a/meta/recipes-extended/psmisc/psmisc_23.4.bb
+++ b/meta/recipes-extended/psmisc/psmisc_23.4.bb
@@ -1,5 +1,5 @@
 require psmisc.inc
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 SRC_URI = "git://gitlab.com/psmisc/psmisc.git;protocol=https;branch=master \
diff --git a/meta/recipes-extended/quota/quota_4.06.bb b/meta/recipes-extended/quota/quota_4.06.bb
index e32bdd4c32b..0535d14c20c 100644
--- a/meta/recipes-extended/quota/quota_4.06.bb
+++ b/meta/recipes-extended/quota/quota_4.06.bb
@@ -3,7 +3,7 @@ SECTION = "base"
 HOMEPAGE = "http://sourceforge.net/projects/linuxquota/"
 DESCRIPTION = "Tools and patches for the Linux Diskquota system as part of the Linux kernel"
 BUGTRACKER = "http://sourceforge.net/tracker/?group_id=18136&atid=118136"
-LICENSE = "GPLv2+ & LGPLv2.1+"
+LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://rquota_server.c;beginline=1;endline=20;md5=fe7e0d7e11c6f820f8fa62a5af71230f \
                     file://svc_socket.c;beginline=1;endline=17;md5=24d5a8792da45910786eeac750be8ceb"
 
diff --git a/meta/recipes-extended/screen/screen_4.9.0.bb b/meta/recipes-extended/screen/screen_4.9.0.bb
index 1ed09616309..b36173b8dee 100644
--- a/meta/recipes-extended/screen/screen_4.9.0.bb
+++ b/meta/recipes-extended/screen/screen_4.9.0.bb
@@ -7,7 +7,7 @@ BUGTRACKER = "https://savannah.gnu.org/bugs/?func=additem&group=screen"
 
 SECTION = "console/utils"
 
-LICENSE = "GPLv3+"
+LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://screen.h;endline=26;md5=b8dc717c9a3dba842ae6c44ca0f73f52 \
                     "
diff --git a/meta/recipes-extended/sed/sed_4.8.bb b/meta/recipes-extended/sed/sed_4.8.bb
index 1f68214ae44..31e971aeac5 100644
--- a/meta/recipes-extended/sed/sed_4.8.bb
+++ b/meta/recipes-extended/sed/sed_4.8.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Stream EDitor (text filtering utility)"
 HOMEPAGE = "http://www.gnu.org/software/sed/"
 DESCRIPTION = "sed (stream editor) is a non-interactive command-line text editor."
-LICENSE = "GPLv3+"
+LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c678957b0c8e964aa6c70fd77641a71e \
                     file://sed/sed.h;beginline=1;endline=15;md5=fb3c7e6fbca6f66943859153d4be8efe \
                     "
diff --git a/meta/recipes-extended/slang/slang_2.3.2.bb b/meta/recipes-extended/slang/slang_2.3.2.bb
index 443ca0b5e66..08cc9670dc1 100644
--- a/meta/recipes-extended/slang/slang_2.3.2.bb
+++ b/meta/recipes-extended/slang/slang_2.3.2.bb
@@ -11,7 +11,7 @@ HOMEPAGE = "http://www.jedsoft.org/slang/"
 SECTION = "libs"
 DEPENDS = "ncurses virtual/libiconv"
 
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a52a18a472d4f7e45479b06563717c02"
 
 SRC_URI = "http://www.jedsoft.org/releases/${BPN}/${BP}.tar.bz2 \
diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.13.11.bb b/meta/recipes-extended/stress-ng/stress-ng_0.13.11.bb
index 72c9de38b15..12e10951a6c 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.13.11.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.13.11.bb
@@ -2,7 +2,7 @@ SUMMARY = "System load testing utility"
 DESCRIPTION = "Deliberately simple workload generator for POSIX systems. It \
 imposes a configurable amount of CPU, memory, I/O, and disk stress on the system."
 HOMEPAGE = "https://github.com/ColinIanKing/stress-ng#readme"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master"
diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
index 8345c1e3d13..77337722eaa 100644
--- a/meta/recipes-extended/sysstat/sysstat.inc
+++ b/meta/recipes-extended/sysstat/sysstat.inc
@@ -1,7 +1,7 @@
 SUMMARY = "System performance tools"
 DESCRIPTION = "The sysstat utilities are a collection of performance monitoring tools for Linux."
 HOMEPAGE = "http://sebastien.godard.pagesperso-orange.fr/"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 SECTION = "console/utils"
 
 SRC_URI = "http://pagesperso-orange.fr/sebastien.godard/${BP}.tar.xz \
diff --git a/meta/recipes-extended/tar/tar_1.34.bb b/meta/recipes-extended/tar/tar_1.34.bb
index 5a415c775a3..7307cd57a2c 100644
--- a/meta/recipes-extended/tar/tar_1.34.bb
+++ b/meta/recipes-extended/tar/tar_1.34.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "GNU tar saves many files together into a single tape \
 or disk archive, and can restore individual files from the archive."
 HOMEPAGE = "http://www.gnu.org/software/tar/"
 SECTION = "base"
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "${GNU_MIRROR}/tar/tar-${PV}.tar.bz2"
diff --git a/meta/recipes-extended/texinfo/texinfo_6.8.bb b/meta/recipes-extended/texinfo/texinfo_6.8.bb
index 5a7cbef402a..33dcd943b44 100644
--- a/meta/recipes-extended/texinfo/texinfo_6.8.bb
+++ b/meta/recipes-extended/texinfo/texinfo_6.8.bb
@@ -4,7 +4,7 @@ online information and printed output from a single source file. The \
 GNU Project uses the Texinfo file format for most of its documentation."
 HOMEPAGE = "http://www.gnu.org/software/texinfo/"
 SECTION = "console/utils"
-LICENSE = "GPLv3+"
+LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 PROVIDES:append:class-native = " texinfo-replacement-native"
diff --git a/meta/recipes-extended/time/time_1.9.bb b/meta/recipes-extended/time/time_1.9.bb
index abd00f09bf7..706605fe065 100644
--- a/meta/recipes-extended/time/time_1.9.bb
+++ b/meta/recipes-extended/time/time_1.9.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "time measures many of the CPU resources, such as time and \
 memory, that other programs use."
 HOMEPAGE = "http://www.gnu.org/software/time/"
 SECTION = "utils"
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 inherit texinfo update-alternatives
diff --git a/meta/recipes-extended/watchdog/watchdog-config.bb b/meta/recipes-extended/watchdog/watchdog-config.bb
index 8bf40f0f0e7..a28d28033bc 100644
--- a/meta/recipes-extended/watchdog/watchdog-config.bb
+++ b/meta/recipes-extended/watchdog/watchdog-config.bb
@@ -5,7 +5,7 @@ the system."
 HOMEPAGE = "http://watchdog.sourceforge.net/"
 BUGTRACKER = "http://sourceforge.net/tracker/?group_id=172030&atid=860194"
 
-LICENSE = "MIT-X"
+LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 SRC_URI = " \
diff --git a/meta/recipes-extended/watchdog/watchdog_5.16.bb b/meta/recipes-extended/watchdog/watchdog_5.16.bb
index 66373c9b283..1163846ed8a 100644
--- a/meta/recipes-extended/watchdog/watchdog_5.16.bb
+++ b/meta/recipes-extended/watchdog/watchdog_5.16.bb
@@ -5,7 +5,7 @@ it will reboot the system."
 HOMEPAGE = "http://watchdog.sourceforge.net/"
 BUGTRACKER = "http://sourceforge.net/tracker/?group_id=172030&atid=860194"
 
-LICENSE = "GPL-2.0+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=084236108b1d4a9851bf5213fea586fd"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/watchdog/watchdog-${PV}.tar.gz \
diff --git a/meta/recipes-extended/wget/wget.inc b/meta/recipes-extended/wget/wget.inc
index 2491199f18c..58cb5ca73d3 100644
--- a/meta/recipes-extended/wget/wget.inc
+++ b/meta/recipes-extended/wget/wget.inc
@@ -6,7 +6,7 @@ The program supports recursive retrieval of web-authoring pages as well as \
 FTP sites"
 HOMEPAGE = "https://www.gnu.org/software/wget/"
 SECTION = "console/network"
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c678957b0c8e964aa6c70fd77641a71e"
 
 inherit autotools gettext texinfo update-alternatives pkgconfig
diff --git a/meta/recipes-extended/which/which_2.21.bb b/meta/recipes-extended/which/which_2.21.bb
index d3c3f69d3f7..c8a50735b1a 100644
--- a/meta/recipes-extended/which/which_2.21.bb
+++ b/meta/recipes-extended/which/which_2.21.bb
@@ -6,7 +6,7 @@ It does this by using the exact same algorithm as bash."
 SECTION = "libs"
 HOMEPAGE = "https://carlowood.github.io/which/"
 
-LICENSE = "GPLv3+"
+LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
                     file://which.c;beginline=1;endline=17;md5=a9963693af2272e7a8df6f231164e7a2"
 DEPENDS     = "cwautomacros-native"
diff --git a/meta/recipes-extended/xz/xz_5.2.5.bb b/meta/recipes-extended/xz/xz_5.2.5.bb
index 8021ebd9bc9..c41987d87c0 100644
--- a/meta/recipes-extended/xz/xz_5.2.5.bb
+++ b/meta/recipes-extended/xz/xz_5.2.5.bb
@@ -7,13 +7,13 @@ SECTION = "base"
 # which is GPLv3 is an m4 macro which isn't shipped in any of our packages,
 # and the LGPL bits are under lib/, which appears to be used for libgnu, which
 # appears to be used for DOS builds. So we're left with GPLv2+ and PD.
-LICENSE = "GPLv2+ & GPL-3.0-with-autoconf-exception & LGPLv2.1+ & PD"
-LICENSE:${PN} = "GPLv2+"
-LICENSE:${PN}-dev = "GPLv2+"
-LICENSE:${PN}-staticdev = "GPLv2+"
-LICENSE:${PN}-doc = "GPLv2+"
-LICENSE:${PN}-dbg = "GPLv2+"
-LICENSE:${PN}-locale = "GPLv2+"
+LICENSE = "GPL-2.0-or-later & GPL-3.0-with-autoconf-exception & LGPL-2.1-or-later & PD"
+LICENSE:${PN} = "GPL-2.0-or-later"
+LICENSE:${PN}-dev = "GPL-2.0-or-later"
+LICENSE:${PN}-staticdev = "GPL-2.0-or-later"
+LICENSE:${PN}-doc = "GPL-2.0-or-later"
+LICENSE:${PN}-dbg = "GPL-2.0-or-later"
+LICENSE:${PN}-locale = "GPL-2.0-or-later"
 LICENSE:liblzma = "PD"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=97d554a32881fee0aa283d96e47cb24a \
diff --git a/meta/recipes-extended/zstd/zstd_1.5.2.bb b/meta/recipes-extended/zstd/zstd_1.5.2.bb
index 71f439ef571..0ddff469b82 100644
--- a/meta/recipes-extended/zstd/zstd_1.5.2.bb
+++ b/meta/recipes-extended/zstd/zstd_1.5.2.bb
@@ -5,7 +5,7 @@ It's backed by a very fast entropy stage, provided by Huff0 and FSE library."
 HOMEPAGE = "http://www.zstd.net/"
 SECTION = "console/utils"
 
-LICENSE = "BSD-3-Clause & GPLv2"
+LICENSE = "BSD-3-Clause & GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c7f0b161edbe52f5f345a3d1311d0b32 \
                     file://COPYING;md5=39bba7d2cf0ba1036f2a6e2be52fe3f0"
 
diff --git a/meta/recipes-gnome/epiphany/epiphany_41.3.bb b/meta/recipes-gnome/epiphany/epiphany_41.3.bb
index befd817165b..6dca6a73057 100644
--- a/meta/recipes-gnome/epiphany/epiphany_41.3.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_41.3.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Epiphany is an open source web browser for the Linux desktop envi
 It provides a simple and easy-to-use internet browsing experience."
 HOMEPAGE = "https://wiki.gnome.org/Apps/Web"
 BUGTRACKER = "https://gitlab.gnome.org/GNOME/epiphany"
-LICENSE = "GPLv3+"
+LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 DEPENDS = " \
diff --git a/meta/recipes-gnome/gcr/gcr_3.40.0.bb b/meta/recipes-gnome/gcr/gcr_3.40.0.bb
index d6174540582..717c31c3252 100644
--- a/meta/recipes-gnome/gcr/gcr_3.40.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_3.40.0.bb
@@ -5,7 +5,7 @@ GNOME desktop."
 HOMEPAGE = "https://gitlab.gnome.org/GNOME/gcr"
 BUGTRACKER = "https://gitlab.gnome.org/GNOME/gcr/issues"
 
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
 
 DEPENDS = "p11-kit glib-2.0 libgcrypt gnupg-native \
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb
index 21816ab06c8..55c16e4d66e 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb
@@ -5,7 +5,7 @@ loading (ie. animated GIFs)"
 HOMEPAGE = "https://wiki.gnome.org/Projects/GdkPixbuf"
 BUGTRACKER = "https://gitlab.gnome.org/GNOME/gdk-pixbuf/issues"
 
-LICENSE = "LGPLv2.1+"
+LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://gdk-pixbuf/gdk-pixbuf.h;endline=26;md5=72b39da7cbdde2e665329fef618e1d6b \
                     "
diff --git a/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb b/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb
index b2d7d6513e7..6a7124c3fea 100644
--- a/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb
+++ b/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb
@@ -5,7 +5,7 @@ introspection data generated by GObject-based libraries to generate the API \
 reference of these libraries, as well as other ancillary documentation."
 HOMEPAGE = "https://gnome.pages.gitlab.gnome.org/gi-docgen/"
 
-LICENSE = "GPLv3+ & Apache-2.0"
+LICENSE = "GPL-3.0-or-later & Apache-2.0"
 LIC_FILES_CHKSUM = "file://gi-docgen.py;beginline=1;endline=5;md5=2dc0f1f01202478cfe813c0e7f80b326"
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/gi-docgen.git;protocol=https;branch=main"
diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_41.0.bb b/meta/recipes-gnome/gnome/adwaita-icon-theme_41.0.bb
index 2b21e1bb2dc..46f9f4772ca 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme_41.0.bb
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_41.0.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://gitlab.gnome.org/GNOME/adwaita-icon-theme"
 BUGTRACKER = "https://gitlab.gnome.org/GNOME/adwaita-icon-theme/issues"
 SECTION = "x11/gnome"
 
-LICENSE = "LGPL-3.0 | CC-BY-SA-3.0"
+LICENSE = "LGPL-3.0-only | CC-BY-SA-3.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c84cac88e46fc07647ea07e6c24eeb7c \
                     file://COPYING_CCBYSA3;md5=96143d33de3a79321b1006c4e8ed07e7 \
                     file://COPYING_LGPL;md5=e6a600fd5e1d9cbde2d983680233ad02"
diff --git a/meta/recipes-gnome/gnome/gconf_3.2.6.bb b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
index dd760b9c633..776f6091aa2 100644
--- a/meta/recipes-gnome/gnome/gconf_3.2.6.bb
+++ b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
@@ -4,7 +4,7 @@ It is intended for user preferences; not configuration of something like \
 Apache, or arbitrary data storage."
 SECTION = "x11/gnome"
 HOMEPAGE = "https://gitlab.gnome.org/Archive/gconf"
-LICENSE = "LGPLv2+"
+LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
 
 DEPENDS = "glib-2.0 dbus dbus-glib libxml2 intltool-native"
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.70.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.70.0.bb
index 4f72a33bfad..fcda10bd33a 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.70.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.70.0.bb
@@ -6,7 +6,7 @@ generation for bindings, API verification and documentation generation."
 HOMEPAGE = "https://wiki.gnome.org/action/show/Projects/GObjectIntrospection"
 BUGTRACKER = "https://gitlab.gnome.org/GNOME/gobject-introspection/issues"
 SECTION = "libs"
-LICENSE = "LGPLv2+ & GPLv2+ & MIT"
+LICENSE = "LGPL-2.0-or-later & GPL-2.0-or-later & MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c434e8128a68bedd59b80b2ac1eb1c4a \
                     file://tools/compiler.c;endline=20;md5=fc5007fc20022720e6c0b0cdde41fabd \
                     file://giscanner/sourcescanner.c;endline=22;md5=194d6e0c1d00662f32d030ce44de8d39 \
diff --git a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_41.0.bb b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_41.0.bb
index 693ccd01486..280e3c8b504 100644
--- a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_41.0.bb
+++ b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_41.0.bb
@@ -4,7 +4,7 @@ GSettings schemas for settings shared by various components of a desktop."
 HOMEPAGE = "https://gitlab.gnome.org/GNOME/gsettings-desktop-schemas"
 BUGTRACKER = "https://gitlab.gnome.org/GNOME/gsettings-desktop-schemas/issues"
 
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS = "glib-2.0"
diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
index 4de4dcf5324..60620eef939 100644
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -9,7 +9,7 @@ SECTION = "libs"
 DEPENDS = "glib-2.0 cairo pango atk jpeg libpng gdk-pixbuf \
            gdk-pixbuf-native"
 
-LICENSE = "LGPLv2 & LGPLv2+ & LGPLv2.1+"
+LICENSE = "LGPL-2.0-only & LGPL-2.0-or-later & LGPL-2.1-or-later"
 
 inherit autotools gettext pkgconfig gtk-doc update-alternatives gtk-immodules-cache gsettings features_check gobject-introspection
 
diff --git a/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb b/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb
index 1c9d517525b..150d2c0b233 100644
--- a/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb
+++ b/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "Documentation generator for glib-based software"
 DESCRIPTION = "Gtk-doc is a set of scripts that extract specially formatted comments \
                from glib-based software and produce a set of html documentation files from them"
 HOMEPAGE = "https://www.gtk.org/docs/"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 inherit gnomebase
diff --git a/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb b/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb
index 5a9f675b7fc..bb6cb000ab3 100644
--- a/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb
+++ b/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb
@@ -4,7 +4,7 @@ theme for implementations of the icon theme specification."
 HOMEPAGE = "https://www.freedesktop.org/wiki/Software/icon-theme"
 BUGTRACKER = "https://bugs.freedesktop.org/"
 
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f08a446809913fc9b3c718f0eaea0426"
 
 SRC_URI = "https://icon-theme.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
diff --git a/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb b/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb
index c3572a16f2f..627f3895360 100644
--- a/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb
+++ b/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb
@@ -6,7 +6,7 @@ instances to and from JSON data types."
 HOMEPAGE = "https://wiki.gnome.org/Projects/JsonGlib"
 BUGTRACKER = "https://gitlab.gnome.org/GNOME/json-glib/issues"
 
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 DEPENDS = "glib-2.0"
diff --git a/meta/recipes-gnome/libdazzle/libdazzle_3.42.0.bb b/meta/recipes-gnome/libdazzle/libdazzle_3.42.0.bb
index 1b6109d218a..a10acc6ada1 100644
--- a/meta/recipes-gnome/libdazzle/libdazzle_3.42.0.bb
+++ b/meta/recipes-gnome/libdazzle/libdazzle_3.42.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "The libdazzle library is a companion library to GObject and Gtk+."
 DESCRIPTION = "A wide range of components from utilities for GIO, widgets for \
 GTK+, an animation framework, state machines, paneling and high-performance \
 counters are included."
-LICENSE = "GPLv3+"
+LICENSE = "GPL-3.0-or-later"
 HOMEPAGE = "https://gitlab.gnome.org/GNOME/libdazzle"
 BUGTRACKER = "https://gitlab.gnome.org/GNOME/libdazzle/issues"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8f0e2cd40e05189ec81232da84bd6e1a"
diff --git a/meta/recipes-gnome/libgudev/libgudev_237.bb b/meta/recipes-gnome/libgudev/libgudev_237.bb
index 57417f4e7ce..9ce43ce34bc 100644
--- a/meta/recipes-gnome/libgudev/libgudev_237.bb
+++ b/meta/recipes-gnome/libgudev/libgudev_237.bb
@@ -11,7 +11,7 @@ DEPENDS = "glib-2.0 udev"
 
 RCONFLICTS:${PN} = "systemd (<= 220)"
 
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 GNOMEBASEBUILDCLASS = "meson"
diff --git a/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb b/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb
index 605ef2b5fa7..4c2e8cbe033 100644
--- a/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb
+++ b/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb
@@ -6,7 +6,7 @@ to extend Gtk by providing mobile-friendly widgets and make the creation of \
 responsive apps easier."
 HOMEPAGE = "https://gitlab.gnome.org/GNOME/libhandy"
 BUGTRACKER = "https://gitlab.gnome.org/GNOME/libhandy/-/issues"
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/libhandy.git;protocol=https;branch=master \
diff --git a/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb b/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb
index 62134dd468a..fa3253b6167 100644
--- a/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb
+++ b/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb
@@ -6,7 +6,7 @@ in the user's way."
 HOMEPAGE = "https://gitlab.gnome.org/GNOME/libnotify"
 BUGTRACKER = "https://gitlab.gnome.org/GNOME/libnotify/issues"
 SECTION = "libs"
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 DEPENDS = "dbus glib-2.0 gdk-pixbuf"
diff --git a/meta/recipes-gnome/librsvg/librsvg_2.52.5.bb b/meta/recipes-gnome/librsvg/librsvg_2.52.5.bb
index aaabadeaea8..1279c663f71 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.52.5.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.52.5.bb
@@ -6,7 +6,7 @@ the screen or to generate output for printing."
 HOMEPAGE = "https://gitlab.gnome.org/GNOME/librsvg"
 BUGTRACKER = "https://gitlab.gnome.org/GNOME/librsvg/issues"
 
-LICENSE = "LGPLv2.1+"
+LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
                    "
 
diff --git a/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb b/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb
index 9c1f97b8f84..39ecdd770a7 100644
--- a/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb
+++ b/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "A GObject-based library for accessing the Secret Service API of \
 the freedesktop.org project, a cross-desktop effort to access passwords, \
 tokens and other types of secrets. libsecret provides a convenient wrapper \
 for these methods so consumers do not have to call the low-level DBus methods."
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 HOMEPAGE = "https://github.com/GNOME/libsecret"
 BUGTRACKER = "https://gitlab.gnome.org/GNOME/libsecret/issues"
 LIC_FILES_CHKSUM = "file://COPYING;md5=23c2a5e0106b99d75238986559bb5fc6"
diff --git a/meta/recipes-graphics/cairo/cairo_1.16.0.bb b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
index d76d935c306..0fedfa9efa1 100644
--- a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
@@ -10,13 +10,13 @@ HOMEPAGE = "http://cairographics.org"
 BUGTRACKER = "http://bugs.freedesktop.org"
 SECTION = "libs"
 
-LICENSE = "(MPL-1.1 | LGPLv2.1) & GPLv3+"
-LICENSE:${PN} = "MPL-1.1 | LGPLv2.1"
-LICENSE:${PN}-dev = "MPL-1.1 | LGPLv2.1"
-LICENSE:${PN}-doc = "MPL-1.1 | LGPLv2.1"
-LICENSE:${PN}-gobject = "MPL-1.1 | LGPLv2.1"
-LICENSE:${PN}-script-interpreter = "MPL-1.1 | LGPLv2.1"
-LICENSE:${PN}-perf-utils = "GPLv3+"
+LICENSE = "(MPL-1.1 | LGPLv2.1) & GPL-3.0-or-later"
+LICENSE:${PN} = "MPL-1.1 | LGPL-2.1-only"
+LICENSE:${PN}-dev = "MPL-1.1 | LGPL-2.1-only"
+LICENSE:${PN}-doc = "MPL-1.1 | LGPL-2.1-only"
+LICENSE:${PN}-gobject = "MPL-1.1 | LGPL-2.1-only"
+LICENSE:${PN}-script-interpreter = "MPL-1.1 | LGPL-2.1-only"
+LICENSE:${PN}-perf-utils = "GPL-3.0-or-later"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77"
 
diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb b/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb
index 63e40628628..6dbfd322178 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb
@@ -11,7 +11,7 @@ rasterize fonts."
 HOMEPAGE = "http://www.fontconfig.org"
 BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=fontconfig"
 
-LICENSE = "MIT-style & MIT & PD"
+LICENSE = "MIT & MIT & PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7a0449e9bc5370402a94c00204beca3d \
                     file://src/fcfreetype.c;endline=45;md5=5d9513e3196a1fbfdfa94051c09dfc84 \
                     file://src/fccache.c;beginline=1671;endline=1686;md5=0326cfeb4a7333dd4dd25fbbc4b9f27f"
diff --git a/meta/recipes-graphics/freetype/freetype_2.11.1.bb b/meta/recipes-graphics/freetype/freetype_2.11.1.bb
index 04b56adc6b2..5055ff185c3 100644
--- a/meta/recipes-graphics/freetype/freetype_2.11.1.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.11.1.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://www.freetype.org/"
 BUGTRACKER = "https://savannah.nongnu.org/bugs/?group=freetype"
 SECTION = "libs"
 
-LICENSE = "FreeType | GPLv2+"
+LICENSE = "FTL | GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=a5927784d823d443c6cae55701d01553 \
                     file://docs/FTL.TXT;md5=9f37b4e6afa3fef9dba8932b16bd3f97 \
                     file://docs/GPLv2.TXT;md5=8ef380476f642c20ebf40fecb0add2ec"
diff --git a/meta/recipes-graphics/libfakekey/libfakekey_git.bb b/meta/recipes-graphics/libfakekey/libfakekey_git.bb
index 33ea6fe5a9a..5d94be52b4f 100644
--- a/meta/recipes-graphics/libfakekey/libfakekey_git.bb
+++ b/meta/recipes-graphics/libfakekey/libfakekey_git.bb
@@ -4,7 +4,7 @@ key-presses."
 HOMEPAGE = "http://matchbox-project.org/"
 BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 
-LICENSE = "LGPLv2+"
+LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://src/libfakekey.c;endline=30;md5=602b5ccd48f64407510867f3373b448c"
 
 DEPENDS = "libxtst"
diff --git a/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb b/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb
index 06bd682823f..b01b332a55b 100644
--- a/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb
+++ b/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb
@@ -7,7 +7,7 @@ SECTION = "x11/libs"
 HOMEPAGE = "http://matchbox-project.org/"
 BUGTRACKER = "http://bugzilla.yoctoproject.com/"
 
-LICENSE = "LGPLv2+ & MIT"
+LICENSE = "LGPL-2.0-or-later & MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 \
                     file://COPYING.MIT;md5=f45ed9332b4f50a35adf2065adde4ca7 \
                     file://libmb/mbexp.c;endline=20;md5=28c0aef3b23e308464f5dae6a11b0d2f \
diff --git a/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb b/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb
index 53229f2edca..1a16ed43747 100644
--- a/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb
+++ b/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Very simple session manager for matchbox tools"
 HOMEPAGE = "http://www.matchbox-project.org/"
 BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://matchbox-session;endline=20;md5=180f1c169a15d059a56c30094f6fb5ea"
 
 SECTION = "x11"
diff --git a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb
index f452ea032a3..81704beac46 100644
--- a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb
+++ b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "Matchbox lightweight window manager"
 HOMEPAGE = "http://matchbox-project.org"
 BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://src/wm.h;endline=21;md5=a7e844465edbcf79c282369f93caa835 \
                     file://src/main.c;endline=21;md5=3e5d9f832b527b0d72dbe8e3c4c60b95 \
                     file://src/wm.c;endline=21;md5=8dc9d24477d87ef5dfbc2e4927146aab"
diff --git a/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb b/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb
index fc4e0a4d84c..8875a939e09 100644
--- a/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb
+++ b/meta/recipes-graphics/menu-cache/menu-cache_1.1.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Library for caching application menus"
 DESCRIPTION = "A library creating and utilizing caches to speed up freedesktop.org application menus"
 HOMEPAGE = "http://lxde.sourceforge.net/"
 
-LICENSE = "LGPLv2.1+"
+LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0964c689fcf4c21c6797ea87408416b6"
 
 SECTION = "x11/libs"
diff --git a/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb b/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb
index 470a5e9ea90..12c72edb79d 100644
--- a/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb
+++ b/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb
@@ -5,7 +5,7 @@ BUGTRACKER = "http://bugzilla.pokylinux.org"
 
 PR = "r4"
 
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://mini-x-session;endline=5;md5=b6430bffbcf05f9760e72938826b7487"
 
 SECTION = "x11"
diff --git a/meta/recipes-graphics/pango/pango_1.50.4.bb b/meta/recipes-graphics/pango/pango_1.50.4.bb
index c1e9be2f97e..0ea621bf670 100644
--- a/meta/recipes-graphics/pango/pango_1.50.4.bb
+++ b/meta/recipes-graphics/pango/pango_1.50.4.bb
@@ -7,7 +7,7 @@ core of text and font handling for GTK+-2.x."
 HOMEPAGE = "http://www.pango.org/"
 BUGTRACKER = "http://bugzilla.gnome.org"
 SECTION = "libs"
-LICENSE = "LGPLv2.0+"
+LICENSE = "LGPL-2.0-or-later"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index bc45558ddac..865eb4c272c 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Piglit is an open-source test suite for OpenGL and OpenCL \
 implementations."
 HOMEPAGE = "https://gitlab.freedesktop.org/mesa/piglit"
 BUGTRACKER = "https://gitlab.freedesktop.org/mesa/piglit/-/issues"
-LICENSE = "MIT & LGPLv2+ & GPLv3 & GPLv2+ & BSD-3-Clause"
+LICENSE = "MIT & LGPL-2.0-or-later & GPL-3.0-only & GPL-2.0-or-later & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b2beded7103a3d8a442a2a0391d607b0"
 
 SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=main \
diff --git a/meta/recipes-graphics/pong-clock/pong-clock_1.0.bb b/meta/recipes-graphics/pong-clock/pong-clock_1.0.bb
index c3c237eee75..d0794f8ee62 100644
--- a/meta/recipes-graphics/pong-clock/pong-clock_1.0.bb
+++ b/meta/recipes-graphics/pong-clock/pong-clock_1.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "A clock combined with a game of pong"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 DEPENDS = "virtual/libx11 xdmcp xau"
 
 inherit features_check pkgconfig
diff --git a/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb b/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb
index f69e4838f4f..efd426f8c47 100644
--- a/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb
+++ b/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb
@@ -7,7 +7,7 @@ BUGTRACKER = "https://gitlab.freedesktop.org/xdg/startup-notification/-/issues"
 
 # most files are under MIT, but libsn/sn-util.c is under LGPL, the
 # effective license is LGPL
-LICENSE = "LGPLv2+"
+LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a2ae2cd47d6d2f238410f5364dfbc0f2 \
                     file://libsn/sn-util.c;endline=18;md5=18a14dc1825d38e741d772311fea9ee1 \
                     file://libsn/sn-common.h;endline=23;md5=6d05bc0ebdcf5513a6e77cb26e8cd7e2 \
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb b/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
index 573ab7b93d2..3cc8e9ed4d8 100644
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Simple Xserver Init Script (no dm)"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SECTION = "x11"
 PR = "r31"
diff --git a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_git.bb b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_git.bb
index f484f537c1a..09fbc9b7983 100644
--- a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_git.bb
+++ b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_git.bb
@@ -2,7 +2,7 @@ SUMMARY = "Transparent X11 cursor theme for touchscreens"
 HOMEPAGE = "http://www.matchbox-project.org/"
 BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SECTION = "x11/base"
diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
index 49c42bd68a0..3f49df6258b 100644
--- a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
+++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Touchscreen calibration program for X11"
 HOMEPAGE = "http://www.freedesktop.org/wiki/Software/xinput_calibrator"
-LICENSE = "MIT-X"
+LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://src/calibrator.cpp;endline=22;md5=1bcba08f67cdb56f34021557898e4b5a"
 DEPENDS = "virtual/libx11 libxi libxrandr"
 
diff --git a/meta/recipes-graphics/xorg-app/xorg-app-common.inc b/meta/recipes-graphics/xorg-app/xorg-app-common.inc
index 1a200998801..1c64e20aac7 100644
--- a/meta/recipes-graphics/xorg-app/xorg-app-common.inc
+++ b/meta/recipes-graphics/xorg-app/xorg-app-common.inc
@@ -2,7 +2,7 @@ SUMMARY = "X application"
 HOMEPAGE = "http://www.x.org/"
 BUGTRACKER = "https://bugs.freedesktop.org"
 SECTION = "x11/apps"
-LICENSE = "MIT-X"
+LICENSE = "MIT"
 DEPENDS = "util-macros-native virtual/libx11"
 
 # depends on virtual/libx11
diff --git a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
index 0b1df44fe00..8b3f19426bc 100644
--- a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
+++ b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
@@ -2,7 +2,7 @@ SUMMARY = "X driver"
 HOMEPAGE = "http://www.x.org"
 BUGTRACKER = "https://bugs.freedesktop.org"
 SECTION = "x11/drivers"
-LICENSE = "MIT-X"
+LICENSE = "MIT"
 
 PE = "2"
 
diff --git a/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb b/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb
index db5768b56a1..b3e832756b6 100644
--- a/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb
+++ b/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb
@@ -3,7 +3,7 @@ SUMMARY = "X.Org font package creation/installation utilities"
 require xorg-font-common.inc
 
 #Unicode is MIT
-LICENSE = "MIT & MIT-style & BSD-4-Clause & BSD-2-Clause"
+LICENSE = "MIT & MIT & BSD-4-Clause & BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df208ec65eb84ce5bb8d82d8f3b9675 \
                     file://ucs2any.c;endline=28;md5=8357dc567fc628bd12696f15b2a33bcb \
                     file://bdftruncate.c;endline=26;md5=4f82ffc101a1b165eae9c6998abff937 \
diff --git a/meta/recipes-graphics/xorg-font/xorg-font-common.inc b/meta/recipes-graphics/xorg-font/xorg-font-common.inc
index ba5840425cc..2df23efed4a 100644
--- a/meta/recipes-graphics/xorg-font/xorg-font-common.inc
+++ b/meta/recipes-graphics/xorg-font/xorg-font-common.inc
@@ -2,7 +2,7 @@ HOMEPAGE = "http://www.x.org"
 BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=xorg"
 
 SECTION = "x11/fonts"
-LICENSE = "MIT-X"
+LICENSE = "MIT"
 
 DEPENDS = " encodings font-alias font-util-native"
 RDEPENDS:${PN} = "encodings font-util font-alias"
diff --git a/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb b/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb
index 6a6316f320d..44339eb27a8 100644
--- a/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb
+++ b/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb
@@ -8,7 +8,7 @@ negotiating versions, and for reporting errors. "
 
 require xorg-lib-common.inc
 
-LICENSE = "MIT-style"
+LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d162b1b3c6fa812da9d804dcf8584a93"
 
 DEPENDS += "xorgproto xtrans"
diff --git a/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb b/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb
index b58cb80dc34..d55315efc2f 100644
--- a/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb
+++ b/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb
@@ -11,7 +11,7 @@ SRC_URI += "\
 SRC_URI[md5sum] = "b34e2cbdd6aa8f9cc3fa613fd401a6d6"
 SRC_URI[sha256sum] = "214c9d0d884fdd7375ec8da8dcb91a8d3169f263294c9a90c575bf1938b9f489"
 
-LICENSE = "MIT & MIT-style"
+LICENSE = "MIT & MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=277aada5222b9a22fbf3471ff3687068"
 
 REQUIRED_DISTRO_FEATURES = ""
diff --git a/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb b/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb
index 49df690f0ad..90917ef4374 100644
--- a/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb
@@ -8,7 +8,7 @@ has a particular state."
 
 require xorg-lib-common.inc
 
-LICENSE = "MIT-style"
+LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c0fb37f44e02bdbde80546024400728d"
 
 DEPENDS += "libice xorgproto xtrans"
diff --git a/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.8.bb b/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.8.bb
index 796980b7caf..b231f8b34d7 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.8.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.8.bb
@@ -8,7 +8,7 @@ python () {
 
 require xorg-lib-common.inc
 
-LICENSE = "MIT & MIT-style & BSD-1-Clause & HPND & HPND-sell-variant"
+LICENSE = "MIT & MIT & BSD-1-Clause & HPND & HPND-sell-variant"
 LIC_FILES_CHKSUM = "file://COPYING;md5=172255dee66bb0151435b2d5d709fcf7"
 
 SRC_URI[md5sum] = "c5fa5a86a20e3591bed6c046498d4b8f"
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb b/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb
index be9b8df6cee..0c3abcd896f 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb
@@ -21,7 +21,7 @@ SRC_URI[sha256sum] = "2ffd417266fb875028fdc0ef349694f63dbcd76d0b0cfacfb52e6151f4
 PROVIDES = "virtual/libx11"
 
 XORG_PN = "libX11"
-LICENSE = "MIT & MIT-style & BSD-1-Clause & HPND & HPND-sell-variant"
+LICENSE = "MIT & MIT & BSD-1-Clause & HPND & HPND-sell-variant"
 LIC_FILES_CHKSUM = "file://COPYING;md5=172255dee66bb0151435b2d5d709fcf7"
 
 DEPENDS += "xorgproto \
diff --git a/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb b/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb
index dcfc66652a8..3fbc3a5b44e 100644
--- a/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb
+++ b/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb
@@ -8,7 +8,7 @@ require xorg-lib-common.inc
 
 inherit gettext
 
-LICENSE = "MIT-style"
+LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7908e342491198401321cec1956807ec"
 
 DEPENDS += " xorgproto"
diff --git a/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb b/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb
index 3ef3ddb8174..c07f31b92d7 100644
--- a/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb
@@ -11,7 +11,7 @@ compositing transformations through a client."
 
 require xorg-lib-common.inc
 
-LICENSE = "MIT-style"
+LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3f2907aad541f6f226fbc58cc1b3cdf1"
 
 DEPENDS += " xorgproto virtual/libx11 libxfixes libxext"
diff --git a/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb b/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb
index 2df7a3a4f2e..f6794b68826 100644
--- a/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb
@@ -8,7 +8,7 @@ size."
 
 require xorg-lib-common.inc
 
-LICENSE = "MIT-style"
+LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8902e6643f7bcd7793b23dcd5d8031a4"
 
 DEPENDS += "libxrender libxfixes"
diff --git a/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb b/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb
index d43a146fd70..92ec954df25 100644
--- a/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb
@@ -10,7 +10,7 @@ require xorg-lib-common.inc
 
 inherit gettext
 
-LICENSE = "MIT-style"
+LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d559fb26e129626022e052a5e6e0e123"
 
 DEPENDS += "xorgproto"
diff --git a/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb b/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb
index 9493111a671..a0ba54d184f 100644
--- a/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb
@@ -10,7 +10,7 @@ extensions."
 
 require xorg-lib-common.inc
 
-LICENSE = "MIT-style"
+LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=879ce266785414bd1cbc3bc2f4d9d7c8"
 
 DEPENDS += "xorgproto virtual/libx11"
diff --git a/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb b/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb
index af7426f7bfb..3a8543171ed 100644
--- a/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb
@@ -8,7 +8,7 @@ caused by these workarounds."
 require xorg-lib-common.inc
 SRC_URI[sha256sum] = "a7c1a24da53e0b46cac5aea79094b4b2257321c621b258729bc3139149245b4c"
 
-LICENSE = "MIT-style"
+LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3c1ce42c334a6f5cccb0277556a053e0"
 
 DEPENDS += "virtual/libx11 xorgproto"
diff --git a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb
index 9ad19dc826c..10e44c39ba4 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb
@@ -6,7 +6,7 @@ such as freetype)."
 
 require xorg-lib-common.inc
 
-LICENSE = "MIT & MIT-style & BSD-4-Clause & BSD-2-Clause"
+LICENSE = "MIT & MIT & BSD-4-Clause & BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a46c8040f2f737bcd0c435feb2ab1c2c"
 
 DEPENDS += "freetype xtrans xorgproto libfontenc zlib"
diff --git a/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb b/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb
index f04780cf046..27e686b0879 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb
@@ -6,7 +6,7 @@ such as freetype)."
 
 require xorg-lib-common.inc
 
-LICENSE = "MIT & MIT-style & BSD-3-Clause"
+LICENSE = "MIT & MIT & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a46c8040f2f737bcd0c435feb2ab1c2c"
 
 DEPENDS += "freetype xtrans xorgproto libfontenc zlib"
diff --git a/meta/recipes-graphics/xorg-lib/libxi_1.8.bb b/meta/recipes-graphics/xorg-lib/libxi_1.8.bb
index 83101c57365..2aa75148d12 100644
--- a/meta/recipes-graphics/xorg-lib/libxi_1.8.bb
+++ b/meta/recipes-graphics/xorg-lib/libxi_1.8.bb
@@ -7,7 +7,7 @@ input devices other than the core X keyboard and pointer.  It allows \
 client programs to select input from these devices independently from \
 each other and independently from the core devices."
 
-LICENSE = "MIT & MIT-style"
+LICENSE = "MIT & MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=17b064789fab936a1c58c4e13d965b0f \
                     file://src/XIGetDevFocus.c;endline=23;md5=cdfb0d435a33ec57ea0d1e8e395b729f"
 
diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb
index c7e12eb0b89..34652e9c4ec 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "libxkbcommon is a keymap compiler and support library which \
 processes a reduced subset of keymaps as defined by the XKB specification."
 HOMEPAGE = "http://www.xkbcommon.org"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e525ed9809e1f8a07cf4bce8b09e8b87"
-LICENSE = "MIT & MIT-style"
+LICENSE = "MIT & MIT"
 
 DEPENDS = "flex-native bison-native"
 
diff --git a/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb b/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb
index 3a6c50ca218..0fd0e3f47f1 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb
@@ -5,7 +5,7 @@ description files for XKB, the X11 keyboard configuration extension."
 
 require xorg-lib-common.inc
 
-LICENSE = "MIT-style"
+LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8be7367f7e5d605a426f76bb37d4d61f"
 
 DEPENDS += "virtual/libx11 xorgproto"
diff --git a/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb b/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb
index 7e92d0499aa..eab3f075129 100644
--- a/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb
@@ -9,7 +9,7 @@ second library, libXmuu."
 
 require xorg-lib-common.inc
 
-LICENSE = "MIT & MIT-style"
+LICENSE = "MIT & MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=def3d8e4e9c42004f1941fa22f01dc18"
 
 DEPENDS += "libxt libxext"
diff --git a/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb b/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb
index 53a8335d64b..482017d2ae9 100644
--- a/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb
@@ -8,7 +8,7 @@ specified in the Proceedings of the 2001 Usenix Technical Conference \
 
 require xorg-lib-common.inc
 
-LICENSE = "MIT-style"
+LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c9d1a2118a6cd5727521db8e7a2fee69"
 
 DEPENDS += "virtual/libx11 xorgproto libxrender libxext"
diff --git a/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb b/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb
index 9b18366138b..35763a5a269 100644
--- a/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb
+++ b/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb
@@ -8,7 +8,7 @@ drawn by loading glyphs into the server and rendering sets of them."
 
 require xorg-lib-common.inc
 
-LICENSE = "MIT-style"
+LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d8bc71986d3b9b3639f6dfd6fac8f196"
 
 DEPENDS += "virtual/libx11 xorgproto"
diff --git a/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb b/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb
index d153c7a603e..f465266672d 100644
--- a/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb
@@ -6,7 +6,7 @@ using file descriptor passing."
 
 require xorg-lib-common.inc
 
-LICENSE = "MIT-style"
+LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=47e508ca280fde97906eacb77892c3ac"
 
 DEPENDS += "virtual/libx11"
diff --git a/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb b/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb
index 8f2cded1df4..eef561dbbae 100644
--- a/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb
@@ -12,7 +12,7 @@ independent of any particular user interface policy or style."
 
 require xorg-lib-common.inc
 
-LICENSE = "MIT & MIT-style"
+LICENSE = "MIT & MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=73d55cea4d27ca1a09a5d23378b3ecf8"
 
 DEPENDS += "util-linux libxcb libsm virtual/libx11 xorgproto libxdmcp"
diff --git a/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb b/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb
index 7837f69d38b..ebe9be5b9ab 100644
--- a/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb
@@ -6,7 +6,7 @@ DESCRIPTION = "This extension is a minimal set of client and server \
 extensions required to completely test the X11 server with no user \
 intervention."
 
-LICENSE = "MIT-style"
+LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bb4f89972c3869f617f61c1a79ad1952 \
                     file://src/XTest.c;beginline=2;endline=32;md5=b1c8c9dff842b4d5b89ca5fa32c40e99"
 
diff --git a/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb b/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb
index c6027233ef6..3c8bf08153d 100644
--- a/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb
+++ b/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb
@@ -7,7 +7,7 @@ clients, which may draw in a number of colourspaces, including YUV."
 
 require xorg-lib-common.inc
 
-LICENSE = "MIT-style"
+LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=827da9afab1f727f2a66574629e0f39c"
 
 DEPENDS += "libxext xorgproto"
diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb b/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb
index ab9595cc75d..ccfe2777466 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb
@@ -18,7 +18,7 @@ UPSTREAM_CHECK_REGEX = "pixman-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)"
 
 PE = "1"
 
-LICENSE = "MIT & MIT-style & PD"
+LICENSE = "MIT & MIT & PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=14096c769ae0cbb5fcb94ec468be11b3 \
                     file://pixman/pixman-matrix.c;endline=21;md5=4a018dff3e4e25302724c88ff95c2456 \
                     file://pixman/pixman-arm-neon-asm.h;endline=24;md5=9a9cc1e51abbf1da58f4d9528ec9d49b \
diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb
index 6d40266ec3f..5215131e3ed 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb
@@ -9,7 +9,7 @@ systems."
 HOMEPAGE = "http://freedesktop.org/wiki/Software/XKeyboardConfig"
 BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=xkeyboard-config"
 
-LICENSE = "MIT & MIT-style"
+LICENSE = "MIT & MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0e7f21ca7db975c63467d2e7624a12f9"
 
 SRC_URI = "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.xz"
diff --git a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
index 779a3ef7264..60bc8c76fac 100644
--- a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
+++ b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
@@ -2,7 +2,7 @@ HOMEPAGE = "http://www.x.org"
 BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=xorg"
 
 SECTION = "x11/libs"
-LICENSE = "MIT-X"
+LICENSE = "MIT"
 DEPENDS = "util-macros"
 
 XORG_PN = "${BPN}"
diff --git a/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb b/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb
index f33f6f0215d..08773c8ccc5 100644
--- a/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb
+++ b/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb
@@ -9,7 +9,7 @@ except in the X Transport Interface code."
 
 require xorg-lib-common.inc
 
-LICENSE = "MIT & MIT-style"
+LICENSE = "MIT & MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=49347921d4d5268021a999f250edc9ca"
 
 SRC_URI += "file://multilibfix.patch"
diff --git a/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb b/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb
index 8edb4596ad4..8f1ed362917 100644
--- a/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb
+++ b/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://www.x.org"
 BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=xorg"
 
 SECTION = "x11/libs"
-LICENSE = "MIT-style"
+LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING-x11proto;md5=dfc4bd2b0568b31725b85b0604e69b56"
 
 SRC_URI = "${XORG_MIRROR}/individual/proto/${BP}.tar.bz2"
diff --git a/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb b/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb
index 80e75904002..0164256eb46 100644
--- a/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb
+++ b/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "M4 autotools macros used by various X.org programs."
 
 require xorg-util-common.inc
 
-LICENSE = "MIT & MIT-style"
+LICENSE = "MIT & MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1970511fddd439b07a6ba789d28ff662"
 
 PE = "1"
diff --git a/meta/recipes-graphics/xorg-util/xorg-util-common.inc b/meta/recipes-graphics/xorg-util/xorg-util-common.inc
index 18d022c49fc..a4c85a4ebcd 100644
--- a/meta/recipes-graphics/xorg-util/xorg-util-common.inc
+++ b/meta/recipes-graphics/xorg-util/xorg-util-common.inc
@@ -2,7 +2,7 @@ HOMEPAGE = "http://www.x.org"
 BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=xorg"
 
 SECTION = "x11/utils"
-LICENSE = "MIT-X"
+LICENSE = "MIT"
 
 XORG_PN = "${BPN}"
 
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
index e9788ab7c6f..f82a6960e6c 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
@@ -1,7 +1,7 @@
 SUMMARY = "X.Org X server configuration file"
 HOMEPAGE = "http://www.x.org"
 SECTION = "x11/base"
-LICENSE = "MIT-X"
+LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PR = "r33"
 
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 0584cfbfb11..057a1ba6ad4 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -1,7 +1,7 @@
 SUMMARY = "The X.Org X server"
 HOMEPAGE = "http://www.x.org"
 SECTION = "x11/base"
-LICENSE = "MIT-X"
+LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 # xf86-*-* packages depend on an X server built with the xfree86 DDX
diff --git a/meta/recipes-graphics/xrestop/xrestop_0.4.bb b/meta/recipes-graphics/xrestop/xrestop_0.4.bb
index c7b8716f6f6..0b5ab506e34 100644
--- a/meta/recipes-graphics/xrestop/xrestop_0.4.bb
+++ b/meta/recipes-graphics/xrestop/xrestop_0.4.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "top-like statistics of X11 server resource usage by clients"
 HOMEPAGE = "http://www.freedesktop.org/wiki/Software/xrestop"
 BUGTRACKER = "https://bugs.freedesktop.org/"
 
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://xrestop.c;endline=18;md5=730876c30f0d8a928676bcd1242a3b35"
 
diff --git a/meta/recipes-graphics/xwayland/xwayland_21.1.4.bb b/meta/recipes-graphics/xwayland/xwayland_21.1.4.bb
index cbf4f1c658e..e08be51ce78 100644
--- a/meta/recipes-graphics/xwayland/xwayland_21.1.4.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_21.1.4.bb
@@ -6,7 +6,7 @@ the transition from X Window System to Wayland environments, providing \
 a way to run unported applications in the meantime."
 HOMEPAGE = "https://fedoraproject.org/wiki/Changes/XwaylandStandalone"
 
-LICENSE = "MIT-X"
+LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
diff --git a/meta/recipes-kernel/blktrace/blktrace_git.bb b/meta/recipes-kernel/blktrace/blktrace_git.bb
index b108676df4e..bba5e045047 100644
--- a/meta/recipes-kernel/blktrace/blktrace_git.bb
+++ b/meta/recipes-kernel/blktrace/blktrace_git.bb
@@ -5,7 +5,7 @@ are three major components: a kernel component, a utility to record the i/o \
 trace information for the kernel to user space, and utilities to analyse and \
 view the trace information."
 HOMEPAGE = "http://brick.kernel.dk/snaps/"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 
 DEPENDS = "libaio"
diff --git a/meta/recipes-kernel/cryptodev/cryptodev.inc b/meta/recipes-kernel/cryptodev/cryptodev.inc
index 6ada0b0295b..ef342a157cf 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev.inc
+++ b/meta/recipes-kernel/cryptodev/cryptodev.inc
@@ -5,7 +5,7 @@ of hardware accelerators. Cryptodev-linux is implemented as a standalone \
 module that requires no dependencies other than a stock linux kernel. Its \
 API is compatible with OpenBSD's cryptodev userspace API (/dev/crypto)."
 
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/cryptodev-linux/cryptodev-linux;branch=master;protocol=https \
diff --git a/meta/recipes-kernel/dtc/dtc_1.6.1.bb b/meta/recipes-kernel/dtc/dtc_1.6.1.bb
index 2610b26a94a..2a6ac089a33 100644
--- a/meta/recipes-kernel/dtc/dtc_1.6.1.bb
+++ b/meta/recipes-kernel/dtc/dtc_1.6.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "Device Tree Compiler"
 HOMEPAGE = "https://devicetree.org/"
 DESCRIPTION = "The Device Tree Compiler is a tool used to manipulate the Open-Firmware-like device tree used by PowerPC kernels."
 SECTION = "bootloader"
-LICENSE = "GPLv2 | BSD-2-Clause"
+LICENSE = "GPL-2.0-only | BSD-2-Clause"
 
 LIC_FILES_CHKSUM = "file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://libfdt/libfdt.h;beginline=4;endline=7;md5=05bb357cfb75cae7d2b01d2ee8d76407"
diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 74db9363a12..0dcf1281f04 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Powerful set of tools or managing Yocto Linux kernel sources \
 and configuration data. You can use these tools to make a single configuration \
 change, apply multiple patches, or work with your own kernel sources."
 HOMEPAGE = "https://www.yoctoproject.org/"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://tools/kgit;beginline=5;endline=9;md5=9c30e971d435e249624278c3e343e501"
 
 DEPENDS = "git-native"
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.23.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.23.bb
index 066de99fad2..4e58a5acbd2 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.23.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.23.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "Kexec is a fast reboot feature that lets you reboot to a new Linu
 AUTHOR = "Eric Biederman"
 HOMEPAGE = "http://kernel.org/pub/linux/utils/kernel/kexec/"
 SECTION = "kernel/userland"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ea5bed2f60d357618ca161ad539f7c0a \
                     file://kexec/kexec.c;beginline=1;endline=20;md5=af10f6ae4a8715965e648aa687ad3e09"
 DEPENDS = "zlib xz"
diff --git a/meta/recipes-kernel/kmod/kmod_29.bb b/meta/recipes-kernel/kmod/kmod_29.bb
index 9ac5214df61..91951edde16 100644
--- a/meta/recipes-kernel/kmod/kmod_29.bb
+++ b/meta/recipes-kernel/kmod/kmod_29.bb
@@ -5,8 +5,8 @@ SUMMARY = "Tools for managing Linux kernel modules"
 DESCRIPTION = "kmod is a set of tools to handle common tasks with Linux kernel modules like \
                insert, remove, list, check properties, resolve dependencies and aliases."
 HOMEPAGE = "http://kernel.org/pub/linux/utils/kernel/kmod/"
-LICENSE = "GPL-2.0+ & LGPL-2.1+"
-LICENSE:libkmod = "LGPL-2.1+"
+LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
+LICENSE:libkmod = "LGPL-2.1-or-later"
 SECTION = "base"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20220209.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20220209.bb
index fe51892eb47..eca3c219db9 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20220209.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20220209.bb
@@ -341,8 +341,8 @@ RDEPENDS:${PN}-ath6k += "${PN}-atheros-license"
 RDEPENDS:${PN}-ath9k += "${PN}-atheros-license"
 
 # For carl9170
-LICENSE:${PN}-carl9170 = "Firmware-GPLv2"
-LICENSE:${PN}-gplv2-license = "Firmware-GPLv2"
+LICENSE:${PN}-carl9170 = "Firmware-GPL-2.0-only"
+LICENSE:${PN}-gplv2-license = "Firmware-GPL-2.0-only"
 
 FILES:${PN}-gplv2-license = "${nonarch_base_libdir}/firmware/GPL-2"
 FILES:${PN}-carl9170 = " \
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
index 3867d09d082..47f09952de6 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
@@ -2,7 +2,7 @@ SUMMARY = "Sanitized set of kernel headers for the C library's use"
 HOMEPAGE = "https://www.kernel.org/"
 DESCRIPTION = "Designed to maintain an Application Programming Interface (API) stable version of the Linux headers"
 SECTION = "devel"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 
 #########################################################################
 ####                        PLEASE READ 
diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 4ceb35f0d2b..cccf06e12c7 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -5,7 +5,7 @@ development or external module builds"
 
 SECTION = "kernel"
 
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 
 inherit linux-kernel-base
 
diff --git a/meta/recipes-kernel/linux/linux-dummy.bb b/meta/recipes-kernel/linux/linux-dummy.bb
index 175e660687e..7c46f80d8d4 100644
--- a/meta/recipes-kernel/linux/linux-dummy.bb
+++ b/meta/recipes-kernel/linux/linux-dummy.bb
@@ -4,7 +4,7 @@ provider for virtual/kernel to satisfy dependencies for situations \
 where you wish to build the kernel externally from the build system."
 SECTION = "kernel"
 
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe"
 
 PROVIDES += "virtual/kernel"
diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index a3b24163679..cabc8f49755 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -1,6 +1,6 @@
 SUMMARY = "Linux kernel"
 SECTION = "kernel"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 HOMEPAGE = "https://www.yoctoproject.org/"
 
 LIC_FILES_CHKSUM ?= "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.0.4.bb b/meta/recipes-kernel/lttng/babeltrace2_2.0.4.bb
index 2aafe817345..248b84e98d3 100644
--- a/meta/recipes-kernel/lttng/babeltrace2_2.0.4.bb
+++ b/meta/recipes-kernel/lttng/babeltrace2_2.0.4.bb
@@ -2,7 +2,7 @@ SUMMARY = "Babeltrace2 - Trace Format Babel Tower"
 DESCRIPTION = "Babeltrace provides trace read and write libraries in host side, as well as a trace converter, which used to convert LTTng 2.0 traces into human-readable log."
 HOMEPAGE = "http://babeltrace.org/"
 BUGTRACKER = "https://bugs.lttng.org/projects/babeltrace"
-LICENSE = "MIT & GPLv2 & LGPLv2.1 & BSD-2-Clause"
+LICENSE = "MIT & GPL-2.0-only & LGPL-2.1-only & BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a6a458c13f18385b7bc5069a6d7b176e"
 
 DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
diff --git a/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb b/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb
index 9f8b0351283..19601e7d1b6 100644
--- a/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb
+++ b/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb
@@ -2,7 +2,7 @@ SUMMARY = "Babeltrace - Trace Format Babel Tower"
 DESCRIPTION = "Babeltrace provides trace read and write libraries in host side, as well as a trace converter, which used to convert LTTng 2.0 traces into human-readable log."
 HOMEPAGE = "http://babeltrace.org/"
 BUGTRACKER = "https://bugs.lttng.org/projects/babeltrace"
-LICENSE = "MIT & GPLv2 & LGPLv2.1"
+LICENSE = "MIT & GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=76ba15dd76a248e1dd526bca0e2125fa"
 
 DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.1.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.1.bb
index 4c5385b10ac..a8e4cc5afa3 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.1.bb
@@ -2,7 +2,7 @@ SECTION = "devel"
 SUMMARY = "Linux Trace Toolkit KERNEL MODULE"
 DESCRIPTION = "The lttng-modules 2.0 package contains the kernel tracer modules"
 HOMEPAGE = "https://lttng.org/"
-LICENSE = "LGPLv2.1 & GPLv2 & MIT"
+LICENSE = "LGPL-2.1-only & GPL-2.0-only & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0464cff101a009c403cd2ed65d01d4c4"
 
 inherit module
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb b/meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb
index 98b91270ba9..0ea4da05cea 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb
@@ -5,7 +5,7 @@ to extract program execution details from the Linux operating system \
 and interpret them."
 HOMEPAGE = "https://github.com/lttng/lttng-tools"
 
-LICENSE = "GPLv2 & LGPLv2.1"
+LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=40ef17463fbd6f377db3c47b1cbaded8 \
                     file://LICENSES/GPL-2.0;md5=e68f69a54b44ba526ad7cb963e18fbce \
                     file://LICENSES/LGPL-2.1;md5=9920968d0f2ff585ce61fae30344dd95"
diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.13.1.bb b/meta/recipes-kernel/lttng/lttng-ust_2.13.1.bb
index 82e544a4b92..7bd6b6910d6 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.13.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.13.1.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "The LTTng UST 2.x package contains the userspace tracer library t
 HOMEPAGE = "http://lttng.org/ust"
 BUGTRACKER = "https://bugs.lttng.org/projects/lttng-ust"
 
-LICENSE = "LGPLv2.1+ & MIT & GPLv2"
+LICENSE = "LGPL-2.1-or-later & MIT & GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a46577a38ad0c36ff6ff43ccf40c480f"
 
 PYTHON_OPTION = "am_cv_python_pyexecdir='${PYTHON_SITEPACKAGES_DIR}' \
diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index e5a1628898e..0e420a25d91 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Build tools needed by external modules"
 HOMEPAGE = "https://www.yoctoproject.org/"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
 
 inherit kernel-arch
diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index ec0c6efe15f..adefc44eaa3 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -7,7 +7,7 @@ and software features (software counters, tracepoints) \
 as well."
 HOMEPAGE = "https://perf.wiki.kernel.org/index.php/Main_Page"
 
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 
 PR = "r9"
 
diff --git a/meta/recipes-kernel/powertop/powertop_2.14.bb b/meta/recipes-kernel/powertop/powertop_2.14.bb
index b46e5e80415..a2f30040b53 100644
--- a/meta/recipes-kernel/powertop/powertop_2.14.bb
+++ b/meta/recipes-kernel/powertop/powertop_2.14.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Linux tool to diagnose issues with power consumption and power ma
 HOMEPAGE = "https://01.org/powertop/"
 BUGTRACKER = "https://app.devzing.com/powertopbugs/bugzilla"
 DEPENDS = "ncurses libnl pciutils autoconf-archive"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
 
 SRC_URI = "git://github.com/fenrus75/powertop;protocol=https;branch=master \
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index a7c8bbc589a..b7218f02e05 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -1,4 +1,4 @@
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRCREV = "2e9f2f6967e44ce2bf8f34932b5bdd738ece2161"
 PV = "4.6"
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb
index 7c03287b84c..ca6bedae976 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb
@@ -4,7 +4,7 @@ provides a level of abstraction over the /dev interfaces provided by the kernel
 HOMEPAGE = "http://www.alsa-project.org"
 BUGTRACKER = "http://alsa-project.org/main/index.php/Bug_Tracking"
 SECTION = "libs/multimedia"
-LICENSE = "LGPLv2.1 & GPLv2+"
+LICENSE = "LGPL-2.1-only & GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
                     file://src/socket.c;md5=285675b45e83f571c6a957fe4ab79c93;beginline=9;endline=24 \
                     "
diff --git a/meta/recipes-multimedia/alsa/alsa-plugins_1.2.6.bb b/meta/recipes-multimedia/alsa/alsa-plugins_1.2.6.bb
index 7b1ca2ee15b..76f37bfd59e 100644
--- a/meta/recipes-multimedia/alsa/alsa-plugins_1.2.6.bb
+++ b/meta/recipes-multimedia/alsa/alsa-plugins_1.2.6.bb
@@ -15,7 +15,7 @@ SECTION = "multimedia"
 # with the libsamplerate license. However, if the licensee has a commercial
 # license for libsamplerate, the samplerate plugin may be used under the terms
 # of LGPLv2.1 like the rest of the plugins.
-LICENSE = "LGPLv2.1 & GPLv2+"
+LICENSE = "LGPL-2.1-only & GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
                     file://COPYING.GPL;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://m4/attributes.m4;endline=33;md5=bb8c6b2a67ac15156961e242fec33e50 \
diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb
index 540f4f79f4a..b0832f93c11 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb
@@ -5,7 +5,7 @@ firmware loaders for pcmcia, USB and the hdsp devices."
 HOMEPAGE = "http://www.alsa-project.org"
 BUGTRACKER = "http://alsa-project.org/main/index.php/Bug_Tracking"
 SECTION = "console/utils"
-LICENSE = "GPLv2 & LGPLv2+"
+LICENSE = "GPL-2.0-only & LGPL-2.0-or-later"
 DEPENDS = "alsa-lib"
 
 LIC_FILES_CHKSUM = "file://hdsploader/COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
diff --git a/meta/recipes-multimedia/alsa/alsa-utils.inc b/meta/recipes-multimedia/alsa/alsa-utils.inc
index 631cbe1029d..b627ced1aae 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils.inc
+++ b/meta/recipes-multimedia/alsa/alsa-utils.inc
@@ -5,7 +5,7 @@ HOMEPAGE = "http://www.alsa-project.org"
 BUGTRACKER = "http://alsa-project.org/main/index.php/Bug_Tracking"
 SECTION = "console/utils"
 # Some parts are GPLv2+, some are only GPLv2 (e.g. axfer, alsactl) so result is GPLv2
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://alsactl/utils.c;beginline=3;endline=18;md5=96cc06a4cebe5eb7975688ffb0e65642"
 DEPENDS = "alsa-lib ncurses libsamplerate0"
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.bb
index 4ff7bebbc9a..96eef5e0fec 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.bb
@@ -5,16 +5,16 @@ DESCRIPTION = "FFmpeg is the leading multimedia framework, able to decode, encod
 HOMEPAGE = "https://www.ffmpeg.org/"
 SECTION = "libs"
 
-LICENSE = "GPLv2+ & LGPLv2.1+ & ISC & MIT & BSD-2-Clause & BSD-3-Clause & IJG"
-LICENSE:${PN} = "GPLv2+"
-LICENSE:libavcodec = "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'GPLv2+', 'LGPLv2.1+', d)}"
-LICENSE:libavdevice = "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'GPLv2+', 'LGPLv2.1+', d)}"
-LICENSE:libavfilter = "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'GPLv2+', 'LGPLv2.1+', d)}"
-LICENSE:libavformat = "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'GPLv2+', 'LGPLv2.1+', d)}"
-LICENSE:libavutil = "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'GPLv2+', 'LGPLv2.1+', d)}"
-LICENSE:libpostproc = "GPLv2+"
-LICENSE:libswresample = "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'GPLv2+', 'LGPLv2.1+', d)}"
-LICENSE:libswscale = "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'GPLv2+', 'LGPLv2.1+', d)}"
+LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later & ISC & MIT & BSD-2-Clause & BSD-3-Clause & IJG"
+LICENSE:${PN} = "GPL-2.0-or-later"
+LICENSE:libavcodec = "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'GPL-2.0-or-later', 'LGPL-2.1-or-later', d)}"
+LICENSE:libavdevice = "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'GPL-2.0-or-later', 'LGPL-2.1-or-later', d)}"
+LICENSE:libavfilter = "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'GPL-2.0-or-later', 'LGPL-2.1-or-later', d)}"
+LICENSE:libavformat = "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'GPL-2.0-or-later', 'LGPL-2.1-or-later', d)}"
+LICENSE:libavutil = "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'GPL-2.0-or-later', 'LGPL-2.1-or-later', d)}"
+LICENSE:libpostproc = "GPL-2.0-or-later"
+LICENSE:libswresample = "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'GPL-2.0-or-later', 'LGPL-2.1-or-later', d)}"
+LICENSE:libswscale = "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'GPL-2.0-or-later', 'LGPL-2.1-or-later', d)}"
 LICENSE_FLAGS = "commercial"
 
 LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
diff --git a/meta/recipes-multimedia/flac/flac_1.3.3.bb b/meta/recipes-multimedia/flac/flac_1.3.3.bb
index c796cacd2c0..7c943b752fe 100644
--- a/meta/recipes-multimedia/flac/flac_1.3.3.bb
+++ b/meta/recipes-multimedia/flac/flac_1.3.3.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "FLAC stands for Free Lossless Audio Codec, a lossless audio compr
 HOMEPAGE = "https://xiph.org/flac/"
 BUGTRACKER = "http://sourceforge.net/p/flac/bugs/"
 SECTION = "libs"
-LICENSE = "GFDL-1.2 & GPLv2+ & LGPLv2.1+ & BSD-3-Clause"
+LICENSE = "GFDL-1.2 & GPL-2.0-or-later & LGPL-2.1-or-later & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.FDL;md5=ad1419ecc56e060eccf8184a87c4285f \
                     file://src/Makefile.am;beginline=1;endline=17;md5=09501c864f89dfc7ead65553129817ca \
                     file://COPYING.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.0.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.0.bb
index 7a27d27b2e1..678f3305700 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "A Tool to test GStreamer components"
 HOMEPAGE = "https://gstreamer.freedesktop.org/documentation/gst-devtools/index.html"
 SECTION = "multimedia"
 
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://validate/COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
 #S = "${WORKDIR}/gst-devtools-${PV}"
diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.18.6.bb b/meta/recipes-multimedia/gstreamer/gst-examples_1.18.6.bb
index 2a7a3c3111c..8b4e3394360 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.18.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.18.6.bb
@@ -2,7 +2,7 @@ SUMMARY = "GStreamer examples (including gtk-play, gst-play)"
 DESCRIPTION = "GStreamer example applications"
 HOMEPAGE = "https://gitlab.freedesktop.org/gstreamer/gst-examples"
 BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-examples/-/issues"
-LICENSE = "LGPL-2.0+"
+LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://playback/player/gtk/gtk-play.c;beginline=1;endline=20;md5=f8c72dae3d36823ec716a9ebcae593b9"
 
 DEPENDS = "glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad gtk+3 libsoup-2.4 json-glib glib-2.0-native"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.0.bb
index 98b2650bb0d..5f5caa7e523 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.0.bb
@@ -6,7 +6,7 @@ SECTION = "multimedia"
 
 # ffmpeg has comercial license flags so add it as we need ffmpeg as a dependency
 LICENSE_FLAGS = "commercial"
-LICENSE = "LGPLv2+"
+LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     file://ext/libav/gstav.h;beginline=1;endline=18;md5=a752c35267d8276fd9ca3db6994fca9c \
                     "
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.0.bb
index 15f19e349ec..60e89e20a92 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Wraps available OpenMAX IL components and makes them available as
 HOMEPAGE = "http://gstreamer.freedesktop.org/"
 SECTION = "multimedia"
 
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://omx/gstomx.h;beginline=1;endline=21;md5=5c8e1fca32704488e76d2ba9ddfa935f"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb
index 915d4ec744d..adfe87295cf 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb
@@ -15,7 +15,7 @@ SRC_URI[sha256sum] = "015b8d4d9a395ebf444d40876867a2034dd3304b3ad48bc3a0dd0c1ee7
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
-LICENSE = "GPLv2+ & LGPLv2+ & LGPLv2.1+"
+LICENSE = "GPL-2.0-or-later & LGPL-2.0-or-later & LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS += "gstreamer1.0-plugins-base"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb
index 455c9fc4805..cf5f228ceca 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb
@@ -3,7 +3,7 @@ require gstreamer1.0-plugins-common.inc
 DESCRIPTION = "'Base' GStreamer plugins and helper libraries"
 HOMEPAGE = "https://gstreamer.freedesktop.org/"
 BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-base/-/issues"
-LICENSE = "LGPLv2+"
+LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-${PV}.tar.xz \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.0.bb
index da4d4a8ccb5..d8c3a313886 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.0.bb
@@ -12,7 +12,7 @@ SRC_URI[sha256sum] = "2d119c15ab8c9e79f8cd3c6bf582ff7a050b28ccae52ab4865e1a14649
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
-LICENSE = "GPLv2+ & LGPLv2.1+"
+LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://gst/replaygain/rganalysis.c;beginline=1;endline=23;md5=b60ebefd5b2f5a8e0cab6bfee391a5fe"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.0.bb
index 8128104319a..4fe291c6d4e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.0.bb
@@ -7,7 +7,7 @@ BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-ugly/-/issues
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://tests/check/elements/xingmux.c;beginline=1;endline=21;md5=4c771b8af188724855cb99cadd390068"
 
-LICENSE = "GPLv2+ & LGPLv2.1+ & LGPLv2+"
+LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later & LGPL-2.0-or-later"
 LICENSE_FLAGS = "commercial"
 
 SRC_URI = " \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.0.bb
index 3399b6f9d75..c144ecfdef9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.0.bb
@@ -4,7 +4,7 @@ provided by python-gi) "
 HOMEPAGE = "http://cgit.freedesktop.org/gstreamer/gst-python/"
 SECTION = "multimedia"
 
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.0.bb
index 66764f08800..eb544986ffd 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "A library on top of GStreamer for building an RTSP server"
 HOMEPAGE = "http://cgit.freedesktop.org/gstreamer/gst-rtsp-server/"
 SECTION = "multimedia"
-LICENSE = "LGPLv2"
+LICENSE = "LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.0.bb
index ce7fbde0dff..7ef8ae31389 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.0.bb
@@ -6,7 +6,7 @@ based plugins for GStreamer and helper libraries: `vaapidecode', \
 
 REALPN = "gstreamer-vaapi"
 
-LICENSE = "LGPLv2.1+"
+LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb
index ba4fa249110..1966ff43f67 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb
@@ -4,7 +4,7 @@ It supports a wide range of formats including mp3, ogg, avi, mpeg and quicktime.
 HOMEPAGE = "http://gstreamer.freedesktop.org/"
 BUGTRACKER = "https://bugzilla.gnome.org/enter_bug.cgi?product=Gstreamer"
 SECTION = "multimedia"
-LICENSE = "LGPLv2+"
+LICENSE = "LGPL-2.0-or-later"
 
 DEPENDS = "glib-2.0 glib-2.0-native libxml2 bison-native flex-native"
 
diff --git a/meta/recipes-multimedia/lame/lame_3.100.bb b/meta/recipes-multimedia/lame/lame_3.100.bb
index 4927c9f2b3e..5b42795f4e3 100644
--- a/meta/recipes-multimedia/lame/lame_3.100.bb
+++ b/meta/recipes-multimedia/lame/lame_3.100.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "LAME is an educational tool to be used for learning about MP3 enc
 HOMEPAGE = "https://lame.sourceforge.io/"
 BUGTRACKER = "http://sourceforge.net/tracker/?group_id=290&atid=100290"
 SECTION = "console/utils"
-LICENSE = "LGPLv2+"
+LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c46bda00ffbb0ba1dac22f8d087f54d9 \
                     file://include/lame.h;beginline=1;endline=20;md5=a2258182c593c398d15a48262130a92b \
 "
diff --git a/meta/recipes-multimedia/liba52/liba52_0.7.4.bb b/meta/recipes-multimedia/liba52/liba52_0.7.4.bb
index ea16270cf89..f6bca4e730a 100644
--- a/meta/recipes-multimedia/liba52/liba52_0.7.4.bb
+++ b/meta/recipes-multimedia/liba52/liba52_0.7.4.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Library for decoding ATSC A/52 streams. The A/52 standard \
 is used in a variety of applications, including digital television \
 and DVD. It is also known as AC-3."
 HOMEPAGE = "http://liba52.sourceforge.net/"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 			file://include/a52.h;beginline=1;endline=12;md5=81152ceb3562bf20a60d1b6018175dd1"
 SECTION = "libs"
diff --git a/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb b/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
index 864d6bbeeac..4564d619ae2 100644
--- a/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
+++ b/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Bellagio is an opensource implementation of the Khronos OpenMAX \
                Integration Layer API to access multimedia components."
 HOMEPAGE = "http://omxil.sourceforge.net/"
 
-LICENSE = "LGPLv2.1+"
+LICENSE = "LGPL-2.1-or-later"
 LICENSE_FLAGS = "${@bb.utils.contains('PACKAGECONFIG', 'amr', 'commercial', '', d)}"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ae6f0f4dbc7ac193b50f323a6ae191cb \
                     file://src/omxcore.h;beginline=1;endline=27;md5=806b1e5566c06486fe8e42b461e03a90"
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
index 02d9d5b6c11..b8e703d0843 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://www.mega-nerd.com/libsndfile"
 AUTHOR = "Erik de Castro Lopo"
 DEPENDS = "flac libogg libvorbis"
 SECTION = "libs/multimedia"
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 
 SRC_URI = "http://www.mega-nerd.com/libsndfile/files/libsndfile-${PV}.tar.gz \
            file://CVE-2017-6892.patch \
diff --git a/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb b/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb
index ee4b754c12c..fd8b561657d 100644
--- a/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb
+++ b/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb
@@ -5,7 +5,7 @@ for mpeg-1 and mpeg-2 program streams. The main purpose of mpeg2dec \
 is to have a simple test bed for libmpeg2."
 HOMEPAGE = "https://libmpeg2.sourceforge.io/"
 SECTION = "libs"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://include/mpeg2.h;beginline=1;endline=22;md5=7766f4fcb58f0f8413c49a746f2ab89b"
diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb b/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb
index 6e0dc1beff4..0baa7aa4a1b 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://mpg123.de/"
 BUGTRACKER = "http://sourceforge.net/p/mpg123/bugs/"
 SECTION = "multimedia"
 
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e7b9c15fcfb986abb4cc5e8400a24169"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 4a1456d4072..bbab3ae0382 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -44,7 +44,7 @@ SECTION = "libs/multimedia"
 # of the licenses apply? What a mess. Some people hold the view that libdbus is
 # a system library that is covered by the "special exception" in GPLv2's
 # section 3, and therefore libdbus's GPL license doesn't affect PulseAudio.
-LICENSE = "LGPLv2.1+ & MIT & BSD-3-Clause"
+LICENSE = "LGPL-2.1-or-later & MIT & BSD-3-Clause"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0e5cd938de1a7a53ea5adac38cc10c39 \
                     file://GPL;md5=4325afd396febcb659c36b49533135d4 \
diff --git a/meta/recipes-multimedia/sbc/sbc_1.5.bb b/meta/recipes-multimedia/sbc/sbc_1.5.bb
index 13bba6b6b35..e5c72ec0b47 100644
--- a/meta/recipes-multimedia/sbc/sbc_1.5.bb
+++ b/meta/recipes-multimedia/sbc/sbc_1.5.bb
@@ -2,9 +2,9 @@ SUMMARY = "SBC Audio Codec"
 DESCRIPTION = "Bluetooth low-complexity, subband codec (SBC) library."
 HOMEPAGE = "https://www.bluez.org"
 SECTION = "libs"
-LICENSE = "GPLv2+ & LGPLv2.1+"
-LICENSE:${PN} = "LGPLv2.1+"
-LICENSE:${PN}-examples = "GPLv2+"
+LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
+LICENSE:${PN} = "LGPL-2.1-or-later"
+LICENSE:${PN}-examples = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
                     file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
                     file://src/sbcenc.c;beginline=1;endline=24;md5=08e7a70b127f4100ff2cd7d629147d8d \
diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-multimedia/x264/x264_git.bb
index c49e935d1cc..51ae9d1179e 100644
--- a/meta/recipes-multimedia/x264/x264_git.bb
+++ b/meta/recipes-multimedia/x264/x264_git.bb
@@ -2,7 +2,7 @@ SUMMARY = "H.264/MPEG-4 AVC video encoder"
 DESCRIPTION = "A free software library and application for encoding video streams into the H.264/MPEG-4 AVC format."
 HOMEPAGE = "http://www.videolan.org/developers/x264.html"
 
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
diff --git a/meta/recipes-rt/rt-tests/hwlatdetect_git.bb b/meta/recipes-rt/rt-tests/hwlatdetect_git.bb
index 14e319ae576..2dcc80965a3 100644
--- a/meta/recipes-rt/rt-tests/hwlatdetect_git.bb
+++ b/meta/recipes-rt/rt-tests/hwlatdetect_git.bb
@@ -2,7 +2,7 @@ SUMMARY = "Hardware latency detector"
 DESCRIPTION = "Python utility for controlling the kernel hardware latency detection module (hwlat_detector.ko)."
 HOMEPAGE = "https://rt.wiki.kernel.org/index.php/Cyclictest"
 SECTION = "tests"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 require rt-tests.inc
diff --git a/meta/recipes-rt/rt-tests/rt-tests_git.bb b/meta/recipes-rt/rt-tests/rt-tests_git.bb
index e86f7922bf3..ef082131e20 100644
--- a/meta/recipes-rt/rt-tests/rt-tests_git.bb
+++ b/meta/recipes-rt/rt-tests/rt-tests_git.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://wiki.linuxfoundation.org/realtime/documentation/start"
 DESCRIPTION = "The main aim of the PREEMPT_RT patch is to minimize the amount of kernel code that is non-preemptible Therefore several substitution mechanisms and new mechanisms are implemented."
 SECTION = "tests"
 DEPENDS = "linux-libc-headers virtual/libc numactl"
-LICENSE = "GPLv2 & GPLv2+"
+LICENSE = "GPL-2.0-only & GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 require rt-tests.inc
diff --git a/meta/recipes-sato/l3afpad/l3afpad_git.bb b/meta/recipes-sato/l3afpad/l3afpad_git.bb
index 50f6da24f3a..b06b0958a09 100644
--- a/meta/recipes-sato/l3afpad/l3afpad_git.bb
+++ b/meta/recipes-sato/l3afpad/l3afpad_git.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://github.com/stevenhoneyman/l3afpad"
 # Note that COPYING seems to mistakenly contain LGPLv2.1.
 # The source code is marked GPLv2+ and COPYING used to contain
 # that as well.
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://src/l3afpad.h;endline=20;md5=8848fd645cd45115d8cb47ca5c42a50e \
                     file://src/utils.c;endline=20;md5=ae4792f69d3bb7b7ba91d582ba9b1a05"
diff --git a/meta/recipes-sato/libptytty/libptytty_2.0.bb b/meta/recipes-sato/libptytty/libptytty_2.0.bb
index 85e3a36fba6..1199f0f44b5 100644
--- a/meta/recipes-sato/libptytty/libptytty_2.0.bb
+++ b/meta/recipes-sato/libptytty/libptytty_2.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = " OS independent and secure pty/tty and utmp/wtmp/lastlog handling"
 HOMEPAGE = "http://software.schmorp.de/pkg/libptytty.html"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 SRC_URI = "http://dist.schmorp.de/libptytty/libptytty-${PV}.tar.gz \
diff --git a/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb b/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb
index 8f3151bfc92..d951baf3610 100644
--- a/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb
+++ b/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "Matchbox GTK+ theme configuration application"
 HOMEPAGE = "http://matchbox-project.org"
 BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://appearance/mb-appearance.c;endline=25;md5=ea92333cf8a6802639d62d874c114a28"
 
diff --git a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.2.bb b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.2.bb
index c85f0440b1a..b05a9c48ad4 100644
--- a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.2.bb
+++ b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.2.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "A lightweight windows manager for embedded systems. It uses the d
 HOMEPAGE = "http://matchbox-project.org/"
 BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 
-LICENSE = "GPLv2+ & LGPLv2+"
+LICENSE = "GPL-2.0-or-later & LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://src/desktop.c;endline=20;md5=36c9bf295e6007f3423095f405af5a2d \
                     file://src/main.c;endline=19;md5=2044244f97a195c25b7dc602ac7e9a00"
diff --git a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_0.1.1.bb b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_0.1.1.bb
index a8784118146..b1724675bab 100644
--- a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_0.1.1.bb
+++ b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_0.1.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://matchbox-project.org"
 BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 SECTION = "x11"
 
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://src/matchbox-keyboard.h;endline=17;md5=9d6586c69e4a926f3cb0b4425f24ba3c \
                     file://applet/applet.c;endline=18;md5=4a0f721724746b14d95b51ddd42b95e7"
diff --git a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.11.bb b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.11.bb
index 49f9fdbb36c..3dec68b9638 100644
--- a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.11.bb
+++ b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.11.bb
@@ -4,7 +4,7 @@ launchers and small 'applet' style applications"
 HOMEPAGE = "http://matchbox-project.org"
 BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://matchbox-panel/mb-panel.h;endline=10;md5=0b7db28f4b6863fb853d0467e590019a \
                     file://applets/startup/startup.c;endline=22;md5=7cbcea60b667f609495222faf3e07917"
diff --git a/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb b/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
index 7af11c2f508..020e211ea59 100644
--- a/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
+++ b/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "Custom Matchbox session files for the Sato environment"
 HOMEPAGE = "http://www.matchbox-project.org/"
 BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 
-LICENSE = "GPLv2.0+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://session;endline=3;md5=f8a5c5b9c279e52dc094d10e11c2be63"
 
 SECTION = "x11"
diff --git a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb
index e2e81c2905d..802ffa971bf 100644
--- a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb
+++ b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "Lightweight GTK+ terminal application"
 HOMEPAGE = "http://www.matchbox-project.org/"
 BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://main.c;endline=20;md5=96e39176d9e355639a0b8b1c7a840820"
 
diff --git a/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb b/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb
index aa1ac77e16d..0c5ed5e55e3 100644
--- a/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb
+++ b/meta/recipes-sato/pcmanfm/pcmanfm_1.3.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "Fast lightweight tabbed filemanager"
 DESCRIPTION = "A free file manager application and the standard file manager of LXDE."
 HOMEPAGE = "http://pcmanfm.sourceforge.net/"
 
-LICENSE = "GPLv2 & GPLv2+ & LGPLv2.1+"
+LICENSE = "GPL-2.0-only & GPL-2.0-or-later & LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://src/pcmanfm.h;endline=22;md5=417b3855771a3a87f8ad753d994491f0 \
                     file://src/gseal-gtk-compat.h;endline=21;md5=46922c8691f58d124f9420fe16149ce2"
diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.30.bb b/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.30.bb
index 0133029e0a1..5e3c84194a3 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.30.bb
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.30.bb
@@ -1,6 +1,6 @@
 require rxvt-unicode.inc
 
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://src/main.C;beginline=1;endline=31;md5=d3600d7ee1062667fcd1193fbe6485f6"
 
diff --git a/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb b/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb
index 7fd9272bf48..eea7025c8d4 100644
--- a/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb
+++ b/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb
@@ -2,7 +2,7 @@ SUMMARY = "Ultra-simple screen capture utility, aimed at handheld devices"
 HOMEPAGE = "http://www.o-hand.com"
 BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 
-LICENSE = "GPLv2 & GPLv2+"
+LICENSE = "GPL-2.0-only & GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://main.c;endline=9;md5=023e14d6404d0a961eb97cbd011fc141 \
                     file://screenshot-ui.h;endline=9;md5=638d9ffa83e9325a36df224166ed6ad0"
diff --git a/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb b/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb
index 77ecd3fe9fd..4356930da0d 100644
--- a/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb
+++ b/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Provides a bridge between gconf and xsettings"
 HOMEPAGE = "https://git.yoctoproject.org/cgit/cgit.cgi/xsettings-daemon/"
 BUGTRACKER = "http://bugzilla.yoctoproject.org/"
-LICENSE = "MIT-style"
+LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://xsettings-manager.h;endline=22;md5=7cfac9d2d4dc3694cc7eb605cf32a69b \
                     file://xsettings-common.h;endline=22;md5=7cfac9d2d4dc3694cc7eb605cf32a69b"
 DEPENDS = "gconf glib-2.0 gtk+3"
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.34.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.34.5.bb
index 41ecb8095a0..9f5846858fa 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.34.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.34.5.bb
@@ -2,7 +2,7 @@ SUMMARY = "WebKit web rendering engine for the GTK+ platform"
 HOMEPAGE = "https://www.webkitgtk.org/"
 BUGTRACKER = "https://bugs.webkit.org/"
 
-LICENSE = "BSD-2-Clause & LGPLv2+"
+LICENSE = "BSD-2-Clause & LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://Source/JavaScriptCore/COPYING.LIB;md5=d0c6d6397a5d84286dda758da57bd691 \
                     file://Source/WebCore/LICENSE-APPLE;md5=4646f90082c40bcf298c285f8bab0b12 \
                     file://Source/WebCore/LICENSE-LGPL-2;md5=36357ffde2b64ae177b2494445b79d21 \
diff --git a/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb b/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb
index 317f71b7728..e7599d69d62 100644
--- a/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb
+++ b/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb
@@ -4,7 +4,7 @@
 SUMMARY = "Glibc hierarchical argument parsing standalone library"
 DESCRIPTION = "Standalone version of arguments parsing functions from GLIBC"
 HOMEPAGE = "http://www.lysator.liu.se/~nisse/misc/"
-LICENSE = "LGPL-2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://argp.h;beginline=1;endline=20;md5=008b7e53dea6f9e1d9fdef0d9cf3184a"
 SECTION = "libs"
 
diff --git a/meta/recipes-support/aspell/aspell_0.60.8.bb b/meta/recipes-support/aspell/aspell_0.60.8.bb
index 3c2b3d16662..39b55f4ff26 100644
--- a/meta/recipes-support/aspell/aspell_0.60.8.bb
+++ b/meta/recipes-support/aspell/aspell_0.60.8.bb
@@ -10,7 +10,7 @@ SECTION = "console/utils"
 
 HOMEPAGE = "http://aspell.net/"
 
-LICENSE = "LGPLv2 | LGPLv2.1"
+LICENSE = "LGPL-2.0-only | LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz \
diff --git a/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb b/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb
index f0415848782..87f7b83c7d0 100644
--- a/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb
+++ b/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "AT-SPI 2 Toolkit Bridge"
 DESCRIPTION = "Contains a library that bridges ATK to At-Spi2 D-Bus service. Toolkit widgets use it to provide their content to screen readers such as Orca."
 HOMEPAGE = "https://wiki.linuxfoundation.org/accessibility/d-bus"
 BUGTRACKER = "http://bugzilla.gnome.org/"
-LICENSE = "LGPL-2.1+"
+LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI[archive.sha256sum] = "cfa008a5af822b36ae6287f18182c40c91dd699c55faa38605881ed175ca464f"
diff --git a/meta/recipes-support/atk/at-spi2-core_2.42.0.bb b/meta/recipes-support/atk/at-spi2-core_2.42.0.bb
index e09c74ac7f6..9ca969cbb8b 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.42.0.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.42.0.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "It provides a Service Provider Interface for the Assistive Techno
 
 HOMEPAGE = "https://wiki.linuxfoundation.org/accessibility/d-bus"
 BUGTRACKER = "http://bugzilla.gnome.org/"
-LICENSE = "LGPL-2.1+"
+LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
diff --git a/meta/recipes-support/atk/atk_2.36.0.bb b/meta/recipes-support/atk/atk_2.36.0.bb
index ec289e7acc2..59913f4bd06 100644
--- a/meta/recipes-support/atk/atk_2.36.0.bb
+++ b/meta/recipes-support/atk/atk_2.36.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://wiki.gnome.org/Accessibility"
 BUGTRACKER = "https://gitlab.gnome.org/GNOME/atk/-/issues"
 SECTION = "x11/libs"
 
-LICENSE = "GPLv2+ & LGPLv2+"
+LICENSE = "GPL-2.0-or-later & LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
                     file://atk/atkutil.c;endline=18;md5=6fd31cd2fdc9b30f619ca8d819bc12d3 \
                     file://atk/atk.h;endline=18;md5=fcd7710187e0eae485e356c30d1b0c3b"
diff --git a/meta/recipes-support/attr/acl_2.3.1.bb b/meta/recipes-support/attr/acl_2.3.1.bb
index c965ac553f1..aca04a9aac3 100644
--- a/meta/recipes-support/attr/acl_2.3.1.bb
+++ b/meta/recipes-support/attr/acl_2.3.1.bb
@@ -7,9 +7,9 @@ BUGTRACKER = "http://savannah.nongnu.org/bugs/?group=acl"
 
 SECTION = "libs"
 
-LICENSE = "LGPLv2.1+ & GPLv2+"
-LICENSE:${PN} = "GPLv2+"
-LICENSE:lib${BPN} = "LGPLv2.1+"
+LICENSE = "LGPL-2.1-or-later & GPL-2.0-or-later"
+LICENSE:${PN} = "GPL-2.0-or-later"
+LICENSE:lib${BPN} = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://doc/COPYING;md5=c781d70ed2b4d48995b790403217a249 \
                     file://doc/COPYING.LGPL;md5=9e9a206917f8af112da634ce3ab41764"
 
diff --git a/meta/recipes-support/attr/attr.inc b/meta/recipes-support/attr/attr.inc
index 02645db7481..a4e38f2b199 100644
--- a/meta/recipes-support/attr/attr.inc
+++ b/meta/recipes-support/attr/attr.inc
@@ -6,9 +6,9 @@ SECTION = "libs"
 
 DEPENDS = "virtual/libintl"
 
-LICENSE = "LGPLv2.1+ & GPLv2+"
-LICENSE:${PN} = "GPLv2+"
-LICENSE:lib${BPN} = "LGPLv2.1+"
+LICENSE = "LGPL-2.1-or-later & GPL-2.0-or-later"
+LICENSE:${PN} = "GPL-2.0-or-later"
+LICENSE:lib${BPN} = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://doc/COPYING;md5=2d0aa14b3fce4694e4f615e30186335f \
                     file://doc/COPYING.LGPL;md5=b8d31f339300bc239d73461d68e77b9c \
                     file://tools/attr.c;endline=17;md5=be0403261f0847e5f43ed5b08d19593c \
diff --git a/meta/recipes-support/bash-completion/bash-completion_2.11.bb b/meta/recipes-support/bash-completion/bash-completion_2.11.bb
index f63a69b5b4e..d981dd0c3a4 100644
--- a/meta/recipes-support/bash-completion/bash-completion_2.11.bb
+++ b/meta/recipes-support/bash-completion/bash-completion_2.11.bb
@@ -7,7 +7,7 @@ as installing them."
 HOMEPAGE = "https://github.com/scop/bash-completion"
 BUGTRACKER = "https://github.com/scop/bash-completion/issues"
 
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 SECTION = "console/utils"
diff --git a/meta/recipes-support/bmap-tools/bmap-tools_3.6.bb b/meta/recipes-support/bmap-tools/bmap-tools_3.6.bb
index c66ff3a7da9..1e87d45c90d 100644
--- a/meta/recipes-support/bmap-tools/bmap-tools_3.6.bb
+++ b/meta/recipes-support/bmap-tools/bmap-tools_3.6.bb
@@ -6,7 +6,7 @@ unused blocks, like raw system image files, can be copied or flashed a lot \
 faster with bmaptool than with traditional tools like "dd" or "cp"."
 HOMEPAGE = "https://github.com/01org/bmap-tools"
 SECTION = "console/utils"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/intel/${BPN};branch=master;protocol=https"
diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb b/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb
index dbee7dc6166..99abe606139 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb
@@ -4,7 +4,7 @@ SSL-based applications to check for the authenticity of SSL connections. \
 This derived from Debian's CA Certificates."
 HOMEPAGE = "http://packages.debian.org/sid/ca-certificates"
 SECTION = "misc"
-LICENSE = "GPL-2.0+ & MPL-2.0"
+LICENSE = "GPL-2.0-or-later & MPL-2.0"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=ae5b36b514e3f12ce1aa8e2ee67f3d7e"
 
 # This is needed to ensure we can run the postinst at image creation time
diff --git a/meta/recipes-support/consolekit/consolekit_0.4.6.bb b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
index 95ce97ef34b..346bd60e4d7 100644
--- a/meta/recipes-support/consolekit/consolekit_0.4.6.bb
+++ b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
@@ -4,7 +4,7 @@ of any of these items or of any of the metadata associated with them."
 HOMEPAGE = "http://www.freedesktop.org/wiki/Software/ConsoleKit"
 BUGTRACKER = "https://bugs.freedesktop.org/buglist.cgi?query_format=specific&product=ConsoleKit"
 
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://src/main.c;endline=21;md5=0a994e09769780220163255d8f9071c3"
 
diff --git a/meta/recipes-support/debianutils/debianutils_5.7.bb b/meta/recipes-support/debianutils/debianutils_5.7.bb
index cc61b4394f5..7d705c6ff46 100644
--- a/meta/recipes-support/debianutils/debianutils_5.7.bb
+++ b/meta/recipes-support/debianutils/debianutils_5.7.bb
@@ -5,7 +5,7 @@ you may use them directly. "
 HOMEPAGE = "https://packages.debian.org/sid/debianutils"
 BUGTRACKER = "https://bugs.debian.org/cgi-bin/pkgreport.cgi?pkg=debianutils;dist=unstable"
 SECTION = "base"
-LICENSE = "GPLv2 & SMAIL_GPL"
+LICENSE = "GPL-2.0-only & SMAIL_GPL"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=9b912cd0cc654134c0ef3424a0705b94"
 
 SRC_URI = "git://salsa.debian.org/debian/debianutils.git;protocol=https;branch=master \
diff --git a/meta/recipes-support/diffoscope/diffoscope_204.bb b/meta/recipes-support/diffoscope/diffoscope_204.bb
index c06c38a16d2..588894cb9a8 100644
--- a/meta/recipes-support/diffoscope/diffoscope_204.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_204.bb
@@ -5,7 +5,7 @@ various binary formats into more human-readable form to compare them. \
 It can compare two tarballs, ISO images, or PDF just as easily."
 HOMEPAGE = "https://diffoscope.org/"
 BUGTRACKER = "https://salsa.debian.org/reproducible-builds/diffoscope/-/issues"
-LICENSE = "GPL-3.0+"
+LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 PYPI_PACKAGE = "diffoscope"
diff --git a/meta/recipes-support/enchant/enchant2_2.3.2.bb b/meta/recipes-support/enchant/enchant2_2.3.2.bb
index c7b6504a40e..101a42b59d2 100644
--- a/meta/recipes-support/enchant/enchant2_2.3.2.bb
+++ b/meta/recipes-support/enchant/enchant2_2.3.2.bb
@@ -4,7 +4,7 @@ different spelling libraries and programs with a consistent interface."
 SECTION = "libs"
 HOMEPAGE = "https://abiword.github.io/enchant/"
 BUGTRACKER = "https://github.com/AbiWord/enchant/issues/"
-LICENSE = "LGPLv2.1+"
+LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS = "glib-2.0"
diff --git a/meta/recipes-support/fribidi/fribidi_1.0.11.bb b/meta/recipes-support/fribidi/fribidi_1.0.11.bb
index 7e4f29497b5..56ca7345589 100644
--- a/meta/recipes-support/fribidi/fribidi_1.0.11.bb
+++ b/meta/recipes-support/fribidi/fribidi_1.0.11.bb
@@ -6,7 +6,7 @@ as Hebrew, Arabic, Syriac, and Thaana. "
 SECTION = "libs"
 HOMEPAGE = "http://fribidi.org/"
 BUGTRACKER = "https://github.com/fribidi/fribidi/issues"
-LICENSE = "LGPLv2.1+"
+LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.xz \
diff --git a/meta/recipes-support/gdbm/gdbm_1.23.bb b/meta/recipes-support/gdbm/gdbm_1.23.bb
index 4ec80b5b7e4..a08079741df 100644
--- a/meta/recipes-support/gdbm/gdbm_1.23.bb
+++ b/meta/recipes-support/gdbm/gdbm_1.23.bb
@@ -4,7 +4,7 @@ and work similar to the standard UNIX dbm. These routines are provided \
 to a programmer needing to create and manipulate a hashed database."
 HOMEPAGE = "http://www.gnu.org/software/gdbm/"
 SECTION = "libs"
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=241da1b9fe42e642cbb2c24d5e0c4d24"
 
 
diff --git a/meta/recipes-support/gmp/gmp_6.2.1.bb b/meta/recipes-support/gmp/gmp_6.2.1.bb
index 33f439eca98..72fbf4eefe4 100644
--- a/meta/recipes-support/gmp/gmp_6.2.1.bb
+++ b/meta/recipes-support/gmp/gmp_6.2.1.bb
@@ -1,6 +1,6 @@
 require gmp.inc
 
-LICENSE = "GPLv2+ | LGPLv3+"
+LICENSE = "GPL-2.0-or-later | LGPL-3.0-or-later"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                    file://COPYING.LESSERv3;md5=6a6a8e020838b23406c81b19c1d46df6 \
diff --git a/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb b/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb
index 8cd27e9075e..0cc7cd7b67c 100644
--- a/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb
+++ b/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb
@@ -4,7 +4,7 @@ These tests are useful for verifying the functionality of software as \
 installed and packaged, and complement rather than replace build-time \
 ('make check') tests."
 HOMEPAGE = "https://wiki.gnome.org/GnomeGoals/InstalledTests"
-LICENSE = "LGPLv2+"
+LICENSE = "LGPL-2.0-or-later"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
                     file://src/gnome-desktop-testing-runner.c;beginline=1;endline=20;md5=7ef3ad9da2ffcf7707dc11151fe007f4"
diff --git a/meta/recipes-support/gnupg/gnupg_2.3.4.bb b/meta/recipes-support/gnupg/gnupg_2.3.4.bb
index 7faaffbc27c..81361d902ce 100644
--- a/meta/recipes-support/gnupg/gnupg_2.3.4.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.3.4.bb
@@ -5,7 +5,7 @@ and sign your data and communications; it features a versatile key \
 management system, along with access modules for all kinds of public \
 key directories."
 HOMEPAGE = "http://www.gnupg.org/"
-LICENSE = "GPLv3 & LGPLv3"
+LICENSE = "GPL-3.0-only & LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=189af8afca6d6075ba6c9e0aa8077626 \
                     file://COPYING.LGPL3;md5=a2b6bf2cb38ee52619e60f30a1fc7257"
 
diff --git a/meta/recipes-support/gnutls/gnutls_3.7.3.bb b/meta/recipes-support/gnutls/gnutls_3.7.3.bb
index 6c47ed350fb..ebabac1bd05 100644
--- a/meta/recipes-support/gnutls/gnutls_3.7.3.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.7.3.bb
@@ -4,11 +4,11 @@ TLS and DTLS protocols and technologies around them."
 HOMEPAGE = "https://gnutls.org/"
 BUGTRACKER = "https://savannah.gnu.org/support/?group=gnutls"
 
-LICENSE = "GPLv3+ & LGPLv2.1+"
-LICENSE:${PN} = "LGPLv2.1+"
-LICENSE:${PN}-xx = "LGPLv2.1+"
-LICENSE:${PN}-bin = "GPLv3+"
-LICENSE:${PN}-openssl = "GPLv3+"
+LICENSE = "GPL-3.0-or-later & LGPL-2.1-or-later"
+LICENSE:${PN} = "LGPL-2.1-or-later"
+LICENSE:${PN}-xx = "LGPL-2.1-or-later"
+LICENSE:${PN}-bin = "GPL-3.0-or-later"
+LICENSE:${PN}-OpenSSL = "GPL-3.0-or-later"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=71391c8e0c1cfe68077e7fce3b586283 \
                     file://doc/COPYING;md5=c678957b0c8e964aa6c70fd77641a71e \
diff --git a/meta/recipes-support/gnutls/libtasn1_4.18.0.bb b/meta/recipes-support/gnutls/libtasn1_4.18.0.bb
index a0b91ee5768..db49adc1c2f 100644
--- a/meta/recipes-support/gnutls/libtasn1_4.18.0.bb
+++ b/meta/recipes-support/gnutls/libtasn1_4.18.0.bb
@@ -3,9 +3,9 @@ DESCRIPTION = "A highly portable C library that encodes and decodes \
 DER/BER data following an ASN.1 schema. "
 HOMEPAGE = "http://www.gnu.org/software/libtasn1/"
 
-LICENSE = "GPLv3+ & LGPLv2.1+"
-LICENSE:${PN}-bin = "GPLv3+"
-LICENSE:${PN} = "LGPLv2.1+"
+LICENSE = "GPL-3.0-or-later & LGPL-2.1-or-later"
+LICENSE:${PN}-bin = "GPL-3.0-or-later"
+LICENSE:${PN} = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://doc/COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://doc/COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c \
                     file://COPYING;md5=75ac100ec923f959898182307970c360"
diff --git a/meta/recipes-support/gpgme/gpgme_1.17.0.bb b/meta/recipes-support/gpgme/gpgme_1.17.0.bb
index 6a201789e13..382b2472ed9 100644
--- a/meta/recipes-support/gpgme/gpgme_1.17.0.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.17.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "GnuPG Made Easy (GPGME) is a library designed to make access to G
 HOMEPAGE = "http://www.gnupg.org/gpgme.html"
 BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
 
-LICENSE = "GPLv2+ & LGPLv2.1+"
+LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://COPYING.LESSER;md5=bbb461211a33b134d42ed5ee802b37ff \
                     file://src/gpgme.h.in;endline=23;md5=2f0bf06d1c7dcb28532a9d0f94a7ca1d \
diff --git a/meta/recipes-support/iso-codes/iso-codes_4.9.0.bb b/meta/recipes-support/iso-codes/iso-codes_4.9.0.bb
index 92932c30a16..f51edf09a4e 100644
--- a/meta/recipes-support/iso-codes/iso-codes_4.9.0.bb
+++ b/meta/recipes-support/iso-codes/iso-codes_4.9.0.bb
@@ -5,7 +5,7 @@ than repeated in many programs throughout the system."
 HOMEPAGE = "https://salsa.debian.org/iso-codes-team/iso-codes"
 BUGTRACKER = "https://salsa.debian.org/iso-codes-team/iso-codes/issues"
 
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://salsa.debian.org/iso-codes-team/iso-codes.git;protocol=https;branch=main;"
diff --git a/meta/recipes-support/itstool/itstool_2.0.7.bb b/meta/recipes-support/itstool/itstool_2.0.7.bb
index 2416835d370..5af16995d73 100644
--- a/meta/recipes-support/itstool/itstool_2.0.7.bb
+++ b/meta/recipes-support/itstool/itstool_2.0.7.bb
@@ -4,7 +4,7 @@ files, then merges translations from MO files to create translated \
 XML files. It determines what to translate and how to chunk it into \
 messages using the W3C Internationalization Tag Set (ITS). "
 HOMEPAGE = "http://itstool.org/"
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59c57b95fd7d0e9e238ebbc7ad47c5a5"
 
 inherit autotools python3native
diff --git a/meta/recipes-support/libassuan/libassuan_2.5.5.bb b/meta/recipes-support/libassuan/libassuan_2.5.5.bb
index 2d78911c651..2bab3ac9554 100644
--- a/meta/recipes-support/libassuan/libassuan_2.5.5.bb
+++ b/meta/recipes-support/libassuan/libassuan_2.5.5.bb
@@ -5,9 +5,9 @@ Both, server and client side functions are provided. "
 HOMEPAGE = "http://www.gnupg.org/related_software/libassuan/"
 BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
 
-LICENSE = "GPLv3+ & LGPLv2.1+"
-LICENSE:${PN} = "LGPLv2.1+"
-LICENSE:${PN}-doc = "GPLv3+"
+LICENSE = "GPL-3.0-or-later & LGPL-2.1-or-later"
+LICENSE:${PN} = "LGPL-2.1-or-later"
+LICENSE:${PN}-doc = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
                     file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://src/assuan.c;endline=20;md5=ab92143a5a2adabd06d7994d1467ea5c\
diff --git a/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb b/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb
index d7aecc706c4..8ea84369773 100644
--- a/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb
+++ b/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Package provides semi-portable access to hardware-provided atomic
 HOMEPAGE = "https://github.com/ivmai/libatomic_ops/"
 SECTION = "optional"
 PROVIDES += "libatomics-ops"
-LICENSE = "GPLv2 & MIT"
+LICENSE = "GPL-2.0-only & MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://doc/LICENSING.txt;md5=e00dd5c8ac03a14c5ae5225a4525fa2d \
                     "
diff --git a/meta/recipes-support/libcap-ng/libcap-ng.inc b/meta/recipes-support/libcap-ng/libcap-ng.inc
index 34374b4dbf2..57fcd50d9fe 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng.inc
+++ b/meta/recipes-support/libcap-ng/libcap-ng.inc
@@ -3,7 +3,7 @@ DESCRIPTION = "The libcap-ng library is intended to make programming \
 with POSIX capabilities much easier than the traditional libcap library."
 HOMEPAGE = "http://freecode.com/projects/libcap-ng"
 SECTION = "base"
-LICENSE = "GPLv2+ & LGPLv2.1+"
+LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 		    file://COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
 
diff --git a/meta/recipes-support/libcap/libcap_2.63.bb b/meta/recipes-support/libcap/libcap_2.63.bb
index 4b7111890ed..f3133f9dedb 100644
--- a/meta/recipes-support/libcap/libcap_2.63.bb
+++ b/meta/recipes-support/libcap/libcap_2.63.bb
@@ -4,7 +4,7 @@ These allow giving various kinds of specific privileges to individual \
 users, without giving them full root permissions."
 HOMEPAGE = "http://sites.google.com/site/fullycapable/"
 # no specific GPL version required
-LICENSE = "BSD-3-Clause | GPLv2"
+LICENSE = "BSD-3-Clause | GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://License;md5=e2370ba375efe9e1a095c26d37e483b8"
 
 DEPENDS = "hostperl-runtime-native gperf-native"
diff --git a/meta/recipes-support/libcheck/libcheck_0.15.2.bb b/meta/recipes-support/libcheck/libcheck_0.15.2.bb
index 89bcafc4532..188d689cc3b 100644
--- a/meta/recipes-support/libcheck/libcheck_0.15.2.bb
+++ b/meta/recipes-support/libcheck/libcheck_0.15.2.bb
@@ -7,7 +7,7 @@ reportable in the following: Subunit, TAP, XML, and a generic logging format."
 HOMEPAGE = "https://libcheck.github.io/check/"
 SECTION = "devel"
 
-LICENSE  = "LGPLv2.1+"
+LICENSE  = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 SRC_URI = "https://github.com/${BPN}/check/releases/download/${PV}/check-${PV}.tar.gz \
diff --git a/meta/recipes-support/libcroco/libcroco_0.6.13.bb b/meta/recipes-support/libcroco/libcroco_0.6.13.bb
index 66ee647ffac..419c9626576 100644
--- a/meta/recipes-support/libcroco/libcroco_0.6.13.bb
+++ b/meta/recipes-support/libcroco/libcroco_0.6.13.bb
@@ -5,7 +5,7 @@ used by GNOME applications in need of CSS support."
 HOMEPAGE = "http://www.gnome.org/"
 BUGTRACKER = "https://bugzilla.gnome.org/"
 
-LICENSE = "LGPLv2 & LGPLv2.1"
+LICENSE = "LGPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605 \
                     file://src/cr-rgb.c;endline=22;md5=31d5f0944d556c8589d04ea6055fcc66 \
                     file://tests/cr-test-utils.c;endline=21;md5=2382c27934cae1d3792fcb17a6142c4e"
diff --git a/meta/recipes-support/libdaemon/libdaemon_0.14.bb b/meta/recipes-support/libdaemon/libdaemon_0.14.bb
index 85a30bcac33..de6ac388a3a 100644
--- a/meta/recipes-support/libdaemon/libdaemon_0.14.bb
+++ b/meta/recipes-support/libdaemon/libdaemon_0.14.bb
@@ -6,7 +6,7 @@ is running at a time."
 SECTION = "libs"
 AUTHOR = "Lennart Poettering <lennart@poettering.net>"
 HOMEPAGE = "http://0pointer.de/lennart/projects/libdaemon/"
-LICENSE = "LGPLv2.1+"
+LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://libdaemon/daemon.h;beginline=9;endline=21;md5=bd9fbe57cd96d1a5848a8ba12d9a6bf4"
 
diff --git a/meta/recipes-support/libexif/libexif_0.6.24.bb b/meta/recipes-support/libexif/libexif_0.6.24.bb
index 95fa68c67ed..20ba0ef2829 100644
--- a/meta/recipes-support/libexif/libexif_0.6.24.bb
+++ b/meta/recipes-support/libexif/libexif_0.6.24.bb
@@ -4,7 +4,7 @@ intended to replace lots of redundant implementations in command-line \
 utilities and programs with GUIs."
 HOMEPAGE = "https://libexif.github.io/"
 SECTION = "libs"
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=243b725d71bb5df4a1e5920b344b86ad"
 
 def version_underscore(v):
diff --git a/meta/recipes-support/libfm/libfm-extra_1.3.2.bb b/meta/recipes-support/libfm/libfm-extra_1.3.2.bb
index 0adb3b6415d..79dd1d92dce 100644
--- a/meta/recipes-support/libfm/libfm-extra_1.3.2.bb
+++ b/meta/recipes-support/libfm/libfm-extra_1.3.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "Library for file management"
 DESCRIPTION = "Contains a library and other files required by menu-cache-gen libexec of menu-cache-1.1.0. "
 HOMEPAGE = "http://pcmanfm.sourceforge.net/"
 
-LICENSE = "LGPLv2+"
+LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://src/fm-extra.h;beginline=8;endline=21;md5=ef1f84da64b3c01cca447212f7ef6007"
 
 SECTION = "x11/libs"
diff --git a/meta/recipes-support/libfm/libfm_1.3.2.bb b/meta/recipes-support/libfm/libfm_1.3.2.bb
index 79c7c8eedaf..057c7370293 100644
--- a/meta/recipes-support/libfm/libfm_1.3.2.bb
+++ b/meta/recipes-support/libfm/libfm_1.3.2.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "LibFM provides file management functions built on top of Glib/GIO
 giving a convenient higher-level API."
 HOMEPAGE = "http://pcmanfm.sourceforge.net/"
 
-LICENSE = "GPLv2+ & LGPLv2+"
+LICENSE = "GPL-2.0-or-later & LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4641e94ec96f98fabc56ff9cc48be14b \
                     file://src/fm.h;beginline=8;endline=21;md5=ef1f84da64b3c01cca447212f7ef6007 \
                     file://src/base/fm-config.h;beginline=10;endline=23;md5=ef1f84da64b3c01cca447212f7ef6007 \
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.9.4.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.9.4.bb
index 910804e1e9b..866f3932f69 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.9.4.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.9.4.bb
@@ -7,10 +7,10 @@ BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
 SECTION = "libs"
 
 # helper program gcryptrnd and getrandom are under GPL, rest LGPL
-LICENSE = "GPLv2+ & LGPLv2.1+ & GPLv3+"
-LICENSE:${PN} = "LGPLv2.1+"
-LICENSE:${PN}-dev = "GPLv2+ & LGPLv2.1+"
-LICENSE:dumpsexp-dev = "GPLv3+"
+LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later & GPL-3.0-or-later"
+LICENSE:${PN} = "LGPL-2.1-or-later"
+LICENSE:${PN}-dev = "GPL-2.0-or-later & LGPL-2.1-or-later"
+LICENSE:dumpsexp-dev = "GPL-3.0-or-later"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://COPYING.LIB;md5=bbb461211a33b134d42ed5ee802b37ff \
diff --git a/meta/recipes-support/libgit2/libgit2_1.4.0.bb b/meta/recipes-support/libgit2/libgit2_1.4.0.bb
index 4dd32a75cc7..23a195b43b3 100644
--- a/meta/recipes-support/libgit2/libgit2_1.4.0.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.4.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "the Git linkable library"
 HOMEPAGE = "http://libgit2.github.com/"
-LICENSE = "GPL-2.0-with-GCC-exception & MIT & openssl"
+LICENSE = "GPL-2.0-with-GCC-exception & MIT & OpenSSL"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e5a9227de4cb6afb5d35ed7b0fdf480d"
 
 DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb
index e3171f0f252..41adad0ede2 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Contains common error codes and error handling functions used by
 HOMEPAGE = "http://www.gnupg.org/related_software/libgpg-error/"
 BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
 
-LICENSE = "GPLv2+ & LGPLv2.1+"
+LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://src/gpg-error.h.in;beginline=2;endline=18;md5=d82591bc81561f617da71e00ff4a9d79 \
diff --git a/meta/recipes-support/libical/libical_3.0.14.bb b/meta/recipes-support/libical/libical_3.0.14.bb
index 756100297eb..717eb11e125 100644
--- a/meta/recipes-support/libical/libical_3.0.14.bb
+++ b/meta/recipes-support/libical/libical_3.0.14.bb
@@ -5,7 +5,7 @@ calendar clients can communicate with calendar servers so users can store \
 their calendar data and arrange meetings with other users. "
 HOMEPAGE = "https://github.com/libical/libical"
 BUGTRACKER = "https://github.com/libical/libical/issues"
-LICENSE = "LGPLv2.1 | MPL-2.0"
+LICENSE = "LGPL-2.1-only | MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1910a2a76ddf6a9ba369182494170d87 \
                     file://LICENSE.LGPL21.txt;md5=933adb561f159e7c3da079536f0ed871 \
                     file://LICENSE.MPL2.txt;md5=f75d2927d3c1ed2414ef72048f5ad640 \
diff --git a/meta/recipes-support/libjitterentropy/libjitterentropy_3.3.1.bb b/meta/recipes-support/libjitterentropy/libjitterentropy_3.3.1.bb
index 5331cf26858..38b48908a36 100644
--- a/meta/recipes-support/libjitterentropy/libjitterentropy_3.3.1.bb
+++ b/meta/recipes-support/libjitterentropy/libjitterentropy_3.3.1.bb
@@ -4,7 +4,7 @@ It does not depend on any system resource other than a high-resolution time \
 stamp. It is a small-scale, yet fast entropy source that is viable in almost \
 all environments and on a lot of CPU architectures."
 HOMEPAGE = "http://www.chronox.de/jent.html"
-LICENSE = "GPLv2+ | BSD-3-Clause"
+LICENSE = "GPL-2.0-or-later | BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1c94a9d191202a5552f381a023551396 \
                     file://LICENSE.gplv2;md5=eb723b61539feef013de476e68b5c50a \
                     file://LICENSE.bsd;md5=66a5cedaf62c4b2637025f049f9b826f \
diff --git a/meta/recipes-support/libksba/libksba_1.6.0.bb b/meta/recipes-support/libksba/libksba_1.6.0.bb
index 1374394610c..0765346399e 100644
--- a/meta/recipes-support/libksba/libksba_1.6.0.bb
+++ b/meta/recipes-support/libksba/libksba_1.6.0.bb
@@ -5,9 +5,9 @@ the implemented protocols and presents the data in a consistent way. The \
 library does not rely on another cryptographic library but provides \
 hooks for easy integration with Libgcrypt. "
 HOMEPAGE = "http://www.gnupg.org/related_software/libksba/"
-LICENSE = "GPLv3+ & (GPLv2+ | LGPLv3+)"
-LICENSE:${PN} = "GPLv2+ | LGPLv3+"
-LICENSE:${PN}-doc = "GPLv3+"
+LICENSE = "GPL-3.0-or-later & (GPL-2.0-or-later | LGPLv3+)"
+LICENSE:${PN} = "GPL-2.0-or-later | LGPL-3.0-or-later"
+LICENSE:${PN}-doc = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fd541d83f75d038c4e0617b672ed8bda \
                     file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.GPLv3;md5=2f31b266d3440dd7ee50f92cf67d8e6c \
diff --git a/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb b/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb
index 494ccd2ee9c..9c99af7c912 100644
--- a/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb
+++ b/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "A small C library that is supposed to make it easy to run an HTTP server as part of another application"
 HOMEPAGE = "http://www.gnu.org/software/libmicrohttpd/"
-LICENSE = "LGPL-2.1+"
+LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=57d09285feac8a64efa878e692b14f36"
 SECTION = "net"
 
diff --git a/meta/recipes-support/libmpc/libmpc.inc b/meta/recipes-support/libmpc/libmpc.inc
index b3742543df1..bc564d4dca8 100644
--- a/meta/recipes-support/libmpc/libmpc.inc
+++ b/meta/recipes-support/libmpc/libmpc.inc
@@ -1,7 +1,7 @@
 SUMMARY = "C library for complex number arithmetic with arbitrary precision and correct rounding"
 DESCRIPTION = "Mpc is a C library for the arithmetic of complex numbers with arbitrarily high precision and correct rounding of the result. It is built upon and follows the same principles as Mpfr"
 HOMEPAGE = "http://www.multiprecision.org/"
-LICENSE = "LGPLv3"
+LICENSE = "LGPL-3.0-only"
 SECTION = "libs"
 
 inherit autotools texinfo
diff --git a/meta/recipes-support/libnl/libnl_3.5.0.bb b/meta/recipes-support/libnl/libnl_3.5.0.bb
index 7480202f13b..41d7a9aed84 100644
--- a/meta/recipes-support/libnl/libnl_3.5.0.bb
+++ b/meta/recipes-support/libnl/libnl_3.5.0.bb
@@ -9,7 +9,7 @@ SECTION = "libs/network"
 
 PE = "1"
 
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS = "flex-native bison-native"
diff --git a/meta/recipes-support/libproxy/libproxy_0.4.17.bb b/meta/recipes-support/libproxy/libproxy_0.4.17.bb
index 7e97d363398..e121681ae81 100644
--- a/meta/recipes-support/libproxy/libproxy_0.4.17.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.4.17.bb
@@ -6,7 +6,7 @@ desktop settings)."
 HOMEPAGE = "https://github.com/libproxy/libproxy"
 BUGTRACKER = "https://github.com/libproxy/libproxy/issues"
 SECTION = "libs"
-LICENSE = "LGPLv2.1+"
+LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://utils/proxy.c;beginline=1;endline=18;md5=55152a1006d7dafbef32baf9c30a99c0"
 
diff --git a/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb b/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb
index e2a5e4ded74..e6260a77545 100644
--- a/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb
+++ b/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb
@@ -2,7 +2,7 @@ SUMMARY = "interface to seccomp filtering mechanism"
 DESCRIPTION = "The libseccomp library provides and easy to use, platform independent,interface to the Linux Kernel's syscall filtering mechanism: seccomp."
 HOMEPAGE = "https://github.com/seccomp/libseccomp"
 SECTION = "security"
-LICENSE = "LGPL-2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;beginline=0;endline=1;md5=8eac08d22113880357ceb8e7c37f989f"
 
 DEPENDS += "gperf-native"
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
index 9b3a57dab0f..6ff393c9a35 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
@@ -4,7 +4,7 @@ and the glib main loop, to integrate well with GNOME applications."
 HOMEPAGE = "https://wiki.gnome.org/Projects/libsoup"
 BUGTRACKER = "https://bugzilla.gnome.org/"
 SECTION = "x11/gnome/libs"
-LICENSE = "LGPLv2"
+LICENSE = "LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
 DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl"
diff --git a/meta/recipes-support/libsoup/libsoup_3.0.4.bb b/meta/recipes-support/libsoup/libsoup_3.0.4.bb
index ad35e0cdb9c..775ab29ddd2 100644
--- a/meta/recipes-support/libsoup/libsoup_3.0.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.0.4.bb
@@ -4,7 +4,7 @@ and the glib main loop, to integrate well with GNOME applications."
 HOMEPAGE = "https://wiki.gnome.org/Projects/libsoup"
 BUGTRACKER = "https://bugzilla.gnome.org/"
 SECTION = "x11/gnome/libs"
-LICENSE = "LGPLv2"
+LICENSE = "LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
 DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl nghttp2"
diff --git a/meta/recipes-support/libunistring/libunistring_1.0.bb b/meta/recipes-support/libunistring/libunistring_1.0.bb
index 31c84cb7905..b6f5100ae85 100644
--- a/meta/recipes-support/libunistring/libunistring_1.0.bb
+++ b/meta/recipes-support/libunistring/libunistring_1.0.bb
@@ -13,7 +13,7 @@ DESCRIPTION = "Text files are nowadays usually encoded in Unicode, and may\
 
 HOMEPAGE = "http://www.gnu.org/software/libunistring/"
 SECTION = "devel"
-LICENSE = "LGPLv3+ | GPLv2+"
+LICENSE = "LGPL-3.0-or-later | GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
                     file://README;beginline=45;endline=65;md5=3a896a943b4da2c551e6be1af27eff8d \
                     file://doc/libunistring.texi;md5=266e4297d7c18f197be3d9622ba99685 \
diff --git a/meta/recipes-support/liburcu/liburcu_0.13.1.bb b/meta/recipes-support/liburcu/liburcu_0.13.1.bb
index 7e53e1cf7b0..66763349d2c 100644
--- a/meta/recipes-support/liburcu/liburcu_0.13.1.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.13.1.bb
@@ -5,7 +5,7 @@ with the number of cores. "
 HOMEPAGE = "http://lttng.org/urcu"
 BUGTRACKER = "http://lttng.org/project/issues"
 
-LICENSE = "LGPLv2.1+ & MIT-style"
+LICENSE = "LGPL-2.1-or-later & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e548d28737289d75a8f1e01ba2fd7825 \
                     file://include/urcu/urcu.h;beginline=4;endline=32;md5=4de0d68d3a997643715036d2209ae1d9 \
                     file://include/urcu/uatomic/x86.h;beginline=4;endline=21;md5=58e50bbd8a2f073bb5500e6554af0d0b"
diff --git a/meta/recipes-support/libusb/libusb1_1.0.25.bb b/meta/recipes-support/libusb/libusb1_1.0.25.bb
index ca812b018e8..64cc19e47d8 100644
--- a/meta/recipes-support/libusb/libusb1_1.0.25.bb
+++ b/meta/recipes-support/libusb/libusb1_1.0.25.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://libusb.info"
 BUGTRACKER = "http://www.libusb.org/report"
 SECTION = "libs"
 
-LICENSE = "LGPLv2.1+"
+LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/lz4/lz4_1.9.3.bb b/meta/recipes-support/lz4/lz4_1.9.3.bb
index d8e7f1c6113..129a86b6811 100644
--- a/meta/recipes-support/lz4/lz4_1.9.3.bb
+++ b/meta/recipes-support/lz4/lz4_1.9.3.bb
@@ -2,7 +2,7 @@ SUMMARY = "Extremely Fast Compression algorithm"
 DESCRIPTION = "LZ4 is a very fast lossless compression algorithm, providing compression speed at 400 MB/s per core, scalable with multi-cores CPU. It also features an extremely fast decoder, with speed in multiple GB/s per core, typically reaching RAM speed limits on multi-core systems."
 HOMEPAGE = "https://github.com/lz4/lz4"
 
-LICENSE = "BSD-2-Clause | GPL-2.0"
+LICENSE = "BSD-2-Clause | GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://lib/LICENSE;md5=ebc2ea4814a64de7708f1571904b32cc \
                     file://programs/COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://LICENSE;md5=d57c0d21cb917fb4e0af2454aa48b956 \
diff --git a/meta/recipes-support/lzo/lzo_2.10.bb b/meta/recipes-support/lzo/lzo_2.10.bb
index f0c8631aea2..195c2f29393 100644
--- a/meta/recipes-support/lzo/lzo_2.10.bb
+++ b/meta/recipes-support/lzo/lzo_2.10.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "A portable lossless data compression library written in \
 ANSI C that offers pretty fast compression and *extremely* fast decompression. "
 HOMEPAGE = "http://www.oberhumer.com/opensource/lzo/"
 SECTION = "libs"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://src/lzo_init.c;beginline=5;endline=25;md5=9ae697ca01829b0a383c5d2d163e0108"
 
diff --git a/meta/recipes-support/lzop/lzop_1.04.bb b/meta/recipes-support/lzop/lzop_1.04.bb
index 8ac7efbbfd8..d9b3524b678 100644
--- a/meta/recipes-support/lzop/lzop_1.04.bb
+++ b/meta/recipes-support/lzop/lzop_1.04.bb
@@ -8,7 +8,7 @@ to gzip."
 HOMEPAGE = "http://www.lzop.org/"
 DEPENDS += "lzo"
 
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://src/lzop.c;beginline=5;endline=21;md5=23d767de7754eb24b9e900b025cf7fc8"
 
diff --git a/meta/recipes-support/mpfr/mpfr_4.1.0.bb b/meta/recipes-support/mpfr/mpfr_4.1.0.bb
index 41897e9376f..2121dad57cb 100644
--- a/meta/recipes-support/mpfr/mpfr_4.1.0.bb
+++ b/meta/recipes-support/mpfr/mpfr_4.1.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "C library for multiple-precision floating-point computations with exact rounding"
 DESCRIPTION = "The GNU Multiple Precision Floating-Point Reliable Library (GNU MPFR) is a GNU portable C library for arbitrary-precision binary floating-point computation with correct rounding, based on GNU Multi-Precision Library. MPFR's computation is both efficient and has a well-defined semantics: the functions are completely specified on all the possible operands and the results do not depend on the platform."
 HOMEPAGE = "https://www.mpfr.org/"
-LICENSE = "LGPLv3+"
+LICENSE = "LGPL-3.0-or-later"
 SECTION = "devel"
 
 inherit autotools texinfo
diff --git a/meta/recipes-support/nettle/nettle_3.7.3.bb b/meta/recipes-support/nettle/nettle_3.7.3.bb
index 877f5f169fb..889dc746670 100644
--- a/meta/recipes-support/nettle/nettle_3.7.3.bb
+++ b/meta/recipes-support/nettle/nettle_3.7.3.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "It tries to solve a problem of providing a common set of \
 cryptographic algorithms for higher-level applications by implementing a \
 context-independent set of cryptographic algorithms"
 SECTION = "libs"
-LICENSE = "LGPLv3+ | GPLv2+"
+LICENSE = "LGPL-3.0-or-later | GPL-2.0-or-later"
 
 LIC_FILES_CHKSUM = "file://COPYING.LESSERv3;md5=6a6a8e020838b23406c81b19c1d46df6 \
                     file://COPYINGv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
diff --git a/meta/recipes-support/npth/npth_1.6.bb b/meta/recipes-support/npth/npth_1.6.bb
index 8c94cc22c1d..ef863d39b0c 100644
--- a/meta/recipes-support/npth/npth_1.6.bb
+++ b/meta/recipes-support/npth/npth_1.6.bb
@@ -2,7 +2,7 @@ SUMMARY = "New GNU Portable Threads library"
 DESCRIPTION = "nPth is a library to provide the GNU Pth API and thus a non-preemptive threads implementation. "
 HOMEPAGE = "https://www.gnu.org/software/pth/"
 SECTION = "libs"
-LICENSE = "LGPLv2+"
+LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "\
     file://COPYING.LIB;md5=2caced0b25dfefd4c601d92bd15116de\
     "
diff --git a/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb b/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
index 969e20e2835..742e77eb18e 100644
--- a/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
+++ b/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "plugin for the GNU Name Service Switch (NSS) functionality of \
 the GNU C Library (glibc) providing host name resolution for the locally \
 configured system hostname as returned by gethostname(2)."
 HOMEPAGE = "http://0pointer.de/lennart/projects/nss-myhostname/"
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 SRC_URI = "http://0pointer.de/lennart/projects/nss-myhostname/nss-myhostname-${PV}.tar.gz \
diff --git a/meta/recipes-support/numactl/numactl_git.bb b/meta/recipes-support/numactl/numactl_git.bb
index 19f2293a513..93547ea2396 100644
--- a/meta/recipes-support/numactl/numactl_git.bb
+++ b/meta/recipes-support/numactl/numactl_git.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://oss.sgi.com/projects/libnuma/"
 DESCRIPTION = "Simple NUMA policy support. It consists of a numactl program \
 to run other programs with a specific NUMA policy and a libnuma to do \
 allocations with NUMA policy in applications."
-LICENSE = "GPL-2.0 & LGPL-2.1"
+LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 SECTION = "apps"
 
 inherit autotools-brokensep ptest
diff --git a/meta/recipes-support/pinentry/pinentry_1.2.0.bb b/meta/recipes-support/pinentry/pinentry_1.2.0.bb
index 504ba3b5ccf..169cac89656 100644
--- a/meta/recipes-support/pinentry/pinentry_1.2.0.bb
+++ b/meta/recipes-support/pinentry/pinentry_1.2.0.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "\
 	http://www.gnupg.org/aegypten/ for details."
 
 HOMEPAGE = "http://www.gnupg.org/related_software/pinentry/index.en.html"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cbbd794e2a0a289b9dfcc9f513d1996e"
 
 DEPENDS = "gettext-native libassuan libgpg-error"
diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
index 72922d84535..5a1d3299930 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
@@ -4,7 +4,7 @@ program which loops through all installed ptest test suites and \
 runs them in sequence."
 HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
 
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
 SRCREV = "bcb82804daa8f725b6add259dcef2067e61a75aa"
diff --git a/meta/recipes-support/rng-tools/rng-tools_6.15.bb b/meta/recipes-support/rng-tools/rng-tools_6.15.bb
index c4d616e29bb..ae974f9f6f4 100644
--- a/meta/recipes-support/rng-tools/rng-tools_6.15.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_6.15.bb
@@ -4,7 +4,7 @@ AUTHOR = "Philipp Rumpf, Jeff Garzik <jgarzik@pobox.com>, \
           Henrique de Moraes Holschuh <hmh@debian.org>"
 HOMEPAGE = "https://github.com/nhorman/rng-tools"
 BUGTRACKER = "https://github.com/nhorman/rng-tools/issues"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "sysfsutils openssl"
 
diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
index 69f147ebce9..6179abfef7e 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "The shared-mime-info package contains the core database of common
 HOMEPAGE = "http://freedesktop.org/wiki/Software/shared-mime-info"
 SECTION = "base"
 
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "libxml2 itstool-native glib-2.0 shared-mime-info-native xmlto-native"
diff --git a/meta/recipes-support/taglib/taglib_1.12.bb b/meta/recipes-support/taglib/taglib_1.12.bb
index 2b0961818a2..47ad8aacb6f 100644
--- a/meta/recipes-support/taglib/taglib_1.12.bb
+++ b/meta/recipes-support/taglib/taglib_1.12.bb
@@ -2,7 +2,7 @@ SUMMARY = "Library for reading and editing the meta-data of popular audio format
 DESCRIPTION = "Platform-independent library (tested on Windows/Linux) for reading and writing metadata in media files, including video, audio, and photo formats. This is a convenient one-stop-shop to present or tag all your media collection, regardless of which format/container these might use. You can read/write the standard or more common tags/properties of a media, or you can also create and retrieve your own custom tags."
 SECTION = "libs/multimedia"
 HOMEPAGE = "http://taglib.github.io/"
-LICENSE = "LGPLv2.1 | MPL-1.1"
+LICENSE = "LGPL-2.1-only | MPL-1.1"
 LIC_FILES_CHKSUM = "file://COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c \
                     file://COPYING.MPL;md5=bfe1f75d606912a4111c90743d6c7325 \
                     file://taglib/audioproperties.h;beginline=1;endline=24;md5=9df2c7399519b7310568a7c55042ecee"
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 2b45e935c33..f9b6cd60d0f 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -9,7 +9,7 @@ DEPENDS = "ncurses gettext-native"
 # vimdiff doesn't like busybox diff
 RSUGGESTS:${PN} = "diffutils"
 
-LICENSE = "vim"
+LICENSE = "Vim"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6b30ea4fa660c483b619924bc709ef99 \
                     file://runtime/doc/uganda.txt;md5=600a38dc53e8931fdfb1238276ee09b0"
 
diff --git a/meta/recipes-support/vte/vte_0.66.2.bb b/meta/recipes-support/vte/vte_0.66.2.bb
index 86674cc9394..af1c47cf80b 100644
--- a/meta/recipes-support/vte/vte_0.66.2.bb
+++ b/meta/recipes-support/vte/vte_0.66.2.bb
@@ -2,8 +2,8 @@ SUMMARY = "Virtual terminal emulator GTK+ widget library"
 DESCRIPTION = "VTE provides a virtual terminal widget for GTK applications."
 HOMEPAGE = "https://wiki.gnome.org/Apps/Terminal/VTE"
 BUGTRACKER = "https://bugzilla.gnome.org/buglist.cgi?product=vte"
-LICENSE = "GPLv3 & LGPLv3+ & MIT-X"
-LICENSE:libvte = "LGPLv3+"
+LICENSE = "GPL-3.0-only & LGPL-3.0-or-later & MIT"
+LICENSE:libvte = "LGPL-3.0-or-later"
 
 LIC_FILES_CHKSUM = " \
     file://COPYING.GPL3;md5=cc702cf3444d1f19680c794cc61948f9 \
diff --git a/meta/recipes-support/xxhash/xxhash_0.8.1.bb b/meta/recipes-support/xxhash/xxhash_0.8.1.bb
index ec559a8759b..b3b97025987 100644
--- a/meta/recipes-support/xxhash/xxhash_0.8.1.bb
+++ b/meta/recipes-support/xxhash/xxhash_0.8.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "Extremely fast non-cryptographic hash algorithm"
 DESCRIPTION = "xxHash is an extremely fast non-cryptographic hash algorithm, \
 working at speeds close to RAM limits."
 HOMEPAGE = "http://www.xxhash.com/"
-LICENSE = "BSD-2-Clause & GPL-2.0"
+LICENSE = "BSD-2-Clause & GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=cdfe7764d5685d8e08b3df302885d7f3 \
                     file://cli/COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                    "
-- 
2.32.0

