Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 24DA760111
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 08:52:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id A8C0F1828A;
	Tue, 13 Dec 2016 09:52:16 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id qD-Em14unXKe; Tue, 13 Dec 2016 09:52:16 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id EA77A18282;
	Tue, 13 Dec 2016 09:52:15 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8F5961A09C;
	Tue, 13 Dec 2016 09:52:15 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 83E221A09A;
	Tue, 13 Dec 2016 09:52:15 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Tue, 13 Dec 2016 09:52:15 +0100 (CET)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by thoth.se.axis.com (Postfix) with ESMTP id 780C1E01;
	Tue, 13 Dec 2016 09:52:15 +0100 (CET)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Tue, 13 Dec 2016 09:52:15 +0100
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1210.000; Tue, 13 Dec 2016 09:52:15 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Khem Raj <raj.khem@gmail.com>, "Robert P. J. Day" <rpjday@crashcourse.ca>
Thread-Topic: [OE-core] can "IMAGE_INSTALL ?= ..." not be written in a more
	obvious way?
Thread-Index: AQHSUyquW4CpprPehU2klYhnSyJ/EqEFk/rA
Date: Tue, 13 Dec 2016 08:52:15 +0000
Message-ID: <7aafe397c8214239a49d3cf09480d388@XBOX02.axis.com>
References: <alpine.LFD.2.20.1612100630310.23762@localhost.localdomain>
	<CAMKF1sp_R_qapapbcZ8mu-b1BumWekvKjA-QXUDLOTSWgOoXQA@mail.gmail.com>
In-Reply-To: <CAMKF1sp_R_qapapbcZ8mu-b1BumWekvKjA-QXUDLOTSWgOoXQA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: can "IMAGE_INSTALL ?= ..." not be written in a more obvious way?
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
X-List-Received-Date: Tue, 13 Dec 2016 08:52:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Khem Raj
> Sent: den 10 december 2016 22:16
> To: Robert P. J. Day
> Cc: OE Core mailing list
> Subject: Re: [OE-core] can "IMAGE_INSTALL ?=3D ..." not be written in a
> more obvious way?
>=20
> On Sat, Dec 10, 2016 at 3:40 AM, Robert P. J. Day
> <rpjday@crashcourse.ca> wrote:
> >
> >   i've nattered about this before but not sure i ever got an answer --
> > here's the last bit of core-image.bbclass:
> >
> >   CORE_IMAGE_BASE_INSTALL =3D '\
> >     packagegroup-core-boot \
> >     packagegroup-base-extended \
> >     \
> >     ${CORE_IMAGE_EXTRA_INSTALL} \
> >     '
> >
> >   CORE_IMAGE_EXTRA_INSTALL ?=3D ""
> >
> >   IMAGE_INSTALL ?=3D "${CORE_IMAGE_BASE_INSTALL}"
> >
> > the first time i saw that (long ago), it took me a few looks to figure
> > out what was happening. can this not be written in a more obvious way:
> >
> >   CORE_IMAGE_BASE_INSTALL =3D '\
> >     packagegroup-core-boot \
> >     packagegroup-base-extended \
> >     '
> >
> >   CORE_IMAGE_EXTRA_INSTALL ?=3D ""
> >
> >   IMAGE_INSTALL ?=3D " \
> >     ${CORE_IMAGE_BASE_INSTALL} \
> >     ${CORE_IMAGE_EXTRA_INSTALL} \
> >     "
> >
> > is that not equivalent, or am i missing something? it's certainly
> > clearer as to what's happening if people are perusing the code.
>=20
> They are same AFAICT, dont feel strongly  about readability but feel
> free to send a patch

Careful now. Changing these can affect image recipes outside of OE-core.
If one has an image recipe that inherits core-image and then defines=20

IMAGE_INSTALL =3D "${CORE_IMAGE_BASE_INSTALL} my-own-packages ..."

then changing CORE_IMAGE_BASE_INSTALL as per above would suddenly=20
cause that image to miss including packages that it previously did.

I recommend leaving it as is.

//Peter


