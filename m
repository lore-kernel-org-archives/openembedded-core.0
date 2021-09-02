Received: from mx1.emlix.com (mx1.emlix.com [136.243.223.33])
 by mx.groups.io with SMTP id smtpd.web10.3532.1630565058645568568
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 23:44:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: emlix.com, ip: 136.243.223.33, mailfrom: dwagenknecht@emlix.com)
Received: from mailer.emlix.com (unknown [81.20.119.6])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id 9A4AE5FC95
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Sep 2021 08:44:16 +0200 (CEST)
Message-ID: <8748ff9eb44a8e588cc8be89ec499c21fb7c4c0f.camel@emlix.com>
Subject: Re: [OE-core] [meta-oe][PATCH 2/2] mirrors.bbclass: remove redundant server-specific mirrors
From: "Daniel Wagenknecht" <dwagenknecht@emlix.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 02 Sep 2021 08:44:15 +0200
In-Reply-To: <16A0EDB4F6A75062.29496@lists.openembedded.org>
References: <20210902063116.176984-1-dwagenknecht@emlix.com>
	 <16A0EDB4F6A75062.29496@lists.openembedded.org>
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
X-Groupsio-MsgNum: 155616
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-bZgQC3u8Ll/UyZzlMnLY"

--=-bZgQC3u8Ll/UyZzlMnLY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry for the incorrect prefix, the patches are meant for OE-core and NOT m=
eta-
oe.
--=20
Daniel Wagenknecht

emlix - smart embedded open source

On Thu, 2021-09-02 at 08:31 +0200, Daniel Wagenknecht wrote:
> With the previously added general git repo fallback rule the server
> specific fallback mirrors for git.savannah.gnu.org and
> git.yoctoproject.org are redundant. Remove them.
>=20
> Signed-off-by: Daniel Wagenknecht <dwagenknecht@emlix.com>
> ---
>  meta/classes/mirrors.bbclass | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
> index ab75ca1bb6..ba325a658b 100644
> --- a/meta/classes/mirrors.bbclass
> +++ b/meta/classes/mirrors.bbclass
> @@ -70,8 +70,6 @@ ${CPAN_MIRROR}  http://search.cpan.org/CPAN/ \n \
>  MIRRORS +=3D "\
>  git://salsa.debian.org/.*     git://salsa.debian.org/PATH;protocol=3Dhtt=
ps \n \
>  git://git.gnome.org/.*        git://gitlab.gnome.org/GNOME/PATH;protocol=
=3Dhttps \n \
> -git://git.savannah.gnu.org/.* git://git.savannah.gnu.org/git/PATH;protoc=
ol=3Dhttps \n \
> -git://git.yoctoproject.org/.* git://git.yoctoproject.org/git/PATH;protoc=
ol=3Dhttps \n \
>  git://.*/.*                   git://HOST/PATH;protocol=3Dhttps \n \
>  git://.*/.*                   git://HOST/git/PATH;protocol=3Dhttps \n \
>  "
>=20
>=20

--=-bZgQC3u8Ll/UyZzlMnLY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEkDMJRIopzNTng/jmZ2f8gllWJGkFAmEwcr8ACgkQZ2f8gllW
JGnFghAAkh4y2AQuc0KXdsTTzP77ewDUcaf5HWXq1Bm+Mb6eQC5zo2becB1qikdU
FyRO9pkRdQ4ynNZEe116sTEmMnQqTMgDR3C1hp0LUZuZnJpMYjX4Jla1dRrMAIiV
PlaNZ8fLGEhmTX1ydIQ+Hg42lZXCAtt5bQnWL6sauoUEiFfZ92o1bbcPW3uoejfD
lbF5eUqsU98fmrBnVLPYY0bWcafSPfd4XZ0eiLwxbxhxY2M5pGLTj7gisXRkxp+/
Bhg/5JiHzXjRrenRFGbInzAhEuMf2qR5u1EcYPFJBsjgeXDyvj8C0RDu5GLesvDa
+w7aX199ljMtP60HeSxTF1/JaE5ef0zj1TafKl6cx3CaAzsuzqYwmoXMwbFDPlXr
4Ro/vN4A6MPHy6ywvpqUv0QtBiIIcsCiZpS0TVW9GSK8tP37nWYLMSQhdZ+FdGGY
BFlIqQU2BBEsHL4XiGOm70Y/RVT9L5Ef5jDt7L99YFazwEjJ5BAAgL4zCpusAStg
U5LcFii2L6StEkWH+rOd/t5KOsb30Y887ZNPS0S7DM9i4oT/aQWdvOk9o1oDk5pO
XfkwQSleivokKYbZALBCEmdiZkKMZq2T7AaKNY6dJSfbSBSqLT65H85g5ddgRDJ1
IpVL5doFgXcmUr1eac2k35CxxQOKxgVFsbu90z6NkgC/jNAoDqM=
=+dlY
-----END PGP SIGNATURE-----

--=-bZgQC3u8Ll/UyZzlMnLY--
