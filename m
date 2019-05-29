Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2DF867E38A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 14:29:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 8652A184DB;
	Wed, 29 May 2019 16:29:11 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 1fyluPPTkVNG; Wed, 29 May 2019 16:29:10 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id E0A9318604;
	Wed, 29 May 2019 16:29:09 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A13131E075;
	Wed, 29 May 2019 16:29:09 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 956271E05C;
	Wed, 29 May 2019 16:29:09 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Wed, 29 May 2019 16:29:09 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by seth.se.axis.com (Postfix) with ESMTP id 893F0229F;
	Wed, 29 May 2019 16:29:09 +0200 (CEST)
Received: from XBOX04.axis.com (10.0.5.18) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Wed, 29 May 2019 16:29:09 +0200
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Wed, 29 May 2019 16:29:09 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Andrei Gherzan
	<andrei@gherzan.ro>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] ca-certificates: Fix openssl runtime dependency
Thread-Index: AQHVFWIDJERVuEMURkOJqsHWlkLvR6aBDKYAgAEbo9A=
Date: Wed, 29 May 2019 14:29:09 +0000
Message-ID: <03829522174840a6938a7dda8fe921fb@XBOX04.axis.com>
References: <20190528143030.2205-1-andrei@gherzan.ro>
	<efd8fab5c30823179cc418a855c6e660c0a534d3.camel@linuxfoundation.org>
In-Reply-To: <efd8fab5c30823179cc418a855c6e660c0a534d3.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH] ca-certificates: Fix openssl runtime dependency
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
X-List-Received-Date: Wed, 29 May 2019 14:29:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-core=
-bounces@lists.openembedded.org> On Behalf Of Richard Purdie
> Sent: den 29 maj 2019 01:24
> To: Andrei Gherzan <andrei@gherzan.ro>; openembedded-core@lists.openembed=
ded.org
> Subject: Re: [OE-core] [PATCH] ca-certificates: Fix openssl runtime depen=
dency
>=20
> On Tue, 2019-05-28 at 15:30 +0100, Andrei Gherzan wrote:
> > Since yocto thud, and more specifically since poky switched to
> > openssl 1.1 line, the openssl binary is provided by 'openssl-bin'.
> >
> > Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> > ---
> >  .../recipes-support/ca-certificates/ca-certificates_20190110.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20190=
110.bb b/meta/recipes-support/ca-certificates/ca-certificates_20190110.bb
> > index 4c0425302f..bc69c55daa 100644
> > --- a/meta/recipes-support/ca-certificates/ca-certificates_20190110.bb
> > +++ b/meta/recipes-support/ca-certificates/ca-certificates_20190110.bb
> > @@ -82,6 +82,6 @@ do_install_append_class-native () {
> >      SYSROOT=3D"${D}${base_prefix}" ${D}${sbindir}/update-ca-certificat=
es
> >  }
> >
> > -RDEPENDS_${PN} +=3D "openssl"
> > +RDEPENDS_${PN} +=3D "openssl-bin"
>=20
> Doesn't work for ca-certificates-native:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/39/builds/638
> [amongst many other failures]

I assume the above can be fixed by instead using:

RDEPENDS_${PN}_append_class-target =3D " openssl-bin"

However, has there been any attempts at rectifying the situation where=20
runtime dependencies on packages are turned into recipe dependencies=20
for the native version of a recipe, which obviously does not work when=20
the package name does not match a recipe name?

> Cheers,
>=20
> Richard

//Peter


