Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RO4YK-0002M3-K8
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 10:34:40 +0100
Received: by wyh5 with SMTP id 5so1496475wyh.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Nov 2011 01:28:22 -0800 (PST)
Received: by 10.227.57.147 with SMTP id c19mr1177271wbh.8.1320830902502;
	Wed, 09 Nov 2011 01:28:22 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id gd6sm4970509wbb.1.2011.11.09.01.28.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Nov 2011 01:28:21 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Wed, 9 Nov 2011 10:28:21 +0100
In-Reply-To: <4EB9DF31.7070904@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4EB9DF31.7070904@intel.com>
Message-Id: <19F0FAB3-A37C-4CB4-8A3D-771878983898@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: openssl 1.0?
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
X-List-Received-Date: Wed, 09 Nov 2011 09:34:40 -0000
X-Groupsio-MsgNum: 12191
Content-Type: multipart/signed;
	boundary="Apple-Mail=_86C8142B-4B2E-4FEC-BCB5-08CF9290763A";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_86C8142B-4B2E-4FEC-BCB5-08CF9290763A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 9 nov. 2011, om 03:02 heeft Scott Garman het volgende geschreven:

> Hello,
>=20
> I wanted to get some feedback from the community about OpenSSL 1.0. We =
currently only support 0.9.8 in oe-core. Specifically: should we add =
openssl 1.0 to oe-core, and should the rest of our recipes build against =
it by default?

The openssl in meta-oe is working fine, just keep in mind that the =
SOVERSION changed, so you need a PR bump for everything that links =
against openssl when switching.

regards,

Koen=

--Apple-Mail=_86C8142B-4B2E-4FEC-BCB5-08CF9290763A
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk66R7UACgkQMkyGM64RGpEn3wCZAT2ij9q5VcFkcu5QiKZFMwW/
5K0AoLn4ow2UNOGLZS+4mUzTaaLfHdTy
=uq7c
-----END PGP SIGNATURE-----

--Apple-Mail=_86C8142B-4B2E-4FEC-BCB5-08CF9290763A--
