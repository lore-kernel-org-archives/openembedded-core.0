Received: from esa2.hc324-48.eu.iphmx.com (esa2.hc324-48.eu.iphmx.com [207.54.68.120])
 by mx.groups.io with SMTP id smtpd.web09.2985.1616789986604739949
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Mar 2021 13:19:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=PvhnWk3M;
 spf=pass (domain: bmw.de, ip: 207.54.68.120, mailfrom: prvs=7127a225c=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1616789987; x=1648325987;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=FCqqbJIHUSre9OEEVstZpgLHne1Ms+gTj/juUvGe6RU=;
  b=PvhnWk3MveQzL8A2oX1kdESXM3YMIHA5p7xHZZ6wSuZmpEcHxh7p+LNC
   kSgixfKIjbi7Q+pBlF1tYgDQnkm4/ROQKvaMZAAi6keCuzyUrzGqBM3vP
   BO8tx9lytri10z3neyVlqjSlB2KJSCwrCN/xHkZZTShhFK7hqNAtZ5z2P
   8=;
Received: from esagw1.bmwgroup.com (HELO esagw1.muc) ([160.46.252.34]) by
 esa2.hc324-48.eu.iphmx.com with ESMTP/TLS; 26 Mar 2021 21:19:44 +0100
Received: from esabb2.muc ([160.50.100.34])  by esagw1.muc with ESMTP/TLS;
 26 Mar 2021 21:19:43 +0100
Received: from smucm33k.bmwgroup.net (HELO smucm33k.europe.bmw.corp) ([160.46.167.67])
 by esabb2.muc with ESMTP/TLS; 26 Mar 2021 21:19:43 +0100
Received: from smucm33l.europe.bmw.corp (160.46.167.68) by smucm33k.europe.bmw.corp
 (160.46.167.67) with Microsoft SMTP Server (TLS;
 Fri, 26 Mar 2021 21:19:43 +0100
Received: from smucm33l.europe.bmw.corp ([160.46.167.68]) by
 smucm33l.europe.bmw.corp ([160.46.167.68]) with mapi id 15.00.1497.012; Fri,
 26 Mar 2021 21:19:43 +0100
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <sakoman@gmail.com>
CC: <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH][gatesgarth][dunfell] openssl: update to 1.1.1k to fix CVE-2021-3450 and CVE-2021-3449
Thread-Topic: [OE-core] [PATCH][gatesgarth][dunfell] openssl: update to 1.1.1k
 to fix CVE-2021-3450 and CVE-2021-3449
Thread-Index: AQHXIawMwqOZSLCOTEiSQE1CUo+WAKqWjsWAgAAH8oCAAA/iAA==
Date: Fri, 26 Mar 2021 20:19:43 +0000
Message-ID: <YF5B3v1jKEUAAsKO@korppu>
References: <20210325192052.2976-1-mikko.rapeli@bmw.de>
 <CAMKF1sry10GxKxwSOoyPd87wXA4=r4Nb-YXHEV+3TxCcHaANzw@mail.gmail.com>
 <CAGDS+nkEswf5uxRA+3u-NV1L=87d2X140B3zVR9vSvcfjSCKJw@mail.gmail.com>
In-Reply-To: <CAGDS+nkEswf5uxRA+3u-NV1L=87d2X140B3zVR9vSvcfjSCKJw@mail.gmail.com>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6D39E217158C3A41B1A0EB0ACAEBD2A7@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 26, 2021 at 09:22:51AM -1000, Steve Sakoman wrote:
> On Fri, Mar 26, 2021 at 8:54 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > do we need this on dunfell too?
>=20
> I plan to take it when it hits master.

Thanks! As subject says, the patch applies to both gatesgarth and dunfell.

-Mikko=
