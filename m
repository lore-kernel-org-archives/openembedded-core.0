Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 90FBB60620
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 00:36:03 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id n128so52815009pfn.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 16:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=m8ayXhX/gPvh17d/lBBI2NBc3GDWOUj8ctTvM2eQywY=;
	b=ewYbfCmpEN6s24VtvpxnTKxHPpE0JNanBVzTBr2DSlKdy79p2KG8dTgpv4BOYB0oV+
	EjhNZtxsLsGHNGZyTD86HfCAH/bCNbo0cBfFPutPZtF701e6/cpDnM3lt0G86axWlB3m
	u3A762iXOX5Az5de9EO0xCV7hKCMuurMLRKxAdgN4fKCLDlb3YVUzX8lH+Rx9/mt/fGr
	eBRmpcAx71+HsBHmGpAiNTC1m1UpcgF4yY/zSwpMIf2GB/Oe5zRnX1JkpcrgVvjbwuul
	3XCczgHfr5fjakNqCeAgwv6n+M4u2FgSPG4ClYLNizZO48UG0iwFmbUOkqBtUzfsVPIX
	Ti1w==
X-Received: by 10.98.14.80 with SMTP id w77mr30396620pfi.152.1452558964145;
	Mon, 11 Jan 2016 16:36:04 -0800 (PST)
Received: from [192.168.0.4] (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	f27sm25767455pfj.0.2016.01.11.16.36.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Jan 2016 16:36:03 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <568EA7ED.6010806@gmail.com>
Date: Mon, 11 Jan 2016 16:35:58 -0800
Message-Id: <B4FAE527-8438-4342-8B84-6635C8C2ADED@gmail.com>
References: <568DF5C6.90509@gmail.com> <568E1CB6.708@windriver.com>
	<568E86EF.5050408@gmail.com>
	<CAJTo0LaDS4+ETDGLc+Ja8Q+TjCOJ=xn6dSvO4UsNMnLUPhzkcw@mail.gmail.com>
	<1452184627.7598.132.camel@linuxfoundation.org>
	<568EA7ED.6010806@gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
X-Mailer: Apple Mail (2.3112)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: invoking a native compiler (gcc)
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
X-List-Received-Date: Tue, 12 Jan 2016 00:36:03 -0000
X-Groupsio-MsgNum: 75891
Content-Type: multipart/signed;
	boundary="Apple-Mail=_9D95E13F-DCFF-43E1-B4EE-D0F566000F7F";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_9D95E13F-DCFF-43E1-B4EE-D0F566000F7F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jan 7, 2016, at 10:01 AM, Trevor Woerner <twoerner@gmail.com> =
wrote:
>=20
>=20
>=20
> On 01/07/16 11:37, Richard Purdie wrote:
>> On Thu, 2016-01-07 at 15:46 +0000, Burton, Ross wrote:
>>> On 7 January 2016 at 15:40, Trevor Woerner <twoerner@gmail.com>
>>> wrote:
>>>> I was surprised to find that BUILD_CC is being set to whatever
>>>> comes up
>>>> first in our build computer's PATH. But I guess the alternative
>>>> would be
>>>> to make our builds longer by compiling our own native compiler for
>>>> such
>>>> cases.
>>>>=20
>>> You could always set BUILD_CC to explicitly point to the right
>>> compiler on your machine.  When I was trying to make OE work on
>>> Darwin I had to set BUILD_CC to point at brew's gcc binaries.
>> Or you setup PATH to include things in the right order as we do with
>> other native tools...
>=20
> I was surprised to learn that a compiler from the host machine was
> potentially being used as part of a build, not which one is found and
> being used. When I discovered this I was quite sure I had configured
> something incorrectly. This is more of an academic exercise, I didn't
> run into any problems.
>=20
> I guess we're covered in the sense that each release specifies which
> distros are supported. So as long as any native tools that are used in
> each of the support distros are able to produce a successful build
> everything should be fine. BUILD_CC is almost like an implicit
> ASSUME_PROVIDED.

It doesnt end at compiler.
We are cross compiling. so yes we do bootstrap using tools from build =
host.
you can go down the lane and start insulating from hosts by building =
native packages
for everything but it does not buy us much. We basically then end up =
building a build host distro =E2=80=98sort of=E2=80=99
before anything is built for target. We already are building too many =
things then
I would think we should. It also has a maintenance cost to build e..g OE =
packages to run on ubuntu
its an untested combination where as running ubuntu package on ubuntu is =
a tested combo



--Apple-Mail=_9D95E13F-DCFF-43E1-B4EE-D0F566000F7F
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaUSnIACgkQuwUzVZGdMxQutACeIa0TTnbp54+uXZmC1usMhbZF
UogAniijdgdgSA6Eh4scPWB9Q7KOv0w5
=/4K0
-----END PGP SIGNATURE-----

--Apple-Mail=_9D95E13F-DCFF-43E1-B4EE-D0F566000F7F--
