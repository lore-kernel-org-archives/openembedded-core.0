Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RW4Cd-0000gT-Qq
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 11:49:20 +0100
Received: by eekc1 with SMTP id c1so1119358eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2011 02:42:38 -0800 (PST)
Received: by 10.14.14.4 with SMTP id c4mr846516eec.129.1322736158065;
	Thu, 01 Dec 2011 02:42:38 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id a60sm16222785eeb.4.2011.12.01.02.42.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Dec 2011 02:42:36 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Thu, 1 Dec 2011 11:42:34 +0100
In-Reply-To: <1322601901-26195-3-git-send-email-koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
References: <1322601901-26195-1-git-send-email-koen@dominion.thruhere.net>
	<1322601901-26195-3-git-send-email-koen@dominion.thruhere.net>
Message-Id: <B9F05701-3AF2-45DB-8049-030C93599107@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [RFC 3/4] pulseaudio 1.1: convert to useradd.bbclass
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
X-List-Received-Date: Thu, 01 Dec 2011 10:49:20 -0000
X-Groupsio-MsgNum: 13405
Content-Type: multipart/signed;
	boundary="Apple-Mail=_38BBEF5D-CCC8-466D-92A2-D08796A7B7F5";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_38BBEF5D-CCC8-466D-92A2-D08796A7B7F5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 29 nov. 2011, om 22:25 heeft Koen Kooi het volgende geschreven:

> The only thing that got lost in the conversion is the "Pulse Audio =
daemon" description:
>=20
> root@beagleboard:~# grep pulse /etc/passwd /etc/group
> /etc/passwd:pulse:x:999:1000::/var/run/pulse:/bin/false
> /etc/group:audio:x:29:pulse
> /etc/group:pulse:x:1000:pulse
>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

No objections in the past 2 days, so I guess it's ready to go in. I'll =
send a rebased v2 in a minute.

regards,

Koen=

--Apple-Mail=_38BBEF5D-CCC8-466D-92A2-D08796A7B7F5
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7XWhoACgkQMkyGM64RGpFI4wCdFEAgQ47yUbYBEIn6bT44/oMo
5TIAoLVtbrOb9t+Wwtr9yW1houmldMzR
=v+JM
-----END PGP SIGNATURE-----

--Apple-Mail=_38BBEF5D-CCC8-466D-92A2-D08796A7B7F5--
