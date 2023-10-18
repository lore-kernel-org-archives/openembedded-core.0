Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE1F9CDB482
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 13:25:16 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.281079.1697635507226447501
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Oct 2023 06:25:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QjaAPnYU;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: zboszor@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-99de884ad25so1103575466b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 06:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697635505; x=1698240305; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gkYvRbYymxBeMxgMGKdxBCYczQ1TemXZWqXIny33oOI=;
        b=QjaAPnYUikwPFGQpjhUNQaLDskWwu8m0asoAtjsd1T/hNOLqeCrtvC80OQP0zRCTG2
         I2XQ3sxB3uwUFW6VgplFlzegjLa9FT3PCnQMJDNdXxtIvdWsRNliKA5jxcqbIB4AMGAF
         EWH3EQFMTOz0lK1+eY437hNE5xV4wrjHZi+HBoVhDnWGi+Lvtu/Y1JvjEhO7qnk9Fiap
         1JQ/XJvoQJhqdDQHuRDyyJAFrcHS+pGBDr08VS9i9RwK1JYYCdBKkdI5Rt3CsKOBlB1l
         dzMMa5pwikt7Z3EvD48i1/AaoRxgYkEFf98FcrVzI+PVhkZFpXoCRKlJl9CDXcHPmJKG
         vxKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697635505; x=1698240305;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gkYvRbYymxBeMxgMGKdxBCYczQ1TemXZWqXIny33oOI=;
        b=XXUsr7nSogZQ4vgwSl1PR+s7TJRMN4ZcoCOfH3A9oky4Ht4r/TIz+t10cfL8GuzZDW
         EeFMm4qiKgskMnVwJ4GnkpYEPpm1lGu4kdu+ngNRIFU+IYhYBwq/RyMggGvke8qTQj26
         O7KcLWKayNT/lY64a/2bH0ZxQGX2kunjLybjyLRJH45FZoz/HfZAHY/fhTvQ5eL4XcNM
         2ywSWUNLlVvQtKDb2brGtCgKhyyj6SZULhRFUBN4z9BN+Oqpp/FdqcrkThcTqspvxWyP
         7cE9NPLA5qp3n/vN5nEQeraR+2VD/PwPT2HLSm93G3k8rbL0Gb8d6OsB+xF9gwIWoKL/
         e76w==
X-Gm-Message-State: AOJu0YyjKF5ey12f3rp7aHgPcMvfkFNC+4VHyIqpuFbVRoRLfOFbJSjB
	Gzzx3CRXuAq8Mn4fxaNjSHE=
X-Google-Smtp-Source: AGHT+IHU1TEeH2zdtV/yI2AKVNjqTRYkY8oU7oFzldq0mo2ufWEUZMOXwPL8rdoNuQVxiJbdIoh+GA==
X-Received: by 2002:a17:907:7285:b0:9bf:84c:4c11 with SMTP id dt5-20020a170907728500b009bf084c4c11mr3913094ejc.13.1697635505283;
        Wed, 18 Oct 2023 06:25:05 -0700 (PDT)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id rn1-20020a170906d92100b0099d45ed589csm1661034ejb.125.2023.10.18.06.25.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Oct 2023 06:25:04 -0700 (PDT)
Message-ID: <d466e4c6-20bf-42e2-8342-c058fca4aea2@gmail.com>
Date: Wed, 18 Oct 2023 15:25:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] gitsm:// question
Content-Language: en-US
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <d15f738b-60d2-48a0-9dc6-6e242469b7a5@gmail.com>
 <CA+chaQcLsDyXMFRtpUdH6yCWCXuShSytFyoqRZ_5F8Ton4HfzA@mail.gmail.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CA+chaQcLsDyXMFRtpUdH6yCWCXuShSytFyoqRZ_5F8Ton4HfzA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 13:25:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189390

Thanks, I will try it.

