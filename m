Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id E694D60043
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Aug 2015 08:03:14 +0000 (UTC)
Received: by wicja10 with SMTP id ja10so87851604wic.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Aug 2015 01:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=TCWnjj+1KAm6frPCg84v+57ig/Y1YIxCNrjjvE591vw=;
	b=b0kDMvQs9rIbgT+U540K2BfSl4e5fP1p2y8/2Re6W3z8rYsBiBY0N53m9jhHL6X1yg
	WanOLZYd+w8gvh774raKvcA5wAU5xTBrThaP2O6MiVHCALNkf8qDAR+a89VpJM1eBl7/
	zDYwFNYFJoHPKA10SkY2dG+aXrY4GHsqAEA65u6N+Bpd4qecOLC5VrZMsGMCYeUxhKK9
	X/VcryUNGSNMw3QDVNXhb9fRcZyYB2xL6wiOtjZNXpmlzvEiDQcBjuQ632IY45gThoxL
	Q9ppBDqJx1VwZ7P3b7xNWjcrEfv8Sg4xH1Qflxf2XlTdCoIB8Zpt15/v5xyBD//7Qyg9
	oxMw==
X-Received: by 10.194.87.102 with SMTP id w6mr10467248wjz.111.1439884994983;
	Tue, 18 Aug 2015 01:03:14 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	i6sm25293609wje.33.2015.08.18.01.03.13
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Aug 2015 01:03:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 18 Aug 2015 10:03:17 +0200
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20150818080317.GC2458@jama>
References: <1439098101-9400-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1439098101-9400-1-git-send-email-akuster808@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] nettle: clean up license information
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
X-List-Received-Date: Tue, 18 Aug 2015 08:03:16 -0000
X-Groupsio-MsgNum: 69553
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oJ71EGRlYNjSvfq7"
Content-Disposition: inline

--oJ71EGRlYNjSvfq7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 09, 2015 at 10:58:21AM +0530, Armin Kuster wrote:
> adding the license definitions on the few packages that
> deviate from the overall package license.
>=20
> based on http://www.lysator.liu.se/~nisse/nettle/nettle.html#Copyright
> and spot checking files.
>=20
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta/recipes-support/nettle/nettle_2.7.1.bb | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/meta/recipes-support/nettle/nettle_2.7.1.bb b/meta/recipes-s=
upport/nettle/nettle_2.7.1.bb
> index f53afcc..f9d331f 100644
> --- a/meta/recipes-support/nettle/nettle_2.7.1.bb
> +++ b/meta/recipes-support/nettle/nettle_2.7.1.bb
> @@ -2,6 +2,15 @@ SUMMARY =3D "A low level cryptographic library"
>  HOMEPAGE =3D "http://www.lysator.liu.se/~nisse/nettle/"
>  SECTION =3D "libs"
>  LICENSE =3D "LGPLv2.1 & GPLv2"

It would be nice to package GPLv2 files in separate package as well (or
LGPLv2.1 library in seprate package) if you have time to do that.

> +LICENSE_${PN}-cast =3D "CC0"
> +LICENSE_${PN}-gosthash =3D "MIT"
> +
> +# both public and GPL license listed
> +LICENSE_${PN}-md2 =3D "CC0 & LGPLv2.1+"
> +LICENSE_${PN}-md4 =3D "CC0 & LGPLv2.1+"
> +
> +
>  LIC_FILES_CHKSUM =3D "file://COPYING.LIB;md5=3D2d5025d4aa3495befef8f1720=
6a5b0a1 \
>                      file://serpent-decrypt.c;beginline=3D53;endline=3D67=
;md5=3Dbcfd4745d53ca57f82907089898e390d \
>                      file://serpent-set-key.c;beginline=3D56;endline=3D70=
;md5=3Dbcfd4745d53ca57f82907089898e390d"
> --=20
> 2.3.5
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--oJ71EGRlYNjSvfq7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXS5sUACgkQN1Ujt2V2gBxtFgCfTp4q94Tz/kjQlJoIXcV402GB
I48Ani/GhzIckgliKVvm3vHTpkERID80
=mXzF
-----END PGP SIGNATURE-----

--oJ71EGRlYNjSvfq7--
