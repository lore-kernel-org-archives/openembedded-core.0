Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QKkcx-0001t9-Md
	for openembedded-core@lists.openembedded.org;
	Fri, 13 May 2011 07:09:28 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 12 May 2011 22:06:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,362,1301900400"; 
   d="scan'208";a="1664252"
Received: from unknown (HELO localhost) ([10.255.12.88])
	by fmsmga001.fm.intel.com with ESMTP; 12 May 2011 22:06:37 -0700
Message-Id: <cover.1305263078.git.sgw@linux.intel.com>
Old-Date: Thu, 12 May 2011 22:04:38 -0700
Date: Thu, 12 May 2011 22:06:37 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Ilya Yanok <yanok@emcraft.com>, Jingdong Lu <jingdong.lu@windriver.com>
Subject: [PATCH 0/8] 13-May Consolidated Pulls
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
X-List-Received-Date: Fri, 13 May 2011 05:09:28 -0000

From: Saul Wold <sgw@linux.intel.com>

Richard,

Here is a set of patch upstream status updates along with some
GCC 4.6 fixes and a kern-tools SRCREV tweak from Bruce.



Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: sgw/stage
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Thanks,
    Saul Wold <sgw@linux.intel.com>
---


Bruce Ashfield (1):
  kern-tools: error if features are not found

Dexuan Cui (1):
  recpies: add Upstream-Status for multiple recipes' patches

Dongxiao Xu (1):
  recipes: add Upstream-Status for multiple recipes

Ilya Yanok (1):
  qt4-tools-nativesdk: -arch is required for nativesdk build

Jingdong Lu (1):
  bash: enable update-alternative to use bash as default shell

Nitin A Kamble (1):
  gcc: fix target gcc runtime issue

Yu Ke (1):
  recipes: Add Upstream-Status for multiple recipes

