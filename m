Return-Path: <pbarker@betafive.co.uk>
Received: from crash.betafive.co.uk (crash.betafive.co.uk [37.187.124.48])
	by mail.openembedded.org (Postfix) with ESMTP id 469467280A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Dec 2014 11:58:20 +0000 (UTC)
Received: by crash.betafive.co.uk (Postfix, from userid 1000)
	id 343A03E104A; Mon, 22 Dec 2014 11:58:23 +0000 (GMT)
Date: Mon, 22 Dec 2014 11:58:23 +0000
From: Paul Barker <paul@paulbarker.me.uk>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20141222115823.GA11476@crash.betafive.co.uk>
References: <1419199917-27913-1-git-send-email-paul@paulbarker.me.uk>
	<1419199917-27913-3-git-send-email-paul@paulbarker.me.uk>
	<20141222110541.GB2465@jama>
MIME-Version: 1.0
In-Reply-To: <20141222110541.GB2465@jama>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/8] opkg-arch-config: Renamed from opkg-config-base
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
X-List-Received-Date: Mon, 22 Dec 2014 11:58:29 -0000
X-Groupsio-MsgNum: 60759
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="huq684BweRXVnRxX"
Content-Disposition: inline

--huq684BweRXVnRxX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 22, 2014 at 12:05:41PM +0100, Martin Jansa wrote:
> On Sun, Dec 21, 2014 at 10:11:51PM +0000, Paul Barker wrote:
> > +RREPLACES_${PN} =3D "opkg-config-base"
>=20
> Is this enough for opkg to automatically replace opkg-config-base with
> opkg-arch-config during opkg upgrade?
>=20
> With older opkg releases you always had to use whole combo
> RPROVIDES+RREPLACES+RCONFLICTS.
>

It works because the RDEPENDS of opkg was also changed and nothing else dep=
ends
on opkg-config-base. It may be a little more reliable to add RPROVIDES and
RCONFLICTS just incase anything else I've not spotted depends on opkg-confi=
g-base.

The same can be said for merging opkg-collateral into opkg, we may need to =
add
RPROVIDES and RCONFLICTS incase anything else still depends on opkg-collate=
ral.

> > diff --git a/meta/recipes-devtools/opkg/opkg.inc b/meta/recipes-devtool=
s/opkg/opkg.inc
> > index 56c54b6..991c114 100644
> > --- a/meta/recipes-devtools/opkg/opkg.inc
> > +++ b/meta/recipes-devtools/opkg/opkg.inc
> > @@ -38,7 +38,7 @@ EXTRA_OECONF =3D "\
> >    --with-opkglibdir=3D${OPKGLIBDIR} \
> >  "
> > =20
> > -RDEPENDS_${PN} =3D "${VIRTUAL-RUNTIME_update-alternatives} opkg-config=
-base run-postinsts"
> > +RDEPENDS_${PN} =3D "${VIRTUAL-RUNTIME_update-alternatives} opkg-arch-c=
onfig run-postinsts"
> >  RDEPENDS_${PN}_class-native =3D ""
> >  RDEPENDS_${PN}_class-nativesdk =3D ""
> >  RREPLACES_${PN} =3D "opkg-nogpg"
> > --=20
> > 1.9.1
> >=20

Thanks,

--=20
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

--huq684BweRXVnRxX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUmAdfAAoJEBwoJlo7UPQDoNgH+gNnUDuK1+Swhj9e3JrDU66g
75cUaxNFaidMPS78hIJTyadciqBlzZhRnP6BGVi6rwzhRJ4FKrSCaKHwODksr9tL
ZozBI4ifIJm46GLfZ/upvSw4Eo8UGTvr3gKK0L6pO3Rt8+tmledtWwo6447chnjY
O2Ytsfb5qrjrLgsOmOsW/Ar3jIJ+i6OpUZURcS4JEQiLBUMVV8fx0Y5TD/dz2dkc
4+kAfsjl6hmV3QYUrzM4949aWa0LER6UM+6FRIlm+yQxHRB8565nF4f+mKFljHDt
+tNnNK/j0MPLdGrpzePFH/gsQfaZ24hkV3iQ8APUbmOSj6rQSN3tnmxSKYx0IKM=
=D4mW
-----END PGP SIGNATURE-----

--huq684BweRXVnRxX--
