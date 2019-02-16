Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 63D037C79B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Feb 2019 22:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 17EA218324;
	Sat, 16 Feb 2019 23:48:14 +0100 (CET)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id bdrivJS0TLim; Sat, 16 Feb 2019 23:48:13 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 73245182BF;
	Sat, 16 Feb 2019 23:48:13 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 613221A05E;
	Sat, 16 Feb 2019 23:48:13 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 55FD81A05D;
	Sat, 16 Feb 2019 23:48:13 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Sat, 16 Feb 2019 23:48:13 +0100 (CET)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by seth.se.axis.com (Postfix) with ESMTP id 4A66BF67;
	Sat, 16 Feb 2019 23:48:13 +0100 (CET)
Received: from xbox12.axis.com (10.0.5.26) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Sat, 16 Feb 2019 23:48:13 +0100
Received: from XBOX04.axis.com (10.0.5.18) by xbox12.axis.com (10.0.5.26) with
	Microsoft SMTP Server (TLS) id 15.0.1395.4;
	Sat, 16 Feb 2019 23:48:12 +0100
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Sat, 16 Feb 2019 23:48:12 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 5/7] font-util: Break circular native RDEPENDS
Thread-Index: AQHUxkExUWNO6gK6U0O2T9AtCuXvN6XjBpDw
Date: Sat, 16 Feb 2019 22:48:12 +0000
Message-ID: <d3b80a7844ad4c0c85fd93f81906205e@XBOX04.axis.com>
References: <20190216214638.11456-1-richard.purdie@linuxfoundation.org>
	<20190216214638.11456-5-richard.purdie@linuxfoundation.org>
In-Reply-To: <20190216214638.11456-5-richard.purdie@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH 5/7] font-util: Break circular native RDEPENDS
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
X-List-Received-Date: Sat, 16 Feb 2019 22:48:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Richard Purdie
> Sent: den 16 februari 2019 22:47
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 5/7] font-util: Break circular native
> RDEPENDS
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-graphics/xorg-font/font-util_1.3.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-graphics/xorg-font/font-util_1.3.1.bb
> b/meta/recipes-graphics/xorg-font/font-util_1.3.1.bb
> index 34646ff99b4..1289c1686c6 100644
> --- a/meta/recipes-graphics/xorg-font/font-util_1.3.1.bb
> +++ b/meta/recipes-graphics/xorg-font/font-util_1.3.1.bb
> @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D5df208ec65eb84ce5bb8d82d8f3b9675 \
>  DEPENDS =3D "encodings util-macros"
>  DEPENDS_class-native =3D "util-macros-native"
>  RDEPENDS_${PN} =3D "mkfontdir mkfontscale encodings"
> -RDEPENDS_${PN}_class-native =3D "mkfontdir-native mkfontscale-native"
> +RDEPENDS_${PN}_class-native =3D ""

And the RDEPENDS above could be changed to:

RDEPENDS_${PN}_class-target =3D "mkfontdir mkfontscale encodings"

>  BBCLASSEXTEND =3D "native"
>=20
> --
> 2.20.1

//Peter


