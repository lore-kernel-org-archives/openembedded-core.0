Received: from esa9.hc324-48.eu.iphmx.com (esa9.hc324-48.eu.iphmx.com [207.54.69.27])
 by mx.groups.io with SMTP id smtpd.web10.10798.1611767505373860936
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jan 2021 09:11:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1 header.b=rCnDHk5n;
 spf=pass (domain: bmw.de, ip: 207.54.69.27, mailfrom: prvs=65489b36c=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1611767505; x=1643303505;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=5/T19aOT5z0NCu9pvvubhcNiqlF+HPjFQB3T3FZxVTY=;
  b=rCnDHk5nXLlyirmdQ5+9Kp8Ei3E/ydQUENnBwLbaYfZScQLpMf1JuHnm
   nkz8l+Q4Pdyg2a/hTf0GGp1KSCR0QAAS6o+tbZ5PHxw/HKH1HdcRB7GfA
   uxjX8Htph3LfpecAeeTG7EDwgDEPFn4cermJPnKdMQPxBc8ODubffecSG
   Q=;
Received: from esagw2.bmwgroup.com (HELO esagw2.muc) ([160.46.252.38]) by
 esa9.hc324-48.eu.iphmx.com with ESMTP/TLS; 27 Jan 2021 18:11:43 +0100
Received: from esabb5.muc ([160.50.100.47])  by esagw2.muc with ESMTP/TLS;
 27 Jan 2021 18:11:42 +0100
Received: from smucm33j.bmwgroup.net (HELO smucm33j.europe.bmw.corp) ([160.46.167.66])
 by esabb5.muc with ESMTP/TLS; 27 Jan 2021 18:11:42 +0100
Received: from smucm33l.europe.bmw.corp (160.46.167.68) by smucm33j.europe.bmw.corp
 (160.46.167.66) with Microsoft SMTP Server (TLS;
 Wed, 27 Jan 2021 18:11:42 +0100
Received: from smucm33l.europe.bmw.corp ([160.46.167.68]) by
 smucm33l.europe.bmw.corp ([160.46.167.68]) with mapi id 15.00.1497.010; Wed,
 27 Jan 2021 18:11:42 +0100
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <richard.purdie@linuxfoundation.org>
CC: <chee.yang.lee@intel.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/2] openssl: set CVE_VERSION_SUFFIX
Thread-Topic: [OE-core] [PATCH 2/2] openssl: set CVE_VERSION_SUFFIX
Thread-Index: AQHW9ItwoQqUrNceCUa5DwmABpFxCqo7H0SAgACDCACAAALOAA==
Date: Wed, 27 Jan 2021 17:11:42 +0000
Message-ID: <YBGezLdwMjy/faKV@korppu>
References: <20210127090354.25091-1-chee.yang.lee@intel.com>
 <20210127090354.25091-2-chee.yang.lee@intel.com> <YBEuh09lQvJAvmqv@korppu>
 <fd0a039b6db0bfa994bf606d6fd54a10b22afdca.camel@linuxfoundation.org>
In-Reply-To: <fd0a039b6db0bfa994bf606d6fd54a10b22afdca.camel@linuxfoundation.org>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <91C239E879AF3F4CA8A6B00CA08EF53B@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jan 27, 2021 at 05:01:38PM +0000, Richard Purdie wrote:
> On Wed, 2021-01-27 at 09:12 +0000, Mikko Rapeli wrote:
> > On Wed, Jan 27, 2021 at 05:03:54PM +0800, Lee Chee Yang wrote:
> > > From: Lee Chee Yang <chee.yang.lee@intel.com>
> > >=20
> > > Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> > > ---
> > > =A0meta/recipes-connectivity/openssl/openssl_1.1.1i.bb | 2 ++
> > > =A01 file changed, 2 insertions(+)
> > >=20
> > > diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb b/me=
ta/recipes-connectivity/openssl/openssl_1.1.1i.bb
> > > index 52e96b7831..9ff80b3d4f 100644
> > > --- a/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
> > > +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
> > > @@ -230,6 +230,8 @@ BBCLASSEXTEND =3D "native nativesdk"
> > > =A0
> > >=20
> > >=20
> > >=20
> > > =A0CVE_PRODUCT =3D "openssl:openssl"
> > > =A0
> > >=20
> > >=20
> > >=20
> > > +CVE_VERSION_SUFFIX =3D "alphabetical"
> > > +
> >=20
> > I have to say that I don't like this. I'd prefer automation
> > which works like dpkg --compare-versions:
> >=20
> > =A0=A0=A0=A0=A0=A0=A0--compare-versions ver1 op ver2
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0Compare version numbers, wher=
e op is a binary operator. dpkg returns true (0) if the specified condition=
 is satisfied,
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0and  false  (1)  otherwise.  =
There  are two groups of operators, which differ in how they treat an empty=
 ver1 or ver2.
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0These treat an empty version =
as earlier than any version: lt le eq ne ge gt. These treat an  empty  vers=
ion  as  later
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0than any version: lt-nl le-nl=
 ge-nl gt-nl. These are provided only for compatibility with control file s=
yntax: < << <=3D
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=3D >=3D >> >. The < and > op=
erators are obsolete and should not be used, due to confusing semantics. To=
 illustrate: 0.1 <
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A00.1 evaluates to true.
>=20
> The trouble is we have no control over what versions end up in the CPEs
> and I suspect that even dpkg's version comparison doesn't work for some
> of our test cases?

For example:

$ dpkg --compare-versions 1.1.1i lt 1.1.1j && echo true
true

dpkg can tell that 1.1.1i older version than 1.1.1j.

$ dpkg --compare-versions 1.1.1i lt 1.1.1e || echo not older
not older

and dpkg can tell that 1.1.1i is not older than 1.1.1e.

Hope this helps,

-Mikko

> If it does, it would be useful to understand how they're managing to do
> that as I think some of the patterns conflict as I understand it.
>=20
> Debian can make it work for their packages since they control what
> version they ultimately assign to them.

Yes but the tool does seem to work for most SW version identifiers in Debia=
n and
can deduce which one is newer. openssl version numbers work correctly out o=
f the box.

Cheers,

-Mikko=
