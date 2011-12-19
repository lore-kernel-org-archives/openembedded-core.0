Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RcZkO-0001KB-Pk
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 10:43:06 +0100
Received: by wgbds11 with SMTP id ds11so8674300wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2011 01:35:59 -0800 (PST)
Received: by 10.227.207.133 with SMTP id fy5mr11232041wbb.23.1324287359321;
	Mon, 19 Dec 2011 01:35:59 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id eg7sm24981912wib.8.2011.12.19.01.35.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Dec 2011 01:35:58 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1865303E0DED764181A9D882DEF65FB6EA8B6E113E@shsmsx502.ccr.corp.intel.com>
Date: Mon, 19 Dec 2011 10:35:51 +0100
Message-Id: <A35AA859-7150-4E0C-AEF0-A3B2FD044796@dominion.thruhere.net>
References: <cover.1324272052.git.dexuan.cui@intel.com>
	<5f5f0083a3fa9afa2081b1cca3dfda03b0fb7f76.1324272052.git.dexuan.cui@intel.com>
	<9D240952-C22F-4CC9-8BF8-CFBA5D21F372@dominion.thruhere.net>
	<1865303E0DED764181A9D882DEF65FB6EA8B6E113E@shsmsx502.ccr.corp.intel.com>
To: "Cui, Dexuan" <dexuan.cui@intel.com>
X-Mailer: Apple Mail (2.1251.1)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] socat: add the latest stable version 1.7.2.0
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
X-List-Received-Date: Mon, 19 Dec 2011 09:43:06 -0000
X-Groupsio-MsgNum: 14441
Content-Type: multipart/signed;
	boundary="Apple-Mail=_8A91EC0C-52FB-4A5E-8A31-C506B9ACD966";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_8A91EC0C-52FB-4A5E-8A31-C506B9ACD966
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 19 dec. 2011, om 10:16 heeft Cui, Dexuan het volgende geschreven:

> Koen Kooi wrote on 2011-12-19:
>>=20
>> Op 19 dec. 2011, om 06:22 heeft Dexuan Cui het volgende geschreven:
>>=20
>>> +DEPENDS =3D "openssl"
>>> +
>>> +LICENSE =3D "GPLv2+"
> Hi Koen,
> Thanks very much for the comment!=20
>=20
>> Linking GPL and openssl is not allowed due to the advertising clause=20=

>> in BSD. The socat people realized that and say:
> "the advertising clause in BSD"?=20
> I suppose you meant "the advertising clause in openssl license"?

Yes, indeed

>=20
>> license
>> -------
>>=20
>> socat is distributed under the terms of the GNU GPL; except for=20
>> install-sh, which is copyright MIT, with its own license;
>>=20
>> In addition, as a special exception, the copyright holder gives=20
>> permission to link the code of this program with any version of the=20=

>> OpenSSL library which is distributed under a license identical to =
that=20
>> listed in the included COPYING.OpenSSL file, and distribute linked=20
>> combinations including the two. You must obey the GNU General Public=20=

>> License in all respects for all of the code used other than OpenSSL.
>> If you modify this file, you may extend this exception to your =
version=20
>> of the file, but you are not obligated to do so. If you do not wish =
to do
>> so, delete this exception statement from your version.
> My understanding is: the author of socat allows us to link socat to =
the lib
> openssl?

Correct. I don't know what happens when you include socat in a GPL =
product, but that's for other people to worry about :)

> Koen,=20
> I'm really not good at the license stuff at all. Could you please =
explain
> the situation in more details?

=46rom what I've understood the advertising clause is consired a =
"restriction" by the GPL and hence incompatible. Since openssl is so =
widespread and gnutls so buggy the exception was invented to allow =
openssl to link with gpl software.

> What need we do if we want to add the socat recipe into poky? It has
> already been in OE for a long period of time.

Some googling suggests that 'GPL-2.0+-with-OpenSSL-exception' is SPDX =
compatible, so we could put that in LICENSE.

regards,

Koen=

--Apple-Mail=_8A91EC0C-52FB-4A5E-8A31-C506B9ACD966
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7vBXsACgkQMkyGM64RGpHBMACguP/9TGGfOT3TsU52zxUjSM4T
G3IAnRFeKmvqJQ9vubbnrRC2fJj7ntAo
=A56z
-----END PGP SIGNATURE-----

--Apple-Mail=_8A91EC0C-52FB-4A5E-8A31-C506B9ACD966--
