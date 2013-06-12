Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id C1BA060667;
	Wed, 12 Jun 2013 22:02:45 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id bi5so7327997pad.4
	for <multiple recipients>; Wed, 12 Jun 2013 15:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=kuVyGUxC+3dii5BDTi4MQcweOB0AKgTvYfjW4rV4eB0=;
	b=qTNZV+8J2yxlwPTM4kP3L9xztNcUG5cWbstTNKbp81G3pe3vz63Kf1nHnhYarsFein
	1IYGjvX5cAgcPoDGQfIrVssggreWWvbRQwp5Te6Ty9UcboM7HlPqLK5/m4Srgo/7IFNw
	Ino4BbcuJPgZjD2Mqok4+cmMbfLl4QpLj0uepj2ksXFOHmkIBkqDkRzWwnEsySTwQDda
	1V/Uc0e26rTeG5avHkyaQKPhRgTBjuKxpQBLztWFmo0EhUXgvgEUnTHcnYUi+WL9K25i
	x7MiWdaygzlLVfhxz/3chx1iZl/d1pOoydTf8PzFFaf9LZXRwyzrEkD/IO0fq0BgU8gP
	EEoQ==
X-Received: by 10.69.3.65 with SMTP id bu1mr21789331pbd.107.1371074566725;
	Wed, 12 Jun 2013 15:02:46 -0700 (PDT)
Received: from sa-nc-common3-188.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id vv6sm26400850pab.6.2013.06.12.15.02.44
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Jun 2013 15:02:45 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20130611160434.GI3233@jama>
Date: Wed, 12 Jun 2013 15:02:46 -0700
Message-Id: <CD8712FB-DAEB-4A44-A450-5CE8C1398BF1@gmail.com>
References: <20121213174202.GE3356@jama.jama.net>
	<20130415141253.GC10628@jama.dyndns-home.com>
	<20130427105400.GB3199@jama> <20130502151833.GC3206@jama>
	<20130516075215.GA24809@jama.dyndns-home.com>
	<20130520130635.GA32431@jama> <20130603151008.GC3279@jama>
	<20130611160434.GI3233@jama>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: State of bitbake world
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Jun 2013 22:02:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Jun 11, 2013, at 9:04 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:

> On Mon, Jun 03, 2013 at 05:10:08PM +0200, Martin Jansa wrote:
>> On Mon, May 20, 2013 at 03:06:35PM +0200, Martin Jansa wrote:
>>> Couple of issues from last email were fixed, so here is updated =
status:
>>>=20
>>> qemuarm Summary: 14 tasks failed:
>>> =
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20=
130520_090009.log
>>> qemux86 Summary: 19 tasks failed:
>>> =
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20=
130519_170509.log
>>> qemux86-64 Summary: 20 tasks failed:
>>> =
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20=
130520_005747.log
>>=20
>> Hi,
>>=20
>> updated status, still building with gcc-4.8
>> shr-version issue already fixed
>> llvm2.9 also fixed
>> so if we don't count these 3 failures it's a bit better than last =
status
>>=20
>> qemuarm Summary: 15 tasks failed:
>> =
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20=
130601_225651.log
>>=20
>> qemux86 Summary: 18 tasks failed:
>> =
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20=
130603_011743.log/
>>=20
>> qemux86-64: Summary: 21 tasks failed:
>> =
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20=
130602_103752.log
>=20
> There weren't many (any) changes merged to meta-oe last week, I hope =
to
> get better builds now (started few minutes ago).
>=20
> qemuarm Summary: 14 tasks failed:
> =
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20=
130610_065148.log/
>=20
> qemux86 Summary: 17 tasks failed:
> =
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20=
130608_071258.log/
>=20
> qemux86-64 Summary: 18 tasks failed:
> =
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20=
130609_081044.log/
>=20
> common:
>  meta-openembedded/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb, =
do_package
>  =
meta-openembedded/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.3=
2.1.bb, do_compile
>  openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb, =
do_package
>  =
meta-openembedded/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb,=
 do_compile
