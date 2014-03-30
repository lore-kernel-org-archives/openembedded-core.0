Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id A9FA160DFA;
	Sun, 30 Mar 2014 00:27:56 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id c41so5267220eek.22
	for <multiple recipients>; Sat, 29 Mar 2014 17:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ByXWvd4UYRvYL4tEqnL2OKw/nooA8hLCpBIglgILROA=;
	b=djm/j+YHyyYj6DsQn66LTQh0CMzA7vhtuZDlfxceQUECX7lJa36dsjCb2QKmHhVPVJ
	//zt60PrPynQ7FJHjCaVgZv1rFKc0K36Zpsv6RV5gwx48sVWTuhoMXF1UDHsBrnB+cqC
	ZPA+qtBAUloVOdDR3cfqt/RmrfFB6ZsYYnRpbP2B6+NAdfnF7Qxb7JUQ4DI7Tt0W3cB2
	Npycki3ZI1bJ8nbAu+hT5c5Xi6/JAcMhNMg7gwV35Q69yWjWhK5LhXHu4RkbYrEX6kLO
	eTWat2L/TNP6NJH+1cFsHrT1hxoaJHINNnczeHzIuRxb+KROzXoddWUrKqfjEYSdpQQf
	HB8g==
X-Received: by 10.14.206.137 with SMTP id l9mr20509151eeo.40.1396139277499;
	Sat, 29 Mar 2014 17:27:57 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	y7sm22068984eev.5.2014.03.29.17.27.56 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 29 Mar 2014 17:27:56 -0700 (PDT)
Date: Sun, 30 Mar 2014 01:28:00 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140330002800.GC2428@jama>
References: <20140329225432.GA2428@jama>
MIME-Version: 1.0
In-Reply-To: <20140329225432.GA2428@jama>
User-Agent: Mutt/1.5.22 (2013-10-16)
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
X-List-Received-Date: Sun, 30 Mar 2014 00:28:00 -0000
X-Groupsio-MsgNum: 51864
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4ZLFUWh1odzi/v6L"
Content-Disposition: inline

--4ZLFUWh1odzi/v6L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 29, 2014 at 11:54:32PM +0100, Martin Jansa wrote:
> On Wed, Mar 26, 2014 at 06:11:36PM +0100, Martin Jansa wrote:
> > On Sun, Mar 23, 2014 at 09:43:24PM +0100, Martin Jansa wrote:
> > > On Tue, Mar 18, 2014 at 07:50:08PM +0100, Martin Jansa wrote:
> > > > On Sat, Mar 15, 2014 at 03:10:46PM +0100, Martin Jansa wrote:
> > > > > On Tue, Mar 11, 2014 at 02:50:14PM +0100, Martin Jansa wrote:
> > > > > > On Tue, Mar 11, 2014 at 02:45:04PM +0100, Martin Jansa wrote:
> > > > > > > Biggest difference from last e-mail is aclocal changes which =
can possibly explain
> > > > > > > increased number of do_configure failures, I've asked Richard=
 to delay merging B!=3DS
> > > > > > > change until we resolve or at least analyze these new failure=
s, so any help with
> > > > > > > would be highly appreciated.
>=20
> http://www.openembedded.org/wiki/Bitbake_World_Status
>=20
> =3D=3D Failed tasks 2014-03-29 =3D=3D

Be aware that I plan to run test-dependencies script for next few days,
so changes to meta-oe will be delayed until it's finished and I can use
jenkins again to test incoming changes.

If you want to do something really useful and you're not confident with
"big" changes, please scan qa.log files in URLs in report and send some
small patches to resolve unrecognized configure options (check the configure
script if the option was replaced by something or if there is typo or if
it is applied by some bbclass which possibly shouldn't be used e.g.
gnome/gnombase). I offer beer on ELC for everybody who sends 10 changes
like this :).

It won't show much, because a lot of recipes are still blocked by issues
listed bellow, but because release is close it's better to run it now
and fix at least found issues, before the release.

I also have couple of local changes which I haven't sent yet, because
they aren't properly tested:

f2e1f65 libgnomecanvas: add intltool dependency
cc3dac2 edbus: remove test-gui option
eff6aaa zram: include whole sysconfdir in PN
d308e37 atftp: include whole sysconfdir in PN
cdfd489 metacity: inherit only gnomebase
f415c1f gtksourceview2: inherit only gnomebase
85550a0 goffice: inherit only gnomebase
22a1a79 zenity: inherit only gnomebase
29c844e gnome-themes: inherit only gnomebase
561c24c gnome-backgrounds: inherit only gnomebase
49fb47b gcr: inherit only gnomebase
b470935 modemmanager: inherit only gnomebase
bdc4cd9 libbonobo: inherit only gnomebase
2b13d00 libgnome-keyring: inherit only gnomebase
fb2406f gnome-disk-utility: inherit only gnomebase
58a1d87 libgdata: inherit only gnomebase
6141925 libgtop: inherit only gnomebase
8c021f1 gnome-bluetooth: inherit only gnomebase
8723ea9 dconf: inherit only gnomebase
e63ca45 babl: inherit only gnomebase
bea1f1d gnome-menus: inherit only gnomebase
a33e667 wvstreams: fix QA warning
7aa1b5e elementary: remove --disable-web
6e3a7c8 libwnck*: inherit only gnomebase
7855b14 tracker: inherit only gnomebase, fix QA warn
3251a4e gnome-control-center: include datadir/mime in PN
0ee66bb freerdp: move to nonworking
de68ce6 sound-theme-freedesktop: add glib-2.0 dependenecy
5fac747 libdc1394: add libsdl dependency
4609314 mplayer2: bump SRCREV to fix build issues with newer live555
e403bec gvfs-gdu-volume-monitor: Define build dependency on libgnome-keyring

