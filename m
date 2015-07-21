Return-Path: <dbaryshkov@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id B0066734B8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jul 2015 08:23:14 +0000 (UTC)
Received: by iggf3 with SMTP id f3so101295825igg.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jul 2015 01:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=1qbf8BbYjFODQedXFxq4HJeDEHguS8LSP5B3/Z9mh/0=;
	b=iNOHNujJ44piGQWhZ+dqRJxuny474EwcVU7IDg/oFDY0X5cBK5eci3kEL1J1lAx/fV
	BP5/+OfbrQNs7N9nASH7qRHdCEIo3NynRJuoeLFEBcencTMe1WH1hPy77BUVsZ9lp+AP
	Mcy+d+hje8wzlf7c/EjCHOQMoVlpmTzGxJJTASQzjgGxblJ5JrMY7iSl5LxbKHxDoSCN
	izxdEfgFmQPkINw0henviIxV3f+JXhbwPTb1ukT1qSfcGF2ZfcZ104VKDcN5qXmZaT/s
	3Q9sVuFvnu5dBBw7WcJJ1nSP/vLFsU3XaZyHrozdZ3S+gyqEas8O9raOO2Eih1GfDrv8
	iudg==
MIME-Version: 1.0
X-Received: by 10.107.134.96 with SMTP id i93mr43535533iod.139.1437466995143; 
	Tue, 21 Jul 2015 01:23:15 -0700 (PDT)
Received: by 10.64.122.193 with HTTP; Tue, 21 Jul 2015 01:23:15 -0700 (PDT)
In-Reply-To: <55AD1800.20706@windriver.com>
References: <1435759342-5312-1-git-send-email-dbaryshkov@gmail.com>
	<CALT56yP2_bkOfesazULteWL73DuBKo-BMu0MPxHw-FUz79997g@mail.gmail.com>
	<559D1AD2.3050305@windriver.com>
	<CALT56yMhBodVKpG9Pe8zzUcHiwanmxn8pUEqdJUU14-ry6DBvg@mail.gmail.com>
	<55AD1800.20706@windriver.com>
Date: Tue, 21 Jul 2015 11:23:15 +0300
Message-ID: <CALT56yO0nwxie_DAubO+LZqMYjaY-eUoF1iG2Cy6KoMAg4nuaA@mail.gmail.com>
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Fix builds for MIPS64 N32
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
X-List-Received-Date: Tue, 21 Jul 2015 08:23:20 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

2015-07-20 18:47 GMT+03:00 Mark Hatle <mark.hatle@windriver.com>:
> Between customer escalations, other work and vacation.. I didn't happen.

No problem, really. I just wanted to be sure that the patches aren't going
to be lost.

>
> I've started testing it this morning and should have results tomorrow.. (US time).

Thank you very much!

>
> --Mark
>
> On 7/20/15 7:11 AM, Dmitry Eremin-Solenikov wrote:
>> 2015-07-08 15:42 GMT+03:00 Mark Hatle <mark.hatle@windriver.com>:
>>> On 7/8/15 7:00 AM, Dmitry Eremin-Solenikov wrote:
>>>> Hello,
>>>>
>>>> 2015-07-01 17:02 GMT+03:00 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>:
>>>>> Quite simple configuration (MIPS64 N32 image) fails to build (see below).
>>>>> I have verified these patches in both single lib and in multilib cases.
>>>>> Tri-lib images and SDK for MIPS build fine with these patches.
>>>>
>>>> Any comments on this patchset? It would be nice to have N32 ubroken in
>>>> the current
>>>> master tree.
>>>
>>> Sorry, I'm traveling right now and haven't had time to review this.  I should be
>>> able to get back to the office and test it by the end of the week.
>>>
>>> I visually reviewed the patches and I don't object to them going in -- but I'm
>>> still not sure they are all correct.
>>
>> Re-ping. I'd like to receive a confirmation from you (and thus get the
>> patches merged)
>> or to discuss, what seems wrong to you.
>>
>>>
>>> --Mark
>>>
>>>>>
>>>>> Current situation:
>>>>>
>>>>> lumag@nexs:~/OE$ MACHINE=qemumips64n32 bitbake core-image-base
>>>>> NOTE: Started PRServer with DBfile:
>>>>> /home/lumag/OE/cache/prserv.sqlite3, IP: 127.0.0.1, PORT: 46391, PID:
>>>>> 15895
>>>>> Loading cache: 100%
>>>>> |########################################################################################################################|
>>>>> ETA:  00:00:00
>>>>> Loaded 1302 entries from dependency cache.
>>>>> NOTE: Resolving any missing task queue dependencies
>>>>> ERROR: Nothing RPROVIDES 'binutils-cross-canadian-mips64' (but
>>>>> /home/lumag/OE/sources/openembedded-core/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
>>>>> RDEPENDS on or otherwise requires it)
>>>>> NOTE: Runtime target 'binutils-cross-canadian-mips64' is unbuildable,
>>>>> removing...
>>>>> Missing or unbuildable dependency chain was: ['binutils-cross-canadian-mips64']
>>>>> NOTE: Runtime target 'packagegroup-cross-canadian-qemumips64n32' is
>>>>> unbuildable, removing...
>>>>> Missing or unbuildable dependency chain was:
>>>>> ['packagegroup-cross-canadian-qemumips64n32',
>>>>> 'binutils-cross-canadian-mips64']
>>>>> ERROR: Required build target 'core-image-base' has no buildable providers.
>>>>> Missing or unbuildable dependency chain was: ['core-image-base',
>>>>> 'packagegroup-cross-canadian-qemumips64n32',
>>>>> 'binutils-cross-canadian-mips64']
>>>>>
>>>>
>>>>
>>>>
>>>
>>
>>
>>
>



-- 
With best wishes
Dmitry

