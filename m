Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RcZEg-0000Qp-Kp
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 10:10:19 +0100
Received: by wgbds11 with SMTP id ds11so8623142wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2011 01:03:16 -0800 (PST)
Received: by 10.180.75.204 with SMTP id e12mr24424205wiw.61.1324285396459;
	Mon, 19 Dec 2011 01:03:16 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id d17sm24846806wbh.19.2011.12.19.01.03.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Dec 2011 01:03:15 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Mon, 19 Dec 2011 10:03:14 +0100
In-Reply-To: <CADkTA4Nx9Z_3iFzd6FbkbwiYANUL6B4BXsW7_4LngeqcED7DRQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1324237652-15618-1-git-send-email-dbaryshkov@gmail.com>
	<5C0105D4-44BE-4584-9ED9-36970B91A34C@dominion.thruhere.net>
	<CADkTA4OLwUcM86JbCXDOPXUOb1hH+vvKfShjaAsXP3e9Ek0f=A@mail.gmail.com>
	<FB6AAD0F-5F91-48D3-8D02-FCBEC19A4B9E@dominion.thruhere.net>
	<CADkTA4Nx9Z_3iFzd6FbkbwiYANUL6B4BXsW7_4LngeqcED7DRQ@mail.gmail.com>
Message-Id: <10033E42-FF15-4A1D-A8BC-799D1650E3C4@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 1/5] kernel.bbclass: move uImage handling to separate task
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
X-List-Received-Date: Mon, 19 Dec 2011 09:10:20 -0000
X-Groupsio-MsgNum: 14439
Content-Type: multipart/signed;
	boundary="Apple-Mail=_F98FC98A-691B-4946-9643-D5765D9BCF1A";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_F98FC98A-691B-4946-9643-D5765D9BCF1A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 19 dec. 2011, om 02:39 heeft Bruce Ashfield het volgende geschreven:

> On Sun, Dec 18, 2011 at 4:19 PM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>>=20
>> Op 18 dec. 2011, om 21:27 heeft Bruce Ashfield het volgende =
geschreven:
>>=20
>>> On Sun, Dec 18, 2011 at 3:13 PM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>>>>=20
>>>> Op 18 dec. 2011, om 20:47 heeft Dmitry Eremin-Solenikov het =
volgende geschreven:
>>>>=20
>>>>> As per org.oe.dev and meta-oe's kernel.bbclass move uImage =
creation to
>>>>> separate task from do_deploy. This way the do_install task can =
also
>>>>> benefit from generated uImage.
>>>>>=20
>>>>> The only major feature of oe-core's version (not to recreate =
uImage
>>>>> if it exists) is retained in this patch.
>>>>=20
>>>> I still don't agree with that behaviour. The in-kernel uImage code =
is just like the in-kernel defconfigs: useless for people who aren't =
kernel developers.
>>>=20
>>> In that case, shouldn't people doing u-boot development (or other
>>> non-kernel developers),
>>> be building a uImage via something that isn't in kernel.bbclass ?
>>=20
>> I use the kernel.bbclass in meta-oe, that does what I need.
>=20
> ok. I was just trying to wrap my head around the use case, since I'm =
missing
> something, and that would help me understand what is missing in the in =
kernel
> uImage generation scripts. With that, we could see about getting
> changes upstream
> to address deficiencies.


The biggest problem is that "upstream" is $vendor in a lot of cases, so =
fixing it once in OE is more productive than patching N vendor kernels. =
I agree that mainline should have the working version, but for my =
current project mainline doesn't even have support for this SoC and =
won't have till devicetree has cured worldpeace.

regards,

Koen=

--Apple-Mail=_F98FC98A-691B-4946-9643-D5765D9BCF1A
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7u/dIACgkQMkyGM64RGpEa9QCfeb1SQ9wCFTCOaYjLVKcA0Y3l
z6sAnRQVg+wh/oBPAjCXH47u0hJ5q9Zf
=XpcY
-----END PGP SIGNATURE-----

--Apple-Mail=_F98FC98A-691B-4946-9643-D5765D9BCF1A--
