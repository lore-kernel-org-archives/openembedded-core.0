Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web12.5917.1618818684606773118
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Apr 2021 00:51:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FglTWaen;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id e7so39381330edu.10
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Apr 2021 00:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Iw7Vijsb8hcfDzFUCLUoCB7gXFMUK8GQTaiNsJpC48E=;
        b=FglTWaenZvsxEUgyeioOnu2JWM3U2hzLu+vHLRXwiCTnvAWPj+BttIz/6J7kbdJjrK
         tSWdMXQFRmZ7p2oNgslovq7/3ulqRFrzTaFk67B3N1j4oaWApLfaOz2qCQdBHSfEUvXN
         K4KsyAHHDNvITrDj61Ucp42CelR5cUzhUbykmZC/U2V3H4JqPxvt1ZNDShvvQi9QJfYt
         Bda9PrNKjmKw3U5LLQNReN5w1zSiwo1KL+9xQY/9K60ALpr6+XsSABTi4dRA5C9LP/zi
         SCApmWh86d+wxjfFovN8N2+I1ZiVSwuTpZPtYNMpnpV+3XGQ72Z3ZgVSBsP1ySM+XC/C
         iNPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Iw7Vijsb8hcfDzFUCLUoCB7gXFMUK8GQTaiNsJpC48E=;
        b=l4/jQpgB26ehhyHt6hzn03xOQumIXmmTJnm+H3mMPZXPO8mN+WoTdXM7K/41Ap5gOP
         SIcvNkgjfmj2pzPn6WRW5obOoWd0brYpXZfxBbirdsrMzIrUt7FjPNGuc5MTzJfhEuP9
         JqaG1eiXneToZim5VLNpIez+p4D7IUlQiGYyZ5Sx3CFCLtqApRz9xHz8wtQpVFUwBq4I
         ugTnHOXghL0RLNQIvNF3ahBaISMNirpYYL4HRzMldrg2mvURj8Bn6/vD77O/PArGtm1V
         jjiF0fqxEibWrAfQJfej00YShgNGJCUj3LPJfktNqYb/oS+lG5xB2bLEbVMNgoe96oue
         4x+Q==
X-Gm-Message-State: AOAM531GkRJtdK3N1oIIr5ugkIeyRtyzcdMIhdPzNU4PnBjKs0Yur0aR
	F9ESOLw0o1UgY20hEl+TlhM=
X-Google-Smtp-Source: ABdhPJwJfBDFx8tA127NTlB4hpitQjYVnjN8HXAwRZeIqmoNbHTqJQeWVhGScQQp7up4ULPmX+rRQA==
X-Received: by 2002:a05:6402:4245:: with SMTP id g5mr24153984edb.306.1618818683179;
        Mon, 19 Apr 2021 00:51:23 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id e16sm12221422edu.94.2021.04.19.00.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 00:51:22 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 19 Apr 2021 09:51:21 +0200
To: Naveen Saini <naveen.kumar.saini@intel.com>
Cc: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>,
	Khem Raj <raj.khem@gmail.com>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>,
	wangmy <wangmy@fujitsu.com>
Subject: Re: [OE-core] [PATCH v2] go: upgrade 1.16.2 -> 1.16.3
Message-ID: <20210419075121.c3f43vbrqudy26pt@jama>
References: <20210410013005.2232041-1-raj.khem@gmail.com>
 <876f7807-4d37-94bc-0592-806ded94c87d@linux.microsoft.com>
 <eec642ef8f5e4bb79194c384092181e7@intel.com>
MIME-Version: 1.0
In-Reply-To: <eec642ef8f5e4bb79194c384092181e7@intel.com>
X-Groupsio-MsgNum: 150663
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ja7wxawray4iul44"
Content-Disposition: inline

--ja7wxawray4iul44
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 19, 2021 at 04:25:26AM +0000, Naveen Saini wrote:
> [SWAT]
> Fetching error:
> recipe go-runtime-1.16.3-r0: task do_fetch: Failed
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2053/s=
teps/23/logs/stdio

That seems related to
https://git.openembedded.org/openembedded-core/commit/?id=3D2a1eb731ed3bcb=
049192550e362b771c3a9ea6eb
not this go upgrade.

Also locally I can fetch this over http:// as well as https:// without
any issues with wget, but it's true that with chrome I see valid
certificate on https://golang.org/dl but not on
https://golang.org/dl/go1.16.3.src.tar.gz
or
https://golang.org/dl/go1.16.2.src.tar.gz

and curl downloads just the link to dl.google.com/go=20
$ curl https://golang.org/dl/go1.16.3.src.tar.gz=20
<a href=3D"https://dl.google.com/go/go1.16.3.src.tar.gz">Found</a>.