Zhai Edwin (1):
  recipes: Add Upstream-Status to multiple recipes

 .../libetpan/files/cxx-is-here.patch               |    2 +
 .../opensync/libopensync-0.37/build-in-src.patch   |    2 +
 .../opensync/libopensync-0.37/cmake.patch          |    2 +
 .../libopensync-0.37/no-python-check.patch         |    2 +
 .../libopensync-plugin-evolution2/0.37-fixes.patch |    2 +
 .../libopensync-plugin-syncml/fixerror.patch       |    2 +
 .../opensync/libsyncml/build-in-src.patch          |    2 +
 .../telepathy/empathy/no-gnome-doc.patch           |    2 +
 .../gnome/gnome-settings-daemon/configurefix.patch |    2 +
 .../gnome-settings-daemon/desktop-moblin.patch     |    2 +
 ...-settings-daemon-2.24.0-catch-deviceadded.patch |    2 +
 .../gnome-settings-daemon-fix-gthread.patch        |    2 +
 .../gnome-settings-daemon/mojito-cleanup.patch     |    2 +
 .../gnome/gnome-settings-daemon/mount-plugin.patch |    2 +
 .../30f29e7d8e1b67c40cd18a7155ba30c4382692d5.patch |    2 +
 .../recipes-gnome/wv/wv-1.2.0/pkgconfig.patch      |    2 +
 .../recipes-graphics/clutter/table/fixes.patch     |    2 +
 .../recipes-graphics/clutter/tidy/autofoo.patch    |    2 +
 .../clutter/tidy/tidy-enable-tests.patch           |    2 +
 .../libxklavier/libxklavier/pkgconfigfix.patch     |    2 +
 .../recipes-graphics/xorg-app/xev/diet-x11.patch   |    2 +
 .../xorg-lib/liblbxutil/mkg3states.patch           |    2 +
 .../recipes-graphics/xournal/files/ldflags.patch   |    2 +
 .../xournal/files/no-printing.diff                 |    2 +
 .../recipes-sato/claws-mail/files/desktop.patch    |    2 +
 .../recipes-sato/claws-mail/files/fix-build.patch  |    2 +
 .../claws-mail/files/owl-window-menu.patch         |    2 +
 .../claws-mail/files/streamline-ui.patch           |    2 +
 .../clipboard-manager/files/daemonize.patch        |    2 +
 .../clipboard-manager/files/makefile.patch         |    2 +
 .../clipboard-manager/files/script.patch           |    2 +
 .../recipes-sato/epdfview/epdfview/owl-menus.patch |    2 +
 .../recipes-sato/kf/files/fix-configure.patch      |    2 +
 .../recipes-sato/kf/files/fix-desktop-file.patch   |    2 +
 meta-demoapps/recipes-sato/kf/files/gcc4.patch     |    2 +
 .../eee-acpi-scripts/files/powerbtn.patch          |    2 +
 .../eee-acpi-scripts/files/remove-doc-check.patch  |    2 +
 meta/recipes-bsp/hostap/files/hostap-fw-load.patch |    2 +
 .../lrzsz/lrzsz-0.12.20/autotools.patch            |    2 +
 meta/recipes-bsp/lrzsz/lrzsz-0.12.20/gettext.patch |    2 +
 .../recipes-bsp/lrzsz/lrzsz-0.12.20/makefile.patch |    2 +
 .../bluez/bluez-dtl1-workaround/COPYING.patch      |    2 +
 .../fix-dfutool-usb-declaration-mismatch.patch     |    1 +
 .../bluez/bluez4-4.82/hid2hci_usb_init.patch       |    2 +
 .../bluez/bluez4-4.82/sbc-thumb.patch              |    1 +
 .../galago/libgalago-0.5.2/mkdir.patch             |    2 +
 .../galago/libgalago-0.5.2/pkgconfig.patch         |    2 +
 .../gsm/files/0001-Introduce-ports.patch           |    2 +
 ...ending-commands-before-restarting-the-mod.patch |    2 +
 ...-segment-incoming-usock-data-into-packets.patch |    2 +
 .../0004-Handle-read-and-write-return-values.patch |    2 +
 .../gsm/files/0005-Add-ask-ds-option-forSMS.patch  |    2 +
 .../gsm/files/024_sms-text-in-bracket.patch        |    2 +
 .../gsm/files/025_sms-status-report.patch          |    2 +
 ...027_phonebook-find-and-read-range-support.patch |    2 +
 ...ell-phonebook-find-and-read-range-support.patch |    2 +
 .../gsm/files/fix_machine_init.patch               |    2 +
 .../gsm/files/install-ts-headers.patch             |    2 +
 .../gsm/files/lgsm_send_fix_return_value.patch     |    2 +
 meta/recipes-connectivity/gypsy/files/fixups.patch |    2 +
 .../libpcap/libpcap-1.1.1/aclocal.patch            |    2 +
 .../libpcap/libpcap-1.1.1/ieee80215-arphrd.patch   |    2 +
 .../ppp/ppp-2.4.5/cifdefroute.patch                |    2 +
 .../ppp/ppp-2.4.5/enable-ipv6.patch                |    2 +
 .../makefile-remove-hard-usr-reference.patch       |    2 +
 .../ppp/ppp-2.4.5/makefile.patch                   |    2 +
 .../ppp/ppp-2.4.5/pppd-resolv-varrun.patch         |    2 +
 .../telepathy/libtelepathy/doublefix.patch         |    2 +
 .../telepathy/libtelepathy/prefer_python_2.5.patch |    2 +
 .../telepathy-python-0.15.19/parallel_make.patch   |    2 +
 .../wireless-tools/wireless-tools/man.patch        |    2 +
 .../wpa_supplicant-0.5.7-always-scan.patch         |    2 +
 ...a_supplicant-fix-deprecated-dbus-function.patch |    2 +
 .../zeroconf/zeroconf/compilefix.patch             |    2 +
 .../glibc/glibc-2.10.1/arm-check-pf.patch          |    2 +
 .../glibc/glibc-2.10.1/arm-longlong.patch          |    2 +
 .../arm-lowlevellock-include-tls.patch             |    2 +
 .../glibc/glibc-2.10.1/arm-memcpy.patch            |    2 +
 .../glibc/glibc-2.10.1/dl-cache-libcmp.patch       |    2 +
 .../glibc/glibc-2.10.1/fhs-linux-paths.patch       |    2 +
 .../glibc-arm-IO-acquire-lock-fix.diff             |    2 +
 .../glibc/glibc-2.10.1/glibc-arm-no-asm-page.patch |    2 +
 .../glibc/glibc-2.10.1/glibc-check_pf.patch        |    2 +
 .../glibc/glibc-2.10.1/ldd-unbash.patch            |    2 +
 .../glibc/glibc-2.10.1/ldsocache-varrun.patch      |    2 +
 .../glibc/glibc-2.10.1/local-args6.diff            |    2 +
 .../glibc/glibc-2.10.1/march-i686.patch            |    1 +
 .../glibc/glibc-2.10.1/mips-rld-map-check.patch    |    2 +
 .../glibc/glibc-2.10.1/nptl-crosscompile.patch     |    2 +
 .../glibc/glibc-2.10.1/nscd-init.patch             |    2 +
 .../glibc/glibc-2.10.1/powerpc-sqrt-hack.diff      |    2 +
 .../recipes-core/glibc/glibc-2.10.1/rulesfix.patch |    2 +
 meta/recipes-devtools/dpkg/dpkg/autofoo.patch      |    2 +
 .../dpkg/dpkg/check_snprintf.patch                 |    2 +
 .../recipes-devtools/dpkg/dpkg/check_version.patch |    2 +
 .../dpkg/dpkg/ignore_extra_fields.patch            |    2 +
 meta/recipes-devtools/dpkg/dpkg/nochroot.patch     |    2 +
 meta/recipes-devtools/dpkg/dpkg/noman.patch        |    2 +
 meta/recipes-devtools/dpkg/dpkg/noupdalt.patch     |    2 +
 meta/recipes-devtools/gcc/gcc-4.6.0.inc            |    2 +-
 meta/recipes-devtools/gcc/gcc-package-target.inc   |    1 +
 meta/recipes-devtools/gcc/gcc_4.3.3.bb             |    2 +-
 meta/recipes-devtools/gcc/gcc_4.5.1.bb             |    2 +-
 meta/recipes-devtools/gcc/gcc_csl-arm-2008q1.bb    |    2 +-
 .../makedevs/makedevs-1.0.0/COPYING.patch          |    2 +
 .../opkg-utils/index-ignore-filenotfound.patch     |    2 +
 meta/recipes-devtools/opkg/opkg/add_vercmp.patch   |    2 +
 meta/recipes-devtools/opkg/opkg/headerfix.patch    |    2 +
 .../python/python-pygtk/fix-gtkunixprint.patch     |    2 +
 .../python/python-pygtk/nodocs.patch               |    2 +
 .../prevent_to_get_display_during_import.patch     |    2 +
 ...t-and-use-GCC-atomic-builtins-for-locking.patch |    2 +
 .../qemu/qemu-0.14.0/enable-i386-linux-user.patch  |    2 +
 .../fallback-to-safe-mmap_min_addr.patch           |    2 +
 .../qemu/qemu-0.14.0/fix-configure-checks.patch    |    2 +
 .../qemu/qemu-0.14.0/fix-nogl.patch                |    2 +
 .../qemu/qemu-0.14.0/glflags.patch                 |    2 +
 .../qemu/qemu-0.14.0/init-info.patch               |    2 +
 .../qemu/qemu-0.14.0/larger_default_ram_size.patch |    2 +
 .../qemu/qemu-0.14.0/linker-flags.patch            |    3 +
 .../qemu/qemu-0.14.0/no-strip.patch                |    2 +
 .../qemu/qemu-0.14.0/opengl-sdl-fix.patch          |    2 +
 .../qemu/qemu-0.14.0/qemu-git-qemugl-host.patch    |    2 +
 .../qemu/qemu-0.14.0/qemu-vmware-vga-depth.patch   |    3 +
 .../qemugl-allow-glxcontext-release.patch          |    2 +
 .../qemu/qemu-0.14.0/qemugl-fix.patch              |    2 +
 .../spice-qxl-locking-fix-for-qemu-kvm.patch       |    2 +
 .../tcf-agent/tcf-agent/fix_tcf-agent.init.patch   |    2 +
 .../tcf-agent/tcf-agent/terminals_agent.patch      |    2 +
 meta/recipes-extended/bash/bash.inc                |    2 +-
 meta/recipes-extended/bash/bash_4.1.bb             |    2 +-
 meta/recipes-extended/ed/ed-1.5/ed-1.2-build.patch |    2 +
 .../files/debian/add-icmp-return-codes.diff        |    2 +
 .../iputils/files/debian/fix-arping-timeouts.diff  |    2 +
 .../files/debian/fix-dead-host-ping-stats.diff     |    2 +
 .../iputils/files/debian/targets.diff              |    2 +
 .../iputils/files/debian/use_gethostbyname2.diff   |    2 +
 .../minicom/minicom-2.4/gcc4-scope.patch           |    2 +
 .../minicom-2.4/rename-conflicting-functions.patch |    2 +
 .../mktemp/files/disable-strip.patch               |    2 +
 .../rpcbind/rpcbind/fix_host_path.patch            |    2 +
 .../screen/screen-4.0.3/configure.patch            |    2 +
 .../fix_name_conflict_group_member.patch           |    2 +
 .../which/which-2.20/remove-declaration.patch      |    2 +
 ...vices-from-inetd.conf-if-a-service-with-t.patch |    2 +
 ...arious-fixes-from-the-previous-maintainer.patch |    2 +
 ...uld-be-able-to-listen-on-IPv6-even-in-ine.patch |    2 +
 .../gdk-pixbuf-2.22.1/configure_fix.patch          |    2 +
 .../gdk-pixbuf-2.22.1/hardcoded_libtool.patch      |    2 +
 .../gnome/gnome-common-2.28.0/omf.patch            |    2 +
 .../gnome/gnome-icon-theme/iconpath-option.patch   |    3 +
 .../gnome/gnome-mime-data/pkgconfig.patch          |    2 +
 .../gnome/gnome-vfs-2.24.4/gconftool-lossage.patch |    2 +
 .../gnome-vfs-2.24.4/gnome-vfs-no-kerberos.patch   |    2 +
 .../gnome/libart-lgpl/Makefile.am.patch            |    2 +
 .../gnome/metacity/crosscompile.patch              |    2 +
 .../gtk+/gtk+-2.12.7/cellrenderer-cairo.patch      |    2 +
 .../gtk+/gtk+-2.12.7/combo-arrow-size.patch        |    2 +
 .../gtk+/gtk+-2.12.7/disable-print.patch           |    2 +
 .../gtk+/gtk+-2.12.7/entry-cairo.patch             |    2 +
 .../gtk+/gtk+-2.12.7/filechooser-default.patch     |    2 +
 .../gtk+/gtk+-2.12.7/filechooser-sizefix.patch     |    2 +
 .../gtk+/gtk+-2.12.7/filesystem-volumes.patch      |    2 +
 .../gtk+/gtk+-2.12.7/gtklabel-resize-patch         |    2 +
 .../gtk+/gtk+-2.12.7/hardcoded_libtool.patch       |    2 +
 .../gtk+/gtk+-2.12.7/menu-deactivate.patch         |    2 +
 meta/recipes-gnome/gtk+/gtk+-2.12.7/no-demos.patch |    2 +
 .../gtk+/gtk+-2.12.7/pangoxft2.10.6.diff           |    2 +
 .../gtk+/gtk+-2.12.7/range-no-redraw.patch         |    3 +
 .../gtk+/gtk+-2.12.7/run-iconcache.patch           |    2 +
 .../gtk+/gtk+-2.12.7/scrolled-placement.patch      |    2 +
 .../gtk+/gtk+-2.12.7/toggle-font.diff              |    2 +
 .../recipes-gnome/gtk+/gtk+-2.12.7/xsettings.patch |    2 +
 ...Duplicate-the-exec-string-returned-by-gtk.patch |    2 +
 .../gtk+/gtk+-2.16.6/cellrenderer-cairo.patch      |    2 +
 .../gtk+-2.16.6/disable-gio-png-sniff-test.diff    |    2 +
 .../gtk+/gtk+-2.16.6/entry-cairo.patch             |    2 +
 .../gtk+/gtk+-2.16.6/hardcoded_libtool.patch       |    2 +
 meta/recipes-gnome/gtk+/gtk+-2.16.6/no-demos.patch |    2 +
 .../gtk+/gtk+-2.16.6/run-iconcache.patch           |    2 +
 .../gtk+/gtk+-2.16.6/toggle-font.diff              |    2 +
 .../recipes-gnome/gtk+/gtk+-2.16.6/xsettings.patch |    2 +
 ...Duplicate-the-exec-string-returned-by-gtk.patch |    2 +
 .../gtk+/gtk+-2.22.1/cellrenderer-cairo.patch      |    2 +
 .../gtk+/gtk+-2.22.1/configurefix.patch            |    2 +
 .../recipes-gnome/gtk+/gtk+-2.22.1/doc-fixes.patch |    3 +
 .../gtk+/gtk+-2.22.1/entry-cairo.patch             |    2 +
 .../gtk+/gtk+-2.22.1/hardcoded_libtool.patch       |    2 +
 meta/recipes-gnome/gtk+/gtk+-2.22.1/no-demos.patch |    2 +
 .../gtk+/gtk+-2.22.1/run-iconcache.patch           |    2 +
 .../gtk+/gtk+-2.22.1/toggle-font.diff              |    2 +
 .../recipes-gnome/gtk+/gtk+-2.22.1/xsettings.patch |    2 +
 .../libglade/libglade-2.6.4/glade-cruft.patch      |    2 +
 .../libglade/libglade-2.6.4/no-deprecation.patch   |    2 +
 .../libglade/libglade-2.6.4/no-xml2.patch          |    2 +
 .../librsvg/librsvg-2.32.1/doc_Makefile.patch      |    2 +
 .../clutter/clutter-gst/autofoo-0.4.patch          |    4 +
 ...-9db4a61a25677764bb927369c5c68ada958fb65c.patch |    4 +
 .../clutter/clutter-gst/autofoo.patch              |    4 +
 .../clutter/clutter-gst/enable_tests-1.4.patch     |    3 +
 .../clutter/clutter-gst/enable_tests.patch         |    3 +
 .../clutter/clutter-gtk/disable_deprecated.patch   |    2 +
 .../clutter/clutter-gtk/enable_tests.patch         |    2 +
 .../clutter/clutter/build-fix.patch                |    2 +
 .../clutter/clutter/enable_tests-0.6.patch         |    2 +
 .../clutter/clutter/enable_tests-0.8.patch         |    2 +
 .../clutter/clutter/enable_tests-1.0.patch         |    2 +
 .../clutter/clutter/enable_tests-1.4.patch         |    2 +
 ...-654c26a1301c9bc5f8e3e5e3b68af5eb1b2e0673.patch |    2 +
 .../clutter/clutter/enable_tests.patch             |    2 +
 .../clutter/clutter/symconflict.patch              |    2 +
 .../clutter/clutter/test-conformance-fix.patch     |    2 +
 .../drm/libdrm-2.4.25/installtests.patch           |    2 +-
 .../fontconfig-2.8.0/fix-pkgconfig.patch           |    2 +
 .../freetype/freetype-2.4.4/no-hardcode.patch      |    2 +
 .../libmatchbox/files/16bppfixes-2.patch           |    2 +
 .../libmatchbox/files/16bppfixes.patch             |    2 +
 .../libmatchbox/files/autofoo.patch                |    2 +
 .../libmatchbox/files/configure_fixes.patch        |    2 +
 .../libmatchbox/files/fix-configure-for-1.9.patch  |    2 +
 .../libmatchbox/files/matchbox-start-fix.patch     |    2 +
 .../libxsettings-client/disable_Os_option.patch    |    2 +
 .../libxsettings-client/link-x11.patch             |    2 +
 .../matchbox-wm/matchbox-wm/configure_fix.patch    |    2 +
 .../mesa/qemugl/remove-x11r6-lib-dir.patch         |    2 +
 meta/recipes-graphics/mesa/qemugl/versionfix.patch |    2 +
 .../mutter/mutter/crosscompile.patch               |    2 +
 ...-7adb574bb3fa3880eb85dbc86e580cf3452d57c4.patch |    2 +
 .../mutter/mutter/fix_pkgconfig.patch              |    2 +
 meta/recipes-graphics/mutter/mutter/nodocs.patch   |    2 +
 meta/recipes-graphics/mutter/mutter/nozenity.patch |    2 +
 .../tslib/tslib/32bitBE-support.patch              |    3 +
 .../recipes-graphics/tslib/tslib/fix_version.patch |    2 +
 meta/recipes-graphics/tslib/tslib/multievent.patch |    2 +
 .../x11-common/x11-common/gplv2-license.patch      |    2 +
 .../xserver-nodm-init/gplv2-license.patch          |    2 +
 .../recipes-graphics/x11vnc/files/endian-fix.patch |    2 +
 .../x11vnc/files/starting-fix.patch                |    3 +
 .../xcb/libxcb/xcbincludedir.patch                 |    2 +
 .../fix_watch_cursor.patch                         |    2 +
 .../use-relative-symlinks.patch                    |    2 +
 .../xorg-app/xdpyinfo/disable-xkb.patch            |    2 +
 .../xorg-app/xset/disable-xkb.patch                |    2 +
 .../xf86-video-omapfb/omap-blacklist-tv-out.patch  |    4 +-
 .../xf86-video-omapfb/omap-force-plain-mode.patch  |    2 +
 .../omap-revert-set-CRTC-limit.patch               |    2 +
 .../omap-revert-set-virtual-size.patch             |    2 +
 .../xorg-driver/xf86-video-omapfb/omapfb-neon.diff |    2 +
 .../xorg-lib/libx11-1.3.4/include_fix.patch        |    2 +
 .../xorg-lib/libx11-1.3.4/nodolt.patch             |    2 +
 .../libx11-1.3.4/x11_disable_makekeys.patch        |    2 +
 .../xorg-lib/libx11-git/X18NCMSstubs.diff          |    2 +
 .../xorg-lib/libx11-git/fix-disable-xlocale.diff   |    2 +
 .../libx11-git/fix-utf8-wrong-define.patch         |    1 +
 .../xorg-lib/libx11-git/include_fix.patch          |    2 +
 .../xorg-lib/libx11-git/nodolt.patch               |    2 +
 .../xorg-lib/libx11-git/x11_disable_makekeys.patch |    2 +
 .../recipes-graphics/xorg-lib/libx11-git/xim.patch |   55 -----
 .../xorg-lib/libx11-trim/include_fix.patch         |    2 +
 .../xorg-lib/libx11-trim/nodolt.patch              |    2 +
 .../libx11-trim/x11_disable_makekeys.patch         |    2 +
 .../xorg-lib/libx11/X18NCMSstubs.diff              |    2 +
 .../xorg-lib/libx11/fix-disable-xlocale.diff       |    2 +
 .../xorg-lib/libx11/fix-utf8-wrong-define.patch    |    1 +
 .../xorg-lib/libx11/include_fix.patch              |    2 +
 meta/recipes-graphics/xorg-lib/libx11/nodolt.patch |    2 +
 .../xorg-lib/libx11/x11_disable_makekeys.patch     |    2 +
 meta/recipes-graphics/xorg-lib/libx11/xim.patch    |   55 -----
 .../xorg-lib/libxcalibrate/fix-xcb.patch           |    2 +
 .../libxcomposite/change-include-order.patch       |    2 +
 .../xorg-lib/libxfont/no-scalable-crash.patch      |    2 +
 .../xorg-lib/xtrans/abstract_socket_fix.patch      |   58 -----
 .../xorg-proto/calibrateproto/fix.patch            |    2 +
 .../xtscal/xtscal/change-cross.patch               |    2 +
 meta/recipes-graphics/xtscal/xtscal/cleanup.patch  |    2 +
 .../xtscal/dso_linking_change_build_fix.patch      |    2 +
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 .../latencytop-0.5/latencytop-makefile.patch       |    2 +
 .../recipes-kernel/oprofile/oprofile/opstart.patch |    2 +
 .../oprofile/oprofile/xml_callgraph_details.patch  |  232 --------------------
 .../stub_out_the_ncurses_calls_in_dump_mode.patch  |    2 +
 .../flac/flac-1.2.1/disable-xmms-plugin.patch      |    1 +
 .../flac/flac-1.2.1/flac-gcc43-fixes.patch         |    1 +
 .../gstreamer/gst-ffmpeg-0.10.11/lower-rank.diff   |    2 +
 .../liba52/liba52/buildcleanup.patch               |    2 +
 .../libid3tag/libid3tag/addpkgconfig.patch         |    2 +
 .../fix_build_issue_for_gcc_4.5.0.patch            |    2 +
 .../pulseaudio/pulseaudio-0.9.22/armv4+v5asm.patch |    2 +
 .../pulseaudio-0.9.22/autoconf_version.patch       |    2 +
 .../pulseaudio/pulseaudio-0.9.22/buildfix.patch    |    2 +
 .../pulseaudio-0.9.22/configure_silent_rules.patch |    2 +
 .../pulseaudio-0.9.22/gcc4-compile-fix.patch       |    2 +
 .../pulseaudio/pulseaudio-0.9.22/tls_m4.patch      |    2 +
 meta/recipes-qt/qt4/qt4-tools-nativesdk.inc        |    3 +
 .../eds/eds-dbus-2.20.0/no_iconv_test.patch        |    2 +
 .../eds/eds-dbus-2.20.0/oh-contact.patch           |    2 +
 .../eds/eds-dbus/new-contact-fix.patch             |    2 +
 meta/recipes-sato/eds/eds-dbus/nossl.patch         |    2 +
 meta/recipes-sato/eds/eds-dbus/oh-contact.patch    |    2 +
 meta/recipes-sato/eds/eds-dbus/old-gdk-api.patch   |    2 +
 .../eds/eds-dbus/optional_imapx_provider.patch     |    2 +
 meta/recipes-sato/eds/eds-dbus/parallelmake.patch  |    2 +
 meta/recipes-sato/leafpad/files/owl-menu.patch     |    2 +
 .../matchbox-config-gtk/files/no-handed.patch      |    2 +
 .../files/dso_linking_change_build_fix.patch       |    2 +
 .../matchbox-desktop/files/window-resize-fix.patch |    2 +
 .../matchbox-keyboard/files/configure_fix.patch    |    2 +
 .../matchbox-keyboard/files/single-instance.patch  |    1 +
 .../matchbox-panel-2/gcc-4.6.0-compile.patch       |    2 +
 .../recipes-sato/matchbox-panel-2/startup_fix.diff |    2 +
 .../matchbox-stroke/files/configure_fix.patch      |    2 +
 .../files/dso_linking_change_build_fix.patch       |    1 +
 .../matchbox-stroke/files/single-instance.patch    |    1 +
 .../matchbox-theme-sato-2/png_rename.patch         |    2 +
 .../libowl-av/gst_change_state.patch               |    2 +
 .../owl-video-widget/libowl-av/make-382.patch      |    2 +
 .../owl-video/gtk_multithread_safe.patch           |    2 +
 .../owl-video-widget/owl-video/make-382.patch      |    2 +
 .../pcmanfm/files/cross-compile-fix.patch          |    2 +
 .../pcmanfm/files/owl-window-menu.patch            |    2 +
 .../contacts/contacts-owl-window-menu.patch        |    2 +
 meta/recipes-sato/pimlico/contacts/make-382.patch  |    2 +
 .../pimlico/dates/dates-owl-window-menu.patch      |    2 +
 .../dates/dso_linking_change_build_fix.patch       |    2 +
 meta/recipes-sato/pimlico/dates/make-382.patch     |    2 +
 .../sato-icon-theme/iconpath-option.patch          |    2 +
 .../settings-daemon/files/addsoundkeys.patch       |    2 +
 .../files/dso_linking_change_build_fix.patch       |    2 +
 .../web/web-webkit/link-with-g++.patch             |    3 +
 meta/recipes-sato/web/web-webkit/make-382.patch    |    2 +
 meta/recipes-sato/web/web/owl-window-menu.patch    |    2 +
 meta/recipes-sato/webkit/files/nodolt.patch        |    3 +
 meta/recipes-support/apr/apr-util/configfix.patch  |    2 +
 .../apr/apr-util/configure_fixes.patch             |    2 +
 .../apr/apr-util/configure_fixes.patch.old         |   25 --
 meta/recipes-support/apr/apr/buildconf_fix.patch   |    2 +
 meta/recipes-support/apr/apr/cleanup.patch         |    2 +
 meta/recipes-support/apr/apr/configfix.patch       |    2 +
 meta/recipes-support/apr/apr/configure_fixes.patch |    2 +
 .../beecrypt/beecrypt/disable-icu-check.patch      |    2 +
 .../beecrypt/beecrypt/fix-security.patch           |    3 +
 .../db/db/arm-thumb-mutex_db5.patch                |    2 +
 .../gpgme/gpgme-1.3.0/disable_gpgconf_check.patch  |    1 +
 meta/recipes-support/libcroco/files/croco.patch    |    2 +
 .../liboil-0.3.17/fix-unaligned-whitelist.patch    |    2 +
 .../liboil/liboil-0.3.17/no-tests.patch            |    2 +
 .../libxslt/libxslt/pkgconfig_fix.patch            |    2 +
 .../neon/neon-0.29.5/pkgconfig.patch               |    2 +
 .../taglib/taglib-1.6.3/configuretweak.patch       |    2 +
 .../taglib/taglib-1.6.3/nolibtool.patch            |    2 +
 350 files changed, 690 insertions(+), 434 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-git/xim.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11/xim.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/xtrans/abstract_socket_fix.patch
 delete mode 100644 meta/recipes-kernel/oprofile/oprofile/xml_callgraph_details.patch
 delete mode 100644 meta/recipes-sato/webkit/files/fix_im.patch
 delete mode 100644 meta/recipes-support/apr/apr-util/configure_fixes.patch.old



