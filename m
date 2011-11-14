Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RPwp9-0004YE-JL
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Nov 2011 14:43:47 +0100
Received: by wyg8 with SMTP id 8so1429682wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2011 05:37:23 -0800 (PST)
Received: by 10.180.103.170 with SMTP id fx10mr25174351wib.56.1321277842858;
	Mon, 14 Nov 2011 05:37:22 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fo3sm12289025wib.21.2011.11.14.05.37.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 Nov 2011 05:37:21 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Mon, 14 Nov 2011 14:37:17 +0100
In-Reply-To: <1321275166.29435.21.camel@phil-desktop>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1321274982.26881.55.camel@ted>
	<1321275166.29435.21.camel@phil-desktop>
Message-Id: <8AFC2447-9963-4DF0-80E2-198516B3A813@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH] base-passwd: Fix the broken preinst/postinstall
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
X-List-Received-Date: Mon, 14 Nov 2011 13:43:47 -0000
X-Groupsio-MsgNum: 12438
Content-Type: multipart/signed;
	boundary="Apple-Mail=_C2BC9EE2-FF6E-49A2-AC9A-A58B847BAEF3";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_C2BC9EE2-FF6E-49A2-AC9A-A58B847BAEF3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 14 nov. 2011, om 13:52 heeft Phil Blundell het volgende geschreven:

> On Mon, 2011-11-14 at 12:49 +0000, Richard Purdie wrote:
>> The preinst accesses file which may not yet have been unpacked.
>> The postinst is too late for the creation of these files
>> for at least the opkg backend.
>>=20
>> This patch therefore encodes the file contents into the preinst,
>> resolving the various issues once and for all.
>>=20
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> If you're going to do that (which does look reasonable) then you might
> as well stop the package from shipping passwd.master and group.master =
at
> all.  I don't think anything else uses those files so they're just
> wasting space at the moment.

IIRC 'update-passwd' will use those. That's not a criticism on Phils =
suggestion, I like it very much.

regards,

Koen=

--Apple-Mail=_C2BC9EE2-FF6E-49A2-AC9A-A58B847BAEF3
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7BGY8ACgkQMkyGM64RGpEI2QCgkaPyf3CCgxrUv15sQNVbTAWI
5vQAoJZ6YiT7RrmJQRVMUcCMXn2fglBg
=t1mO
-----END PGP SIGNATURE-----

--Apple-Mail=_C2BC9EE2-FF6E-49A2-AC9A-A58B847BAEF3--
