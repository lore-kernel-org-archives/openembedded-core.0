Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1FE9E6C571
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2018 11:07:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 50B2718494;
	Tue, 27 Nov 2018 12:07:54 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id y9Xu086eRh1B; Tue, 27 Nov 2018 12:07:53 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 95BA7180EA;
	Tue, 27 Nov 2018 12:07:52 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 859F41A06B;
	Tue, 27 Nov 2018 12:07:52 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 79E081A05E;
	Tue, 27 Nov 2018 12:07:52 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Tue, 27 Nov 2018 12:07:52 +0100 (CET)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by thoth.se.axis.com (Postfix) with ESMTP id 6D889346;
	Tue, 27 Nov 2018 12:07:52 +0100 (CET)
Received: from xbox11.axis.com (10.0.5.25) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Tue, 27 Nov 2018 12:07:52 +0100
Received: from XBOX04.axis.com (10.0.5.18) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Tue, 27 Nov 2018 12:07:52 +0100
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Tue, 27 Nov 2018 12:07:52 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Armin Kuster <akuster808@gmail.com>
Thread-Topic: [OE-core] [PATCH 1/1] socat: fix LICENSE
Thread-Index: AQHUgq4+Ux8oZpRbMkWqDO4l4HBuy6VjfNRw
Date: Tue, 27 Nov 2018 11:07:52 +0000
Message-ID: <d86ecb42fec746949d7fd4d33aea676e@XBOX04.axis.com>
References: <cover.1542923737.git.paul.eggleton@linux.intel.com>
	<ce1f3acd80c56e712571e76342fa72265838258b.1542923737.git.paul.eggleton@linux.intel.com>
In-Reply-To: <ce1f3acd80c56e712571e76342fa72265838258b.1542923737.git.paul.eggleton@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] socat: fix LICENSE
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
X-List-Received-Date: Tue, 27 Nov 2018 11:07:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Can you please cherry-pick this to the stable releases (Thud, Sumo, etc)?

//Peter

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Paul Eggleton
> Sent: den 22 november 2018 22:56
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 1/1] socat: fix LICENSE
>=20
> According to both the README and source headers, the LICENSE value for
> socat is explicitly GPLv2, not v2 or later, so adjust LICENSE
> accordingly (leaving aside whether "GPL-2.0+-with-OpenSSL-exception"
> should actually be considered a valid LICENSE string or not).
>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta/recipes-connectivity/socat/socat_1.7.3.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-connectivity/socat/socat_1.7.3.2.bb
> b/meta/recipes-connectivity/socat/socat_1.7.3.2.bb
> index 927df7463ae..b2d6b1dea4a 100644
> --- a/meta/recipes-connectivity/socat/socat_1.7.3.2.bb
> +++ b/meta/recipes-connectivity/socat/socat_1.7.3.2.bb
> @@ -7,7 +7,7 @@ SECTION =3D "console/network"
>=20
>  DEPENDS =3D "openssl readline"
>=20
> -LICENSE =3D "GPL-2.0+-with-OpenSSL-exception"
> +LICENSE =3D "GPL-2.0-with-OpenSSL-exception"
>  LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
>=20
> file://README;beginline=3D257;endline=3D287;md5=3D338c05eadd013872abb1d6e=
198e
> 10a3f"
>=20
> --
> 2.17.2
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

