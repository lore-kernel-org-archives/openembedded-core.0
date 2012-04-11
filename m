Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SHwCq-0008RV-3n
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 13:59:24 +0200
Received: by wgbdr12 with SMTP id dr12so662017wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2012 04:50:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=MG7jH/jMDgbQLrjLjSHutnRRLiCLgpMUlBi5h393548=;
	b=nzhJsogKvVvOlegUur1MQNO7KEfhI8mrGTg090r3Rohe1ABJMKDzUdnyk0VciyPhz8
	lDm2BZ9+83wbkV3gjBR15XGp4dUdEGwkX9X7msw2NZfuDuxtgulM7qC59WxrvPsp3mdV
	BfQCzPX9dW8L1JLriWFOLYgoUbgE1ORRLR7dAm8gUHjGfa1SOg3LxhrTqveQtZ5uwNO9
	2ABo6P3OZko3m+BcRlT5SeazjSs+zgxzw7GWwycOaSD9b/Oj9fFnOMGwjQAUQ8Bb3t7g
	O0FPyScQATPo/6QrK59QBfUD/2Qwll7TQMEPaRjV7GaKRB/ZHgLu0XR88L1O3rJe5Mhf
	TFiQ==
Received: by 10.180.94.33 with SMTP id cz1mr15599010wib.13.1334145005299;
	Wed, 11 Apr 2012 04:50:05 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id gg2sm8855204wib.7.2012.04.11.04.50.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 Apr 2012 04:50:04 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1334144215.10826.161.camel@ted>
Date: Wed, 11 Apr 2012 13:49:59 +0200
Message-Id: <678126A5-8A87-4339-A667-82C68250319C@dominion.thruhere.net>
References: <1333626507-32182-1-git-send-email-stefan@herbrechtsmeier.net>
	<4F7E607E.9050101@linux.intel.com>
	<1967D97F-63A7-49DA-930F-A0C6F1F4112F@dominion.thruhere.net>
	<1334065279.10826.14.camel@ted>
	<519A24BF-BBF0-4C58-8418-27F742D03D7F@dominion.thruhere.net>
	<1334144215.10826.161.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQkzHuqZaCui2LzGX04MidaFZUzkFBh5OOy1MFR9rpexkYDCWrKxl0ZxvKUYy6otijCA2Ria
Subject: Re: [PATCH] u-boot: add machine name to spl image name
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
X-List-Received-Date: Wed, 11 Apr 2012 11:59:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 11 apr. 2012, om 13:36 heeft Richard Purdie het volgende geschreven:

