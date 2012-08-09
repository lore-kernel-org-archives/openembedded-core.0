Received: from mail-qa0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1SzYkL-0003id-I0
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Aug 2012 21:50:17 +0200
Received: by qaat11 with SMTP id t11so646306qaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Aug 2012 12:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=IKdPQXwU7amihJofUpyCfGJv2eEeuBf2hqReL92pj3g=;
	b=gUtqFyUwClmrrFPjxt3Nl/D/5VMnU0l3wgGK71WzMLAVF97BUeyZZM0K3DjzmkLIIl
	mPNbN28Cu4w2tr3LGxQsnA8OuMTn7VEb98KGSXR1j7IOSZdUVYospZ/sKQ59xNy20eYO
	Ocb8VEGApU0k2aoXDzIOvHqGAbV5/1cMxmLRYXcssDZCZMSyWdURnwCbKMXBBUFSmY4h
	ekdT3mVJexFHWcicEniEgsYeNsABDEN/FtC7T1mFw6OERZsN7JmTVQogySnA3aDj3lbh
	sl4YARE/+V5q5nFTuOzDdryo+BMy+/Q7GwDx9TUexWDqKCVwQqSYV3XNANm/CrF1CB6+
	PLgg==
MIME-Version: 1.0
Received: by 10.229.105.100 with SMTP id s36mr212803qco.88.1344541108403; Thu,
	09 Aug 2012 12:38:28 -0700 (PDT)
Received: by 10.229.247.198 with HTTP; Thu, 9 Aug 2012 12:38:28 -0700 (PDT)
In-Reply-To: <CAEsOVNcg9uHoWNpNge9VSOuL=fhYoCOtkUNDF6LtVQ1oQA+28A@mail.gmail.com>
References: <1344338236.9756.218.camel@ted> <50211706.1050707@windriver.com>
	<1344347435.9756.251.camel@ted> <50211F3B.6010601@windriver.com>
	<CAEsOVNeQX9uwB_QNdhodJqjprU2ygoMN=_DbEzudcb9GiF+wzg@mail.gmail.com>
	<5021CC85.20005@windriver.com>
	<CADkTA4P1EsaaJOyjB7ke__QaOKOHGn3C_XVYwa=NbwioKN_CBQ@mail.gmail.com>
	<CAEsOVNdA6of4efDpVsMhakmYavJW1-SRg9t1_SXDZ0ivZA35jQ@mail.gmail.com>
	<CADkTA4MFV3ga5=9FJe+tVGtvaPYK-FPFc8YfFvOXd=iWQHsXvw@mail.gmail.com>
	<CAEsOVNcg9uHoWNpNge9VSOuL=fhYoCOtkUNDF6LtVQ1oQA+28A@mail.gmail.com>
