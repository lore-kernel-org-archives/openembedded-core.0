Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RNmaY-0006DQ-P0
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 15:23:46 +0100
Received: by wwf4 with SMTP id 4so661839wwf.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Nov 2011 06:17:32 -0800 (PST)
Received: by 10.227.197.199 with SMTP id el7mr7678727wbb.12.1320761852283;
	Tue, 08 Nov 2011 06:17:32 -0800 (PST)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fy13sm1866517wbb.18.2011.11.08.06.17.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 08 Nov 2011 06:17:31 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Tue, 8 Nov 2011 15:17:28 +0100
In-Reply-To: <f0de6470dfb84e7939234cd516cd1a340bd71588.1320709417.git.josh@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1320709417.git.josh@linux.intel.com>
	<f0de6470dfb84e7939234cd516cd1a340bd71588.1320709417.git.josh@linux.intel.com>
Message-Id: <B8652B86-0AC3-4DCF-AAF6-9BA36646E44F@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 10/12] connman: split scripts into separate package
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
X-List-Received-Date: Tue, 08 Nov 2011 14:23:46 -0000
X-Groupsio-MsgNum: 12094
Content-Type: multipart/signed;
	boundary="Apple-Mail=_D148B4BB-E46F-4C5E-96B8-2A6F423F14F5";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_D148B4BB-E46F-4C5E-96B8-2A6F423F14F5
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii


Op 8 nov. 2011, om 01:10 heeft Joshua Lock het volgende geschreven:

> The connman scripts are useless without a Python interpreter so split
> them into a separate package and add Python to its RDEPENDS.

python, python-core or even python-core + modules?

regards,

Koen

--Apple-Mail=_D148B4BB-E46F-4C5E-96B8-2A6F423F14F5
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk65OfkACgkQMkyGM64RGpHTdACgjtvM9M4tqOACeNmj1Ox0mKBH
QFUAoIYoAEJ19SowcAF1yNl9aPMvtPif
=lRAQ
-----END PGP SIGNATURE-----

--Apple-Mail=_D148B4BB-E46F-4C5E-96B8-2A6F423F14F5--
