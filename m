Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.openembedded.org (Postfix) with ESMTP id 5702E601DE
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 03:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=axis.com; l=2454; q=dns/txt; s=axis-central1;
	t=1581825089; x=1613361089;
	h=from:to:subject:date:message-id:references:in-reply-to:
	content-transfer-encoding:mime-version;
	bh=9L0ttko4SZcrJeCkTgy62QYPu0NoMDdCEIk3WSQZW7w=;
	b=L7PbYDHVXyOjx4sFln0t7cFcNq09soaIM2tcn6r4HExIl6aG2XgF6zWY
	e7e9UUoVm4c5m+jjtttoCQOVjPx7tzrTVXoNzDMH1Xyazhdl6S/VNuxjh
	E1BcttQpp9L5ISOj2Ayha2/Erx/UBtFbkfseuPx/usKvqlvK/psP9dcX5
	XgiDGASTftF+7WH2a5t5qvld7U5lSavT3P8+WrcbDNYG+NI/AMIdHGAuK
	jD35S846Ft3xOhchmB4PHD80tPdchxTEcYNjxXE4MduR9oicw0S13MK66
	1gzrAfEGHRMkd9aK4guub/NSbgN79iKCPRkJmdKf3zh77yK24RmhaL+jN Q==;
IronPort-SDR: aDd6fr+Y/cRN7SdBR9NkPZYeFv8ZllNbUDNgQQ7x+MndOPtCEZDI1WiK6g+w/ahG19pB4INxNR
	amLDCcJDGdD9fpYhtAWXXgmAEu/1jg5WUqnNTWgaIJ47G/oiOQme+E5Ru0br+rfNK96UOBMtV2
	uXWCxglPvY2iVFNvFdV+vgQBk97/EOP/VkcuMcVjIwwDgYSS2/cEuYwmcN8ubV0sBUvsjCosVm
	Gm5WrululPpDa9VGJPdl+7IwEWMBgyNozMMaFs4KDjfRLJJCD3OeiPHL6XjX2DAJirSmFobyvE
	OoU=
X-IronPort-AV: E=Sophos;i="5.70,447,1574118000"; 
   d="scan'208";a="5314279"
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Wang Mingyu <wangmy@cn.fujitsu.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core]  [PATCH] python3-pycairo: upgrade 1.18.2 -> 1.19.0
Thread-Index: AQHV41GWFSxwrvhyMkqhAXGGQSVCnagdJOsQ
Date: Sun, 16 Feb 2020 03:51:24 +0000
Message-ID: <e5331dd68dba451f814e1cb957ef43e0@XBOX03.axis.com>
References: <1581723869-21232-1-git-send-email-wangmy@cn.fujitsu.com>
	<1581723869-21232-4-git-send-email-wangmy@cn.fujitsu.com>
In-Reply-To: <1581723869-21232-4-git-send-email-wangmy@cn.fujitsu.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Subject: Re: [PATCH] python3-pycairo: upgrade 1.18.2 -> 1.19.0
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
X-List-Received-Date: Sun, 16 Feb 2020 03:51:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-core=
-
> bounces@lists.openembedded.org> On Behalf Of Wang Mingyu
> Sent: den 15 februari 2020 00:44
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] python3-pycairo: upgrade 1.18.2 -> 1.19.0
>=20
> -License-Update: "PDX-License-Identifier: LGPL-2.1-only OR MPL-1.1"
> is added

If the SPDX-License-Identifier is "LGPL-2.1-only OR MPL-1.1", why is=20
the LICENSE set to "LGPLv2.1 & MPLv1.1"? Shouldn't it be "LGPLv2.1 | MPLv1.=
1"?

//Peter

> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  ...{python3-pycairo_1.18.2.bb =3D> python3-pycairo_1.19.0.bb} | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-devtools/python/{python3-pycairo_1.18.2.bb =3D> pyth=
on3-pycairo_1.19.0.bb} (77%)
>=20
> diff --git a/meta/recipes-devtools/python/python3-pycairo_1.18.2.bb b/met=
a/recipes-devtools/python/python3-pycairo_1.19.0.bb
> similarity index 77%
> rename from meta/recipes-devtools/python/python3-pycairo_1.18.2.bb
> rename to meta/recipes-devtools/python/python3-pycairo_1.19.0.bb
> index 3aedf3d142..8f60834c17 100644
> --- a/meta/recipes-devtools/python/python3-pycairo_1.18.2.bb
> +++ b/meta/recipes-devtools/python/python3-pycairo_1.19.0.bb
> @@ -3,7 +3,7 @@ HOMEPAGE =3D "http://cairographics.org/pycairo"
>  BUGTRACKER =3D "http://bugs.freedesktop.org"
>  SECTION =3D "python-devel"
>  LICENSE =3D "LGPLv2.1 & MPLv1.1"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df2e071ab72978431b294a0d696327=
421 \
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df3713ca2c28d9312ad718520b6dc3=
eee \
>                      file://COPYING-LGPL-2.1;md5=3Dfad9b3332be894bab9bc50=
1572864b29 \
>                      file://COPYING-MPL-1.1;md5=3Dbfe1f75d606912a4111c907=
43d6c7325"
>=20
> @@ -13,8 +13,8 @@ DEPENDS =3D "cairo python3"
>  SRC_URI =3D "https://github.com/pygobject/pycairo/releases/download/v${P=
V}/pycairo-${PV}.tar.gz"
>  UPSTREAM_CHECK_URI =3D "https://github.com/pygobject/pycairo/releases/"
>=20
> -SRC_URI[md5sum] =3D "be2ba51f234270dec340f28f1695a95e"
> -SRC_URI[sha256sum] =3D "dcb853fd020729516e8828ad364084e752327d4cff8505d2=
0b13504b32b16531"
> +SRC_URI[md5sum] =3D "38b84416021640b01250c8f8ec4c52d4"
> +SRC_URI[sha256sum] =3D "4f5ba9374a46c98729dd3727d993f5e17ed0286fd6738ed4=
64fe4efa0612d19c"
>=20
>  S =3D "${WORKDIR}/pycairo-${PV}"
>=20
> --
> 2.17.1


