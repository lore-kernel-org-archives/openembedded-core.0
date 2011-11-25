Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RTxxk-0006p4-LX
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Nov 2011 16:45:19 +0100
Received: by bkbzs2 with SMTP id zs2so4263510bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2011 07:38:38 -0800 (PST)
Received: by 10.205.139.65 with SMTP id iv1mr22048698bkc.34.1322235518252;
	Fri, 25 Nov 2011 07:38:38 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id f14sm19129974bkv.3.2011.11.25.07.38.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 25 Nov 2011 07:38:37 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 25 Nov 2011 16:38:34 +0100
Message-Id: <27A3051A-BC1D-4937-B936-42760021F584@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1251.1)
X-Mailer: Apple Mail (2.1251.1)
Subject: opkg-make-index cache failing
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
X-List-Received-Date: Fri, 25 Nov 2011 15:45:19 -0000
X-Groupsio-MsgNum: 12957
Content-Type: multipart/signed;
	boundary="Apple-Mail=_7CDD4098-F928-4082-9EF7-948D6FD30999";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_7CDD4098-F928-4082-9EF7-948D6FD30999
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1

Hi,

In OE-classic the opkg-make-index cache was working pretty well, =
do_rootfs only spent a few seconds doing opkg-make-index on incremental =
builds. In the OE-core world the situation is different, opkg-make-index =
will reindex every package on each do_rootfs run, so after a while =
building images starts taking *really* long, on my systemd (work/ on =
ssd, deploy on rotating media) it now takes =B17minutes just do refresh =
the opkg indices.

Since I can't blame sstate for this I suspect that pseudo gets in the =
way of the naive caching logic. Is there a simple way to turn off pseudo =
when running opkg-make-index?

regards,

Koen=

--Apple-Mail=_7CDD4098-F928-4082-9EF7-948D6FD30999
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7Ptn0ACgkQMkyGM64RGpFoPACeLUXoTWEAVXFY7R9NAbOT/qxL
Am0AnjeNe+JEGdpNilMPmIShFXhuRhFT
=rsRm
-----END PGP SIGNATURE-----

--Apple-Mail=_7CDD4098-F928-4082-9EF7-948D6FD30999--
