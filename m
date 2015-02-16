Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f171.google.com (mail-we0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id 086BE7353D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Feb 2015 14:39:28 +0000 (UTC)
Received: by mail-we0-f171.google.com with SMTP id p10so29648416wes.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Feb 2015 06:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bd1ubB+7Py/+U2mCliy0zNrOELprjYPApNO8H/ilS8w=;
	b=pFqrV/HVyUc9R06eba8P1pNamCg5Tpwpfqw89dbU+WLUMwq0AJHFq6qrYOxIaGHy5D
	Odv/lToDge5y5GLaDukIZNyfHDPatykmNqPs0fINQl+2wZAp9gi/S3lYsEOqgeVCd01d
	+754wIJseXKf6RtqZF1BZYtRiEg69tVnYsYMcCbDklo1ZNi+dHe7Af6eqyYnGkNRJ82k
	BHrJefJVYQyeirnQIc+dzh10NfGJVM45STa8746rn9LP3SWrXDlXuPi+J2yZf5wsPp1q
	Ui4cdqukmRljKJRPK5nO06AgOaAVzNrd3QLe2anELrPEHH0fwMmi7oswH/HRF40pQRWX
	LFGA==
X-Received: by 10.180.95.97 with SMTP id dj1mr37923227wib.43.1424097567304;
	Mon, 16 Feb 2015 06:39:27 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	18sm23105761wjr.46.2015.02.16.06.39.26
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Feb 2015 06:39:26 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 16 Feb 2015 15:39:35 +0100
To: =?iso-8859-1?Q?St=E9phane?= Cerveau <scerveau@connected-labs.com>
Message-ID: <20150216143935.GH2297@jama>
References: <1424091890-30393-1-git-send-email-scerveau@connected-labs.com>
MIME-Version: 1.0
In-Reply-To: <1424091890-30393-1-git-send-email-scerveau@connected-labs.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] crda: update fetch url for both package and bin.
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
X-List-Received-Date: Mon, 16 Feb 2015 14:39:29 -0000
X-Groupsio-MsgNum: 62429
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cf0hFtnykp6aONGL"
Content-Disposition: inline

--cf0hFtnykp6aONGL
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 16, 2015 at 02:04:50PM +0100, St=E9phane Cerveau wrote:
> The website http://wireless.kernel.org/download does not provide
> crda and binary anymore.

Wrong ML, see README and should go to openembedded-devel ML.

>=20
> Signed-off-by: St=E9phane Cerveau <scerveau@connected-labs.com>
> ---
>  .../recipes-connectivity/crda/crda_1.1.3.bb        |   10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta-networking/recipes-connectivity/crda/crda_1.1.3.bb b/me=
ta-networking/recipes-connectivity/crda/crda_1.1.3.bb
> index 0bb8998..5b86058 100644
> --- a/meta-networking/recipes-connectivity/crda/crda_1.1.3.bb
> +++ b/meta-networking/recipes-connectivity/crda/crda_1.1.3.bb
> @@ -7,13 +7,13 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D07c4f6dea384=
5b02a18dc00c8c87699c"
> =20
>  DEPENDS =3D "python-m2crypto-native python-native libgcrypt libnl"
> =20
> -SRC_URI =3D "http://wireless.kernel.org/download/crda/${BP}.tar.bz2;name=
=3Dcrda \
> -           http://wireless.kernel.org/download/wireless-regdb/regulatory=
=2Ebins/2013.01.11-regulatory.bin;name=3Dbin \
> +SRC_URI =3D "https://www.kernel.org/pub/software/network/${PN}/${BP}.tar=
=2Ebz2;name=3Dcrda \
> +           https://www.kernel.org/pub/software/network/wireless-regdb/wi=
reless-regdb-2013.01.11.tar.bz2;name=3Dbin \
>  "
>  SRC_URI[crda.md5sum] =3D "29579185e06a75675507527243d28e5c"
>  SRC_URI[crda.sha256sum] =3D "aa8a7fe92f0765986c421a5b6768a185375ac210393=
df0605ee132f6754825f0"
> -SRC_URI[bin.md5sum] =3D "e0c8a5ca63fb8bf803213f9a0c90b50b"
> -SRC_URI[bin.sha256sum] =3D "b1ee0b20c123c612dfdb6851ab42c01666f66fb583e0=
e590942f19bb54cf84be"
> +SRC_URI[bin.md5sum] =3D "f137585abd5e07454932ea555b826149"
> +SRC_URI[bin.sha256sum] =3D "6eb469555eb547b22738ce7bf59ebba42138560f1280=
85a5e238eb6c8075792e"
> =20
>  inherit python-dir pythonnative
>  # Recursive make problem
> @@ -28,7 +28,7 @@ do_install() {
> =20
>      install -d ${D}${libdir}/crda/
> =20
> -    install -m 0644 ${WORKDIR}/2013.01.11-regulatory.bin ${D}${libdir}/c=
rda/regulatory.bin
> +    install -m 0644 ${WORKDIR}/wireless-regdb-2013.01.11/regulatory.bin =
${D}${libdir}/crda/regulatory.bin
>  }
> =20
> =20
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cf0hFtnykp6aONGL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTiAScACgkQN1Ujt2V2gBwwCgCgmTP9ANOAlSjcdK/uLrpmion/
B7IAoJklXK3Y9cMXw5Dhegium6ImWqA+
=JrSe
-----END PGP SIGNATURE-----

--cf0hFtnykp6aONGL--
