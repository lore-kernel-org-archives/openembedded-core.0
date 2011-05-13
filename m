Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1QKkQi-0001Ot-6Y
	for openembedded-core@lists.openembedded.org;
	Fri, 13 May 2011 06:56:49 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 12 May 2011 21:53:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,362,1301900400"; d="scan'208";a="642116274"
Received: from unknown (HELO [10.255.12.88]) ([10.255.12.88])
	by orsmga002.jf.intel.com with ESMTP; 12 May 2011 21:53:55 -0700
Message-ID: <4DCCB962.9070902@intel.com>
Date: Thu, 12 May 2011 21:53:54 -0700
From: Saul Wold <saul.wold@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Lightning/1.0b2pre
	Thunderbird/3.0.5
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1305197864.git.edwin.zhai@intel.com>
	<BANLkTikG1B2hvK+T5nKfXnDe43h3Dx43Cg@mail.gmail.com>
In-Reply-To: <BANLkTikG1B2hvK+T5nKfXnDe43h3Dx43Cg@mail.gmail.com>
Subject: Re: [PATCH 00/54] Update patch Upstream-Status, Edwin, May12, 2011
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
X-List-Received-Date: Fri, 13 May 2011 04:56:49 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/12/2011 08:47 PM, Khem Raj wrote:
> On Thu, May 12, 2011 at 4:00 AM, Zhai Edwin<edwin.zhai@intel.com>  wrote:
>> From: Zhai Edwin<edwin.zhai@intel.com>
>>
>> Saul,
>> These are Upstream-Status update.
>
> Can it all be folded into single patch please.
>

Already in the next pull for later tonight!

Sau!

