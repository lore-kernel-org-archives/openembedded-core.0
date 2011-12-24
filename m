Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1ReMrQ-0003e1-C0
	for openembedded-core@lists.openembedded.org;
	Sat, 24 Dec 2011 09:21:44 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 24 Dec 2011 00:14:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="105663037"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by fmsmga002.fm.intel.com with ESMTP; 24 Dec 2011 00:14:30 -0800
Received: from pgsmsx151.gar.corp.intel.com (172.30.236.41) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Sat, 24 Dec 2011 16:14:29 +0800
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
	PGSMSX151.gar.corp.intel.com (172.30.236.41) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Sat, 24 Dec 2011 16:14:29 +0800
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.199]) by
	SHSMSX151.ccr.corp.intel.com ([169.254.3.223]) with mapi id
	14.01.0355.002; Sat, 24 Dec 2011 16:14:28 +0800
From: "Wang, Shane" <shane.wang@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 12/14] ofono: upgrade to 1.0
Thread-Index: AQHMwZKf24SzqFoZskaV2YWIEYFqT5XqpNcA
Date: Sat, 24 Dec 2011 08:14:28 +0000
Message-ID: <3AB6CE7F274E534CAFD089D127A8A1FC0104EB@SHSMSX102.ccr.corp.intel.com>
References: <b3dad82177ad19a44f06edc4b857cb9697fa3950.1324657801.git.shane.wang@intel.com>
	<2b93d58b4e30b6327ddbe7b1d594399f64f2e926.1324657801.git.shane.wang@intel.com>
	<A0F06722-FDA7-4E36-B057-4F803F037EF4@dominion.thruhere.net>
In-Reply-To: <A0F06722-FDA7-4E36-B057-4F803F037EF4@dominion.thruhere.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [PATCH 12/14] ofono: upgrade to 1.0
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
X-List-Received-Date: Sat, 24 Dec 2011 08:21:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Koen Kooi wrote on=A02011-12-24:

>=20
> Op 23 dec. 2011, om 17:35 heeft Shane Wang het volgende geschreven:
>=20
>> Signed-off-by: Shane Wang <shane.wang@intel.com> ---
>> meta/recipes-connectivity/ofono/ofono.inc          |    2 +-
>> .../ofono/{ofono_0.50.bb =3D> ofono_1.0.bb}          |    6 +++--- 2
>> files changed, 4 insertions(+), 4 deletions(-) rename
>> meta/recipes-connectivity/ofono/{ofono_0.50.bb =3D> ofono_1.0.bb} (63%)
>>=20
>> diff --git a/meta/recipes-connectivity/ofono/ofono.inc
>> b/meta/recipes-connectivity/ofono/ofono.inc index 0cc58ae..bf6f6a5
>> 100644 --- a/meta/recipes-connectivity/ofono/ofono.inc +++
>> b/meta/recipes-connectivity/ofono/ofono.inc @@ -3,7 +3,7 @@ SUMMARY  =3D
>> "open source telephony" DESCRIPTION =3D "oFono is a stack for mobile
>> telephony devices on Linux.
> oFono supports speaking to telephony devices through specific drivers, or
> with generic AT commands."
>> LICENSE  =3D "GPLv2" LIC_FILES_CHKSUM =3D
>> "file://COPYING;md5=3Deb723b61539feef013de476e68b5c50a \ -
> file://src/ofono.h;beginline=3D1;endline=3D20;md5=3D85d349dd8ec342c8f40d9=
0e5
> 20f22779"
>> +
> file://src/ofono.h;beginline=3D1;endline=3D20;md5=3D3ce17d5978ef3445def26=
5b9
> 8899c2ee"
>=20
> what changed?

Trivial, only version:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
5c5
<  *  Copyright (C) 2008-2010  Intel Corporation. All rights reserved.
---
>  *  Copyright (C) 2008-2011  Intel Corporation. All rights reserved.
37c37,38
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D


