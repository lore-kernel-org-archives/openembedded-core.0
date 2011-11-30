Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RVsGj-0008Nj-W0
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 23:04:46 +0100
Received: by eaad13 with SMTP id d13so1319961eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 13:58:04 -0800 (PST)
Received: by 10.213.22.6 with SMTP id l6mr699390ebb.138.1322690284726;
	Wed, 30 Nov 2011 13:58:04 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id z58sm10672235eea.3.2011.11.30.13.58.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Nov 2011 13:58:04 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <d66f152cffd363fe56c6f58e9559288020524d83.1322689519.git.darren@dvhart.com>
Date: Wed, 30 Nov 2011 22:57:58 +0100
Message-Id: <9AF2AA1C-18ED-477E-86BF-E31899BDE666@dominion.thruhere.net>
References: <e7ca852c4e673a6b32be203109a704202aeace3a.1322689519.git.darren@dvhart.com>
	<d66f152cffd363fe56c6f58e9559288020524d83.1322689519.git.darren@dvhart.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: Re: [PATCH 3/4] grub: Use COMPATIBLE_MACHINE
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
X-List-Received-Date: Wed, 30 Nov 2011 22:04:46 -0000
X-Groupsio-MsgNum: 13331
Content-Type: multipart/signed;
	boundary="Apple-Mail=_54A042E7-4DEF-487A-B61F-61BBD6760BEF";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_54A042E7-4DEF-487A-B61F-61BBD6760BEF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 30 nov. 2011, om 22:49 heeft Darren Hart het volgende geschreven:

> From: Darren Hart <dvhart@linux.intel.com>
>=20
> Drop the anonymous python block in favor of the much simpler
> COMPATIBLE_MACHINE mechanism.

minor nit: when I read the subject my first thought was "please use =
COMPATIBLE_HOST instead", but the actual patch is doing the right thing. =
Could you please amend the commit summary to has HOST instead of =
MACHINE?

regards,

Koen=

--Apple-Mail=_54A042E7-4DEF-487A-B61F-61BBD6760BEF
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7WpukACgkQMkyGM64RGpHL+wCdETjDn7rXMj8jkfWojGy6n3hl
crAAmwZANyoPgTmJYwv0LXkpUKHtvxSI
=t9lT
-----END PGP SIGNATURE-----

--Apple-Mail=_54A042E7-4DEF-487A-B61F-61BBD6760BEF--
