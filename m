Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1SywEF-0001Ua-1w
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Aug 2012 04:42:35 +0200
Received: by qcad10 with SMTP id d10so157130qca.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Aug 2012 19:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=ATVwrJKGYjWFmw9B/63C7nnDE6Wfj4OAa85sNj/it+g=;
	b=qNa1vZTYVZVWsoeZki/oGySfOWSILvEN2/bfauqbXRwcK/H0VVNl2z4Yb47PaMXXe5
	6eLsGqCpXHn8anFJfiJi4NJt0m+PEB8pxPEdzxsc9WUXQDJP9l/U3K5KZrMSCdMpfYVU
	niGiyPQM/txBTVVIB6SJTLXpmYAyWR4asAwcLHst9R3d3Vk4HIDAM+Wiklq55Bz3b0qc
	gNU3RNBaa9JNGmc6v9vN82uguv7H5sidrs/is3ZzCBQahWMiBh8CYdc/MAnf8O+f1fWs
	8Ee1+Xz2o5b0HbDPKc9U9vvhjBj/jcNjUYWIEAUXqaQAhG7qXsGpSyLKDx7wrEescX2z
	MOBg==
MIME-Version: 1.0
Received: by 10.224.179.135 with SMTP id bq7mr27413615qab.55.1344393047956;
	Tue, 07 Aug 2012 19:30:47 -0700 (PDT)
Received: by 10.229.247.198 with HTTP; Tue, 7 Aug 2012 19:30:47 -0700 (PDT)
In-Reply-To: <CAEsOVNdA6of4efDpVsMhakmYavJW1-SRg9t1_SXDZ0ivZA35jQ@mail.gmail.com>
References: <1344338236.9756.218.camel@ted> <50211706.1050707@windriver.com>
	<1344347435.9756.251.camel@ted> <50211F3B.6010601@windriver.com>
	<CAEsOVNeQX9uwB_QNdhodJqjprU2ygoMN=_DbEzudcb9GiF+wzg@mail.gmail.com>
	<5021CC85.20005@windriver.com>
	<CADkTA4P1EsaaJOyjB7ke__QaOKOHGn3C_XVYwa=NbwioKN_CBQ@mail.gmail.com>
	<CAEsOVNdA6of4efDpVsMhakmYavJW1-SRg9t1_SXDZ0ivZA35jQ@mail.gmail.com>
Date: Tue, 7 Aug 2012 22:30:47 -0400
Message-ID: <CADkTA4MFV3ga5=9FJe+tVGtvaPYK-FPFc8YfFvOXd=iWQHsXvw@mail.gmail.com>
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
X-List-Received-Date: Wed, 08 Aug 2012 02:42:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Aug 7, 2012 at 10:25 PM, McClintock Matthew-B29882
<B29882@freescale.com> wrote:
> On Tue, Aug 7, 2012 at 9:22 PM, Bruce Ashfield
> <bruce.ashfield@windriver.com> wrote:
>> On Tue, Aug 7, 2012 at 10:18 PM, Bruce Ashfield
>> <bruce.ashfield@windriver.com> wrote:
>>> On 12-08-07 10:16 PM, McClintock Matthew-B29882 wrote:
>>>>
>>>> On Tue, Aug 7, 2012 at 8:59 AM, Bruce Ashfield
>>>> <bruce.ashfield@windriver.com>  wrote:
>>>>>
>>>>> On 12-08-07 09:50 AM, Richard Purdie wrote:
>>>>>>
>>>>>>
>>>>>> On Tue, 2012-08-07 at 09:24 -0400, Bruce Ashfield wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 12-08-07 07:17 AM, Richard Purdie wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> Add in a workaround to avoid host infection detection build failures
>>>>>>>> from the slang include directory in perf. I'll defer to Bruce to
>>>>>>>> fix this properly but we need a workaround now as this is breaking
>>>>>>>> builds.
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> I just followed up on a patch from 3 days ago, but I'll follow up here
>>>>>>> as well .. just to make sure the message gets through.
>>>>>>>
>>>>>>> We had a pending patch to fix this issue from Liang Li here @
>>>>>>> windriver.
>>>>>>>
>>>>>>> Did that patch not fix the problem, or did it fall through the cracks ?
>>>>>>
>>>>>>
>>>>>>
>>>>>> It is not correct. It adds in another search path and just hides the
>>>>>> issue. We should *never* be putting -I/usr/include/slang on the compiler
>>>>>> commandline at all period.
>>>>>
>>>>>
>>>>>
>>>>> I'd argue that it's more correct than commenting out the upstream
>>>>> include path.
>>>>>
>>>>> It fixes the problem, doesn't require a patch to the kernel and give
>>>>> us time to work upstream and get a real fix.
>>>>>
>>>>> So I'd really prefer that we take that fix, versus the kernel patch
>>>>> if it actually fixes the problem.
>>>>>
>>>>>
>>>>>>
>>>>>> I'd assumed in all the email traffic that this was clear and that
>>>>>> another solution was being worked on that would be acceptable upstream
>>>>>> too.
>>>>>
>>>>>
>>>>>
>>>>> Exactly what I referred to above. But we don't want a temporary
>>>>> kernel path, we want the temporary recipe patch.
>>>>>
>>>>>
>>>>>>
>>>>>> Perhaps a better option might be: -I=/usr/include/slang ? That assumes
>>>>>> that all kernel gcc versions would accept the = notation, that should be
>>>>>> true by now?
>>>>>
>>>>>
>>>>>
>>>>> Not in my experience when dealing with the upstream kernel and tools,
>>>>> there are plenty of old compilers floating around.
>>>>
>>>>
>>>> Sorry, I'm not following this thread super close.. will all kernel
>>>> trees need to apply this patch? That does not seem ideal...
>>>
>>>
>>> They would, once we get the patch merged upstream. And you are right,
>>> linux-yocto is easy enough, but that's one set of kernel trees.
>>
>> I should add, that not all trees, and only builds that use a
>> particular set of perf
>> features out of master would see this problem (as far as I know), so I didn't
>> mean to make this sound bigger than it is ... it's just something that master
>> was hitting on the autobuilders (and who knows, maybe I'm mischaracterizing
>> the problem as well :)
>>
>> Cheers,
>>
>> Bruce
>>
>>>
>>> The patch that we proposed to the perf recipe would fix it for all
>>> users of that recipe, with a suitable set of kernels (say 3.0 to
>>> 3.6 (I haven't checked).
>>>
>>> Honestly, that's why we proposed a perf recipe fix, while working on the
>>> right fix for the upstream kernel.
>
> It seems wrong to need a kernel patch to fix this issue, kernels are
> built outside of oe-core and it seems better to fix things in one
> place. By the way, I'm seeing this on our kernel recipe in
> meta-fsl-ppc too.

Have you tried the patch from Liang Li @ Windriver ? Sent last Friday,
it should solve your
immediate problem .. it solved ours.

Cheers,

Bruce

>
> -M
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