>  meta-openembedded/meta-oe/recipes-navigation/omgps/omgps_svn.bb, =
do_compile
>  meta-openembedded/meta-oe/recipes-navigation/gypsy/gypsy_0.9.bb, =
do_compile
>  meta-openembedded/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb, =
do_compile
>  meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.5.8.bb, =
do_configure
>  =
meta-openembedded/meta-networking/recipes-support/ipsec-tools/ipsec-tools_=
0.7.2.bb, do_compile
>=20
> qemux86 common:
>  meta-openembedded/meta-oe/recipes-support/ode/ode_0.9.bb, =
do_configure
>  openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package
>  =
openembedded-core/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.=
6.bb, do_compile
>=20
> qemuarm:
>  meta-openembedded/meta-oe/recipes-support/libunwind/libunwind_1.1.bb, =
do_compile
>  openembedded-core/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb, =
do_compile
>  =
meta-openembedded/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb, =
do_compile
>  openembedded-core/meta/recipes-devtools/qemu/qemu_1.4.1.bb, =
do_compile
>  =
meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb, =
do_compile
>=20
> qemux86:
>  openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb, =
do_configure
>  openembedded-core/meta/recipes-devtools/cmake/cmake-native_2.8.11.bb, =
do_configure
>  =
meta-openembedded/meta-gnome/recipes-support/goffice/goffice_0.10.1.bb, =
do_configure
>  openembedded-core/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb, =
do_compile
>  =
meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.=
11.14.bb, do_compile
>=20
> qemux86-64
>  meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, =
do_compile
>  =
meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libimobile=
device_1.1.4.bb, do_configure
>  meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, =
do_compile
>  openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package
>  =
meta-openembedded/meta-gnome/recipes-gnome/gnome-session/gnome-session_2.3=
2.1.bb, do_compile

yesterday I have send couple of patches that should fix those gnome =
related failures.


>  =
meta-openembedded/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb, =
do_compile
>  =
meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb, =
do_compile
>  =
openembedded-core/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.=
6.bb, do_compile
>=20



> And the list of QA issues:
> samba-3.6.8: Fixup Perms: Unable to correct directory link, target =
already exists: /var/run -> /run
> samba-3.6.8: samba: Files/directories were installed but not shipped
>  /run
>  /run/lock
> base-files-3.0.14: Fixup Perms: Unable to correct directory link, =
target already exists: /var/log -> /var/volatile/log
> base-files-3.0.14: Fixup Perms: Unable to correct directory link, =
target already exists: /var/run -> /run
> base-files-3.0.14: Fixup Perms: Unable to correct directory link, =
target already exists: /var/tmp -> /var/volatile/tmp
> usbmuxd-git: usbmuxd: Files/directories were installed but not shipped
>  /usr/lib64
>  /usr/lib64/libusbmuxd.so
>  /usr/lib64/libusbmuxd.so.1.0.8
>  /usr/lib64/libusbmuxd.so.2
>  /usr/lib64/pkgconfig
>  /usr/lib64/.debug
>  /usr/lib64/pkgconfig/libusbmuxd.pc
>  /usr/lib64/.debug/libusbmuxd.so.1.0.8
> imagemagick-6.8.5: imagemagick: Files/directories were installed but =
not shipped
>  /usr/lib/ImageMagick-6.8.5
>  /usr/lib/ImageMagick-6.8.5/config-Q16
>  /usr/lib/ImageMagick-6.8.5/config-Q16/configure.xml
>  /usr/share/ImageMagick-6
>  /usr/share/ImageMagick-6/locale.xml
>  /usr/share/ImageMagick-6/francais.xml
>  /usr/share/ImageMagick-6/english.xml
> openldap-2.4.23: openldap: Files/directories were installed but not =
shipped
>  /run
> networkmanager-0.9.8.0: networkmanager: Files/directories were =
installed but not shipped
>  /run
>  /run/NetworkManager
> hiawatha-9.1: hiawatha: Files/directories were installed but not =
shipped
>  /run
> oscam-1.10+7974: File '/usr/bin/oscam' from oscam was already =
stripped, this will prevent future debugging!
> cherokee-1.2.98: cherokee: Files/directories were installed but not =
shipped
>  /run
> gdm-2.32.2: gdm: Files/directories were installed but not shipped
>  /run
>  /run/gdm
>  /run/gdm/greeter
> nostromo-1.9.5: nostromo: Files/directories were installed but not =
shipped
>  /run
>  /run/nostromo
> collectd-5.2.2: collectd: Files/directories were installed but not =
shipped
>  /run
> lmbench-3.0-a9: lmbench: Files/directories were installed but not =
shipped
>  /run
>  /run/lmbench
> android-initscripts-1.0: android-initscripts: Files/directories were =
installed but not shipped
>  /android_finish
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


