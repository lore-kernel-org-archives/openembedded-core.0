Received: from esa2.hc324-48.eu.iphmx.com (esa2.hc324-48.eu.iphmx.com [207.54.68.120])
 by mx.groups.io with SMTP id smtpd.web10.978.1610092049327388806
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 23:47:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1 header.b=CxwEmmIh;
 spf=pass (domain: bmw.de, ip: 207.54.68.120, mailfrom: prvs=635119451=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1610092049; x=1641628049;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=txT7dbF3T3+TRzoGi12Z8mwNoCtyqSWD0ZYrmxCkAGg=;
  b=CxwEmmIh3bvNmpYppbfh0xfnnvMq2oTFKf6Y6VabT71VH+7aGwbWh4XS
   3w926dOad6tIN4qbkk1o8hAVRyHt5aEHf5hYKrcaFh3/iki3kBKYyMD4n
   lQpDZ3f7mPAOWvEi/qz1HN5b/H9yCXU82dp5GNT3iomyHNHl2timyrChw
   U=;
Received: from esagw4.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
 esa2.hc324-48.eu.iphmx.com with ESMTP/TLS; 08 Jan 2021 08:47:26 +0100
Received: from esabb4.muc ([160.50.100.33])  by esagw4.muc with ESMTP/TLS;
 08 Jan 2021 08:47:26 +0100
Received: from smucm33j.bmwgroup.net (HELO smucm33j.europe.bmw.corp) ([160.46.167.66])
 by esabb4.muc with ESMTP/TLS; 08 Jan 2021 08:47:26 +0100
Received: from smucm33l.europe.bmw.corp (160.46.167.68) by smucm33j.europe.bmw.corp
 (160.46.167.66) with Microsoft SMTP Server (TLS;
 Fri, 8 Jan 2021 08:47:26 +0100
Received: from smucm33l.europe.bmw.corp ([160.46.167.68]) by
 smucm33l.europe.bmw.corp ([160.46.167.68]) with mapi id 15.00.1497.010; Fri,
 8 Jan 2021 08:47:26 +0100
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <JPEWhacker@gmail.com>
CC: <liezhi.yang@windriver.com>, <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/3] buildtools-tarball: Add nativesdk-ccache
Thread-Topic: [OE-core] [PATCH 2/3] buildtools-tarball: Add nativesdk-ccache
Thread-Index: AQHW5CUPJwBvx4ac70GJZ0SAGk7Ir6oajmAAgADWfYCAAIURgIAABTkAgABXswCAAQUZAA==
Date: Fri, 8 Jan 2021 07:47:26 +0000
Message-ID: <X/gODKFF9WGz8e8w@korppu>
References: <cover.1609934927.git.liezhi.yang@windriver.com>
 <0f8505614d5562aa94dea17eb6beea772c25e1d3.1609934927.git.liezhi.yang@windriver.com>
 <0dbe9f701d6c6344adb0561e10dc2aed8ddb4b7a.camel@linuxfoundation.org>
 <c37107e5-a877-8b85-46b8-c984466c31a6@windriver.com>
 <3966f6f4c6c748f36c73bfccaaa36fdea6b34e63.camel@linuxfoundation.org>
 <8eb45b12-acb2-ce3e-c821-3c381c1107f7@windriver.com>
 <CAJdd5GYhJPMBc3nfiAA5aBm0wZyzYUuab_gR2pRCtcGfss6row@mail.gmail.com>
In-Reply-To: <CAJdd5GYhJPMBc3nfiAA5aBm0wZyzYUuab_gR2pRCtcGfss6row@mail.gmail.com>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C10E77B1FAC3ED4C99435B604054C9F0@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 07, 2021 at 10:12:54AM -0600, Joshua Watt wrote:
> We had the same problem with icecream and solved it by building in a dock=
er
> container with the version of ice cream that we wanted FWIW.
>=20
> Alternatively, I think it's possible to roll your own buildtools that has
> ccache?

Yea, it's a long standing best practice that an LXC or docker container
or buildtools tarball must be used to get reproducible builds in
CI systems and on developers machines with random Linux distros and
versions. Host contamination issues have reduced considerably
in recent years, thanks for all fixes, but I still can't recommend
mixing builds from different Linux distros when developing yocto
based products.

ccache version is far from the only host tool which has incompatibilities
between versions and distros.

Cheers,

-Mikko=
