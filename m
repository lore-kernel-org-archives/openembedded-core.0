Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 1419377BE4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Mar 2017 15:34:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id DF8D911A00B;
	Sat, 25 Mar 2017 16:34:01 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id SRA34teutEwE; Sat, 25 Mar 2017 16:34:00 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id 9ACBC2E616;
	Sat, 25 Mar 2017 16:34:00 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 877BF1E064;
	Sat, 25 Mar 2017 16:34:00 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7C1411E04F;
	Sat, 25 Mar 2017 16:34:00 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Sat, 25 Mar 2017 16:34:00 +0100 (CET)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by thoth.se.axis.com (Postfix) with ESMTP id 6DDF61D83;
	Sat, 25 Mar 2017 16:34:00 +0100 (CET)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Sat, 25 Mar 2017 16:34:00 +0100
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1210.000; Sat, 25 Mar 2017 16:34:00 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Andre McCurdy
	<armccurdy@gmail.com>, OE Core mailing list
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Using MACHINE_FEATURES in a native recipe
Thread-Index: AQHSo1VEQzGGeZuXJ0O7Pb82vZwFKqGikb4AgAGGtxCAATTRgIAAYEnw
Date: Sat, 25 Mar 2017 15:34:00 +0000
Message-ID: <d33381889bbb46db8e6f4f2190b2d1f4@XBOX02.axis.com>
References: <CAJ86T=WhxRaQ42=2bsFVZpeLhrZo2XwZBYoWp=f42tyebo2=2A@mail.gmail.com>
	<1490287404.13980.231.camel@linuxfoundation.org>
	<f67e1ac46aff43cfb085fd76fe0f60c6@XBOX02.axis.com>
	<1490437627.13980.248.camel@linuxfoundation.org>
In-Reply-To: <1490437627.13980.248.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: Using MACHINE_FEATURES in a native recipe
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
X-List-Received-Date: Sat, 25 Mar 2017 15:34:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Richard Purdie
> Sent: den 25 mars 2017 11:27
> To: Peter Kjellerstedt; Andre McCurdy; OE Core mailing list
> Subject: Re: [OE-core] Using MACHINE_FEATURES in a native recipe
>=20
> On Fri, 2017-03-24 at 15:10 +0000, Peter Kjellerstedt wrote:
> > Even though I agree this is a good change and that it should be done,
> > I wonder if we can either hold it off until after Pyro has been
> > released or make it possible to avoid it? The reason for this is that
> > I know that this change will require a huge amount of development
> > work for us, something that will not be possible to do in the time
> > frame left until Pyro is released. Or alternatively we will have to
> > copy native.bbclass to our layers and maintain a fork of it, which
> > sucks...
> >
> > The reason for this is that our unit test framework is based on
> > building all our own packages as native, but still configured via,
> > amongst others, MACHINE_FEATURES as if building for the real target.
> > This will of course not work anymore if MACHINE_FEATURES is set to ""
> > with no way of overriding it.
>=20
> I'm afraid I only saw this after I merged it :(

No worries. I'll backport native.bbclass to our layers for now.

> I appreciate its a pain but I do think the change is the right thing to
> do (maybe with a corresponding DISTRO_FEATURES one too). Hopefully we
> can find a way that lets you work around it somehow...

I agree that cleaning MACHINE_FEATURES is the right thing to do. However,=20
I am not so sure about DISTRO_FEATURES. After all, the native tools are=20
part of the distro as well and there may be reasons to build them=20
differently based on enabled features in the distro.

> Cheers,
>=20
> Richard

//Peter


