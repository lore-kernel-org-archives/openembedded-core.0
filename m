Received: from mail-lb0-f176.google.com ([209.85.217.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>)
	id 1UCoUq-0000su-2b; Tue, 05 Mar 2013 10:49:20 +0100
Received: by mail-lb0-f176.google.com with SMTP id s4so4681888lbc.35
	for <multiple recipients>; Tue, 05 Mar 2013 01:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=v8Kt/zs/AJOUnfbGRRumrTwsZhvVAzpkiLQUbUFKW6g=;
	b=Jq2e4bI9VvUoDaz+Z59Cg6JSef3crLinPhkxshVT4gYok2gU8QhLjEo70Gke9EuHKX
	QNeQSggTooBFr0kaOJd88ugWPDBR9DuxPkPi7dk3F54Gk+YbTS3hQBcuy/554i/Qb2BD
	udKRuRzstp8jAruW8SYyBn05S+0BS7tzSlLXLlGqKK4hK25bIC5Dq11/Gpf+KXWVrFbm
	VSBid9tOgsaP0PYJz6PwBHlC2Ss3CtdwlyVO5jQRuQ4zRneN9x/4hunofazIQcVRy8Ww
	I4WYQajW/gag/HWjvzdLBpTIpTRKFrQFn/rEvNY5UXs0Qj75StrEcCTZfcKruft8cg3c
	ypEw==
MIME-Version: 1.0
X-Received: by 10.112.43.161 with SMTP id x1mr5749208lbl.89.1362475970891;
	Tue, 05 Mar 2013 01:32:50 -0800 (PST)
Received: by 10.112.98.170 with HTTP; Tue, 5 Mar 2013 01:32:50 -0800 (PST)
In-Reply-To: <20130303123903.GC3285@jama>
References: <20121213174202.GE3356@jama.jama.net> <20130303123903.GC3285@jama>
Date: Tue, 5 Mar 2013 10:32:50 +0100
Message-ID: <CAAQYJAtXOPk_uL2e54LpF+aNAa95S8=yrQQOUHC8jzkA-C+5bw@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe] State of bitbake world
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
X-List-Received-Date: Tue, 05 Mar 2013 09:49:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Mar 3, 2013 at 1:39 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Updated state of world builds on distroless
> oe-core+meta-oe+meta-smartphone layers
> this time also on qemux86 and qemux86-64:
>
> qemuarm:
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20130301_160601.log/
> qemux86:
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20130228_235947.log/
> qemux86-64:
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20130302_074041.log/
>
> all 3:
>   meta-openembedded/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb, do_compile
>   meta-openembedded/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.26.0.bb, do_compile
>   meta-openembedded/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb, do_compile
>   meta-openembedded/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb, do_compile
>   meta-openembedded/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb, do_compile
>   meta-openembedded/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb, do_compile
>   meta-openembedded/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb, do_compile
>   meta-openembedded/meta-oe/recipes-qt/qcanobserver/qcanobserver_svn.bb, do_compile
>   meta-openembedded/meta-oe/recipes-kernel/compat-wireless/compat-wireless-all_3.6.8.bb, do_compile
>   meta-openembedded/meta-oe/recipes-support/tbb/tbb_4.1.bb, do_fetch
>   meta-openembedded/meta-oe/recipes-multimedia/minidlna/minidlna_1.0.25.bb, do_compile
>   meta-openembedded/meta-oe/recipes-devtools/geany/geany_1.22.bb, do_configure
>   meta-openembedded/meta-oe/recipes-support/gperftools/gperftools_2.0.bb, do_install
>   meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb, do_compile
>   meta-openembedded/meta-multimedia/recipes-dvb/wscan/wscan_20121111.bb, do_compile
>   meta-openembedded/meta-networking/recipes-support/memcached/memcached_1.4.15.bb, do_configure
>
> qemuarm:
>   meta-openembedded/meta-gnome/recipes-support/atk/at-spi2-core_2.6.3.bb, do_configure
>   meta-openembedded/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb, do_compile
>   meta-openembedded/meta-oe/recipes-support/libunwind/libunwind_1.1.bb, do_compile
>   meta-openembedded/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.0.bb, do_compile
>   meta-openembedded/meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb, do_compile
>   openembedded-core/meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb, do_compile
>
> qemux86:
>   meta-openembedded/meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb, do_compile
>   meta-openembedded/meta-oe/recipes-support/ode/ode_0.9.bb, do_configure
>   meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_compile
>   meta-openembedded/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb, do_compile
>   meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb, do_configure
>   meta-openembedded/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.0.bb, do_compile
>   openembedded-core/meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb, do_compile
>   openembedded-core/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.0.bb, do_compile
>
> qemux86-64:
>   meta-openembedded/meta-gnome/recipes-support/atk/at-spi2-core_2.6.3.bb, do_configure
>   meta-openembedded/meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb, do_compile
>   meta-openembedded/meta-oe/recipes-support/ode/ode_0.9.bb, do_configure
>   meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb, do_configure
>   meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_compile
>   meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb, do_compile
>   meta-smartphone/meta-android/recipes-graphics/libhybris/libhybris_git.bb, do_compile
>   meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile
>   openembedded-core/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.0.bb, do_compile
>
> qemux86-64 has few new QA warnings:
> usbmuxd-git: usbmuxd: Files/directories were installed but not shipped
>   /usr/lib64
>   /usr/lib64/libusbmuxd.so.1.0.8
>   /usr/lib64/libusbmuxd.so.2
>   /usr/lib64/libusbmuxd.so
>   /usr/lib64/.debug
>   /usr/lib64/pkgconfig
>   /usr/lib64/.debug/libusbmuxd.so.1.0.8
>   /usr/lib64/pkgconfig/libusbmuxd.pc
> rpm-5.4.9: rpm: Files/directories were installed but not shipped
>   /etc
>   /etc/rcS.d
>   /etc/rcS.d/S98run-postinsts
>
> only qemux86 was able to build at-spi2-atk (because of site file), but with QA warnings:
> at-spi2-atk-2.6.2: at-spi2-atk: Files/directories were installed but not shipped
>   /usr/share
>   /usr/lib/gtk-2.0
>   /usr/lib/gnome-settings-daemon-3.0
>   /usr/lib/gtk-2.0/modules
>   /usr/lib/gtk-2.0/modules/libatk-bridge.so
>   /usr/lib/gtk-2.0/modules/libatk-bridge.la
>   /usr/lib/gtk-2.0/modules/.debug
>   /usr/lib/gtk-2.0/modules/.debug/libatk-bridge.so
>   /usr/lib/gnome-settings-daemon-3.0/gtk-modules
>   /usr/lib/gnome-settings-daemon-3.0/gtk-modules/at-spi2-atk.desktop
>   /usr/share/glib-2.0
>   /usr/share/glib-2.0/schemas
>   /usr/share/glib-2.0/schemas/org.a11y.atspi.gschema.xml
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

Martin,

wrt meta-initramfs I've reproduced the failure on qemux86 for kexec-tools-klibc.

There are missing patches for x86 (and x86-64), in fact the recipe has
only been tested on arm until now.
At runtime is presumably broken on other archs, especially kdump.

About ubi-utils-klibc, I guess it is again one header mismatch.
I'll try to fix both recipes before pulling the 3.8 headers then I'll retest.

Cheers

Andrea


