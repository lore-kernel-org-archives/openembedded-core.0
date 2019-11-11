Return-Path: <prvs=211bdf3dd=Mikko.Rapeli@bmw.de>
Received: from esa4.bmw.c3s2.iphmx.com (esa4.bmw.c3s2.iphmx.com
	[68.232.139.62])
	by mail.openembedded.org (Postfix) with ESMTP id 991947F938
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 08:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1573459700; x=1604995700;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=AMEpb0k94X/uZk8VEz8mWW/m8ZmmhFJH0pKLDd4r1qU=;
	b=pWcl+MJQo/4XgqKZ15nfT8adCXsnIm3+dqNYb2kLTzDm5wFEOLgD7fj4
	po19DtIVexJQlpw5RSpxRf87n9jNsddjkYyWr/sC4cNxOXzbbK2NdfaEf
	g6pBdB0HQIHNr0gartwHSvPCLpx29jPOFPBcwlQfmqFwNumyiSauS0EtR 4=;
IronPort-SDR: rpO69jhEqYhxGaEPu9TMIBW/P3Ly5u0qJVe9Y/HBgFT8+c97uBbdX9+PCr3xCv5TGyNY6d6O3j
	nTTXe9eU1O56WvrUDvzvWbajiiqxV8lB5lgPAi19Rfs2Etk9cbCtDBf8nCUowKXpGfaKo1gVEf
	7gCYlta5iMjAcFmSLvETHWBX1ovDgoEW/C6/+C2/9fMUs9+u+znF7dFgCY2Y71Lxsw08w2byw/
	Fhe6RA/erYtmLWy6jc5mN5T2H/uLJgj9Wh7xsD7P3k8rTfmqMmnGs3ZMzbrjRfCx5Lb6q45Z8Z
	Yig=
Received: from esagw3.bmwgroup.com (HELO esagw3.muc) ([160.46.252.35]) by
	esa4.bmw.c3s2.iphmx.com with ESMTP/TLS; 11 Nov 2019 09:08:18 +0100
Received: from esabb1.muc ([160.50.100.31])  by esagw3.muc with ESMTP/TLS;
	11 Nov 2019 09:08:17 +0100
Received: from smucm10l.bmwgroup.net (HELO smucm10l.europe.bmw.corp)
	([160.48.96.48])
	by esabb1.muc with ESMTP/TLS; 11 Nov 2019 09:08:17 +0100
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10l.europe.bmw.corp
	(160.48.96.48) with Microsoft SMTP Server (TLS;
	Mon, 11 Nov 2019 09:08:17 +0100
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1473.005;
	Mon, 11 Nov 2019 09:08:17 +0100
From: <Mikko.Rapeli@bmw.de>
To: <ryan.harkin@linaro.org>
Thread-Topic: maintaining sumo (was Re: [OE-core] [PATCH][thud] cve-check:
	backport rewrite from master)
Thread-Index: AQHVlUFJlw35RjLUSUubI3ndnQ+70qd/dJwAgAYedQA=
Date: Mon, 11 Nov 2019 08:08:16 +0000
Message-ID: <20191111080816.GY2398@hiutale>
References: <20190925122349.14872-1-ross.burton@intel.com>
	<CAD0U-hJLV7F3K4VdX0GUKO9LRazWLz1rvp1xmWh6fzgzP3gcFQ@mail.gmail.com>
	<20191106160618.GC2398@hiutale>
	<e3de40a47b9b208f08c3123ad59c8caf25d581d6.camel@linuxfoundation.org>
	<20191107075931.GD2398@hiutale>
	<CAD0U-hK2UWoMU9kih_EtRTVRFKFscXFYpQhbHV_aRgZ9m2+c4A@mail.gmail.com>
In-Reply-To: <CAD0U-hK2UWoMU9kih_EtRTVRFKFscXFYpQhbHV_aRgZ9m2+c4A@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: maintaining sumo (was Re: [PATCH][thud] cve-check: backport rewrite from master)
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
X-List-Received-Date: Mon, 11 Nov 2019 08:08:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E5DC1839D71DAE4EAB1EB5C9920F58DC@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Nov 07, 2019 at 10:41:42AM +0000, Ryan Harkin wrote:
<snip>
> Not sure if it helps, but I have a Jenkins job that tests sumo on a trigg=
er
> (there is one for Warrior also):
>=20
> https://ci.linaro.org/job/warp7-openembedded-sumo/
>=20
> eg. it was triggered when Armin's patch was merged yesterday.
>=20
> This builds Sumo, based on Linaro's OE-RPB distro for NXP WaRP7
> (imx7s-warp). It then runs the build in our LAVA lab (although the boards
> have gone down recently, they're normally up). Once the boards are up
> again, I'll add ptest to the job, to give it a more thorough workout. I'l=
l
> also add the sumo-next branch to the list of build configurations.

Could it make sense to also test sumo-next using this job? Also, I would no=
t mind
seeing test trigger and result emails on this list as long as access to log=
s and details
is open to everyone.

I checked the jenkins build job config and looks quite straight forward. Di=
d not see
the actual target testing logs though.

Cheers,

-Mikko=

