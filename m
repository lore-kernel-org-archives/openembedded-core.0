Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.web11.9335.1604915614685764133
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2020 01:53:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=CzrI0hOI;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: dzagorui@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1978; q=dns/txt; s=iport;
  t=1604915614; x=1606125214;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=64GREgLsu1AGU5uBRmTj0EyJyjasa3H8YyGYGqz2xR0=;
  b=CzrI0hOIi0d8U/YkcSwnGI5HUgvBIh4G/we1AnekRBfNl5fGSS6XXHoU
   lY2XVecvdlELvitVl9Uvpq892eIgnfUZGP1NIUKAcL+V9eoceX1/dFtGC
   zLbUd06wlCOrXRE+n5QnRJZGvLcBRgoMxtnVP3YCYLr0ZTxYcg3XWsHn8
   0=;
X-IPAS-Result: =?us-ascii?q?A0CsCAC0EKlffYMNJK1iHgEBCxIMQIRtWS8uCpZZmyYLA?=
 =?us-ascii?q?QEBDQEBHw4CBAEBhEoCghICJTgTAgMBAQEDAgMBAQEBBQEBAQIBBgQUAQGGP?=
 =?us-ascii?q?AyFcwMDeRACAQghJQ8jJQIEDgWDJ4MGrEh0gTSFV4RxgTiNPxuBQT+BEYEUg?=
 =?us-ascii?q?Uk1PoQ+hXYEnD2baQoggk2JDZIAIqFwtBQCERWBMzghgVlwFYMkCUcXAg2Qa?=
 =?us-ascii?q?4t9dDgCBgoBAQMJfIw7AYEQAQE?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.77,463,1596499200"; 
   d="scan'208";a="621117143"
Received: from alln-core-1.cisco.com ([173.36.13.131])
  by alln-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Nov 2020 09:53:33 +0000
Received: from XCH-RCD-003.cisco.com (xch-rcd-003.cisco.com [173.37.102.13])
	by alln-core-1.cisco.com (8.15.2/8.15.2) with ESMTPS id 0A99rXLP028690
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
	Mon, 9 Nov 2020 09:53:33 GMT
Received: from xch-aln-004.cisco.com (173.36.7.14) by XCH-RCD-003.cisco.com
 (173.37.102.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 9 Nov
 2020 03:53:32 -0600
Received: from xch-aln-004.cisco.com ([173.36.7.14]) by XCH-ALN-004.cisco.com
 ([173.36.7.14]) with mapi id 15.00.1497.000; Mon, 9 Nov 2020 03:53:32 -0600
From: "Denys Zagorui -X (dzagorui - GLOBALLOGIC INC@Cisco)" <dzagorui@cisco.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] kernel-devsrc: improve reproducibility for arm64
Thread-Topic: [OE-core] [PATCH] kernel-devsrc: improve reproducibility for
 arm64
Thread-Index: AQHWrejRVNz5C+744kaUUDNWNcIlOamwE3FkgA+MDTQ=
Date: Mon, 9 Nov 2020 09:53:32 +0000
Message-ID: <1604915612657.49318@cisco.com>
References: <20201029114052.23141-1-dzagorui@cisco.com>,<CADkTA4OGBOtnMD=t1xppe-5quLow8uPf99ZHknrSnPLAQKkoDA@mail.gmail.com>,<1642C502B17F26A6.28917@lists.openembedded.org>
In-Reply-To: <1642C502B17F26A6.28917@lists.openembedded.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [173.38.209.9]
MIME-Version: 1.0
X-Outbound-SMTP-Client: 173.37.102.13, xch-rcd-003.cisco.com
X-Outbound-Node: alln-core-1.cisco.com
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> > > .vdso-offsets.h.cmd contains command that was used to produce vdso-of=
fsets.h.=0A=
> > > It breaks reproducibility because it has an absolute path in it. Ther=
e is no=0A=
> > > any value to package such files so it can be dropped.=0A=
> > >=0A=
> >=0A=
> > Have you confirmed that an on-target 'make scripts prepare' property=0A=
> > regenerates the file without triggering and oldconfig ?=0A=
> >=0A=
> > Otherwise, the change looks fine to me.=0A=
> >=0A=
> > Bruce=0A=
>=0A=
> Yes, confirmed that oldconfig wont be triggered.=0A=
>=0A=
> Thanks,=0A=
> Denys=0A=
=0A=
ping=0A=
=0A=
>=0A=
> >=0A=
> > > Signed-off-by: Denys Zagorui <dzagorui@cisco.com>=0A=
> > > ---=0A=
> > > meta/recipes-kernel/linux/kernel-devsrc.bb | 4 ++++=0A=
> > >  1 file changed, 4 insertions(+)=0A=
> > >=0A=
> > > diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipe=
s-kernel/linux/kernel-devsrc.bb=0A=
> > > index aa8e162f4f..f8c750beaa 100644=0A=
> > > --- a/meta/recipes-kernel/linux/kernel-devsrc.bb=0A=
> > > +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb=0A=
> > > @@ -113,6 +113,10 @@ do_install() {=0A=
> > >         # but without this file, we get a forced syncconfig run in v5=
.8+, which prompts and=0A=
> > >         # breaks workflows.=0A=
> > >         cp -a --parents include/generated/autoconf.h $kerneldir/build=
 2>/dev/null || :=0A=
> > > +=0A=
> > > +       if [ -e $kerneldir/include/generated/.vdso-offsets.h.cmd ]; t=
hen=0A=
> > > +           rm $kerneldir/include/generated/.vdso-offsets.h.cmd=0A=
> > > +       fi=0A=
> > >      )=0A=
> > >=0A=
> > >      # now grab the chunks from the source tree that we need=0A=
> > > --=0A=
> > > 2.19.0.dirty=0A=
> > >=0A=
> > >=0A=
> > >=0A=
> > >=0A=
> >=0A=
> >=0A=
> > --=0A=
> > - Thou shalt not follow the NULL pointer, for chaos and madness await=
=0A=
> > thee at its end=0A=
> > - "Use the force Harry" - Gandalf, Star Trek II=0A=
> >=
