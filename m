Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QKjOv-00050I-TN
	for openembedded-core@lists.openembedded.org;
	Fri, 13 May 2011 05:50:54 +0200
Received: by eye27 with SMTP id 27so635585eye.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2011 20:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=paOYIjZ3BCtnKo/VYGRY2xLa5tI/DpL11Ldh3mMQ1hc=;
	b=ThsjJKd91w/kf7hRaEuCPO0l6Z3S/YSEgk2Bi5DOSwnDrletQMiadpUNif080NFe7e
	XbluQnRT33eYA/6hcGhBAGJbrrPBTMTQYN6fvRVKnO4O99J9PtrjRrbNa413h6cm3G2x
	EIaAZ8xh1QBwEN3bKJwGWJoWexHJzRjXmnPFc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=M48yNtt0LnDfm1kGlXAz0XzmtqslSOrBHENQHh1+Ash1tkUB3UueSFXJfs0y3yvyEk
	Y7Zmy6kkD4uhBWQCeL6tDsEG6LtosT4o57Z02rNv07jzyH1mTXID8hSULhFOWfvn3Ivh
	8HZKPhAtbrt9dJg+ZWOLLXzclThOi89kT8w/c=
Received: by 10.14.0.133 with SMTP id 5mr426998eeb.144.1305258484174; Thu, 12
	May 2011 20:48:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.53.5 with HTTP; Thu, 12 May 2011 20:47:34 -0700 (PDT)
In-Reply-To: <cover.1305197864.git.edwin.zhai@intel.com>
References: <cover.1305197864.git.edwin.zhai@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 12 May 2011 20:47:34 -0700
Message-ID: <BANLkTikG1B2hvK+T5nKfXnDe43h3Dx43Cg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Fri, 13 May 2011 03:50:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, May 12, 2011 at 4:00 AM, Zhai Edwin <edwin.zhai@intel.com> wrote:
> From: Zhai Edwin <edwin.zhai@intel.com>
>
> Saul,
> These are Upstream-Status update.

Can it all be folded into single patch please.

>
> Thanks,
> edwin
>
> Pull URL: git://git.pokylinux.org/poky-contrib.git
> =C2=A0Branch: gzhai/fix3
> =C2=A0Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dgzh=
ai/fix3
>
> Thanks,
> =C2=A0 =C2=A0Zhai Edwin <edwin.zhai@intel.com>
> ---
>
>
> Zhai Edwin (54):
> =C2=A0gtk+: Add Upstream-Status
> =C2=A0ed: Add Upstream-Status
> =C2=A0gnome-common: Add Upstream-Status
> =C2=A0libmatchbox: Add Upstream-Status
> =C2=A0matchbox-wm: Add Upstream-Status
> =C2=A0x11vnc: Add Upstream-Status
> =C2=A0xtscal: Add Upstream-Status
> =C2=A0eds-dbus: Add Upstream-Status
> =C2=A0matchbox-desktop: Add Upstream-Status
> =C2=A0matchbox-keyboard: Add Upstream-Status
> =C2=A0matchbox-stroke: Add Upstream-Status
> =C2=A0matchbox-theme-sato: Add Upstream-Status
> =C2=A0owl-video-widget: Add Upstream-Status
> =C2=A0beecrypt: Add Upstream-Status
> =C2=A0gnome-icon-theme: Add Upstream-Status
> =C2=A0tslib: Add Upstream-Status
> =C2=A0libowl-av: Add Upstream-Status
> =C2=A0sato-icon-theme: Add Upstream-Status
> =C2=A0web-webkit: Add Upstream-Status
> =C2=A0metacity: Add Upstream-Status
> =C2=A0apr: Add Upstream-Status
> =C2=A0gdk-pixbuf: Add Upstream-Status
> =C2=A0pcmanfm: Add Upstream-Status
> =C2=A0gpgme: Add Upstream-Status
> =C2=A0eee-acpi-scripts: Add Upstream-Status
> =C2=A0libgalago: Add Upstream-Status
> =C2=A0python-pygtk: Add Upstream-Status
> =C2=A0gnome-mime-data: Add Upstream-Status
> =C2=A0clutter: Add Upstream-Status
> =C2=A0clutter-gtk: Add Upstream-Status
> =C2=A0tidy: Add Upstream-Status
> =C2=A0mutter: Add Upstream-Status
> =C2=A0xcursor-transparent-theme: Add Upstream-Status
> =C2=A0leafpad: Add Upstream-Status
> =C2=A0matchbox-config-gtk: Add Upstream-Status
> =C2=A0contacts: Add Upstream-Status
> =C2=A0dates: Add Upstream-Status
> =C2=A0web: Add Upstream-Status
> =C2=A0webkit: Add Upstream-Status
> =C2=A0apr-util: Add Upstream-Status
> =C2=A0libcroco: Add Upstream-Status
> =C2=A0liboil: Add Upstream-Status
> =C2=A0libxslt: Add Upstream-Status
> =C2=A0libglade: Add Upstream-Status
> =C2=A0gnome-terminal: Add Upstream-Status
> =C2=A0xev: Add Upstream-Status
> =C2=A0claws-mail: Add Upstream-Status
> =C2=A0clipboard-manager: Add Upstream-Status
> =C2=A0epdfview: Add Upstream-Status
> =C2=A0kf: Add Upstream-Status
> =C2=A0qemu: Add Upstream-Status
> =C2=A0clutter-gst: Add Upstream-Status
> =C2=A0table: Add Upstream-Status
> =C2=A0matchbox-panel-2: Add Upstream-Status
>
> =C2=A0.../30f29e7d8e1b67c40cd18a7155ba30c4382692d5.patch | =C2=A0 =C2=A02=
 +
