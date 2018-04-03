Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8F90F60402
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Apr 2018 18:16:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id DFFF21841C;
	Tue,  3 Apr 2018 20:16:34 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 3gZ2ND27wq2t; Tue,  3 Apr 2018 20:16:32 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id BAFE518419;
	Tue,  3 Apr 2018 20:16:32 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AB4881A09F;
	Tue,  3 Apr 2018 20:16:32 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A05E91A09E;
	Tue,  3 Apr 2018 20:16:32 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Tue,  3 Apr 2018 20:16:32 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by thoth.se.axis.com (Postfix) with ESMTP id 9452E261B;
	Tue,  3 Apr 2018 20:16:32 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Tue, 3 Apr 2018 20:16:32 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1263.000; Tue, 3 Apr 2018 20:16:32 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] pseudo: Upgrade to latest master
Thread-Index: AQHTyzFnJ8lobtLhbkGC8CMPjCSNrqPvV/lA
Date: Tue, 3 Apr 2018 18:16:32 +0000
Message-ID: <5c9c5e4cfb6f4316bd8cf46c30054388@XBOX02.axis.com>
References: <1522749088-1400-1-git-send-email-richard.purdie@linuxfoundation.org>
In-Reply-To: <1522749088-1400-1-git-send-email-richard.purdie@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH] pseudo: Upgrade to latest master
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
X-List-Received-Date: Tue, 03 Apr 2018 18:16:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Richard Purdie
> Sent: den 3 april 2018 11:51
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] pseudo: Upgrade to latest master
>=20
> This change includes several bug fixes and improvements, including better=
 path
> handling (the existance of . and .. for files), handling of the sticky bi=
t, and
> syscall renameat2 handling and interception through syscall() which was b=
reaking
> coreutils mv operations on fedora27.
>=20
> [YOCTO #12594]
> [YOCTO #12379]
> [YOCTO #11643]
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-
> devtools/pseudo/pseudo_git.bb
> index 66da1cc..09a3331 100644
> --- a/meta/recipes-devtools/pseudo/pseudo_git.bb
> +++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
> @@ -8,7 +8,7 @@ SRC_URI =3D "git://git.yoctoproject.org/pseudo \
>             file://toomanyfiles.patch \
>             "
>=20
> -SRCREV =3D "d7c31a25e4b02af0c64e6be0b4b0a9ac4ffc9da2"
> +SRCREV =3D "19f18124f16c4c85405b140a1fb8cb3b31d865bf"
>  S =3D "${WORKDIR}/git"
>  PV =3D "1.9.0+git${SRCPV}"
>=20
> --
> 2.7.4

Will this be backported to the older releases as I assume they are=20
equally affected by the renameat2 problem when building on Fedora 27.

//Peter


