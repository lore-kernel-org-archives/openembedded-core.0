Return-Path: <prvs=22116a6d0=Mikko.Rapeli@bmw.de>
Received: from esa10.bmw.c3s2.iphmx.com (esa10.bmw.c3s2.iphmx.com
	[68.232.139.98])
	by mail.openembedded.org (Postfix) with ESMTP id E2A107D6A8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 08:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1574323299; x=1605859299;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=C5P2j8fLH06+ATiHk8PR2OeLNsYW5vqPHWDBjo3wwpw=;
	b=AKPvJBN4Ix68CKe1uJ5q4gfT9sqb7V6YJ0/XuW8egly5OirYlEJL+aEH
	DQsmZ3N+wLY4aOcGFWDgRWudLTCOr0N/J2KuItA7Mmp+yL2iN66NaP9oi
	LSOy/YAxyZhVaQyzrlPmPiviJ+8DY7SPoPRY133GGcuNb968jxPvVBN/2 c=;
IronPort-SDR: DCTx2ocajRWGGO9n203Pz+BlRtsBXRT2dP9q/BkiN4xlLKBRNk02X509RpY+BLwaFSEh6I8e4r
	3oI58QPa+p+jJ8WfP7OKO2puhdsEGP7PHyc/acBN2bIR+VP040C0M3k/mz0WgRWwdJZ13Runfr
	6l20hPy0LccJOTUXzJyXAFpIsqljOw8ZO61k6nYOvPEgEJ1xswbJ0vpPKLYVLpuql55qMAbgws
	zAe4ClHDFwaGyBnbVhlo0FUFlAdrkuqGFt4mOGZRRiCGdRLlDToXH33cWJo3dt2ceAfa3khH6K
	7Vw=
Received: from esagw2.bmwgroup.com (HELO esagw2.muc) ([160.46.252.38]) by
	esa10.bmw.c3s2.iphmx.com with ESMTP/TLS; 21 Nov 2019 09:01:37 +0100
Received: from esabb3.muc ([160.50.100.30])  by esagw2.muc with ESMTP/TLS;
	21 Nov 2019 09:01:36 +0100
Received: from smucm10l.bmwgroup.net (HELO smucm10l.europe.bmw.corp)
	([160.48.96.48])
	by esabb3.muc with ESMTP/TLS; 21 Nov 2019 09:01:35 +0100
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10l.europe.bmw.corp
	(160.48.96.48) with Microsoft SMTP Server (TLS;
	Thu, 21 Nov 2019 09:01:35 +0100
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1473.005;
	Thu, 21 Nov 2019 09:01:35 +0100
From: <Mikko.Rapeli@bmw.de>
To: <bunk@stusta.de>
Thread-Topic: [OE-core] How to backport openssl to Sumo
Thread-Index: AQHVn87w8ZAVFbXnIEGLd+JWxeWsfaeUhbKAgAAYDICAAJWngA==
Date: Thu, 21 Nov 2019 08:01:35 +0000
Message-ID: <20191121080133.GB3527@hiutale>
References: <CAD0U-hKudOEYkkPQQ1He3=Cg1hLqT7u5Uhsn_e2ZK0vGmo+z3w@mail.gmail.com>
	<20191120213951.GA3527@hiutale> <20191120230555.GA3962@localhost>
In-Reply-To: <20191120230555.GA3962@localhost>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: How to backport openssl to Sumo
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
X-List-Received-Date: Thu, 21 Nov 2019 08:01:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <61766B9D98F79541B6E1C9611D82E4B9@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 21, 2019 at 01:05:55AM +0200, Adrian Bunk wrote:
> On Wed, Nov 20, 2019 at 09:39:51PM +0000, Mikko.Rapeli@bmw.de wrote:
> >...
> > I could submit these too if someone wants to setup a communit maintenan=
ce branch for sumo.
>=20
> I would not consider this appropriate for a stable branch. With such=20
> invasive changes it would no longer be reasonably safe for users to=20
> follow the branch to receive security updates for other recipes.
>=20
> In Ubuntu 18.04 security support for OpenSSL 1.0.2 is provided until at=20
> least April 2023. Similar schedules exist for other LTS distributions.
> This provides sources for piggy-backing security support for a few years
> after upstream support ends.

Yes, I agree to this. The reasons for the large intrusive backport are:

 * openssl version 1.1.0 in sumo is no longer supported by upstream
   developers, see https://www.openssl.org/policies/releasestrat.html
   "Version 1.1.0 will be supported until 2019-09-11." but 1.1.1
   is an LTS with support unit 2023-09-11

 * many recipes like openssh in sumo do not support openssl 1.1.x and an
   update is needed to cover the API breakage. The backported pathes
   fixes most of the issues in poky and meta-openembedded and I've been
   able to use the set in multiple projects with different BSP stacks.

So in sumo, openssl 1.0.2 could still be maintainable with Ubuntu etc
help even when upstream openssl.org support has now ended. Same could
apply to openssl 1.1.0 there, but if one suffers and fixes the API
changes, then it is maybe better for users to jump directly to the next
openssl 1.1.1x LTS version. The patches I mentioned achieve this,
but I agree they are intrucive and not following stable policies.

In my case, openssl 1.1.x transition is one of the major blockers
for doing more yocto updates and running closer to master. The backport
has helped there and a following jump to zeus was really straight
forward (ignoring lots of issues in BSP layers but that's life).

Then a note on openssl 1.1.x impact to various BSP layers, some scripting a=
nd
bbclasses related to signing etc may need to be updated but also
those changes are simple. I wish there was more open source community
approach so share changes like these among users of various BSPs.

Cheers,

-Mikko=

