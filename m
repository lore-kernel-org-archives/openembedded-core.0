Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RciaF-0004hy-VF
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 20:09:12 +0100
Received: by werm13 with SMTP id m13so1624275wer.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2011 11:02:09 -0800 (PST)
Received: by 10.216.138.143 with SMTP id a15mr5062244wej.11.1324321327588;
	Mon, 19 Dec 2011 11:02:07 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id cy8sm1750033wib.2.2011.12.19.11.02.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Dec 2011 11:02:06 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <3289178.cJ7bor4PPM@helios>
Date: Mon, 19 Dec 2011 20:02:02 +0100
Message-Id: <C0A5EF9A-CDED-41D7-B7D0-2FCB16771898@dominion.thruhere.net>
References: <cover.1324316137.git.paul.eggleton@linux.intel.com>
	<4077851.vBmcQh9dAf@helios>
	<756581D3-FAA6-48FC-9ECE-0B7CC1262A5D@dominion.thruhere.net>
	<3289178.cJ7bor4PPM@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1251.1)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] psplash fixes
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
X-List-Received-Date: Mon, 19 Dec 2011 19:09:12 -0000
X-Groupsio-MsgNum: 14490
Content-Type: multipart/signed;
	boundary="Apple-Mail=_BFE3F738-C152-405D-BD08-B2FB7AB7A68A";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_BFE3F738-C152-405D-BD08-B2FB7AB7A68A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 19 dec. 2011, om 19:57 heeft Paul Eggleton het volgende geschreven:

> On Monday 19 December 2011 19:48:48 Koen Kooi wrote:
>> I will say again: I absolutely HATE that virtual-runtime nonsense. If =
you
>> need to change a task, change the task, don't introduce things that =
make it
>> non deterministic. Guess what happens when you change a =
virtual-runtime
>> *after* you have built the task already.
>=20
> This is the problem I'm trying to avoid. Perhaps it wasn't clear, but =
what I=20
> meant was change things so we do not bring in psplash via a task =
anymore -=20
> instead use the value of VIRTUAL-RUNTIME_splash within =
core-image.bbclass,=20
> controlled via an IMAGE_FEATURE.

In OE-classic we had IMAGE_SPLASH. Btw, I'm not using =
core-image.bbclase.

>>> Would update-alternatives be needed at all in
>>> that case?
>>=20
>> It would if you want to change it after booting :)
>=20
> What's the use case for changing the splash image after booting?

If you splash contains text its nice to be able to exchange it as easily =
as the rest of the system.


--Apple-Mail=_BFE3F738-C152-405D-BD08-B2FB7AB7A68A
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7vii0ACgkQMkyGM64RGpEvbgCfWn6dqluyGcjGDCqt4DJ7kOiO
3RQAn1KGVK+K8So7OFLSONYx2V3J+kAR
=NqCz
-----END PGP SIGNATURE-----

--Apple-Mail=_BFE3F738-C152-405D-BD08-B2FB7AB7A68A--
