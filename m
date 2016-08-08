Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 43C62731CB;
	Mon,  8 Aug 2016 15:21:04 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id g202so25254391pfb.1;
	Mon, 08 Aug 2016 08:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=ljOUMyw3w+Pn8CAqlTkTpeS5VuJMm7JZMe3oQBsPvZM=;
	b=aUBrqz41/ZMrOiO7nU2tJort5pr9lCS2FvUVQKHWtfaOjsqyokzeh1TrBlZVGzNMWL
	xtLLiWuRowUB3JafIa6ntGqVAaVHQnIfdSwFm/vafETk8DNU0tJheMpHHg15bmNBBDT0
	0PRBU6fd8Eg+pgErW0BPQk7VPhkYAwIKN7a9yiy+9SlE2u1VsAAyXNlxwt4t+fMOhBQg
	CN8JZokoXge1HX+nWdrYTiSxM072y73gBSKDh0Vm3giD0rkOAs/6cQ3SkyFAzEMkKBC1
	QGYEYAJv9WBnpVjeJv9T+t54UhiiUkBwc3oI8yAJSObjf0maoiFbdgP7xyigsCqDVqPu
	VAMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=ljOUMyw3w+Pn8CAqlTkTpeS5VuJMm7JZMe3oQBsPvZM=;
	b=GSnDKbX2dxs0PXHA0bj9Fg+2BVf7q/HIE8bvJq0CFrNEv0rDy+FqMljJwCj7CqMPI3
	RUhpHSS2sVOolzirZoPvRsvpV0LSWIPfJDK/lj3/9AWDUA9rUfZaGKsQTj/KCiqLUaOS
	sDXihkD4WgN7mnr2Et1un7OEn0kvqKg+FrW4j9WOURbuaXS5XpKYc3G/aCfDNxENb8zC
	Y6YueE8A5U/o8YKeKOrIIM7xDV5HVuL1XT5iRpbhd3QzpZ5dZF+fZNOGMA5+MELzMvmE
	Tlos2pQSrhKl1e/qscPzwmDwI/ZYZ7hF0bxl4CHwGbbBKfxmWiCRHWA8Plg1Xfic77uv
	dZnw==
X-Gm-Message-State: AEkooutAdQqJEsRbEqbXxnf8AiU6kI4R206qdbV8ajqIZB73NtBacFoFWJyJJvi8rr+qCQ==
X-Received: by 10.98.79.27 with SMTP id d27mr163447748pfb.127.1470669665501;
	Mon, 08 Aug 2016 08:21:05 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:ddaa:6f66:32b4:378?
	([2601:646:8882:b8c:ddaa:6f66:32b4:378])
	by smtp.gmail.com with ESMTPSA id 6sm39845373pab.11.2016.08.08.08.21.02
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 Aug 2016 08:21:02 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1470647765.4581.23.camel@andred.net>
Date: Mon, 8 Aug 2016 08:21:32 -0700
Message-Id: <ACB9AEF7-A7DF-4A88-9762-7569D91AD12D@gmail.com>
References: <CC61EFE1-5F39-4848-AD71-8E9C8DEC43C8@gmail.com>
	<1470637705.8166.29.camel@linuxfoundation.org>
	<8C207C42-3D61-4C3F-A1DE-F305AA6617BA@gmail.com>
	<1470644094.8166.37.camel@linuxfoundation.org>
	<1470646210.8166.38.camel@rpsys.net>
	<1470647765.4581.23.camel@andred.net>
To: =?utf-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
X-Mailer: Apple Mail (2.3124)
Cc: Yocto Discussion Mailing List <yocto@yoctoproject.org>,
	Richard Purdie <rpurdie@rpsys.net>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFT] binutils 2.27
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
X-List-Received-Date: Mon, 08 Aug 2016 15:21:06 -0000
X-Groupsio-MsgNum: 85465
Content-Type: multipart/signed;
	boundary="Apple-Mail=_1D7B7889-4F56-4E84-B8CA-955F4BE9C89C";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_1D7B7889-4F56-4E84-B8CA-955F4BE9C89C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Aug 8, 2016, at 2:16 AM, Andr=C3=A9 Draszik <git@andred.net> wrote:
>=20
> On Mon, 2016-08-08 at 09:50 +0100, Richard Purdie wrote:
>> On Mon, 2016-08-08 at 09:14 +0100, Richard Purdie wrote:
>>>=20
>>> On Mon, 2016-08-08 at 00:24 -0700, Khem Raj wrote:
>>>>=20
>>>>>=20
>>>>> On Aug 7, 2016, at 11:28 PM, Richard Purdie <
>>>>> richard.purdie@linuxfoundation.org> wrote:
>>>>>=20
>>>>> On Sun, 2016-08-07 at 01:39 -0700, Khem Raj wrote:
>>>>>>=20
>>>>>> I have put together upgrade for binutils 2.27 here (
>>>>>> kraj/master
>>>>>> branch )
>>>>>>=20
>>>>>> https://github.com/kraj/openembedded-core/commit/b98f5761d2285f
>>>>>> fd
>>>>>> 773e
>>>>>> c6ecb901b799302ebd6b
>>>>>>=20
>>>>>> I have started bunch of test builds. but I would appreciate any
>>>>>> help
>>>>>> in testing it out in your
>>>>>> environments and report any issues you see.
>>>>>=20
>>>>> I ran this through the autobuilder:
>>>>>=20
>>>>> bitbake world shows issues in libunwind (from gold?):
>>>>>=20
>>>>=20
>>>> yes, however, use of gold for libunwind in OE was an escape route
>>>> where we were relying upon gold=E2=80=99s inability to detect this =
issue
>>>> while BFD linker
>>>> was detecting it earlier. Now in 2.27 gold has caught up as well.
>>>>=20
>>>> see
>>>> https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D6eeb01=
70
>>>> bb
>>>> b43ffb73e8f01b8b481adde8194c21
>>>>=20
>>>> so now we have to get to nub of this issue to resolve it.
>>>=20
>>> Ok. I think we also have:
>>>=20
>>> =
https://autobuilder.yoctoproject.org/main/builders/nightly-ppc/builds
>>> /8
>>> 96
>>> =
https://autobuilder.yoctoproject.org/main/builders/nightly-ppc/builds
>>> /8
>>> 96
>>>=20
>>> in that "connmand --help" is segfaulting on ppc. I've not 100%
>>> confirmed its the binutils patch but its seeming likely at this
>>> point.
>>=20
>> Its also sefgaulting on all mips builds:
>>=20
>> =
https://autobuilder.yoctoproject.org/main/builders/nightly-mips/builds/883=

>> =
https://autobuilder.yoctoproject.org/main/builders/nightly-mips-lsb/builds=

>> /863
>> =
https://autobuilder.yoctoproject.org/main/builders/nightly-mips64/builds/5=

>> 28
>>=20
>> :(
>=20
> binutils 2.27 brings GOLD to mips, but debian has disabled GOLD on all =
MIPS
> for now due to segfaulting... Maybe the same issue=E2=80=A6

They are different issues. for OE ppc also shows same errors with =
libunwind.

>=20
>=20
> A.
>=20
>=20


--Apple-Mail=_1D7B7889-4F56-4E84-B8CA-955F4BE9C89C
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAleoo4EACgkQuwUzVZGdMxTCUwCdH4BNyk+k073SzKYQyvyw2nK7
E+oAnjRU1QEo/OQLZa4TFWiOrgtgzuC6
=cd+s
-----END PGP SIGNATURE-----

--Apple-Mail=_1D7B7889-4F56-4E84-B8CA-955F4BE9C89C--
