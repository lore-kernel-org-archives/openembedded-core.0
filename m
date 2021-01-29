Received: from esa14.hc324-48.eu.iphmx.com (esa14.hc324-48.eu.iphmx.com [207.54.69.24])
 by mx.groups.io with SMTP id smtpd.web08.7133.1611908886405674490
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jan 2021 00:28:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1 header.b=aOPQCxcC;
 spf=pass (domain: bmw.de, ip: 207.54.69.24, mailfrom: prvs=656141f01=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1611908886; x=1643444886;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=C3PyrQjA+JOCHfEk26oJfKhnq2iTuz7zLtpdtQr7FoU=;
  b=aOPQCxcCZrPs9m9IqCrI/FiqCzFUx28vzCC5z0Skl3HJzLrvpXIa+geO
   cbJUPimp8jAK2wTxi9JhOyrSxFIqnI1xXsDT1hhm0c1YUqV1bcvkdmbRi
   WfYO1YS1MZRrduw05BXy5CB26/KEXdu3FNuitpGXL9wVuQeSFVLKie2tP
   o=;
Received: from esagw3.bmwgroup.com (HELO esagw3.muc) ([160.46.252.35]) by
 esa14.hc324-48.eu.iphmx.com with ESMTP/TLS; 29 Jan 2021 09:28:03 +0100
Received: from esabb4.muc ([160.50.100.33])  by esagw3.muc with ESMTP/TLS;
 29 Jan 2021 09:28:02 +0100
Received: from smucm33j.bmwgroup.net (HELO smucm33j.europe.bmw.corp) ([160.46.167.66])
 by esabb4.muc with ESMTP/TLS; 29 Jan 2021 09:28:02 +0100
Received: from smucm33l.europe.bmw.corp (160.46.167.68) by smucm33j.europe.bmw.corp
 (160.46.167.66) with Microsoft SMTP Server (TLS;
 Fri, 29 Jan 2021 09:28:02 +0100
Received: from smucm33l.europe.bmw.corp ([160.46.167.68]) by
 smucm33l.europe.bmw.corp ([160.46.167.68]) with mapi id 15.00.1497.010; Fri,
 29 Jan 2021 09:28:02 +0100
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <richard.purdie@linuxfoundation.org>
CC: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/7] ncurses: Don't put terminfo into the sysroot
Thread-Topic: [OE-core] [PATCH 1/7] ncurses: Don't put terminfo into the
 sysroot
Thread-Index: AQHW9NHRNmfwpIQ3xESg4osHtMRtkao8qXWAgACEDgCAAQllgA==
Date: Fri, 29 Jan 2021 08:28:02 +0000
Message-ID: <YBPHETH0MCmu3ziI@korppu>
References: <20210127172753.1286275-1-richard.purdie@linuxfoundation.org>
 <YBJ5qanQrSxjhX6u@korppu>
 <12fd7a6096af189960490edfe5aada5a75e128ea.camel@linuxfoundation.org>
In-Reply-To: <12fd7a6096af189960490edfe5aada5a75e128ea.camel@linuxfoundation.org>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0F49338FDA0F744982AFCDB66918CD07@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 28, 2021 at 04:38:08PM +0000, Richard Purdie wrote:
> On Thu, 2021-01-28 at 08:45 +0000, Mikko.Rapeli@bmw.de wrote:
> > Interesting series! Do you already have some numbers how this affects
> > bitbake builds?
>=20
> We do now have measurements:
>=20
> https://autobuilder.yocto.io/pub/non-release/20210128-10/testresults/buil=
dperf-centos7/perf-centos7.yoctoproject.org_master-next_20210128130350_0ec9=
fb3f98.html
>=20
> https://autobuilder.yocto.io/pub/non-release/20210128-9/testresults/build=
perf-ubuntu1604/perf-ubuntu1604_master-next_20210128130346_0ec9fb3f98.html
>=20
> so a 5-7% build time speedup with and without rm_work and a 7%
> reduction in disk usage without rm_work.

Awesome! Thanks, Richard!

-Mikko=
