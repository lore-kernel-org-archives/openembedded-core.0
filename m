Return-Path: <prvs=206df5e3c=Mikko.Rapeli@bmw.de>
Received: from esa8.bmw.c3s2.iphmx.com (esa8.bmw.c3s2.iphmx.com
	[68.232.139.97])
	by mail.openembedded.org (Postfix) with ESMTP id 556157F831
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2019 16:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1573056381; x=1604592381;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=c5JbIluh0c98Q/Cc2DtIR07WeDHuAj9hVpi/s9DJbK0=;
	b=U3j8ovS7fFF+N6NCin1htrHORV9WAUUjKx1vmpQHSVQFnGDiPcB9F+u9
	LehCwUFQiaBzv/vfudOuzOfusvp0dacxKAq48AlwyObjsbkPsR8/T9KCS
	yLpJG0CxZp2uxworChfCXM1y0iJmt5mXzYgJKlNNDst7t8qJle8gT2Id/ U=;
IronPort-SDR: ZiNrB+KmEAZmm84cQHZyuC0LJegz82dwbD+BVFzVvVbYPuMCwIHxd+909nNg/Khjw8TwLyZD1s
	IGwgmQN1HdxPvETA/WqKBFoPYD+rn2xPgNUJjV5PgLGDxrTddxepO3lmoOr1I1dFiEdIQiMwMy
	bs5n3Rc+vFzRY5pwE4bev0+v2u5y9QqpOUqSySGcYdH3yP4+h3FZ9C2q6koTVHEfjIDLn7JOP1
	CWYFK88qVbs6MAdYg4UTHjCHwbrlyEYSgN0tWZhSK4H5V3/akQHND5k32WguHTfNxKOU5VMmJ3
	8+U=
Received: from esagw4.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
	esa8.bmw.c3s2.iphmx.com with ESMTP/TLS; 06 Nov 2019 17:06:20 +0100
Received: from esabb4.muc ([160.50.100.33])  by esagw4.muc with ESMTP/TLS;
	06 Nov 2019 17:06:19 +0100
Received: from smucm10k.bmwgroup.net (HELO smucm10k.europe.bmw.corp)
	([160.48.96.47])
	by esabb4.muc with ESMTP/TLS; 06 Nov 2019 17:06:19 +0100
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10k.europe.bmw.corp
	(160.48.96.47) with Microsoft SMTP Server (TLS;
	Wed, 6 Nov 2019 17:06:19 +0100
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1473.005;
	Wed, 6 Nov 2019 17:06:18 +0100
From: <Mikko.Rapeli@bmw.de>
To: <ryan.harkin@linaro.org>
Thread-Topic: [OE-core] [PATCH][thud] cve-check: backport rewrite from master
Thread-Index: AQHVc5wy6IVfSeKDPUq0zjk0Q5TO5qd+bYgAgAASvIA=
Date: Wed, 6 Nov 2019 16:06:18 +0000
Message-ID: <20191106160618.GC2398@hiutale>
References: <20190925122349.14872-1-ross.burton@intel.com>
	<CAD0U-hJLV7F3K4VdX0GUKO9LRazWLz1rvp1xmWh6fzgzP3gcFQ@mail.gmail.com>
In-Reply-To: <CAD0U-hJLV7F3K4VdX0GUKO9LRazWLz1rvp1xmWh6fzgzP3gcFQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][thud] cve-check: backport rewrite from master
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
X-List-Received-Date: Wed, 06 Nov 2019 16:06:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B117A4F57395014C88CD512BDCCCF9ED@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Nov 06, 2019 at 02:59:16PM +0000, Ryan Harkin wrote:
> Hi Ross/Richard,
>=20
> I'd like this applied to Sumo also. Should I create a new patch and send =
it
> to the list, or is there a process for requesting this is cherry-picked
> across?

I just posted the port of this and all other CVE scan related changes to su=
mo
http://lists.openembedded.org/pipermail/openembedded-core/2019-November/288=
817.html

But the question is valid :)

-Mikko=

