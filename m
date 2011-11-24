Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RTccK-0003aY-S7
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Nov 2011 17:57:45 +0100
Received: by bkbzs2 with SMTP id zs2so3001916bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2011 08:51:11 -0800 (PST)
Received: by 10.204.156.12 with SMTP id u12mr22108299bkw.8.1322153471307;
	Thu, 24 Nov 2011 08:51:11 -0800 (PST)
Received: from [10.0.2.4] (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id g15sm6274263faf.7.2011.11.24.08.51.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Nov 2011 08:51:10 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1322133994.24143.15.camel@ted>
Date: Thu, 24 Nov 2011 17:51:10 +0100
Message-Id: <EE779348-2CFB-4ABE-BEEE-96E34470DFFD@dominion.thruhere.net>
References: <cover.1322120651.git.dvhart@linux.intel.com>
	<d5ab9354f38a3cdecfedaf734ffb48aa969a8541.1322120651.git.dvhart@linux.intel.com>
	<B17E0298-4C9C-461A-A713-ADEE9771F8F0@dominion.thruhere.net>
	<1322133994.24143.15.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1251.1)
Cc: Josef Ahmad <josef.ahmad@intel.com>, Darren Hart <dvhart@linux.intel.com>,
	Chris Larson <clarson@kergoth.com>,
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
X-List-Received-Date: Thu, 24 Nov 2011 16:57:45 -0000
X-Groupsio-MsgNum: 12907
Content-Type: multipart/signed;
	boundary="Apple-Mail=_D6D7E08D-EA0E-4B0A-A472-8F5B486D8127";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_D6D7E08D-EA0E-4B0A-A472-8F5B486D8127
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 24 nov. 2011, om 12:26 heeft Richard Purdie het volgende geschreven:

> On Thu, 2011-11-24 at 09:59 +0100, Koen Kooi wrote:
>> Op 24 nov. 2011, om 09:05 heeft Darren Hart het volgende geschreven:
>>=20
>>> Add a recipe to build the GRUB efi images. This recipe is written as
>>> a native recipe as the resulting GRUB utils are required to assemble
>>> the final image. Rather than build a native and a target recipe (and
>>> increase build times),=20
>>=20
>> That's a false dilemma. If you write it as a regular recipe with
>> BBCLASSEXTEND=3Dnative your buildtime doesn't increase
>=20
> That isn't true, if you build a target and a native version your build
> time does increase. Using BBCLASSEXTEND does improve parsing time over
> having two separate recipes though.

Are you really saying that 'bitbake grub-native' will build both =
versions if you use BBCLASSEXTEND!?!?! If not, it remains a false =
dilemma.



--Apple-Mail=_D6D7E08D-EA0E-4B0A-A472-8F5B486D8127
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7Odf8ACgkQMkyGM64RGpEKpgCfbmr/8HDLrLXD/oLaofxt6IFi
iSIAoJGuYPqVlJe5vYaiLoS+94VCXHW/
=zu20
-----END PGP SIGNATURE-----

--Apple-Mail=_D6D7E08D-EA0E-4B0A-A472-8F5B486D8127--
