Received: from esa3.hc324-48.eu.iphmx.com (esa3.hc324-48.eu.iphmx.com [207.54.68.121])
 by mx.groups.io with SMTP id smtpd.web10.32116.1607939653899560141
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 01:54:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1 header.b=pBiD4Eov;
 spf=pass (domain: bmw.de, ip: 207.54.68.121, mailfrom: prvs=610bae015=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1607939653; x=1639475653;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=plSGPi4rzjVwDx6JVAG6usVNQr6zGpOxV+ft3G0FOw8=;
  b=pBiD4Eoviv6iS1ZTU1o8TKV49juqCKmKi7mtScD/43eMcsxEwEksJ2Ah
   Q8KePhmB3l5GdLlQvaYCx74Z3pHJ/CRjvzonknHzVUhiVRCi1Zi6KEqad
   D3efOStyxWudUT0m+PiUZNaZUHot6QXgMuWQ8WSBr2dSYcspY9urz5CSu
   w=;
Received: from esagw1.bmwgroup.com (HELO esagw1.muc) ([160.46.252.34]) by
 esa3.hc324-48.eu.iphmx.com with ESMTP/TLS; 14 Dec 2020 10:54:11 +0100
Received: from esabb3.muc ([160.50.100.30])  by esagw1.muc with ESMTP/TLS;
 14 Dec 2020 10:54:11 +0100
Received: from smucm33j.bmwgroup.net (HELO smucm33j.europe.bmw.corp) ([160.46.167.66])
 by esabb3.muc with ESMTP/TLS; 14 Dec 2020 10:54:09 +0100
Received: from smucm33l.europe.bmw.corp (160.46.167.68) by smucm33j.europe.bmw.corp
 (160.46.167.66) with Microsoft SMTP Server (TLS;
 Mon, 14 Dec 2020 10:54:08 +0100
Received: from smucm33l.europe.bmw.corp ([160.46.167.68]) by
 smucm33l.europe.bmw.corp ([160.46.167.68]) with mapi id 15.00.1497.008; Mon,
 14 Dec 2020 10:54:08 +0100
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] systemd: update from 244.3 to 244.5 stable release
Thread-Topic: [OE-core] [PATCH] systemd: update from 244.3 to 244.5 stable
 release
Thread-Index: AQHW0f68qGAOUQaFqkuofv9zsp0Msqn2SV+A
Date: Mon, 14 Dec 2020 09:54:08 +0000
Message-ID: <X9c2P4r/fZE0nkcj@korppu>
References: <16508C71C809D644.13053@lists.openembedded.org>
In-Reply-To: <16508C71C809D644.13053@lists.openembedded.org>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F37C2DE9ACA2654AA62FFA8A77045BA3@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

Sorry, missed dunfell prefix. Fixed in v2.

-Mikko=