If you have some patches for issues bellow and you haven't sent them because
you want to test them more, please send them with [WIP] in subject and I'll
include them in master-next for test-depedencies build (better to test reci=
pe
which is possibly broken in runtime than not testing it and it's dependents=
 at
all)

I'll probably start it on Wed and last time it took 11 days.

> =3D=3D=3D common (23) =3D=3D=3D
>     * meta-openembedded/meta-gnome/recipes-gnome/devilspie/devilspie2_0.2=
4.bb, do_compile
>     * meta-openembedded/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_=
2.30.3.bb, do_configure
>     * meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git=
=2Ebb, do_compile
>     * meta-openembedded/meta-multimedia/recipes-multimedia/libdc1394/libd=
c1394_git.bb, do_configure
>     * meta-openembedded/meta-networking/recipes-protocols/quagga/quagga_0=
=2E99.21.bb, do_compile
>     * meta-openembedded/meta-networking/recipes-support/traceroute/tracer=
oute_2.0.18.bb, do_compile
>     * meta-openembedded/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb, do=
_install
>     * meta-openembedded/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb, do=
_compile
>     * meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb, do_co=
mpile
>     * meta-openembedded/meta-oe/recipes-extended/gnuplot/gnuplot_4.4.4.bb=
, do_compile
>     * meta-openembedded/meta-oe/recipes-extended/mml-widget/gtkmathview_0=
=2E8.0.bb, do_compile
>     * meta-openembedded/meta-oe/recipes-multimedia/mplayer/mplayer2_git.b=
b, do_configure
>     * meta-openembedded/meta-oe/recipes-multimedia/sound-themes/sound-the=
me-freedesktop_0.8.bb, do_configure
>     * meta-openembedded/meta-oe/recipes-navigation/monav/monav_0.3.bb, do=
_compile
>     * meta-openembedded/meta-oe/recipes-support/asio/asio_1.4.1.bb, do_co=
mpile
>     * meta-openembedded/meta-oe/recipes-support/inih/libinih_git.bb, do_i=
nstall
>     * meta-openembedded/meta-oe/recipes-support/open-vcdiff/open-vcdiff_0=
=2E8.3.bb, do_configure
>     * meta-openembedded/meta-xfce/recipes-apps/mousepad/mousepad_0.3.0.bb=
, do_configure
>     * meta-openembedded/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb=
, do_configure
>     * meta-openembedded/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-ta=
skmanager_git.bb, do_configure
>     * meta-openembedded/meta-xfce/recipes-panel-plugins/closebutton/xfce4=
-closebutton-plugin_git.bb, do_configure
>     * meta-openembedded/meta-xfce/recipes-xfce/xfce4-settings/xfce4-setti=
ngs_git.bb, do_configure
>     * meta-openembedded/meta-xfce/recipes-xfce/xfwm4/xfwm4_git.bb, do_con=
figure
>=20
> =3D=3D=3D common-x86 (3) =3D=3D=3D
>     * meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_comp=
ile
>     * meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_c=
ompile
>     * openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package
>=20
> =3D=3D=3D qemuarm (3) =3D=3D=3D
>     * meta-openembedded/meta-oe/recipes-support/mongodb/mongodb_git.bb, d=
o_compile
>     * openembedded-core/meta/recipes-bsp/grub/grub_git.bb, do_package
>     * openembedded-core/meta/recipes-support/libunistring/libunistring_0.=
9.3.bb, do_compile
>=20
> =3D=3D=3D qemux86 (1) =3D=3D=3D
>     * meta-openembedded/meta-initramfs/recipes-kernel/linux/linux-yocto-t=
iny-kexecboot_3.10.bb, do_compile
>=20
> =3D=3D=3D qemux86_64 (1) =3D=3D=3D
>     * meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/lib=
imobiledevice_1.1.4.bb, do_configure
>=20
> =3D=3D=3D Number of failed tasks =3D=3D=3D
> {| class=3Dwikitable
> |-
> ||qemuarm       ||26    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr=
-core-branches//log.world.20140327_005335.log/
> |-
> ||qemux86       ||27    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr=
-core-branches//log.world.20140327_235230.log/
> |-
> ||qemux86_64    ||27    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr=
-core-branches//log.world.20140329_001343.log/
> |}
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4ZLFUWh1odzi/v6L
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlM3ZRAACgkQN1Ujt2V2gBxIRQCdFB9Sp3w9r0i/VLF/0wT5lqc4
K40AoK9GLW17hfecWXqdARlmQFAbPzrO
=z2bv
-----END PGP SIGNATURE-----

--4ZLFUWh1odzi/v6L--
