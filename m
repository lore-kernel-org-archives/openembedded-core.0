Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6C6C971BA0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Apr 2018 22:42:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id A2ADF185C3;
	Sat, 21 Apr 2018 00:42:25 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id GWmVyTmYMrsI; Sat, 21 Apr 2018 00:42:24 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id A0AE0185C2;
	Sat, 21 Apr 2018 00:42:24 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6185C1E08A;
	Sat, 21 Apr 2018 00:42:24 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 556781E07E;
	Sat, 21 Apr 2018 00:42:24 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Sat, 21 Apr 2018 00:42:24 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by thoth.se.axis.com (Postfix) with ESMTP id 48B921986;
	Sat, 21 Apr 2018 00:42:24 +0200 (CEST)
Received: from xbox11.axis.com (10.0.5.25) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Sat, 21 Apr 2018 00:42:24 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Sat, 21 Apr 2018 00:42:23 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1263.000; Sat, 21 Apr 2018 00:42:24 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] State of Sumo
Thread-Index: AQHT2PK3QGUlYhNSeUCXkqYzqXhxrKQKNVgA
Date: Fri, 20 Apr 2018 22:42:23 +0000
Message-ID: <d00e521ea4cf4fc3962a9e10e0bcc6c2@XBOX02.axis.com>
References: <CAJTo0LYPdtHXqbKR5nm_EVzQ07Pju476n3Tahxp_zf=STW=LRw@mail.gmail.com>
In-Reply-To: <CAJTo0LYPdtHXqbKR5nm_EVzQ07Pju476n3Tahxp_zf=STW=LRw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: State of Sumo
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
X-List-Received-Date: Fri, 20 Apr 2018 22:42:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Burton, Ross
> Sent: den 20 april 2018 23:58
> To: OE-core <openembedded-core@lists.openembedded.org>
> Cc: Marek Vasut <marex@denx.de>; Otavio Salvador
> <otavio@ossystems.com.br>
> Subject: [OE-core] State of Sumo
>=20
> Hi,
>=20
> We'll hopefully be firing the 2.5 RC build on Monday, so I did a build
> today to see where we stand. As is typical we got two new failures on
> the autobuilder...  My test build included the pseudo bump which
> caused an almost complete rebuild, which is a great way to shake out
> intermittent failures.
>=20
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D12704
> Go appears to be using the target CFLAGS when using the host compiler,
> with predictable failures when the host is old and doesn't support new
> flags.
>=20
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D12705
> u-boot build failure
>=20
> CC'ing the usual maintainers of those two recipes, if you get a moment
> to look at these then that would be much appreciated.
>=20
> I'll also say that if you have any outstanding patches that *need* to
> be in 2.5 and can't wait for 2.5.1 then say so now, or forever hold
> your peace (and submit them for master/backport to 2.5.1).

Not sure what the status is for patches for bitbake itself, but I have=20
one pending ("lib/bb/utils: prevent movefile from changing dest dir=20
permissions" sent to bitbake-devel on April 10), which I was hoping=20
would make it into Sumo. The effect when the bug strikes is pretty=20
weird, in our case it causes /etc to end up with mode 644 rather than=20
755 when building an SDK in a Docker container...

> Regards,
> Ross

//Peter


