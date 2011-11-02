Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RLbnX-0007ht-UW
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Nov 2011 15:28:12 +0100
Received: by wwf4 with SMTP id 4so289930wwf.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Nov 2011 07:22:04 -0700 (PDT)
Received: by 10.227.199.5 with SMTP id eq5mr6128445wbb.2.1320243724167;
	Wed, 02 Nov 2011 07:22:04 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fw16sm4442963wbb.13.2011.11.02.07.22.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Nov 2011 07:22:03 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Wed, 2 Nov 2011 15:22:01 +0100
In-Reply-To: <1320243402-2116-1-git-send-email-koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
References: <1320243402-2116-1-git-send-email-koen@dominion.thruhere.net>
Message-Id: <A9A8E4DF-B854-41A4-BA2F-962A49B00035@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH] image_types bbclass: use 4k bytes per inode so we don't run out of space immediately
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
X-List-Received-Date: Wed, 02 Nov 2011 14:28:13 -0000
X-Groupsio-MsgNum: 11820
Content-Type: multipart/signed;
	boundary="Apple-Mail=_D471D02F-8F14-4106-8FA3-EF3A57D36097";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_D471D02F-8F14-4106-8FA3-EF3A57D36097
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 2 nov. 2011, om 15:16 heeft Koen Kooi het volgende geschreven:

> genext2fs only creates the minimum number of inodes, after this patch =
it will scale with the rootfs size
>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

The matching OE classic commit is:

koen@dominion:/OE/org.openembedded.dev$ git show 12275a16
commit 12275a1604e2a5e9e66c7ef900c450b01e5cf622
Author: Tom Rini <tom_rini@mentor.com>
Date:   Fri Dec 17 10:45:32 2010 -0700

    bitbake.conf: Use normal bytes per inode param to genext2fs

    Without this we get an unusably small number of inodes in
    our filesystem images.

    Signed-off-by: Tom Rini <tom_rini@mentor.com>



--Apple-Mail=_D471D02F-8F14-4106-8FA3-EF3A57D36097
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk6xUgkACgkQMkyGM64RGpEl5gCgoYeRFpm0uLhWfvq+bCB2NNus
lQoAoLxLJWruzJuRSQlQNoLfyTbt6Yv4
=Z7NS
-----END PGP SIGNATURE-----

--Apple-Mail=_D471D02F-8F14-4106-8FA3-EF3A57D36097--
