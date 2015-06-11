Return-Path: <andrea.adami@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 61B2672491
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 07:50:31 +0000 (UTC)
Received: by igblz2 with SMTP id lz2so1175199igb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 00:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=sLcd1RIJ0nT+9iQfAIpY1TsSct/+4Bceq1Hl1uvqZVk=;
	b=PZr2rOIvyT02iNSSJuTWKwJ4o9iaQbW9WBl18Pc9yIzBu4F29cM68sQttInz8QA8Ju
	2rb8RJsRWaAOtOsJFMT3mSNfpOlCfJXvU92JJXcBUBsswNJDEaSpalZmV/vwqUshdezs
	y2j0Cmidan01Pv8oduePorFPUCl9T0rrBcYtPxz8C7W26YXRx3Inz2BtDj5XhmJSTk+x
	YQqGpfdBWakWa1LeTMrLG+0qx5tCx2vDLF84Fmfkmw3qBylwKTJmb3aKVwS8UriWjSep
	CLyOAjAjXNXIuoR3QTeKW/PPW8anTaD8xfOa7yYQObKs2qEZ6fCMBRhZ35vN45ogYOIq
	GFVw==
MIME-Version: 1.0
X-Received: by 10.50.79.196 with SMTP id l4mr33402668igx.48.1434009033090;
	Thu, 11 Jun 2015 00:50:33 -0700 (PDT)
Received: by 10.36.19.3 with HTTP; Thu, 11 Jun 2015 00:50:32 -0700 (PDT)
In-Reply-To: <55792352.8060505@topic.nl>
References: <55641868.1080406@topic.nl>
	<CADkTA4NaTjRoydVSh63HB6QgvSnQis-z9RnaYZkT3Ng1cm1bWg@mail.gmail.com>
	<55641D0C.5020408@topic.nl> <55642019.3060305@topic.nl>
	<55642B75.8050909@topic.nl> <55642EFB.4070102@topic.nl>
	<CAAQYJAvzu1Jb76SgenWQPhs=9N_+aqqUece_hBhs-8_6nMbojg@mail.gmail.com>
	<556436D1.80906@topic.nl> <5579207E.1050506@topic.nl>
	<55792352.8060505@topic.nl>
