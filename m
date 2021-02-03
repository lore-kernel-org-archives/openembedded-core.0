Received: from esa8.hc324-48.eu.iphmx.com (esa8.hc324-48.eu.iphmx.com [207.54.65.242])
 by mx.groups.io with SMTP id smtpd.web08.11352.1612367605256355809
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Feb 2021 07:53:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1 header.b=MiOKEpug;
 spf=pass (domain: bmw.de, ip: 207.54.65.242, mailfrom: prvs=661aacca0=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1612367605; x=1643903605;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=D1Pxz5gLQ69k0DDcjGOk3FWT9IU4plLmkBXW//zi4+A=;
  b=MiOKEpugvDX8CUHflKzd+/GYyNqKjnJROcGAjxdZRsWBzGUUqPCNH9AA
   RvCxVL4maJbJUwrd1Liy1dyk3+bkNCtgudRWX72ge2uSoPOdgLoCC6BZu
   WMJYmaTnTmkMHsGkIhz+szxaheWhHyD904SwvtsqQghV2gtH0RLjBPyaZ
   g=;
Received: from esagw5.bmwgroup.com (HELO esagw5.muc) ([160.46.252.46]) by
 esa8.hc324-48.eu.iphmx.com with ESMTP/TLS; 03 Feb 2021 16:53:22 +0100
Received: from esabb6.muc ([160.50.100.50])  by esagw5.muc with ESMTP/TLS;
 03 Feb 2021 16:53:22 +0100
Received: from smucm33m.bmwgroup.net (HELO smucm33m.europe.bmw.corp) ([160.46.167.69])
 by esabb6.muc with ESMTP/TLS; 03 Feb 2021 16:53:22 +0100
Received: from smucm33l.europe.bmw.corp (160.46.167.68) by smucm33m.europe.bmw.corp
 (160.46.167.69) with Microsoft SMTP Server (TLS;
 Wed, 3 Feb 2021 16:53:21 +0100
Received: from smucm33l.europe.bmw.corp ([160.46.167.68]) by
 smucm33l.europe.bmw.corp ([160.46.167.68]) with mapi id 15.00.1497.010; Wed,
 3 Feb 2021 16:53:22 +0100
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <steve@sakoman.com>
CC: <anbelski@linux.microsoft.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [dunfell][PATCH] glib-2.0: Rename patch file for CVE-2020-35457
Thread-Topic: [OE-core] [dunfell][PATCH] glib-2.0: Rename patch file for
 CVE-2020-35457
Thread-Index: AQHW+gisH0Y3b7H+B0GSkgoJTz1Zc6pGIoCAgABNRwCAABTHAA==
Date: Wed, 3 Feb 2021 15:53:21 +0000
Message-ID: <YBrG8IXZ18sRjupY@korppu>
References: <20210203084257.26778-1-anbelski@linux.microsoft.com>
 <YBp0r/IvR1vFubjt@korppu>
 <CAOSpxdYJNWu+cPtAH_ceHuOsYVYEo8ozh0RJRRcv54-B139fOA@mail.gmail.com>
In-Reply-To: <CAOSpxdYJNWu+cPtAH_ceHuOsYVYEo8ozh0RJRRcv54-B139fOA@mail.gmail.com>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <90E319E9B7915543918DDE30B57696E3@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 03, 2021 at 04:38:58AM -1000, Steve Sakoman wrote:
> On Wed, Feb 3, 2021 at 12:02 AM Mikko Rapeli <mikko.rapeli@bmw.de> wrote:
> >
> > Hi,
> >
> > On Wed, Feb 03, 2021 at 08:42:57AM +0000, Anatol Belski wrote:
> > > The naming convention needs to be help so the CVE is recognized as
> > > fixed by the tooling.
> >
> > Yocto CVE checker does detect CVE patches also from patch comments so
> > this change is not needed for that. This is sufficient:
> >
> > poky$ git grep CVE-2020-35457
> > meta/recipes-core/glib-2.0/glib-2.0/0001-goption-Add-a-precondition-to-=
avoid-GOptionEntry-lis.patch:CVE: CVE-2020-35457
>=20
> Yes, we are detecting the CVE patch from the patch comment.
>=20
> However our CVE patch guidelines do request that the patch be named
> with the CVE as the name:
>=20
> https://wiki.yoctoproject.org/wiki/Security
>=20
> (in the "Patch name convention and commit message" section)
>=20
> I'm sorry I didn't catch this when I merged this earlier.  I always
> check the patch itself for the CVE tag, but I missed the name.  So I'm
> happy to take this patch just to clean up the metadata and make it
> easy to see that this is a CVE patch.

Does anyone know why CVE ID in both name of the patch and in the CVE: tag a=
re required?

Sometimes when copying patches over from upstream or other distros, I prefe=
r to do as
little changes to them as possible. Adding CVE: tag and Upstream-Status are=
 ok, but
for example renaming all patches files copied from a Debian/Ubuntu patch se=
t is
a bit too much.

Cheers,

-Mikko=
