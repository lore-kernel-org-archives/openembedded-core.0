Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.1036.1608309130371958787
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Dec 2020 08:32:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ELYKE5EL;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id q22so1817061pfk.12
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Dec 2020 08:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DNr+grUNaVTneJllLk7if2ImUqi/h1/QKCnHcT0riHI=;
        b=ELYKE5ELsDKsKb1CfIsD5ISsdMqWHoZM9YXNP94X7uuK/DcnkPgglLvoS/E6jEQbET
         CI0o2EH7Q+FM5kkXWLRHvkjMwGr3iHpNhkotWSbGlrG6UhijnHGHAK7Ocjm7z1zMdPuY
         Zm4LeFPV9BpFJl/zsinH6ZDsGhz8ZeCJX/EQzoUpSv3R2n8kXnRjoDTv9fO8tG209nCJ
         cswWoNTrpcY43zN26Xbi48IRVgQXG5OJwt15++i25MYWRLwz9Q5K/FcGsAAvLQ/eueWv
         OcuQXTAnjuvz0sIXq19Iy5ANNRvC4HFrydNSb/dcPQhJssD/tQNGqzKAWONBt5wqbhZt
         BWdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DNr+grUNaVTneJllLk7if2ImUqi/h1/QKCnHcT0riHI=;
        b=EF5ogR7PSoo3LTgUyZ/PmBL08Q8W8HIyvEM1gytJ3laOTeH8fNv/jSpUr6xQoCy6GD
         FGkWhViO1KdUvJkRSA1TYthz22d9RPuLWx/5vZ4m32vPOntjKXoknr72VsoB6upXz/Lb
         4eA2kpl6xzFCaIwXs3sdpHGgP31l4aHlQ2VDy+TsMjWLMIrBgC2B7A73vdn7VhCvqdbJ
         jEza3/Fd9cNflXauBUgbzv/rxOt2jCY5xyEJubP5JkaLfwJ5ctJF5dWnmpWZlybKT422
         PUJwmSTXrvYjttNEOrTUk9hNjQ7yLPRKxrAR9sSlU7KJhhjDrKYbVkdIeLxMUWRdeymC
         M8pw==
X-Gm-Message-State: AOAM531JWjv5Ui2+xCRoIJ6Elorzrs2tz495MyJY/L/ULstJK5tMTyA0
	hBMHG3DXl5kJnYUam2ZJh7I=
X-Google-Smtp-Source: ABdhPJyEM+zOv9cLo13ipqXxQzBLF8wtYqRvwf9pAwD6+YgQE2h2rMtK0fuZv+j2iKmme8tGLnN4nA==
X-Received: by 2002:a63:3d8:: with SMTP id 207mr4707089pgd.215.1608309129782;
        Fri, 18 Dec 2020 08:32:09 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::9ac9? ([2601:646:9200:4e0::9ac9])
        by smtp.gmail.com with ESMTPSA id b2sm8980531pfo.164.2020.12.18.08.32.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Dec 2020 08:32:09 -0800 (PST)
Subject: Re: [OE-core] [SDK] How to use the gold linker
To: Christian Eggers <ceggers@arri.de>,
 openembedded-core@lists.openembedded.org
Cc: Christopher Larson <kergoth@gmail.com>
References: <5776519.IOBmFsySL6@n95hx1g2>
 <CABcZAN=QdWzV=LObrdHMWfcDx_1VV3Ce-i_nYL3H7WYUcCtSSA@mail.gmail.com>
 <074c7da4-c8d0-680d-d33d-476dcc51c5b7@gmail.com>
 <1664221.2vONSAOZnb@n95hx1g2>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <52f8e74e-284e-60d7-757e-843a8b5a7de3@gmail.com>
Date: Fri, 18 Dec 2020 08:32:08 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1664221.2vONSAOZnb@n95hx1g2>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 12/18/20 3:30 AM, Christian Eggers wrote:
> Hi Khem, hi Christopher,
> 
> On Tuesday, 15 December 2020, 18:15:52 CET, Khem Raj wrote:
>>
>> On 12/15/20 8:50 AM, Christopher Larson wrote:
>>> This can be fixed via two changes, first removing real-ld, then adding
>>> the missing links to fix -fuse-ld=. I have this in one of my
>>> not-yet-submitted bbappends:
>>>
>>>       # Remove real-ld, as it prevents checking for ld or gold in the
>>> search path
>>>       rm -f ${dest}real-ld$suffix
>>>       # Then add links to fix builds with -fuse-ld=
>>>       ln -sf ${BINRELPATH}/${TARGET_PREFIX}ld.gold$suffix
>>> ${dest}ld.gold$suffix
>>>       ln -sf ${BINRELPATH}/${TARGET_PREFIX}ld.bfd$suffix ${dest}ld.bfd$suffix
>>>
>>
>> right this looks ok. Can you submit this for upstreaming please
> 
> while this change works "fine for me" (I can now use ld.gold which is about
> 3 times faster for my project), there are side effects:
> 
>> ${CC} -fuse-ld=bfd -print-prog-name=ld
> /opt/poky-tiny/3.1.4/sysroots/x86_64-pokysdk-linux/usr/libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/9.3.0/ld.bfd
> 
>> ${CC} -fuse-ld=bfd -o test test.c
> works fine
> 
>> ${CC} -fuse-ld=gold -print-prog-name=ld
> /opt/poky-tiny/3.1.4/sysroots/x86_64-pokysdk-linux/usr/libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/9.3.0/ld.gold
> 
>> ${CC} -fuse-ld=gold -o test test.c
> also works fine
> 
>> ${CC} print-prog-name=ld
> /opt/poky-tiny/3.1.4/sysroots/x86_64-pokysdk-linux/usr/libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/9.3.0/ld
> 
>> ${CC} -o test test.c
> collect2: fatal error: cannot find ‘ld’
> compilation terminated.
> 
>> ls -l /opt/poky-tiny/3.1.4/sysroots/x86_64-pokysdk-linux/usr/libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/9.3.0/ld
> /opt/poky-tiny/3.1.4/sysroots/x86_64-pokysdk-linux/usr/libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/9.3.0/ld -> ../../../../../bin/arm-poky-linux-gnueabi/arm-poky-linux-gnueabi-ld
> 

we could patch it out in gcc sources so always use the real one because 
the default is one of gold or bfd linker anyway
> 
> 
> regards
> Christian
> 
> 
> 
> 
> ________________________________
>   [http://assets.arri.com/media/sign/2020-04-03-E-mail-signature-Stellar2_V1.jpg] <https://microsites.arri.com/stellar/>
> 
> Get all the latest information from www.arri.com<https://www.arri.com/>, Facebook<https://www.facebook.com/TeamARRI>, Twitter<https://twitter.com/ARRIChannel>, Instagram<https://instagram.com/arri> and YouTube<https://www.youtube.com/user/ARRIChannel>.
> 
> Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
> Sitz: München - Registergericht: Amtsgericht München - Handelsregisternummer: HRA 57918
> Persönlich haftender Gesellschafter: Arnold & Richter Cine Technik GmbH
> Sitz: München - Registergericht: Amtsgericht München - Handelsregisternummer: HRB 54477
> Geschäftsführer: Dr. Michael Neuhäuser; Stephan Schenk; Walter Trauninger; Markus Zeiler
> 