>>
>> Thanks,
>> edwin
>>
>> Pull URL: git://git.pokylinux.org/poky-contrib.git
>>   Branch: gzhai/fix3
>>   Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/fix3
>>
>> Thanks,
>>     Zhai Edwin<edwin.zhai@intel.com>
>> ---
>>
>>
>> Zhai Edwin (54):
>>   gtk+: Add Upstream-Status
>>   ed: Add Upstream-Status
>>   gnome-common: Add Upstream-Status
>>   libmatchbox: Add Upstream-Status
>>   matchbox-wm: Add Upstream-Status
>>   x11vnc: Add Upstream-Status
>>   xtscal: Add Upstream-Status
>>   eds-dbus: Add Upstream-Status
>>   matchbox-desktop: Add Upstream-Status
>>   matchbox-keyboard: Add Upstream-Status
>>   matchbox-stroke: Add Upstream-Status
>>   matchbox-theme-sato: Add Upstream-Status
>>   owl-video-widget: Add Upstream-Status
>>   beecrypt: Add Upstream-Status
>>   gnome-icon-theme: Add Upstream-Status
>>   tslib: Add Upstream-Status
>>   libowl-av: Add Upstream-Status
>>   sato-icon-theme: Add Upstream-Status
>>   web-webkit: Add Upstream-Status
>>   metacity: Add Upstream-Status
>>   apr: Add Upstream-Status
>>   gdk-pixbuf: Add Upstream-Status
>>   pcmanfm: Add Upstream-Status
>>   gpgme: Add Upstream-Status
>>   eee-acpi-scripts: Add Upstream-Status
>>   libgalago: Add Upstream-Status
>>   python-pygtk: Add Upstream-Status
>>   gnome-mime-data: Add Upstream-Status
>>   clutter: Add Upstream-Status
>>   clutter-gtk: Add Upstream-Status
>>   tidy: Add Upstream-Status
>>   mutter: Add Upstream-Status
>>   xcursor-transparent-theme: Add Upstream-Status
>>   leafpad: Add Upstream-Status
>>   matchbox-config-gtk: Add Upstream-Status
>>   contacts: Add Upstream-Status
>>   dates: Add Upstream-Status
>>   web: Add Upstream-Status
>>   webkit: Add Upstream-Status
>>   apr-util: Add Upstream-Status
>>   libcroco: Add Upstream-Status
>>   liboil: Add Upstream-Status
>>   libxslt: Add Upstream-Status
>>   libglade: Add Upstream-Status
>>   gnome-terminal: Add Upstream-Status
>>   xev: Add Upstream-Status
>>   claws-mail: Add Upstream-Status
>>   clipboard-manager: Add Upstream-Status
>>   epdfview: Add Upstream-Status
>>   kf: Add Upstream-Status
>>   qemu: Add Upstream-Status
>>   clutter-gst: Add Upstream-Status
>>   table: Add Upstream-Status
>>   matchbox-panel-2: Add Upstream-Status
>>
>>   .../30f29e7d8e1b67c40cd18a7155ba30c4382692d5.patch |    2 +
>>   .../recipes-graphics/clutter/table/fixes.patch     |    2 +
>>   .../recipes-graphics/clutter/tidy/autofoo.patch    |    2 +
>>   .../clutter/tidy/tidy-enable-tests.patch           |    2 +
>>   .../recipes-graphics/xorg-app/xev/diet-x11.patch   |    2 +
>>   .../recipes-sato/claws-mail/files/desktop.patch    |    2 +
>>   .../recipes-sato/claws-mail/files/fix-build.patch  |    2 +
>>   .../claws-mail/files/owl-window-menu.patch         |    2 +
>>   .../claws-mail/files/streamline-ui.patch           |    2 +
>>   .../clipboard-manager/files/daemonize.patch        |    2 +
>>   .../clipboard-manager/files/makefile.patch         |    2 +
>>   .../clipboard-manager/files/script.patch           |    2 +
>>   .../recipes-sato/epdfview/epdfview/owl-menus.patch |    2 +
>>   .../recipes-sato/kf/files/fix-configure.patch      |    2 +
>>   .../recipes-sato/kf/files/fix-desktop-file.patch   |    2 +
>>   meta-demoapps/recipes-sato/kf/files/gcc4.patch     |    2 +
>>   .../eee-acpi-scripts/files/powerbtn.patch          |    2 +
>>   .../eee-acpi-scripts/files/remove-doc-check.patch  |    2 +
>>   .../galago/libgalago-0.5.2/mkdir.patch             |    2 +
>>   .../galago/libgalago-0.5.2/pkgconfig.patch         |    2 +
>>   .../python/python-pygtk/fix-gtkunixprint.patch     |    2 +
>>   .../python/python-pygtk/nodocs.patch               |    2 +
>>   .../prevent_to_get_display_during_import.patch     |    2 +
>>   ...t-and-use-GCC-atomic-builtins-for-locking.patch |    2 +
>>   .../qemu/qemu-0.14.0/enable-i386-linux-user.patch  |    2 +
>>   .../fallback-to-safe-mmap_min_addr.patch           |    2 +
>>   .../qemu/qemu-0.14.0/fix-configure-checks.patch    |    2 +
>>   .../qemu/qemu-0.14.0/fix-nogl.patch                |    2 +
>>   .../qemu/qemu-0.14.0/glflags.patch                 |    2 +
>>   .../qemu/qemu-0.14.0/init-info.patch               |    2 +
>>   .../qemu/qemu-0.14.0/larger_default_ram_size.patch |    2 +
>>   .../qemu/qemu-0.14.0/linker-flags.patch            |    3 ++
>>   .../qemu/qemu-0.14.0/no-strip.patch                |    2 +
>>   .../qemu/qemu-0.14.0/opengl-sdl-fix.patch          |    2 +
>>   .../qemu/qemu-0.14.0/qemu-git-qemugl-host.patch    |    2 +
>>   .../qemu/qemu-0.14.0/qemu-vmware-vga-depth.patch   |    3 ++
>>   .../qemugl-allow-glxcontext-release.patch          |    2 +
>>   .../qemu/qemu-0.14.0/qemugl-fix.patch              |    2 +
>>   .../spice-qxl-locking-fix-for-qemu-kvm.patch       |    2 +
>>   meta/recipes-extended/ed/ed-1.5/ed-1.2-build.patch |    2 +
>>   .../gdk-pixbuf-2.22.1/configure_fix.patch          |    2 +
>>   .../gdk-pixbuf-2.22.1/hardcoded_libtool.patch      |    2 +
>>   .../gnome/gnome-common-2.28.0/omf.patch            |    2 +
>>   .../gnome/gnome-icon-theme/iconpath-option.patch   |    3 ++
>>   .../gnome/gnome-mime-data/pkgconfig.patch          |    2 +
>>   .../gnome/metacity/crosscompile.patch              |    2 +
>>   .../gtk+/gtk+-2.12.7/cellrenderer-cairo.patch      |    2 +
>>   .../gtk+/gtk+-2.12.7/combo-arrow-size.patch        |    2 +
>>   .../gtk+/gtk+-2.12.7/disable-print.patch           |    2 +
>>   .../gtk+/gtk+-2.12.7/entry-cairo.patch             |    2 +
>>   .../gtk+/gtk+-2.12.7/filechooser-default.patch     |    2 +
>>   .../gtk+/gtk+-2.12.7/filechooser-sizefix.patch     |    2 +
>>   .../gtk+/gtk+-2.12.7/filesystem-volumes.patch      |    2 +
>>   .../gtk+/gtk+-2.12.7/gtklabel-resize-patch         |    2 +
>>   .../gtk+/gtk+-2.12.7/hardcoded_libtool.patch       |    2 +
>>   .../gtk+/gtk+-2.12.7/menu-deactivate.patch         |    2 +
>>   meta/recipes-gnome/gtk+/gtk+-2.12.7/no-demos.patch |    2 +
>>   .../gtk+/gtk+-2.12.7/pangoxft2.10.6.diff           |    2 +
>>   .../gtk+/gtk+-2.12.7/range-no-redraw.patch         |    3 ++
>>   .../gtk+/gtk+-2.12.7/run-iconcache.patch           |    2 +
>>   .../gtk+/gtk+-2.12.7/scrolled-placement.patch      |    2 +
>>   .../gtk+/gtk+-2.12.7/toggle-font.diff              |    2 +
>>   .../recipes-gnome/gtk+/gtk+-2.12.7/xsettings.patch |    2 +
>>   ...Duplicate-the-exec-string-returned-by-gtk.patch |    2 +
>>   .../gtk+/gtk+-2.16.6/cellrenderer-cairo.patch      |    2 +
>>   .../gtk+-2.16.6/disable-gio-png-sniff-test.diff    |    2 +
>>   .../gtk+/gtk+-2.16.6/entry-cairo.patch             |    2 +
>>   .../gtk+/gtk+-2.16.6/hardcoded_libtool.patch       |    2 +
>>   meta/recipes-gnome/gtk+/gtk+-2.16.6/no-demos.patch |    2 +
>>   .../gtk+/gtk+-2.16.6/run-iconcache.patch           |    2 +
>>   .../gtk+/gtk+-2.16.6/toggle-font.diff              |    2 +
>>   .../recipes-gnome/gtk+/gtk+-2.16.6/xsettings.patch |    2 +
>>   ...Duplicate-the-exec-string-returned-by-gtk.patch |    2 +
>>   .../gtk+/gtk+-2.22.1/cellrenderer-cairo.patch      |    2 +
>>   .../gtk+/gtk+-2.22.1/configurefix.patch            |    2 +
>>   .../recipes-gnome/gtk+/gtk+-2.22.1/doc-fixes.patch |    3 ++
>>   .../gtk+/gtk+-2.22.1/entry-cairo.patch             |    2 +
>>   .../gtk+/gtk+-2.22.1/hardcoded_libtool.patch       |    2 +
>>   meta/recipes-gnome/gtk+/gtk+-2.22.1/no-demos.patch |    2 +
>>   .../gtk+/gtk+-2.22.1/run-iconcache.patch           |    2 +
>>   .../gtk+/gtk+-2.22.1/toggle-font.diff              |    2 +
>>   .../recipes-gnome/gtk+/gtk+-2.22.1/xsettings.patch |    2 +
>>   .../libglade/libglade-2.6.4/glade-cruft.patch      |    2 +
>>   .../libglade/libglade-2.6.4/no-deprecation.patch   |    2 +
>>   .../libglade/libglade-2.6.4/no-xml2.patch          |    2 +
>>   .../clutter/clutter-gst/autofoo-0.4.patch          |    2 +
>>   ...-9db4a61a25677764bb927369c5c68ada958fb65c.patch |    2 +
>>   .../clutter/clutter-gst/autofoo.patch              |    2 +
>>   .../clutter/clutter-gst/enable_tests-1.4.patch     |    3 ++
>>   .../clutter/clutter-gst/enable_tests.patch         |    3 ++
>>   .../clutter/clutter-gtk/disable_deprecated.patch   |    2 +
>>   .../clutter/clutter-gtk/enable_tests.patch         |    2 +
>>   .../clutter/clutter/build-fix.patch                |    2 +
>>   .../clutter/clutter/enable_tests-0.6.patch         |    2 +
>>   .../clutter/clutter/enable_tests-0.8.patch         |    2 +
>>   .../clutter/clutter/enable_tests-1.0.patch         |    2 +
>>   .../clutter/clutter/enable_tests-1.4.patch         |    2 +
>>   ...-654c26a1301c9bc5f8e3e5e3b68af5eb1b2e0673.patch |    2 +
>>   .../clutter/clutter/enable_tests.patch             |    2 +
>>   .../clutter/clutter/symconflict.patch              |    2 +
>>   .../clutter/clutter/test-conformance-fix.patch     |    2 +
>>   .../libmatchbox/files/16bppfixes-2.patch           |    2 +
>>   .../libmatchbox/files/16bppfixes.patch             |    2 +
>>   .../libmatchbox/files/autofoo.patch                |    2 +
>>   .../libmatchbox/files/configure_fixes.patch        |    2 +
>>   .../libmatchbox/files/fix-configure-for-1.9.patch  |    2 +
>>   .../libmatchbox/files/matchbox-start-fix.patch     |    2 +
>>   .../matchbox-wm/matchbox-wm/configure_fix.patch    |    2 +
>>   .../mutter/mutter/crosscompile.patch               |    2 +
>>   ...-7adb574bb3fa3880eb85dbc86e580cf3452d57c4.patch |    2 +
>>   .../mutter/mutter/fix_pkgconfig.patch              |    2 +
>>   meta/recipes-graphics/mutter/mutter/nodocs.patch   |    2 +
>>   meta/recipes-graphics/mutter/mutter/nozenity.patch |    2 +
>>   .../tslib/tslib/32bitBE-support.patch              |    3 ++
>>   .../recipes-graphics/tslib/tslib/fix_version.patch |    2 +
>>   meta/recipes-graphics/tslib/tslib/multievent.patch |    2 +
>>   .../recipes-graphics/x11vnc/files/endian-fix.patch |    2 +
>>   .../x11vnc/files/starting-fix.patch                |    3 ++
>>   .../fix_watch_cursor.patch                         |    2 +
>>   .../use-relative-symlinks.patch                    |    2 +
>>   .../xtscal/xtscal/change-cross.patch               |    2 +
>>   meta/recipes-graphics/xtscal/xtscal/cleanup.patch  |    2 +
>>   .../xtscal/dso_linking_change_build_fix.patch      |    2 +
>>   .../eds/eds-dbus-2.20.0/no_iconv_test.patch        |    2 +
>>   .../eds/eds-dbus-2.20.0/oh-contact.patch           |    2 +
>>   .../eds/eds-dbus/new-contact-fix.patch             |    2 +
>>   meta/recipes-sato/eds/eds-dbus/nossl.patch         |    2 +
>>   meta/recipes-sato/eds/eds-dbus/oh-contact.patch    |    2 +
>>   meta/recipes-sato/eds/eds-dbus/old-gdk-api.patch   |    2 +
>>   .../eds/eds-dbus/optional_imapx_provider.patch     |    2 +
>>   meta/recipes-sato/eds/eds-dbus/parallelmake.patch  |    2 +
>>   meta/recipes-sato/leafpad/files/owl-menu.patch     |    2 +
>>   .../matchbox-config-gtk/files/no-handed.patch      |    2 +
>>   .../files/dso_linking_change_build_fix.patch       |    2 +
>>   .../matchbox-desktop/files/window-resize-fix.patch |    2 +
>>   .../matchbox-keyboard/files/configure_fix.patch    |    2 +
>>   .../matchbox-keyboard/files/single-instance.patch  |    1 +
>>   .../matchbox-panel-2/gcc-4.6.0-compile.patch       |    2 +
>>   .../recipes-sato/matchbox-panel-2/startup_fix.diff |    2 +
>>   .../matchbox-stroke/files/configure_fix.patch      |    2 +
>>   .../files/dso_linking_change_build_fix.patch       |    1 +
>>   .../matchbox-stroke/files/single-instance.patch    |    1 +
>>   .../matchbox-theme-sato-2/png_rename.patch         |    2 +
>>   .../libowl-av/gst_change_state.patch               |    2 +
>>   .../owl-video-widget/libowl-av/make-382.patch      |    2 +
>>   .../owl-video/gtk_multithread_safe.patch           |    2 +
>>   .../owl-video-widget/owl-video/make-382.patch      |    2 +
>>   .../pcmanfm/files/cross-compile-fix.patch          |    2 +
>>   .../pcmanfm/files/owl-window-menu.patch            |    2 +
>>   .../contacts/contacts-owl-window-menu.patch        |    2 +
>>   meta/recipes-sato/pimlico/contacts/make-382.patch  |    2 +
>>   .../pimlico/dates/dates-owl-window-menu.patch      |    2 +
>>   .../dates/dso_linking_change_build_fix.patch       |    2 +
>>   meta/recipes-sato/pimlico/dates/make-382.patch     |    2 +
>>   .../sato-icon-theme/iconpath-option.patch          |    2 +
>>   .../web/web-webkit/link-with-g++.patch             |    3 ++
>>   meta/recipes-sato/web/web-webkit/make-382.patch    |    2 +
>>   meta/recipes-sato/web/web/owl-window-menu.patch    |    2 +
>>   meta/recipes-sato/webkit/files/nodolt.patch        |    3 ++
>>   meta/recipes-support/apr/apr-util/configfix.patch  |    2 +
>>   .../apr/apr-util/configure_fixes.patch             |    2 +
>>   .../apr/apr-util/configure_fixes.patch.old         |   25 --------------------
>>   meta/recipes-support/apr/apr/buildconf_fix.patch   |    2 +
>>   meta/recipes-support/apr/apr/cleanup.patch         |    2 +
>>   meta/recipes-support/apr/apr/configfix.patch       |    2 +
>>   meta/recipes-support/apr/apr/configure_fixes.patch |    2 +
>>   .../beecrypt/beecrypt/disable-icu-check.patch      |    2 +
>>   .../beecrypt/beecrypt/fix-security.patch           |    3 ++
>>   .../gpgme/gpgme-1.3.0/disable_gpgconf_check.patch  |    1 +
>>   meta/recipes-support/libcroco/files/croco.patch    |    2 +
>>   .../liboil-0.3.17/fix-unaligned-whitelist.patch    |    2 +
>>   .../liboil/liboil-0.3.17/no-tests.patch            |    2 +
>>   .../libxslt/libxslt/pkgconfig_fix.patch            |    2 +
>>   173 files changed, 352 insertions(+), 25 deletions(-)
>>   delete mode 100644 meta/recipes-sato/webkit/files/fix_im.patch
>>   delete mode 100644 meta/recipes-support/apr/apr-util/configure_fixes.patch.old
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



