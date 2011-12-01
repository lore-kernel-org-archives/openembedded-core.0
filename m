Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RW2wg-0006i3-BU
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 10:28:46 +0100
Received: by eaad13 with SMTP id d13so1906954eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2011 01:22:03 -0800 (PST)
Received: by 10.213.7.195 with SMTP id e3mr967071ebe.57.1322731323050;
	Thu, 01 Dec 2011 01:22:03 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id 8sm15588823ees.2.2011.12.01.01.22.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Dec 2011 01:22:01 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Thu, 1 Dec 2011 10:21:57 +0100
In-Reply-To: <ec329e79d07e83cb240dda3988017741c597b566.1322729357.git.lei.mei@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1322729357.git.lei.mei@intel.com>
	<ec329e79d07e83cb240dda3988017741c597b566.1322729357.git.lei.mei@intel.com>
Message-Id: <28033128-9503-4399-B3A6-48B15F4427B4@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 1/1] Fix some recipes upstream version check issue
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
X-List-Received-Date: Thu, 01 Dec 2011 09:28:46 -0000
X-Groupsio-MsgNum: 13397
Content-Type: multipart/signed;
	boundary="Apple-Mail=_2A933C50-DBA4-40CC-84D1-ACCF676B13AA";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_2A933C50-DBA4-40CC-84D1-ACCF676B13AA
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 1 dec. 2011, om 09:54 heeft Mei Lei het volgende geschreven:

> Some recipes didn't declare what protocal they use to check the =
upstream version, this will due to some errors.
> Fix this by add the protocal at the end of the SRC_URI.
>=20
> Signed-off-by: Mei Lei <lei.mei@intel.com>

Which version of bitbake are you usung? IIRC the default was changed =
from rsync to git a few weeks ago.

regards,

Koen=

--Apple-Mail=_2A933C50-DBA4-40CC-84D1-ACCF676B13AA
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7XRzcACgkQMkyGM64RGpHdPgCeNposzdM5GfGQh3idsqYEC1UB
zGkAn0LaNufwvKdcLk3wspZFn64OSQat
=Fhmv
-----END PGP SIGNATURE-----

--Apple-Mail=_2A933C50-DBA4-40CC-84D1-ACCF676B13AA--
