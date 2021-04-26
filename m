Received: from esa5.hc324-48.eu.iphmx.com (esa5.hc324-48.eu.iphmx.com [207.54.71.60])
 by mx.groups.io with SMTP id smtpd.web12.3425.1619419352648704079
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 23:42:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1 header.b=YseTY7jV;
 spf=pass (domain: bmw.de, ip: 207.54.71.60, mailfrom: prvs=743277ded=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1619419352; x=1650955352;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=zik0yHwoWqSB7+KdFl9/0GwuhYjZJKoU+42E6c3ugnQ=;
  b=YseTY7jV8dev5ERCXXfRNrBLd4K1qaYzxRgR72VnJ4f7S1tvBGarHcE9
   JSDXrXC/h0MgIRUpwHR7kEs5QeP93/9RqkkVTw2oYO7dVYrcAo+X/rubV
   7m8hw+hQuG54bx0QGA9DmkT7s5YMGqjStNNLyH+smpbL2pNc7Cwv988Gq
   w=;
Received: from esagw4.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
 esa5.hc324-48.eu.iphmx.com with ESMTP/TLS; 26 Apr 2021 08:42:28 +0200
Received: from esabb5.muc ([160.50.100.47])  by esagw4.muc with ESMTP/TLS;
 26 Apr 2021 08:42:28 +0200
Received: from smucm33m.bmwgroup.net (HELO smucm33m.europe.bmw.corp) ([160.46.167.69])
 by esabb5.muc with ESMTP/TLS; 26 Apr 2021 08:42:27 +0200
Received: from smucm33l.europe.bmw.corp (160.46.167.68) by smucm33m.europe.bmw.corp
 (160.46.167.69) with Microsoft SMTP Server (TLS;
 Mon, 26 Apr 2021 08:42:27 +0200
Received: from smucm33l.europe.bmw.corp ([160.46.167.68]) by
 smucm33l.europe.bmw.corp ([160.46.167.68]) with mapi id 15.00.1497.015; Mon,
 26 Apr 2021 08:42:27 +0200
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <akuster808@gmail.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 4/6] systemd: Enable seccomp if FEATURE is set
Thread-Topic: [OE-core] [PATCH 4/6] systemd: Enable seccomp if FEATURE is set
Thread-Index: AQHXOSKg8eNoxLaF90y2+nUQxKmZ76rGOtcA
Date: Mon, 26 Apr 2021 06:42:27 +0000
Message-ID: <YIZg0i/V+nW4aTKG@korppu>
References: <20210424155639.1131482-1-akuster808@gmail.com>
 <20210424155639.1131482-5-akuster808@gmail.com>
In-Reply-To: <20210424155639.1131482-5-akuster808@gmail.com>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4B342C2D2463D64CA59B6A7E5ABFAC60@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

Hi,

Patch itself is ok, but I'll just comment that I've seen some boot time reg=
ressions
coming from systemd seccomp support. On NXP iMX8 and dunfell, systemd neede=
d a
few 100 ms more time in early boot if seccomp was enabled. I could not figu=
re out
where this was lost though. Could be just kernel or BSP SW configuration pr=
oblem that
we had. Ideas what could be causing this would be nice to hear...

Cheers,

-Mikko=
