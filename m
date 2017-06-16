Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5B260782DD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 17:54:56 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id d5so7579419pfe.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 10:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to; bh=vjSCJ222YYkv5yetYbyEAvYbddWhlOObZHye0nr+ueU=;
	b=ib64zH231XyV9/SyU4DL9bBJyti6oBCckYCejHNREMqAHVDDBoi7iiKvu10+It/ALS
	0JUvUZ7R2UcF9wvadH+MfsjshKdab24ojot7wTaAULL3T/DWwQC6bk08ksmp6iU0s0Wr
	MNEtt8SEwaZ/K9//BZyqH4tLQUUT59Rkeuvyq7ZAo3Sw7jJv9Oz9DGXG+pq5GnIfJR/9
	4M9cX4iR0hPe+mTqSpZdlk74uUxwkAZMWTYuCgRNWFw9UF2PzoXPXO4vum9ZsarHqHM4
	khx+wweaUsyVR4vUjsJymTvS1KNEJezixDx8LPHBiRWF/R+Z3qDt3I7bFbpNJajw/3Qp
	R6gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=vjSCJ222YYkv5yetYbyEAvYbddWhlOObZHye0nr+ueU=;
	b=FI1s3DM3gtgIE7x9qtM/7JmlWYXa0twzKi9QP4x4pthYCnXIm/GrOcXEvbJ+X7p7ql
	8aXDQYtEgf9gF2VZYi6n4mGxaqJtPCmaM58edDvwA9gsdPzS5zn3qJNRFTQAcRklx7Pa
	4Xdzj/8cajC/RV3a+xuYR/F2Hb/i/jEmVO4UiERaD27TdVwU7m4x7m5+8XF2a79izX/b
	sLXA6xC3wyVx71QlSI7dlR/mY5RqvSe8k6t/RVvBw130DdLSoA9QYO7Cg+OsVIe1AsPv
	03H5PrapfmPBqbX8LVPD7Z7yGOD3Oqz7mKhhJqcmrahU6ov1ZPDyQ8/s0DFLXlGEIuQT
	BU7g==
X-Gm-Message-State: AKS2vOylqKJ8/TONu3XEqOJs+LZ/9EGOXryPtDqogdXfMHLpelgBYFnb
	DFQFCHVpZYInncNAxco=
X-Received: by 10.84.214.150 with SMTP id j22mr14082756pli.137.1497635697896; 
	Fri, 16 Jun 2017 10:54:57 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:745f:c6ab:d92d:5f3f?
	([2601:646:8882:b8c:745f:c6ab:d92d:5f3f])
	by smtp.gmail.com with ESMTPSA id
	z66sm6602545pfl.13.2017.06.16.10.54.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Jun 2017 10:54:56 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <cover.1497615866.git.alexander.kanavin@linux.intel.com>
	<d8d07071866bfeac6bccb8e50f099d9cb3113d2a.1497615866.git.alexander.kanavin@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <642953f4-8927-acdc-a469-6970a3fb450d@gmail.com>
Date: Fri, 16 Jun 2017 10:54:50 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:54.0)
	Gecko/20100101 Thunderbird/54.0
MIME-Version: 1.0
In-Reply-To: <d8d07071866bfeac6bccb8e50f099d9cb3113d2a.1497615866.git.alexander.kanavin@linux.intel.com>
Subject: Re: [PATCH 20/32] icu: update to 59.1
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
X-List-Received-Date: Fri, 16 Jun 2017 17:54:57 -0000
X-Groupsio-MsgNum: 99005
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="KhHrafaKCJUF80vrKnbQ4thNLHrat8X6A"

--KhHrafaKCJUF80vrKnbQ4thNLHrat8X6A
Content-Type: multipart/mixed; boundary="kwneEVvlffw5ME8VtX4Vi7xBvXIAwDknA";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <642953f4-8927-acdc-a469-6970a3fb450d@gmail.com>
Subject: Re: [OE-core] [PATCH 20/32] icu: update to 59.1
References: <cover.1497615866.git.alexander.kanavin@linux.intel.com>
 <d8d07071866bfeac6bccb8e50f099d9cb3113d2a.1497615866.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <d8d07071866bfeac6bccb8e50f099d9cb3113d2a.1497615866.git.alexander.kanavin@linux.intel.com>

