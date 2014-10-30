Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 99A4E65D3C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Oct 2014 14:18:53 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id h11so4670836wiw.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Oct 2014 07:18:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=ZAB5o25EcFh9LbmFRLxhRB4unJvJxEmlcSFrt6u5NAM=;
	b=K+OW0yzMCdWTSckBOi6A7EfgYBJdlMYM58df513b0ZK6J4vEsOwG/sWE+SuzyHTGcx
	GDqtjJSS1PCeQHReYU1qeOSFSEeySAH1YWfLwX0nuzerbWgC+jMZhn9jkebAuW9R2cRO
	9feCFDHMI0zU4OzrBCOrgWDcqa+50dSk3IdNdJ4y/FetNwBcZd8zq/mTKkz75BcUCJiv
	NYYOHyrW+KQKOrDlEoxxfnoDsnqEBExlSrdlGFNHv04oDLkKD8UM/Jmzh7e1i8EDMjGB
	2IhPtoBS8KqRF0X5YCGXapGe+ZYsbP3yIyi7cHvtPuD/O0gYxrmQD5Pjy2Xck4lWMXGf
	u3cA==
X-Gm-Message-State: ALoCoQnhDQ8MHmkDAE6uFKpDYCLKmwGgQhrBV4kW51FZzw51XD0sIcaRMzw9TJ5W5/E7gx1Wsd8i
X-Received: by 10.180.74.142 with SMTP id t14mr43410158wiv.17.1414678732912;
	Thu, 30 Oct 2014 07:18:52 -0700 (PDT)
Received: from ?IPv6:2001:610:612::d96f:d434:2ad0:42a4?
	([2001:610:612:0:d96f:d434:2ad0:42a4])
	by mx.google.com with ESMTPSA id
	ji10sm22374654wid.7.2014.10.30.07.18.51 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 30 Oct 2014 07:18:52 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1414675717.7649.56.camel@ted>
Date: Thu, 30 Oct 2014 15:18:50 +0100
Message-Id: <57233C63-3053-410A-9D7D-011B9D3B3331@dominion.thruhere.net>
References: <1406209379-1662-1-git-send-email-Martin.Jansa@gmail.com>
	<1406209379-1662-2-git-send-email-Martin.Jansa@gmail.com>
	<CAJTo0La2AZo=nxBJGnkQrC+=jB9hoO+tsYyuCMbfAT0vwwd-qg@mail.gmail.com>
	<20140724152218.GM2492@jama> <1406553510.13346.17.camel@ted>
	<20140806114831.GG14848@jama> <20141030132053.GF15148@jama>
	<1414675717.7649.56.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1878.6)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] recipes: add x11 to required DISTRO_FEATURES
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
X-List-Received-Date: Thu, 30 Oct 2014 14:18:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 30 okt. 2014, om 14:28 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:

> On Thu, 2014-10-30 at 14:20 +0100, Martin Jansa wrote:
>> On Wed, Aug 06, 2014 at 01:48:31PM +0200, Martin Jansa wrote:
>>> On Mon, Jul 28, 2014 at 02:18:30PM +0100, Richard Purdie wrote:
>>>> On Thu, 2014-07-24 at 17:22 +0200, Martin Jansa wrote:
>>>>> On Thu, Jul 24, 2014 at 02:52:45PM +0100, Burton, Ross wrote:
>>>>>> On 24 July 2014 14:42, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>>>>>>> +REQUIRED_DISTRO_FEATURES =3D "x11"
>>>>>>=20
>>>>>> Now I'm wondering why this is the solution.
>>>>>>=20
>>>>>> If you attempt to build e.g. gnome-desktop explicitly without the =
x11
>>>>>> distro feature you understandably get an error message, because
>>>>>> gnome-desktop depends on libx11 which sanity checks the distro
>>>>>> features.  This seems correct.
>>>>>>=20
>>>>>> Presumably you're problem is that you're running world builds and
>>>>>> they're producing errors on gnome-desktop because they can't =
satisfy a
>>>>>> dependency on libx11.  It seems that bubbling up the
>>>>>> REQUIRED_DISTRO_FEATURES tests isn't the right thing to do here - =
why
>>>>>> can't SkipPackage be handled specially, so if you do bitbake -k =
world
>>>>>> and libx11 emits SkipPackage, anything that has unsatisfiable
>>>>>> dependencies because of this is also skipped?
>>>>>=20
>>>>> We discussed this many months ago and IIRC the conclusion was that =
user
>>>>> should explicitly say that he wants to skip the recipes which =
depend on
>>>>> something skipped (so that he is aware of what he is missing).
>>>>>=20
>>>>> At that time there wasn't REQUIRED_DISTRO_FEATURES support, so =
I've
>>>>> created huge list of PNBLACKLISTs to blacklist everything not =
available
>>>>> in our setup - so I can do world builds without ERRORs at the =
beginning.
>>>>>=20
>>>>> REQUIRED_DISTRO_FEATURES seems to me like reasonable compromise, =
that's
>>>>> why I've sent this patchset to replace small part of my huge =
blacklist.
>>>>>=20
>>>>> This is the list:
>>>>> =
https://github.com/openwebos/meta-webos/blob/master/conf/distro/include/we=
bos-recipe-blacklist-world.inc
>>>>>=20
>>>>> If someone has time to improve SkipPackage and we really want to =
skip
>>>>> all depending packages, I would be glad to test such patch =
(because it
>>>>> allows to easily drop all those blacklists for "depends-on-broken"
>>>>> components)
>>>>=20
>>>> The question here is whether we want a system which calculates what =
it
>>>> thinks is right or that we declare it.
>>>>=20
>>>> The risk is that if SkipPackage (now known as SkipRecipe) were to
>>>> automatically "spread", you could in theory break the toolchain, =
have
>>>> nothing buildable and "bitbake world" would return success.
>>>>=20
>>>> Effectively the -k option to bitbake already does the SkipPackage
>>>> "spread" idea since bitbake just removes dependencies until it =
works. If
>>>> does that in a fairly verbose way but it does so deliberately so =
you can
>>>> see what is going on.
>>>>=20
>>>> The alternative is to declare what a given recipe supports and then =
we
>>>> can know whether it should be skipped or not under a given =
circumstance.
>>>>=20
>>>> Personally, I'm leaning towards a more declarative approach where =
we
>>>> specify what should and shouldn't be expected to work. I'm open to
>>>> discussion on it though...
>>>=20
>>> I agree with more declarative approach.
>>>=20
>>> I don't mind maintaining PNBLACKLIST e.g. for components depending =
on
>>> something we decided to blacklist ourselves in distro config.
>>>=20
>>> But for components like this, where we really know that they won't =
work
>>> without X11 in DISTRO_FEATURES, I think bitbake should skip them
>>> automatically (thanks to REQUIRED_DISTRO_FEATURES). It already
>>> automatically skips all recipes in xorg-lib directory, why it =
shouldn't
>>> skip other recipes living somewhere else?
>>=20
>> Can we make some decision now?
>=20
> Well, I think there was an implied outcome of this:
>=20
> a) We don't want to automatically do things, we want something
> declarative
>=20
> b) We therefore need to go and add REQUIRED_DISTRO_FEATURES =3D "x11" =
to
> some further places.
>=20
> As such, I'll take patches.
>=20
> Was that what other people understood?

That's how I read it and FWIW, I agree.

regards,

Koen=

