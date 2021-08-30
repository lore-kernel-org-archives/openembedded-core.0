Received: from kozue.soulik.info (kozue.soulik.info [108.61.200.231])
 by mx.groups.io with SMTP id smtpd.web12.14183.1630311275760152282
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Aug 2021 01:14:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: soulik.info, ip: 108.61.200.231, mailfrom: ayaka@soulik.info)
Received: from [192.168.144.9] (unknown [199.33.119.15])
	by kozue.soulik.info (Postfix) with ESMTPSA id 1E78E1007A7;
	Mon, 30 Aug 2021 17:12:44 +0900 (JST)
Mime-Version: 1.0 (1.0)
Subject: Re: [OE-core] [PATCH] curl: Upgrade to 7.78.0
From: "Randy Li" <ayaka@soulik.info>
X-Mailer: iPad Mail (16D57)
In-Reply-To: <20210802080656.48809-1-mingli.yu@windriver.com>
Date: Mon, 30 Aug 2021 16:14:29 +0800
Cc: openembedded-core@lists.openembedded.org
Message-Id: <FADE40A7-5CAF-49D5-B517-0D9CE77C6F85@soulik.info>
References: <20210802080656.48809-1-mingli.yu@windriver.com>
To: "Yu, Mingli" <mingli.yu@windriver.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Aug 2, 2021, at 4:06 PM, Yu, Mingli <mingli.yu@windriver.com> wrote:
>=20
> From: Mingli Yu <mingli.yu@windriver.com>
>=20
> Remove libmetalink configure option as this rarely used option is
> removed in the new version [1].
I think we need a PACKAGECONFIG to disable zstd or put it into depend.
Or it would failed at configure stage.
Try with today=E2=80=99s master branch.
>=20
> [1] https://github.com/curl/curl/commit/265b14d6b37c4298bd5556fabcbc37d36=
f911693
>=20
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
> meta/recipes-support/curl/{curl_7.77.0.bb =3D> curl_7.78.0.bb} | 3 +--
> 1 file changed, 1 insertion(+), 2 deletions(-)
> rename meta/recipes-support/curl/{curl_7.77.0.bb =3D> curl_7.78.0.bb} (97=
%)
>=20
> diff --git a/meta/recipes-support/curl/curl_7.77.0.bb b/meta/recipes-supp=
ort/curl/curl_7.78.0.bb
> similarity index 97%
> rename from meta/recipes-support/curl/curl_7.77.0.bb
> rename to meta/recipes-support/curl/curl_7.78.0.bb
> index 6b15a6a3e8..2e2be66102 100644
> --- a/meta/recipes-support/curl/curl_7.77.0.bb
> +++ b/meta/recipes-support/curl/curl_7.78.0.bb
> @@ -13,7 +13,7 @@ SRC_URI =3D "https://curl.haxx.se/download/curl-${PV}.t=
ar.bz2 \
>            file://0001-replace-krb5-config-with-pkg-config.patch \
> "
>=20
> -SRC_URI[sha256sum] =3D "6c0c28868cb82593859fc43b9c8fdb769314c855c05cf1b5=
6b023acf855df8ea"
> +SRC_URI[sha256sum] =3D "98530b317dc95ccb324bbe4f834f07bb642fbc393b794ddf=
3434f246a71ea44a"
>=20
> # Curl has used many names over the years...
> CVE_PRODUCT =3D "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:li=
bcurl daniel_stenberg:curl"
> @@ -61,7 +61,6 @@ EXTRA_OECONF =3D " \
>     --disable-ntlm-wb \
>     --enable-crypto-auth \
>     --with-ca-bundle=3D${sysconfdir}/ssl/certs/ca-certificates.crt \
> -    --without-libmetalink \
>     --without-libpsl \
>     --enable-debug \
>     --enable-optimize \
> --=20
> 2.17.1
>=20
>=20
>=20
>=20