Date: Thu, 9 Aug 2012 15:38:28 -0400
Message-ID: <CADkTA4Oa=xjzsKmcNMHt9emOsPCH5ijMGn9ebQKs4S9nZL+BZQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-yocto-3.4: Disable extra slang header search path
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
X-List-Received-Date: Thu, 09 Aug 2012 19:50:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 9, 2012 at 3:17 PM, McClintock Matthew-B29882
<B29882@freescale.com> wrote:
> On Tue, Aug 7, 2012 at 9:30 PM, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>> On Tue, Aug 7, 2012 at 10:25 PM, McClintock Matthew-B29882
>> <B29882@freescale.com> wrote:
>>> On Tue, Aug 7, 2012 at 9:22 PM, Bruce Ashfield
>>> <bruce.ashfield@windriver.com> wrote:
>>>> On Tue, Aug 7, 2012 at 10:18 PM, Bruce Ashfield
>>>> <bruce.ashfield@windriver.com> wrote:
>>>>> On 12-08-07 10:16 PM, McClintock Matthew-B29882 wrote:
>>>>>>
>>>>>> On Tue, Aug 7, 2012 at 8:59 AM, Bruce Ashfield
>>>>>> <bruce.ashfield@windriver.com>  wrote:
>>>>>>>
>>>>>>> On 12-08-07 09:50 AM, Richard Purdie wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On Tue, 2012-08-07 at 09:24 -0400, Bruce Ashfield wrote:
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> On 12-08-07 07:17 AM, Richard Purdie wrote:
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Add in a workaround to avoid host infection detection build failures
>>>>>>>>>> from the slang include directory in perf. I'll defer to Bruce to
>>>>>>>>>> fix this properly but we need a workaround now as this is breaking
>>>>>>>>>> builds.
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> I just followed up on a patch from 3 days ago, but I'll follow up here
>>>>>>>>> as well .. just to make sure the message gets through.
>>>>>>>>>
>>>>>>>>> We had a pending patch to fix this issue from Liang Li here @
>>>>>>>>> windriver.
>>>>>>>>>
>>>>>>>>> Did that patch not fix the problem, or did it fall through the cracks ?
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>> It is not correct. It adds in another search path and just hides the
>>>>>>>> issue. We should *never* be putting -I/usr/include/slang on the compiler
>>>>>>>> commandline at all period.
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> I'd argue that it's more correct than commenting out the upstream
>>>>>>> include path.
>>>>>>>
>>>>>>> It fixes the problem, doesn't require a patch to the kernel and give
>>>>>>> us time to work upstream and get a real fix.
>>>>>>>
>>>>>>> So I'd really prefer that we take that fix, versus the kernel patch
>>>>>>> if it actually fixes the problem.
>>>>>>>
>>>>>>>
>>>>>>>>
>>>>>>>> I'd assumed in all the email traffic that this was clear and that
>>>>>>>> another solution was being worked on that would be acceptable upstream
>>>>>>>> too.
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> Exactly what I referred to above. But we don't want a temporary
>>>>>>> kernel path, we want the temporary recipe patch.
>>>>>>>
>>>>>>>
>>>>>>>>
>>>>>>>> Perhaps a better option might be: -I=/usr/include/slang ? That assumes
>>>>>>>> that all kernel gcc versions would accept the = notation, that should be
>>>>>>>> true by now?
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> Not in my experience when dealing with the upstream kernel and tools,
>>>>>>> there are plenty of old compilers floating around.
>>>>>>
>>>>>>
>>>>>> Sorry, I'm not following this thread super close.. will all kernel
>>>>>> trees need to apply this patch? That does not seem ideal...
>>>>>
>>>>>
>>>>> They would, once we get the patch merged upstream. And you are right,
>>>>> linux-yocto is easy enough, but that's one set of kernel trees.
>>>>
>>>> I should add, that not all trees, and only builds that use a
>>>> particular set of perf
>>>> features out of master would see this problem (as far as I know), so I didn't
>>>> mean to make this sound bigger than it is ... it's just something that master
>>>> was hitting on the autobuilders (and who knows, maybe I'm mischaracterizing
>>>> the problem as well :)
>>>>
>>>> Cheers,
>>>>
>>>> Bruce
>>>>
>>>>>
>>>>> The patch that we proposed to the perf recipe would fix it for all
>>>>> users of that recipe, with a suitable set of kernels (say 3.0 to
>>>>> 3.6 (I haven't checked).
>>>>>
>>>>> Honestly, that's why we proposed a perf recipe fix, while working on the
>>>>> right fix for the upstream kernel.
>>>
>>> It seems wrong to need a kernel patch to fix this issue, kernels are
>>> built outside of oe-core and it seems better to fix things in one
>>> place. By the way, I'm seeing this on our kernel recipe in
>>> meta-fsl-ppc too.
>>
>> Have you tried the patch from Liang Li @ Windriver ? Sent last Friday,
>> it should solve your
>> immediate problem .. it solved ours.
>
> http://patches.openembedded.org/project/oe-core/list/?submitter=5585

http://patches.openembedded.org/patch/33745/

Bruce

>
> which version?
>
> -M
>
>>
>> Cheers,
>>
>> Bruce
>>
>>>
>>> -M
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end"
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


