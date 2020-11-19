Received: from esa12.hc324-48.eu.iphmx.com (esa12.hc324-48.eu.iphmx.com [207.54.72.34])
 by mx.groups.io with SMTP id smtpd.web12.11816.1605804083914748149
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2020 08:41:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1 header.b=JxJ/Lkgs;
 spf=pass (domain: bmw.de, ip: 207.54.72.34, mailfrom: prvs=585f5ef5f=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1605804083; x=1637340083;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=HhiQgMUWhq6WkGNF/81ft5VSg0/bQiNRp1oZBMhPq/s=;
  b=JxJ/LkgsBXXm/2iDDsUAn6n/md2Eb6yJaSCqdLSKPrsvg6K2uJFDtqJn
   LEH3wTCg+DQFhk4WxMzzpuxK7c2sHsjTMXlLBZAgkNTAeuMOlsLt/kLeL
   vC2On3R8CIOsqWR1jGsn+wm+EjS3SiDzyzaPxI2TklW5ccOhAqLJTs5t5
   k=;
Received: from esagw1.bmwgroup.com (HELO esagw1.muc) ([160.46.252.34]) by
 esa12.hc324-48.eu.iphmx.com with ESMTP/TLS; 19 Nov 2020 17:41:21 +0100
Received: from esabb5.muc ([160.50.100.47])  by esagw1.muc with ESMTP/TLS;
 19 Nov 2020 17:41:21 +0100
Received: from smucm33l.bmwgroup.net (HELO smucm33l.europe.bmw.corp) ([160.46.167.68])
 by esabb5.muc with ESMTP/TLS; 19 Nov 2020 17:41:20 +0100
Received: from smucm33l.europe.bmw.corp (160.46.167.68) by smucm33l.europe.bmw.corp
 (160.46.167.68) with Microsoft SMTP Server (TLS;
 Thu, 19 Nov 2020 17:41:20 +0100
Received: from smucm33l.europe.bmw.corp ([160.46.167.68]) by
 smucm33l.europe.bmw.corp ([160.46.167.68]) with mapi id 15.00.1497.007; Thu,
 19 Nov 2020 17:41:20 +0100
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <steve@sakoman.com>
CC: <ross@burtonini.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 3/5] sqlite3: add CVE-2015-3717 to whitelist
Thread-Topic: [OE-core] [PATCH 3/5] sqlite3: add CVE-2015-3717 to whitelist
Thread-Index: AQHWvmBfc/ZqIguScUelz8wqEYk9VKnPfPSAgAAbJIA=
Date: Thu, 19 Nov 2020 16:41:20 +0000
Message-ID: <20201119164119.GA1246345@korppu>
References: <20201119103813.2726273-1-ross.burton@arm.com>
 <20201119103813.2726273-3-ross.burton@arm.com>
 <CAOSpxdYRu4t85FLHB4W-_BFvP8amE2fkcgJ9taqTrvZ=8tRziQ@mail.gmail.com>
In-Reply-To: <CAOSpxdYRu4t85FLHB4W-_BFvP8amE2fkcgJ9taqTrvZ=8tRziQ@mail.gmail.com>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <07C1976F5E6FDB40B988870B351D8D9B@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

Or is the problem here that sqlite version 3.33 is not listed correctly on
https://nvd.nist.gov/vuln/detail/CVE-2015-3717#match-3021743
as I don't see this reported even for older 3.22 version in by yocto CVE ch=
ecker?

-Mikko=
