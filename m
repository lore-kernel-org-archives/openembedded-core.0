Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3EA297895A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 08:51:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id D352F183E2;
	Mon, 11 Jun 2018 10:51:31 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id ZZz01OKU1f-e; Mon, 11 Jun 2018 10:51:31 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 1FF8018070;
	Mon, 11 Jun 2018 10:51:31 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 08AB11E086;
	Mon, 11 Jun 2018 10:51:31 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F07231E083;
	Mon, 11 Jun 2018 10:51:30 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Mon, 11 Jun 2018 10:51:30 +0200 (CEST)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by thoth.se.axis.com (Postfix) with ESMTP id E30282E8F;
	Mon, 11 Jun 2018 10:51:30 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Mon, 11 Jun 2018 10:51:30 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Mon, 11 Jun 2018 10:51:30 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Ming Liu
	<liu.ming50@gmail.com>, OE-core <openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] bitbake.conf: add BB_CURRENT_MC to OVERRIDES
Thread-Index: AQHUAOsxtLCXiDDFi0GDrrfKw5c5dKRZvxqAgAEAEIA=
Date: Mon, 11 Jun 2018 08:51:30 +0000
Message-ID: <1119b17c899a4b87aeb52467c703ff07@XBOX02.axis.com>
References: <1528557877-22037-1-git-send-email-liu.ming50@gmail.com>
	<CALatG=4e_7nvpG6spimG5a=5e8iX8J4JTB73uJ9zFQOPosL0Eg@mail.gmail.com>
	<4e955e55fee0f60333e6ed7bf8f87433c2d99c17.camel@linuxfoundation.org>
In-Reply-To: <4e955e55fee0f60333e6ed7bf8f87433c2d99c17.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH] bitbake.conf: add BB_CURRENT_MC to OVERRIDES
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
X-List-Received-Date: Mon, 11 Jun 2018 08:51:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Richard Purdie
> Sent: den 10 juni 2018 21:29
> To: Ming Liu <liu.ming50@gmail.com>; OE-core <openembedded-
> core@lists.openembedded.org>
> Subject: Re: [OE-core] [PATCH] bitbake.conf: add BB_CURRENT_MC to
> OVERRIDES
>=20
> On Sun, 2018-06-10 at 20:45 +0200, Ming Liu wrote:
> > I saw your comment as follows:
> >
> > > This adds "" in OVERRIDES in the default case. Whilst I think (but
> > am not 100% sure) we fixed bitbake not to break on such a value, I'm
> > not convinced adding empty elements to it is a good idea and this did
> > used to break things.
> >
> > No, it will add "default" to OVERRIDES in the default case.
>=20
> That is even worse, we do not want to add "default" to overrides since
> any variable containing that word would then be at risk of weird
> breakage.
>=20
> Cheers,
>=20
> Richard

You could add it as ":mc-${BB_CURRENT_MC}:" to OVERRIDES to avoid the=20
ambiguity, similar to the pn- and df- prefixes used for recipe names=20
and distro features.

//Peter


