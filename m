Return-Path: <mporter@konsulko.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 03B5C65D6E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 15:22:50 +0000 (UTC)
Received: by igbkq10 with SMTP id kq10so95009117igb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 08:22:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=zVaUI0Uh5J1+UC7Mj8eZCZ9k59LHRiKUQ6kn/Dd4jk4=;
	b=SbGRK1OIbpMTQlgsX5onbKbGphXwoyFOOjcxG1haD9DFv92uq6Mu9/9WqUhUA9QDOo
	LEwRV1m3VqZ2QmuPkNuhCALoqQ2BEHurl5TdYS8NSzXf57gs6z+CUlrutWnbOM0X4viV
	ETjefeqg6ct/X3/CMNTxTVKUqWLTfd+KPtJFQwtH4T454op7TjTE55YnvIz4uGnClNH2
	5F1IZevje/iHK8zcKVkt02qa+mDnlHJLUKi0CV6MmaHLZzz6Hv15bWwuDlPOTjH+Ku4j
	Xwq5AITQ8iISB9hp8VpMaXC+XSw2uc6R3u6gyxioSFIPzSwrhetnn5t4TASAbZZOQgup
	4m8g==
X-Gm-Message-State: ALoCoQkF30nYygdGWEGhrmEKRZzwLrsPDWyrAsK1uF8j2Gfi3GGMYUfqUVk7kZxexQVij8SdWNlO
X-Received: by 10.50.137.34 with SMTP id qf2mr21312927igb.20.1444749770628;
	Tue, 13 Oct 2015 08:22:50 -0700 (PDT)
Received: from beef ([2605:a000:1228:c0e4:ba97:5aff:fe00:a006])
	by smtp.gmail.com with ESMTPSA id
	p189sm1717129ioe.21.2015.10.13.08.22.49
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Oct 2015 08:22:50 -0700 (PDT)
Date: Tue, 13 Oct 2015 11:22:47 -0400
From: Matt Porter <mporter@konsulko.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20151013152247.GB31452@beef>
References: <1444749211-30044-1-git-send-email-mporter@konsulko.com>
	<20151013151925.GG2396@jama>
MIME-Version: 1.0
In-Reply-To: <20151013151925.GG2396@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
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
X-List-Received-Date: Tue, 13 Oct 2015 15:22:52 -0000
X-Groupsio-MsgNum: 72116
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vtzGhvizbBRQ85DL"
Content-Disposition: inline

--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2015 at 05:19:25PM +0200, Martin Jansa wrote:
> On Tue, Oct 13, 2015 at 11:13:31AM -0400, Matt Porter wrote:
> > The fbcon video backend is always disabled. Use the fbdev distro
> > feature flag to enable/disable the fbcon video backend.
> >=20
> > Signed-off-by: Matt Porter <mporter@konsulko.com>
> > Reviewed-by: Tom Rini <trini@konsulko.com>
> > ---
> >  meta/recipes-graphics/libsdl/libsdl_1.2.15.bb | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta/recip=
es-graphics/libsdl/libsdl_1.2.15.bb
> > index c0d5c6a..c604c6a 100644
> > --- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> > +++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> > @@ -13,6 +13,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D27818cd7fd=
83877a8e3ef82b82798ef4"
> >  PROVIDES =3D "virtual/libsdl"
>=20
> Can we please use PACKAGECONFIG here?

I noticed that libsdl2 does so, but stuck with the status quo below
for addressing this. So, if I understand correctly you'd like it
to be converted to be like the libsdl2 recipe, yes?

-Matt

> >  DEPENDS =3D "${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'dire=
ctfb', '', d)} \
> > +	   ${@bb.utils.contains('DISTRO_FEATURES', 'fbdev', 'fbdev', '', d)} \
> >             ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virtual/=
libgl', '', d)} \
> >             ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/lib=
x11 libxext libxrandr libxrender', '', d)} \
> >             ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'libg=
lu', '', d)} \
> > @@ -40,10 +41,11 @@ EXTRA_OECONF =3D "--disable-static --enable-cdrom -=
-enable-threads --enable-timers
> >                  --enable-file --disable-oss --disable-esd --disable-ar=
ts \
> >                  --disable-diskaudio --disable-nas --disable-esd-shared=
 --disable-esdtest \
> >                  --disable-mintaudio --disable-nasm --disable-video-dga=
 \
> > -                --disable-video-fbcon --disable-video-ps2gs --disable-=
video-ps3 \
> > +                --disable-video-ps2gs --disable-video-ps3 \
> >                  --disable-xbios --disable-gem --disable-video-dummy \
> >                  --enable-input-events --enable-input-tslib --enable-pt=
hreads \
> >                  ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', '-=
-enable-video-directfb', '--disable-video-directfb', d)} \
> > +		${@bb.utils.contains('DISTRO_FEATURES', 'fbdev', '--enable-video-fbc=
on', '--disable-video-fbcon', d)} \
> >                  ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '--e=
nable-video-opengl', '--disable-video-opengl', d)} \
> >                  ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '--enab=
le-video-x11', '--disable-video-x11', d)} \
> >                  --disable-video-svga \
> > --=20
> > 2.1.4
> >=20
> > --=20
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--vtzGhvizbBRQ85DL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWHSHHAAoJEOfTILNwq7R4wWYP/2oLVSoeBrMJEhyrxJpSCsUG
+ttCA1O+u9wF33ZRm6GGDSYEG7jb8tLDhmh+PmZye0UDGb12fXfYd7wX2WmlSKVV
K+1mzygvB9c5nxHIgnAdfbY3sJfQClD3Wcm5p1ZzzOEPskVqPVdrxAbExpNetogy
RI8a9oS7HKQdPjpiB3qyMEWW0wtvUTFl7YRakiintP3e298bxumBfbNfFzdcUmFD
/dZByYE0kaufTJY5OgWWrvTtptJKJmD9lvpXzM7bUuxFV0qLw0fGC91DhyxUbUBk
BRGg1QdIuGXJyQuWcn+cbiTubwwphkmv6mEwV3i3UViM8ltpG4gbAgchHz1UbJQi
hig8CMH+lJL/b+NVMX0oPmB3hs3rIcku0DVZPRIstPDz7vMuwOsVQV0ovZPGlvpW
ih31m7YXDn2pal+DJabTPDn8GiENw0R2QSknwVpOO1nIj0tNz3Xvg8vfDQuYf+Az
jhpJVh+fwUz7KMy/t5mXyums9DabbOx/8AEL2pMuesK1WhCU4B+KFPxCYwBZCZpl
n+vTnZ5/QOGLf3NwNm7G4DZ557tgmIQg5Qys7oRl/msJq6gh1Lm5K68/k0+Ma8gb
FshEhGermWKZpuKmFLGZhYagHJoI0x2xoBjq04usmCECjI3bR4SrpYOiqtWdm/+6
BEXKj2UbM0tRit8fs+nz
=5hb6
-----END PGP SIGNATURE-----

--vtzGhvizbBRQ85DL--