2023. 10. 18. 15:16 keltezéssel, Martin Jansa írta:
> Just add the name to pytorch repo url and use only that in SRCREV_FORMAT, you probably 
> don't care about representing the other repos in SRCPV if you're updating them only 
> together with main pytorch update.
>
> On Wed, Oct 18, 2023 at 3:05 PM Zoltan Boszormenyi <zboszor@gmail.com> wrote:
>
>     Hi,
>
>     I have a working python3-pytorch recipe which originally used this:
>
>     =======================================================
>     addtask do_git_submodules after do_unpack before do_patch
>
>     do_git_submodules[network] = "1"
>
>     do_git_submodules () {
>              cd ${S}
>              git submodule update --init --recursive
>     }
>     =======================================================
>
>     I would like to replace the above with a series of gitsm:// SRC_URI lines.
>     Here's a subset of submodules that shows the problem I am seeing:
>
>     SRC_URI = " \
>     git://github.com/pytorch/pytorch.git;protocol=https;branch=release/2.1
>     <http://github.com/pytorch/pytorch.git;protocol=https;branch=release/2.1> \
>     ...
>     gitsm://github.com/pytorch/FBGEMM.git;protocol=https;name=fbgemm;nobranch=1;destsuffix=third_party/fbgemm
>     <http://github.com/pytorch/FBGEMM.git;protocol=https;name=fbgemm;nobranch=1;destsuffix=third_party/fbgemm>
>
>     \
>     gitsm://github.com/asmjit/asmjit.git;protocol=https;name=fbgemmasmjit;destsuffix=third_party/fbgemm/third_party/asmjit
>     <http://github.com/asmjit/asmjit.git;protocol=https;name=fbgemmasmjit;destsuffix=third_party/fbgemm/third_party/asmjit>
>
>     \
>     gitsm://github.com/pytorch/cpuinfo.git;protocol=https;name=fbgemmcpuinfo;destsuffix=third_party/fbgemm/third_party/cpuinfo
>     <http://github.com/pytorch/cpuinfo.git;protocol=https;name=fbgemmcpuinfo;destsuffix=third_party/fbgemm/third_party/cpuinfo>
>
>     \
>     gitsm://github.com/NVIDIA/cutlass.git;protocol=https;name=fbgemmcutlass;destsuffix=third_party/fbgemm/third_party/cutlass
>     <http://github.com/NVIDIA/cutlass.git;protocol=https;name=fbgemmcutlass;destsuffix=third_party/fbgemm/third_party/cutlass>
>
>     \
>     gitsm://github.com/google/googletest.git;protocol=https;name=fbgemmgtest;destsuffix=third_party/fbgemm/third_party/googletest
>     <http://github.com/google/googletest.git;protocol=https;name=fbgemmgtest;destsuffix=third_party/fbgemm/third_party/googletest>
>
>     \
>     gitsm://github.com/ROCmSoftwarePlatform/hipify_torch.git;protocol=https;name=fbgemmhiptorch;destsuffix=third_party/fbgemm/third_party/hipify_torch
>     <http://github.com/ROCmSoftwarePlatform/hipify_torch.git;protocol=https;name=fbgemmhiptorch;destsuffix=third_party/fbgemm/third_party/hipify_torch>
>
>     \
>     ...
>     "
>
>     As you can see, there are recursively placed git submodules
>     and do_fetch fails with an error message about SRCREV_FORMAT
>     having to be set.
>
>     The above is a limited subset of the complete list and
>     some of the repositories (like googletest, gloo, glog and pybind11)
>     occurs multiple times as child submodules of upper ones,
>     with different SRCREV values in different leaf submodules.
>
>     I have not found a conclusive example to use SRCREV_FORMAT
>     with git:// + gitsm://
>
>     Can someone enlighten me how to use SRCREV_FORMAT properly
>     for this case? Should I stick to the proven working nonstandard way
>     and just run git submodule update --init --recursive?
>
>     As an easy way out, is there a flag to git:// to process its
>     submodules automatically?
>
>     Thanks in advance,
>     Zoltán Böszörményi
>
>
>     -=-=-=-=-=-=-=-=-=-=-=-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#189388):
>     https://lists.openembedded.org/g/openembedded-core/message/189388
>     Mute This Topic: https://lists.openembedded.org/mt/102038382/3617156
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
>     [martin.jansa@gmail.com]
>     -=-=-=-=-=-=-=-=-=-=-=-
>