> =C2=A0.../recipes-graphics/clutter/table/fixes.patch =C2=A0 =C2=A0 | =C2=
=A0 =C2=A02 +
> =C2=A0.../recipes-graphics/clutter/tidy/autofoo.patch =C2=A0 =C2=A0| =C2=
=A0 =C2=A02 +
> =C2=A0.../clutter/tidy/tidy-enable-tests.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 =C2=A02 +
> =C2=A0.../recipes-graphics/xorg-app/xev/diet-x11.patch =C2=A0 | =C2=A0 =
=C2=A02 +
> =C2=A0.../recipes-sato/claws-mail/files/desktop.patch =C2=A0 =C2=A0| =C2=
=A0 =C2=A02 +
> =C2=A0.../recipes-sato/claws-mail/files/fix-build.patch =C2=A0| =C2=A0 =
=C2=A02 +
> =C2=A0.../claws-mail/files/owl-window-menu.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 =C2=A02 +
> =C2=A0.../claws-mail/files/streamline-ui.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 =C2=A02 +
> =C2=A0.../clipboard-manager/files/daemonize.patch =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 =C2=A02 +
> =C2=A0.../clipboard-manager/files/makefile.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 =C2=A02 +
> =C2=A0.../clipboard-manager/files/script.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 =C2=A02 +
> =C2=A0.../recipes-sato/epdfview/epdfview/owl-menus.patch | =C2=A0 =C2=A02=
 +
> =C2=A0.../recipes-sato/kf/files/fix-configure.patch =C2=A0 =C2=A0 =C2=A0|=
 =C2=A0 =C2=A02 +
