Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SHbho-0004hr-Jr
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 16:06:00 +0200
Received: by wera1 with SMTP id a1so3228097wer.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2012 06:56:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=67Kz4v71gSxEMmrQH6hwRpIf9d1gr264vmn2slhsklU=;
	b=CdN2vjvd87skLPnv7K0yuttfYVZsemWYVbe159UN+YEJ15+66dXTELg4vjNjTELfOQ
	OmttUr9Dsq4Kq5+PMHytGU0mu5acmzhEpGMZRAHb5eERmo274OJ25wbH9Q1C+iJ5bjW3
	pviZpvRUA8G5z/ANoKCZi6KSTcBCpZtJyYbLKbzNYIXGn2YZvlUiBIcPjBWbtwmkMiEG
	1V7EVxkAoiv2KzGB+kP7Zp7VJCg3s7ENiYXBJfp0ifPMLARfXPBoXVF9sOsjr/8eDYZD
	1gmCaW9Rhhq3ilBQHO4210NEiOdkc/7M1HsyrcCbutbP/AL+rtIkDIULVDd7JaNxAmDx
	rhEQ==
Received: by 10.216.144.138 with SMTP id n10mr6355640wej.56.1334066202859;
	Tue, 10 Apr 2012 06:56:42 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id l5sm37850089wia.11.2012.04.10.06.56.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 Apr 2012 06:56:40 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1334065279.10826.14.camel@ted>
Date: Tue, 10 Apr 2012 15:56:39 +0200
Message-Id: <519A24BF-BBF0-4C58-8418-27F742D03D7F@dominion.thruhere.net>
References: <1333626507-32182-1-git-send-email-stefan@herbrechtsmeier.net>
	<4F7E607E.9050101@linux.intel.com>
	<1967D97F-63A7-49DA-930F-A0C6F1F4112F@dominion.thruhere.net>
	<1334065279.10826.14.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQn8qNhCOM8CvikmoWpnWj5bzhEeyPcOdh6C1LM0m7BDd7hVRlbTz1HvzIX3vJ3X/aisRry3
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
X-List-Received-Date: Tue, 10 Apr 2012 14:06:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 10 apr. 2012, om 15:41 heeft Richard Purdie het volgende geschreven:

> On Fri, 2012-04-06 at 06:29 -0700, Koen Kooi wrote:
>>=20
>> Op 5 apr. 2012 om 20:18 heeft Saul Wold <sgw@linux.intel.com> het =
volgende geschreven:
>>=20
>>> On 04/05/2012 04:48 AM, Stefan Herbrechtsmeier wrote:
>>>> Signed-off-by: Stefan Herbrechtsmeier<stefan@herbrechtsmeier.net>
>>>> ---
>>>> meta/recipes-bsp/u-boot/u-boot.inc        |    2 +-
>>>> meta/recipes-bsp/u-boot/u-boot_2011.03.bb |    2 +-
>>>> meta/recipes-bsp/u-boot/u-boot_2011.06.bb |    2 +-
>>>> 3 files changed, 3 insertions(+), 3 deletions(-)
>>>>=20
>>>> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc =
b/meta/recipes-bsp/u-boot/u-boot.inc
>>>> index 700d5d3..0445c34 100644
>>>> --- a/meta/recipes-bsp/u-boot/u-boot.inc
>>>> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
>>>> @@ -32,7 +32,7 @@ UBOOT_MAKE_TARGET ?=3D "all"
>>>> # deploy directory.  For those versions they can set the following =
variables
>>>> # to allow packaging the SPL.
>>>> SPL_BINARY ?=3D ""
>>>> -SPL_IMAGE ?=3D "${SPL_BINARY}-${PV}-${PR}"
>>>> +SPL_IMAGE ?=3D "${SPL_BINARY}-${MACHINE}-${PV}-${PR}"
>>>> SPL_SYMLINK ?=3D "${SPL_BINARY}-${MACHINE}"
>>>>=20
>>>> do_compile () {
>>>> diff --git a/meta/recipes-bsp/u-boot/u-boot_2011.03.bb =
b/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
>>>> index 1ebdbea..e99bc2c 100644
>>>> --- a/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
>>>> +++ b/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
>>>> @@ -17,7 +17,7 @@ FILESDIR =3D =
"${@os.path.dirname(d.getVar('FILE',1))}/u-boot-git/${MACHINE}"
>>>> SRCREV =3D "19b54a701811220221fc4d5089a2bb18892018ca"
>>>>=20
>>>> PV =3D "v2011.03+git${SRCPV}"
>>>> -PR =3D "r5"
>>>> +PR =3D "r6"
>>>>=20
>>>> SRC_URI =3D =
"git://git.denx.de/u-boot.git;branch=3Dmaster;protocol=3Dgit"
>>>>=20
>>>> diff --git a/meta/recipes-bsp/u-boot/u-boot_2011.06.bb =
b/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
>>>> index 8ebdbff..680401f 100644
>>>> --- a/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
>>>> +++ b/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
>>>> @@ -17,7 +17,7 @@ FILESDIR =3D =
"${@os.path.dirname(d.getVar('FILE',1))}/u-boot-git/${MACHINE}"
>>>> SRCREV =3D "b1af6f532e0d348b153d5c148369229d24af361a"
>>>>=20
>>>> PV =3D "v2011.06+git${SRCPV}"
>>>> -PR =3D "r0"
>>>> +PR =3D "r1"
>>>>=20
>>>> SRC_URI =3D =
"git://git.denx.de/u-boot.git;branch=3Dmaster;protocol=3Dgit"
>>>>=20
>>>=20
>>> Merged into OE-Core
>>=20
>> wait a minute, why was this merged?
>=20
> In retrospect it shouldn't.

Can we back it out? It breaks a ton of buildscripts. SPL_SYMLINK already =
has the machine.

> It was presented to me as part of a series
> and I wasn't careful enough about sifting through the commits, likely
> the jetlag wasn't helping. I'll aim to try harder, people can help by
> pointing out patches they don't think should be going into the release
> at this point...

I read Sauls mail at the airport at 6:30 in the morning, which means =
that if I skipped sleeping I would have had a 16 hour window to object. =
For a bootloader patch that's not enough. Especially when the people who =
care about bootloaders are on spring break or attending collab.=


