Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id BE9A760E68;
	Tue,  1 Apr 2014 01:50:45 +0000 (UTC)
Received: by mail-we0-f175.google.com with SMTP id q58so5452266wes.6
	for <multiple recipients>; Mon, 31 Mar 2014 18:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Luat2PlIFeVGsBcHaERcZ5AiS8GvLIy+p4lxh0526ek=;
	b=Ptv4gLn9xhHCSaV8CGdWY6mfLx/rPPkmAwBDHgWI8sO4rTQO8Uj8GA4BUixUdiSvxX
	JluUElZQUvNYUYgWCF+0t/REgXNFlSrwX8X8xosWlY5L2YpZhjrycKzQ8FWLRG5dJbsS
	686JQp/rYAhn7bKWMw7x+KaIaRI3eh2tubHyBw5Jgh1q9GvWIQql9eZ1yzZuD+YhEI2G
	X129OrjLvZNs/CAJ0gJwhlEoGN8GgUQOLIaElSdXkAOyIkP0aYlpOFOevT//7iAoCbEl
	wZGOpV40X1qeBZCCoOEXNNsseHhaG+k/QpAq34bSThIsZza/9qz1/Svpr7FbsiGF1hEV
	4E4A==
X-Received: by 10.194.86.7 with SMTP id l7mr18320889wjz.37.1396317045880;
	Mon, 31 Mar 2014 18:50:45 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	a42sm36955679ees.10.2014.03.31.18.50.43 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Mar 2014 18:50:44 -0700 (PDT)
Date: Tue, 1 Apr 2014 03:50:44 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Adam Lee <adam.yh.lee@gmail.com>
Message-ID: <20140401015044.GJ2425@jama>
References: <20140329225432.GA2428@jama> <20140330002800.GC2428@jama>
	<CAFeBWL5+deT_P8_Cu_tdDqFJ+-gT-_A_qrv5pa9iJGWGZpj5Tw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFeBWL5+deT_P8_Cu_tdDqFJ+-gT-_A_qrv5pa9iJGWGZpj5Tw@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: State of bitbake world, Failed tasks 2014-03-29
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
X-List-Received-Date: Tue, 01 Apr 2014 01:50:48 -0000
X-Groupsio-MsgNum: 51968
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jITzwD3HDGXid3BE"
Content-Disposition: inline

--jITzwD3HDGXid3BE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2014 at 06:17:25PM -0700, Adam Lee wrote:
> I took a look into these three (in hopes of free beer):
>=20
> polkit-gnome: configure was passed unrecognised options:
> --disable-scrollkeeper --disable-man-pages
>=20
> gnome-bluetooth-2.32.0: gnome-bluetooth: configure was passed
> unrecognised options: --disable-schemas-install
>=20
> openobex-1.5: openobex: configure was passed unrecognised options:
> --with-usb --with-bluez
>=20
>=20
> And it looks like all three package recipes are more or less the same
> as the ones in Dora. So I am confused why they haven't come up before
> (say, in Dora). Are we doing more strict config flag checking anywhere
> that I am unaware of?

yes, infodir and unrecognized options weren't reported before (we even
had almost clean qa report around dora branch).

> Also, sound-theme-freedesktop has been blocking my build for a while. I s=
ee
> JaMa has a local commit, but I am not sure if that's the fix for the build
> failure we see in the report. Can someone provide tips on that nasty
> undefined macro?

yes, it's fixing that, I've also fixed most --disable-schemas-install
warnings and warnings about infodir, you can see latest changes I have
locally (and now running on jenkins) in:
https://github.com/shr-distribution/meta-oe/commits/jansa/test

I'll send them to ML when they pass at least first jenkins build without
causing more issues than what they are fixing.

