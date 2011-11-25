Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RTqfj-0002s3-VA
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Nov 2011 08:58:12 +0100
Received: by wwo1 with SMTP id 1so4466655wwo.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2011 23:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=vo6Rw99d6+RZ8Bspz469AQANq8Noj0bsVB9ZQu5uOQk=;
	b=LbUyGTVDzpNi8/jTsIOXJg5RUoBo639R9wGfSHeQ7AvvOa8kjfv7jiNZ1b7vUCkqf2
	xpAyCN6xfwNgIx6BQDTkkdjeFbXbguXDsExhT6MjofkBG9SUHHLtsNLYhNnda7XiIsEw
	eIgyggTXLq2UJ8Ch5TnH8Q8+Y8K9IypcmVcS8=
Received: by 10.180.72.146 with SMTP id d18mr32814021wiv.12.1322207494657;
	Thu, 24 Nov 2011 23:51:34 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a27sm26949463wbp.16.2011.11.24.23.51.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Nov 2011 23:51:32 -0800 (PST)
Date: Fri, 25 Nov 2011 08:51:21 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111125075121.GX3565@jama.jama.net>
References: <cover.1321028799.git.Martin.Jansa@gmail.com>
	<d10d38e320b27bfbbf6d069e820a2b6c013bbbdc.1321028799.git.Martin.Jansa@gmail.com>
	<20111115234557.GD3600@jama.jama.net>
	<1321438335.26881.232.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1321438335.26881.232.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH][oe-core 14/22] libsdl: enable alsa/opengl based on PACKAGECONFIG and respect DISTRO_FEATURES
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
X-List-Received-Date: Fri, 25 Nov 2011 07:58:12 -0000
X-Groupsio-MsgNum: 12939
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="72btQdUC6twB1rwh"
Content-Disposition: inline

--72btQdUC6twB1rwh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 16, 2011 at 10:12:15AM +0000, Richard Purdie wrote:
> On Wed, 2011-11-16 at 00:45 +0100, Martin Jansa wrote:
> > On Fri, Nov 11, 2011 at 05:28:50PM +0100, Martin Jansa wrote:
> > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > ---
> > >  meta/recipes-graphics/libsdl/libsdl_1.2.14.bb |   10 +++++++---
> > >  1 files changed, 7 insertions(+), 3 deletions(-)
> > >=20
> > > diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb b/meta/rec=
ipes-graphics/libsdl/libsdl_1.2.14.bb
> > > index 17a3103..2f49f16 100644
> > > --- a/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
> > > +++ b/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
> > > @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D27818cd7=
fd83877a8e3ef82b82798ef4"
> > > =20
> > >  PROVIDES =3D "virtual/libsdl"
> > > =20
> > > -DEPENDS =3D "${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/=
libgl', '', d)} virtual/libx11 libxext libxrandr libxrender alsa-lib tslib"
> > > +DEPENDS =3D "virtual/libx11 libxext libxrandr libxrender tslib"
> > >  DEPENDS_virtclass-nativesdk =3D "libx11-nativesdk libxrandr-nativesd=
k libxrender-nativesdk libxext-nativesdk"
> >=20
> > As Saul reported PACKAGECONFIG adds build time depends not only to
> > DEPENDS but they also ends in DEPENDS_virtclass-nativesdk and nothing
> > provides virtual/libgl-nativesdk. So I've resend this patch changing
> > only alsa handling to PACKAGECONFIG and keeping opengl as it was.
> >=20
> > Cheers,
> >=20
> > >  PR =3D "r1"
> > > @@ -29,17 +29,21 @@ SRC_URI[sha256sum] =3D "5d927e287034cb6bb0ebccfa3=
82cb1d185cb113c8ab5115a0759798642
> > >  inherit autotools binconfig pkgconfig
> > > =20
> > >  EXTRA_OECONF =3D "--disable-static --disable-debug --enable-cdrom --=
enable-threads --enable-timers --enable-endian \
> > > -                --enable-file --disable-oss --enable-alsa --disable-=
esd --disable-arts \
> > > +                --enable-file --disable-oss --disable-esd --disable-=
arts \
> > >                  --disable-diskaudio --disable-nas --disable-esd-shar=
ed --disable-esdtest \
> > >                  --disable-mintaudio --disable-nasm --enable-video-x1=
1 --disable-video-dga \
> > >                  --disable-video-fbcon --disable-video-directfb --dis=
able-video-ps2gs --disable-video-ps3 \
> > >                  --disable-video-xbios --disable-video-gem --disable-=
video-dummy \
> > >                  --enable-input-events --enable-input-tslib --enable-=
pthreads \
> > > -		${@base_contains('DISTRO_FEATURES', 'opengl', '--enable-video-open=
gl', '--disable-video-opengl', d)} \
> > >  		--disable-video-svga \
> > >                  --disable-video-picogui --disable-video-qtopia --ena=
ble-dlopen \
> > >                  --disable-rpath"
> > > =20
> > > +PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATURES', 'opengl', '=
opengl', '', d)} \
> > > +                   ${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa=
', '', d)}"
> > > +PACKAGECONFIG[alsa] =3D "--enable-alsa,--disable-alsa,alsa-lib,"
> > > +PACKAGECONFIG[opengl] =3D "--enable-video-opengl,--disable-video-ope=
ngl,virtual/libgl,"
> > > +
>=20
> What we could do is have a=20
> PACKAGECONFIG_virtclass-nativesdk =3D "${@base_contains('DISTRO_FEATURES'=
, 'alsa', 'alsa', '', d)}"=20
> or something like that.

We've discussed this on IRC and just to be sure, do you want me to add
this first or can this patch go in now when builder is greener? The
jansa/pull branch has the version using PACKAGECONFIG only for alsa and
keeping opengl mangling as it was.

http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa/pul=
l&id=3Daafe9d871bcbdf6995432e2c8404a6c49ba942b5

Regards,

>=20
> Cheers,
>=20
> Richard
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--72btQdUC6twB1rwh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7PSPkACgkQN1Ujt2V2gBziYgCgqmEP+9bXDtPg7ih6lPT4XrLV
ynYAoKCtpVwP4zQS8vFr6YoNoOdPbdow
=c0BA
-----END PGP SIGNATURE-----

--72btQdUC6twB1rwh--
