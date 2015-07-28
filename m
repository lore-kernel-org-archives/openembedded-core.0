Return-Path: <dbaryshkov@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 878E3763FD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 17:26:43 +0000 (UTC)
Received: by igbij6 with SMTP id ij6so125765906igb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 10:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=4J5aeWKp+iOmqt3x6N/SQd6pMSqrx5mrU8zK2b9752g=;
	b=vVLPDDPgDRcjC9LudfmWhkvTxhJhfNMqLZAvjtjoZ4l5Q5AImHzJjrK7QTYYrDI2Ke
	cGO0sclJ/3KqZMRlwecP7sgjdgB/gNUek0D4GRG7mjBQWqLnD8yHlR+kId6NY45eVmph
	j0PrIuZERIVpzcF1BfhBwko3u0hNWNZkG+wwlbwG7N0JUoN8KXgV2WsHhBHng7Z7/Mc1
	cYSC14qB5fHaQjHLVFctbRPA1KcsyogQ41Bsyv/xx8jMj7s2XeYHItHGbRiWSTpukyWb
	Oky+lmdvUQv4oXkIuhzYrY1aKlczjycJjLoLu0nkunvmzJyQTN+H4jMEsS9x8Cx7CbfH
	UF7w==
MIME-Version: 1.0
X-Received: by 10.107.134.96 with SMTP id i93mr56182168iod.139.1438104402120; 
	Tue, 28 Jul 2015 10:26:42 -0700 (PDT)
Received: by 10.64.122.193 with HTTP; Tue, 28 Jul 2015 10:26:42 -0700 (PDT)
In-Reply-To: <55AE64AD.8060406@windriver.com>
References: <1435759342-5312-1-git-send-email-dbaryshkov@gmail.com>
	<CALT56yP2_bkOfesazULteWL73DuBKo-BMu0MPxHw-FUz79997g@mail.gmail.com>
	<559D1AD2.3050305@windriver.com>
	<CALT56yMhBodVKpG9Pe8zzUcHiwanmxn8pUEqdJUU14-ry6DBvg@mail.gmail.com>
	<55AD1800.20706@windriver.com>
	<CALT56yO0nwxie_DAubO+LZqMYjaY-eUoF1iG2Cy6KoMAg4nuaA@mail.gmail.com>
	<55AE57D8.3040205@windriver.com> <55AE64AD.8060406@windriver.com>
Date: Tue, 28 Jul 2015 20:26:42 +0300
Message-ID: <CALT56yPYUe7J2rx4NSy29B2YOtRepH2k+VsZ+JTa6k6f5RA=YQ@mail.gmail.com>
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
X-List-Received-Date: Tue, 28 Jul 2015 17:26:49 -0000
Content-Type: text/plain; charset=UTF-8

2015-07-21 18:26 GMT+03:00 Mark Hatle <mark.hatle@windriver.com>:
> On 7/21/15 9:31 AM, Mark Hatle wrote:
>> On 7/21/15 3:23 AM, Dmitry Eremin-Solenikov wrote:
>>> Hello,
>>>
>>> 2015-07-20 18:47 GMT+03:00 Mark Hatle <mark.hatle@windriver.com>:
>>>> Between customer escalations, other work and vacation.. I didn't happen.
>>>
>>> No problem, really. I just wanted to be sure that the patches aren't going
>>> to be lost.
>>>
>>>>
>>>> I've started testing it this morning and should have results tomorrow.. (US time).
>>>
>>> Thank you very much!
>>
>> With master and the four patches I got an error trying to construct the SDK.
>>
>> I'm still investigating the error:
>>
>> Collected errors:
>>  * satisfy_dependencies_for: Cannot satisfy the following dependencies for
>> packagegroup-cross-canadian-qemumips64:
>>  *      gcc-cross-canadian-mips *       binutils-cross-canadian-mips *
>> gdb-cross-canadian-mips *
>>  * opkg_install_cmd: Cannot install package packagegroup-cross-canadian-qemumips64.
>>
>>
>> My configuration for this particular test was:
>>
>> (oe-init-build-env stock w/ the following changes)
>
> I've narrowed down the reproducer to just:
>
> MACHINE = "qemumips64"
> require conf/multilib.conf
> DEFAULTTUNE = "mips64-n32"
> MULTILIBS = ""
>
> (If you remove the require conf/multilib.conf then things work.)
>
> I'm going to continue to investigate.

