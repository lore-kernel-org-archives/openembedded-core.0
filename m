Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RcDNs-0008Tw-J0
	for openembedded-core@lists.openembedded.org;
	Sun, 18 Dec 2011 10:50:21 +0100
Received: by wgbds11 with SMTP id ds11so7584987wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Dec 2011 01:43:18 -0800 (PST)
Received: by 10.227.199.78 with SMTP id er14mr9530071wbb.10.1324201398038;
	Sun, 18 Dec 2011 01:43:18 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235]) by mx.google.com with ESMTPS id
	ep16sm21339562wbb.21.2011.12.18.01.43.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 18 Dec 2011 01:43:17 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Sun, 18 Dec 2011 10:43:17 +0100
In-Reply-To: <1324200731-10753-1-git-send-email-koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
References: <1324200731-10753-1-git-send-email-koen@dominion.thruhere.net>
Message-Id: <0F3DEA30-4B56-41FB-8069-FBAE6E3A2CA8@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH] libsdl 1.2.14: fix packaging
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
X-List-Received-Date: Sun, 18 Dec 2011 09:50:21 -0000
X-Groupsio-MsgNum: 14395
Content-Type: multipart/signed;
	boundary="Apple-Mail=_E46499D3-4FE1-49DA-AAE7-151FAE39C0F0";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_E46499D3-4FE1-49DA-AAE7-151FAE39C0F0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 18 dec. 2011, om 10:32 heeft Koen Kooi het volgende geschreven:

> For some reason the -config script was shipped in ${PN} leading to =
shlibs renaming issues:
>=20
> What we want, and how meta-oe used to do it:
> 	libsdl-1.2-0_1.2.14-r0.0_armv7a.ipk
>=20
> Current OE-core status:
> 	libsdl_1.2.14-r2_armv7a.ipk
>=20
> With this commit we get both proper shlib renaming and the -dev =
package now has all the dev files
>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

I had trouble finding something in OE-core that actually used libsdl, =
besides 2 tasks and qemu-native, which is why there are no PR bumps for =
recipes using the target package: there aren't any. The meta-oe story is =
different, I sent a patch to bump PR on the things that are broken in =
the angstrom feeds because of this.

regards,

Koen=

--Apple-Mail=_E46499D3-4FE1-49DA-AAE7-151FAE39C0F0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7ttbUACgkQMkyGM64RGpFW+wCfSJk4Kvmzzss/eV1fgUxE8i6t
SWIAn2eA5UuiRslJsTzvPaJf+DMRMA4v
=/cma
-----END PGP SIGNATURE-----

--Apple-Mail=_E46499D3-4FE1-49DA-AAE7-151FAE39C0F0--
