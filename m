Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QbeA7-0007cr-Ev
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 21:41:31 +0200
Received: by wyg30 with SMTP id 30so443507wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 12:37:50 -0700 (PDT)
Received: by 10.227.36.212 with SMTP id u20mr6998857wbd.35.1309289869898;
	Tue, 28 Jun 2011 12:37:49 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id ge4sm381627wbb.64.2011.06.28.12.37.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Jun 2011 12:37:48 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1309269641.20015.296.camel@rex>
Date: Tue, 28 Jun 2011 21:37:46 +0200
Message-Id: <BC99E6F2-47C9-4331-BF2C-2ACFF5878787@dominion.thruhere.net>
References: <cover.1309163663.git.dongxiao.xu@intel.com>
	<cdd1860f64f84b58d18d1c6bed1805456d8d3e2e.1309163663.git.dongxiao.xu@intel.com>
	<1309165102.21613.234.camel@phil-desktop>
	<D5AB6E638E5A3E4B8F4406B113A5A19A12D6ADBBD3@shsmsx501.ccr.corp.intel.com>
	<1309252054.21613.329.camel@phil-desktop>
	<1309259242.20015.237.camel@rex>
	<15DA3F00-905F-4370-85D5-5038CD5D9ED2@dominion.thruhere.net>
	<1309269641.20015.296.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 1/1] libc-locale: split locale handling from libc recipe.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Jun 2011 19:41:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 28 jun 2011, om 16:00 heeft Richard Purdie het volgende geschreven:

> On Tue, 2011-06-28 at 14:17 +0200, Koen Kooi wrote:
>> Op 28 jun 2011, om 13:07 heeft Richard Purdie het volgende =
geschreven:
>>> On Tue, 2011-06-28 at 10:07 +0100, Phil Blundell wrote:
>=20
>>>=20
>>> Dongxiao: What Phil is referring to here is that =
libsotruss${PKGSUFFIX}
>>> disappeared from PACKAGES and that also "${libdir}/audit/.debug"
>>> disappeared from FILES_${PN}-dbg.
>>>=20
>>> Specifically these changes came in as part of:
>>>=20
>>> =
http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=3D77c2dd944db42e40cc8=
467e6bc5a175fed90c251
>>>=20
>>> which I don't think your patch accounted for.
>>>=20
>>> Since this patch has been around for a while and it otherwise looks
>>> good, I've fixed up these couple of issues and merged it though.
>>=20
>> This breaks when using eglibc 2.12 :(
>=20
> Sorry, I've pushed some cleanup to resolve that.

So after my shlib renaming patch I still can't build any image, since =
locale-base-* has disappeared. Is there anything related to libc and =
libc-locales this patch *didn't* break?=