> =C2=A0.../recipes-sato/kf/files/fix-desktop-file.patch =C2=A0 | =C2=A0 =
=C2=A02 +
> =C2=A0meta-demoapps/recipes-sato/kf/files/gcc4.patch =C2=A0 =C2=A0 | =C2=
=A0 =C2=A02 +
> =C2=A0.../eee-acpi-scripts/files/powerbtn.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 =C2=A02 +
> =C2=A0.../eee-acpi-scripts/files/remove-doc-check.patch =C2=A0| =C2=A0 =
=C2=A02 +
> =C2=A0.../galago/libgalago-0.5.2/mkdir.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | =C2=A0 =C2=A02 +
> =C2=A0.../galago/libgalago-0.5.2/pkgconfig.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 =C2=A02 +
> =C2=A0.../python/python-pygtk/fix-gtkunixprint.patch =C2=A0 =C2=A0 | =C2=
=A0 =C2=A02 +
> =C2=A0.../python/python-pygtk/nodocs.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A02 +
> =C2=A0.../prevent_to_get_display_during_import.patch =C2=A0 =C2=A0 | =C2=
=A0 =C2=A02 +
> =C2=A0...t-and-use-GCC-atomic-builtins-for-locking.patch | =C2=A0 =C2=A02=
 +
> =C2=A0.../qemu/qemu-0.14.0/enable-i386-linux-user.patch =C2=A0| =C2=A0 =
=C2=A02 +
> =C2=A0.../fallback-to-safe-mmap_min_addr.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 =C2=A02 +
> =C2=A0.../qemu/qemu-0.14.0/fix-configure-checks.patch =C2=A0 =C2=A0| =C2=
=A0 =C2=A02 +
> =C2=A0.../qemu/qemu-0.14.0/fix-nogl.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +
> =C2=A0.../qemu/qemu-0.14.0/glflags.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A02 +
> =C2=A0.../qemu/qemu-0.14.0/init-info.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A02 +
> =C2=A0.../qemu/qemu-0.14.0/larger_default_ram_size.patch | =C2=A0 =C2=A02=
 +
> =C2=A0.../qemu/qemu-0.14.0/linker-flags.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| =C2=A0 =C2=A03 ++
> =C2=A0.../qemu/qemu-0.14.0/no-strip.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +
> =C2=A0.../qemu/qemu-0.14.0/opengl-sdl-fix.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 =C2=A02 +
> =C2=A0.../qemu/qemu-0.14.0/qemu-git-qemugl-host.patch =C2=A0 =C2=A0| =C2=
=A0 =C2=A02 +
> =C2=A0.../qemu/qemu-0.14.0/qemu-vmware-vga-depth.patch =C2=A0 | =C2=A0 =
=C2=A03 ++
> =C2=A0.../qemugl-allow-glxcontext-release.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 =C2=A02 +
> =C2=A0.../qemu/qemu-0.14.0/qemugl-fix.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +
> =C2=A0.../spice-qxl-locking-fix-for-qemu-kvm.patch =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 =C2=A02 +
> =C2=A0meta/recipes-extended/ed/ed-1.5/ed-1.2-build.patch | =C2=A0 =C2=A02=
 +
> =C2=A0.../gdk-pixbuf-2.22.1/configure_fix.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 =C2=A02 +
> =C2=A0.../gdk-pixbuf-2.22.1/hardcoded_libtool.patch =C2=A0 =C2=A0 =C2=A0|=
 =C2=A0 =C2=A02 +
> =C2=A0.../gnome/gnome-common-2.28.0/omf.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +
> =C2=A0.../gnome/gnome-icon-theme/iconpath-option.patch =C2=A0 | =C2=A0 =
=C2=A03 ++
> =C2=A0.../gnome/gnome-mime-data/pkgconfig.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 =C2=A02 +
> =C2=A0.../gnome/metacity/crosscompile.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +
> =C2=A0.../gtk+/gtk+-2.12.7/cellrenderer-cairo.patch =C2=A0 =C2=A0 =C2=A0|=
 =C2=A0 =C2=A02 +
