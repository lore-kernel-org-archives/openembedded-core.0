Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F5C3C433FE
	for <webhook@archiver.kernel.org>; Thu,  2 Dec 2021 11:03:58 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.6631.1638443036892428691
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Dec 2021 03:03:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jALxGq++;
 spf=pass (domain: gmail.com, ip: 209.85.167.44,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id bu18so70636739lfb.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Dec 2021 03:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=Yix9g++k/ncdram4ByS75JoL5r/JLAQAMcrYD/ayWNM=;
        b=jALxGq++fPcxC+IUFF6HegVmd4E4lA/Fwe+mL/0+uFdcZmqVGm93yir8WcONUv573g
         rlT9ACevJOtKcpPmrHHkslNcDscMeyuymeua9iA/VfXS6pVEg3FDnGWSV2v6dcl2nJRd
         KOP6FPC4PyLfs8bpd2NMAZ5SmU9BST2On3h0AieB+Q2AOLqyLkD2lAiVmtBxXI12Dlfo
         k3fHSSeSPUwyOT/GBzTyTVi7F8WwI8DZqRNSgAvvlmRcAkx30Y/ql+TIp4rKeOW+jSr3
         d3gYz8odnLerzX1DZ8hzSpu887qIZCTxKuDI+6Y4/Vb5nvtupf3u6xiH+2esiF4rSWI7
         Ayww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Yix9g++k/ncdram4ByS75JoL5r/JLAQAMcrYD/ayWNM=;
        b=aqC8a1EDFvzNTkKzVOBJtebp4IMMrKQBqOlIq217DyANC77jrgOXkP8H88gnabO+1D
         UEFszMREcXE5GkZbkGgZpmMxIqlknHoMOAfwgxNv/2sUBVBPvHcRVa8R5hDdjiFZaa36
         Lfbp3InpTE0gAiNSv+x5wQ1N0v6gUZCwDaK8S9UISfOsQ4GJiWHQOi1hoZS4KpYQk6+2
         JbgkPyLNlfQUcdX0uwRQLCMejdR9WDAR5qjfNBqp5rhlzSuoEonO6kCAq4RbpOR+lxmy
         sFYnHR4UTujxZYKtqNkoaV/xEChIH4CYAnK9uTZ2giDVhD9EA42PucmMtMyXNBhowPJq
         bZ/g==
X-Gm-Message-State: AOAM530G1/IFzZU4V8uXd85wXo9f6y6WwdcOJFXPWqt6kQufFvV14IMK
	zX7v+y2LU5KQ4TitxmO/96U=
X-Google-Smtp-Source: 
 ABdhPJyxAYqocS7OHOfmiSuuWqameEwapH/mWLjKmXFRLF6nlC6G6jzLBUPRUafVVjkO5V1TuVxg7g==
X-Received: by 2002:ac2:4907:: with SMTP id n7mr11182390lfi.86.1638443034873;
        Thu, 02 Dec 2021 03:03:54 -0800 (PST)
Received: from [192.168.10.175] (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id q6sm304268lfr.76.2021.12.02.03.03.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Dec 2021 03:03:54 -0800 (PST)
Message-ID: <b83fcbb2-ecb1-6788-0a1e-1702f35165a6@gmail.com>
Date: Thu, 2 Dec 2021 12:03:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [OE-core] [RFC PATCH v2 1/2] bitbake.conf: Pad rpath and remove
 build ID in native binaries
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20211130223722.852434-1-jacob.kroon@gmail.com>
 <20211130223722.852434-2-jacob.kroon@gmail.com>
 <89904fc65013c82975f32d0ffa6c4761019590e0.camel@linuxfoundation.org>
 <fcaf8ef0-f2d0-a950-6c7b-527259446e98@gmail.com>
 <0ea48dd5b84dcba4971886b35790aad516b7b6dd.camel@linuxfoundation.org>
From: Jacob Kroon <jacob.kroon@gmail.com>
In-Reply-To: 
 <0ea48dd5b84dcba4971886b35790aad516b7b6dd.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Dec 2021 11:03:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159084

On 12/2/21 11:51, Richard Purdie wrote:
> On Thu, 2021-12-02 at 11:19 +0100, Jacob Kroon wrote:
>> On 12/2/21 00:11, Richard Purdie wrote:
>>> On Tue, 2021-11-30 at 23:37 +0100, Jacob Kroon wrote:
>>>> Try to make sure that the RUNTIME dynamic entry size is the same for all
>>>> binaries produced with the native compiler. This is necessary in order to
>>>> produce identical binaries when using differently sized buildpaths. I've
>>>> tried using only patchelf, and keeping the linker flags as they are, but
>>>> I am unable to produce identical binaries. Has anyone else managed to do
>>>> this with patchelf ? If not, maybe we can write a new tool that can handle it ?
>>>>
>>>> The build-id also needs to be removed since it is calculated based on
>>>> the data present at link time. This includes STAGING_LIBDIR_NATIVE
>>>> and STAGING_BASE_LIBDIR_NATIVE. Both will differ and they need to be temporarily
>>>> preserved since some recipes will execute the binaries during do_install()
>>>> (for example python3-native). Later on these are removed in chrpath.bbclass.
>>>>
>>>> This hack is the first step for producing identical native binaries when using
>>>> different build paths. 'zstd-native' is a working example.
>>>>
>>>> Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
>>>> ---
>>>>  meta/classes/chrpath.bbclass | 3 +++
>>>>  meta/conf/bitbake.conf       | 5 ++++-
>>>>  2 files changed, 7 insertions(+), 1 deletion(-)
>>>
>>> I'm a little torn on this. Our other option would be to hardcoded a specific
>>> dummy path and then edit it later to the correct value. That may be neater than
>>> adding the padding. It will change the end binaries but hopefully only after
>>> they're installed so should give the same net end result more neatly?
>>>
>>
>> Hmm not sure I follow. This patch adds a new dummy rpath entry,
>> "/rpath-padding-xxx...", then we remove it in chrpath. I don't know what
>> other value we would like to put there. If I understand you correctly,
>> we could perhaps pad one of the ones we already pass
>>
>> -Wl,-rpath,${STAGING_LIBDIR_NATIVE}
>> -Wl,-rpath,${STAGING_BASE_LIBDIR_NATIVE}
>>
>> with spaces, like:
>>
>> -Wl,-rpath,${STAGING_LIBDIR_NATIVE}
>> -Wl,-rpath,"${STAGING_BASE_LIBDIR_NATIVE}${RPATH_PADDING}"
> 
> 
> I'm wondering if:
> 
> -Wl,-rpath,/not/exist/our-native-libdir-marker
> -Wl,-rpath,/not/exist/our-native-base-libdir-marker
> 
> would work.
> 

Right, I'll give it a try.

>> If that works that would be less intrusive I think.
>>
>>> If we separate out the build-id patch we could hopefully get that piece merged
>>> as that shouldn't be controversial? 
>>>
>>
>> Yes, I can split it out into a separate patch.
>>
>> But now that I've looked at this for a while, I've asked myself what
>> good does all this do ? The only optimization I can think of is that if
>> we rebuild a native recipes, and the sysroot component turns out the
>> same, then we don't need to create a new sstate cache entry. So we save
>> disk space, but disk space is cheap. We still need to build it. What I
>> would like is to have a common sstate dir for multiple build
>> directories. So if I build libtool-native in one build path, then at my
>> other build path it would just pick it up from sstate cache when I build
>> there. In the end, is that something that would be possible ?
> 
> We originally started here with gcc-cross so lets consider that and multiple
> build directories where a patch changes gcc-cross in a way that is irrelavent to
> the output.
> 
> The "win" is that regardless of whether I build in location A or B, I get the
> same gcc-cross binary. Hash-equiv will then not rebuild the target binaries.
> Yes, I pay the price of a gcc-cross rebuild but hashequiv saves the targets
> rebuilding.
> 
> Currently it would only happen if you always build gcc-cross in a specific build
> path.
> 

I know the build path will change if I upgrade to a new version of gcc,
but then the output is most definitely gonna change as well.

> Like everything, it is a question of looking at the changes and deciding whether
> they are worth any maintenance burden/code complication or additional overhead
> they generate. I don't know the answer here yet but I do appreciate the research
> in helping get us data to make decisions on!
> 

I was thinking if it was possible to add a "build-path-does-not-matter"
.bbclass that would make the signatures independent of build path and
then scan the output to make sure it didn't contain any references to
the build path. Then those recipes who didn't depend on build path could
inherit from that class, and then maybe their sstate could be reused
from multiple build directories ? Not sure reliable it would be though..

Jacob

