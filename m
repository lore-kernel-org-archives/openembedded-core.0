Received: from esa2.bmw.c3s2.iphmx.com (esa2.bmw.c3s2.iphmx.com [68.232.133.169])
 by mx.groups.io with SMTP id smtpd.web11.429.1587145726122130758
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Apr 2020 10:48:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=lZv2yn/G;
 spf=pass (domain: bmw.de, ip: 68.232.133.169, mailfrom: prvs=36979d53e=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1587145727; x=1618681727;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=b3pLGeYhbFU460ZVaIvl5+zVMJJJfDaODquhAqySSfw=;
  b=lZv2yn/G9jAy7NK8d91GIYzmWkjfAS8uaLZFZNVbuxcJL6M55d/OQJ80
   nDYE1aDeYwzbAscKuxh4kt3RbpXi0bRAH6WTP2uFTz7J5dg1My9C0lR4K
   d24gI0xiT2+BTPDp5WDwb4IDXdjFIhZ6rU2igPnj4RHexkGjXCbZurAph
   4=;
Received: from esagw1.bmwgroup.com (HELO esagw1.muc) ([160.46.252.34]) by
 esa2.bmw.c3s2.iphmx.com with ESMTP/TLS; 17 Apr 2020 19:48:44 +0200
Received: from esabb1.muc ([160.50.100.31])  by esagw1.muc with ESMTP/TLS;
 17 Apr 2020 19:48:43 +0200
Received: from smucm10k.bmwgroup.net (HELO smucm10k.europe.bmw.corp) ([160.48.96.47])
 by esabb1.muc with ESMTP/TLS; 17 Apr 2020 19:48:43 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by smucm10k.europe.bmw.corp
 (160.48.96.47) with Microsoft SMTP Server (TLS;
 Fri, 17 Apr 2020 19:48:43 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
 smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1473.005; Fri,
 17 Apr 2020 19:48:43 +0200
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <akuster808@gmail.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH RFC] kernel.bbclass: run checkpatch.pl for all patches
Thread-Topic: [OE-core] [PATCH RFC] kernel.bbclass: run checkpatch.pl for all
 patches
Thread-Index: AQHWFLFNqDhTVWIkEUaQLvwvd8TEMKh9WEgAgAAdrAA=
Date: Fri, 17 Apr 2020 17:48:43 +0000
Message-ID: <20200417174842.GS104502@korppu>
References: <20200417121103.27918-1-mikko.rapeli@bmw.de>
 <1146552b-92dc-08f4-8335-366edc56a64b@gmail.com>
In-Reply-To: <1146552b-92dc-08f4-8335-366edc56a64b@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4510712ACA950A49A234A4A14298FFE9@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 17, 2020 at 09:02:30AM -0700, akuster808 wrote:
>=20
>=20
> On 4/17/20 5:11 AM, Mikko Rapeli wrote:
> > RFC: currently unconditionally, but this may need to be changed because
> > so many patches are not passing this check. Even upstream backports
> > from Linus Torvalds are failing the check sometimes.
> >
> > This is test is important to keep all kernel patches in upstreamable st=
ate.
> > It would help keeping BSP and project specific kernel recipes in better=
 shape.
> > It will not help if BSP git trees contain 1000's of non-upstreamed
> > patches. Passing this script is mandatory for patches according to
> > https://www.kernel.org/doc/html/latest/process/submit-checklist.html
>=20
> I am not opposed to having more checks, I worry about the impact on build=
.
>=20
> Maybe have this in a separate class so folks can opt-in or out depending
> on final conclusion of this RFC.

Agreed. In theory this would belong to insane.bbclass, or would only be
added if some extra variable or similar is set in the recipes using
kernel.bbclass, or a separate class if you will. I would need some pointers
here.

I'm also playing with sparse so that I can easily do sparse checker builds =
of
kernels from different BSPs. Will hopefully use similar approach with that =
too...

-Mikko=
