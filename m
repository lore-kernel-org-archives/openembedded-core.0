Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RTtwr-0002o8-8N
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Nov 2011 12:28:05 +0100
Received: by faat2 with SMTP id t2so3429485faa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2011 03:21:28 -0800 (PST)
Received: by 10.152.144.2 with SMTP id si2mr19936398lab.8.1322220088004;
	Fri, 25 Nov 2011 03:21:28 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ne3sm22411854lab.7.2011.11.25.03.21.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 25 Nov 2011 03:21:26 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Fri, 25 Nov 2011 12:21:22 +0100
In-Reply-To: <4ECF768A.4060108@dresearch-fe.de>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4ECF768A.4060108@dresearch-fe.de>
Message-Id: <95977E6E-2138-4CEA-B7C6-FC8A248F9C95@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: Uncommon source deployment policy of live555
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
X-List-Received-Date: Fri, 25 Nov 2011 11:28:05 -0000
X-Groupsio-MsgNum: 12945
Content-Type: multipart/signed;
	boundary="Apple-Mail=_919F9FC9-57CF-4BBF-BB02-A9AD6DB0FE41";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_919F9FC9-57CF-4BBF-BB02-A9AD6DB0FE41
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 25 nov. 2011, om 12:05 heeft Steffen Sledz het volgende geschreven:

> The LIVE555 project has a really uncommon source deployment policy. :(
>=20
> They publish *only* the latest tarball of their code [1]. And they =
don't make the code available under a source code repository [2].
>=20
> I've asked to change this policy but they are not willing to do that =
[3].
>=20
> How can we handle this?
> Does OE provides a "mirror" server to provide the versions we're =
referencing?

Angstrom has had such a mirror ever since it started and it has the =
following live555 releases:

live.2009.06.02.tar.gz
live.2010.04.09.tar.gz
live.2010.05.29.tar.gz
live.2010.10.15.tar.gz
live.2011.01.10.tar.gz
live.2011.03.14.tar.gz



--Apple-Mail=_919F9FC9-57CF-4BBF-BB02-A9AD6DB0FE41
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7PejUACgkQMkyGM64RGpHdGgCfaV43a7WR7q2/OT87Xt8mHIJ7
yf0AnRTItKCNTISVe2O75T+03mU+8uJk
=Nn6W
-----END PGP SIGNATURE-----

--Apple-Mail=_919F9FC9-57CF-4BBF-BB02-A9AD6DB0FE41--