> On Sat, Mar 29, 2014 at 5:28 PM, Martin Jansa <martin.jansa@gmail.com>wro=
te:
>=20
> > On Sat, Mar 29, 2014 at 11:54:32PM +0100, Martin Jansa wrote:
> > > On Wed, Mar 26, 2014 at 06:11:36PM +0100, Martin Jansa wrote:
> > > > On Sun, Mar 23, 2014 at 09:43:24PM +0100, Martin Jansa wrote:
> > > > > On Tue, Mar 18, 2014 at 07:50:08PM +0100, Martin Jansa wrote:
> > > > > > On Sat, Mar 15, 2014 at 03:10:46PM +0100, Martin Jansa wrote:
> > > > > > > On Tue, Mar 11, 2014 at 02:50:14PM +0100, Martin Jansa wrote:
> > > > > > > > On Tue, Mar 11, 2014 at 02:45:04PM +0100, Martin Jansa wrot=
e:
> > > > > > > > > Biggest difference from last e-mail is aclocal changes wh=
ich
> > can possibly explain
> > > > > > > > > increased number of do_configure failures, I've asked
> > Richard to delay merging B!=3DS
> > > > > > > > > change until we resolve or at least analyze these new
> > failures, so any help with
> > > > > > > > > would be highly appreciated.
> > >
> > > http://www.openembedded.org/wiki/Bitbake_World_Status
> > >
> > > =3D=3D Failed tasks 2014-03-29 =3D=3D
> >
> > Be aware that I plan to run test-dependencies script for next few days,
> > so changes to meta-oe will be delayed until it's finished and I can use
> > jenkins again to test incoming changes.
> >
> > If you want to do something really useful and you're not confident with
> > "big" changes, please scan qa.log files in URLs in report and send some
> > small patches to resolve unrecognized configure options (check the
> > configure
> > script if the option was replaced by something or if there is typo or if
> > it is applied by some bbclass which possibly shouldn't be used e.g.
> > gnome/gnombase). I offer beer on ELC for everybody who sends 10 changes
> > like this :).
> >
> > It won't show much, because a lot of recipes are still blocked by issues
> > listed bellow, but because release is close it's better to run it now
> > and fix at least found issues, before the release.
> >
> > I also have couple of local changes which I haven't sent yet, because
> > they aren't properly tested:
> >
> > f2e1f65 libgnomecanvas: add intltool dependency
> > cc3dac2 edbus: remove test-gui option
> > eff6aaa zram: include whole sysconfdir in PN
> > d308e37 atftp: include whole sysconfdir in PN
> > cdfd489 metacity: inherit only gnomebase
> > f415c1f gtksourceview2: inherit only gnomebase
> > 85550a0 goffice: inherit only gnomebase
> > 22a1a79 zenity: inherit only gnomebase
> > 29c844e gnome-themes: inherit only gnomebase
> > 561c24c gnome-backgrounds: inherit only gnomebase
> > 49fb47b gcr: inherit only gnomebase
> > b470935 modemmanager: inherit only gnomebase
> > bdc4cd9 libbonobo: inherit only gnomebase
> > 2b13d00 libgnome-keyring: inherit only gnomebase
> > fb2406f gnome-disk-utility: inherit only gnomebase
> > 58a1d87 libgdata: inherit only gnomebase
> > 6141925 libgtop: inherit only gnomebase
> > 8c021f1 gnome-bluetooth: inherit only gnomebase
> > 8723ea9 dconf: inherit only gnomebase
> > e63ca45 babl: inherit only gnomebase
> > bea1f1d gnome-menus: inherit only gnomebase
> > a33e667 wvstreams: fix QA warning
> > 7aa1b5e elementary: remove --disable-web
> > 6e3a7c8 libwnck*: inherit only gnomebase
> > 7855b14 tracker: inherit only gnomebase, fix QA warn
> > 3251a4e gnome-control-center: include datadir/mime in PN
> > 0ee66bb freerdp: move to nonworking
> > de68ce6 sound-theme-freedesktop: add glib-2.0 dependenecy
> > 5fac747 libdc1394: add libsdl dependency
> > 4609314 mplayer2: bump SRCREV to fix build issues with newer live555
> > e403bec gvfs-gdu-volume-monitor: Define build dependency on
> > libgnome-keyring
> >
> > If you have some patches for issues bellow and you haven't sent them
> > because
> > you want to test them more, please send them with [WIP] in subject and =
I'll
> > include them in master-next for test-depedencies build (better to test
> > recipe
> > which is possibly broken in runtime than not testing it and it's
> > dependents at
> > all)
> >
> > I'll probably start it on Wed and last time it took 11 days.
> >
> > > =3D=3D=3D common (23) =3D=3D=3D
> > >     * meta-openembedded/meta-gnome/recipes-gnome/devilspie/
> > devilspie2_0.24.bb, do_compile
> > >     * meta-openembedded/meta-gnome/recipes-gnome/libgnome/
> > libgnomecanvas_2.30.3.bb, do_configure
> > >     * meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/
> > xbmc_git.bb, do_compile
> > >     * meta-openembedded/meta-multimedia/recipes-multimedia/libdc1394/
> > libdc1394_git.bb, do_configure
> > >     * meta-openembedded/meta-networking/recipes-protocols/quagga/
> > quagga_0.99.21.bb, do_compile
> > >     * meta-openembedded/meta-networking/recipes-support/traceroute/
> > traceroute_2.0.18.bb, do_compile
> > >     * meta-openembedded/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb,
> > do_install
> > >     * meta-openembedded/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb,
> > do_compile
> > >     * meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb,
> > do_compile
> > >     * meta-openembedded/meta-oe/recipes-extended/gnuplot/
> > gnuplot_4.4.4.bb, do_compile
> > >     * meta-openembedded/meta-oe/recipes-extended/mml-widget/
> > gtkmathview_0.8.0.bb, do_compile
> > >     * meta-openembedded/meta-oe/recipes-multimedia/mplayer/
> > mplayer2_git.bb, do_configure
> > >     * meta-openembedded/meta-oe/recipes-multimedia/sound-themes/
> > sound-theme-freedesktop_0.8.bb, do_configure
> > >     * meta-openembedded/meta-oe/recipes-navigation/monav/monav_0.3.bb,
> > do_compile
> > >     * meta-openembedded/meta-oe/recipes-support/asio/asio_1.4.1.bb,
> > do_compile
> > >     * meta-openembedded/meta-oe/recipes-support/inih/libinih_git.bb,
> > do_install
> > >     * meta-openembedded/meta-oe/recipes-support/open-vcdiff/
> > open-vcdiff_0.8.3.bb, do_configure
> > >     * meta-openembedded/meta-xfce/recipes-apps/mousepad/
> > mousepad_0.3.0.bb, do_configure
> > >     * meta-openembedded/meta-xfce/recipes-apps/xarchiver/
> > xarchiver_git.bb, do_configure
> > >     * meta-openembedded/meta-xfce/recipes-apps/xfce4-taskmanager/
> > xfce4-taskmanager_git.bb, do_configure
> > >     * meta-openembedded/meta-xfce/recipes-panel-plugins/closebutton/
> > xfce4-closebutton-plugin_git.bb, do_configure
> > >     * meta-openembedded/meta-xfce/recipes-xfce/xfce4-settings/
> > xfce4-settings_git.bb, do_configure
> > >     * meta-openembedded/meta-xfce/recipes-xfce/xfwm4/xfwm4_git.bb,
> > do_configure
> > >
> > > =3D=3D=3D common-x86 (3) =3D=3D=3D
> > >     * meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb,
> > do_compile
> > >     * meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb,
> > do_compile
> > >     * openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package
> > >
> > > =3D=3D=3D qemuarm (3) =3D=3D=3D
> > >     * meta-openembedded/meta-oe/recipes-support/mongodb/mongodb_git.b=
b,
> > do_compile
> > >     * openembedded-core/meta/recipes-bsp/grub/grub_git.bb, do_package
> > >     * openembedded-core/meta/recipes-support/libunistring/
> > libunistring_0.9.3.bb, do_compile
> > >
> > > =3D=3D=3D qemux86 (1) =3D=3D=3D
> > >     * meta-openembedded/meta-initramfs/recipes-kernel/linux/
> > linux-yocto-tiny-kexecboot_3.10.bb, do_compile
> > >
> > > =3D=3D=3D qemux86_64 (1) =3D=3D=3D
> > >     * meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/
> > libimobiledevice_1.1.4.bb, do_configure
> > >
> > > =3D=3D=3D Number of failed tasks =3D=3D=3D
> > > {| class=3Dwikitable
> > > |-
> > > ||qemuarm       ||26    ||
> > http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches//log.worl=
d.20140327_005335.log/
> > > |-
> > > ||qemux86       ||27    ||
> > http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches//log.worl=
d.20140327_235230.log/
> > > |-
> > > ||qemux86_64    ||27    ||
> > http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches//log.worl=
d.20140329_001343.log/
> > > |}
> > >
> > > --
> > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> >
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> >
>=20
>=20
> On Sat, Mar 29, 2014 at 5:28 PM, Martin Jansa <martin.jansa@gmail.com>wro=
te:
>=20
> > On Sat, Mar 29, 2014 at 11:54:32PM +0100, Martin Jansa wrote:
> > > On Wed, Mar 26, 2014 at 06:11:36PM +0100, Martin Jansa wrote:
> > > > On Sun, Mar 23, 2014 at 09:43:24PM +0100, Martin Jansa wrote:
> > > > > On Tue, Mar 18, 2014 at 07:50:08PM +0100, Martin Jansa wrote:
> > > > > > On Sat, Mar 15, 2014 at 03:10:46PM +0100, Martin Jansa wrote:
> > > > > > > On Tue, Mar 11, 2014 at 02:50:14PM +0100, Martin Jansa wrote:
> > > > > > > > On Tue, Mar 11, 2014 at 02:45:04PM +0100, Martin Jansa wrot=
e:
> > > > > > > > > Biggest difference from last e-mail is aclocal changes wh=
ich
> > can possibly explain
> > > > > > > > > increased number of do_configure failures, I've asked
> > Richard to delay merging B!=3DS
> > > > > > > > > change until we resolve or at least analyze these new
> > failures, so any help with
> > > > > > > > > would be highly appreciated.
> > >
> > > http://www.openembedded.org/wiki/Bitbake_World_Status
> > >
> > > =3D=3D Failed tasks 2014-03-29 =3D=3D
> >
> > Be aware that I plan to run test-dependencies script for next few days,
> > so changes to meta-oe will be delayed until it's finished and I can use
> > jenkins again to test incoming changes.
> >
> > If you want to do something really useful and you're not confident with
> > "big" changes, please scan qa.log files in URLs in report and send some
> > small patches to resolve unrecognized configure options (check the
> > configure
> > script if the option was replaced by something or if there is typo or if
> > it is applied by some bbclass which possibly shouldn't be used e.g.
> > gnome/gnombase). I offer beer on ELC for everybody who sends 10 changes
> > like this :).
> >
> > It won't show much, because a lot of recipes are still blocked by issues
> > listed bellow, but because release is close it's better to run it now
> > and fix at least found issues, before the release.
> >
> > I also have couple of local changes which I haven't sent yet, because
> > they aren't properly tested:
> >
> > f2e1f65 libgnomecanvas: add intltool dependency
> > cc3dac2 edbus: remove test-gui option
> > eff6aaa zram: include whole sysconfdir in PN
> > d308e37 atftp: include whole sysconfdir in PN
> > cdfd489 metacity: inherit only gnomebase
> > f415c1f gtksourceview2: inherit only gnomebase
> > 85550a0 goffice: inherit only gnomebase
> > 22a1a79 zenity: inherit only gnomebase
> > 29c844e gnome-themes: inherit only gnomebase
> > 561c24c gnome-backgrounds: inherit only gnomebase
> > 49fb47b gcr: inherit only gnomebase
> > b470935 modemmanager: inherit only gnomebase
> > bdc4cd9 libbonobo: inherit only gnomebase
> > 2b13d00 libgnome-keyring: inherit only gnomebase
> > fb2406f gnome-disk-utility: inherit only gnomebase
> > 58a1d87 libgdata: inherit only gnomebase
> > 6141925 libgtop: inherit only gnomebase
> > 8c021f1 gnome-bluetooth: inherit only gnomebase
> > 8723ea9 dconf: inherit only gnomebase
> > e63ca45 babl: inherit only gnomebase
> > bea1f1d gnome-menus: inherit only gnomebase
> > a33e667 wvstreams: fix QA warning
> > 7aa1b5e elementary: remove --disable-web
> > 6e3a7c8 libwnck*: inherit only gnomebase
> > 7855b14 tracker: inherit only gnomebase, fix QA warn
> > 3251a4e gnome-control-center: include datadir/mime in PN
> > 0ee66bb freerdp: move to nonworking
> > de68ce6 sound-theme-freedesktop: add glib-2.0 dependenecy
> > 5fac747 libdc1394: add libsdl dependency
> > 4609314 mplayer2: bump SRCREV to fix build issues with newer live555
> > e403bec gvfs-gdu-volume-monitor: Define build dependency on
> > libgnome-keyring
> >
> > If you have some patches for issues bellow and you haven't sent them
> > because
> > you want to test them more, please send them with [WIP] in subject and =
I'll
> > include them in master-next for test-depedencies build (better to test
> > recipe
> > which is possibly broken in runtime than not testing it and it's
> > dependents at
> > all)
> >
> > I'll probably start it on Wed and last time it took 11 days.
> >
> > > =3D=3D=3D common (23) =3D=3D=3D
> > >     * meta-openembedded/meta-gnome/recipes-gnome/devilspie/
> > devilspie2_0.24.bb, do_compile
> > >     * meta-openembedded/meta-gnome/recipes-gnome/libgnome/
> > libgnomecanvas_2.30.3.bb, do_configure
> > >     * meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/
> > xbmc_git.bb, do_compile
> > >     * meta-openembedded/meta-multimedia/recipes-multimedia/libdc1394/
> > libdc1394_git.bb, do_configure
> > >     * meta-openembedded/meta-networking/recipes-protocols/quagga/
> > quagga_0.99.21.bb, do_compile
> > >     * meta-openembedded/meta-networking/recipes-support/traceroute/
> > traceroute_2.0.18.bb, do_compile
> > >     * meta-openembedded/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb,
> > do_install
> > >     * meta-openembedded/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb,
> > do_compile
> > >     * meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb,
> > do_compile
> > >     * meta-openembedded/meta-oe/recipes-extended/gnuplot/
> > gnuplot_4.4.4.bb, do_compile
> > >     * meta-openembedded/meta-oe/recipes-extended/mml-widget/
> > gtkmathview_0.8.0.bb, do_compile
> > >     * meta-openembedded/meta-oe/recipes-multimedia/mplayer/
> > mplayer2_git.bb, do_configure
> > >     * meta-openembedded/meta-oe/recipes-multimedia/sound-themes/
> > sound-theme-freedesktop_0.8.bb, do_configure
> > >     * meta-openembedded/meta-oe/recipes-navigation/monav/monav_0.3.bb,
> > do_compile
> > >     * meta-openembedded/meta-oe/recipes-support/asio/asio_1.4.1.bb,
> > do_compile
> > >     * meta-openembedded/meta-oe/recipes-support/inih/libinih_git.bb,
> > do_install
> > >     * meta-openembedded/meta-oe/recipes-support/open-vcdiff/
> > open-vcdiff_0.8.3.bb, do_configure
> > >     * meta-openembedded/meta-xfce/recipes-apps/mousepad/
> > mousepad_0.3.0.bb, do_configure
> > >     * meta-openembedded/meta-xfce/recipes-apps/xarchiver/
> > xarchiver_git.bb, do_configure
> > >     * meta-openembedded/meta-xfce/recipes-apps/xfce4-taskmanager/
> > xfce4-taskmanager_git.bb, do_configure
> > >     * meta-openembedded/meta-xfce/recipes-panel-plugins/closebutton/
> > xfce4-closebutton-plugin_git.bb, do_configure
> > >     * meta-openembedded/meta-xfce/recipes-xfce/xfce4-settings/
> > xfce4-settings_git.bb, do_configure
> > >     * meta-openembedded/meta-xfce/recipes-xfce/xfwm4/xfwm4_git.bb,
> > do_configure
> > >
> > > =3D=3D=3D common-x86 (3) =3D=3D=3D
> > >     * meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb,
> > do_compile
> > >     * meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb,
> > do_compile
> > >     * openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package
> > >
> > > =3D=3D=3D qemuarm (3) =3D=3D=3D
> > >     * meta-openembedded/meta-oe/recipes-support/mongodb/mongodb_git.b=
b,
> > do_compile
> > >     * openembedded-core/meta/recipes-bsp/grub/grub_git.bb, do_package
> > >     * openembedded-core/meta/recipes-support/libunistring/
> > libunistring_0.9.3.bb, do_compile
> > >
> > > =3D=3D=3D qemux86 (1) =3D=3D=3D
> > >     * meta-openembedded/meta-initramfs/recipes-kernel/linux/
> > linux-yocto-tiny-kexecboot_3.10.bb, do_compile
> > >
> > > =3D=3D=3D qemux86_64 (1) =3D=3D=3D
> > >     * meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/
> > libimobiledevice_1.1.4.bb, do_configure
> > >
> > > =3D=3D=3D Number of failed tasks =3D=3D=3D
> > > {| class=3Dwikitable
> > > |-
> > > ||qemuarm       ||26    ||
> > http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches//log.worl=
d.20140327_005335.log/
> > > |-
> > > ||qemux86       ||27    ||
> > http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches//log.worl=
d.20140327_235230.log/
> > > |-
> > > ||qemux86_64    ||27    ||
> > http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches//log.worl=
d.20140329_001343.log/
> > > |}
> > >
> > > --
> > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> >
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jITzwD3HDGXid3BE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlM6G3QACgkQN1Ujt2V2gBylXQCgjjUtHZFVbB4XrpaoVtz9aHmX
wfcAn2Z0dh4I9y7kAl9VXHX2hUel9KaQ
=3QoL
-----END PGP SIGNATURE-----

--jITzwD3HDGXid3BE--
