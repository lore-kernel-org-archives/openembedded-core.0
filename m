Received: from esa5.hc324-48.eu.iphmx.com (esa5.hc324-48.eu.iphmx.com [207.54.71.60])
 by mx.groups.io with SMTP id smtpd.web11.21689.1611823535905201599
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jan 2021 00:45:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=TSAbbnJr;
 spf=pass (domain: bmw.de, ip: 207.54.71.60, mailfrom: prvs=655e30c88=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1611823536; x=1643359536;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=m4nR7n8paxdPra/Eap0HMdrqwU1YKAxAz+1YKLtnwnQ=;
  b=TSAbbnJrBeGsys4DQam1M85agCLr3Cd4QGKiVU7VkAE1Twqhjdc1LVnW
   3P0xSTw2XVT6dB7tLHzm8n5K2k6dpR+u6X75/yKZ6kKePmjZ3H91gMvY4
   g4hn9zAUu+hwhQnqlaAO8398Se8gaRRzyvpeGUXD4lP+NR1+Xy0WECzX6
   g=;
Received: from esagw4.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
 esa5.hc324-48.eu.iphmx.com with ESMTP/TLS; 28 Jan 2021 09:45:32 +0100
Received: from esabb2.muc ([160.50.100.34])  by esagw4.muc with ESMTP/TLS;
 28 Jan 2021 09:45:31 +0100
Received: from smucm33l.bmwgroup.net (HELO smucm33l.europe.bmw.corp) ([160.46.167.68])
 by esabb2.muc with ESMTP/TLS; 28 Jan 2021 09:45:30 +0100
Received: from smucm33l.europe.bmw.corp (160.46.167.68) by smucm33l.europe.bmw.corp
 (160.46.167.68) with Microsoft SMTP Server (TLS;
 Thu, 28 Jan 2021 09:45:30 +0100
Received: from smucm33l.europe.bmw.corp ([160.46.167.68]) by
 smucm33l.europe.bmw.corp ([160.46.167.68]) with mapi id 15.00.1497.010; Thu,
 28 Jan 2021 09:45:30 +0100
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <richard.purdie@linuxfoundation.org>
CC: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/7] ncurses: Don't put terminfo into the sysroot
Thread-Topic: [OE-core] [PATCH 1/7] ncurses: Don't put terminfo into the
 sysroot
Thread-Index: AQHW9NHRNmfwpIQ3xESg4osHtMRtkao8qXWA
Date: Thu, 28 Jan 2021 08:45:30 +0000
Message-ID: <YBJ5qanQrSxjhX6u@korppu>
References: <20210127172753.1286275-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20210127172753.1286275-1-richard.purdie@linuxfoundation.org>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E3D89E4B028A5244AA9DEEAF762EE91E@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

Hi Richard,

Interesting series! Do you already have some numbers how this affects
bitbake builds?

Cheers,

-Mikko=
