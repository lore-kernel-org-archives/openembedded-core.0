Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 9CC5B76DEB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 21:24:38 +0000 (UTC)
Received: by igcrk20 with SMTP id rk20so1206705igc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Sep 2015 14:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=1w6MU0UwjvN6ZnmbBBNhsw6jS08wm4/8Q+8QZ+QAZEg=;
	b=LWnoGt6xRitEIJNoxdSqR4qPXrUtKhhq6tcvx5vJKodll5UzqQeR6HdclJaHvXB0qr
	ay4tkLvsscIReUOCuXugnS4WA+RbajImV8FG6hxEm2EQN9Mi87A/DOoJJoF7cYWtUhiN
	CRHTNiPwiM05OUAeF7H+PhJx41z9GHcYdXwRADWDaZR8c0E373AvgWTJJBLB0FLDDj2b
	CiAk+CSSCPJoyw7M2iX4wyFgX0eYRlY7nVSIZjtvTmJI+4IJYslvPpK1WA3TcG0KNbXs
	bCnFOeuF0DGACLQ5I1nCNKMaQpEzR5W+nSnZRdTwQRkPChx+smhpsjWscDHDbaQQhiXH
	oQbA==
X-Received: by 10.50.8.33 with SMTP id o1mr152347iga.30.1441315478888;
	Thu, 03 Sep 2015 14:24:38 -0700 (PDT)
Received: from 10.168.190.13-ra01.englewood.co.denver.comcast.net
	(fw01.aurora.co.denver.comcast.net. [198.178.8.81])
	by smtp.gmail.com with ESMTPSA id j13sm127459igf.6.2015.09.03.14.24.37
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 03 Sep 2015 14:24:38 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CADkTA4P0WbBagTyDbTJRxb1m7wXX2EMN+c0QAOxn3i8pxqSLQg@mail.gmail.com>
Date: Thu, 3 Sep 2015 14:24:32 -0700
Message-Id: <56097049-FAE4-42F5-8BD7-30A7010DEE7C@gmail.com>
References: <1441143270-27322-1-git-send-email-jslater@windriver.com>
	<1441143270-27322-2-git-send-email-jslater@windriver.com>
	<CAP9ODKp5sMLAB1ohdVPAPZrDeUCjfSGuLVF-VU53BsvzHX29mg@mail.gmail.com>
	<55E74986.1030703@windriver.com>
	<CAP9ODKpx4niWDNDy4t2SUf7xwz5ShoZMsivtM6_qA3o-kBo5AA@mail.gmail.com>
	<1441282288.24871.113.camel@linuxfoundation.org>
	<CADkTA4N7yd=iNEJh4dY8Mdt75j25RV8LgCQAqsZ8zRw_h=o1wg@mail.gmail.com>
	<CAMKF1sp=Hiwt=oYfFy8Mhj4TMXj3x3Tykmg6mNLLtyEXV+TVwQ@mail.gmail.com>
	<1441312024.24871.135.camel@linuxfoundation.org>
	<CAP9ODKrgg8vAT2c6iEkU3THqpqrCYiEz=d61mr3tNwa9P6HGmA@mail.gmail.com>
	<CADkTA4P0WbBagTyDbTJRxb1m7wXX2EMN+c0QAOxn3i8pxqSLQg@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
X-Mailer: Apple Mail (2.2104)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Joe Slater <jslater@windriver.com>
Subject: Re: [PATCH 1/2] ifupdown: import recipe
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
X-List-Received-Date: Thu, 03 Sep 2015 21:24:40 -0000
X-Groupsio-MsgNum: 70613
Content-Type: multipart/signed;
	boundary="Apple-Mail=_59468E11-22A7-41CA-879F-DC739B087A4C";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_59468E11-22A7-41CA-879F-DC739B087A4C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Sep 3, 2015, at 2:02 PM, Bruce Ashfield <bruce.ashfield@gmail.com> =
wrote:
>=20
> On Thu, Sep 3, 2015 at 4:32 PM, Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
>> On Thu, Sep 3, 2015 at 5:27 PM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>>> On Thu, 2015-09-03 at 13:22 -0700, Khem Raj wrote:
>>>> On Thu, Sep 3, 2015 at 5:20 AM, Bruce Ashfield =
<bruce.ashfield@gmail.com> wrote:
>>>>>> To put this another way, I think it is probably reasonable that =
we
>>>>>> should be able to build an image from OE-Core with basic =
functionality
>>>>>> like networking without busybox?
>>>>>=20
>>>>> That's what I'd support. If everything you need for the =
functionality with busy
>>>>> box is in oe-core, to me, it doesn't make sense to go outside core =
to get that
>>>>> same functionality without busybox.
>>>>=20
>>>> irrespective of this change. I see yet another configuration with =
this
>>>> into OE-core, overall OE-Core should get smaller
>>>> and case does not sound convincing to me. You dont want to use =
busybox
>>>> in a fairly large image which has other GPLv2 software in
>>>> it. Thats fine but doesnt look like a common usecase to me
>>>=20
>>> Nobody mentioned GPLv2, that isn't relevant here.
>>>=20
>>> I have heard OE being dismissed since it can't produce an image =
without
>>> busybox in it. The implication is we can't build "big" Linux, only =
small
>>> embedded things. The pieces we need busybox for are tiny and should =
be
>>> easy to replace (like this does).
>>>=20
>>> So I can see a fairly compelling argument for OE-Core to be able to
>>> generate a busybox free image with standard functionality just from =
a PR
>>> perspective. =46rom what I gather we have people willing to test and
>>> maintain it too...
>>=20
>> If people were demanding it, it would have been moved for
>> meta-networking ages ago, it seems it is not the case.
>=20
> ... or they were just holding it elsewhere, since not everyone has the
> time to get things merged to core. In particular if they think it will =
be
> a battle.

thats how we bloated oe-classic. Oh people might need it because I need =
it therefore slam it in
I have written a packagegroup to replace busybox but I never thought it =
was so core.

>=20
>>=20
>> So my vote is:
>>=20
>> - move to meta-networking
>=20
> And what if the use cases don't want/need meta-networking ? We have
> the submission and one use case, and one of the reasons it was sent
> to core was to keep a finite set of layers and recipes to build such =
an image.
>=20
> Joe/Randy ?
>=20
> It is this sort of thing that forces use of combo layers or the =
whitelist
> classes :)

You can also help in making those layers meet the quality criteria you =
need instead of being
pick what I need throw the rest out approach.

>=20
>> - for 2.1 we see if it goes to core or not
>=20
> But without criteria for success .. what does that get us ? What is =
the
> case that needs to be made for a move to core in 2.1, that isn't being
> made now ?
>=20
> Yes, I'm playing devil's advocate on this thread .. since I want to =
see
> this sort of thing clearly defined.

if its required by more than 1 distro. Is duplicated in other layers =
because the layer it resides in
is not used by a distro. It replaces a core functionality in OE-Core. It =
has to be a building block and not a leaf package e.g. These Would be =
some of things that may be thought of.

--Apple-Mail=_59468E11-22A7-41CA-879F-DC739B087A4C
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXoupMACgkQuwUzVZGdMxRjEwCfRWySBZTmC5jVWS4zrVI23NXy
x1YAnjiA+TKkND+3yBFVBJO9YQXIO4aR
=gIeM
-----END PGP SIGNATURE-----

--Apple-Mail=_59468E11-22A7-41CA-879F-DC739B087A4C--
