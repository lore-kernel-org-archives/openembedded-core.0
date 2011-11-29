Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RVJ3v-0005ax-22
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 09:29:11 +0100
Received: by eaad13 with SMTP id d13so2766372eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 00:22:32 -0800 (PST)
Received: by 10.213.21.131 with SMTP id j3mr849892ebb.95.1322554952301;
	Tue, 29 Nov 2011 00:22:32 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id 8sm34701462ees.2.2011.11.29.00.22.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 Nov 2011 00:22:31 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4ED491CF.4020807@linux.intel.com>
Date: Tue, 29 Nov 2011 09:22:29 +0100
Message-Id: <29FCBED2-0BFC-420A-988F-B11490D51CC1@dominion.thruhere.net>
References: <cover.1322120651.git.dvhart@linux.intel.com>
	<d5ab9354f38a3cdecfedaf734ffb48aa969a8541.1322120651.git.dvhart@linux.intel.com>
	<4ED01D59.8020301@linux.intel.com>
	<4ED491CF.4020807@linux.intel.com>
To: Darren Hart <dvhart@linux.intel.com>
X-Mailer: Apple Mail (2.1251.1)
Cc: Josef Ahmad <josef.ahmad@intel.com>, Chris Larson <clarson@kergoth.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 29 Nov 2011 08:29:11 -0000
X-Groupsio-MsgNum: 13038
Content-Type: multipart/signed;
	boundary="Apple-Mail=_7E160582-63DE-4A31-AFB2-2CDFEE9C9D47";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_7E160582-63DE-4A31-AFB2-2CDFEE9C9D47
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1


Op 29 nov. 2011, om 09:03 heeft Darren Hart het volgende geschreven:

> On 11/25/2011 02:57 PM, Darren Hart wrote:
>>=20
>>=20
>> On 11/24/2011 12:05 AM, Darren Hart wrote:
>>> Add a recipe to build the GRUB efi images. This recipe is written as
>>> a native recipe as the resulting GRUB utils are required to assemble
>>> the final image. Rather than build a native and a target recipe (and
>>> increase build times), this recipe builds the utils for the host and
>>> passes an appropriate --target argument to the GRUB configure script
>>> to build the modules for the target arch. The only output of this
>>> recipe is an EFI image in the deploy directory.
>>=20
>> The grub-help list came through with an alternative approach:
>>=20
>> "./configure CC=3Dpowerpc-linux-gcc  --host=3Dppc-linux-gnu =
--target=3Di386
>> --with-platform=3Dpc TARGET_CC=3Di386-linux-gcc"
>>=20
>> This would allow for building on a host of arch ppc for a target of =
arch
>> i386.
>>=20
>> Would it be preferable then to build this as a target package and
>> manipuate the configure flags to use the BUILD_CC ? I presume a =
similar
>> PN rename would be desirable to account for the HOST component of the
>> build as I used here for the TARGET on the -native version?
>=20
> I have been working on trying to get this working as a target recipe. =
I've
> resolved a number of issues, but something is still biting me and I =
haven't been
> able to sort out what. I would really appreciate a few more sets of =
eyes on
> this.
>=20
> I have pushed my dvhart/efi/dev branch to poky-contrib for reference:
>=20
> =
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/?h=3Ddvhart/efi/dev=

>=20
> When building this recipe

This is against poky, so I can't build it. If it was against OE-core, =
like one would expect on the OE-core mailing list, I could build it.=

--Apple-Mail=_7E160582-63DE-4A31-AFB2-2CDFEE9C9D47
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7UlkUACgkQMkyGM64RGpHXewCfaNv0ffK+epL9tfPB7PhW9kK7
J40An1UI6pAffh7Bx3JqyaiZlRCBIUCv
=im5S
-----END PGP SIGNATURE-----

--Apple-Mail=_7E160582-63DE-4A31-AFB2-2CDFEE9C9D47--
