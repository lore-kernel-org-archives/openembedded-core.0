Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RXpOy-0007rv-04
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Dec 2011 08:25:20 +0100
Received: by eaac1 with SMTP id c1so1269286eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Dec 2011 23:18:33 -0800 (PST)
Received: by 10.213.22.133 with SMTP id n5mr677874ebb.128.1323155912798;
	Mon, 05 Dec 2011 23:18:32 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id d6sm67871838eec.10.2011.12.05.23.18.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 05 Dec 2011 23:18:31 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Tue, 6 Dec 2011 08:18:30 +0100
In-Reply-To: <4EDD7A54.5070707@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1322853315.git.josh@linux.intel.com>
	<1323125404.25960.107.camel@ted> <4EDD4BD2.7010703@linux.intel.com>
	<4EDD7A54.5070707@linux.intel.com>
Message-Id: <D6858D6A-D1B0-40B2-AA2A-71F7AA5FD0FC@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 0/1] Make missing checksums an error
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
X-List-Received-Date: Tue, 06 Dec 2011 07:25:20 -0000
X-Groupsio-MsgNum: 13654
Content-Type: multipart/signed;
	boundary="Apple-Mail=_D8F06E7C-10B3-4197-BC87-3D848585DA87";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_D8F06E7C-10B3-4197-BC87-3D848585DA87
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 6 dec. 2011, om 03:13 heeft Joshua Lock het volgende geschreven:

>=20
>=20
> On 05/12/11 14:55, Joshua Lock wrote:
>> On 05/12/11 14:50, Richard Purdie wrote:
>>> On Fri, 2011-12-02 at 11:20 -0800, Joshua Lock wrote:
>>>> NOTE: this requires a patch I sent to the BitBake list[1] to error =
cleanly,
>>>> otherwise you'll see a Python backtrace and the build fail...
>>>>=20
>>>> Per some discussion on the list recently this patch sets =
BB_STRICT_CHECKSUM
>>>> in the default-distrovars.inc so that missing checksums in recipes =
raises an
>>>> error.
>>>>=20
>>>> Cheers,
>>>> Joshua
>>>=20
>>> What's the state of master? If I merge this, how badly do things
>>> explode?
>>=20
>> Let me run a universe fetchall and get back to you...
>=20
> Two recipes in oe-core require checksums adding, puzzles and
> omap3-sgx-modules - a v2 of this request with those patches is =
incoming.

Omap3-sgx-modules has no place in OE-core, so it should get deleted.

regards,

KOen=

--Apple-Mail=_D8F06E7C-10B3-4197-BC87-3D848585DA87
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7dwcgACgkQMkyGM64RGpEYzgCglIP23tQ9WGFdgS4R91w6lRm2
JnUAn0Dy8Nr39ixrUhm1jhk8SdTPdue8
=96sV
-----END PGP SIGNATURE-----

--Apple-Mail=_D8F06E7C-10B3-4197-BC87-3D848585DA87--
