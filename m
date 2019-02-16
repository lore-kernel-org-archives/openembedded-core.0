Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id CAA177C62D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Feb 2019 22:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 0B22218324;
	Sat, 16 Feb 2019 23:45:50 +0100 (CET)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id rZNZgibAgIF8; Sat, 16 Feb 2019 23:45:49 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 6A254182BF;
	Sat, 16 Feb 2019 23:45:49 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 548471E056;
	Sat, 16 Feb 2019 23:45:49 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 48D731E054;
	Sat, 16 Feb 2019 23:45:49 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Sat, 16 Feb 2019 23:45:49 +0100 (CET)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by seth.se.axis.com (Postfix) with ESMTP id 3CAF9301F;
	Sat, 16 Feb 2019 23:45:49 +0100 (CET)
Received: from XBOX04.axis.com (10.0.5.18) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Sat, 16 Feb 2019 23:45:48 +0100
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Sat, 16 Feb 2019 23:45:48 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 4/7] glib-2.0-native: Break circular dependency
	on	shared-mime-utils
Thread-Index: AQHUxkEvKYYOOR3BOUO//dblhMgAFaXjBZoQ
Date: Sat, 16 Feb 2019 22:45:48 +0000
Message-ID: <05262e8e31704f8a91db22e0ffb140db@XBOX04.axis.com>
References: <20190216214638.11456-1-richard.purdie@linuxfoundation.org>
	<20190216214638.11456-4-richard.purdie@linuxfoundation.org>
In-Reply-To: <20190216214638.11456-4-richard.purdie@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH 4/7] glib-2.0-native: Break circular dependency on	shared-mime-utils
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
X-List-Received-Date: Sat, 16 Feb 2019 22:45:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Richard Purdie
> Sent: den 16 februari 2019 22:47
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 4/7] glib-2.0-native: Break circular
> dependency on shared-mime-utils
>=20
> If we fix native RDEPENDS handling, it exposes a problem where there
> is a circular dependency between shared-mime-utils and glib-2.0-native.
>=20
> Break this dependency in the -native case.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-core/glib-2.0/glib.inc | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-
> core/glib-2.0/glib.inc
> index c9093cee866..7e2847d4b22 100644
> --- a/meta/recipes-core/glib-2.0/glib.inc
> +++ b/meta/recipes-core/glib-2.0/glib.inc
> @@ -80,6 +80,7 @@ FILES_${PN}-utils =3D "${bindir}/*"
>  RRECOMMENDS_${PN} +=3D "shared-mime-info"

Wouldn't it be clearer to change this to:

RRECOMMENDS_${PN}_append_class-target =3D " shared-mime-info"

instead of adding the RRECOMMENDS_${PN}_class-native below?

>  # When cross compiling for Windows we don't want to include this
>  RRECOMMENDS_${PN}_remove_mingw32 =3D "shared-mime-info"
> +RRECOMMENDS_${PN}_class-native =3D ""
>=20
>  ARM_INSTRUCTION_SET_armv4 =3D "arm"
>  ARM_INSTRUCTION_SET_armv5 =3D "arm"
> --
> 2.20.1

//Peter


