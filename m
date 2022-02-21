Return-Path: <mikko.rapeli@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71BE1C433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 07:04:40 +0000 (UTC)
Received: from esa5.hc324-48.eu.iphmx.com (esa5.hc324-48.eu.iphmx.com
 [207.54.71.60])
 by mx.groups.io with SMTP id smtpd.web08.8078.1645427077738965524
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 23:04:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=VZ83vwR3;
 spf=pass (domain: bmw.de, ip: 207.54.71.60,
 mailfrom: prvs=044a62bd9=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1645427078; x=1676963078;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=5aDq2Ba3jfydMU5vQ4F88OJ10b+Q/lBMLm7Ge5aO6HY=;
  b=VZ83vwR3hMpotYcXGWBxK67FijCan7s9x+f+chtxArWngkBuX4vHBmSd
   lR4rxCOlNXAQg9C9I10t0sIx0rdruj6E+T9D9NTz0fmZkuoUNnXJgGJm3
   2jNS+zrmOm/9hr+oh58ZPVFDSJXqasY+QNqjIE1i9Ytzeg7dICVzPQInC
   U=;
Received: from esagw5.bmwgroup.com (HELO esagw5.muc) ([160.46.252.46]) by
 esa5.hc324-48.eu.iphmx.com with ESMTP/TLS; 21 Feb 2022 08:04:34 +0100
Received: from esabb2.muc ([160.50.100.34])  by esagw5.muc with ESMTP/TLS;
 21 Feb 2022 08:04:34 +0100
Received: from smucm33k.bmwgroup.net (HELO smucm33k.europe.bmw.corp)
 ([160.46.167.67])
 by esabb2.muc with ESMTP/TLS; 21 Feb 2022 08:04:35 +0100
Received: from smucm33l.europe.bmw.corp (160.46.167.68) by
 smucm33k.europe.bmw.corp
 (160.46.167.67) with Microsoft SMTP Server (TLS;
 Mon, 21 Feb 2022 08:04:34 +0100
Received: from smucm33l.europe.bmw.corp ([160.46.167.68]) by
 smucm33l.europe.bmw.corp ([160.46.167.68]) with mapi id 15.00.1497.026; Mon,
 21 Feb 2022 08:04:33 +0100
From: <Mikko.Rapeli@bmw.de>
To: <steve@sakoman.com>
CC: <ticotimo@gmail.com>, <tim.orling@konsulko.com>,
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [dunfell][PATCH v2] openssl: upgrade to 1.1.1m for
 CVE-2021-4160
Thread-Topic: [OE-core] [dunfell][PATCH v2] openssl: upgrade to 1.1.1m for
 CVE-2021-4160
Thread-Index: AQHYIum5vSTNubjjjkO9gdntLLFkl6yZ6gOAgAAObACAACRLAIADbzqA
Date: Mon, 21 Feb 2022 07:04:33 +0000
Message-ID: <YhM5fyUSSrhW8E2D@korppu>
References: <20220216035900.851949-1-tim.orling@konsulko.com>
 <CAOSpxdYvC6Lk_d7MT81ZM72e4NUrPyg7W3HhF53_niN38bA77Q@mail.gmail.com>
 <CANx9H-B8pxFuD6Dsv+Zhw=iBzeVvOd+BCZijY96xjHtBCFwijA@mail.gmail.com>
 <CAOSpxda1U9+x_EDqcWd=Xv4Q4yUk9CnnPVNyXukZuuXqdFhw7Q@mail.gmail.com>
In-Reply-To: 
 <CAOSpxda1U9+x_EDqcWd=Xv4Q4yUk9CnnPVNyXukZuuXqdFhw7Q@mail.gmail.com>
Accept-Language: en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1918DC408E8D994B978EE9CCF0F45736@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 07:04:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162014

FWIW, there is also the pure patch to fix CVE-2021-4160 in openssl 1.1.1l f=
or dunfell:

https://lists.openembedded.org/g/openembedded-core/message/161652

Patch versus letter version update, which one is preferred?

-Mikko=