> On Tue, 2012-04-10 at 15:56 +0200, Koen Kooi wrote:
>> Op 10 apr. 2012, om 15:41 heeft Richard Purdie het volgende =
geschreven:
>>=20
>>> On Fri, 2012-04-06 at 06:29 -0700, Koen Kooi wrote:
>>>>=20
>>>> Op 5 apr. 2012 om 20:18 heeft Saul Wold <sgw@linux.intel.com> het =
volgende geschreven:
>>>>=20
>>>>> On 04/05/2012 04:48 AM, Stefan Herbrechtsmeier wrote:
>>>>>> Signed-off-by: Stefan Herbrechtsmeier<stefan@herbrechtsmeier.net>
>>>>>> ---
>>>>>> meta/recipes-bsp/u-boot/u-boot.inc        |    2 +-
>>>>>> meta/recipes-bsp/u-boot/u-boot_2011.03.bb |    2 +-
>>>>>> meta/recipes-bsp/u-boot/u-boot_2011.06.bb |    2 +-
>>>>>> 3 files changed, 3 insertions(+), 3 deletions(-)
>>>>>>=20
>>>>>> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc =
b/meta/recipes-bsp/u-boot/u-boot.inc
>>>>>> index 700d5d3..0445c34 100644
>>>>>> --- a/meta/recipes-bsp/u-boot/u-boot.inc
>>>>>> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
>>>>>> @@ -32,7 +32,7 @@ UBOOT_MAKE_TARGET ?=3D "all"
>>>>>> # deploy directory.  For those versions they can set the =
following variables
>>>>>> # to allow packaging the SPL.
>>>>>> SPL_BINARY ?=3D ""
>>>>>> -SPL_IMAGE ?=3D "${SPL_BINARY}-${PV}-${PR}"
>>>>>> +SPL_IMAGE ?=3D "${SPL_BINARY}-${MACHINE}-${PV}-${PR}"
>>>>>> SPL_SYMLINK ?=3D "${SPL_BINARY}-${MACHINE}"
>>>>>>=20
>>>>>> do_compile () {
>>>>>> diff --git a/meta/recipes-bsp/u-boot/u-boot_2011.03.bb =
b/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
>>>>>> index 1ebdbea..e99bc2c 100644
>>>>>> --- a/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
>>>>>> +++ b/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
>>>>>> @@ -17,7 +17,7 @@ FILESDIR =3D =
"${@os.path.dirname(d.getVar('FILE',1))}/u-boot-git/${MACHINE}"
>>>>>> SRCREV =3D "19b54a701811220221fc4d5089a2bb18892018ca"
>>>>>>=20
>>>>>> PV =3D "v2011.03+git${SRCPV}"
>>>>>> -PR =3D "r5"
>>>>>> +PR =3D "r6"
>>>>>>=20
>>>>>> SRC_URI =3D =
"git://git.denx.de/u-boot.git;branch=3Dmaster;protocol=3Dgit"
>>>>>>=20
>>>>>> diff --git a/meta/recipes-bsp/u-boot/u-boot_2011.06.bb =
b/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
>>>>>> index 8ebdbff..680401f 100644
>>>>>> --- a/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
>>>>>> +++ b/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
>>>>>> @@ -17,7 +17,7 @@ FILESDIR =3D =
"${@os.path.dirname(d.getVar('FILE',1))}/u-boot-git/${MACHINE}"
>>>>>> SRCREV =3D "b1af6f532e0d348b153d5c148369229d24af361a"
>>>>>>=20
>>>>>> PV =3D "v2011.06+git${SRCPV}"
>>>>>> -PR =3D "r0"
>>>>>> +PR =3D "r1"
>>>>>>=20
>>>>>> SRC_URI =3D =
"git://git.denx.de/u-boot.git;branch=3Dmaster;protocol=3Dgit"
>>>>>>=20
>>>>>=20
>>>>> Merged into OE-Core
>>>>=20
>>>> wait a minute, why was this merged?
>>>=20
>>> In retrospect it shouldn't.
>>=20
>> Can we back it out? It breaks a ton of buildscripts. SPL_SYMLINK =
already has the machine.
>>=20
>>> It was presented to me as part of a series
>>> and I wasn't careful enough about sifting through the commits, =
likely
>>> the jetlag wasn't helping. I'll aim to try harder, people can help =
by
>>> pointing out patches they don't think should be going into the =
release
>>> at this point...
>>=20
>> I read Sauls mail at the airport at 6:30 in the morning, which means
>> that if I skipped sleeping I would have had a 16 hour window to
>> object. For a bootloader patch that's not enough. Especially when the
>> people who care about bootloaders are on spring break or attending
>> collab.
>=20
> I don't expect people to wait for Saul's emails and then review =
patches
> already on the mailing list.

I don't expect that either, my point was that the window between the =
patch being posted and saul sending the "applied" email was 16 hours, =
half of it during PST sleepy time. That is waaaaay too short for a =
bootloader patch to get reviewed. Opening my mail at 6:30 I read the =
patch for the first time and thought "hmmm, this isn't right" and =
noticed Saul had already applied it. That will teach me for not checking =
my oe-core email for a day :)

> Regardless, I'm rather torn in this case. Stefan's usecase is a valid
> one and I don't see why we have to change the layout of DEPLOY_DIR
> because of this one issue. I know of people doing some interesting
> things with layouts and I don't really want to impose policy on that
> which the change you propose does.

Adding MACHINE to DEPLOY_DIR_IMAGE allows you to get rid of post =
processing scripts to rename foo-MACHINE to foo before consuming it, =
since you can now symlink safely to foo without stepping on other =
machines.

> Having the symlink contain MACHINE
> but not the name is rather odd.
>=20
> I also agree its late in the cycle for something which breaks build
> scripts however :(.
>=20
> So I'm probably in favour of reverting from 1.2 but adding straight =
away
> for 1.3 although I don't like letting 1.2 out with this issue present
> really.

Sounds good to me.

regards,

Koen=


