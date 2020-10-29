Received: from esa6.hc324-48.eu.iphmx.com (esa6.hc324-48.eu.iphmx.com [207.54.71.69])
 by mx.groups.io with SMTP id smtpd.web12.6029.1603963130058201064
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 02:18:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=l/oUxhpm;
 spf=pass (domain: bmw.de, ip: 207.54.71.69, mailfrom: prvs=56492ee7e=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1603963130; x=1635499130;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=CX346wpTGLf9j+LHFHptUXI7fa0nvOU8UqL+JrsEoTs=;
  b=l/oUxhpmfT4z38mOzMVXHWiedfkPMVssfxzQKU5b4jszr3Tq6fSydes2
   zZ6ETFjY+KzLoDhgtM0mGGzXR3OsEr3QwlGcl2Eoy+Jg7HcfTnStdWYvU
   hBZb1uj9ogWdyurN+DttUI+Drjb+WT15ZctIdYCgq8pUmHkxt/K5UJVoI
   Q=;
Received: from esagw2.bmwgroup.com (HELO esagw2.muc) ([160.46.252.38]) by
 esa6.hc324-48.eu.iphmx.com with ESMTP/TLS; 29 Oct 2020 10:18:46 +0100
Received: from esabb3.muc ([160.50.100.30])  by esagw2.muc with ESMTP/TLS;
 29 Oct 2020 10:18:46 +0100
Received: from smucm10k.bmwgroup.net (HELO smucm10k.europe.bmw.corp) ([160.48.96.47])
 by esabb3.muc with ESMTP/TLS; 29 Oct 2020 10:18:46 +0100
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by smucm10k.europe.bmw.corp
 (160.48.96.47) with Microsoft SMTP Server (TLS;
 Thu, 29 Oct 2020 10:18:45 +0100
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
 smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1497.007; Thu,
 29 Oct 2020 10:18:45 +0100
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <richard.purdie@linuxfoundation.org>
CC: <paul.eggleton@linux.microsoft.com>,
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [RFC PATCH 1/2] classes/buildhistory: record SRC_URI
Thread-Topic: [OE-core] [RFC PATCH 1/2] classes/buildhistory: record SRC_URI
Thread-Index: AQHWpc0GZ1VeehB1PkSsWRA8i3caAampah+AgAOkuwCAAT3IgA==
Date: Thu, 29 Oct 2020 09:18:45 +0000
Message-ID: <20201029091845.GM1246345@korppu>
References: <cover.1603080016.git.paul.eggleton@linux.microsoft.com>
 <e83e7133cc7affdc013455744f1bc31d83503757.1603080016.git.paul.eggleton@linux.microsoft.com>
 <20201026064259.GT2040@korppu>
 <f3c0e0b9ce68c2377148e85c522d9f5003a580bc.camel@linuxfoundation.org>
In-Reply-To: <f3c0e0b9ce68c2377148e85c522d9f5003a580bc.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D6C9901A6E69244D944C38BC31F2082B@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2020 at 02:21:22PM +0000, Richard Purdie wrote:
> On Mon, 2020-10-26 at 06:43 +0000, Mikko Rapeli wrote:
> > On Sun, Oct 18, 2020 at 09:03:56PM -0700, Paul Eggleton wrote:
> > > From: Paul Eggleton <paul.eggleton@microsoft.com>
> > >=20
> > > It can be useful to record SRC_URI into buildhistory for the
> > > purposes of
> > > tracking exactly which sources got built (we already have SRCREV)
> > > as
> > > well as getting an indication when changes to the SRC_URI relate to
> > > changes in the output.
> > >=20
> > > Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
> >=20
> > I have similar patch in our poky trees. Also have patches
> > to export LICENSE and CVE_PRODUCT to buildhistory. These are used
> > by some post-build QA check scripts.
> >=20
> > Acked-by: Mikko Rapeli <mikko.rapeli@bmw.de>
>=20
> I'm actually fairly against some of these kinds of changes.
> Buildhistory is meant to be there to highlight changes in the output
> over time. Using it to create manifests and for license checking
> purposes is not what it was designed for.
>=20
> I just feel if the original author of the class thinks its a good idea
> I need to give up :/.

Surely changes in LICENSE and SRC_URI over time are important for an overvi=
ew
of changes?

At least to me they are pretty much essential. I'm using buildhistory diffs=
 to
see what changes in major yocto updates for example once builds are passing=
.

Cheers,

-Mikko

>=20
> Cheers,
>=20
> Richard=