> =C2=A0.../gtk+/gtk+-2.12.7/combo-arrow-size.patch =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 =C2=A02 +
> =C2=A0.../gtk+/gtk+-2.12.7/disable-print.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 =C2=A02 +
> =C2=A0.../gtk+/gtk+-2.12.7/entry-cairo.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | =C2=A0 =C2=A02 +
> =C2=A0.../gtk+/gtk+-2.12.7/filechooser-default.patch =C2=A0 =C2=A0 | =C2=
=A0 =C2=A02 +
> =C2=A0.../gtk+/gtk+-2.12.7/filechooser-sizefix.patch =C2=A0 =C2=A0 | =C2=
=A0 =C2=A02 +
> =C2=A0.../gtk+/gtk+-2.12.7/filesystem-volumes.patch =C2=A0 =C2=A0 =C2=A0|=
 =C2=A0 =C2=A02 +
> =C2=A0.../gtk+/gtk+-2.12.7/gtklabel-resize-patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 =C2=A02 +
> =C2=A0.../gtk+/gtk+-2.12.7/hardcoded_libtool.patch =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 =C2=A02 +
> =C2=A0.../gtk+/gtk+-2.12.7/menu-deactivate.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 =C2=A02 +
> =C2=A0meta/recipes-gnome/gtk+/gtk+-2.12.7/no-demos.patch | =C2=A0 =C2=A02=
 +
> =C2=A0.../gtk+/gtk+-2.12.7/pangoxft2.10.6.diff =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 =C2=A02 +
> =C2=A0.../gtk+/gtk+-2.12.7/range-no-redraw.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 =C2=A03 ++
> =C2=A0.../gtk+/gtk+-2.12.7/run-iconcache.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 =C2=A02 +
> =C2=A0.../gtk+/gtk+-2.12.7/scrolled-placement.patch =C2=A0 =C2=A0 =C2=A0|=
 =C2=A0 =C2=A02 +
> =C2=A0.../gtk+/gtk+-2.12.7/toggle-font.diff =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +
> =C2=A0.../recipes-gnome/gtk+/gtk+-2.12.7/xsettings.patch | =C2=A0 =C2=A02=
 +
> =C2=A0...Duplicate-the-exec-string-returned-by-gtk.patch | =C2=A0 =C2=A02=
 +
> =C2=A0.../gtk+/gtk+-2.16.6/cellrenderer-cairo.patch =C2=A0 =C2=A0 =C2=A0|=
 =C2=A0 =C2=A02 +
> =C2=A0.../gtk+-2.16.6/disable-gio-png-sniff-test.diff =C2=A0 =C2=A0| =C2=
=A0 =C2=A02 +
> =C2=A0.../gtk+/gtk+-2.16.6/entry-cairo.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | =C2=A0 =C2=A02 +
> =C2=A0.../gtk+/gtk+-2.16.6/hardcoded_libtool.patch =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 =C2=A02 +
> =C2=A0meta/recipes-gnome/gtk+/gtk+-2.16.6/no-demos.patch | =C2=A0 =C2=A02=
 +
> =C2=A0.../gtk+/gtk+-2.16.6/run-iconcache.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 =C2=A02 +
> =C2=A0.../gtk+/gtk+-2.16.6/toggle-font.diff =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +
> =C2=A0.../recipes-gnome/gtk+/gtk+-2.16.6/xsettings.patch | =C2=A0 =C2=A02=
 +
> =C2=A0...Duplicate-the-exec-string-returned-by-gtk.patch | =C2=A0 =C2=A02=
 +
> =C2=A0.../gtk+/gtk+-2.22.1/cellrenderer-cairo.patch =C2=A0 =C2=A0 =C2=A0|=
 =C2=A0 =C2=A02 +
> =C2=A0.../gtk+/gtk+-2.22.1/configurefix.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +
> =C2=A0.../recipes-gnome/gtk+/gtk+-2.22.1/doc-fixes.patch | =C2=A0 =C2=A03=
 ++
> =C2=A0.../gtk+/gtk+-2.22.1/entry-cairo.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | =C2=A0 =C2=A02 +
> =C2=A0.../gtk+/gtk+-2.22.1/hardcoded_libtool.patch =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 =C2=A02 +
> =C2=A0meta/recipes-gnome/gtk+/gtk+-2.22.1/no-demos.patch | =C2=A0 =C2=A02=
 +
