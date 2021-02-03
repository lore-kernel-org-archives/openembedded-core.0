Received: from esa4.hc324-48.eu.iphmx.com (esa4.hc324-48.eu.iphmx.com [207.54.71.48])
 by mx.groups.io with SMTP id smtpd.web08.7253.1612346565522003865
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Feb 2021 02:02:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1 header.b=GJlMBTa0;
 spf=pass (domain: bmw.de, ip: 207.54.71.48, mailfrom: prvs=661aacca0=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1612346565; x=1643882565;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=4p4lSvZ0N47+eeSBoRiPQ4IeASoqBdBT6yOZ318JeAk=;
  b=GJlMBTa0u4RdINUP8PYDVJNS6FVo+2S5Dz7K7lXGx1W+9pTX9k6VUikT
   qruCt7ygJfeoJQtttNu2ZgIn1PZCfw8UAKuOEaHKOxlKdeKmpQVcPjdwd
   3dzqTpBOXxJcOvjaHtndtE/7PAWTaz6Ra1zLuqVkaF68b1O8S7fcb5Qx2
   I=;
Received: from esagw2.bmwgroup.com (HELO esagw2.muc) ([160.46.252.38]) by
 esa4.hc324-48.eu.iphmx.com with ESMTP/TLS; 03 Feb 2021 11:02:41 +0100
Received: from esabb1.muc ([160.50.100.31])  by esagw2.muc with ESMTP/TLS;
 03 Feb 2021 11:02:24 +0100
Received: from smucm33j.bmwgroup.net (HELO smucm33j.europe.bmw.corp) ([160.46.167.66])
 by esabb1.muc with ESMTP/TLS; 03 Feb 2021 11:02:25 +0100
Received: from smucm33l.europe.bmw.corp (160.46.167.68) by smucm33j.europe.bmw.corp
 (160.46.167.66) with Microsoft SMTP Server (TLS;
 Wed, 3 Feb 2021 11:02:24 +0100
Received: from smucm33l.europe.bmw.corp ([160.46.167.68]) by
 smucm33l.europe.bmw.corp ([160.46.167.68]) with mapi id 15.00.1497.010; Wed,
 3 Feb 2021 11:02:24 +0100
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <anbelski@linux.microsoft.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [dunfell][PATCH] glib-2.0: Rename patch file for CVE-2020-35457
Thread-Topic: [OE-core] [dunfell][PATCH] glib-2.0: Rename patch file for
 CVE-2020-35457
Thread-Index: AQHW+gisH0Y3b7H+B0GSkgoJTz1Zc6pGIoCA
Date: Wed, 3 Feb 2021 10:02:24 +0000
Message-ID: <YBp0r/IvR1vFubjt@korppu>
References: <20210203084257.26778-1-anbelski@linux.microsoft.com>
In-Reply-To: <20210203084257.26778-1-anbelski@linux.microsoft.com>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D359851AAF75E44A8691FFEAF5C6F141@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Feb 03, 2021 at 08:42:57AM +0000, Anatol Belski wrote:
> The naming convention needs to be help so the CVE is recognized as
> fixed by the tooling.

Yocto CVE checker does detect CVE patches also from patch comments so
this change is not needed for that. This is sufficient:

poky$ git grep CVE-2020-35457
meta/recipes-core/glib-2.0/glib-2.0/0001-goption-Add-a-precondition-to-avoi=
d-GOptionEntry-lis.patch:CVE: CVE-2020-35457

Is there some other tooling that you are referring to?

Cheers,

-Mikko=
