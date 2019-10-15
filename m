Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 720437F456
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 16:22:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 8884B18317;
	Tue, 15 Oct 2019 18:22:46 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id FFEvhwbOV7Rk; Tue, 15 Oct 2019 18:22:45 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 82FF81836A;
	Tue, 15 Oct 2019 18:22:45 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 71D1E1E080;
	Tue, 15 Oct 2019 18:22:45 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 662241E07E;
	Tue, 15 Oct 2019 18:22:45 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Tue, 15 Oct 2019 18:22:45 +0200 (CEST)
Received: from XBOX08.axis.com (xbox08.axis.com [10.0.15.178])
	by seth.se.axis.com (Postfix) with ESMTP id 59EAE2E44;
	Tue, 15 Oct 2019 18:22:45 +0200 (CEST)
Received: from xbox12.axis.com (10.0.5.26) by XBOX08.axis.com (10.0.15.178)
	with Microsoft SMTP Server (TLS) id 15.0.1395.4;
	Tue, 15 Oct 2019 18:22:45 +0200
Received: from XBOX03.axis.com (10.0.5.17) by xbox12.axis.com (10.0.5.26) with
	Microsoft SMTP Server (TLS) id 15.0.1395.4;
	Tue, 15 Oct 2019 18:22:45 +0200
Received: from XBOX03.axis.com ([fe80::e49e:4060:87cc:61a]) by XBOX03.axis.com
	([fe80::e49e:4060:87cc:61a%22]) with mapi id 15.00.1365.000;
	Tue, 15 Oct 2019 18:22:44 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Aatir <aatrapps@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] devtool: nlohmann-fifo
Thread-Index: AQHVg1lbZulO8oO40ESt2J9lUQkBqqdb4EvA
Date: Tue, 15 Oct 2019 16:22:44 +0000
Message-ID: <39a0c511bec44716a8be051b6d691b0d@XBOX03.axis.com>
References: <20191015130551.32707-1-aatrapps@gmail.com>
In-Reply-To: <20191015130551.32707-1-aatrapps@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH] devtool: nlohmann-fifo
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
X-List-Received-Date: Tue, 15 Oct 2019 16:22:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This was sent to the wrong mailing list. Please send it to=20
openembedded-devel@lists.openembedded.org instead (no idea why=20
patchwork is not complaining).=20

See further comments below.

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Aatir
> Sent: den 15 oktober 2019 15:06
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] devtool: nlohmann-fifo

Change the subject to something like this instead:

nlohmann-fifo: Add recipe

>=20
> From: Tekkub <aatrapps@gmail.com>
>=20
> Adding nlohmann-fifo, a c++ header library for fifo maps.
>=20
> Signed-off-by: Aatir <aatrapps@gmail.com>
>=20
>  Author:    Aatir <aatrapps@gmail.com>

Remove the Author footer.

> ---
>  .../nlohmann-fifo/nlohmann-fifo_git.bb        | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_=
git.bb
>=20
> diff --git a/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb =
b/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb
> new file mode 100644
> index 000000000..afab2eac4
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb
> @@ -0,0 +1,22 @@
> +SUMMARY =3D "fifo maps for c++"
> +HOMEPAGE =3D "/"

Change to:

HOMEPAGE =3D "https://github.com/nlohmann/fifo_map"

> +SECTION =3D "libs"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.MIT;md5=3Db67209a1e36b682a8226de19d=
265b1e0"
> +
> +SRC_URI =3D "git://github.com/nlohmann/fifo_map.git"
> +
> +PV =3D "1.0.0+git${SRCPV}"
> +
> +SRCREV =3D "0dfbf5dacbb15a32c43f912a7e66a54aae39d0f9"
> +
> +S =3D "${WORKDIR}/git"
> +
> +RDEPENDS_${PN}-dev =3D ""
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> +
> +do_install() {
> +    install -d ${D}${includedir}
> +    install -m 0644 ${S}/src/fifo_map.hpp ${D}${includedir}/fifo_map.hpp

Remove "/fifo_map.hpp" at the end since the target file name matches=20
the source file name.

> +}
> --
> 2.17.1

//Peter


