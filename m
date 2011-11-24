Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RTVFz-0007my-VM
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Nov 2011 10:06:12 +0100
Received: by lahe6 with SMTP id e6so42100lah.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2011 00:59:39 -0800 (PST)
Received: by 10.152.135.179 with SMTP id pt19mr16631112lab.47.1322125179116;
	Thu, 24 Nov 2011 00:59:39 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id pc8sm18619471lab.8.2011.11.24.00.59.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Nov 2011 00:59:37 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <d5ab9354f38a3cdecfedaf734ffb48aa969a8541.1322120651.git.dvhart@linux.intel.com>
Date: Thu, 24 Nov 2011 09:59:34 +0100
Message-Id: <B17E0298-4C9C-461A-A713-ADEE9771F8F0@dominion.thruhere.net>
References: <cover.1322120651.git.dvhart@linux.intel.com>
	<d5ab9354f38a3cdecfedaf734ffb48aa969a8541.1322120651.git.dvhart@linux.intel.com>
To: Darren Hart <dvhart@linux.intel.com>
X-Mailer: Apple Mail (2.1251.1)
Cc: Josef Ahmad <josef.ahmad@intel.com>, Chris Larson <clarson@kergoth.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 1/5] grub-efi-native: New recipe to build GRUB EFI images
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
X-List-Received-Date: Thu, 24 Nov 2011 09:06:12 -0000
X-Groupsio-MsgNum: 12880
Content-Type: multipart/signed;
	boundary="Apple-Mail=_0FB32C37-B96D-488D-BFDB-18E7CD63BB32";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_0FB32C37-B96D-488D-BFDB-18E7CD63BB32
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 24 nov. 2011, om 09:05 heeft Darren Hart het volgende geschreven:

> Add a recipe to build the GRUB efi images. This recipe is written as
> a native recipe as the resulting GRUB utils are required to assemble
> the final image. Rather than build a native and a target recipe (and
> increase build times),=20

That's a false dilemma. If you write it as a regular recipe with =
BBCLASSEXTEND=3Dnative your buildtime doesn't increase and you leave =
open the option of adding more BBCLASSEXTENDS if someone wants to ship =
it in an SDK.



--Apple-Mail=_0FB32C37-B96D-488D-BFDB-18E7CD63BB32
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7OB3cACgkQMkyGM64RGpHHXgCeJJ0ueD3QiICfulGbfcy7Ou+1
QYUAoLzUevxNkyt14ZHB+r3wVc3xfzGP
=bQ7p
-----END PGP SIGNATURE-----

--Apple-Mail=_0FB32C37-B96D-488D-BFDB-18E7CD63BB32--