Any progress on your side? As I failed to reproduce the issue on my side,
could you please specify:
1) what is the exact bitbake command that failed?
2) what additional layers do you have enabled in your build?
3) is it a cleanroom build, or you have an sstate cache populated with previous
   build results?
4) any additional information that I can use to reproduce the issue on my side?

>
> --Mark
>
>> MACHINE = "qemumips64"
>>
>> require conf/multilib.conf
>> DEFAULTTUNE = "mips64-n32"
>> MULTILIBS = "multilib:lib64 multilib:lib32"
>> DEFAULTTUNE_virtclass-multilib-lib64 = "mips64"
>> DEFAULTTUNE_virtclass-multilib-lib32 = "mips32r2"
>>
>> # Set RPM_PREFER_ELF_ARCH to configure preferred ABI when using rpm packaging
>> # backend to generate a rootfs, choices are:
>> # 1: ELF32 wins
>> # 2: ELF64 wins
>> # 4: ELF64 N32 wins (for mips64 or mips64el only)
>> RPM_PREFER_ELF_ARCH = "4"
>>
>>
>>>>
>>>> --Mark
>>>>
>>>> On 7/20/15 7:11 AM, Dmitry Eremin-Solenikov wrote:
>>>>> 2015-07-08 15:42 GMT+03:00 Mark Hatle <mark.hatle@windriver.com>:
>>>>>> On 7/8/15 7:00 AM, Dmitry Eremin-Solenikov wrote:
>>>>>>> Hello,
>>>>>>>
>>>>>>> 2015-07-01 17:02 GMT+03:00 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>:
>>>>>>>> Quite simple configuration (MIPS64 N32 image) fails to build (see below).
>>>>>>>> I have verified these patches in both single lib and in multilib cases.
>>>>>>>> Tri-lib images and SDK for MIPS build fine with these patches.
>>>>>>>
>>>>>>> Any comments on this patchset? It would be nice to have N32 ubroken in
>>>>>>> the current
>>>>>>> master tree.
>>>>>>
>>>>>> Sorry, I'm traveling right now and haven't had time to review this.  I should be
>>>>>> able to get back to the office and test it by the end of the week.
>>>>>>
>>>>>> I visually reviewed the patches and I don't object to them going in -- but I'm
>>>>>> still not sure they are all correct.
>>>>>
>>>>> Re-ping. I'd like to receive a confirmation from you (and thus get the
>>>>> patches merged)
>>>>> or to discuss, what seems wrong to you.
>>>>>
>>>>>>
>>>>>> --Mark
>>>>>>
>>>>>>>>
>>>>>>>> Current situation:
>>>>>>>>
>>>>>>>> lumag@nexs:~/OE$ MACHINE=qemumips64n32 bitbake core-image-base
>>>>>>>> NOTE: Started PRServer with DBfile:
>>>>>>>> /home/lumag/OE/cache/prserv.sqlite3, IP: 127.0.0.1, PORT: 46391, PID:
>>>>>>>> 15895
>>>>>>>> Loading cache: 100%
>>>>>>>> |########################################################################################################################|
>>>>>>>> ETA:  00:00:00
>>>>>>>> Loaded 1302 entries from dependency cache.
>>>>>>>> NOTE: Resolving any missing task queue dependencies
>>>>>>>> ERROR: Nothing RPROVIDES 'binutils-cross-canadian-mips64' (but
>>>>>>>> /home/lumag/OE/sources/openembedded-core/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
>>>>>>>> RDEPENDS on or otherwise requires it)
>>>>>>>> NOTE: Runtime target 'binutils-cross-canadian-mips64' is unbuildable,
>>>>>>>> removing...
>>>>>>>> Missing or unbuildable dependency chain was: ['binutils-cross-canadian-mips64']
>>>>>>>> NOTE: Runtime target 'packagegroup-cross-canadian-qemumips64n32' is
>>>>>>>> unbuildable, removing...
>>>>>>>> Missing or unbuildable dependency chain was:
>>>>>>>> ['packagegroup-cross-canadian-qemumips64n32',
>>>>>>>> 'binutils-cross-canadian-mips64']
>>>>>>>> ERROR: Required build target 'core-image-base' has no buildable providers.
>>>>>>>> Missing or unbuildable dependency chain was: ['core-image-base',
>>>>>>>> 'packagegroup-cross-canadian-qemumips64n32',
>>>>>>>> 'binutils-cross-canadian-mips64']
>>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>
>>>>>
>>>>>
>>>>>
>>>>
>>>
>>>
>>>
>>
>



-- 
With best wishes
Dmitry