> =C2=A0.../gtk+/gtk+-2.22.1/run-iconcache.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 =C2=A02 +
> =C2=A0.../gtk+/gtk+-2.22.1/toggle-font.diff =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +
> =C2=A0.../recipes-gnome/gtk+/gtk+-2.22.1/xsettings.patch | =C2=A0 =C2=A02=
 +
> =C2=A0.../libglade/libglade-2.6.4/glade-cruft.patch =C2=A0 =C2=A0 =C2=A0|=
 =C2=A0 =C2=A02 +
> =C2=A0.../libglade/libglade-2.6.4/no-deprecation.patch =C2=A0 | =C2=A0 =
=C2=A02 +
> =C2=A0.../libglade/libglade-2.6.4/no-xml2.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 =C2=A02 +
> =C2=A0.../clutter/clutter-gst/autofoo-0.4.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 =C2=A02 +
> =C2=A0...-9db4a61a25677764bb927369c5c68ada958fb65c.patch | =C2=A0 =C2=A02=
 +
> =C2=A0.../clutter/clutter-gst/autofoo.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +
> =C2=A0.../clutter/clutter-gst/enable_tests-1.4.patch =C2=A0 =C2=A0 | =C2=
=A0 =C2=A03 ++
> =C2=A0.../clutter/clutter-gst/enable_tests.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 =C2=A03 ++
> =C2=A0.../clutter/clutter-gtk/disable_deprecated.patch =C2=A0 | =C2=A0 =
=C2=A02 +
> =C2=A0.../clutter/clutter-gtk/enable_tests.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 =C2=A02 +
> =C2=A0.../clutter/clutter/build-fix.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +
> =C2=A0.../clutter/clutter/enable_tests-0.6.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 =C2=A02 +
> =C2=A0.../clutter/clutter/enable_tests-0.8.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 =C2=A02 +
> =C2=A0.../clutter/clutter/enable_tests-1.0.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 =C2=A02 +
> =C2=A0.../clutter/clutter/enable_tests-1.4.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 =C2=A02 +
> =C2=A0...-654c26a1301c9bc5f8e3e5e3b68af5eb1b2e0673.patch | =C2=A0 =C2=A02=
 +
> =C2=A0.../clutter/clutter/enable_tests.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | =C2=A0 =C2=A02 +
> =C2=A0.../clutter/clutter/symconflict.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +
> =C2=A0.../clutter/clutter/test-conformance-fix.patch =C2=A0 =C2=A0 | =C2=
=A0 =C2=A02 +
> =C2=A0.../libmatchbox/files/16bppfixes-2.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 =C2=A02 +
> =C2=A0.../libmatchbox/files/16bppfixes.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | =C2=A0 =C2=A02 +
> =C2=A0.../libmatchbox/files/autofoo.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +
> =C2=A0.../libmatchbox/files/configure_fixes.patch =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 =C2=A02 +
> =C2=A0.../libmatchbox/files/fix-configure-for-1.9.patch =C2=A0| =C2=A0 =
=C2=A02 +
> =C2=A0.../libmatchbox/files/matchbox-start-fix.patch =C2=A0 =C2=A0 | =C2=
=A0 =C2=A02 +
> =C2=A0.../matchbox-wm/matchbox-wm/configure_fix.patch =C2=A0 =C2=A0| =C2=
=A0 =C2=A02 +
> =C2=A0.../mutter/mutter/crosscompile.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A02 +
> =C2=A0...-7adb574bb3fa3880eb85dbc86e580cf3452d57c4.patch | =C2=A0 =C2=A02=
 +
> =C2=A0.../mutter/mutter/fix_pkgconfig.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +
> =C2=A0meta/recipes-graphics/mutter/mutter/nodocs.patch =C2=A0 | =C2=A0 =
=C2=A02 +
> =C2=A0meta/recipes-graphics/mutter/mutter/nozenity.patch | =C2=A0 =C2=A02=
 +
