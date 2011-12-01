Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RW8CO-0001le-P1
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 16:05:20 +0100
Received: by eaad13 with SMTP id d13so2287269eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2011 06:58:39 -0800 (PST)
Received: by 10.213.28.141 with SMTP id m13mr557843ebc.110.1322751519461;
	Thu, 01 Dec 2011 06:58:39 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id 8sm18306019eei.8.2011.12.01.06.58.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Dec 2011 06:58:38 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1322744495.17484.125.camel@ted>
Date: Thu, 1 Dec 2011 15:58:36 +0100
Message-Id: <EA746CBB-C2AC-4DD2-83AB-880B4E2F96F9@dominion.thruhere.net>
References: <1322660459-333-1-git-send-email-koen@dominion.thruhere.net>
	<1322675553.17484.20.camel@ted>
	<F9E3D91B-529C-4E90-BF2F-DEB5E372BECE@dominion.thruhere.net>
	<1322744495.17484.125.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1251.1)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] zlib 1.2.5: install pkgconfig file, needed for e.g. modern webkit
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
X-List-Received-Date: Thu, 01 Dec 2011 15:05:20 -0000
X-Groupsio-MsgNum: 13448
Content-Type: multipart/signed;
	boundary="Apple-Mail=_8DB89F00-BC30-4D1B-BC86-E8FB6DC5F5C7";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_8DB89F00-BC30-4D1B-BC86-E8FB6DC5F5C7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 1 dec. 2011, om 14:01 heeft Richard Purdie het volgende geschreven:

> On Wed, 2011-11-30 at 19:15 +0100, Koen Kooi wrote:
>> Op 30 nov. 2011, om 18:52 heeft Richard Purdie het volgende =
geschreven:
>>=20
>>> On Wed, 2011-11-30 at 14:40 +0100, Koen Kooi wrote:
>>>> Upstream has grown cmake support which would allow us to dump the =
OE
>>>> autotools hack, but the cmakefile doesn't install the .pc file =
either
>>>> and breaks with zlib-native
>>>>=20
>>>> Also remove unused site config file
>>>=20
>>> How did you determine this was unused?
>>=20
>> By removing it and rebuilding zlib(-native) and zlib dependant apps.
>> In case it does turn out to be needed we should switch to cmake. I'm
>> OK with having a OE hack for autotools, but a broken OE hack....
>=20
> I don't think you understand what that site_config file triggers. It
> triggers code in siteconfig.bbclass which saves the *results* of the
> zlib configure for use in speeding up subsequent configure tasks.
>=20
> Does that change the need to remove it?

I honestly don't know, I've never dealt with that part of siteconfig. If =
the file is needed I'll gladly respin the patch.

regards,

Koen


--Apple-Mail=_8DB89F00-BC30-4D1B-BC86-E8FB6DC5F5C7
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7XlhwACgkQMkyGM64RGpHgtACdF+MZ2tGHYdCJYtd/5SbZfdVq
XT8An3edtuFbBFcjdnMJ0NZxyz7u8Of8
=CQ8z
-----END PGP SIGNATURE-----

--Apple-Mail=_8DB89F00-BC30-4D1B-BC86-E8FB6DC5F5C7--
