Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07FBECDB47E
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 16:18:18 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.285497.1697645890746013927
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Oct 2023 09:18:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Fgl2B2kt;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: zboszor@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-9bda758748eso846372066b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 09:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697645889; x=1698250689; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kyweAHCLX1U/vPOGlH0r5V7Fdb10/QVonWUnaOWPIBE=;
        b=Fgl2B2ktpWPccX6w3BQ7eKJhi3T7OnC7Ng3GyT47qG+nZISPiPkE9W9kZLO6kmfGSv
         BVH3nJQ0OvN+Jihlpm7QkWmCXdR4w62ji8EcJldiWPPjJNZvcCmcRT/6QJfu6PBCfwiJ
         4jaScAfkC1HcQBbc9akrVs/N9ywGS4n2DiSQDTKjo8l6xA1DqQ/pIYuY/E2+URFk21ff
         Cp8V3pqIboJJvDBOhHP5Jk1WL5xIQ/fK1LcDFrcx333sskNxnt4qeWEkPUQ8pZXnCM0i
         uTeZvZzHt3sp+UQAM7Fk4rokF5NlbR8ssGN2STvsFi9F7VQyrFkuqSE9Cu7/UpVMgEAD
         mQ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697645889; x=1698250689;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kyweAHCLX1U/vPOGlH0r5V7Fdb10/QVonWUnaOWPIBE=;
        b=d3VHE0pVmJNp/WRfjLp9XYOhgtEEK+bOxkD+HRYTkd4xGuN+hXSH5zFbawTIRSNaa7
         WeCr2EM4Z8knpmygLoqkXB6G4HTX1VcjmOXLWEgZ3s7qHHMFsrjsx47fIgGR26HK67/T
         S8BOlg7/tALOTVk8BNVIdQPC0Y4U7WVnXjIOIz2r9/TDxzcUxxHzk/Xdlve6y7nu0KqS
         gFqEipsZV39FrbDqMu2GNdZtrGm4erMDuT+YNhdCilYFhWkcKwFKbw1vnXrxpURfB8Sk
         bUNkqhPmFBL4vMZZzATpC5Kx5ySjS6DUqnDRMG8J17X4O48tmvMT8IJy1oYoGgRpJIFE
         GdLA==
X-Gm-Message-State: AOJu0YwbfrHVhQa4h2idBZmgCEdhswHb/YblTE/BMXTviCIdCzK/pt3n
	8sZvO4cMdoOJg9RocaXHgjk=
X-Google-Smtp-Source: AGHT+IHJFEW6ReyaYZ6HyFZvYJVyluSsksETv77tQBdST9DYUKN1DzagySYWi85I9MtEBiEZOgJoWw==
X-Received: by 2002:a17:906:eec1:b0:9b2:ccd8:2d42 with SMTP id wu1-20020a170906eec100b009b2ccd82d42mr4022192ejb.32.1697645888780;
        Wed, 18 Oct 2023 09:18:08 -0700 (PDT)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id u13-20020a170906408d00b009932337747esm1960833ejj.86.2023.10.18.09.18.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Oct 2023 09:18:08 -0700 (PDT)
Message-ID: <b9d330f9-8789-4a8b-a078-00c7e062eb05@gmail.com>
Date: Wed, 18 Oct 2023 18:18:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] gitsm:// question
Content-Language: en-US
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <d15f738b-60d2-48a0-9dc6-6e242469b7a5@gmail.com>
 <CA+chaQcLsDyXMFRtpUdH6yCWCXuShSytFyoqRZ_5F8Ton4HfzA@mail.gmail.com>
 <178F367FEBFA030F.14388@lists.openembedded.org>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <178F367FEBFA030F.14388@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 16:18:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189410

Using a name for the main git:// SRC_URI entry and setting
SRCREV_FORMAT for it works.

The rest were partly my bugs: I had to fix two copy&paste errors
in that massive list of gitsm:// SRC_URI entries.

I also had to change a couple of them to use git:// due to the
submodules' incorrect declaration in their parent repos.
This is detected by Yocto and gave me the error below,
indicating the repos in question.

ERROR: python3-pytorch do_fetch: Fetcher failure: Submodule refers to the parent 
repository. This will cause deadlock situation in current version of Bitbake.Consider 
using git fetcher instead.