Date: Thu, 11 Jun 2015 09:50:32 +0200
Message-ID: <CAAQYJAsjx81yCRUJ3Af8uBg=JL5ZstX_g3Td+kK93dVH2GGJjA@mail.gmail.com>
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
X-List-Received-Date: Thu, 11 Jun 2015 07:50:32 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 11, 2015 at 7:57 AM, Mike Looijmans <mike.looijmans@topic.nl> wrote:
> On 11-06-15 07:45, Mike Looijmans wrote:
>>
>> On 26-05-15 11:03, Mike Looijmans wrote:
>>>
>>> On 26-05-15 10:40, Andrea Adami wrote:
>>>>
>>>> On Tue, May 26, 2015 at 10:29 AM, Mike Looijmans
>>>> <mike.looijmans@topic.nl> wrote:
>>>>>
>>>>> On 26-05-15 10:14, Mike Looijmans wrote:
>>>>>>
>>>>>>
>>>>>> On 26-05-15 09:26, Mike Looijmans wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 26-05-15 09:13, Mike Looijmans wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 26-05-15 09:02, Bruce Ashfield wrote:
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> On Tue, May 26, 2015 at 2:53 AM, Mike Looijmans
>>>>>>>>> <mike.looijmans@topic.nl>
>>>>>>>>> wrote:
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> I get this when running
>>>>>>>>>> bitbake -c menuconfig virtual/kernel
>>>>>>>>>>
>>>>>>>>>> scripts/kconfig/mconf.o: In function `show_help':
>>>>>>>>>> mconf.c:(.text+0x884): undefined reference to `stdscr'
>>>>>>>>>> scripts/kconfig/lxdialog/checklist.o: In function `print_arrows':
>>>>>>>>>> checklist.c:(.text+0x2c): undefined reference to `wmove'
>>>>>>>>>> checklist.c:(.text+0x4c): undefined reference to `acs_map'
>>>>>>>>>> checklist.c:(.text+0x54): undefined reference to `waddch'
>>>>>>>>>> checklist.c:(.text+0x66): undefined reference to `waddnstr'
>>>>>>>>>> checklist.c:(.text+0x76): undefined reference to `wmove'
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> This has popped up on and off for several years now, and we have
>>>>>>>>> a few
>>>>>>>>> bugzilla
>>>>>>>>> entries that track it. The fix is never as simple as we would like.
>>>>>>>>>
>>>>>>>>> The most recent version is here:
>>>>>>>>>
>>>>>>>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=7609
>>>>>>>>>
>>>>>>>>> If you have more details about your enviroment, adding them to
>>>>>>>>> that bug
>>>>>>>>> would
>>>>>>>>> be idea.
>>>>>>>>>
>>>>>>>>> The problem with using the -native version, or the host, is that at
>>>>>>>>> times
>>>>>>>>> menu
>>>>>>>>> config is rendered unusable. The fix isn't only in the
>>>>>>>>> dependencies,
>>>>>>>>> but in
>>>>>>>>> the
>>>>>>>>> way that menuconfig is build within the kernel environment.
>>>>>>>>>
>>>>>>>>> This older bug tracks the details of that:
>>>>>>>>>
>>>>>>>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3898
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>> I have an Ubuntu 14 system. The weird thing is, that I have several
>>>>>>>> almost
>>>>>>>> identical machines, and some of them fail and some don't.
>>>>>>>>
>>>>>>>> This one works fine:
>>>>>>>> MACHINE=topic-miami-florida-med-xc7z030
>>>>>>>>
>>>>>>>> This one fails:
>>>>>>>> MACHINE=topic-miami-florida-gen-xc7z030
>>>>>>>>
>>>>>>>> They all use the same kernel recipe, version, git tag, etc. These
>>>>>>>> two
>>>>>>>> even
>>>>>>>> share the very same defconfig. Their builds run within the same OE
>>>>>>>> environment, so the native sysroot for both is the same too!
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> I output "bitbake -c menuconfig virtual/kernel -e" for both
>>>>>>> machines into
>>>>>>> two
>>>>>>> files, then did a find/replace "med" with "gen", and then looked
>>>>>>> the the
>>>>>>> differences with meld. Both machines use the same environments all
>>>>>>> over,
>>>>>>> only
>>>>>>> differences are time stamps and task checksums.
>>>>>>>
>>>>>>> Next I'm gonna try the old "remove tmp" trick.
>>>>>>
>>>>>>
>>>> I was there, it will fail (Ubuntu 14.04 fwiw).
>>>>
>>>>>>
>>>>>> Removing tmp did not help either. Forcibly rebuilding ncurses-native
>>>>>> also
>>>>>> did
>>>>>> not help.
>>>>
>>>>
>>>> Yes, as strange as it is, you need to bitbake ncurses.
>>>
>>>
>>> Wow, indeed, "bitbake ncurses -c populate_sysroot -f" made the
>>> menuconfig work again.
>>>
>>> Looks like ncurses "fixes" something that ncurses-native broke.
>>
>>
>> Waaah. I just got this very same problem back, but whatever I try, I
>> can't get it to work properly again using the above workaround.
>
>
> The only horrible hack that got menuconfig working again was to install
> ncurses-dev on the build host.
>
>
> --
> Mike Looijmans

I see the common point here is Ubuntu 14.x.
This never happens on my old Gentoo buildhost, where you don't have
the split with -dev packages.

Neverthless, reading the comments in the Yocto bugzilla it looks like
the kernel could be the culprit.
I'll try to debug that once 4.1 is out.

Cheers

Andrea

