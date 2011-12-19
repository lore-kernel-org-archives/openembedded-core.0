Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Rci2Q-0003Ki-AS
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 19:34:14 +0100
Received: by werm13 with SMTP id m13so1598051wer.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2011 10:27:11 -0800 (PST)
Received: by 10.216.139.153 with SMTP id c25mr5011294wej.25.1324319230939;
	Mon, 19 Dec 2011 10:27:10 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id m13sm26693927wbh.0.2011.12.19.10.27.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Dec 2011 10:27:10 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1817157.LPoMfdErnK@helios>
Date: Mon, 19 Dec 2011 19:27:06 +0100
Message-Id: <7B929D63-E14F-44F8-81B2-49AA90181BA0@dominion.thruhere.net>
References: <cover.1324316137.git.paul.eggleton@linux.intel.com>
	<D88949C2-F8C7-4CAF-B74C-32AE43119D20@dominion.thruhere.net>
	<1817157.LPoMfdErnK@helios>
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
X-List-Received-Date: Mon, 19 Dec 2011 18:34:14 -0000
X-Groupsio-MsgNum: 14485
Content-Type: multipart/signed;
	boundary="Apple-Mail=_2AA3CCC4-152C-48DF-A654-EF757525DE26";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_2AA3CCC4-152C-48DF-A654-EF757525DE26
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 19 dec. 2011, om 19:22 heeft Paul Eggleton het volgende geschreven:

> On Monday 19 December 2011 18:50:35 Koen Kooi wrote:
>> Op 19 dec. 2011, om 18:43 heeft Paul Eggleton het volgende =
geschreven:
>>> Set the default psplash image to the OpenEmbedded logo, and provide =
a
>>> script to allow people to use their own custom image.
>>=20
>> What I did in OE-classic and meta-angstrom is to use =
update-alternatives to
>> provide different psplash images. This way you can choose a different
>> splash for each image instead of having a distro wide one. Is =
something
>> like that suitable for oe-core as well?
>=20
> Sounds like a useful capability, however, does this mean that when you =
want to=20
> override it in the image you end up with both psplash versions =
installed?

in a splashless image you can just do 'IMAGE_INSTALL +=3D =
psplash-angstrom and it will only install that one. If you want to reuse =
an existing, unmodified  image with psplash and add your own, then you =
will end up with both.

regards,

Koen=

--Apple-Mail=_2AA3CCC4-152C-48DF-A654-EF757525DE26
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7vgfwACgkQMkyGM64RGpEU7ACfUs5pNs1cIA7Ds67/pxOnzKxG
VtUAoJ63DJXMtApUUOdIPSBijClDXD8a
=ZZKg
-----END PGP SIGNATURE-----

--Apple-Mail=_2AA3CCC4-152C-48DF-A654-EF757525DE26--
