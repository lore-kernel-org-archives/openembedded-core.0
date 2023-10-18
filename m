Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E57ECDB483
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 14:12:37 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.282605.1697638347571783658
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Oct 2023 07:12:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NacWV9t5;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-53f6ccea1eeso890440a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 07:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697638346; x=1698243146; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JTQ9HG0rxnZ37F+BZUk+ncjjKWKmXrxz7NqT8mErBpY=;
        b=NacWV9t5a2Y61I8UK9y1K2VmpRL8yaHPpV6O9Bw8xJs8hGdoZEpxFkwTaNtFVGYDUY
         R6YFYn0OfKMqOob+hrcAc51LwEmNZuEmLm2tY5S8LizoV5RDANcVKU04M8CUM+ekG3De
         rOUMKO0sLx4YQ6QOAxkH+uJlSCFlpgCMpCmk5/sz1TlKeqhZeFMFCA8uUQ9AMn/Vhrsw
         m5iXtg1sMfa9o5//EUztacH8GSGIjEw6MyN3oYMTpfKrDlwUcyMeEXuBg8IWdV2UEAct
         Lvylrhf8GufhW1FJj2902U/5C5sWI5n1ENtT5YqNMsmnamAMHlAmD3pdYB5yTWtIjWIP
         WsYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697638346; x=1698243146;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JTQ9HG0rxnZ37F+BZUk+ncjjKWKmXrxz7NqT8mErBpY=;
        b=bp3Z2E6lakpPl+t6TFmeraSOkqgjGDjk9WUz9cXFKZ9QuTxU7dquTZmMJF3J9fyHQM
         toBbcZCO9TNPSYm4oLqemI7syo3kRnkXQ+c7i51Eu+vxp6ETWD+/re//VAdvt4PKSCxr
         v402mCbsAWeb3UyyC6WQ38IriOhO9L4kF34A3LM8YAF8O3TjZf7QVG3uVH6inOXXYUkh
         04+3SpszmQT0OZHEj9zGKMxndefbTwDIWElJKeKBKxSTpg3XxzZ86NTqf+UTBVtX096g
         /07Eejug9C/Y2eAmALFfy14d9LvM+QOsBrkeem1oWt0PknxR0OyJj8PZpXLN6C4yCpx2
         Qh2g==
X-Gm-Message-State: AOJu0YzpV2nlt4Qv+ZWQHAC3wFJ7q2gqoHg7ca5nbstEs77/y8c2G+v4
	ieLSkVLi8tIOeZEHX9iDYvY=
X-Google-Smtp-Source: AGHT+IG5nwVD96uqP6PRyan2+ticHnJMCPNjKksGAiLOdWphKNnj6snJHNPKchKOzdgOyX9J7tLEOw==
X-Received: by 2002:a17:906:4fc7:b0:9bf:77ae:3aa9 with SMTP id i7-20020a1709064fc700b009bf77ae3aa9mr4098467ejw.24.1697638345547;
        Wed, 18 Oct 2023 07:12:25 -0700 (PDT)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id e10-20020a1709062d4a00b009944e955e19sm1810717eji.30.2023.10.18.07.12.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Oct 2023 07:12:25 -0700 (PDT)
Message-ID: <6a7c97c6-2fc3-4596-8d45-388eb49c3c32@gmail.com>
Date: Wed, 18 Oct 2023 16:12:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] gitsm:// question
Content-Language: en-US
To: Julien Stephan <jstephan@baylibre.com>
Cc: Martin Jansa <martin.jansa@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <d15f738b-60d2-48a0-9dc6-6e242469b7a5@gmail.com>
 <CA+chaQcLsDyXMFRtpUdH6yCWCXuShSytFyoqRZ_5F8Ton4HfzA@mail.gmail.com>
 <d466e4c6-20bf-42e2-8342-c058fca4aea2@gmail.com>
 <CAEHHSvYW_-O=Z5r+sCTFdfS-vuafcnzRsQ_YoUY=MTVOFS1e5g@mail.gmail.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CAEHHSvYW_-O=Z5r+sCTFdfS-vuafcnzRsQ_YoUY=MTVOFS1e5g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 14:12:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189393

