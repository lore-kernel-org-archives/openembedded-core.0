Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9443C433F5
	for <webhook@archiver.kernel.org>; Wed,  6 Oct 2021 17:59:15 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.528.1633543155047173271
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Oct 2021 10:59:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HjY2yt5/;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id
 qe4-20020a17090b4f8400b0019f663cfcd1so5024187pjb.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Oct 2021 10:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=l4NcZX1gBAjySXeEbBv59I0OrRstEICMMdszJBDOYdI=;
        b=HjY2yt5/LKWx5D7rfCeMR9dOSdOC/ncWwfctON9DIDT6D1vl770xcHn3Glq+G/6VZw
         KHzj7wiLyfaH7DLZ0+uJ0T/DYs+/Zln9vBBNOsgnjJzVsINgX6TcEJS9OICrtZjlrCzT
         O5AqQ0VDS0Jpv8Ubs3ALxEtpiRd7AFg9KcllnQyvgrN1OniO+4ahkVfbrA5HqLPRzagC
         Z5ImELWLVEylTvMaLSYxgEy1fRYhdLYf+AxHmkx9dtI5KfB1vpC+TyRVfelk3c2voohb
         ZFr+ffcebDsTreROl67rBc2/rJZ3M1tudl0mJtviaygH8B/hj7vK2TwOUPNTeXCDWJhR
         wcSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=l4NcZX1gBAjySXeEbBv59I0OrRstEICMMdszJBDOYdI=;
        b=7frNn6P0ALviEApwRVLKhX1BGjPT/U690jMySniapPT6orb4N3JqUfLjIOb7dT2FiN
         rKJzoLu99s2Kv8Zfn4CFw7MauqXILSyHfdgEmpCLDNLqieMk15dMwWUlqKSilAeLFiUp
         crRFJdWWBh3ATz4JCPb+W3QBllStHWhl3FCAFftRe4w6hz2aHHbZGG5wFVrtKtixeVU8
         oaYAFiuW8HDWKwHe2L0OaHIFAsG/MOxbCPiqLUWYWZgSydRZ3dEd7FfzqyjnkNcxOOf7
         nnp4ONI2n0n+LBqVYPei6rM87sVAbecHkllCTGIEjZKZY1RiFFKH/NIACXQA6/eMa+a2
         NTaQ==
X-Gm-Message-State: AOAM531aWP8gjFTAkeZKthPZdDtcyr9wuUQ0tWIED95odZBjKugwfHFt
	H98Qese+cAYMg/dFXGhCU0M=
X-Google-Smtp-Source: 
 ABdhPJwYDrTtNMcTXUOvk4NP/DIh5M4QIvbLMoso/6EtMPsWrk2rckbaApJ2sA0AGpvxLOKcEfzDOw==
X-Received: by 2002:a17:902:d903:b0:13e:d890:e4c4 with SMTP id
 c3-20020a170902d90300b0013ed890e4c4mr12471578plz.12.1633543154286;
        Wed, 06 Oct 2021 10:59:14 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0:640b:32bc:c7ac:4acd?
 ([2601:646:9200:a0f0:640b:32bc:c7ac:4acd])
        by smtp.gmail.com with ESMTPSA id
 u2sm15965148pfi.120.2021.10.06.10.59.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Oct 2021 10:59:13 -0700 (PDT)
Message-ID: <549aecfd-e6d1-dbe0-3c80-51783f554750@gmail.com>
Date: Wed, 6 Oct 2021 10:59:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.1.2
Subject: Re: [OE-core] [PATCH] linux-yocto: add libmpc-native to DEPENDS
Content-Language: en-US
To: Ross Burton <ross@burtonini.com>,
 Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20211005130411.2712850-1-ross.burton@arm.com>
 <CADkTA4NFGhRcQCj+sHLENM38eWEkjE4aLT1adj_KWoj=nKmpoA@mail.gmail.com>
 <CAAnfSTtg7NmNi6Hu0+-LK41ya7--BPnwpzACFipePOUFqyX6wA@mail.gmail.com>
 <CAAnfSTuMd+8YfuwcmTsU5+W30bPXHJrqcuHRM=Axo+=evv5z_A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: 
 <CAAnfSTuMd+8YfuwcmTsU5+W30bPXHJrqcuHRM=Axo+=evv5z_A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Oct 2021 17:59:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156700



On 10/6/21 3:12 AM, Ross Burton wrote:
> On Wed, 6 Oct 2021 at 11:10, Ross Burton <ross@burtonini.com> wrote:
>> This depends on CONFIG_GCC_PLUGINS which I don't believe is enabled in
>> any of the default configurations.  meta-arm builds a few kernels with
>> defconfig, which does.
> 
> Sorry, brain still not warmed up yet.
> 
> CONFIG_GCC_PLUGINS needs to be enabled, but the real difference is
> that using the normal GCC pulls libmpc into the sysroot via implicit
> dependencies.  If you use an external toolchain (like
> meta-arm-toolchain) this doesn't happen, and the dependency needs to
> be explicit.
> 

Does it have to be native or target dependency ?

> Ross
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156686): https://lists.openembedded.org/g/openembedded-core/message/156686
> Mute This Topic: https://lists.openembedded.org/mt/86092630/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

