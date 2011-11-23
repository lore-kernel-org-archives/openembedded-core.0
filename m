Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RTFLH-0006Ng-D7
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 17:06:35 +0100
Received: by ggnh4 with SMTP id h4so1593660ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2011 08:00:03 -0800 (PST)
Received: by 10.152.144.73 with SMTP id sk9mr14880113lab.34.1322064002308;
	Wed, 23 Nov 2011 08:00:02 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235]) by mx.google.com with ESMTPS id
	xx14sm16292033lab.17.2011.11.23.08.00.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Nov 2011 08:00:01 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Wed, 23 Nov 2011 16:59:56 +0100
In-Reply-To: <cover.1322061836.git.paul.eggleton@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1322061836.git.paul.eggleton@linux.intel.com>
Message-Id: <E459AF7A-6F7C-43F7-85C8-784419C4E6FE@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 0/3] Make pulseaudio a DISTRO_FEATURE
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
X-List-Received-Date: Wed, 23 Nov 2011 16:06:35 -0000
X-Groupsio-MsgNum: 12819
Content-Type: multipart/signed;
	boundary="Apple-Mail=_A13DFB27-1CB3-447C-B31B-7FE410D64E22";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_A13DFB27-1CB3-447C-B31B-7FE410D64E22
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 23 nov. 2011, om 16:32 heeft Paul Eggleton het volgende geschreven:

> The initial driver behind this series was a failure on our =
autobuilder,
> which resulted from qt4-x11-free detecting pulseaudio at configure =
time
> but then since it wasn't listed in DEPENDS, when it came to compile =
time
> pulseaudio happened to be unavailable and the build failed. Since
> pulseaudio becomes a hard runtime dependency of phonon when it is =
enabled,

The phonon backends (e.g. gstreamer) are nicely modularized is the =
pulseaudio case different?=20

> and it is an optional build-time dependency more than one recipe it =
makes
> sense to make it a DISTRO_FEATURE.
>=20
> Note that should this patchset be accepted, distro maintainers will =
need
> to add pulseaudio to their DISTRO_FEATURES to retain the current =
behaviour.

We discussed this in yesterdays TSC meeting and I hope I paraphrase the =
consenses correctly: we want to use PACKAGECONFIG to do the heavy =
lifting (DEPENDS, EXTRA_OECONF) and have DISTRO_FEATURES do the =
triggering.=20
RP pointed out that having DISTRO_FEATURES trigger PACKAGECONFIG =
currently leads to a convoluted syntax which we need to address.

We also agreed that the current behaviour should be retained, so needing =
to add pulse to distro features would go against that. Having said that, =
I personally would dislike having negative ('nopulseaudio') entries to =
address that. Feedback needed :)

regards,

Koen=

--Apple-Mail=_A13DFB27-1CB3-447C-B31B-7FE410D64E22
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7NGH4ACgkQMkyGM64RGpGQhwCgr/mcAbZXbYNWG9ZsRWE1QfDn
Z5EAnA8HoSb3M+moHMck0xVSLvDDDk0W
=Iqh1
-----END PGP SIGNATURE-----

--Apple-Mail=_A13DFB27-1CB3-447C-B31B-7FE410D64E22--
