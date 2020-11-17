Received: from esa2.hc324-48.eu.iphmx.com (esa2.hc324-48.eu.iphmx.com [207.54.68.120])
 by mx.groups.io with SMTP id smtpd.web09.4881.1605598642056321493
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2020 23:37:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1 header.b=LiXF3AwK;
 spf=pass (domain: bmw.de, ip: 207.54.68.120, mailfrom: prvs=583263a12=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1605598641; x=1637134641;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=0czC/iS8wio86PhaiPNthWeAz6b0RyRkXrzcz7phZiw=;
  b=LiXF3AwKhuLeFWcML1azxSzA009FGPVZj8/l3rOmT7yYz8Oq4/gRDxle
   AgBCY8xkk55LIJf0do3ePhYQ17zuZ/QJEmBRSp7qeqgDiGlzmbimLWzjX
   mhLWAt0x8ebcKD4XCEeiu78vVGRM/6vlJd4WRoQK4YM0ul+LDs046HPc4
   c=;
Received: from esagw5.bmwgroup.com (HELO esagw5.muc) ([160.46.252.46]) by
 esa2.hc324-48.eu.iphmx.com with ESMTP/TLS; 17 Nov 2020 08:37:19 +0100
Received: from esabb3.muc ([160.50.100.30])  by esagw5.muc with ESMTP/TLS;
 17 Nov 2020 08:37:19 +0100
Received: from smucm10m.bmwgroup.net (HELO smucm10m.europe.bmw.corp) ([160.48.96.49])
 by esabb3.muc with ESMTP/TLS; 17 Nov 2020 08:37:18 +0100
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by smucm10m.europe.bmw.corp
 (160.48.96.49) with Microsoft SMTP Server (TLS;
 Tue, 17 Nov 2020 08:37:18 +0100
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
 smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1497.007; Tue,
 17 Nov 2020 08:37:18 +0100
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <steve@sakoman.com>
CC: <openembedded-core@lists.openembedded.org>,
	<yocto-security@lists.yoctoproject.org>
Subject: Re: [yocto-security] [OE-core] OE-core CVE metrics for dunfell on Sun 15 Nov 2020 07:30:01 AM HST
Thread-Topic: [yocto-security] [OE-core] OE-core CVE metrics for dunfell on
 Sun 15 Nov 2020 07:30:01 AM HST
Thread-Index: AQHWvGvnXvGaGkFGo0Cf6ypJhlDvqqnL31YA
Date: Tue, 17 Nov 2020 07:37:17 +0000
Message-ID: <20201117073716.GR1246345@korppu>
References: <1647BED07B3D5BA1.30187@lists.openembedded.org>
 <CAOSpxdZ3jWzJAN+ha=ZA732CNYUtwR2Uea=HprCu2pTDtrb10w@mail.gmail.com>
In-Reply-To: <CAOSpxdZ3jWzJAN+ha=ZA732CNYUtwR2Uea=HprCu2pTDtrb10w@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B6FDA155AABAB54983F25C3250BA52C8@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2020 at 12:57:17PM -1000, Steve Sakoman wrote:
> For those who haven't been following that closely, here's what the
> dunfell CVE count has looked like over the past three months:
>=20
> 08/16 202
> 08/23 201
> 08/30 180
> 09/06 181
> 09/13 152
> 09/20 149
> 10/04 148
> 10/11 145
> 10/18 111
> 10/25 93
> 11/01 90
> 11/08 86
> 11/15 71
>=20
> Onward to zero!

This is impressive! Thanks a lot, Steve!

-Mikko=
