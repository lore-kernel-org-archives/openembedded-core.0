Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TBJVk-0000Rf-Q9
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 07:59:48 +0200
Received: by wibhq4 with SMTP id hq4so2674774wib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2012 22:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=W7P8mLcoxWsuRZKgALXf13foi5quBprayw9EEkJwKJY=;
	b=omQCcSrwzMSIoW6RoiyG6voTMAOZJnhgWAR1fuQZW2amRxK0w2K2RVbmpaKd6l6wU+
	BBPafFESYUG4Ua6hLODgu15PkrGFeFpHwaxF0Pnc61N/NdFLhbbZvUwNC3UFGC49vEbh
	JEjyXOiyXd2lKE/kaMrh88HdTj131ujMc7et+fe1sHUYAPsGcQ4ffcmkpBRdeWJdv4lP
	vgT2SH1NukrVarFRLmzyNqehX0HBaTNHx+JUXudsB+CLnGfzfDe8O5IA6gdPNbQ4zd8s
	jhSvjevxC1rMNf54owPDvzIOH5+1ZIPmySS3QSBrf6J6ggP8botOULQ/46vm+kLvgPVb
	DNVw==
Received: by 10.216.132.25 with SMTP id n25mr8795693wei.25.1347342438300;
	Mon, 10 Sep 2012 22:47:18 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k20sm866715wiv.11.2012.09.10.22.47.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 10 Sep 2012 22:47:17 -0700 (PDT)
Date: Tue, 11 Sep 2012 07:47:17 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20120911054717.GA3465@jama.jama.net>
References: <1347297632-16529-1-git-send-email-ross.burton@intel.com>
	<1347297632-16529-3-git-send-email-ross.burton@intel.com>
	<1347309373.31154.1.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1347309373.31154.1.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] libx11: don't split libX11-xcb out into a libx11-xcb package
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
X-List-Received-Date: Tue, 11 Sep 2012 05:59:48 -0000
X-Groupsio-MsgNum: 29005
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="y0ulUmNC+osPPQO6"
Content-Disposition: inline

--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 10, 2012 at 09:36:13PM +0100, Richard Purdie wrote:
> On Mon, 2012-09-10 at 18:20 +0100, Ross Burton wrote:
> > As XCB is a hard requirement for libX11, and libX11-xcb.so is a depreca=
ted 3KB
> > .so, it's not worth splitting it into a separate package.
>=20
> 3kb is 3kb. If its deprecated, things will stop linking with it and
> nothing will depend on it and everyone will be happy as it fades into
> history.

And there is quite a few packages with libx11-xcb* in depends:
Package: pulseaudio*
Package: xdpyinfo
Package: gst-plugins-good-pulse
Package: libgnome-desktop-2-17
Package: libpulse-mainloop-glib0
Package: libpulse-simple0
Package: libpulse0
Package: libpulsecore
Package: libstartup-notification-1-0
Package: libx11-dev
Package: libx11-xcb1
Package: matchbox-panel-2

So if you really decide to merge it with libx11 then bump PR in all
those recipes too.

Cheers,

>=20
>=20
> > Signed-off-by: Ross Burton <ross.burton@intel.com>
> > ---
> >  meta/recipes-graphics/xorg-lib/libx11-trim_1.5.0.bb |    2 +-
> >  meta/recipes-graphics/xorg-lib/libx11.inc           |    3 ---
> >  meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb      |    2 +-
> >  3 files changed, 2 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/meta/recipes-graphics/xorg-lib/libx11-trim_1.5.0.bb b/meta=
/recipes-graphics/xorg-lib/libx11-trim_1.5.0.bb
> > index 3d5a306..c39b859 100644
> > --- a/meta/recipes-graphics/xorg-lib/libx11-trim_1.5.0.bb
> > +++ b/meta/recipes-graphics/xorg-lib/libx11-trim_1.5.0.bb
> > @@ -5,7 +5,7 @@ DESCRIPTION +=3D " Support for XCMS is disabled in this=
 version."
> >  LICENSE =3D "MIT & MIT-style & BSD"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D172255dee66bb0151435b2d5d70=
9fcf7"
> > =20
> > -PR =3D "r1"
> > +PR =3D "r2"
> > =20
> >  DEPENDS +=3D "libxcb xproto xextproto xtrans libxau kbproto inputproto=
 xf86bigfontproto xproto-native"
> > =20
> > diff --git a/meta/recipes-graphics/xorg-lib/libx11.inc b/meta/recipes-g=
raphics/xorg-lib/libx11.inc
> > index 592f116..bbbb29c 100644
> > --- a/meta/recipes-graphics/xorg-lib/libx11.inc
> > +++ b/meta/recipes-graphics/xorg-lib/libx11.inc
> > @@ -18,10 +18,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D172255dee=
66bb0151435b2d5d709fcf7"
> > =20
> >  EXTRA_OECONF +=3D "--with-groff=3Dno --with-ps2pdf=3Dno --with-fop=3Dn=
o --disable-specs"
> > =20
> > -PACKAGES =3D+ "${PN}-xcb"
> > -
> >  FILES_${PN} +=3D "${datadir}/X11/XKeysymDB ${datadir}/X11/XErrorDB ${l=
ibdir}/X11/Xcms.txt"
> > -FILES_${PN}-xcb +=3D "${libdir}/libX11-xcb.so.*"
> >  FILES_${PN}-locale +=3D "${datadir}/X11/locale ${libdir}/X11/locale"
> > =20
> >  do_compile_prepend() {
> > diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb b/meta/reci=
pes-graphics/xorg-lib/libx11_1.5.0.bb
> > index a65ab1f..e78d707 100644
> > --- a/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
> > +++ b/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
> > @@ -1,7 +1,7 @@
> >  require libx11.inc
> >  inherit gettext
> > =20
> > -PR =3D "r1"
> > +PR =3D "r2"
> > =20
> >  BBCLASSEXTEND =3D "native nativesdk"
> > =20
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--y0ulUmNC+osPPQO6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBO0GUACgkQN1Ujt2V2gBygKQCdHHUmsveSvtRU508EJleOKDml
FsUAoKOgWtE4de8xcIIJheVcAhwGp3dt
=sbYv
-----END PGP SIGNATURE-----

--y0ulUmNC+osPPQO6--
