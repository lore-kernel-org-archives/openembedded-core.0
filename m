Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RKnjD-0004qB-AQ
	for openembedded-core@lists.openembedded.org;
	Mon, 31 Oct 2011 10:00:23 +0100
Received: by wyh5 with SMTP id 5so908603wyh.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2011 01:54:18 -0700 (PDT)
Received: by 10.216.185.4 with SMTP id t4mr2731982wem.83.1320051258438;
	Mon, 31 Oct 2011 01:54:18 -0700 (PDT)
Received: from [172.20.1.32] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ek13sm31168155wbb.3.2011.10.31.01.54.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 31 Oct 2011 01:54:17 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Mon, 31 Oct 2011 09:54:11 +0100
In-Reply-To: <1319885588-5947-1-git-send-email-Martin.Jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <20111028205842.GA17752@gonzales.palutemo>
	<1319885588-5947-1-git-send-email-Martin.Jansa@gmail.com>
Message-Id: <FF670D39-26C1-4B22-824A-CBBB99F71AAC@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH] dbus: add work around to set right owner in postinst
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
X-List-Received-Date: Mon, 31 Oct 2011 09:00:23 -0000
X-Groupsio-MsgNum: 11689
Content-Type: multipart/signed;
	boundary="Apple-Mail=_E57F100B-F789-4012-A260-70AF6FA3B19D";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_E57F100B-F789-4012-A260-70AF6FA3B19D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 29 okt. 2011, om 12:53 heeft Martin Jansa het volgende geschreven:

> * even when I see right chown/chmod in log.do_install, files are still
>  owned by bitbake:bitbake (user running bitbake) and we need to fix it =
on target

I suspect fsperms.txt is breaking things, but I haven't tested it yet.

regards,

Koen



--Apple-Mail=_E57F100B-F789-4012-A260-70AF6FA3B19D
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk6uYjMACgkQMkyGM64RGpFQ+ACfWkY1w3qdoHpGzQp/dm6guVSV
1ecAnAuv89VdZO5HAjDDu4cv4SA+GjCF
=Fvz2
-----END PGP SIGNATURE-----

--Apple-Mail=_E57F100B-F789-4012-A260-70AF6FA3B19D--
