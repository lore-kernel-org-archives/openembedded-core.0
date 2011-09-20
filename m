Received: from mx4.leapfrog.com ([63.114.26.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dlazzari@leapfrog.com>) id 1R68Pj-00054i-SL
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 00:03:40 +0200
Received: from mx4.leapfrog.com (localhost [127.0.0.1])
	by localhost.leapfrog.com (Postfix) with ESMTP id 0B2295EA3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2011 14:58:09 -0700 (PDT)
Received: from NAEXCHHT01.na.leapfrog.com (unknown [10.15.6.13])
	by mx4.leapfrog.com (Postfix) with ESMTP id E92505E5C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2011 14:58:08 -0700 (PDT)
Received: from NAEMCASHT01.na.leapfrog.com (10.16.4.161) by
	NAEXCHHT01.na.leapfrog.com (10.15.6.13) with Microsoft SMTP Server
	(TLS) id 8.2.254.0; Tue, 20 Sep 2011 14:58:08 -0700
Received: from NAEMMAIL01.na.leapfrog.com ([fe80::252e:28a6:3d8f:6991]) by
	NAEMCASHT01.na.leapfrog.com ([::1]) with mapi id 14.01.0289.001;
	Tue, 20 Sep 2011 14:58:08 -0700
From: Daniel Lazzari <dlazzari@leapfrog.com>
To: "'openembedded-core@lists.openembedded.org'"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Re: [OE-core] Correct way of having the PN package depend on
Thread-Index: Acx34GFLcx4IXVQbSVOeycYVPPOemw==
Date: Tue, 20 Sep 2011 21:58:07 +0000
Message-ID: <E7A9054A5ACABE48B0E540E46E862B0F011FED@NAEMMAIL01.na.leapfrog.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.100.2.5]
MIME-Version: 1.0
Subject: Re: Correct way of having the PN package depend on
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
X-List-Received-Date: Tue, 20 Sep 2011 22:03:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> Its defintely a bug in the recipe with the "alsa-utils" package just bein=
g broken. We need to do something like:
>=20
> ALSAUTILSPKGS =3D "alsa-utils-x \
>                  alsa-utils-y \
>                  alsa-utils-z"
>=20
> PACKAGES +=3D "${ALSAUTILSPKGS}"
> RDEPENDS_${PN} +=3D "${ALSAUTILSPKGS}"
>=20
> which should make the recipe do what it says it should do.
>=20
> Cheers,
>=20
> Richard

This is the info I needed, thanks! I'll try and draw up a patch for this.

Dan Lazzari Jr.
Firmware Engineer
dlazzari@leapfrog.com




