Return-Path: <martin.jansa@gmail.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 1BC3765C8A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 15:34:47 +0000 (UTC)
Received: by qkap81 with SMTP id p81so9943607qka.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 08:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=o6HZ8kCZxG2Ew5NJq/nOyuG5xgEIeSZlvVP8HBvZscI=;
	b=hhAKGBTnDi5pgXQSd9fbrKmGhEkjMjKgJacfTgEw6b6/nxC2sBjz2oC4em9HwiItrz
	EKALZOifw0+KjLhdLVsl/WiIwglAkhBlCpDYD6a62MHLmGz6eRreebf7FXxQPs+9cJhJ
	vGYrUjmI1UyMvICMM1s5P5NamGf1oRn5r66EX2mnnC7krM8dPsXkcMbd2W2apRqp2rQt
	UBWn79jb29QGEZ2EN9i6HBzekAxVBMeKuPzDcHInKWXUavDUV0ZIsX1B+OhtpOIZf1Aw
	In3ZHwTLQbOdvKhWxKgHNoEawxeqMwKbZNYP20Sywr1Z+OkKerKg1BbneyhFLYPxsL6u
	Q1GQ==
X-Received: by 10.194.9.97 with SMTP id y1mr44211743wja.84.1444750487161;
	Tue, 13 Oct 2015 08:34:47 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	qh12sm9036684wic.20.2015.10.13.08.34.46
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Oct 2015 08:34:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 13 Oct 2015 17:34:51 +0200
To: Matt Porter <mporter@konsulko.com>
Message-ID: <20151013153451.GH2396@jama>
References: <1444749211-30044-1-git-send-email-mporter@konsulko.com>
	<20151013151925.GG2396@jama> <20151013152247.GB31452@beef>
MIME-Version: 1.0
In-Reply-To: <20151013152247.GB31452@beef>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Tom Rini <trini@konsulko.com>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libsdl: enable fbcon video when fbdev distro feature is present
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
X-List-Received-Date: Tue, 13 Oct 2015 15:34:49 -0000
X-Groupsio-MsgNum: 72118
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="it/zdz3K1bH9Y8/E"
Content-Disposition: inline

--it/zdz3K1bH9Y8/E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2015 at 11:22:47AM -0400, Matt Porter wrote:
> On Tue, Oct 13, 2015 at 05:19:25PM +0200, Martin Jansa wrote:
> > On Tue, Oct 13, 2015 at 11:13:31AM -0400, Matt Porter wrote:
> > > The fbcon video backend is always disabled. Use the fbdev distro
> > > feature flag to enable/disable the fbcon video backend.
> > >=20
> > > Signed-off-by: Matt Porter <mporter@konsulko.com>
> > > Reviewed-by: Tom Rini <trini@konsulko.com>
> > > ---
> > >  meta/recipes-graphics/libsdl/libsdl_1.2.15.bb | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta/rec=
ipes-graphics/libsdl/libsdl_1.2.15.bb
> > > index c0d5c6a..c604c6a 100644
> > > --- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> > > +++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> > > @@ -13,6 +13,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D27818cd7=
fd83877a8e3ef82b82798ef4"
> > >  PROVIDES =3D "virtual/libsdl"
> >=20
> > Can we please use PACKAGECONFIG here?
>=20
> I noticed that libsdl2 does so, but stuck with the status quo below
> for addressing this. So, if I understand correctly you'd like it
> to be converted to be like the libsdl2 recipe, yes?

yes, I don't see any other recipe using fbdev as DISTRO_FEATURE, so
using it in PACKAGECONFIG would make it easier to enable/disable this.

Converting other options currently using DISTRO_FEATURES isn't a must,
but it would be nice to convert them as well.

>=20
> -Matt
>=20
> > >  DEPENDS =3D "${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'di=
rectfb', '', d)} \
> > > +	   ${@bb.utils.contains('DISTRO_FEATURES', 'fbdev', 'fbdev', '', d)=
} \
> > >             ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virtua=
l/libgl', '', d)} \
> > >             ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/l=
ibx11 libxext libxrandr libxrender', '', d)} \
> > >             ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'li=
bglu', '', d)} \
> > > @@ -40,10 +41,11 @@ EXTRA_OECONF =3D "--disable-static --enable-cdrom=
 --enable-threads --enable-timers
> > >                  --enable-file --disable-oss --disable-esd --disable-=
arts \
> > >                  --disable-diskaudio --disable-nas --disable-esd-shar=
ed --disable-esdtest \
> > >                  --disable-mintaudio --disable-nasm --disable-video-d=
ga \
> > > -                --disable-video-fbcon --disable-video-ps2gs --disabl=
e-video-ps3 \
> > > +                --disable-video-ps2gs --disable-video-ps3 \
> > >                  --disable-xbios --disable-gem --disable-video-dummy \
> > >                  --enable-input-events --enable-input-tslib --enable-=
pthreads \
> > >                  ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', =
'--enable-video-directfb', '--disable-video-directfb', d)} \
> > > +		${@bb.utils.contains('DISTRO_FEATURES', 'fbdev', '--enable-video-f=
bcon', '--disable-video-fbcon', d)} \
> > >                  ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '-=
-enable-video-opengl', '--disable-video-opengl', d)} \
> > >                  ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '--en=
able-video-x11', '--disable-video-x11', d)} \
> > >                  --disable-video-svga \
> > > --=20
> > > 2.1.4
> > >=20
> > > --=20
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >=20
> > --=20
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>=20
>=20



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--it/zdz3K1bH9Y8/E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYdJJoACgkQN1Ujt2V2gByaOACghaC666JosAvB+Jg3WsyaajMi
j7cAoJBjFATSV91LidRN6AelIyRPJGAv
=Y5g0
-----END PGP SIGNATURE-----

--it/zdz3K1bH9Y8/E--