--kwneEVvlffw5ME8VtX4Vi7xBvXIAwDknA
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 6/16/17 5:28 AM, Alexander Kanavin wrote:
> License checksum change due to copyright year update.
>=20
> Latest icu will not compile with anything less than C++11, so
> drop the enforcement of an earlier C++ version. This should be okay,
> as there is now a fix in place for the problem of mixing native gcc 4/5=

> compiled code:
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3Dc21cec84886=
d9c70396e9be0ceb9a8ef300b54be
>=20
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/conf/distro/include/uninative-flags.inc          | 4 ----
>  meta/recipes-support/icu/{icu_58.2.bb =3D> icu_59.1.bb} | 6 +++---
>  2 files changed, 3 insertions(+), 7 deletions(-)
>  rename meta/recipes-support/icu/{icu_58.2.bb =3D> icu_59.1.bb} (77%)
>=20
> diff --git a/meta/conf/distro/include/uninative-flags.inc b/meta/conf/d=
istro/include/uninative-flags.inc
> index f5b15471a4b..febf2a53e52 100644
> --- a/meta/conf/distro/include/uninative-flags.inc
> +++ b/meta/conf/distro/include/uninative-flags.inc
> @@ -1,7 +1,3 @@
> -# icu configure defaults to CXX11 if no -std=3D option is passed in CX=
XFLAGS
> -# therefore pass one
> -BUILD_CXXFLAGS_append_pn-icu-native =3D " -std=3Dc++98"
> -

I think this change should be tried on oldest supported distro for build
host like centos, I wonder if the std option was papering over c++11
missing bits on gcc 4.8

>  # Some distros (ubuntu 16.10, debian-testing) default to gcc configure=
d with
>  # --enable-default-pie (see gcc -v). This breaks e.g. prelink-native o=
n a pie
>  # default system if binutils-native was built on a system which is not=
 pie default
> diff --git a/meta/recipes-support/icu/icu_58.2.bb b/meta/recipes-suppor=
t/icu/icu_59.1.bb
> similarity index 77%
> rename from meta/recipes-support/icu/icu_58.2.bb
> rename to meta/recipes-support/icu/icu_59.1.bb
> index 4d062ebf941..55087c336dc 100644
> --- a/meta/recipes-support/icu/icu_58.2.bb
> +++ b/meta/recipes-support/icu/icu_59.1.bb
> @@ -1,6 +1,6 @@
>  require icu.inc
> =20
> -LIC_FILES_CHKSUM =3D "file://../LICENSE;md5=3D1b3b75c1777cd49ad5c6a24c=
d338cfc9"
> +LIC_FILES_CHKSUM =3D "file://../LICENSE;md5=3Dfe9e1f2c500466d8f18df2cd=
068e4b74"
> =20
>  def icu_download_version(d):
>      pvsplit =3D d.getVar('PV').split('.')
> @@ -21,8 +21,8 @@ SRC_URI =3D "${BASE_SRC_URI} \
>  SRC_URI_append_class-target =3D "\
>             file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
>            "
> -SRC_URI[md5sum] =3D "fac212b32b7ec7ab007a12dff1f3aea1"
> -SRC_URI[sha256sum] =3D "2b0a4410153a9b20de0e20c7d8b66049a72aef244b5368=
3d0d7521371683da0c"
> +SRC_URI[md5sum] =3D "54923fa9fab5b2b83f235fb72523de37"
> +SRC_URI[sha256sum] =3D "7132fdaf9379429d004005217f10e00b7d2319d0fea22b=
dfddef8991c45b75fe"
> =20
>  UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)/"
>  UPSTREAM_CHECK_URI =3D "http://download.icu-project.org/files/icu4c/"
>=20



--kwneEVvlffw5ME8VtX4Vi7xBvXIAwDknA--

--KhHrafaKCJUF80vrKnbQ4thNLHrat8X6A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAllEG24ACgkQuwUzVZGdMxTZ8wCcCNkCO6gtQ0jo2xuPvBa4WA3H
7twAn0H/vROldpPBl6IIo8qM4ChblvYn
=g6nL
-----END PGP SIGNATURE-----

--KhHrafaKCJUF80vrKnbQ4thNLHrat8X6A--
