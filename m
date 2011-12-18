Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RcNED-0001gz-KN
	for openembedded-core@lists.openembedded.org;
	Sun, 18 Dec 2011 21:21:01 +0100
Received: by wgbds11 with SMTP id ds11so8031633wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Dec 2011 12:13:53 -0800 (PST)
Received: by 10.227.204.9 with SMTP id fk9mr10302882wbb.5.1324239233471;
	Sun, 18 Dec 2011 12:13:53 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235]) by mx.google.com with ESMTPS id
	ca18sm22726046wib.13.2011.12.18.12.13.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 18 Dec 2011 12:13:52 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Sun, 18 Dec 2011 21:13:49 +0100
In-Reply-To: <1324237652-15618-1-git-send-email-dbaryshkov@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1324237652-15618-1-git-send-email-dbaryshkov@gmail.com>
Message-Id: <5C0105D4-44BE-4584-9ED9-36970B91A34C@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 1/5] kernel.bbclass: move uImage handling to separate task
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
X-List-Received-Date: Sun, 18 Dec 2011 20:21:01 -0000
X-Groupsio-MsgNum: 14408
Content-Type: multipart/signed;
	boundary="Apple-Mail=_A1B6B3B5-C702-4A93-9BA3-F6B6F47FAF85";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_A1B6B3B5-C702-4A93-9BA3-F6B6F47FAF85
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 18 dec. 2011, om 20:47 heeft Dmitry Eremin-Solenikov het volgende =
geschreven:

> As per org.oe.dev and meta-oe's kernel.bbclass move uImage creation to
> separate task from do_deploy. This way the do_install task can also
> benefit from generated uImage.
>=20
> The only major feature of oe-core's version (not to recreate uImage
> if it exists) is retained in this patch.

I still don't agree with that behaviour. The in-kernel uImage code is =
just like the in-kernel defconfigs: useless for people who aren't kernel =
developers.

> On the contra, as this version
> was merged from meta-oe/org.oe.dev, new function has another feature:
> it permits overriding the u-boot entrypoint via u-boot symbol.

No it doesn't, since it doesn't recreate uImage.=

--Apple-Mail=_A1B6B3B5-C702-4A93-9BA3-F6B6F47FAF85
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7uSX8ACgkQMkyGM64RGpGCLwCgtXQaYv3fu3891FMVs9AK8hK7
z8QAniVSDXosv3RBKp0GYUnqfCXck2bD
=UYJG
-----END PGP SIGNATURE-----

--Apple-Mail=_A1B6B3B5-C702-4A93-9BA3-F6B6F47FAF85--
