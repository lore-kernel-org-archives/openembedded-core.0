Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 084387CADE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 11:00:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 346291866A;
	Fri, 22 Feb 2019 12:00:34 +0100 (CET)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 3hgI7py9FDUd; Fri, 22 Feb 2019 12:00:33 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 14FAA18330;
	Fri, 22 Feb 2019 12:00:33 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BE69F1A064;
	Fri, 22 Feb 2019 12:00:32 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B272E1A06D;
	Fri, 22 Feb 2019 12:00:32 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Fri, 22 Feb 2019 12:00:32 +0100 (CET)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by seth.se.axis.com (Postfix) with ESMTP id A65ED1E75;
	Fri, 22 Feb 2019 12:00:32 +0100 (CET)
Received: from XBOX04.axis.com (10.0.5.18) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Fri, 22 Feb 2019 12:00:32 +0100
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Fri, 22 Feb 2019 12:00:32 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Armin Kuster <akuster808@gmail.com>
Thread-Topic: [OE-core] [thud][PATCH 1/2] libaio: Extend to native
Thread-Index: AQHUmkOgBgHXk3stzUae1W+zR8VSV6XsBqOA
Date: Fri, 22 Feb 2019 11:00:32 +0000
Message-ID: <db68711ecba94d9aa3fd99ff16652e78@XBOX04.axis.com>
References: <20181222221322.3768-1-pkj@axis.com>
In-Reply-To: <20181222221322.3768-1-pkj@axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [thud][PATCH 1/2] libaio: Extend to native
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
X-List-Received-Date: Fri, 22 Feb 2019 11:00:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

*ping*

//Peter

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-core=
-bounces@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
> Sent: den 22 december 2018 23:13
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [thud][PATCH 1/2] libaio: Extend to native
>=20
> From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>=20
> lvm2 currently requires libaio. So building lvm2-native will result in
> the following error.
>=20
>   ERROR: Required build target 'lvm2-native' has no buildable providers.
>   Missing or unbuildable dependency chain was: ['lvm2-native', 'libaio-na=
tive']
>=20
> Extend libaio to native to fix this issue.
>=20
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>=20
> This is a backport from master.
>=20
>  meta/recipes-extended/libaio/libaio_0.3.111.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-extended/libaio/libaio_0.3.111.bb b/meta/recipe=
s-extended/libaio/libaio_0.3.111.bb
> index 04b50b61ec..8e1cd349a0 100644
> --- a/meta/recipes-extended/libaio/libaio_0.3.111.bb
> +++ b/meta/recipes-extended/libaio/libaio_0.3.111.bb
> @@ -20,4 +20,4 @@ do_install () {
>      oe_runmake install DESTDIR=3D${D}
>  }
>=20
> -BBCLASSEXTEND =3D "nativesdk"
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.12.0


