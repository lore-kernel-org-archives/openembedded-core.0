Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 9E261731CF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 18:20:14 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id ho8so64212068pac.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 10:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=n21LLBq2PxaBkuhzBouJ5wc5Or48bHU3ejuxDNLEcMM=;
	b=dTf29FxM19PfOrlIXkhGIpaQzZOXgSSkGr7EHMIjBIQ6Qexw2vLWOyyzHb1abSfTvJ
	fxPbU5QOhfhtOr1YVGBNNdUeCXlsOlfd/W6gd3wyUXSrl9Ay3iwx80Tj8bM4t8yfUEwr
	HExYWNUGqI6hj0pLbr/6/+vvf9kMhxKhsa2XoLZj0gXRp7OMOZLn2SpmaB8ar6AowRKW
	imNCwqjNBcdM/E2Aeqlgh5sVF/Hw910PfV+nkdAhLpcYS/L6hwo8RdqgFZeFRMHdQ+CN
	E7FB/bWlP38Xmhjp3mcxrr9Z59IT+nCfI0dNAU3TfCBaCvMdXpRJeocpanr8O7x3eue6
	1p1g==
X-Received: by 10.67.24.33 with SMTP id if1mr106394048pad.137.1452536415689;
	Mon, 11 Jan 2016 10:20:15 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:d5b:ee56:59f:5eeb?
	([2601:646:8802:5d5c:d5b:ee56:59f:5eeb])
	by smtp.gmail.com with ESMTPSA id
	d80sm8375629pfb.55.2016.01.11.10.20.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Jan 2016 10:20:14 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <2523177d0da5233c60da6a6aa99f74631a9277b7.1452491844.git.Qi.Chen@windriver.com>
Date: Mon, 11 Jan 2016 10:20:13 -0800
Message-Id: <79D0CE6B-7A5E-4D08-BA90-06C6155E25D0@gmail.com>
References: <cover.1452491844.git.Qi.Chen@windriver.com>
	<2523177d0da5233c60da6a6aa99f74631a9277b7.1452491844.git.Qi.Chen@windriver.com>
To: Chen Qi <Qi.Chen@windriver.com>
X-Mailer: Apple Mail (2.3112)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/7] curl: upgrade to 7.46
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
X-List-Received-Date: Mon, 11 Jan 2016 18:20:15 -0000
X-Groupsio-MsgNum: 75860
Content-Type: multipart/signed;
	boundary="Apple-Mail=_D1B2FFB2-A025-4651-B828-0835E58CAF22";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_D1B2FFB2-A025-4651-B828-0835E58CAF22
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jan 10, 2016, at 9:58 PM, Chen Qi <Qi.Chen@windriver.com> wrote:
>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
> meta/recipes-support/curl/{curl_7.45.0.bb =3D> curl_7.46.0.bb} | 6 =
++++--
> 1 file changed, 4 insertions(+), 2 deletions(-)
> rename meta/recipes-support/curl/{curl_7.45.0.bb =3D> curl_7.46.0.bb} =
(92%)
>=20
> diff --git a/meta/recipes-support/curl/curl_7.45.0.bb =
b/meta/recipes-support/curl/curl_7.46.0.bb
> similarity index 92%
> rename from meta/recipes-support/curl/curl_7.45.0.bb
> rename to meta/recipes-support/curl/curl_7.46.0.bb
> index a7ed778..8b109ba 100644
> --- a/meta/recipes-support/curl/curl_7.45.0.bb
> +++ b/meta/recipes-support/curl/curl_7.46.0.bb
> @@ -14,8 +14,8 @@ SRC_URI =3D =
"http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
> #
> SRC_URI +=3D " file://configure_ac.patch"
>=20
> -SRC_URI[md5sum] =3D "62c1a352b28558f25ba6209214beadc8"
> -SRC_URI[sha256sum] =3D =
"65154e66b9f8a442b57c436904639507b4ac37ec13d6f8a48248f1b4012b98ea"
> +SRC_URI[md5sum] =3D "9979f989a2a9930d10f1b3deeabc2148"
> +SRC_URI[sha256sum] =3D =
"b7d726cdd8ed4b6db0fa1b474a3c59ebbbe4dcd4c61ac5e7ade0e0270d3195ad"
>=20
> inherit autotools pkgconfig binconfig multilib_header
>=20
> @@ -55,4 +55,6 @@ PACKAGES =3D+ "lib${BPN}"
> FILES_lib${BPN} =3D "${libdir}/lib*.so.*"
> RRECOMMENDS_lib${BPN} +=3D "ca-certificates"
>=20
> +FILES_${PN}-dev +=3D "${datadir}/zsh=E2=80=9D

what files are in ${datadir}/zsh ?

> +

> BBCLASSEXTEND =3D "native nativesdk"
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_D1B2FFB2-A025-4651-B828-0835E58CAF22
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaT8l0ACgkQuwUzVZGdMxQotwCfSTjTEOzFzLzcgqFLOpiMKl3Z
rGIAniNPkHbgAWmRfQd7SrKgGbYA6dFi
=sbRK
-----END PGP SIGNATURE-----

--Apple-Mail=_D1B2FFB2-A025-4651-B828-0835E58CAF22--