2023. 10. 18. 15:28 keltezéssel, Julien Stephan írta:
> Le mer. 18 oct. 2023 à 15:25, Zoltan Boszormenyi <zboszor@gmail.com> a écrit :
>> Thanks, I will try it.
>>
>> 2023. 10. 18. 15:16 keltezéssel, Martin Jansa írta:
>>> Just add the name to pytorch repo url and use only that in SRCREV_FORMAT, you probably
>>> don't care about representing the other repos in SRCPV if you're updating them only
>>> together with main pytorch update.
>>>
>>> On Wed, Oct 18, 2023 at 3:05 PM Zoltan Boszormenyi <zboszor@gmail.com> wrote:
>>>
>>>      Hi,
>>>
>>>      I have a working python3-pytorch recipe which originally used this:
>>>
>>>      =======================================================
>>>      addtask do_git_submodules after do_unpack before do_patch
>>>
>>>      do_git_submodules[network] = "1"
>>>
>>>      do_git_submodules () {
>>>               cd ${S}
>>>               git submodule update --init --recursive
>>>      }
>>>      =======================================================
>>>
>>>      I would like to replace the above with a series of gitsm:// SRC_URI lines.
>>>      Here's a subset of submodules that shows the problem I am seeing:
>>>
>>>      SRC_URI = " \
>>>      git://github.com/pytorch/pytorch.git;protocol=https;branch=release/2.1
>>>      <http://github.com/pytorch/pytorch.git;protocol=https;branch=release/2.1> \
>>>      ...
>>>      gitsm://github.com/pytorch/FBGEMM.git;protocol=https;name=fbgemm;nobranch=1;destsuffix=third_party/fbgemm
>>>      <http://github.com/pytorch/FBGEMM.git;protocol=https;name=fbgemm;nobranch=1;destsuffix=third_party/fbgemm>
>>>
>>>      \
>>>      gitsm://github.com/asmjit/asmjit.git;protocol=https;name=fbgemmasmjit;destsuffix=third_party/fbgemm/third_party/asmjit
>>>      <http://github.com/asmjit/asmjit.git;protocol=https;name=fbgemmasmjit;destsuffix=third_party/fbgemm/third_party/asmjit>
>>>
>>>      \
>>>      gitsm://github.com/pytorch/cpuinfo.git;protocol=https;name=fbgemmcpuinfo;destsuffix=third_party/fbgemm/third_party/cpuinfo
>>>      <http://github.com/pytorch/cpuinfo.git;protocol=https;name=fbgemmcpuinfo;destsuffix=third_party/fbgemm/third_party/cpuinfo>
>>>
>>>      \
>>>      gitsm://github.com/NVIDIA/cutlass.git;protocol=https;name=fbgemmcutlass;destsuffix=third_party/fbgemm/third_party/cutlass
>>>      <http://github.com/NVIDIA/cutlass.git;protocol=https;name=fbgemmcutlass;destsuffix=third_party/fbgemm/third_party/cutlass>
>>>
>>>      \
>>>      gitsm://github.com/google/googletest.git;protocol=https;name=fbgemmgtest;destsuffix=third_party/fbgemm/third_party/googletest
>>>      <http://github.com/google/googletest.git;protocol=https;name=fbgemmgtest;destsuffix=third_party/fbgemm/third_party/googletest>
>>>
>>>      \
>>>      gitsm://github.com/ROCmSoftwarePlatform/hipify_torch.git;protocol=https;name=fbgemmhiptorch;destsuffix=third_party/fbgemm/third_party/hipify_torch
>>>      <http://github.com/ROCmSoftwarePlatform/hipify_torch.git;protocol=https;name=fbgemmhiptorch;destsuffix=third_party/fbgemm/third_party/hipify_torch>
>>>
>>>      \
>>>      ...
>>>      "
> Hi Zoltan
> This is not how you are supposed to use gitsm.. This is much simpler:
>
> SRC_URI = " gitsm://github.com/pytorch/pytorch.git;protocol=https;branch=release/2.1
> "
>
> will do all the magic for you :)

When I first created that recipe (Yocto 4.0, PyTorch 1.13.0), it didn't.

The problems were:
* PyTorch source releases are not on https://pypi.org/project/torch
    This would have been the most convenient.
* Yocto complains about using the (unstable) release tarball URL from Github.
* Using the git:// SRC_URI did not populate the submodules' directories.
    This was noticed because some submodules need patches to build under Yocto.
    Without checking out submodules manually, those patches fail.

Just checked the last one on mickledore, still a problem.

Have Yocto master changed this?

> You can look at the vulkan-sample recipes in poky for an example of
> how to use it: https://git.openembedded.org/openembedded-core/tree/meta/recipes-graphics/vulkan/vulkan-samples_git.bb?h=master
>
> Cheers
> Julien
>
>
>>>      As you can see, there are recursively placed git submodules
>>>      and do_fetch fails with an error message about SRCREV_FORMAT
>>>      having to be set.
>>>
>>>      The above is a limited subset of the complete list and
>>>      some of the repositories (like googletest, gloo, glog and pybind11)
>>>      occurs multiple times as child submodules of upper ones,
>>>      with different SRCREV values in different leaf submodules.
>>>
>>>      I have not found a conclusive example to use SRCREV_FORMAT
>>>      with git:// + gitsm://
>>>
>>>      Can someone enlighten me how to use SRCREV_FORMAT properly
>>>      for this case? Should I stick to the proven working nonstandard way
>>>      and just run git submodule update --init --recursive?
>>>
>>>      As an easy way out, is there a flag to git:// to process its
>>>      submodules automatically?
>>>
>>>      Thanks in advance,
>>>      Zoltán Böszörményi
>>>
>>>
>>>
>>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#189390): https://lists.openembedded.org/g/openembedded-core/message/189390
>> Mute This Topic: https://lists.openembedded.org/mt/102038382/4356723
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [jstephan@baylibre.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


