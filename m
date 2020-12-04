Received: from esa2.hc324-48.eu.iphmx.com (esa2.hc324-48.eu.iphmx.com [207.54.68.120])
 by mx.groups.io with SMTP id smtpd.web08.10947.1607063989010452082
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 22:39:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1 header.b=mMuI3uXk;
 spf=pass (domain: bmw.de, ip: 207.54.68.120, mailfrom: prvs=6003e8164=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1607063988; x=1638599988;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=GpnYR37R3VXNQbzNRB4Ges5L76joWBxCyXyuSdX17YM=;
  b=mMuI3uXkS5hptn4gdnYpO6/GgBNVGVUdo58yj2f7Ehipkto+ZCDGVOHZ
   LccYZOVKlLH3kFLNnFO++CK5KNrqdpEIGXIyx9NGZTCrlPTu85HTGwVor
   z0Dc70qaoie29eC6eMNUsKIB2QzMQF9c1xX9BJX6ybeRpWrq1OrnZi8jA
   A=;
Received: from esagw6.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
 esa2.hc324-48.eu.iphmx.com with ESMTP/TLS; 04 Dec 2020 07:39:44 +0100
Received: from esabb3.muc ([160.50.100.30])  by esagw6.muc with ESMTP/TLS;
 04 Dec 2020 07:39:44 +0100
Received: from smucm33k.bmwgroup.net (HELO smucm33k.europe.bmw.corp) ([160.46.167.67])
 by esabb3.muc with ESMTP/TLS; 04 Dec 2020 07:39:44 +0100
Received: from smucm33l.europe.bmw.corp (160.46.167.68) by smucm33k.europe.bmw.corp
 (160.46.167.67) with Microsoft SMTP Server (TLS;
 Fri, 4 Dec 2020 07:39:44 +0100
Received: from smucm33l.europe.bmw.corp ([160.46.167.68]) by
 smucm33l.europe.bmw.corp ([160.46.167.68]) with mapi id 15.00.1497.008; Fri,
 4 Dec 2020 07:39:44 +0100
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <alex.kanavin@gmail.com>
CC: <ross@burtonini.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Automatic cap on BB_NUMBER_THREADS and PARALLEL_MAKE
Thread-Topic: [OE-core] Automatic cap on BB_NUMBER_THREADS and PARALLEL_MAKE
Thread-Index: AQHWyZyLsSFRy5LEAEGM/WB9rOfV96nlneOAgADOn4A=
Date: Fri, 4 Dec 2020 06:39:44 +0000
Message-ID: <X8nZr2QoOxzudkLD@korppu>
References: <CAAnfSTuCTy4U60iJwtMm=N1PEaWjz6XyL_idgRXJVbzuLHggUw@mail.gmail.com>
 <CANNYZj_cQy2di0z7ianh59q-gXsDPR4uxZ0xZLQRLxx9PUu7sA@mail.gmail.com>
In-Reply-To: <CANNYZj_cQy2di0z7ianh59q-gXsDPR4uxZ0xZLQRLxx9PUu7sA@mail.gmail.com>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <058ECF7129D21046A11923A3BB573D08@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 03, 2020 at 07:20:11PM +0100, Alexander Kanavin wrote:
> I'd rather teach bitbake to abstain from starting new tasks when I/O or C=
PU
> gets tight.

And memory!

-Mikko
