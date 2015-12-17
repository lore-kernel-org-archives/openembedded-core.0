Return-Path: <matt@madison.systems>
Received: from mail-lb0-f173.google.com (mail-lb0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id EDB2F6FFA4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 20:23:52 +0000 (UTC)
Received: by mail-lb0-f173.google.com with SMTP id u9so51791477lbp.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 12:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=Ul8PJ2I8J3yeAq+1zd3NKsTWqleTzOu6q6v/dIrbFXc=;
	b=tnA7Tx2JTfQFGVtxcKjNuV+cgodu6Vot9EX+QNTT7GQk9vu3eqwRjrfrPZ4lyvusqw
	2HKIQ6dFYfAWxo76qEMU0C6rXlg9dlFMcF9m8MjgpWORD2Q3uOeFJr6nPty5fZqO8t3z
	1oOl7VALmvETGyMUS0ZCHHncCWidlTi5peI5utUKFLT9KbUt0r3oP4tePvb5B0keyVxd
	6rC2bwS9g991Aij8n+RTanAHKrazwZdc8DuE6A1srGW0w+59URBCwFFtMxeE/PT+aoTm
	QD1F01UdTRA2i2fKCo4xOXh/xCTPjafc5/aXBKSfIRdBCUZlLzK4WZJEk78JieD6FmJx
	kvIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=Ul8PJ2I8J3yeAq+1zd3NKsTWqleTzOu6q6v/dIrbFXc=;
	b=MOB/h3B2l4m3UJtaqmGwU3zgl+mgFMpXWtK4veWfQgUF9hne5YixiH1gReMfWmaJd3
	rAznUlXDW9loSqVoEvIQHIPTsZsTTpPwJ9Ema4sGMlkMQkN+MBIGCutDlcc/DOzXFpDg
	bFJdZYSzTMf/YCwy9N6hECg4NTEvkDRGua2BHES+pFfJiA+lgyjBbaU/F9jdNHZv+KWC
	B05qDkQ4ka7lAfLpdn+wQkg5Ip9U3B7i0Bf0BLpCgydqWkbGL/rmSPiCmmFTWRXA51yL
	2Umt/AGhbV5dbhx66DtoNSKjIsoTLs1jdI/ihRwgeuZPRIVVk15DYl9sIxSbcznlMkAy
	wu5Q==
X-Gm-Message-State: ALoCoQlD5MduI6HOlXWDKU4ZSvh2JOBadF9r6sKqMsUxdfqbhzF3XBSesQmL8olBtHKNjnaWXYTurYyw14ZoyFBhwAesqIphoQ==
MIME-Version: 1.0
X-Received: by 10.112.137.101 with SMTP id qh5mr21703590lbb.81.1450383832241; 
	Thu, 17 Dec 2015 12:23:52 -0800 (PST)
Received: by 10.25.145.200 with HTTP; Thu, 17 Dec 2015 12:23:52 -0800 (PST)
In-Reply-To: <CAGgRHJraSNBEhr8gmAebSc3QCNHS2ZE1wwd6kru4vCzY5Gpn9A@mail.gmail.com>
References: <1449422732-12975-1-git-send-email-matt@madison.systems>
	<56704DFF.9070804@linux.intel.com>
	<CAGgRHJqibg_vCYzFp_nQktE4kEcMYe1SMWrz=UH0Up0Q2vuXmg@mail.gmail.com>
	<567092CA.2040600@linux.intel.com>
	<CAGgRHJptKNTkhDi5s9F1S821PG5apBDtW4mG7anGqA84m5d7kw@mail.gmail.com>
	<56718862.80803@linux.intel.com>
	<CAGgRHJraSNBEhr8gmAebSc3QCNHS2ZE1wwd6kru4vCzY5Gpn9A@mail.gmail.com>
Date: Thu, 17 Dec 2015 12:23:52 -0800
Message-ID: <CAGgRHJpnrrY-472dkdoYeMBWLFF5dJ=aKak9J6EFLTH5w5LsSA@mail.gmail.com>
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
X-List-Received-Date: Thu, 17 Dec 2015 20:23:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Anibal,

After studying the Debian multi-arch wiki pages, I think I've figured
out the right answer to this.  Testing now, will send out a V2 patch
series when done.

-Matt

On Wed, Dec 16, 2015 at 8:33 AM, Matt Madison <matt@madison.systems> wrote:
> On Wed, Dec 16, 2015 at 7:50 AM, An=C3=ADbal Lim=C3=B3n
> <anibal.limon@linux.intel.com> wrote:
>> Hi Matt,
>>
>> I tried to do again without your patches and the problem appears, seems
>> to be an older problem.
>
> Thanks, I suspected as much and was going to try that myself.  I was
> able to work around the issue manually in a devshell by using apt-get
> -f to have it "fix" the dependencies it thinks were broken, which from
> what I've seen so far, stems from trying to install 32-bit packages
> that would overwrite files installed by their 64-bit counterparts.
> I'm just not sure that's the right solution to the problem.
>
> -Matt
>
>
>>
>> Regards,
>>         alimon
>>
>> On 12/16/2015 07:31 AM, Matt Madison wrote:
>>> On Tue, Dec 15, 2015 at 2:23 PM, An=C3=ADbal Lim=C3=B3n
>>> <anibal.limon@linux.intel.com> wrote:
>>>> Hi Matt,
>>>>
>>>> Trying to build core-image-sato with qemux86-64 and multilib enabled a=
n
>>>> errors appear (see attached log), next the config.
>>>
>>> OK, yep, I can reproduce this.  I'll investigate further.
>>>
>>> Thanks,
>>> -Matt
>>>
>>>
>>>>
>>>> MACHINE ??=3D "qemux86-64"
>>>>
>>>> IMAGE_INSTALL_append =3D " lib32-connman"
>>>> require conf/multilib.conf
>>>> MULTILIBS =3D "multilib:lib32"
>>>> DEFAULTTUNE_virtclass-multilib-lib32 =3D "x86"
>>>> PACKAGE_CLASSES ?=3D "package_deb"
>>>> EXTRA_IMAGE_FEATURES =3D "debug-tweaks package-management"
>>>>
>>>> Kind regards,
>>>>         alimon
>>>>
>>>>
>>>> On 12/15/2015 01:28 PM, Matt Madison wrote:
>>>>> On Tue, Dec 15, 2015 at 9:29 AM, An=C3=ADbal Lim=C3=B3n
>>>>> <anibal.limon@linux.intel.com> wrote:
>>>>>> Hi Matt,
>>>>>>
>>>>>> I'm starting to look at your patches, in what arches/combinations yo=
u
>>>>>> test the patches?
>>>>>
>>>>> I've been working on a BSP layer for the jetson-tx1, which is
>>>>> aarch64/armv7a-hf, so that's what I've been testing with.  The BSP
>>>>> defs are in https://github.com/madisongh/meta-tegra.
>>>>>
>>>>> Thanks,
>>>>> -Matt
>>>>>
>>>>>
>>>>>>
>>>>>> Kind regards,
>>>>>>         alimon
>>>>>>
>>>>>>
>>>>>> On 12/06/2015 11:25 AM, Matt Madison wrote:
>>>>>>> I ran into sevearl issues while trying to build an ARM multilib roo=
tfs
>>>>>>> using Debian packaging.  After several go-rounds, it looked like th=
e
>>>>>>> cleanest solution was to tweak how DPKG_ARCH gets constructed and
>>>>>>> to have the DpkgPM class in oe/package_manager.py use that variable
>>>>>>> to locate multilib variants (similar to RpmPM).  I also took the
>>>>>>> liberty of expanding the Debian architecture mappings so the names
>>>>>>> align better with what's documented on the Debian wiki, for those
>>>>>>> cases where a direct mapping is possible.
>>>>>>>
>>>>>>> Matt Madison (2):
>>>>>>>   package_deb.bbclass, cross-canadian.bbclass: DPKG_ARCH mapping
>>>>>>>     function
>>>>>>>   package_manager.py: fixes for multilib deb packaging builds
>>>>>>>
>>>>>>>  meta/classes/cross-canadian.bbclass |  2 +-
>>>>>>>  meta/classes/package_deb.bbclass    | 35 +++++++++++++++++++++++++=
----------
>>>>>>>  meta/lib/oe/package_manager.py      | 17 +++++++++++------
>>>>>>>  3 files changed, 37 insertions(+), 17 deletions(-)
>>>>>>>