> =C2=A0.../tslib/tslib/32bitBE-support.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A03 ++
> =C2=A0.../recipes-graphics/tslib/tslib/fix_version.patch | =C2=A0 =C2=A02=
 +
> =C2=A0meta/recipes-graphics/tslib/tslib/multievent.patch | =C2=A0 =C2=A02=
 +
> =C2=A0.../recipes-graphics/x11vnc/files/endian-fix.patch | =C2=A0 =C2=A02=
 +
> =C2=A0.../x11vnc/files/starting-fix.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A03 ++
> =C2=A0.../fix_watch_cursor.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A02 +
> =C2=A0.../use-relative-symlinks.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +
> =C2=A0.../xtscal/xtscal/change-cross.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A02 +
> =C2=A0meta/recipes-graphics/xtscal/xtscal/cleanup.patch =C2=A0| =C2=A0 =
=C2=A02 +
> =C2=A0.../xtscal/dso_linking_change_build_fix.patch =C2=A0 =C2=A0 =C2=A0|=
 =C2=A0 =C2=A02 +
> =C2=A0.../eds/eds-dbus-2.20.0/no_iconv_test.patch =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 =C2=A02 +
> =C2=A0.../eds/eds-dbus-2.20.0/oh-contact.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 =C2=A02 +
> =C2=A0.../eds/eds-dbus/new-contact-fix.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | =C2=A0 =C2=A02 +
> =C2=A0meta/recipes-sato/eds/eds-dbus/nossl.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 =C2=A02 +
> =C2=A0meta/recipes-sato/eds/eds-dbus/oh-contact.patch =C2=A0 =C2=A0| =C2=
=A0 =C2=A02 +
> =C2=A0meta/recipes-sato/eds/eds-dbus/old-gdk-api.patch =C2=A0 | =C2=A0 =
=C2=A02 +
> =C2=A0.../eds/eds-dbus/optional_imapx_provider.patch =C2=A0 =C2=A0 | =C2=
=A0 =C2=A02 +
> =C2=A0meta/recipes-sato/eds/eds-dbus/parallelmake.patch =C2=A0| =C2=A0 =
=C2=A02 +
> =C2=A0meta/recipes-sato/leafpad/files/owl-menu.patch =C2=A0 =C2=A0 | =C2=
=A0 =C2=A02 +
> =C2=A0.../matchbox-config-gtk/files/no-handed.patch =C2=A0 =C2=A0 =C2=A0|=
 =C2=A0 =C2=A02 +
> =C2=A0.../files/dso_linking_change_build_fix.patch =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 =C2=A02 +
> =C2=A0.../matchbox-desktop/files/window-resize-fix.patch | =C2=A0 =C2=A02=
 +
> =C2=A0.../matchbox-keyboard/files/configure_fix.patch =C2=A0 =C2=A0| =C2=
=A0 =C2=A02 +
> =C2=A0.../matchbox-keyboard/files/single-instance.patch =C2=A0| =C2=A0 =
=C2=A01 +
> =C2=A0.../matchbox-panel-2/gcc-4.6.0-compile.patch =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 =C2=A02 +
> =C2=A0.../recipes-sato/matchbox-panel-2/startup_fix.diff | =C2=A0 =C2=A02=
 +
> =C2=A0.../matchbox-stroke/files/configure_fix.patch =C2=A0 =C2=A0 =C2=A0|=
 =C2=A0 =C2=A02 +
> =C2=A0.../files/dso_linking_change_build_fix.patch =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 =C2=A01 +
> =C2=A0.../matchbox-stroke/files/single-instance.patch =C2=A0 =C2=A0| =C2=
=A0 =C2=A01 +
> =C2=A0.../matchbox-theme-sato-2/png_rename.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 =C2=A02 +
> =C2=A0.../libowl-av/gst_change_state.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A02 +
> =C2=A0.../owl-video-widget/libowl-av/make-382.patch =C2=A0 =C2=A0 =C2=A0|=
 =C2=A0 =C2=A02 +
