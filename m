Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F3F4C433F5
	for <webhook@archiver.kernel.org>; Thu,  4 Nov 2021 20:57:20 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.387.1636059439669370940
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 13:57:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ndkamm+y;
 spf=pass (domain: gmail.com, ip: 209.85.215.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id p17so6510096pgj.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 13:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=b3/FAZAZwmfzoFZkkKXPSrLHALSstfMUOf52how4/gs=;
        b=ndkamm+y8GeWNDvStPBpP+rMXUc+JXoeBphLY42JYoactVBUBdBXHEP5eAtmWdXdsg
         ZX5NUsAFV97onQICcWrsytBr7VgO4bkQdmc5CtS+rR3i4ERIxUKYpK38gJAT+Z5d2bAw
         cgdi338gKaJR5hPgB9f9bm3j19jwRwECI246VfHh4eDrBHdRUu4k5ga+2KAXfTe6kTBh
         S5CYMvX322w4P/JAAE+ZFx+4jFyCei7YQ0EelajS5Pt91Uon4RI97Q8qxmtyu6eppPvr
         IBIn8Knz9ljHGTZhY7+R4UNnlHUquHanXbCzziHtHS9uA8gVEy5bmQUSjy+dSa68dMXO
         Zh/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=b3/FAZAZwmfzoFZkkKXPSrLHALSstfMUOf52how4/gs=;
        b=rQpIM/zGkquSAg1NO8ZFh2Hi0X+cRSpFxRf5AF/qRautS/TZv/haIEW6/UMyuDYeBd
         M2HD5WaA53mRjVIw9FrbnrcMKWQNPtDf2Wph3WEHrqiHLrqAfzePaymV1BaUlG+ewjj9
         TolgHiE46p44pKD/uhc4/5hX57K1ZjQ1zgLUCiBJSmLjmembtSeFmYDNrGhmcd1egdN5
         9Rgqq21hJ8m3Rv6hCq68z3AfhKvhLP2+FHbh4GBaJAX7PwZEJPkls8hXSMaBbVFEUn5a
         MppPm/Z05nEaCKuOpGxIHv7wkltTNRmCume1cyoXyywEyJ6skWJj/SMGKuCxFO9u/fAj
         r+pA==
X-Gm-Message-State: AOAM531ZLtztgVz50yTmHkG6bWrAecBsIqsWqJJOdq0/dzJE4kGyFW5P
	url5iN9Bmbw6lsankkOrz1c=
X-Google-Smtp-Source: 
 ABdhPJzWG7quESTFtwOyvVVEOhxuGVB8WkyNLT0yicX9t/pfv8PLws3NnQb4fknRFqjs5+WUZJEDZw==
X-Received: by 2002:a05:6a00:2181:b0:44d:c18d:7af9 with SMTP id
 h1-20020a056a00218100b0044dc18d7af9mr54963979pfi.16.1636059438991;
        Thu, 04 Nov 2021 13:57:18 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0:9103:5ab5:3527:3728?
 ([2601:646:9200:a0f0:9103:5ab5:3527:3728])
        by smtp.gmail.com with ESMTPSA id
 k13sm6123808pfc.197.2021.11.04.13.57.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Nov 2021 13:57:18 -0700 (PDT)
Message-ID: <12549bda-6366-a38d-e5fb-7261788f362b@gmail.com>
Date: Thu, 4 Nov 2021 13:57:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [OE-core] [PATCH 0/6] kernel: consolidated pull request
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
 richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
References: <cover.1636054726.git.bruce.ashfield@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <cover.1636054726.git.bruce.ashfield@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Nov 2021 20:57:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157875



On 11/4/21 12:48 PM, Bruce Ashfield wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> Richard,
> 
> Here's a broad set of kernel updates:
> 
>   - stable for 5.14
>   - stable for 5.10
> 
> And then the bigger, a way earlier than normal:
> 
>   - libc-headers bump to 5.15
>   - 5.15 reference kernel recipes
> 
> As everyone has probably heard, 5.15 is the next kernel LTS, so I
> wanted to establish it for the next release earlier than normal. Due
> to the -dev testing, things like lttng, perf and devsrc are already
> ready to go, so this is a smaller pull request than normal.
> 
> I had to fixup strace, and the vboxguest drivers (patch sent to
> meta-oe)
> 
> I've run it through the AB and everything came back green, as well
> as my local testing.
> 
> This isn't the default for any of the machines yet (but I have
> local patches for that as well). The h/w reference boards
> stil use 5.14 and need to be updated, but the plan is to remove 5.14,
> and eventually 5.10 from master, and we'll go with 5.15, and 5.16+
> in the spring 2022 release.

also 5.10 ? I think there perhaps will be enough folks needing 5.10 
Since next YP release is also LTS, I wonder if we should keep kernel 
UAPIs as a LTS kernel too.

> 
> Cheers,
> 
> Bruce
> 
> The following changes since commit 3e9c4801216111496acffdfdccf1deae3b3d6b96:
> 
>    insane.bbclass: Add a check for directories that are expected to be empty (2021-11-03 11:12:26 +0000)
> 
> are available in the Git repository at:
> 
>    git://git.yoctoproject.org/poky-contrib zedd/kernel
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
> 
> Bruce Ashfield (6):
>    linux-yocto/5.14: update to v5.14.15
>    linux-yocto/5.10: update to v5.10.76
>    linux-libc-headers: update to v5.15
>    linux-yocto-rt/5.10: update to -rt54
>    linux-yocto/5.15: introduce recipes
>    strace: fix build against 5.15 kernel/kernel-headers
> 
>   meta/conf/distro/include/tcmode-default.inc   |   2 +-
>   ...1-Avoid-relying-on-presence-of-ipx.h.patch | 151 ++++++++++++++++++
>   meta/recipes-devtools/strace/strace_5.14.bb   |   1 +
>   ...ers_5.14.bb => linux-libc-headers_5.15.bb} |   4 +-
>   .../linux/linux-yocto-rt_5.10.bb              |   6 +-
>   .../linux/linux-yocto-rt_5.14.bb              |   6 +-
>   .../linux/linux-yocto-rt_5.15.bb              |  45 ++++++
>   .../linux/linux-yocto-tiny_5.10.bb            |   8 +-
>   .../linux/linux-yocto-tiny_5.14.bb            |   8 +-
>   .../linux/linux-yocto-tiny_5.15.bb            |  32 ++++
>   meta/recipes-kernel/linux/linux-yocto_5.10.bb |  24 +--
>   meta/recipes-kernel/linux/linux-yocto_5.14.bb |  26 +--
>   meta/recipes-kernel/linux/linux-yocto_5.15.bb |  68 ++++++++
>   13 files changed, 339 insertions(+), 42 deletions(-)
>   create mode 100644 meta/recipes-devtools/strace/strace/0001-Avoid-relying-on-presence-of-ipx.h.patch
>   rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_5.14.bb => linux-libc-headers_5.15.bb} (81%)
>   create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
>   create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
>   create mode 100644 meta/recipes-kernel/linux/linux-yocto_5.15.bb
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157862): https://lists.openembedded.org/g/openembedded-core/message/157862
> Mute This Topic: https://lists.openembedded.org/mt/86824892/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

