Return-Path: <matt@madison.systems>
Received: from mail-lb0-f179.google.com (mail-lb0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id 55A9860761
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 16:33:10 +0000 (UTC)
Received: by mail-lb0-f179.google.com with SMTP id u9so28757744lbp.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 08:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=g0AIRls0gXwECIStRY5mygbPZfQzVDCHV7rUNDE4N5Y=;
	b=RUgspdv82TryXb23lto4adjORzI70NyU8e1EiFhHhj+hkwDtxrqFmeGnajsU9NnD1D
	NMojffcGwX9BGgdUZmWHGIAcA0/L5n2z+GVC6yMVjRDRVa/oO3LCZDURW9cM+CN/ED6s
	+VdB+BZAe4roI54sqcPKd6XBmIEfpT+Dl662aqgZ6dimmT0DSLt7e4xrVpRqglyCleN0
	AYDzhQrCdR7xs/AIgvrnvYr0mNqJFRdbWabrwDjtQGfG7h3ceYCu80HyDTmHw8+CyYs3
	+lgNTKhCMXxwh6hg12A/ixzOFQHtvegkV6IwtNKfY4PwCR8JFODcbKeXH6C0/SFmpAwu
	qZHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=g0AIRls0gXwECIStRY5mygbPZfQzVDCHV7rUNDE4N5Y=;
	b=PGSAtMiwa2mEnuzvlOuVm3P7OAqVqRL8ZlATT1vmgpclUV3evifhmllyzPaJS+W3i/
	faVhgHDdY1aE+uWAsQR9toM42yfARHBw3sf36NpprsQAh7QaXqIqvcUFCEKrQ2gkdbKi
	JvZCIKAHq3r85ppenP5pMkmzQKvnG9JaAbR6y52RHWARZkSq0oO4eLupmF8a5vNOZwjY
	5s1jEmdCmNyWOcdHF9dNkF5uyVAopceNtpzpOl8cxzAlA7VKyRGZAvGn0wQmig7rNJiz
	BCfkSjSwkIhYAgAFVfO6RKhP2EwUMYmfZaDP6+S3bfcq6sPUt38qes2sfAx0MHaWbbUV
	SGcA==
X-Gm-Message-State: ALoCoQkeTQR4hiyCOdxIkAJmEWgJoRWU7Z+2H90FTOoIxnRBiVUSapzB8x12+MJ9pQMK2Wi8UOotTv7Ltj35biuW85dzcI78AQ==
MIME-Version: 1.0
X-Received: by 10.112.147.167 with SMTP id tl7mr18945960lbb.100.1450283590923; 
	Wed, 16 Dec 2015 08:33:10 -0800 (PST)
Received: by 10.25.145.200 with HTTP; Wed, 16 Dec 2015 08:33:10 -0800 (PST)
In-Reply-To: <56718862.80803@linux.intel.com>
References: <1449422732-12975-1-git-send-email-matt@madison.systems>
	<56704DFF.9070804@linux.intel.com>
	<CAGgRHJqibg_vCYzFp_nQktE4kEcMYe1SMWrz=UH0Up0Q2vuXmg@mail.gmail.com>
	<567092CA.2040600@linux.intel.com>
	<CAGgRHJptKNTkhDi5s9F1S821PG5apBDtW4mG7anGqA84m5d7kw@mail.gmail.com>
	<56718862.80803@linux.intel.com>
Date: Wed, 16 Dec 2015 08:33:10 -0800
Message-ID: <CAGgRHJraSNBEhr8gmAebSc3QCNHS2ZE1wwd6kru4vCzY5Gpn9A@mail.gmail.com>
From: Matt Madison <matt@madison.systems>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Debian multilib packaging fixes
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
X-List-Received-Date: Wed, 16 Dec 2015 16:33:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 16, 2015 at 7:50 AM, An=C3=ADbal Lim=C3=B3n
<anibal.limon@linux.intel.com> wrote:
> Hi Matt,
>
> I tried to do again without your patches and the problem appears, seems
> to be an older problem.

Thanks, I suspected as much and was going to try that myself.  I was
able to work around the issue manually in a devshell by using apt-get
-f to have it "fix" the dependencies it thinks were broken, which from
what I've seen so far, stems from trying to install 32-bit packages
that would overwrite files installed by their 64-bit counterparts.
I'm just not sure that's the right solution to the problem.

-Matt


>
> Regards,
>         alimon
>
> On 12/16/2015 07:31 AM, Matt Madison wrote:
>> On Tue, Dec 15, 2015 at 2:23 PM, An=C3=ADbal Lim=C3=B3n
>> <anibal.limon@linux.intel.com> wrote:
>>> Hi Matt,
>>>
>>> Trying to build core-image-sato with qemux86-64 and multilib enabled an
>>> errors appear (see attached log), next the config.
>>
>> OK, yep, I can reproduce this.  I'll investigate further.
>>
>> Thanks,
>> -Matt
>>
>>
>>>
>>> MACHINE ??=3D "qemux86-64"
>>>
>>> IMAGE_INSTALL_append =3D " lib32-connman"
>>> require conf/multilib.conf
>>> MULTILIBS =3D "multilib:lib32"
>>> DEFAULTTUNE_virtclass-multilib-lib32 =3D "x86"
>>> PACKAGE_CLASSES ?=3D "package_deb"
>>> EXTRA_IMAGE_FEATURES =3D "debug-tweaks package-management"
>>>
>>> Kind regards,
>>>         alimon
>>>
>>>
>>> On 12/15/2015 01:28 PM, Matt Madison wrote:
>>>> On Tue, Dec 15, 2015 at 9:29 AM, An=C3=ADbal Lim=C3=B3n
>>>> <anibal.limon@linux.intel.com> wrote:
>>>>> Hi Matt,
>>>>>
>>>>> I'm starting to look at your patches, in what arches/combinations you
>>>>> test the patches?
>>>>
>>>> I've been working on a BSP layer for the jetson-tx1, which is
>>>> aarch64/armv7a-hf, so that's what I've been testing with.  The BSP
>>>> defs are in https://github.com/madisongh/meta-tegra.
>>>>
>>>> Thanks,
>>>> -Matt
>>>>
>>>>
>>>>>
>>>>> Kind regards,
>>>>>         alimon
>>>>>
>>>>>
>>>>> On 12/06/2015 11:25 AM, Matt Madison wrote:
>>>>>> I ran into sevearl issues while trying to build an ARM multilib root=
fs
>>>>>> using Debian packaging.  After several go-rounds, it looked like the
>>>>>> cleanest solution was to tweak how DPKG_ARCH gets constructed and
>>>>>> to have the DpkgPM class in oe/package_manager.py use that variable
>>>>>> to locate multilib variants (similar to RpmPM).  I also took the
>>>>>> liberty of expanding the Debian architecture mappings so the names
>>>>>> align better with what's documented on the Debian wiki, for those
>>>>>> cases where a direct mapping is possible.
>>>>>>
>>>>>> Matt Madison (2):
>>>>>>   package_deb.bbclass, cross-canadian.bbclass: DPKG_ARCH mapping
>>>>>>     function
>>>>>>   package_manager.py: fixes for multilib deb packaging builds
>>>>>>
>>>>>>  meta/classes/cross-canadian.bbclass |  2 +-
>>>>>>  meta/classes/package_deb.bbclass    | 35 +++++++++++++++++++++++++-=
---------
>>>>>>  meta/lib/oe/package_manager.py      | 17 +++++++++++------
>>>>>>  3 files changed, 37 insertions(+), 17 deletions(-)
>>>>>>

