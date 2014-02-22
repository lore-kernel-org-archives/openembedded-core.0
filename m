Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 3218B6EE4D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2014 09:31:44 +0000 (UTC)
Received: by mail-pd0-f180.google.com with SMTP id x10so4300772pdj.39
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2014 01:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=bHRsleVVut1pCoFxoprNvm+rbvX24XvgZ7USyyDOYnE=;
	b=LI5twkKsAAF709b7IIKcUHLaVpqsFO++jAF7FqgWHxwkcwoireT95HNTus5oHypSCP
	6MkvupYH/ehWongzYpF2OiZPwCu63lbSE/2co0z3BRT5MDDGQDOtlk5lai86zjexnkzQ
	WaE2AmAl3l85+olINp0zghEwaOWhqYymzQ/yTr5y2bGW8X0bUDXgLy3N2/GHTbVTjvlA
	gfdLTtipYeQEUpArznOQQ/piTQS7azgJDcmg1cs5khr26pFCK1qxosYeodEUxkFbaJYo
	URQBRbgg1MkKl8kgJFW96MMcbzMG3GDO/YM/L5Y0nFOeVgObqFjz75bsQUGm5Dt0i5kV
	c3Hg==
X-Received: by 10.66.12.67 with SMTP id w3mr14380243pab.29.1393061505270;
	Sat, 22 Feb 2014 01:31:45 -0800 (PST)
Received: from [192.168.0.33] (99-57-140-30.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.30]) by mx.google.com with ESMTPSA id
	dk1sm29332835pbc.46.2014.02.22.01.31.41 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 22 Feb 2014 01:31:41 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1393058961.5181.4.camel@ted>
Date: Sat, 22 Feb 2014 01:31:39 -0800
Message-Id: <FD6EC742-512D-4423-B59D-D88ECBF97AF1@gmail.com>
References: <cover.1392891203.git.raj.khem@gmail.com>
	<20140221151607.GG3854@jama> <1392996116.1560.14.camel@ted>
	<8730C02B-B94E-4873-88D1-E5BA9063B585@dominion.thruhere.net>
	<1393058961.5181.4.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1827)
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFT][PATCH 0/2] Systemd 209
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 22 Feb 2014 09:31:45 -0000
X-Groupsio-MsgNum: 50440
Content-Type: multipart/signed;
	boundary="Apple-Mail=_19F26239-3B6F-4EFA-9872-678196A5B6F8";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_19F26239-3B6F-4EFA-9872-678196A5B6F8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=windows-1252


On Feb 22, 2014, at 12:49 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:

> On Sat, 2014-02-22 at 08:57 +0100, Koen Kooi wrote:
>> Op 21 feb. 2014, om 16:21 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:
>>=20
>>> On Fri, 2014-02-21 at 16:16 +0100, Martin Jansa wrote:
>>>> On Thu, Feb 20, 2014 at 02:18:56AM -0800, Khem Raj wrote:
>>>>> This patchset upgrades systemd to 209 as can be seen some =
enahancements
>>>>> to uclibc were neeed. As of now. It builds for me on both =
uclibc/eglibc
>>>>> Please test it out in your setups and report back any issues
>>>>>=20
>>>>> The following changes since commit =
9a98b8bfe13b94d89a9e39cca821f26fdeaeffc3:
>>>>>=20
>>>>> image_types.bbclass: Fix tar IMAGE_CMD to not change directories =
(2014-02-18 08:37:03 +0000)
>>>>>=20
>>>>> are available in the git repository at:
>>>>>=20
>>>>> git://git.openembedded.org/openembedded-core-contrib =
kraj/systemd-209
>>>>> =
http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=3Dk=
raj/systemd-209
>>>>>=20
>>>>> Khem Raj (2):
>>>>> uclibc: Add new functionality needed for systemd 209
>>>>> systemd: Upgrade 208 -> 209
>>>>=20
>>>> Thanks for upgrade
>>>>=20
>>>> I've noticed pulseaudio failing to build when it tries to detect =
old
>>>> libsystemd-login lib:
>>>>=20
>>>> | to the PKG_CONFIG_PATH environment variable
>>>> | No package 'libsystemd-login' found
>>>> | configure:26263: $? =3D 1
>>>> | configure:26277: result: no
>>>> | No package 'libsystemd-login' found
>>>> | configure:26310: error: *** Needed systemd support not found
>>>>=20
>>>> do we want to enable compat libs or update pulseaudio to use new
>>>> libsystemd?
>>>=20
>>> FWIW the git recipe I was using enabled compat-libs...
>>=20
>> And that needs IFUNC which only x86 toolchains support :(
>=20
> I did run test builds of the git version on the autobuilders and =
didn't
> see any failures?=20


builds might work but they won=92t run and yes so far IFUNC support is =
needed so it won=92t work on non-x86
architectures. One common runtime problem I am seeing is logind not =
being able to talk to dbus
across all architectures. I have pushed my latest rework to pull branch


>=20
> Cheers,
>=20
> Richard
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_19F26239-3B6F-4EFA-9872-678196A5B6F8
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlMIbnsACgkQuwUzVZGdMxS0IwCdHcKe1yvDIXXL2zp+B/RyZOzG
4Y8AnjLDHa1R2GjS3NBPZmBe9pcKNPDy
=KHWL
-----END PGP SIGNATURE-----

--Apple-Mail=_19F26239-3B6F-4EFA-9872-678196A5B6F8--