Maybe we should just use https://dl.google.com/go directly to fetch
go.
=20
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.=
openembedded.org> On Behalf Of Alejandro Hernandez Samaniego
> Sent: Thursday, April 15, 2021 5:49 AM
> To: Khem Raj <raj.khem@gmail.com>; openembedded-core@lists.openembedded.=
org
> Cc: wangmy <wangmy@fujitsu.com>
> Subject: Re: [OE-core] [PATCH v2] go: upgrade 1.16.2 -> 1.16.3
>=20
>=20
> Hello,
>=20
>=20
>=20
> This one is causing failures in test_yocto_source_mirror
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2037/s=
teps/23/logs/stdio
>=20
> although since its still on master-next my guess is that its sources hav=
ent been published
>=20
> yet to downloads.yoctoproject.org
>=20
>=20
>=20
> Alejandro
>=20
>=20
> On 4/10/21 1:30 AM, Khem Raj wrote:
>=20
> From: wangmy <wangmy@fujitsu.com><mailto:wangmy@fujitsu.com>
>=20
>=20
>=20
> This is bugfix release in 1.16 series [1]
>=20
>=20
>=20
> [1] https://github.com/golang/go/issues?q=3Dmilestone%3AGo1.16.3+label%3=
ACherryPickApproved
>=20
>=20
>=20
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com><mailto:wangmy@fujitsu.co=
m>
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com><mailto:raj.khem@gmail.com>
>=20
> ---
>=20
> v2: Fix checksums and improve commit msg
>=20
>=20
>=20
>  meta/recipes-devtools/go/{go-1.16.2.inc =3D> go-1.16.3.inc}     | 4 ++-=
-
>=20
>  ...{go-binary-native_1.16.2.bb =3D> go-binary-native_1.16.3.bb} | 4 ++-=
-
>=20
>  ...o-cross-canadian_1.16.2.bb =3D> go-cross-canadian_1.16.3.bb} | 0
>=20
>  .../go/{go-cross_1.16.2.bb =3D> go-cross_1.16.3.bb}             | 0
>=20
>  .../go/{go-crosssdk_1.16.2.bb =3D> go-crosssdk_1.16.3.bb}       | 0
>=20
>  .../go/{go-native_1.16.2.bb =3D> go-native_1.16.3.bb}           | 0
>=20
>  .../go/{go-runtime_1.16.2.bb =3D> go-runtime_1.16.3.bb}         | 0
>=20
>  meta/recipes-devtools/go/{go_1.16.2.bb =3D> go_1.16.3.bb}       | 0
>=20
>  8 files changed, 4 insertions(+), 4 deletions(-)
>=20
>  rename meta/recipes-devtools/go/{go-1.16.2.inc =3D> go-1.16.3.inc} (88%=
)
>=20
>  rename meta/recipes-devtools/go/{go-binary-native_1.16.2.bb =3D> go-bin=
ary-native_1.16.3.bb} (83%)
>=20
>  rename meta/recipes-devtools/go/{go-cross-canadian_1.16.2.bb =3D> go-cr=
oss-canadian_1.16.3.bb} (100%)
>=20
>  rename meta/recipes-devtools/go/{go-cross_1.16.2.bb =3D> go-cross_1.16.=
3.bb} (100%)
>=20
>  rename meta/recipes-devtools/go/{go-crosssdk_1.16.2.bb =3D> go-crosssdk=
_1.16.3.bb} (100%)
>=20
>  rename meta/recipes-devtools/go/{go-native_1.16.2.bb =3D> go-native_1.1=
6.3.bb} (100%)
>=20
>  rename meta/recipes-devtools/go/{go-runtime_1.16.2.bb =3D> go-runtime_1=
.16.3.bb} (100%)
>=20
>  rename meta/recipes-devtools/go/{go_1.16.2.bb =3D> go_1.16.3.bb} (100%)
>=20
>=20
>=20
> diff --git a/meta/recipes-devtools/go/go-1.16.2.inc b/meta/recipes-devto=
ols/go/go-1.16.3.inc
>=20
> similarity index 88%
>=20
> rename from meta/recipes-devtools/go/go-1.16.2.inc
>=20
> rename to meta/recipes-devtools/go/go-1.16.3.inc
>=20
> index e65caf8197..ebd25a5eaa 100644
>=20
> --- a/meta/recipes-devtools/go/go-1.16.2.inc
>=20
> +++ b/meta/recipes-devtools/go/go-1.16.3.inc
>=20
> @@ -1,7 +1,7 @@
>=20
>  require go-common.inc
>=20
>=20
>=20
>  GO_BASEVERSION =3D "1.16"
>=20
> -PV =3D "1.16.2"
>=20
> +PV =3D "1.16.3"
>=20
>  FILESEXTRAPATHS_prepend :=3D "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
>=20
>=20
>=20
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd7=
4707"<file://LICENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd74707>
>=20
> @@ -17,4 +17,4 @@ SRC_URI +=3D "\
>=20
>      file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
>=20
>      file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch \
>=20
>  "
>=20
> -SRC_URI[main.sha256sum] =3D "37ca14287a23cb8ba2ac3f5c3dd8adbc1f7a54b970=
1a57824bf19a0b271f83ea"
>=20
> +SRC_URI[main.sha256sum] =3D "b298d29de9236ca47a023e382313bcc2d2eed31dfa=
706b60a04103ce83a71a25"
>=20
> diff --git a/meta/recipes-devtools/go/go-binary-native_1.16.2.bb b/meta/=
recipes-devtools/go/go-binary-native_1.16.3.bb
>=20
> similarity index 83%
>=20
> rename from meta/recipes-devtools/go/go-binary-native_1.16.2.bb
>=20
> rename to meta/recipes-devtools/go/go-binary-native_1.16.3.bb
>=20
> index 4fb060173c..d01a2bd8f1 100644
>=20
> --- a/meta/recipes-devtools/go/go-binary-native_1.16.2.bb
>=20
> +++ b/meta/recipes-devtools/go/go-binary-native_1.16.3.bb
>=20
> @@ -8,8 +8,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5d4950ecb7b26=
d2c5e4e7b4e0dd74707"<file://LICENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd74707>
>=20
>  PROVIDES =3D "go-native"
>=20
>=20
>=20
>  SRC_URI =3D "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOA=
RCH}.tar.gz;name=3Dgo_${BUILD_GOTUPLE}"<https://dl.google.com/go/go$%7bPV%7=
d.$%7bBUILD_GOOS%7d-$%7bBUILD_GOARCH%7d.tar.gz;name=3Dgo_$%7bBUILD_GOTUPLE%=
7d>
>=20
> -SRC_URI[go_linux_amd64.sha256sum] =3D "542e936b19542e62679766194364f451=
41fde55169db2d8d01046555ca9eb4b8"
>=20
> -SRC_URI[go_linux_arm64.sha256sum] =3D "6924601d998a0917694fd14261347e37=
98bd2ad6b13c4d7f2edd70c9d57f62ab"
>=20
> +SRC_URI[go_linux_amd64.sha256sum] =3D "951a3c7c6ce4e56ad883f97d9db74d3d=
6d80d5fec77455c6ada6c1f7ac4776d2"
>=20
> +SRC_URI[go_linux_arm64.sha256sum] =3D "566b1d6f17d2bc4ad5f81486f0df44f3=
088c3ed47a3bec4099d8ed9939e90d5d"
>=20
>=20
>=20
>  UPSTREAM_CHECK_URI =3D "https://golang.org/dl/"<https://golang.org/dl/>
>=20
>  UPSTREAM_CHECK_REGEX =3D "go(?P<pver>\d+(\.\d+)+)\.linux"
>=20
> diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.16.2.bb b/meta=
/recipes-devtools/go/go-cross-canadian_1.16.3.bb
>=20
> similarity index 100%
>=20
> rename from meta/recipes-devtools/go/go-cross-canadian_1.16.2.bb
>=20
> rename to meta/recipes-devtools/go/go-cross-canadian_1.16.3.bb
>=20
> diff --git a/meta/recipes-devtools/go/go-cross_1.16.2.bb b/meta/recipes-=
devtools/go/go-cross_1.16.3.bb
>=20
> similarity index 100%
>=20
> rename from meta/recipes-devtools/go/go-cross_1.16.2.bb
>=20
> rename to meta/recipes-devtools/go/go-cross_1.16.3.bb
>=20
> diff --git a/meta/recipes-devtools/go/go-crosssdk_1.16.2.bb b/meta/recip=
es-devtools/go/go-crosssdk_1.16.3.bb
>=20
> similarity index 100%
>=20
> rename from meta/recipes-devtools/go/go-crosssdk_1.16.2.bb
>=20
> rename to meta/recipes-devtools/go/go-crosssdk_1.16.3.bb
>=20
> diff --git a/meta/recipes-devtools/go/go-native_1.16.2.bb b/meta/recipes=
-devtools/go/go-native_1.16.3.bb
>=20
> similarity index 100%
>=20
> rename from meta/recipes-devtools/go/go-native_1.16.2.bb
>=20
> rename to meta/recipes-devtools/go/go-native_1.16.3.bb
>=20
> diff --git a/meta/recipes-devtools/go/go-runtime_1.16.2.bb b/meta/recipe=
s-devtools/go/go-runtime_1.16.3.bb
>=20
> similarity index 100%
>=20
> rename from meta/recipes-devtools/go/go-runtime_1.16.2.bb
>=20
> rename to meta/recipes-devtools/go/go-runtime_1.16.3.bb
>=20
> diff --git a/meta/recipes-devtools/go/go_1.16.2.bb b/meta/recipes-devtoo=
ls/go/go_1.16.3.bb
>=20
> similarity index 100%
>=20
> rename from meta/recipes-devtools/go/go_1.16.2.bb
>=20
> rename to meta/recipes-devtools/go/go_1.16.3.bb
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20

>=20
>=20
>=20


--ja7wxawray4iul44
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCYH02dwAKCRA3VSO3ZXaA
HEJdAJ0Tq4gXQVxPJfJ26F8D/ILDtFG3YwCgn+mcnV67UCi0x+Ozx7w0agFHEbI=
=dBA+
-----END PGP SIGNATURE-----

--ja7wxawray4iul44--