> =C2=A0.../owl-video/gtk_multithread_safe.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 =C2=A02 +
> =C2=A0.../owl-video-widget/owl-video/make-382.patch =C2=A0 =C2=A0 =C2=A0|=
 =C2=A0 =C2=A02 +
> =C2=A0.../pcmanfm/files/cross-compile-fix.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 =C2=A02 +
> =C2=A0.../pcmanfm/files/owl-window-menu.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +
> =C2=A0.../contacts/contacts-owl-window-menu.patch =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 =C2=A02 +
> =C2=A0meta/recipes-sato/pimlico/contacts/make-382.patch =C2=A0| =C2=A0 =
=C2=A02 +
> =C2=A0.../pimlico/dates/dates-owl-window-menu.patch =C2=A0 =C2=A0 =C2=A0|=
 =C2=A0 =C2=A02 +
> =C2=A0.../dates/dso_linking_change_build_fix.patch =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 =C2=A02 +
> =C2=A0meta/recipes-sato/pimlico/dates/make-382.patch =C2=A0 =C2=A0 | =C2=
=A0 =C2=A02 +
> =C2=A0.../sato-icon-theme/iconpath-option.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 =C2=A02 +
> =C2=A0.../web/web-webkit/link-with-g++.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | =C2=A0 =C2=A03 ++
> =C2=A0meta/recipes-sato/web/web-webkit/make-382.patch =C2=A0 =C2=A0| =C2=
=A0 =C2=A02 +
> =C2=A0meta/recipes-sato/web/web/owl-window-menu.patch =C2=A0 =C2=A0| =C2=
=A0 =C2=A02 +
> =C2=A0meta/recipes-sato/webkit/files/nodolt.patch =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 =C2=A03 ++
> =C2=A0meta/recipes-support/apr/apr-util/configfix.patch =C2=A0| =C2=A0 =
=C2=A02 +
> =C2=A0.../apr/apr-util/configure_fixes.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | =C2=A0 =C2=A02 +
> =C2=A0.../apr/apr-util/configure_fixes.patch.old =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 25 --------------------
> =C2=A0meta/recipes-support/apr/apr/buildconf_fix.patch =C2=A0 | =C2=A0 =
=C2=A02 +
> =C2=A0meta/recipes-support/apr/apr/cleanup.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 =C2=A02 +
> =C2=A0meta/recipes-support/apr/apr/configfix.patch =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 =C2=A02 +
> =C2=A0meta/recipes-support/apr/apr/configure_fixes.patch | =C2=A0 =C2=A02=
 +
> =C2=A0.../beecrypt/beecrypt/disable-icu-check.patch =C2=A0 =C2=A0 =C2=A0|=
 =C2=A0 =C2=A02 +
> =C2=A0.../beecrypt/beecrypt/fix-security.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 =C2=A03 ++
> =C2=A0.../gpgme/gpgme-1.3.0/disable_gpgconf_check.patch =C2=A0| =C2=A0 =
=C2=A01 +
> =C2=A0meta/recipes-support/libcroco/files/croco.patch =C2=A0 =C2=A0| =C2=
=A0 =C2=A02 +
> =C2=A0.../liboil-0.3.17/fix-unaligned-whitelist.patch =C2=A0 =C2=A0| =C2=
=A0 =C2=A02 +
> =C2=A0.../liboil/liboil-0.3.17/no-tests.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +
> =C2=A0.../libxslt/libxslt/pkgconfig_fix.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +
> =C2=A0173 files changed, 352 insertions(+), 25 deletions(-)
> =C2=A0delete mode 100644 meta/recipes-sato/webkit/files/fix_im.patch
> =C2=A0delete mode 100644 meta/recipes-support/apr/apr-util/configure_fixe=
s.patch.old
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


