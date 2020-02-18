Return-Path: <prvs=31051da96=Mikko.Rapeli@bmw.de>
Received: from esa3.bmw.c3s2.iphmx.com (esa3.bmw.c3s2.iphmx.com
	[68.232.133.150])
	by mail.openembedded.org (Postfix) with ESMTP id 3ED346153C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 10:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1582020688; x=1613556688;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=hdJST6D4KdH2/KWI20YOqVwPOSkQQoXyULT1S2QmeqY=;
	b=Xbg0vIDHURLhtnKtksodffrq0vVOgKlpn/AePPn/odgH2lTeEJ+AP+Z5
	8mXRgZ3SWuMz6oPdbYyE38+qUXjsFSgw3M7KTRNB4VDXmBWKtYex3Bfdk
	+GSvafG9+doCZyoX86Rn4p7fbFNC0NO1Whj40F3ccpedOyHgUpcCSGYdd k=;
IronPort-SDR: RYPszR4UTYLvcjsTAzNAfU/wrmJWpvb27PqwZxQ3hZvJHYYlvrYz72Xc3xZc9DUTxQGwnQWEul
	Y3KP9SmXOBNrF2RIXwWwOBA+fXPFymRJcg0yK7U1TRCjpx45Oyts40bwEx1B9QaCZpqVmuBWRc
	DGfOV/eBXt/2kXCyLmFhFB+4RY27h2yqS0vL1d5HHbVC9gWVSi0Zude2UJStJHkeeMQBHh/lu3
	FmFE0GGRjF/Y22zaCpkIxdPlWQ7jMadLvxlZSov7dxYc4F9G5s+e0XUtTUj7JMCnmB3np+rzLh
	cA0=
Received: from esagw5.bmwgroup.com (HELO esagw5.muc) ([160.46.252.46]) by
	esa3.bmw.c3s2.iphmx.com with ESMTP/TLS; 18 Feb 2020 11:11:26 +0100
Received: from esabb4.muc ([160.50.100.33])  by esagw5.muc with ESMTP/TLS;
	18 Feb 2020 11:11:23 +0100
Received: from smucm10k.bmwgroup.net (HELO smucm10k.europe.bmw.corp)
	([160.48.96.47])
	by esabb4.muc with ESMTP/TLS; 18 Feb 2020 11:11:22 +0100
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10k.europe.bmw.corp
	(160.48.96.47) with Microsoft SMTP Server (TLS;
	Tue, 18 Feb 2020 11:11:22 +0100
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1473.005;
	Tue, 18 Feb 2020 11:11:22 +0100
From: <Mikko.Rapeli@bmw.de>
To: <jupiter.hce@gmail.com>
Thread-Topic: [OE-core] [yocto] Change RO rootfs failed RF Kill Switch Status
	and Failed to start Run pending postinsts
Thread-Index: AQHV5fbdCy49MNKwaEWF8CPLotJEUqggbySAgAAL/gCAABtwAIAADFuAgAAH6wA=
Date: Tue, 18 Feb 2020 10:11:22 +0000
Message-ID: <20200218101122.GE104502@korppu>
References: <CAA=hcWTDqhJEE7MXFY9rvN93nf8=nWvshLoXKF3EMXYGLmZGbA@mail.gmail.com>
	<CAAfyv34yO7bSR9GBod1bXpD0sFnsSETsJQAzcmSgyY0orGtfcg@mail.gmail.com>
	<CAA=hcWQFcdUJKGTOitOAx1URD7r=9PPxsdd=hQO-Yb77=QHTDg@mail.gmail.com>
	<20200218085848.GA104502@korppu>
	<CAA=hcWREdVeYqnOs-3aSFOhobaQWvLoaEU8Rdku_RM=Q5q2Ruw@mail.gmail.com>
In-Reply-To: <CAA=hcWREdVeYqnOs-3aSFOhobaQWvLoaEU8Rdku_RM=Q5q2Ruw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org, yocto@yoctoproject.org
Subject: Re: [yocto] Change RO rootfs failed RF Kill Switch Status and Failed to start Run pending postinsts
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Feb 2020 10:11:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0D99FF3142DBAF4C80C94BAF943D309B@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 18, 2020 at 08:43:01PM +1100, JH wrote:
> Hi Mikko,
>=20
> On 2/18/20, Mikko.Rapeli@bmw.de <Mikko.Rapeli@bmw.de> wrote:
> > I think you may be missing volatile-binds package and service from your
> > image.
> > See poky/meta/recipes-core/volatile-binds/volatile-binds.bb
>=20
> I got the source in my build system, it is zeus:
>=20
> oe-core/meta/recipes-core/volatile-binds/volatile-binds.bb
>=20
> ./all-oe-linux/volatile-binds
> ./all-oe-linux/volatile-binds/1.0-r0/packages-split/volatile-binds
> ./all-oe-linux/volatile-binds/1.0-r0/sysroot-destdir/sysroot-providers/vo=
latile-binds
> ./all-oe-linux/volatile-binds/1.0-r0/pkgdata-pdata-input/runtime/volatile=
-binds
> ./all-oe-linux/volatile-binds/1.0-r0/pkgdata-pdata-input/runtime-reverse/=
volatile-binds
> ./all-oe-linux/volatile-binds/1.0-r0/pkgdata-pdata-input/volatile-binds
> ./all-oe-linux/volatile-binds/1.0-r0/pkgdata/runtime/volatile-binds
> ./all-oe-linux/volatile-binds/1.0-r0/pkgdata/runtime-reverse/volatile-bin=
ds
> ./all-oe-linux/volatile-binds/1.0-r0/pkgdata/volatile-binds
> ./all-oe-linux/volatile-binds/1.0-r0/license-destdir/volatile-binds
>=20
> Are there correct?
>=20
> > It may be missing /var/log but with systemd there should not be needs t=
o
> > write
> > to that location after image builds...
>=20
> The volatile did not have the log, so /var/log -> volatile/log was an
> invalid link, should I manually create it?
>=20
> Thanks Mikko,

Well I have zeus and am using read-only rootfs with volatile binds and
I did not need anything extra. I would dig into this /var/log thing
and patch it away. I use systemd journal so no need for syslogs.

Cheers,

-Mikko=

