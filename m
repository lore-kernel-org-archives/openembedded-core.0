Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id E89B860191
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Sep 2018 08:15:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 59EA51834E;
	Tue,  4 Sep 2018 10:15:35 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id dpRd6vHH7fVP; Tue,  4 Sep 2018 10:15:29 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id A704F18378;
	Tue,  4 Sep 2018 10:15:29 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 809DD1A07B;
	Tue,  4 Sep 2018 10:15:29 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 74CD61A077;
	Tue,  4 Sep 2018 10:15:29 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Tue,  4 Sep 2018 10:15:29 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by thoth.se.axis.com (Postfix) with ESMTP id 67E542957;
	Tue,  4 Sep 2018 10:15:29 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Tue, 4 Sep 2018 10:15:29 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Tue, 4 Sep 2018 10:15:29 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Robert Yang <liezhi.yang@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/1] bitbake.conf: Make BUILD_OPTIMIZATION
	respect	to DEBUG_BUILD
Thread-Index: AQHURBgm2+sbz2k690agia8x/+hKqKTfwtzA
Date: Tue, 4 Sep 2018 08:15:29 +0000
Message-ID: <8db3e1637d3c4714aa90df95492b2f84@XBOX02.axis.com>
References: <cover.1536042978.git.liezhi.yang@windriver.com>
	<ea8e96b3f2b09db17ecf9a28765b709433febe9b.1536042978.git.liezhi.yang@windriver.com>
In-Reply-To: <ea8e96b3f2b09db17ecf9a28765b709433febe9b.1536042978.git.liezhi.yang@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH 1/1] bitbake.conf: Make BUILD_OPTIMIZATION respect	to DEBUG_BUILD
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
X-List-Received-Date: Tue, 04 Sep 2018 08:15:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Robert Yang
> Sent: den 4 september 2018 08:37
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 1/1] bitbake.conf: Make BUILD_OPTIMIZATION
> respect to DEBUG_BUILD
>=20
> We may also need debug native tools, so make BUILD_OPTIMIZATION respect t=
o
> DEBUG_BUILD, otherwise, we need set CFLAGS in the recipe which isn't
> convenient.
>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 1941633..df62445 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -612,7 +612,7 @@ FULL_OPTIMIZATION =3D "-O2 -pipe ${DEBUG_FLAGS}"
>  DEBUG_OPTIMIZATION =3D "-O -fno-omit-frame-pointer ${DEBUG_FLAGS} -pipe"
>  SELECTED_OPTIMIZATION =3D "${@d.getVar(['FULL_OPTIMIZATION', 'DEBUG_OPTI=
MIZATION'][d.getVar('DEBUG_BUILD') =3D=3D '1'])}"
>  SELECTED_OPTIMIZATION[vardeps] +=3D "FULL_OPTIMIZATION DEBUG_OPTIMIZATIO=
N"
> -BUILD_OPTIMIZATION =3D "-O2 -pipe"
> +BUILD_OPTIMIZATION =3D "${@['-O2', '-O -g -feliminate-unused-debug-types=
 -fno-omit-frame-pointer'][d.getVar('DEBUG_BUILD') =3D=3D '1']} -pipe"

Can we make that more readable:

BUILD_OPTIMIZATION =3D "${@'-O -g -feliminate-unused-debug-types -fno-omit-=
frame-pointer' if d.getVar('DEBUG_BUILD') =3D=3D '1' else '-O2'} -pipe"

Should probably do the same for SELECTED_OPTIMIZATION while at it:

SELECTED_OPTIMIZATION =3D "${@d.getVar('DEBUG_OPTIMIZATION' if d.getVar('DE=
BUG_BUILD') =3D=3D '1' else 'FULL_OPTIMIZATION')}"

>=20
>  ##################################################################
>  # Settings used by bitbake-layers.
> --
> 2.7.4

//Peter


