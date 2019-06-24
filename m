Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8D0CC7D42A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 12:42:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id D3824180B3;
	Mon, 24 Jun 2019 14:42:19 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id mUMpJVf2yV36; Mon, 24 Jun 2019 14:42:18 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 16AA0183CF;
	Mon, 24 Jun 2019 14:42:18 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 029E81A072;
	Mon, 24 Jun 2019 14:42:18 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EB7011A067;
	Mon, 24 Jun 2019 14:42:17 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Mon, 24 Jun 2019 14:42:17 +0200 (CEST)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by seth.se.axis.com (Postfix) with ESMTP id DF34B1A2C;
	Mon, 24 Jun 2019 14:42:17 +0200 (CEST)
Received: from XBOX04.axis.com (10.0.5.18) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Mon, 24 Jun 2019 14:42:17 +0200
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Mon, 24 Jun 2019 14:42:17 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Adrian Bunk
	<bunk@stusta.de>, Armin Kuster <akuster808@gmail.com>
Thread-Topic: [OE-core] [Warrior][ 15/19] texinfo-dummy-native: A little clean
	up of template.py
Thread-Index: AQHVKl/KO3GNBmHGWUytsLZkKHAFJ6aqdzwAgABG1aA=
Date: Mon, 24 Jun 2019 12:42:17 +0000
Message-ID: <5ddcbbe68f00435fa57cf14b59e4863d@XBOX04.axis.com>
References: <cover.1561348290.git.akuster808@gmail.com>
	<b8d16e9d74688e91d6dee5e643b42fd5c4f887b4.1561348290.git.akuster808@gmail.com>
	<20190624073802.GA11015@localhost>
	<cdffa8e2d2d7ed81450272040d6e18eceb447f08.camel@linuxfoundation.org>
In-Reply-To: <cdffa8e2d2d7ed81450272040d6e18eceb447f08.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [Warrior][ 15/19] texinfo-dummy-native: A little clean up of template.py
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
X-List-Received-Date: Mon, 24 Jun 2019 12:42:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Richard Purdie
> Sent: den 24 juni 2019 12:23
> To: Adrian Bunk <bunk@stusta.de>; Armin Kuster <akuster808@gmail.com>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [Warrior][ 15/19] texinfo-dummy-native: A little
> clean up of template.py
>=20
> On Mon, 2019-06-24 at 10:38 +0300, Adrian Bunk wrote:
> > On Sun, Jun 23, 2019 at 08:54:14PM -0700, Armin Kuster wrote:
> > > From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > >
> > > This is mainly whitespace clean up, plus using the with statement
> > > when
> > > writing files.
> > > ...
> >
> > This patch and the next two look more like cleanup patches to me,
> > not changes that should go into a stable series.

Yes, this patch is pure cleanup, however, it is preparation for the next=20
patch, which is not cleanup. The next patch fixes a problem with one of=20
our recipes that uses the texinfo bbclass if the build path happens to=20
contain the letter "E"...

> FWIW the package.bbclass change is being requested to allow people to
> stop patching the class...

Exactly.

> Cheers,
>=20
> Richard

//Peter


