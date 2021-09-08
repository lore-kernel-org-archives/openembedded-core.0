Received: from esa9.hc324-48.eu.iphmx.com (esa9.hc324-48.eu.iphmx.com [207.54.69.27])
 by mx.groups.io with SMTP id smtpd.web12.9222.1631093618100319431
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 02:33:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=QEDbgE0K;
 spf=pass (domain: bmw.de, ip: 207.54.69.27, mailfrom: prvs=878d62a74=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1631093618; x=1662629618;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=54mVPv/x+XtslwOJRwXXE3e8oMi2/BVlaCkWdXJRFWc=;
  b=QEDbgE0KHKrY3ACK47MMvsP/p5AAUA2pc9kGru385DsIEg4i9c9t1Uxl
   wfKCSAeTAF5JdPIq0gBWAe/+TwqKLjP0TTvCVHq5tZIExaAprvAp/daPz
   wiGM+sztcTAiRfeodKScCTl/ReE8bIZSqP21mWdzQ6c7hmBMjF1b3k3aX
   I=;
Received: from esagw6.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
 esa9.hc324-48.eu.iphmx.com with ESMTP/TLS; 08 Sep 2021 11:33:35 +0200
Received: from esabb4.muc ([160.50.100.33])  by esagw6.muc with ESMTP/TLS;
 08 Sep 2021 11:33:34 +0200
Received: from smucm33l.bmwgroup.net (HELO smucm33l.europe.bmw.corp) ([160.46.167.68])
 by esabb4.muc with ESMTP/TLS; 08 Sep 2021 11:33:31 +0200
Received: from smucm33l.europe.bmw.corp (160.46.167.68) by smucm33l.europe.bmw.corp
 (160.46.167.68) with Microsoft SMTP Server (TLS;
 Wed, 8 Sep 2021 11:33:31 +0200
Received: from smucm33l.europe.bmw.corp ([160.46.167.68]) by
 smucm33l.europe.bmw.corp ([160.46.167.68]) with mapi id 15.00.1497.018; Wed,
 8 Sep 2021 11:33:31 +0200
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <liezhi.yang@windriver.com>
CC: <ross@burtonini.com>, <randy.macleod@windriver.com>,
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/1] assimp: Remove it
Thread-Topic: [OE-core] [PATCH 1/1] assimp: Remove it
Thread-Index: AQHXo8TvRGHnk64ykE6o/LUI/nZgvquYWAEAgAABqwCAAVvVgIAACpgA
Date: Wed, 8 Sep 2021 09:33:30 +0000
Message-ID: <YTiDap4ahVzwW0op@korppu>
References: <cover.1631006167.git.liezhi.yang@windriver.com>
 <ed036834262a67e88a58001d20c719bed37d50f5.1631006167.git.liezhi.yang@windriver.com>
 <945b8038-97c7-1264-594f-e3b424695c22@windriver.com>
 <CAAnfSTsq2BtJb+PbEj=Yf0E8V=hs6DzDiv5YwRLaWkmd_w3dag@mail.gmail.com>
 <e13fb902-2edf-24f4-57c7-5c594d4a227e@windriver.com>
In-Reply-To: <e13fb902-2edf-24f4-57c7-5c594d4a227e@windriver.com>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BCBF2D1A7E992D468160DFF05609013C@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Sep 08, 2021 at 04:55:35PM +0800, Robert Yang wrote:
> On 9/7/21 8:10 PM, Ross Burton wrote:
> > On Tue, 7 Sept 2021 at 13:04, Randy MacLeod <randy.macleod@windriver.co=
m> wrote:
> > > I'll look at the sections that you have pointed out later today.
> >=20
> > Debian is always worth looking at when there's license issues.
> >=20
> > https://salsa.debian.org/debian/assimp/-/blob/master/debian/README.sour=
ce
> >=20
> > Specifically:
> >=20
> > https://salsa.debian.org/debian/assimp/-/blob/master/debian/README.sour=
ce#L81
> >=20
> > They strip non-free components from the tarball before importing into
> > their git repository.  We can delete the same files during the build
> > so they don't get redistributed.
>=20
> According to the license, those non-free files can't be saved anywhere su=
ch
> as the mirrors, I think that we need a special do_fetch command for assim=
p to
> make those files won't be saved to DL_DIR or the mirror?

Maybe just use the Debian original tarball, and possible patches to fix iss=
ues
in assimp?

That should be ok for all mirrors.

Cheers,

-Mikko=
