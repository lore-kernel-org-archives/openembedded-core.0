Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 47D9165D56
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 09:33:36 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id ex7so538137wid.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 02:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=4HSRtbZURjqyHbU3tLObbQccheUeJclq8IFPdV8Fi+M=;
	b=zjIQAy6Y3z/7LI2wxZ1yINenEkBXod0hmmNGNX6nG5kT1ADpJ/AyQF33fTZUscd77k
	YMRtPtfoF5zRTaTvGvnEanmZLMaZfPHMaiBWJAciSdC1ILnilEZ1hFSSkoLpy929OEoN
	/M4m9yLWSWMYu0Qmu9CvOoN0cKp16+YjAl+9aHc6OAOxBYs01fXBlZyk/QivGiA4Of77
	7X1Z1EadYrSlho/KYR+1V7SPlCDs5vDpZlEmvIYCC6HbDniID63wrlgV+nES71M8RCbb
	xLSXiwL/CrmiNNn4yqknkUZhZEEfX7t6VhOr84SlJO2/2cWNqsNxf1RLFlGitF9AZh83
	edsQ==
X-Received: by 10.180.9.226 with SMTP id d2mr776578wib.81.1409218416933;
	Thu, 28 Aug 2014 02:33:36 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	y5sm8398451wje.32.2014.08.28.02.33.35 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Aug 2014 02:33:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 28 Aug 2014 11:33:44 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20140828093344.GC16066@jama>
References: <1409170493-18242-1-git-send-email-dv@pseudoterminal.org>
	<1409210476.29296.132.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1409210476.29296.132.camel@ted>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libsdl: add packageconfigs for x11, directfb, opengl
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
X-List-Received-Date: Thu, 28 Aug 2014 09:33:37 -0000
X-Groupsio-MsgNum: 57066
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0vzXIDBeUiKkjNJl"
Content-Disposition: inline

--0vzXIDBeUiKkjNJl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 28, 2014 at 08:21:16AM +0100, Richard Purdie wrote:
> On Wed, 2014-08-27 at 22:14 +0200, Carlos Rafael Giani wrote:
> > Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> > ---
> >  meta/recipes-graphics/libsdl/libsdl_1.2.15.bb | 18 +++++++++---------
> >  1 file changed, 9 insertions(+), 9 deletions(-)
> >=20
> > diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta/recip=
es-graphics/libsdl/libsdl_1.2.15.bb
> > index e544b60..b0ae299 100644
> > --- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> > +++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> > @@ -12,10 +12,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D27818cd7f=
d83877a8e3ef82b82798ef4"
> > =20
> >  PROVIDES =3D "virtual/libsdl"
> > =20
> > -DEPENDS =3D "${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'dire=
ctfb', '', d)} \
> > -           ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virtual/=
libgl libglu', '', d)} \
> > -           ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/lib=
x11 libxext libxrandr libxrender', '', d)} \
> > -           tslib"
> > +DEPENDS =3D "tslib"
> >  DEPENDS_class-nativesdk =3D "${@bb.utils.contains('DISTRO_FEATURES', '=
x11', 'virtual/nativesdk-libx11 nativesdk-libxrandr nativesdk-libxrender na=
tivesdk-libxext', '', d)}"
> > =20
> >  PR =3D "r3"
> > @@ -42,16 +39,19 @@ EXTRA_OECONF =3D "--disable-static --enable-cdrom -=
-enable-threads --enable-timers
> >                  --disable-video-fbcon --disable-video-ps2gs --disable-=
video-ps3 \
> >                  --disable-xbios --disable-gem --disable-video-dummy \
> >                  --enable-input-events --enable-input-tslib --enable-pt=
hreads \
> > -                ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', '-=
-enable-video-directfb', '--disable-video-directfb', d)} \
> > -                ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '--e=
nable-video-opengl', '--disable-video-opengl', d)} \
> > -                ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '--enab=
le-video-x11', '--disable-video-x11', d)} \
> >                  --disable-video-svga \
> >                  --disable-video-picogui --disable-video-qtopia --enabl=
e-sdl-dlopen \
> >                  --disable-rpath \
> >                  --disable-pulseaudio"
> > =20
> > -PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'alsa', '=
alsa', '', d)}"
> > -PACKAGECONFIG[alsa] =3D "--enable-alsa --disable-alsatest,--disable-al=
sa,alsa-lib,"
> > +PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'alsa', '=
alsa', '', d)} \
> > +                   ${@bb.utils.contains('DISTRO_FEATURES', 'directfb',=
 'directfb', '', d)} \
> > +                   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '=
opengl', '', d)} \
> > +                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11=
', '', d)}"
> > +PACKAGECONFIG[alsa] =3D "--enable-alsa --disable-alsatest,--disable-al=
sa,alsa-lib"
> > +PACKAGECONFIG[directfb] =3D "--enable-video-directfb,--disable-video-d=
irectfb,directfb"
> > +PACKAGECONFIG[opengl] =3D "--enable-video-opengl,--disable-video-openg=
l,virtual/libgl libglu"
> > +PACKAGECONFIG[x11] =3D "--enable-video-x11,--disable-video-x11,virtual=
/libx11 libxext libxrandr libxrender"
>=20
>=20
> Unfortunately his blew up on the autobuilder:
>=20
> https://autobuilder.yoctoproject.org/main/builders/build-appliance/builds=
/12/steps/BuildImages/logs/stdio

Carlos: please compare with this one:
http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa/wip=
&id=3Dcb921237643be39aa8f44ea4c35d3cfd30f782c0

it's a bit old but has nativesdk override :).

> ERROR: Nothing PROVIDES 'virtual/nativesdk-nativesdk-libgl' (but
> virtual:nativesdk:/home/pokybuild/yocto-autobuilder/yocto-worker/build-ap=
pliance/build/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb DEPENDS on or o=
therwise requires it). Close matches:
>   virtual/nativesdk-libsdl
>   virtual/nativesdk-libc
>   virtual/nativesdk-libintl
> ERROR: Nothing PROVIDES 'nativesdk-libglu' (but
> virtual:nativesdk:/home/pokybuild/yocto-autobuilder/yocto-worker/build-ap=
pliance/build/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb DEPENDS on or o=
therwise requires it). Close matches:
>   nativesdk-libxau
>   nativesdk-libusb
>   nativesdk-libsdl
> ERROR: Nothing PROVIDES 'virtual/nativesdk-nativesdk-libx11' (but
> virtual:nativesdk:/home/pokybuild/yocto-autobuilder/yocto-worker/build-ap=
pliance/build/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb DEPENDS on or o=
therwise requires it). Close matches:
>   virtual/nativesdk-libx11
>   virtual/nativesdk-libc
>   virtual/nativesdk-db
>=20
> Cheers,
>=20
> Richard
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--0vzXIDBeUiKkjNJl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlP+93gACgkQN1Ujt2V2gBzF1ACeNmuuD/h7I7rOIMSAADaMElfs
tRgAoJbOU3ix4W8aliHlskLjJVXydzxu
=EhOt
-----END PGP SIGNATURE-----

--0vzXIDBeUiKkjNJl--
