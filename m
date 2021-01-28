Received: from esa1.hc324-48.eu.iphmx.com (esa1.hc324-48.eu.iphmx.com [207.54.68.119])
 by mx.groups.io with SMTP id smtpd.web12.22535.1611830156602456721
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jan 2021 02:35:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1 header.b=pB/CzF5o;
 spf=pass (domain: bmw.de, ip: 207.54.68.119, mailfrom: prvs=655e30c88=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1611830156; x=1643366156;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=jIO75tuxw/S8x3zwDMxoP5lA1WlFaaZXDPtRwp7Lo60=;
  b=pB/CzF5ofsmlcwUU12SU6ZG2611bU/A7ZIRVKVFlWRlvvxyk9bs+vFMK
   zR/lafELK3KiOUdqsvypVqtwTtO9KfJsvJy2nfZoaLroPhxyM+L7ULKIF
   ErrwnBKzCjdy2EyGmL8sEFcrpYpIHH1SGMz8/kVKABUhEF1AvHMfE3Kiz
   g=;
Received: from esagw3.bmwgroup.com (HELO esagw3.muc) ([160.46.252.35]) by
 esa1.hc324-48.eu.iphmx.com with ESMTP/TLS; 28 Jan 2021 11:35:54 +0100
Received: from esabb5.muc ([160.50.100.47])  by esagw3.muc with ESMTP/TLS;
 28 Jan 2021 11:35:49 +0100
Received: from smucm33k.bmwgroup.net (HELO smucm33k.europe.bmw.corp) ([160.46.167.67])
 by esabb5.muc with ESMTP/TLS; 28 Jan 2021 11:35:48 +0100
Received: from smucm33l.europe.bmw.corp (160.46.167.68) by smucm33k.europe.bmw.corp
 (160.46.167.67) with Microsoft SMTP Server (TLS;
 Thu, 28 Jan 2021 11:35:47 +0100
Received: from smucm33l.europe.bmw.corp ([160.46.167.68]) by
 smucm33l.europe.bmw.corp ([160.46.167.68]) with mapi id 15.00.1497.010; Thu,
 28 Jan 2021 11:35:47 +0100
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <richard.purdie@linuxfoundation.org>
CC: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/7] ncurses: Don't put terminfo into the sysroot
Thread-Topic: [OE-core] [PATCH 1/7] ncurses: Don't put terminfo into the
 sysroot
Thread-Index: AQHW9NHRNmfwpIQ3xESg4osHtMRtkao8qXWAgAAEy4CAABoGgA==
Date: Thu, 28 Jan 2021 10:35:47 +0000
Message-ID: <YBKTg29d2wdbT2Lv@korppu>
References: <20210127172753.1286275-1-richard.purdie@linuxfoundation.org>
 <YBJ5qanQrSxjhX6u@korppu>
 <36ea418d5095cf5ab6f8949a7c07f28e310e8a67.camel@linuxfoundation.org>
In-Reply-To: <36ea418d5095cf5ab6f8949a7c07f28e310e8a67.camel@linuxfoundation.org>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B475D2EED684D64C8A1DCA3EA8A7DCA2@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 28, 2021 at 09:02:39AM +0000, Richard Purdie wrote:
> On Thu, 2021-01-28 at 08:45 +0000, Mikko.Rapeli@bmw.de wrote:
> > Interesting series! Do you already have some numbers how this affects
> > bitbake builds?
>=20
> Not yet. I should really have split the series into two, the files
> reduction and the native PACKAGES pieces as the latter is proving quite
> unstable on the autobuilder and holding the other up. Once it does
> build cleanly and merges, we will get build time measurements which I'm
> curious about too.

Yes, split would have been nice. I'm seeing issues after porting over
to dunfell :)

-Mikko

> Cheers,
>=20
> Richard=
