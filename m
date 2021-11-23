Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B984C433EF
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 23:13:29 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web09.268.1637709207762337906
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 15:13:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eKCjTp5V;
 spf=pass (domain: gmail.com, ip: 209.85.208.173,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id z8so1303446ljz.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 15:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=lTPrMujs1Ing916VRWFqWRzjGoVgqIYBj6d8/QbhETc=;
        b=eKCjTp5VjtqhV+FK7iiQTMAnzy6VOivXx0z/zz+VEhus+apqSkZDJoh7P82WS1I71n
         k/OEzvLZkVNCTnLU7Qj8b4ZVu+1TMJmSSCyeQgkMi4hsFqh+RPnQkowkxc6Zhpft6Hpi
         DGFqlcQzx+NFUs8A71GEM+nlR7iKgffx0/6J/SsvfTjxGGo9gwCTYLkoVyorNxEOnmPf
         d5xFI55dLAoewtv2k+ABLzQ5X8Rn461G7pEd6+Uu2Clm9obR5pkN4/8wqTzQB6n05CZT
         aGr/68u0NW5W5vQPTM20kzHfNdAnTfAP/2ZYz60Myxkiz4YRtx47l6sUu7l/5EBKNHlW
         vLGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=lTPrMujs1Ing916VRWFqWRzjGoVgqIYBj6d8/QbhETc=;
        b=fReSLyhE20g7oRDlod/ELyE7CS3bgoYfuISLIxg/I8cdB7Twl5oHQmpfxosXNgYfzA
         y41yetoi+aganxeXdeN9LXfY98EldZLqVSWAJDS4eqzKIPLbsJ/uKXbPEHa9hP/EgYCR
         lKur72MFVTRwDtM97tBNV0FBGxete/0+t2J6s6l5MqhqR36Q1mO6gYAMDJiBNiRbqVp6
         D0gXC0kRq9mtwEVYPgyDC5jmQwOMsGgxutKARDkAEhHRbYPvugUydShZ9NhvpRP4No6i
         Dyllo1WpdhOyuayNeF/ksLGp6KOfDN4DEwqMn5AFexkQglMIhThckFS+oK61EKzcETcz
         eeAw==
X-Gm-Message-State: AOAM530XLzCcV/ihzhcVTIuVFRJrex+joKAAhPpFsaeovVtAFdAI49gm
	0D/9s6RZq8z4C5S5Y2J/HjY=
X-Google-Smtp-Source: 
 ABdhPJwwOVkl8x6ysNaaM+4jv4nurKo/TE1/FSjdxZSVMoRJTVDn6JgAOZWqX9hrb87XY6vIhX1LCg==
X-Received: by 2002:a2e:9d05:: with SMTP id t5mr10146150lji.433.1637709205657;
        Tue, 23 Nov 2021 15:13:25 -0800 (PST)
Received: from [192.168.10.175] (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id
 j1sm1426356lfg.154.2021.11.23.15.13.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Nov 2021 15:13:25 -0800 (PST)
Message-ID: <2767d628-d628-89de-b19c-f6232d0fd032@gmail.com>
Date: Wed, 24 Nov 2021 00:13:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] native/cross: Add ar wrapper for determinism
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20211123141210.28396-1-richard.purdie@linuxfoundation.org>
 <9415e9e5-10b7-8c9a-6eb0-7f563c6472fc@gmail.com>
 <5db1f1f65d061ae660e45c0f0440c5446bddb398.camel@linuxfoundation.org>
From: Jacob Kroon <jacob.kroon@gmail.com>
In-Reply-To: 
 <5db1f1f65d061ae660e45c0f0440c5446bddb398.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Nov 2021 23:13:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158646

On 11/24/21 00:06, Richard Purdie wrote:
> On Tue, 2021-11-23 at 21:22 +0100, Jacob Kroon wrote:
>>
>> On 11/23/21 15:12, Richard Purdie wrote:
>>> From: Jacob Kroon <jacob.kroon@gmail.com>
>>>
>>> Add a wrapper around ar calls for native/cross recipes. This wrapper adds
>>> the -D option so that deterministic archives are built for native/cross
>>> output. This improves the changes of hash equivalence matches and hence
>>> build artefact reuse.
>>>
>>> We don't need this in the target case since we compile binutils-cross
>>> with an option making this the default. We need a wrapper since we need
>>> to remove the "u" option and replace it with "D" but also allow things like
>>> "--version" to continue to work too.
>>>
>>> Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>> ---
>>>  meta/classes/cross.bbclass  |  2 ++
>>>  scripts/cross-intercept/ar  |  1 +
>>>  scripts/native-intercept/ar | 29 +++++++++++++++++++++++++++++
>>>  3 files changed, 32 insertions(+)
>>>  create mode 120000 scripts/cross-intercept/ar
>>>  create mode 100755 scripts/native-intercept/ar
>>>
>>> diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
>>> index 3e6a2f60b9e..9d951076a78 100644
>>> --- a/meta/classes/cross.bbclass
>>> +++ b/meta/classes/cross.bbclass
>>> @@ -93,3 +93,5 @@ python do_addto_recipe_sysroot () {
>>>  }
>>>  addtask addto_recipe_sysroot after do_populate_sysroot
>>>  do_addto_recipe_sysroot[deptask] = "do_populate_sysroot"
>>> +
>>> +PATH:prepend = "${COREBASE}/scripts/cross-intercept:"
>>> diff --git a/scripts/cross-intercept/ar b/scripts/cross-intercept/ar
>>> new file mode 120000
>>> index 00000000000..bc68ffd7a21
>>> --- /dev/null
>>> +++ b/scripts/cross-intercept/ar
>>> @@ -0,0 +1 @@
>>> +../native-intercept/ar
>>> \ No newline at end of file
>>> diff --git a/scripts/native-intercept/ar b/scripts/native-intercept/ar
>>> new file mode 100755
>>> index 00000000000..642b6eae864
>>> --- /dev/null
>>> +++ b/scripts/native-intercept/ar
>>> @@ -0,0 +1,29 @@
>>> +#!/usr/bin/env python3
>>> +#
>>> +# Wrapper around 'ar' that defaults to deterministic archives
>>> +
>>> +import os
>>> +import shutil
>>> +import sys
>>> +
>>> +# calculate path to the real 'ar'
>>> +path = os.environ['PATH']
>>> +path = path.replace(os.path.dirname(sys.argv[0]), '')
>>> +real_ar = shutil.which('ar', path=path)
>>> +
>>> +if len(sys.argv) == 1:
>>> +    os.execl(real_ar, 'ar')
>>> +
>>> +# modify args to mimic 'ar' configured with --default-deterministic-archives
>>> +argv = sys.argv
>>> +if argv[1].startswith('--'):
>>> +    # No modifier given
>>> +    None
>>> +else:
>>> +    # remove the optional '-'
>>> +    if argv[1][0] == '-':
>>> +        argv[1] = argv[1][1:]
>>> +    argv[1] = argv[1].replace('u', '')
>>> +    argv[1] = 'D' + argv[1]
>>> +
>>> +os.execv(real_ar, argv)
>>>
>>
>> What should we do if the user is explicitly passing U, "Do not operate
>> in deterministic mode." ? Don't replace any 'u' and don't pass D ?
> 
> That would seem to make sense to me...
> 

Could we log a warning somewhere when this is done ? I can't write to
stdout here, but stderr perhaps ?

Jacob

