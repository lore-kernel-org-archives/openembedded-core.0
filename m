Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6674C433EF
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 07:04:23 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web09.19443.1636959862122473146
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Nov 2021 23:04:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ANsd3pTH;
 spf=pass (domain: gmail.com, ip: 209.85.167.51,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id k37so40945871lfv.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Nov 2021 23:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Xrv3D/C/+WFfxjFyehYUOKFCg7kbePDoiFoVrHMdSbc=;
        b=ANsd3pTHKC2UGI0vJVlBrLKx3jgeCorKa9NFbkQ3HIm7k3M2MJJMrN5ZM27SrTdkG4
         JjWJfKV6mTdHxP3bppWRL8SGM3b12BpqJToALHwGwFag3kexeGIGQCV8CZ/Hr08IUrha
         TIaa9NWVIKijxjddc7Fe/Jq6lQ8IBXSnWOthhxg8CVo5qgiwSuDK3tm5NW/l5RNfMVWb
         BOW2xI5e4GRX+a6NkboBcjpDiYVM2J+KXRVaE9aq7VU1uOvvuGfmy5D+nOrFkRwSK4s+
         +TXXOyGtttyhVcdy+31EtdnXzfEoZspwPeGj0lxI8+EG6piRI/cYqHujJUWD8r/puyN4
         8foA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Xrv3D/C/+WFfxjFyehYUOKFCg7kbePDoiFoVrHMdSbc=;
        b=6GUK8JGgsiCpAFCgp3GHVToVjj6KMyWsN0e0Gf2MnOfTpahqV1vpP2dXR/R66rzogk
         0xrPRYnX5mjk5r3HFuU4mPO4d5vZdzz4cjUPIthAujMYPPkvxsrOzOxACw/vMvTt0X2v
         A4Ic6mmo0oMTFj44V1ltfeRpHpX/3dF+iQaZjNoKHoMvjN7G0gvMbvb4KAonJ/NpRAPF
         RDBMX3RaZoaWtx0vq8U3COGtdU0ohllpFdVIHy+KPLSRV2z6j24Kr3FUYIQoprsI4Aqc
         VmvkjP8H6dJjS2yyAg3h86CgICtgm3RwYM+nSgDf1uAzTiCeFGW/74Txw3rORKjsy3Rh
         tUpg==
X-Gm-Message-State: AOAM533pWP898HMFS6t59rVGUw2109xai4ELTpG0OpDRmyCcgbshmrSV
	gTY0fL+auc4ZdaxLKx+/JEI=
X-Google-Smtp-Source: 
 ABdhPJz1HMdw1aRau+tga8uXGoO8MuoBg8RXTg+LS6TwoYAD/+kwmh+ngw+uDtjqEHn8J2NRcQIDXw==
X-Received: by 2002:a05:6512:b02:: with SMTP id
 w2mr34207914lfu.508.1636959860215;
        Sun, 14 Nov 2021 23:04:20 -0800 (PST)
Received: from [192.168.10.175] (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id
 q1sm1324022lfo.255.2021.11.14.23.04.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Nov 2021 23:04:19 -0800 (PST)
Message-ID: <0873075c-6a8d-e986-9f16-be3eb81b8cc9@gmail.com>
Date: Mon, 15 Nov 2021 08:04:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [OE-core] [hardknott][PATCH] mklibs: remove recipes and class
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
 Alexander Kanavin <alex.kanavin@gmail.com>
References: <20211114065008.3899-1-jacob.kroon@gmail.com>
 <dfc7b7fc105d153303d7d5933689d9b469fb5a22.camel@linuxfoundation.org>
 <c02ee82c-4d14-d704-6fa0-50578f9f746f@gmail.com>
 <CAMKF1som8UK6MYYj7RAPs0ai9JZL6kY8GDam-d_67xGEPOnkpQ@mail.gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
In-Reply-To: 
 <CAMKF1som8UK6MYYj7RAPs0ai9JZL6kY8GDam-d_67xGEPOnkpQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Nov 2021 07:04:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158275

On 11/15/21 01:59, Khem Raj wrote:
> On Sun, Nov 14, 2021 at 11:47 AM Jacob Kroon <jacob.kroon@gmail.com> wrote:
>>
>> On 11/14/21 20:36, Richard Purdie wrote:
>>> On Sun, 2021-11-14 at 07:50 +0100, Jacob Kroon wrote:
>>>> From: Alexander Kanavin <alex.kanavin@gmail.com>
>>>>
>>>> This is not enabled or tested by default, and has never been
>>>> ported to python 3 upstream[1], which means it doesn't work at all
>>>> with plain poky. If you need it, please put it in a separate layer
>>>> and/or modernize to work with py3.
>>>>
>>>> https://salsa.debian.org/installer-team/mklibs/-/blob/master/src/mklibs
>>>>
>>>> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>>>> Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
>>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>>> (cherry picked from commit 908df863b419d1cad7317153101fc827e7e3a354)
>>>
>>> What issue is it causing in hardknott? Normally we don't backport invasive
>>> changes like that...
>>>
>>
>> The problem is that mklibs-native doesn't build with gcc 11, and
>> "image-mklibs" was in USER_CLASSES by default in hardknott.
>>
>> I sent a patch to fix mklibs build here:
>>
>> https://lists.openembedded.org/g/openembedded-core/message/151982
> 
> This fix is correct and it is trivial. We can apply it
> 
>>
>> but after some discussions we just decided to drop mklibs support
>> entirely with the proposed patch.
> 
> Was there any other reason ?
> 

To have it successfully build (with mklibs actually enabled by putting 
your image in MKLIBS_OPTIMIZED_IMAGES) would require additional fixes, 
including updating mklibs to python3 I believe.

/Jacob

