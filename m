Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.openembedded.org (Postfix) with ESMTP id EA0227F8AA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 13:47:53 +0000 (UTC)
IronPort-SDR: NPFntYuiBFeFX2pumf7bvQSpHkr1Kyaf+D14GHgdI7vQSSUNxhjzcX2iWe84N9biKU3z6pmyv/
	O96Nx+rBzuF6bz4NiTi3N0e9njbazTnYZvN03ZI6S2kzYfTUkNgzQpFGw0MeCermppsxKx5gH/
	BUezhuxr45T2d+sChztNn/NgmzT+5xGvNd7TVP6h6QwawUbuRlrwigbUE14bR0PJQ2VInQbMj2
	ocAAEMEk1MZQOKF9q2xIwayNofwYvxNsO4t9Oso0nymLrNx3N+WRy+vJI2YLMOeFtKR4KGm5rK
	8jk=
X-IronPort-AV: E=Sophos;i="5.68,320,1569276000"; 
   d="scan'208";a="2634980"
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 12/13] systat: upstream version check is
	working	again
Thread-Index: AQHVnhGGdRZfjJCW+kS2QZuX/d52YaeQ8Sag
Date: Mon, 18 Nov 2019 13:47:52 +0000
Message-ID: <d733009e235648a1adcc2dc72f46a85d@XBOX03.axis.com>
References: <20191118130801.21860-1-alex.kanavin@gmail.com>
	<20191118130801.21860-12-alex.kanavin@gmail.com>
In-Reply-To: <20191118130801.21860-12-alex.kanavin@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Subject: Re: [PATCH 12/13] systat: upstream version check is working	again
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
X-List-Received-Date: Mon, 18 Nov 2019 13:47:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-core=
-
> bounces@lists.openembedded.org> On Behalf Of Alexander Kanavin
> Sent: den 18 november 2019 14:08
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 12/13] systat: upstream version check is workin=
g again

systat -> sysstat

//Peter

>=20
> As upstream has released a new stable version,
> the exception is no longer needed.
>=20
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-extended/sysstat/sysstat.inc | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-
> extended/sysstat/sysstat.inc
> index 62de36b44bf..77cc6f2cf2a 100644
> --- a/meta/recipes-extended/sysstat/sysstat.inc
> +++ b/meta/recipes-extended/sysstat/sysstat.inc
> @@ -10,7 +10,6 @@ SRC_URI =3D "http://pagesperso-
> orange.fr/sebastien.godard/${BP}.tar.xz \
>            "
>=20
>  UPSTREAM_CHECK_URI =3D "http://sebastien.godard.pagesperso-
> orange.fr/download.html"
> -UPSTREAM_VERSION_UNKNOWN =3D "1"
>=20
>  DEPENDS +=3D "base-passwd"
>=20
> --
> 2.17.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

