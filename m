Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2CB4C7D106
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2019 14:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 8882818607;
	Wed, 17 Apr 2019 16:12:22 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id mVSID46C0GUI; Wed, 17 Apr 2019 16:12:20 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 801DE18528;
	Wed, 17 Apr 2019 16:12:20 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6D58D1A094;
	Wed, 17 Apr 2019 16:12:20 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 61C421A08C;
	Wed, 17 Apr 2019 16:12:20 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Wed, 17 Apr 2019 16:12:20 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by seth.se.axis.com (Postfix) with ESMTP id 55DBB1704;
	Wed, 17 Apr 2019 16:12:20 +0200 (CEST)
Received: from XBOX04.axis.com (10.0.5.18) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Wed, 17 Apr 2019 16:12:20 +0200
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Wed, 17 Apr 2019 16:12:20 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	Seebs <seebs@seebs.net>
Thread-Topic: [OE-core] [PATCH] pseudo: Update to gain key bugfixes
Thread-Index: AQHU7/L3kbkYfTRQmE2zAn03l95XLKY18YMAgAIdcwCACF3YkA==
Date: Wed, 17 Apr 2019 14:12:19 +0000
Message-ID: <5bc0e9c882a24ddcb08d922e290d3dad@XBOX04.axis.com>
References: <20190410231254.25763-1-richard.purdie@linuxfoundation.org>
	<20190410185944.0a16ea5d@seebsdell>
	<2cf8ada8df82cb38252db3ff4c45b9f85294c63e.camel@linuxfoundation.org>
In-Reply-To: <2cf8ada8df82cb38252db3ff4c45b9f85294c63e.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pseudo: Update to gain key bugfixes
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
X-List-Received-Date: Wed, 17 Apr 2019 14:12:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of
> richard.purdie@linuxfoundation.org
> Sent: den 12 april 2019 10:18
> To: Seebs <seebs@seebs.net>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] pseudo: Update to gain key bugfixes
>=20
> On Wed, 2019-04-10 at 18:59 -0500, Seebs wrote:
> > On Thu, 11 Apr 2019 00:12:54 +0100
> > Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> >
> > > -SRCREV =3D "6294b344e5140f5467e6860f45a174440015304e"
> > > +SRCREV =3D "6ebc7d6bc8ab973d0ba949eeb363821811ce8dc5"
> >
> > I would sort of recommend one of the two commits since then -- one
> > may
> > fix the .NET startup failures, and the other fixes warnings that this
> > one introduced and I forgot to fix. But I'm also okay with this one.
>=20
> That is good news. I've tested and updated to the later revision,
> thanks!
>=20
> Cheers,
>=20
> Richard

One of our developers, who has been especially affected by this=20
problem, reported that he was still having problems building a=20
couple of recipes even with the latest version of pseudo. After=20
some debugging it was determined that the problem was due to the=20
Debian version of coreutils that he was using. When he downgraded=20
from 8.30-3 to 8.30-1 the problems he was seeing went away. The=20
changelog for the reverted changes indicate that pseudo will=20
need to be made aware about what they are doing:

,----
| coreutils (8.30-3) unstable; urgency=3Dmedium
|=20
|   * Fix renameat2 patch (Closes: #923420)
|=20
|  -- Michael Stone <mstone@debian.org>  Thu, 28 Feb 2019 10:30:31 -0500
|=20
| coreutils (8.30-2) unstable; urgency=3Dmedium
|=20
|   * Use renameat2 glibc function that can be intercepted by fakechroot
|     (Closes: #915559)
|   * Above requires autoreconf turned on again
|=20
|  -- Michael Stone <mstone@debian.org>  Tue, 26 Feb 2019 07:15:19 -0500
`----

//Peter