2023. 10. 18. 15:25 keltezéssel, Zoltan Boszormenyi via lists.openembedded.org írta:
> Thanks, I will try it.
>
> 2023. 10. 18. 15:16 keltezéssel, Martin Jansa írta:
>> Just add the name to pytorch repo url and use only that in SRCREV_FORMAT, you probably 
>> don't care about representing the other repos in SRCPV if you're updating them only 
>> together with main pytorch update.
>>
>> On Wed, Oct 18, 2023 at 3:05 PM Zoltan Boszormenyi <zboszor@gmail.com> wrote:
>>
>>     Hi,
>>
>>     I have a working python3-pytorch recipe which originally used this:
>>
>>     =======================================================
>>     addtask do_git_submodules after do_unpack before do_patch
>>
>>     do_git_submodules[network] = "1"
>>
>>     do_git_submodules () {
>>              cd ${S}
>>              git submodule update --init --recursive
>>     }
>>     =======================================================
>>
>>     I would like to replace the above with a series of gitsm:// SRC_URI lines.
>>     Here's a subset of submodules that shows the problem I am seeing:
>>
>>     SRC_URI = " \
>> git://github.com/pytorch/pytorch.git;protocol=https;branch=release/2.1
>> <http://github.com/pytorch/pytorch.git;protocol=https;branch=release/2.1> \
>>     ...
>> gitsm://github.com/pytorch/FBGEMM.git;protocol=https;name=fbgemm;nobranch=1;destsuffix=third_party/fbgemm
>> <http://github.com/pytorch/FBGEMM.git;protocol=https;name=fbgemm;nobranch=1;destsuffix=third_party/fbgemm>
>>
>>     \
>> gitsm://github.com/asmjit/asmjit.git;protocol=https;name=fbgemmasmjit;destsuffix=third_party/fbgemm/third_party/asmjit
>> <http://github.com/asmjit/asmjit.git;protocol=https;name=fbgemmasmjit;destsuffix=third_party/fbgemm/third_party/asmjit>
>>
>>     \
>> gitsm://github.com/pytorch/cpuinfo.git;protocol=https;name=fbgemmcpuinfo;destsuffix=third_party/fbgemm/third_party/cpuinfo
>> <http://github.com/pytorch/cpuinfo.git;protocol=https;name=fbgemmcpuinfo;destsuffix=third_party/fbgemm/third_party/cpuinfo>
>>
>>     \
>> gitsm://github.com/NVIDIA/cutlass.git;protocol=https;name=fbgemmcutlass;destsuffix=third_party/fbgemm/third_party/cutlass
>> <http://github.com/NVIDIA/cutlass.git;protocol=https;name=fbgemmcutlass;destsuffix=third_party/fbgemm/third_party/cutlass>
>>
>>     \
>> gitsm://github.com/google/googletest.git;protocol=https;name=fbgemmgtest;destsuffix=third_party/fbgemm/third_party/googletest
>> <http://github.com/google/googletest.git;protocol=https;name=fbgemmgtest;destsuffix=third_party/fbgemm/third_party/googletest>
>>
>>     \
>> gitsm://github.com/ROCmSoftwarePlatform/hipify_torch.git;protocol=https;name=fbgemmhiptorch;destsuffix=third_party/fbgemm/third_party/hipify_torch
>> <http://github.com/ROCmSoftwarePlatform/hipify_torch.git;protocol=https;name=fbgemmhiptorch;destsuffix=third_party/fbgemm/third_party/hipify_torch>
>>
>>     \
>>     ...
>>     "
>>
>>     As you can see, there are recursively placed git submodules
>>     and do_fetch fails with an error message about SRCREV_FORMAT
>>     having to be set.
>>
>>     The above is a limited subset of the complete list and
>>     some of the repositories (like googletest, gloo, glog and pybind11)
>>     occurs multiple times as child submodules of upper ones,
>>     with different SRCREV values in different leaf submodules.
>>
>>     I have not found a conclusive example to use SRCREV_FORMAT
>>     with git:// + gitsm://
>>
>>     Can someone enlighten me how to use SRCREV_FORMAT properly
>>     for this case? Should I stick to the proven working nonstandard way
>>     and just run git submodule update --init --recursive?
>>
>>     As an easy way out, is there a flag to git:// to process its
>>     submodules automatically?
>>
>>     Thanks in advance,
>>     Zoltán Böszörményi
>>
>>
>>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#189390): https://lists.openembedded.org/g/openembedded-core/message/189390
> Mute This Topic: https://lists.openembedded.org/mt/102038382/3617728
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [zboszor@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


