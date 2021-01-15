Received: from esa11.hc324-48.eu.iphmx.com (esa11.hc324-48.eu.iphmx.com [207.54.69.30])
 by mx.groups.io with SMTP id smtpd.web11.4459.1610729942071269957
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 08:59:03 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1 header.b=JkBdhTHd;
 spf=pass (domain: bmw.de, ip: 207.54.69.30, mailfrom: prvs=642ee8af7=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1610729942; x=1642265942;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=MPtuq4ixtIXi8gsVOgjFJFjwT0f/czLoMeYnET3MrpM=;
  b=JkBdhTHd019AmeG8HLjyHCMf4OWL4F8jLCDB2Ly9bR9moYZKENqN+Eb5
   m8WaRZURMe5kIYI37fP33YMpYVz8O/rIXdCa1yr95QXFTyJdRN9Znf+8n
   Pb9QjkuN5WGCiRNUEzUWfzS9A7JOI/w9lYzCdoazNOEaa/K6MxWdqeuTT
   Q=;
Received: from esagw3.bmwgroup.com (HELO esagw3.muc) ([160.46.252.35]) by
 esa11.hc324-48.eu.iphmx.com with ESMTP/TLS; 15 Jan 2021 17:58:59 +0100
Received: from esabb2.muc ([160.50.100.34])  by esagw3.muc with ESMTP/TLS;
 15 Jan 2021 17:58:59 +0100
Received: from smucm33j.bmwgroup.net (HELO smucm33j.europe.bmw.corp) ([160.46.167.66])
 by esabb2.muc with ESMTP/TLS; 15 Jan 2021 17:58:59 +0100
Received: from smucm33l.europe.bmw.corp (160.46.167.68) by smucm33j.europe.bmw.corp
 (160.46.167.66) with Microsoft SMTP Server (TLS;
 Fri, 15 Jan 2021 17:58:59 +0100
Received: from smucm33l.europe.bmw.corp ([160.46.167.68]) by
 smucm33l.europe.bmw.corp ([160.46.167.68]) with mapi id 15.00.1497.010; Fri,
 15 Jan 2021 17:58:59 +0100
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <richard.purdie@linuxfoundation.org>
CC: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH][dunfell][gatesgarth][master] zip: whitelist CVE-2018-13410 and CVE-2018-13684
Thread-Topic: [OE-core] [PATCH][dunfell][gatesgarth][master] zip: whitelist
 CVE-2018-13410 and CVE-2018-13684
Thread-Index: AQHW6yv1qPn0KnbFCU2frI+rpzZg+aoo1VGAgAADAIA=
Date: Fri, 15 Jan 2021 16:58:59 +0000
Message-ID: <YAHJ0TSKnUuczvAQ@korppu>
References: <20210115104807.40671-1-mikko.rapeli@bmw.de>
 <49b9decc4cf96646d8bb616931548966ac9f37f6.camel@linuxfoundation.org>
In-Reply-To: <49b9decc4cf96646d8bb616931548966ac9f37f6.camel@linuxfoundation.org>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <C33EF94C1DCB0148AB26DB090DE33794@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 15, 2021 at 04:48:13PM +0000, Richard Purdie wrote:
> On Fri, 2021-01-15 at 12:48 +0200, Mikko Rapeli wrote:
> > https://nvd.nist.gov/vuln/detail/CVE-2018-13410 is disputed and
> > also Debian considers it not a vulnerability:
> >=20
> > https://security-tracker.debian.org/tracker/CVE-2018-13410
> >=20
> > http://seclists.org/fulldisclosure/2018/Jul/24
> > "Negligible security impact, would involve that a untrusted party contr=
ols the -TT value."
> >=20
> > https://nvd.nist.gov/vuln/detail/CVE-2018-13684 is not for zip, also De=
bian concludes this:
> >=20
> > https://security-tracker.debian.org/tracker/CVE-2018-13684
> >=20
> > "NOT-FOR-US: smart contract implementation for ZIP"
> >=20
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> > ---
> > =A0meta/recipes-extended/zip/zip_3.0.bb | 3 +++
> > =A01 file changed, 3 insertions(+)
> >=20
> > diff --git a/meta/recipes-extended/zip/zip_3.0.bb b/meta/recipes-extend=
ed/zip/zip_3.0.bb
> > index c00a932763..47e6fc5278 100644
> > --- a/meta/recipes-extended/zip/zip_3.0.bb
> > +++ b/meta/recipes-extended/zip/zip_3.0.bb
> > @@ -19,6 +19,9 @@ UPSTREAM_VERSION_UNKNOWN =3D "1"
> > =A0SRC_URI[md5sum] =3D "7b74551e63f8ee6aab6fbc86676c0d37"
> > =A0SRC_URI[sha256sum] =3D "f0e8bb1f9b7eb0b01285495a2699df3a4b766784c176=
5a8f1aeedf63c0806369"
> >=20
> >=20
> > +CVE_CHECK_WHITELIST +=3D "CVE-2018-13410"
> > +CVE_CHECK_WHITELIST +=3D "CVE-2018-13684"
> > +
>=20
> Where we're adding these can we put a small comment in as well just
> saying why we're whitelisting it?

Sure, but lets try to be consistent then.

> I appreciate the info is in the commit but I think its important enough
> to list in the recipe as a comment too.

I agree.

Though it's not clear if these should be removed when updating recipe versi=
ons.
Sometimes NVD data is good, sometimes bad, sometimes it's not clear howto f=
ix...
Doing local builds with

INHERIT +=3D "cve-check"

is the only way to find out, I guess.

Cheers,

-Mikko

> Cheers,
>=20
> Richard=
