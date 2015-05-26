Return-Path: <andrea.adami@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id C043C65D6E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 May 2015 08:40:27 +0000 (UTC)
Received: by igcau1 with SMTP id au1so47945874igc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 May 2015 01:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=WIO5tlvvVuc44227HH4xSuONhTDt1yXzEMyuQrGwEHk=;
	b=zIONT2z4dtutHCdC1bxJGqllEpCVIGg3NAF5NS+BMJy386dJidt1YgnayovrsVrt18
	BnlSBFwnw7BZMq8ViqKahjlIkqLQtdPKhnkqSLkj+xkiQnEekoS737o+N5ugpu8ZVk3m
	Hh69dSbzZxnu/HTJxo5VWxy/TDJokq9XYjV3mru98ChaIWy63bUcIKTanW9cH5O+eIOs
	eYmpvHHJLwPhLGNRK9dHkOGwBCB+IlY5FkZ2VpljzY+AtIhyJnAePgeWexz45Tmk//b4
	qQNHHxLHvlVT+RBk7AGrz5hKbpwMoWz8yq+aACmVZ6S1OJZPW7k3zcYUfPZhrfeX+UJI
	KC6A==
MIME-Version: 1.0
X-Received: by 10.107.15.149 with SMTP id 21mr29207917iop.44.1432629628110;
	Tue, 26 May 2015 01:40:28 -0700 (PDT)
Received: by 10.36.3.206 with HTTP; Tue, 26 May 2015 01:40:28 -0700 (PDT)
In-Reply-To: <55642EFB.4070102@topic.nl>
References: <55641868.1080406@topic.nl>
	<CADkTA4NaTjRoydVSh63HB6QgvSnQis-z9RnaYZkT3Ng1cm1bWg@mail.gmail.com>
	<55641D0C.5020408@topic.nl> <55642019.3060305@topic.nl>
	<55642B75.8050909@topic.nl> <55642EFB.4070102@topic.nl>
Date: Tue, 26 May 2015 10:40:28 +0200
Message-ID: <CAAQYJAvzu1Jb76SgenWQPhs=9N_+aqqUece_hBhs-8_6nMbojg@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: "bitbake -c menuconfig virtual/kernel" fails on ncurses dependency
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
X-List-Received-Date: Tue, 26 May 2015 08:40:29 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 26, 2015 at 10:29 AM, Mike Looijmans
<mike.looijmans@topic.nl> wrote:
> On 26-05-15 10:14, Mike Looijmans wrote:
>>
>> On 26-05-15 09:26, Mike Looijmans wrote:
>>>
>>> On 26-05-15 09:13, Mike Looijmans wrote:
>>>>
>>>> On 26-05-15 09:02, Bruce Ashfield wrote:
>>>>>
>>>>> On Tue, May 26, 2015 at 2:53 AM, Mike Looijmans
>>>>> <mike.looijmans@topic.nl>
>>>>> wrote:
>>>>>>
>>>>>> I get this when running
>>>>>> bitbake -c menuconfig virtual/kernel
>>>>>>
>>>>>> scripts/kconfig/mconf.o: In function `show_help':
>>>>>> mconf.c:(.text+0x884): undefined reference to `stdscr'
>>>>>> scripts/kconfig/lxdialog/checklist.o: In function `print_arrows':
>>>>>> checklist.c:(.text+0x2c): undefined reference to `wmove'
>>>>>> checklist.c:(.text+0x4c): undefined reference to `acs_map'
>>>>>> checklist.c:(.text+0x54): undefined reference to `waddch'
>>>>>> checklist.c:(.text+0x66): undefined reference to `waddnstr'
>>>>>> checklist.c:(.text+0x76): undefined reference to `wmove'
>>>>>
>>>>>
>>>>> This has popped up on and off for several years now, and we have a few
>>>>> bugzilla
>>>>> entries that track it. The fix is never as simple as we would like.
>>>>>
>>>>> The most recent version is here:
>>>>>
>>>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=7609
>>>>>
>>>>> If you have more details about your enviroment, adding them to that bug
>>>>> would
>>>>> be idea.
>>>>>
>>>>> The problem with using the -native version, or the host, is that at
>>>>> times
>>>>> menu
>>>>> config is rendered unusable. The fix isn't only in the dependencies,
>>>>> but in
>>>>> the
>>>>> way that menuconfig is build within the kernel environment.
>>>>>
>>>>> This older bug tracks the details of that:
>>>>>
>>>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3898
>>>>
>>>>
>>>> I have an Ubuntu 14 system. The weird thing is, that I have several
>>>> almost
>>>> identical machines, and some of them fail and some don't.
>>>>
>>>> This one works fine:
>>>> MACHINE=topic-miami-florida-med-xc7z030
>>>>
>>>> This one fails:
>>>> MACHINE=topic-miami-florida-gen-xc7z030
>>>>
>>>> They all use the same kernel recipe, version, git tag, etc. These two
>>>> even
>>>> share the very same defconfig. Their builds run within the same OE
>>>> environment, so the native sysroot for both is the same too!
>>>
>>>
>>> I output "bitbake -c menuconfig virtual/kernel -e" for both machines into
>>> two
>>> files, then did a find/replace "med" with "gen", and then looked the the
>>> differences with meld. Both machines use the same environments all over,
>>> only
>>> differences are time stamps and task checksums.
>>>
>>> Next I'm gonna try the old "remove tmp" trick.
>>
I was there, it will fail (Ubuntu 14.04 fwiw).

>>
>> Removing tmp did not help either. Forcibly rebuilding ncurses-native also
>> did
>> not help.

Yes, as strange as it is, you need to bitbake ncurses.

>>
>> I'm now trying a complete clean start with current master branches...
>
>
> Okay, that made things consistent again. Now all machines fail.
>

This little bug is very nasty and I've always postponed a deeper
analysis because of other evil issues with the linux kernel taking all
my little time :).


Cheers
Andrea

>
>
>
>
> Kind regards,
>
> Mike Looijmans
> System Expert
>
> TOPIC Embedded Products
> Eindhovenseweg 32-C, NL-5683 KH Best
> Postbus 440, NL-5680 AK Best
> Telefoon: +31 (0) 499 33 69 79
> Telefax: +31 (0) 499 33 69 70
> E-mail: mike.looijmans@topicproducts.com
> Website: www.topicproducts.com
>
> Please consider the environment before printing this e-mail
>
>
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

