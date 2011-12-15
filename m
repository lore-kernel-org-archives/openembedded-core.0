Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RbCwi-00073v-5g
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Dec 2011 16:10:08 +0100
Received: by faaa20 with SMTP id a20so2395933faa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2011 07:03:10 -0800 (PST)
Received: by 10.180.96.166 with SMTP id dt6mr5567152wib.47.1323961390157;
	Thu, 15 Dec 2011 07:03:10 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id m5sm8671839wie.2.2011.12.15.07.03.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Dec 2011 07:03:09 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20111215130615.GB4419@jama.jama.net>
Date: Thu, 15 Dec 2011 16:03:13 +0100
Message-Id: <527ACC3A-1C3E-4EA2-AE7F-7757796A2577@dominion.thruhere.net>
References: <1323281084-30590-1-git-send-email-Martin.Jansa@gmail.com>
	<20111208154840.GD3761@jama.jama.net>
	<CAMKF1spHhLbMLtY9VhgrgQ4QwO06HEcnGSZrWj3mXLuif5gmFg@mail.gmail.com>
	<A2CA7F01-3A24-487E-AD78-C59389F667EB@dominion.thruhere.net>
	<20111215130615.GB4419@jama.jama.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH][RFC] conf/machine/include/arm add extra MACHINEOVERRIDES like x86 does
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
X-List-Received-Date: Thu, 15 Dec 2011 15:10:08 -0000
X-Groupsio-MsgNum: 14259
Content-Type: multipart/signed;
	boundary="Apple-Mail=_F7FDD2CE-D747-4C31-AC8C-F146C08FF408";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_F7FDD2CE-D747-4C31-AC8C-F146C08FF408
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 15 dec. 2011, om 14:06 heeft Martin Jansa het volgende geschreven:

> On Thu, Dec 15, 2011 at 10:29:17AM +0100, Koen Kooi wrote:
>>=20
>> Op 13 dec. 2011, om 21:01 heeft Khem Raj het volgende geschreven:
>>=20
>>> On Thu, Dec 8, 2011 at 7:48 AM, Martin Jansa =
<martin.jansa@gmail.com> wrote:
>>>>=20
>>>> =
meta/recipes-devtools/python/python_2.7.2.bb:TARGET_CC_ARCH_append_armv6 =
=3D " -D__SOFTFP__"
>>>> =
meta/recipes-devtools/python/python_2.7.2.bb:TARGET_CC_ARCH_append_armv7a =
=3D " -D__SOFTFP__"
>>>=20
>>> hmmm will this work if we have armv7-a + hard float ABI ?
>>=20
>> Or a better question: is it still needed or is ffi still broken?
>=20
> What exactly was the issue? I didn't have this override since starting
> shr-core and I haven't noticed any issues with python/libffi on
> nokia900.

It breaks at runtime when you try to use it, but I forget which module =
triggers it. I suspect numpy, maybe philip remembers it.=

--Apple-Mail=_F7FDD2CE-D747-4C31-AC8C-F146C08FF408
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7qDDMACgkQMkyGM64RGpHgoACdFqOYCViLKX+G4y4c0Zjkq7FW
TCQAn06dibblvwi+6n3n83QXcmTebsdH
=Hd23
-----END PGP SIGNATURE-----

--Apple-Mail=_F7FDD2CE-D747-4C31-AC8C-F146C08FF408--
