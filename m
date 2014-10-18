Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 201BA713AB;
	Sat, 18 Oct 2014 07:41:58 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id n3so3587785wiv.17
	for <multiple recipients>; Sat, 18 Oct 2014 00:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2+z4lIpbTMrLB1blK58brVgINOEwRxzcasyGOpw4UUI=;
	b=m0P62yHrWv1/Cxr0sccH7u7mv6napR+crhtYUBkvn6X5qjNV0Dc+jBBq99gRnj2hY2
	fVCYrqaHfzhEeOgAJPIQSoKhlAbMw9oZJTmxd7X+HRWY1FFaQQiLgbLdCbokIciYgwLW
	F8DPxdlPvdcipLTUirAPUe+u7fRQdiZV+ulX2SvFLavm6ylz0WcCT/LhNbpHO1dH9dIZ
	XMjIHc3TnIW0k7MAp/DCAnMiSgKB3Vac2w2YNJkzcF53YrbhAEZu6I03cIpXYTLZvS3G
	uMEbp6ODoAf13lZVQ84ulZgMeZ0G3INLbM9RGy6botqkSXNAv0V3+PbAnROuG5Nx4IRz
	XQJA==
X-Received: by 10.180.205.171 with SMTP id lh11mr4389792wic.66.1413618119025; 
	Sat, 18 Oct 2014 00:41:59 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id l5sm2136459wif.3.2014.10.18.00.41.58
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Oct 2014 00:41:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 18 Oct 2014 09:41:58 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20141018074158.GA2437@jama>
References: <20141013075652.GE3000@jama>
MIME-Version: 1.0
In-Reply-To: <20141013075652.GE3000@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: State of bitbake world, Failed tasks 2014-10-13, QA issues
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
X-List-Received-Date: Sat, 18 Oct 2014 07:41:59 -0000
X-Groupsio-MsgNum: 58706
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KsGdsel6WgEHnImy"
Content-Disposition: inline

--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2014 at 09:56:52AM +0200, Martin Jansa wrote:
> http://www.openembedded.org/wiki/Bitbake_World_Status
>=20
> =3D=3D Failed tasks 2014-10-13 =3D=3D
>=20
> =3D=3D=3D common () =3D=3D=3D
>=20
> =3D=3D=3D common-x86 (0) =3D=3D=3D
>=20
> =3D=3D=3D qemuarm (0) =3D=3D=3D
>=20
> =3D=3D=3D qemux86 (0) =3D=3D=3D
>=20
> =3D=3D=3D qemux86_64 (0) =3D=3D=3D

Khem had good idea to list also all blacklisted recipes (which should be
fixed)

meta-filesystems/recipes-filesystems/ifuse/ifuse_1.1.2.bb:PNBLACKLIST[ifuse=
] =3D "depends on blacklisted libimobiledevice"
meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb:PNBLACKLIST[gn=
ome-mplayer] =3D "rdepends on blacklisted mplayer"
meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb:PNBLACKLIST[gcr] =3D "CONFLICT: 4=
 files conflict with gnome-keyring"
meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb:PNBLACKLIST[gno=
me-menus3] =3D "CONFLICT: 24 files are conflicting with gnome-menus"
meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb:PNBLACKLIST[gnom=
e-panel3] =3D "CONFLICT: depends on libgweather3 which conflicts with libgw=
eather"
meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb:PNBLACKLIST[libgwea=
ther3] =3D "CONFLICT: 876 files are conflicting with libgweather"
meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb:PNBLACKLIST[zenity] =3D "B=
ROKEN: doesn't build with B!=3DS"
meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb:PNBLACKLIST[xbmc] =3D =
"/usr/include/c++/ctime:70:11: error: '::gmtime' has not been declared"
meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb:PNBLACKLIST=
[coriander] =3D "BROKEN: fails to use SDL probably because libsdl-config wa=
s removed, error: unknown type name 'SDL_Overlay'"
meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb:PN=
BLACKLIST[renderer-service-upnp] =3D "BROKEN: doesn't build with B!=3DS (tr=
ying to install rendererconsole.py from ${B} instead of ${S})"
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb:PNBLACK=
LIST[lksctp-tools] =3D "BROKEN: fails to link against sctp_connectx symbol"
meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb:PNB=
LACKLIST[libimobiledevice] =3D "cannot run test program while cross compili=
ng"
meta-oe/recipes-connectivity/soft66/soft66_git.bb:PNBLACKLIST[soft66] =3D "=
BROKEN: depends on broken libftdi"
meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb:PNBLACKLIST[zeroc=
-ice] =3D "BROKEN: not compatible with default db version"
meta-oe/recipes-extended/subsurface/subsurface_git.bb:PNBLACKLIST[subsurfac=
e] =3D "Needs to be upgraded for compatibility with new libdivecomputer"
meta-oe/recipes-extended/zsh/zsh.inc:PNBLACKLIST[zsh] =3D "BROKEN: doesn't =
build with B!=3DS (gnu-configize executed in ${B})"
meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb:PNBLACKLIST[clutter-b=
ox2d] =3D "BROKEN: doesn't build with B!=3DS"
meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb:PNBLACKLIST[fim] =3D "BROKEN: d=
oesn't build with B!=3DS (flex: can't open lex.lex)"
meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb:PNBLACKLIST[xf8=
6-input-mtev] =3D "BROKEN: doesn't build with B!=3DS (Makefile without ${S}=
 in sed call)"
meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb:PNBLACKLIST[mplayer2] =
=3D "Requires newer libav which has negative D_P"
meta-oe/recipes-navigation/omgps/omgps_svn.bb:PNBLACKLIST[omgps] =3D "BROKE=
N: sound.c:61:35: error: 'saveptr' may be used uninitialized in this functi=
on [-Werror=3Dmaybe-uninitialized]"
meta-oe/recipes-qt/qconnman/qconnman-e_git.bb:PNBLACKLIST[qconnman-e] =3D "=
BROKEN: doesn't work with B!=3DS, ls: cannot access *.pro: No such file or =
directory"
meta-oe/recipes-qt/qconnman/qconnman_git.bb:PNBLACKLIST[qconnman] =3D "BROK=
EN: doesn't work with B!=3DS, ls: cannot access *.pro: No such file or dire=
ctory"
meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb:PNBLACKLIST[sylpheed] =3D=
 "BROKEN: Doesn't work with B!=3DS"
meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb:PNBLACKLIST[apcupsd] =3D=
 "BROKEN: doesn't build with B!=3DS"
meta-oe/recipes-support/emacs/emacs_23.4.bb:PNBLACKLIST[emacs] =3D "qemu: u=
ncaught target signal 11 (Segmentation fault) - core dumped"
meta-oe/recipes-support/libftdi/libftdi_0.19.bb:PNBLACKLIST[libftdi] =3D "B=
ROKEN: needs to be updated to detect libusb with pkg-config instead of libu=
sb-config"
meta-oe/recipes-support/maliit/maliit-framework_git.bb:PNBLACKLIST[maliit-f=
ramework] =3D "BROKEN: Wasn't updated to work with B!=3DS, maybe incorrectl=
y inherits autotools"
meta-oe/recipes-support/maliit/maliit-plugins_git.bb:PNBLACKLIST[maliit-plu=
gins] =3D "BROKEN: depends on broken maliit-framework"
meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb:PNBLACKLIST[openmotif]=
 =3D "BROKEN: doesn't build with B!=3DS"
meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb:PNBLACKLIST[vala=
-terminal] =3D "BROKEN: Doesn't work with B!=3DS, touch: cannot touch `src/=
=2Estamp': No such file or directory"
meta-webserver/recipes-php/modphp/modphp5.inc:PNBLACKLIST[modphp] =3D "CONF=
LICT: 466 header files conflict with php"
meta-webserver/recipes-php/xdebug/xdebug_2.2.5.bb:PNBLACKLIST[xdebug] =3D "=
CONFLICT: depends on blocked modphp"

My world builds are also using some pending changes for oe-core:
pick e48e7c3 qemux86: Add identical qemux86copy variant for tests
pick adfa159 WIP: Add KERNEL_EXTRA_ARGS?
pick 740db8a libsdl: Add support for libsdl-native
pick 3b301ea report-error: Allow to upload reports automatically
pick 25641a4 DO-NOT-MERGE: distutils3.bbclass: Don't use MACHINE variable
pick 7fdd1da gdb: force arm mode
pick e61f0dc icu: force arm mode
pick a04bf08 gst-ffmpeg: add dependency on libpostproc
pick 11cca8b libav: drop unused FFMPEG_LIBS and move libpostproc only to 0.=
8.11
pick c87b7a5 xorg-app: add x11 to required DISTRO_FEATURES and cleanup depe=
ndencies
pick 23f0eaf recipes: add x11 to required DISTRO_FEATURES
pick 1284a10 xorg-driver: add x11 to required DISTRO_FEATURES
pick 38bd8f1 recipes-qt: add x11 to required DISTRO_FEATURES
pick 69efd15 resolvconf: Drop allarch
pick f33e65a usbinit, weston-init, run-postinsts, qt-demo-init: Drop allarch
pick 9035c1a ppp-dialin: Drop allarch
pick 3532862 linux-firmware: Drop allarch
pick a5e0955 initramfs-framework: Drop allarch
pick 98d62fa libav: drop older 0.8.11 and use libav-9 by default
pick 6ca40f7 systemd: don't move libgudev around, it breaks libgudev-1.0.la

so don't expect the list to be empty if you try to reproduce it with oe-cor=
e/master or poky.

--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRCGcYACgkQN1Ujt2V2gByDpwCcC+MNb4oceAkuiI884zedwqFM
bgwAnR7qyVRlLanZfbjc42MbFQjL33jc
=d1Eu
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--
