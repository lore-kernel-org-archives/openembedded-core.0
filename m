Received: from esa9.hc324-48.eu.iphmx.com (esa9.hc324-48.eu.iphmx.com [207.54.69.27])
 by mx.groups.io with SMTP id smtpd.web08.28352.1604307675773949639
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 01:01:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1 header.b=RRwAurXL;
 spf=pass (domain: bmw.de, ip: 207.54.69.27, mailfrom: prvs=5683388e5=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1604307675; x=1635843675;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=lvwASBTMQNT7trvv79ELEClg1fUh9PJYLkgBRrANMwg=;
  b=RRwAurXLzbCFc3bm2Fj+XW84xKTTMGRpWULuWMG7YPk0Pzv+RxgYC0LT
   VAd7l4cXWdkx22Ehr9pLUwMjJMrfFKuQwUrAY9HDEropnBCVd3L39kiA7
   tS94Q89JSM1FcLXC1bJQ9OeLznhKMsFNkLLV5uRoaeK4A1w0sG6lC8Q2F
   Q=;
Received: from esagw6.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
 esa9.hc324-48.eu.iphmx.com with ESMTP/TLS; 02 Nov 2020 10:01:13 +0100
Received: from esabb4.muc ([160.50.100.33])  by esagw6.muc with ESMTP/TLS;
 02 Nov 2020 10:01:13 +0100
Received: from smucm10m.bmwgroup.net (HELO smucm10m.europe.bmw.corp) ([160.48.96.49])
 by esabb4.muc with ESMTP/TLS; 02 Nov 2020 10:01:04 +0100
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by smucm10m.europe.bmw.corp
 (160.48.96.49) with Microsoft SMTP Server (TLS;
 Mon, 2 Nov 2020 10:01:04 +0100
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
 smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1497.007; Mon, 2
 Nov 2020 10:01:03 +0100
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <richard.purdie@linuxfoundation.org>
CC: <openembedded-core@lists.openembedded.org>, <nicolas.dechesne@linaro.org>,
	<vkraleti@codeaurora.org>
Subject: Re: [OE-core] [PATCH 0/2] Example of how prebuilt binaries and locked sstate could work
Thread-Topic: [OE-core] [PATCH 0/2] Example of how prebuilt binaries and
 locked sstate could work
Thread-Index: AQHWsE4XUleYl3qrgUepjT/rwe4Stam0e/4A
Date: Mon, 2 Nov 2020 09:01:02 +0000
Message-ID: <20201102090100.GS1246345@korppu>
References: <20201101125302.350160-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20201101125302.350160-1-richard.purdie@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <86B491106F203047911F17735EBEA94B@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Nov 01, 2020 at 12:53:00PM +0000, Richard Purdie wrote:
> At the Yocto Project Summit, there was some talk about how prebuilt binar=
ies could
> be better supported. There was some discussion about how "locked sstate" =
could=20
> actually handle this quite neatly. I thought I'd have a look at that and =
came up=20
> with a few patches to illustrate what I was talking about.

Interesting, thanks for bringing this up also on mailing list!

How could one implement a variant where source recipe vs. pre-compiled
binary build would be chosen based on access rights to a git tree in
SRC_URI?

Cheers,

-Mikko=
