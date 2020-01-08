Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.openembedded.org (Postfix) with ESMTP id 3DE0E7FC7D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2020 03:53:37 +0000 (UTC)
IronPort-SDR: xNbKNAOobo1Orb9ZerVo99pxAhooYCcB2eWttuQZ4gSpqXFhv7ZtWZp8KFa6Tt9Iwnstkwy+pa
	lNe60l8+ooe14mMOp83TOqP1D2lsUfcMFOlbo/ThDGEKCNtZ23QsaLas0n5f9m4MOB1lR1sqtv
	/7i2DVCvV+hK/zH6zs65B/grQI/HVmxBkZeb+aemErK4ADwzaXcmla0LmhBpuHSCwI9D+qNX00
	ySxWzxS96TDwslOUhk1ucfurN6hSLi605pm8nxDoOYR0uCrRuJHR9c62rTq6HGk97KAwQQ+IqE
	itc=
X-IronPort-AV: E=Sophos;i="5.69,408,1571695200"; 
   d="scan'208";a="4160327"
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, akuster808
	<akuster808@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/4] sstate: Add extra directory level
Thread-Index: AQHVxCVGtNcdMDJaHUqpvJ6T3punKqfcuxGAgAAAooCAA2jVoA==
Date: Wed, 8 Jan 2020 03:53:38 +0000
Message-ID: <ac49c796242049d3bf402eda182d58b4@XBOX03.axis.com>
References: <20200106000650.26105-1-richard.purdie@linuxfoundation.org>
	<c5060a41-8348-37c7-7293-47a534182995@gmail.com>
	<113ad12f2f746054692ed3843a9b359793d470bd.camel@linuxfoundation.org>
In-Reply-To: <113ad12f2f746054692ed3843a9b359793d470bd.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] sstate: Add extra directory level
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
X-List-Received-Date: Wed, 08 Jan 2020 03:53:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-core=
-
> bounces@lists.openembedded.org> On Behalf Of Richard Purdie
> Sent: den 6 januari 2020 01:44
> To: akuster808 <akuster808@gmail.com>; openembedded-
> core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 1/4] sstate: Add extra directory level
>=20
> On Sun, 2020-01-05 at 16:41 -0800, akuster808 wrote:
> > On 1/5/20 4:06 PM, Richard Purdie wrote:
> > > We're having speed issues on the autobuilder due to the numbers of
> > > files in sstate
> > > directories. We previously split these by the first two characters
> > > of the hash.
> > > This change extends this to split by the next two characters as
> > > well, creating
> > > more layers of directories.
> > >
> > > This should signifiantly speed up eSDK builds on the autobuilder as
> > > the current
> > > sstate layout simply isn't scaling there but addresses a general
> > > complaint.
> > >
> > > gen-lockedsig-cache needed to be updated for the new split level
> > > sstateI.
> >
> > I assume zeus worthy?
>=20
> I think we need to discuss that. It is a fairly significant change in
> behaviour.
>=20
> Options are:
>=20
> a) none of these
> b) only this first change
> c) all of them if we want to fix the 255 char sstate filename limit
> issue
>=20
> Cheers,
>=20
> Richard

I would like to see at least the first patch being backported. You are=20
not alone with huge sstate-cache directories...=20

We have not had the problems solved by the other three patches so for=20
us at least, they are not required. And they do seem somewhat invasive.

//Peter


