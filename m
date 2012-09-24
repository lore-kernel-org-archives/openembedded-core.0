Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TG9SC-0003bf-Fv
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 16:16:08 +0200
Received: by weyt44 with SMTP id t44so2231561wey.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2012 07:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=CAgtZwsvDEGF3Jm1DbRCFTXBxxIjE/xiXOqJSrs0I60=;
	b=OqX3oMiZx8FgrlmQV0KNRg8jtInTbpa0ORuCxgVdHt0o0TMTbL7GZER+XQV40TrXhs
	9Q0GsqG1QZ5kBdmQoIK7BIAtnH2Aqskvp7lRcVURbgfc6mND/+wTokf+sqHgBlUGJUqQ
	usYbbF35Ioi+p9ibLKsL1exDzQIvUUJuPc/JqnSMdvvNkFgMvL7aRcFfza5v1MM2AKDM
	dbJ+Ih/tTBnv6buFjMQWzmfL3NWlsu+POwBJ5bqDGU/ZnqaeIFNr3sSOyZ0h9kWfa4F3
	6SrlkgrgivOP10+9gyNCeqSUfcWcrUEAgXNV8BA9fEzrnC90QQ//r2LxDVbanEb3ADS4
	WOFQ==
Received: by 10.180.87.34 with SMTP id u2mr14683191wiz.3.1348495400530;
	Mon, 24 Sep 2012 07:03:20 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id bc2sm16933959wib.0.2012.09.24.07.03.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 24 Sep 2012 07:03:19 -0700 (PDT)
Date: Mon, 24 Sep 2012 16:03:24 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20120924140324.GD3295@jama.jama.net>
References: <20120921112144.GE10268@jama.jama.net>
	<1348333994-18026-1-git-send-email-Martin.Jansa@gmail.com>
	<1348333994-18026-2-git-send-email-Martin.Jansa@gmail.com>
	<1348482003.4654.12.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1348482003.4654.12.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] xserver-xorg: use EXTENDPKGV instead of PV in RCONFLICTS_${PN}-module-exa
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
X-List-Received-Date: Mon, 24 Sep 2012 14:16:08 -0000
X-Groupsio-MsgNum: 29782
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UPT3ojh+0CqEDtpF"
Content-Disposition: inline

--UPT3ojh+0CqEDtpF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 24, 2012 at 11:20:03AM +0100, Richard Purdie wrote:
> On Sat, 2012-09-22 at 19:13 +0200, Martin Jansa wrote:
> > * it doesn't make much sense with PV, because xserver-xorg-module-exa
> >   was introduced in
> >   http://git.openembedded.org/openembedded-core/commit/meta/recipes-gra=
phics/xorg-xserver?id=3D1a666ee1cda3c0b74daba5881fc5f62e13deec66
> >   so our xserver-xorg-module-exa RCONFLICTS with xserver-xorg (<=3D 1.1=
1.2-r4)
> >   and (< 1.11.2) is not good enough
> >=20
> > * because we don't know how many PRINC are in BSP/DISTRO layers,
> >   then it's safer to RCONFLICTS with every older version then current
> >   EXTENDPKGV
> >=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >=20
> > --
> >=20
> > * I haven't really tested this with IPK, since it was changed from
> >   RREPLACES to RCONFLICTS (because of RPM) and all my installed devices
> >   are already upgraded
> > ---
> >  meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta=
/recipes-graphics/xorg-xserver/xserver-xorg.inc
> > index 33f59fe..7513399 100644
> > --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> > +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> > @@ -66,7 +66,7 @@ PACKAGES =3D+ "${PN}-security-policy \
> > =20
> >  RRECOMMENDS_${PN} +=3D "${PN}-security-policy xkeyboard-config rgb xse=
rver-xf86-config"
> >  RDEPENDS_${PN}-xvfb +=3D "xkeyboard-config"
> > -RCONFLICTS_${PN}-module-exa =3D "${PN} (< ${PV})"
> > +RCONFLICTS_${PN}-module-exa =3D "${PN} (< ${EXTENDPKGV})"
> > =20
> >  FILES_${PN} =3D "${bindir} ${libdir}/X11/Options ${libdir}/X11/Cards $=
{libdir}/X11/getconfig ${libdir}/X11/etc ${libdir}/modules/*.so ${libdir}/x=
org/modules/*.so /etc/X11 ${libdir}/xorg/protocol.txt ${datadir}/X11/xorg.c=
onf.d"
> >  FILES_${PN}-dev +=3D "${libdir}/xorg/modules/*.la ${libdir}/xorg/modul=
es/*/*.la"
>=20
> The original patch and this patch are wrong, this value should not be
> "floating". It should be spelt out explicitly so it doesn't change with
> the recipe version in future.:
>=20
> RCONFLICTS_${PN}-module-exa =3D "${PN} (< 1.11.2-r4)"

While testing this I've noticed another (probably just opkg status bug),
see Conflicts field in Packages file and then the same package in opkg
status:

But both packages were installed fine together (so extra =3D is probably on=
ly shown).

SHR root@gjama ~ $ grep -A 15 "Package: xserver-xorg-module-exa" /var/lib/o=
pkg/jama-armv7a-vfp-neon
Package: xserver-xorg-module-exa
Version: 2:1.11.2-r10
Depends: libc6 (>=3D 2.16)
Conflicts: xserver-xorg (< 2:1.11.2-r10)
Section: x11/base
Architecture: armv7a-vfp-neon
Maintainer: OE-Core Developers <openembedded-core@lists.openembedded.org>
MD5Sum: 4082f6813a30480b94921a0e322d2117
Size: 42254
Filename: xserver-xorg-module-exa_1.11.2-r10_armv7a-vfp-neon.ipk
Source: http://xorg.freedesktop.org/releases/individual/xserver/xorg-server=
-1.11.2.tar.bz2 file://macro_tweak.patch file://crosscompile.patch file://f=
ix_open_max_preprocessor_error.patch file://gcc-47-warning.patch file://mip=
s64-compiler.patch file://randr-support.patch
Description:  xserver-xorg version 1.11.2-r10  The X.Org X server
OE: xserver-xorg
HomePage: http://www.x.org
License: MIT-X
Priority: optional

SHR root@gjama ~ $ opkg info xserver-xorg-module-exa
Package: xserver-xorg-module-exa
Version: 2:1.11.2-r10
Depends: libc6 (>=3D 2.16)
Provides:
Conflicts: xserver-xorg (<=3D 2:1.11.2-r10)
Status: install user installed
Section: x11/base
Architecture: armv7a-vfp-neon
Maintainer: OE-Core Developers <openembedded-core@lists.openembedded.org>
MD5Sum: 4082f6813a30480b94921a0e322d2117
Size: 42254
Filename: xserver-xorg-module-exa_1.11.2-r10_armv7a-vfp-neon.ipk
Source: http://xorg.freedesktop.org/releases/individual/xserver/xorg-server=
-1.11.2.tar.bz2 file://macro_tweak.patch file://crosscompile.patch file://f=
ix_open_max_preprocessor_error.patch file://gcc-47-warning.patch file://mip=
s64-compiler.patch file://randr-support.patch
Description: xserver-xorg version 1.11.2-r10  The X.Org X server
Installed-Time: 1348494842

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--UPT3ojh+0CqEDtpF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBgaCwACgkQN1Ujt2V2gByg1gCfcHYyU18WFs6eHoea2sfkH4nD
7b4AnjWL/onbilMCJlM1jKJUYz4505cg
=MMDK
-----END PGP SIGNATURE-----

--UPT3ojh+0CqEDtpF--
