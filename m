Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tbqo9-0007WO-8b
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Nov 2012 11:48:29 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so4929925eei.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2012 02:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=AhiWTe+b0jesr8SKMiK7Ek3CZDeihTF2v45NjAvU3QY=;
	b=fMrFLt1Wvg7iT51n9lJV0QmBMS/dUJ1CIpuqAsCS3IhAbGgwXv0Ujumf+bEL0AWXjS
	XUrBJ579JFZzGfCgSQtOL5FJ0GWBsLZdpxWnF0z2/koYXYeHfHXg0o1IKI2fk8ObT/Sx
	sASmjUx3mmvTXfTmcKm2TePLBTEnitpFUlOMZolY4Bv3wfiFBi2PREvdWBgLW3kiV//M
	g3hXueaE5PEUvdJRZWa0cjAAGkDBYYbcteB8THzKvRc6789d0fpWzGT5eDT72zgOlofA
	qpKwk/bLH2sFIPG7EfDGuujFwciZ4tRR3rg1Ve5XO/y7soNaz2iFyqUTGfbln61ettXO
	nc6Q==
Received: by 10.14.221.9 with SMTP id q9mr12376444eep.3.1353666861813;
	Fri, 23 Nov 2012 02:34:21 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o47sm12764415eem.11.2012.11.23.02.34.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Nov 2012 02:34:21 -0800 (PST)
Date: Fri, 23 Nov 2012 11:34:21 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Nicolas Dechesne <ndec13@gmail.com>
Message-ID: <20121123103421.GK12637@jama.jama.net>
References: <cover.1353631583.git.Martin.Jansa@gmail.com>
	<CAOT3miLTTjGDPTj=dbNgnTvKXSg3bc+CL5nu8ASfEgMtxZBdHg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOT3miLTTjGDPTj=dbNgnTvKXSg3bc+CL5nu8ASfEgMtxZBdHg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] Fixes for xserver and omap* drivers
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
X-List-Received-Date: Fri, 23 Nov 2012 10:48:29 -0000
X-Groupsio-MsgNum: 31705
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SMcH7s1wxTzO87UA"
Content-Disposition: inline

--SMcH7s1wxTzO87UA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 23, 2012 at 11:18:50AM +0100, Nicolas Dechesne wrote:
> hi,
>=20
> On Fri, Nov 23, 2012 at 1:47 AM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > Martin Jansa (4):
> >   xf86-video-omap: add xf86driproto dependency, drop --enable-neon and
> >     improve DESCRIPTION
> >   xserver-xorg: disable dri2 too when building without glx
> >     PACKAGECONFIG
> >   xf86-video-omapfb: revive driver which actually works and is tested
> >     on real devices
> >   xf86-video-omap: drop RPROVIDES/RREPLACES/RCONFLICTS
>=20
> so, I have tested this serie on pandaboard, using meta-ti layer for
> the BSP and poky (i used master-next branch which has these patches).
> I have tested with a couple of patches that I sent to meta-ti to
> revert the xf86-video-omap that we had in meta-ti. For the reference,
> i tested with this:
> https://github.com/ndechesne/meta-ti/commits/test_new_xf-v-o (my new
> patches aren't merged yet in master).
>=20
> i tested with xf86-video-omap, not -omapfb, and with a v3.4 kernel
> which I know has a working omapdrm driver.
>=20
> it all looks good, the driver is loaded, and I tested resolution
> change, as well as rotation , both with xrandr command (i tested
> core-image-x11 image).
>=20
> many thanks for sorting this out...
>=20
> i have some questions... xf86-video-omap now clearly depends on opengl
> DISTRO_FEATURE (since dri cannot be disabled) for the xserver build.
> So if i build oe-core + meta-ti, it won't build as the xserver is
> built without dri/glx support there, and then xf86-video-omap won't
> build.

True, unfortunately without 2/4 it did build in some cases, but that
should be sorted now and fail in deterministic way. I think that without
configure.patch in xf86-video-omap it would fail in do_configure already
not in do_compile.

Maybe configure.patch should be reworked to only change AC_CHECK_FILE to
"test -f" instead of changing configure.ac so much, but I'll keep that
for Ross and upstream to decide.

>  - how should we handle that? it doesn't sound quite right to enfore a
> DISTRO feature in a recipe... but is it possible to have a check for
> opengl in the recipe? that would avoid a more cryptic build error..

I think that python fragment with SkipPackage when opengl is not in=20
DISTRO_FEATURE could improve that, but that's not 100% correct too as
distro can change xserver PACKAGECONFIG (add glx) even without opengl in
DISTRO_FEATURES).

Maybe add PACKAGECONFIG[glx] to xf86-video-omap with initial value set
by opengl DISTRO_FEATURE (like xserver) does and then SkipPackage when
it's not enabled.

>  - how can I make an oe-core+meta-ti to build for Panda with this
> video driver? e.g. where should I set this DISTRO_FEATURE in meta-ti,
> outside of 'poky' distro, e.g. in a BSP layer?. I recall that we have
> this in the xserver recipe:
>=20
> PACKAGECONFIG ??=3D "udev ${@base_contains('DISTRO_FEATURES', 'opengl',
> 'glx', '', d)}"
> PACKAGECONFIG[udev] =3D "--enable-config-udev,--disable-config-udev,udev"
> PACKAGECONFIG[glx] =3D "--enable-dri --enable-dri2 --enable-glx --enable-=
glx-tls,\
>                       --disable-dri --disable-dri2 --disable-glx,\
>                       xf86driproto dri2proto mesa-dri"

Changing DISTRO_FEATURE in bsp layer is bad idea, proper error message
should be enough to notify distro maintainer that something is missing
in DISTRO_FEATURES/PACKAGECONFIG.

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--SMcH7s1wxTzO87UA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCvUS0ACgkQN1Ujt2V2gByMWACgrV8qd3bpnPwFsx90Jgj/Plyh
O7sAoJK8R9f87gQ/L9/ZPMlHvxijf15x
=Qui4
-----END PGP SIGNATURE-----

--SMcH7s1wxTzO87UA--
