Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RciNP-00041A-Jq
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 19:55:55 +0100
Received: by wgbdt12 with SMTP id dt12so8890236wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2011 10:48:53 -0800 (PST)
Received: by 10.180.83.69 with SMTP id o5mr1303806wiy.1.1324320532957;
	Mon, 19 Dec 2011 10:48:52 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id n9sm26718459wbo.16.2011.12.19.10.48.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Dec 2011 10:48:52 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4077851.vBmcQh9dAf@helios>
Date: Mon, 19 Dec 2011 19:48:48 +0100
Message-Id: <756581D3-FAA6-48FC-9ECE-0B7CC1262A5D@dominion.thruhere.net>
References: <cover.1324316137.git.paul.eggleton@linux.intel.com>
	<1817157.LPoMfdErnK@helios>
	<7B929D63-E14F-44F8-81B2-49AA90181BA0@dominion.thruhere.net>
	<4077851.vBmcQh9dAf@helios>
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
X-List-Received-Date: Mon, 19 Dec 2011 18:55:55 -0000
X-Groupsio-MsgNum: 14487
Content-Type: multipart/signed;
	boundary="Apple-Mail=_315A5776-4E2F-42B5-BAA6-8DD223359B8E";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_315A5776-4E2F-42B5-BAA6-8DD223359B8E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 19 dec. 2011, om 19:32 heeft Paul Eggleton het volgende geschreven:

> On Monday 19 December 2011 19:27:06 Koen Kooi wrote:
>> Op 19 dec. 2011, om 19:22 heeft Paul Eggleton het volgende =
geschreven:
>>> On Monday 19 December 2011 18:50:35 Koen Kooi wrote:
>>>> Op 19 dec. 2011, om 18:43 heeft Paul Eggleton het volgende =
geschreven:
>>>>> Set the default psplash image to the OpenEmbedded logo, and =
provide
>>>>> a
>>>>> script to allow people to use their own custom image.
>>>>=20
>>>> What I did in OE-classic and meta-angstrom is to use
>>>> update-alternatives to provide different psplash images. This way =
you
>>>> can choose a different splash for each image instead of having a
>>>> distro wide one. Is something like that suitable for oe-core as =
well?
>>>=20
>>> Sounds like a useful capability, however, does this mean that when =
you
>>> want to override it in the image you end up with both psplash =
versions
>>> installed?
>> in a splashless image you can just do 'IMAGE_INSTALL +=3D =
psplash-angstrom and
>> it will only install that one. If you want to reuse an existing, =
unmodified
>> image with psplash and add your own, then you will end up with both.
>=20
> Although I guess another way to do it would be to do a VIRTUAL-RUNTIME =
type=20
> thing like we do for other such selections. At the moment in OE-core, =
psplash=20
> is brought in via task-core-console, and whilst it is a separate =
variable that=20
> could be overridden it's a task which once built really makes it =
impossible to=20
> customise per-image.
>=20
> What about a "splash" IMAGE_FEATURE and then a VIRTUAL-RUNTIME_splash =
to=20
> select which psplash to install?

I will say again: I absolutely HATE that virtual-runtime nonsense. If =
you need to change a task, change the task, don't introduce things that =
make it non deterministic. Guess what happens when you change a =
virtual-runtime *after* you have built the task already.

> Would update-alternatives be needed at all in=20
> that case?

It would if you want to change it after booting :)=

--Apple-Mail=_315A5776-4E2F-42B5-BAA6-8DD223359B8E
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7vhxIACgkQMkyGM64RGpF+XACeNGbONpfkt0n5u5TRqTArNIBn
9rYAn1ZM3ZuDE09D6WakxJ2IdrDLvfbe
=syFJ
-----END PGP SIGNATURE-----

--Apple-Mail=_315A5776-4E2F-42B5-BAA6-8DD223359B8E--
