Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 95B466BD1C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jan 2019 14:25:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id EADE2184AE;
	Tue, 22 Jan 2019 15:25:20 +0100 (CET)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id H5gEje-YmRjV; Tue, 22 Jan 2019 15:25:19 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id AB3A7184AB;
	Tue, 22 Jan 2019 15:25:19 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 847AE1A069;
	Tue, 22 Jan 2019 15:25:19 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 78E801A066;
	Tue, 22 Jan 2019 15:25:19 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Tue, 22 Jan 2019 15:25:19 +0100 (CET)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by seth.se.axis.com (Postfix) with ESMTP id 6CA3F175F;
	Tue, 22 Jan 2019 15:25:19 +0100 (CET)
Received: from XBOX04.axis.com (10.0.5.18) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Tue, 22 Jan 2019 15:25:19 +0100
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Tue, 22 Jan 2019 15:25:19 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Randy MacLeod <randy.macleod@windriver.com>, "Patches and discussions
	about the oe-core layer" <openembedded-core@lists.openembedded.org>, Xulin
	Sun <xulin.sun@windriver.com>
Thread-Topic: [OE-core] [meta-oe][PATCH] openssl: fix multilib file install
	conflicts
Thread-Index: AQHUsd0tMjg8VlKqWkSS48RpgXHxp6W7VuYw
Date: Tue, 22 Jan 2019 14:25:18 +0000
Message-ID: <4693588ff8f849cfac2242d5323e9012@XBOX04.axis.com>
References: <20190118022248.17108-1-xulin.sun@windriver.com>
	<ad8f8c65-e628-1102-b49d-883b4eb9ce09@windriver.com>
In-Reply-To: <ad8f8c65-e628-1102-b49d-883b4eb9ce09@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [meta-oe][PATCH] openssl: fix multilib file install conflicts
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
X-List-Received-Date: Tue, 22 Jan 2019 14:25:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Randy MacLeod
> Sent: den 22 januari 2019 00:01
> To: Patches and discussions about the oe-core layer <openembedded-
> core@lists.openembedded.org>; Xulin Sun <xulin.sun@windriver.com>
> Subject: Re: [OE-core] [meta-oe][PATCH] openssl: fix multilib file
> install conflicts
>=20
> Xulin,
>=20
> Thanks for sending this patch.
>=20
> On 1/17/19 9:22 PM, Xulin Sun wrote:
> > To avoid issue like below if run "bitbake lib32-wrlinux-image-glibc-
> std"
>=20
> For future oe-core commits, please use a core-image-minimal
> example that will be more familiar to people outside of Wind River.
>=20
> > with series userspace packages(LAMP,krb5...) added:
> >
> > Error: Transaction check error:
> >    file /usr/bin/c_rehash conflicts between attempted installs of
> >    lib32-openssl-bin-1.1.1-r0.armv7at2hf_neon and openssl-bin-1.1.1-
> r0.aarch64
> >
>=20
> Also, while your commit log explains what you fixed, it
> doesn't describe the issue for those who don't know what c_rehash is so
> something like:
>=20
>    Add multilib_script support for openssl's c_rehash which is
>    a perl script.
>=20
> Followed by the example failure log that you showed.
>=20
>=20
> Since this hasn't been merged to master/master-next,
> it would be nice if you sent a v2.
>=20
> Thanks,
> ../Randy
>=20
> > Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
> > ---
> >   meta/recipes-connectivity/openssl/openssl_1.1.1a.bb | 4 ++++
> >   1 file changed, 4 insertions(+)
> >
> > diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
> b/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
> > index 5c4e69cfb7..21359fa68a 100644
> > --- a/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
> > +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
> > @@ -206,3 +206,7 @@ RREPLACES_openssl-conf =3D "openssl10-conf"
> >   RCONFLICTS_openssl-conf =3D "openssl10-conf"
> >
> >   BBCLASSEXTEND =3D "native nativesdk"
> > +
> > +inherit multilib_script
> > +
> > +MULTILIB_SCRIPTS =3D "${PN}:${bindir}/c_rehash"

Shouldn't that be:

MULTILIB_SCRIPTS =3D "${PN}-bin:${bindir}/c_rehash"

given that openssl inherits lib_package and ${bindir}/c_rehash thus=20
ends up in the ${PN}-bin package?

//Peter


