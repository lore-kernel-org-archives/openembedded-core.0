Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95571C43334
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 17:16:35 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web12.8.1657905389945392639
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 10:16:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=P7s5N/bl;
 spf=pass (domain: gmail.com, ip: 209.85.222.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id b25so3290729qka.11
        for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 10:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=B3FEA7uaVo9rQmN6PKhoj0/kKq+kps7hynfNnubngLY=;
        b=P7s5N/blkRmNIgzVygblDrmTvMxhtkLTpsJss1JXl4MozoK2EwcMlIj1bjWVTRuVvB
         nClFYgGYRqE928LZVX5PlrCOmiDySFXUNfOmN2+SDwnp3od9w/aPSd1zgSFFafkTliNs
         N8iWVa44GnIVYNiTuzJOqr6bQQ5MLOkh5bz+2BptI+03GxXiLBEuTTMUXYsEVRXholcy
         4aD5KUFETUoVhCeD0PmYW6Vkh52MvlmpL3piLaLmBChOLXsqPm6Taqkj8cCxTSnOvfbz
         GgDgj+sADwjXkS+0Ll5nsKubbeiEkobs53+qhIiMyT663OCJwLtjAUE3Aidq1yujSUUH
         jbbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=B3FEA7uaVo9rQmN6PKhoj0/kKq+kps7hynfNnubngLY=;
        b=2QC2O7FAbB/LIUAw6uAkk2XPiEvBbMUIWyI1uZ4YqqrrXcx4OjGLUQq27LTpEmZVqI
         BK4YZmtUiu6Nwjp3ikkKmC22/0ugB/M5gb/vYBSKvfKk5hGq+PleEZ6zXMgZVv45fX6Y
         7I4l7tIdV88R9J065hnZePQwT53QHi30fjD3NMDjlnmeiWiIcgMQDLVtrJpgv1NMqnxD
         RqtiG3MhN0Rh335mUd+m52d7XjcW8VtWnsLDSUy5PRfuY2bypQde7bsi+uNDr6HAEStl
         36eCemvQlZJC3DoUCcRwt0Lbxc/T8bLk/T7ZkMqXK/2tZhrbGi+WvBxUUp70uxtRhOhP
         D3+w==
X-Gm-Message-State: AJIora8CUCwpbNMXes5vlqoqQWEAYTHqGeeCCbnwwXrI/YwE9eLwjmQG
	vK9aNP3HK3GbEk+MPiFbBEc=
X-Google-Smtp-Source: 
 AGRyM1tUeya5um7UEhmOHFTa0CyglZIMIU7RouadvUNtVPs9Z8ASbAIGTFGq9DNlhgDyEFzxSLwD6A==
X-Received: by 2002:a05:620a:40c5:b0:6af:4ef7:715f with SMTP id
 g5-20020a05620a40c500b006af4ef7715fmr9738379qko.767.1657905388771;
        Fri, 15 Jul 2022 10:16:28 -0700 (PDT)
Received: from ?IPV6:2607:fea8:95df:9730:2953:99a6:d45f:6161?
 ([2607:fea8:95df:9730:2953:99a6:d45f:6161])
        by smtp.gmail.com with ESMTPSA id
 p7-20020a05620a056700b006a6bb044740sm4247778qkp.66.2022.07.15.10.16.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Jul 2022 10:16:28 -0700 (PDT)
Message-ID: <8f714b23-5fa1-5da6-da1c-4180765ac977@gmail.com>
Date: Fri, 15 Jul 2022 13:16:27 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.0.2
Subject: Re: [OE-core] [PATCH] pulseaudio: add m4-native to DEPENDS
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Ross Burton <ross.burton@arm.com>, openembedded-core@lists.openembedded.org
Cc: nd@arm.com
References: <20220715110533.4008485-1-ross.burton@arm.com>
 <d7ae54ce-8362-32ca-163e-539f5fa32805@gmail.com>
 <66a2252bde5d7e721d706b1581f7300e9bc61663.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: 
 <66a2252bde5d7e721d706b1581f7300e9bc61663.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 17:16:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168134



On 7/15/22 1:10 PM, Richard Purdie wrote:
> On Fri, 2022-07-15 at 13:05 -0400, Khem Raj wrote:
>>
>> On 7/15/22 7:05 AM, Ross Burton wrote:
>>> Normally m4-native ends up in the sysroot via the toolchain, but if a
>>> non-standard toolchain is used them m4-native may not be installed.
>>>
>>> However Pulseaudio explicitly checks for m4 in the meson.build, so add
>>> it to DEPENDS.
>>
>> I think default toolchain dependencies should be emulated by external
>> toolchains too. Or perhaps m4-native should be dropped from the internal
>> toolchain too.
> 
> See the section in OE-Core's layer.conf:
> 
> """
> # Avoid adding bison-native to the sysroot without a specific
> # dependency in the recipe. This means indirect dependencies
> # (e.g. X -> Y -> binutils-cross -> bison-native) no longer meet the
> # dependency incidentally. This improves determinism and avoids build
> # failures when people switch to external toolchains.
> # libarchive only needs e2fsprogs headers at buildtime
> SSTATE_EXCLUDEDEPS_SYSROOT += "\
>      .*->autoconf-native \
>      .*->automake-native \
>      .*->bison-native \
> """
> 
> If we add m4-native to that list, it would do that. Just need someone
> to work through all the failures it might generate.

interesting. m4 is mostly used by autotools based packages barring few 
exception like pulseaudio, Maybe moving m4 dependency to autotools class 
might be able to address most of fallouts.

> 
> Cheers,
> 
> Richard

