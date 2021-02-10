Received: from esa12.hc324-48.eu.iphmx.com (esa12.hc324-48.eu.iphmx.com [207.54.72.34])
 by mx.groups.io with SMTP id smtpd.web12.2918.1612946913071364873
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Feb 2021 00:48:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=iU3bw2d5;
 spf=pass (domain: bmw.de, ip: 207.54.72.34, mailfrom: prvs=668b81529=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1612946913; x=1644482913;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=glytZHAamRvqLwXrglwwQ9LzfbDIC5+ohrj0z8aqimg=;
  b=iU3bw2d5ZSx8o90jLgHBhNfSPphQGlaGMtKfI5mN83XfmHJfCWGOaRNo
   lnAXwaqcCXbIDyQUDJjmVFXeP8aLj5ulkEM0wZgsCodaK3CMfr87ar26d
   MmAwZ9NDBU6YybEkWJllqoNGWhBkqnXiEZ2R769eSxoXFIgZ+Ga/PmFzY
   Q=;
Received: from esagw2.bmwgroup.com (HELO esagw2.muc) ([160.46.252.38]) by
 esa12.hc324-48.eu.iphmx.com with ESMTP/TLS; 10 Feb 2021 09:48:30 +0100
Received: from esabb5.muc ([160.50.100.47])  by esagw2.muc with ESMTP/TLS;
 10 Feb 2021 09:48:30 +0100
Received: from smucm33j.bmwgroup.net (HELO smucm33j.europe.bmw.corp) ([160.46.167.66])
 by esabb5.muc with ESMTP/TLS; 10 Feb 2021 09:48:26 +0100
Received: from smucm33l.europe.bmw.corp (160.46.167.68) by smucm33j.europe.bmw.corp
 (160.46.167.66) with Microsoft SMTP Server (TLS;
 Wed, 10 Feb 2021 09:48:26 +0100
Received: from smucm33l.europe.bmw.corp ([160.46.167.68]) by
 smucm33l.europe.bmw.corp ([160.46.167.68]) with mapi id 15.00.1497.010; Wed,
 10 Feb 2021 09:48:26 +0100
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <raj.khem@gmail.com>
CC: <anuj.mittal@intel.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] security_flags.inc: Use -O with -D_FORTIFY_SOURCE
Thread-Topic: [OE-core] [PATCH] security_flags.inc: Use -O with
 -D_FORTIFY_SOURCE
Thread-Index: AQHW/FHPTLbovpFRkEKjnMnljGgpTqpQxiYAgAAvqYCAABPGgA==
Date: Wed, 10 Feb 2021 08:48:26 +0000
Message-ID: <YCOd2Ru/zB/fZedT@korppu>
References: <20210206063138.1649019-1-raj.khem@gmail.com>
 <3b2c317d565d09bda89eacb05002ef1f0d816c6c.camel@intel.com>
 <CAMKF1so+8XcjgVUjSbn3ph1ZMRQRjnLQbq4na9WNEfTT_TPwuQ@mail.gmail.com>
In-Reply-To: <CAMKF1so+8XcjgVUjSbn3ph1ZMRQRjnLQbq4na9WNEfTT_TPwuQ@mail.gmail.com>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <34D77D6EE0624F409D209E10F53C97D8@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Feb 09, 2021 at 11:37:39PM -0800, Khem Raj wrote:
> In this case -O  will take effect sadly. and it seems to be that
> autconf munges the compiler cmdline
> while generating CFLAGS in generated Makefiles and appends the value
> of -On coming from CC
> variable last.
>=20
> I think right solution would be to add same -O<level> as specified in
> SELECTED_OPTIMIZATION so it remains
> in sync always, I have sent a patch to ml. Could you test it out and
> let me know if it works for you as well.

Or let it go? A lot of recipes amend their own optimization flags and overr=
ide
distro wide optimization and other compiler flags. I once fixes all recipes
in a project which were not obeying Os until buildhistory showed change in =
binary
sizes... that was a lot of work for a PoC..

Cheers,

-Mikko=
