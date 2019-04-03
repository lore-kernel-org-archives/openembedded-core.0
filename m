Return-Path: <pascal.bach@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 12EA27D26B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Apr 2019 09:20:25 +0000 (UTC)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x339KQdB028700
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Apr 2019 11:20:26 +0200
Received: from DEFTHW99ERMMSX.ww902.siemens.net
	(defthw99ermmsx.ww902.siemens.net [139.22.70.142])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTPS id x339KQLC008540
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Apr 2019 11:20:26 +0200
Received: from DEFTHW99ERPMSX.ww902.siemens.net (139.22.70.202) by
	DEFTHW99ERMMSX.ww902.siemens.net (139.22.70.142) with Microsoft SMTP
	Server (TLS) id 14.3.435.0; Wed, 3 Apr 2019 11:20:25 +0200
Received: from DENBGAT9EL2MSX.ww902.siemens.net ([169.254.9.89]) by
	DEFTHW99ERPMSX.ww902.siemens.net ([139.22.70.202]) with mapi id
	14.03.0435.000; Wed, 3 Apr 2019 11:20:24 +0200
From: "Bach, Pascal" <pascal.bach@siemens.com>
To: "Bach, Pascal" <pascal.bach@siemens.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] cmake: 3.14.0 -> 3.14.1
Thread-Index: AQHU6ITOeFeyD2IgF0C5H82g8R4vh6YqK7Gw
Date: Wed, 3 Apr 2019 09:20:23 +0000
Message-ID: <355BE46A91031048906B695426A8D8E62EA2ECB0@DENBGAT9EL2MSX.ww902.siemens.net>
References: <20190401121654.27469-1-pascal.bach@siemens.com>
In-Reply-To: <20190401121654.27469-1-pascal.bach@siemens.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [139.22.70.21]
MIME-Version: 1.0
Subject: Re: [PATCH] cmake: 3.14.0 -> 3.14.1
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
X-List-Received-Date: Wed, 03 Apr 2019 09:20:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This patch should also go into warrior as I think we should not ship 3.14.0=
 due to the issue mentioned bellow.

> -----Original Message-----
> From: Pascal Bach <pascal.bach@siemens.com>
> Sent: Montag, 1. April 2019 14:17
> To: openembedded-core@lists.openembedded.org
> Cc: Bach, Pascal (BT CPS R&D ZG FW CCP) <pascal.bach@siemens.com>
> Subject: [PATCH] cmake: 3.14.0 -> 3.14.1
>=20
> The FindFontconfig module added by 3.14.0 accidentally used uppercase
> FONTCONFIG_* variable names that do not match our conventions.
> 3.14.1 revises the module to use Fontconfig_* variable names.
> This is incompatible with 3.14.0 but since the module is new in the
> 3.14 series usage should not yet be widespread.
>=20
> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> ---
>  .../cmake/{cmake-native_3.14.0.bb =3D> cmake-native_3.14.1.bb}          =
| 0
>  meta/recipes-devtools/cmake/cmake.inc                                 | =
4 ++--
>  meta/recipes-devtools/cmake/{cmake_3.14.0.bb =3D> cmake_3.14.1.bb}      =
| 0
>  3 files changed, 2 insertions(+), 2 deletions(-)  rename meta/recipes-
> devtools/cmake/{cmake-native_3.14.0.bb =3D> cmake-native_3.14.1.bb}
> (100%)  rename meta/recipes-devtools/cmake/{cmake_3.14.0.bb =3D>
> cmake_3.14.1.bb} (100%)
>=20
> diff --git a/meta/recipes-devtools/cmake/cmake-native_3.14.0.bb
> b/meta/recipes-devtools/cmake/cmake-native_3.14.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/cmake/cmake-native_3.14.0.bb
> rename to meta/recipes-devtools/cmake/cmake-native_3.14.1.bb
> diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-
> devtools/cmake/cmake.inc
> index f787851e2d..5b0bce6808 100644
> --- a/meta/recipes-devtools/cmake/cmake.inc
> +++ b/meta/recipes-devtools/cmake/cmake.inc
> @@ -18,7 +18,7 @@ SRC_URI =3D
> "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz
> \
>             file://0004-Fail-silently-if-system-Qt-installation-is-broken=
.patch \  "
>=20
> -SRC_URI[md5sum] =3D "7504e4f3e05b59e083f2127e07059d5d"
> -SRC_URI[sha256sum] =3D
> "aa76ba67b3c2af1946701f847073f4652af5cbd9f141f221c97af99127e75502"
> +SRC_URI[md5sum] =3D "7efe5394e85c3292ad020b8b70e55669"
> +SRC_URI[sha256sum] =3D
> "7321be640406338fc12590609c42b0fae7ea12980855c1be363d25dcd76bb25f"
>=20
>  UPSTREAM_CHECK_REGEX =3D "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
> diff --git a/meta/recipes-devtools/cmake/cmake_3.14.0.bb b/meta/recipes-
> devtools/cmake/cmake_3.14.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/cmake/cmake_3.14.0.bb
> rename to meta/recipes-devtools/cmake/cmake_3.14.1.bb
> --
> 2.11.0


