Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web10.109.1585349393816566881
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2020 15:49:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@koncepto.io header.s=default header.b=D7dKkkzd;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from [192.168.1.17] (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 6D24460044
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2020 23:49:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1585349392;
	bh=zmnfVcuQcGJlrShcqReMhZ0pP3yGHMlVc7REe+08g1g=;
	h=Subject:To:References:From:Date:In-Reply-To:From;
	b=D7dKkkzd7j5A0PRKdA99d4uXfp80+pPkGWvOc4VTMlzKo807ZZ4QfzhBo/AvuiMt2
	 M2UVn+p3KxO2cXNu7oCcru8Sk8w5TgIApWtt18Ia9CtdeX9eXoOLmH/FKMg6+7cw6k
	 ahlR2Q+3BCKVgdnepZ2Ea2h79DollMKhBjjzVKMFxgQBZ+Aqkm2R3CqmDO7Rjs/UCd
	 r7LbTmAa3+BjK20RhNCdR/F7Xy5qLUhNNdg4iuEjapiHMdhT6YXZ4cxT/rpbeHyrbZ
	 h8uBpv86JTaZKOn3bmN1Pqig1LzoSL0t5Ix4WtySk0MQLgAAYGteMuDiwaroAByIN1
	 w+Bn1CMk0bm2A==
Subject: Re: [OE-core] [meta-python][PATCH] python-engineio: upgrade 3.11.2 -> 3.12.1
To: openembedded-core@lists.openembedded.org
References: <16004AA43A4067F5.10141@lists.openembedded.org>
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
Message-ID: <2c5de38a-1db4-6beb-7ea1-4636cb77192a@koncepto.io>
Date: Fri, 27 Mar 2020 23:49:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <16004AA43A4067F5.10141@lists.openembedded.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Sorry, wrong mailing list, I will send to -devel.

Le 27/03/2020 =C3=A0 23:45, Pierre-Jean Texier via Lists.Openembedded.Org =
a=20
=C3=A9crit=C2=A0:
> See full changelog https://github.com/miguelgrinberg/python-engineio/blo=
b/master/CHANGES.md
>=20
> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
> ---
>   meta-python/recipes-devtools/python/python-engineio.inc               =
| 4 ++--
>   .../python/{python3-engineio_3.11.2.bb =3D> python3-engineio_3.12.1.bb=
} | 0
>   2 files changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-engineio_3.11.2.bb=
 =3D> python3-engineio_3.12.1.bb} (100%)
>=20
> diff --git a/meta-python/recipes-devtools/python/python-engineio.inc b/m=
eta-python/recipes-devtools/python/python-engineio.inc
> index 9c067c9..965f420 100644
> --- a/meta-python/recipes-devtools/python/python-engineio.inc
> +++ b/meta-python/recipes-devtools/python/python-engineio.inc
> @@ -9,5 +9,5 @@ inherit pypi
>  =20
>   PYPI_PACKAGE =3D "python-engineio"
>  =20
> -SRC_URI[md5sum] =3D "13345452be25c3b63d041f8f89e662d1"
> -SRC_URI[sha256sum] =3D "47ae4a9b3b4f2e8a68929f37a518338838e119f24c9a912=
1af92c49f8bea55c3"
> +SRC_URI[md5sum] =3D "e6ea8b3f2f32eeeb02014c46092f2adb"
> +SRC_URI[sha256sum] =3D "2481732d93646998f7372ef0ecf003af7817b82720b881d=
b173c3d50b4887916"
> diff --git a/meta-python/recipes-devtools/python/python3-engineio_3.11.2=
.bb b/meta-python/recipes-devtools/python/python3-engineio_3.12.1.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python3-engineio_3.11.2.=
bb
> rename to meta-python/recipes-devtools/python/python3-engineio_3.12.1.bb
>=20
>=20
>=20
>=20

--=20
Pierre-Jean Texier
Embedded Linux Engineer
https://koncepto.io
