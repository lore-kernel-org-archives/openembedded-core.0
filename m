Return-Path: <prvs=296d8a8c9=Mikko.Rapeli@bmw.de>
X-Greylist: delayed 429 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 04 Feb 2020 09:28:59 UTC
Received: from esa8.bmw.c3s2.iphmx.com (esa8.bmw.c3s2.iphmx.com
	[68.232.139.97])
	by mail.openembedded.org (Postfix) with ESMTP id 14E19611FC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2020 09:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1580808542; x=1612344542;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=hyQhAU1wO53WXRuO4ZJx6x64wWSPJqqGJVYz7AElcaI=;
	b=jwWZMtp81+b9o6SgFKx0Pdb59BuY1GvrNKSefD6Adqbvs6Q7XtLgYDK8
	ccNWS8ofR9tRZhob8tNI6P5d1oU+vWDgJVyUgdSpYe1WxYBq4ej1NDR1B
	PkF9+HyKY8s8ubEP8I8p86i0cgkFgomy7WglDdw6AX/8tvymek9FnaXyW w=;
IronPort-SDR: Cl1CrVVJ1IqNhkY8dhRsFx2YFCM619sEQtwXUV4k4YEmvvYh1XPEadapB5wxawRw6OEDstiPgZ
	cCg6T2M6urSURsrijzzP8023EFvcv90eq+JAM4b1tfAxSEeI57bObXw+/Xkxsk0ppoUTH87QYH
	gOrujGawtRH49JAxwKlvEM+MflKzmLmln39T22sQUNlQHpep9B+Qxcid/kmXSBYM9ZqLfa0gmC
	WzZnAwIYbjwyUyA18cDXHE0B8vtdsD58cqbRfyoULn99SfUoBqNdIlaDC3kz8Lsna5uXoE8W6S
	kyY=
Received: from esagw2.bmwgroup.com (HELO esagw2.muc) ([160.46.252.38]) by
	esa8.bmw.c3s2.iphmx.com with ESMTP/TLS; 04 Feb 2020 10:21:29 +0100
Received: from esabb1.muc ([160.50.100.31])  by esagw2.muc with ESMTP/TLS;
	04 Feb 2020 10:21:26 +0100
Received: from smucm10j.bmwgroup.net (HELO smucm10j.europe.bmw.corp)
	([160.48.96.46])
	by esabb1.muc with ESMTP/TLS; 04 Feb 2020 10:21:26 +0100
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10j.europe.bmw.corp
	(160.48.96.46) with Microsoft SMTP Server (TLS;
	Tue, 4 Feb 2020 10:21:26 +0100
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1473.005;
	Tue, 4 Feb 2020 10:21:26 +0100
IronPort-SDR: b/YTsTZva8zoUAMbk8dHmJEBzskTT9BUJlG8CAc0bg1vZotDc2X7eZofxnjn1qQo+n5VlOF1dH
	MOuv9mQ0UQhc2EvVdwQEMxJDmBhU8+YEs=
From: <Mikko.Rapeli@bmw.de>
To: <anuj.mittal@intel.com>
Thread-Topic: [OE-core] [PATCH v2] sqlite3: upgrade 3.30.1 -> 3.31.1
Thread-Index: AQHV2x97suqR6oGxeEO1uBR3N8iP6KgKse+A
Date: Tue, 4 Feb 2020 09:21:26 +0000
Message-ID: <20200204092125.GT104502@korppu>
References: <20200204054432.822155-4-anuj.mittal@intel.com>
	<20200204055145.998317-1-anuj.mittal@intel.com>
In-Reply-To: <20200204055145.998317-1-anuj.mittal@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] sqlite3: upgrade 3.30.1 -> 3.31.1
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
X-List-Received-Date: Tue, 04 Feb 2020 09:29:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <84E75585021657439AD579EC866243B2@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

Hi,

slightly off topic but I was checking CVEs for sqlite3 and noticed
this recipe uses the merged source tree format. This makes it very
hard to cherry-pick CVE and other patches from Debian, Ubuntu,
OpenSUSE etc.

Why use sqlite sources in "amalgamation" format?

https://sqlite.org/amalgamation.html

Cheers,

-Mikko=

