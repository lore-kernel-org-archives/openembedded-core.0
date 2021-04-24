Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.1016.1619283431368777664
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Apr 2021 09:57:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZLgrWVy2;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id q10so37273135pgj.2
        for <openembedded-core@lists.openembedded.org>; Sat, 24 Apr 2021 09:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=ILzyVwpxV9QyXE8huuzKtY/GdmVBF8koiXnnpdZGl3I=;
        b=ZLgrWVy2C+tI4awUJhS3gjVEM4l1qHZ2cRF9OdaQ4uxAJhoB7CdvM1d6SCfB87dwN4
         G9Tbfqwnso3j/f8vtcIBWIRH/GKusz7DtcBqH4h7TSKnWwvQSrH/NcCecrBUMq9AK4CR
         FkEJF362SvQyyiQWnJf1OLX/FMkdAdaIChH9nTJB4AtXSMMgpdLZi+OQUbwqxQq+eCGX
         H7LofwqQIDPHcKa8I/UO2aPN/4WgIb3hzQPd5xBTH6ZSqBzEZCEma9UXZu4ulrPSbr9N
         Wyo/H6dJqDFzVU6Ub84G9yg2sx92d8PrhHBE8GXodPK1EHOaLSJPm/MUeAke+iWEBX4c
         WEpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=ILzyVwpxV9QyXE8huuzKtY/GdmVBF8koiXnnpdZGl3I=;
        b=VDmResbbZ27VEGAo2tA4Z+xtg+0GBcRyJpTM4DBwC0iP2RgeLKQm9Hk7vtXrl88Bu5
         n80KC6VSfJHuQGXngAcIYQg6EKl6ysPezndUHKPKh2CX2C9yWvbhgVVMJGKwZ7kO94Mv
         Ymz4Xn1MEibheG4FBecLsj8E1HIKUBsfGRZzIMUbq4rIzbBgLLfk3XGnVCpe0vbmt/DG
         EL/rioMM3+d/1X1L37TSehG0FrcoUE3IwRrMbyvsJwqmv7YP6M1R7BWkKv7hHAFjzIq6
         3VIH0FcMbfFFXF8svqNJ7UffIJNY8cNKdaZ2ukdncoy4IrmR34HQD9O7tWs/S4fwYKZK
         5XLg==
X-Gm-Message-State: AOAM532FlDW80deQG/PTWy202iW12/7T4VImP62zIU2DMrRUHvtDchTw
	vsfqPKtEhinHKCY3ZY65pdPupp58GPKuPQ==
X-Google-Smtp-Source: ABdhPJyFhBMcvZQyVL3Gb4TKUVH4dCqOVmXDkC9xmb8aMCS/hDjLgioyWqJIiUQrr5eHSO9zaKeeuQ==
X-Received: by 2002:a63:fe53:: with SMTP id x19mr8935754pgj.449.1619283430718;
        Sat, 24 Apr 2021 09:57:10 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:9c11:697b:fdac:256e? ([2601:202:4180:a5c0:9c11:697b:fdac:256e])
        by smtp.gmail.com with ESMTPSA id n16sm7703738pjv.32.2021.04.24.09.57.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Apr 2021 09:57:10 -0700 (PDT)
Subject: Re: [OE-core] [PATCH 5/6] packagegroups/packagegroup-base: add seccomp grp
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20210424155639.1131482-1-akuster808@gmail.com>
 <20210424155639.1131482-6-akuster808@gmail.com>
 <CAMKF1soDiK_2tQ-sf8vHCFX2vABateQAsgmJpomNLrC4tFY95A@mail.gmail.com>
From: "Armin Kuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <cca3a13e-d4b0-75a1-d221-cb97c9a21972@gmail.com>
Date: Sat, 24 Apr 2021 09:57:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1soDiK_2tQ-sf8vHCFX2vABateQAsgmJpomNLrC4tFY95A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 4/24/21 9:23 AM, Khem Raj wrote:
> On Sat, Apr 24, 2021 at 8:56 AM Armin Kuster <akuster808@gmail.com> wrote:
>> This allows for inclusion of the package when
>> the FEATURE is set
>>
> isn't liibseccomp a library which would be automatically included if a
> package needs it ?
> in that case we may avoid this packagegrooup

Err, you are right..

thanks,
Armin

>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>  meta/recipes-core/packagegroups/packagegroup-base.bb | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
>> index 6d4d7e6f7e7..3482ea43133 100644
>> --- a/meta/recipes-core/packagegroups/packagegroup-base.bb
>> +++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
>> @@ -38,6 +38,7 @@ PACKAGES = ' \
>>              ${@bb.utils.contains("DISTRO_FEATURES", "ppp", "packagegroup-base-ppp", "", d)} \
>>              ${@bb.utils.contains("DISTRO_FEATURES", "smbfs", "packagegroup-base-smbfs", "", d)} \
>>              ${@bb.utils.contains("DISTRO_FEATURES", "zeroconf", "packagegroup-base-zeroconf", "", d)} \
>> +            ${@bb.utils.contains("DISTRO_FEATURES", "seccomp", "packagegroup-base-seccomp", "", d)} \
>>              \
>>              '
>>
>> @@ -76,6 +77,7 @@ RDEPENDS_packagegroup-base = "\
>>      ${@bb.utils.contains('DISTRO_FEATURES', 'ipsec', 'packagegroup-base-ipsec', '',d)} \
>>      ${@bb.utils.contains('DISTRO_FEATURES', 'ppp', 'packagegroup-base-ppp', '',d)} \
>>      ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'packagegroup-base-zeroconf', '',d)} \
>> +    ${@bb.utils.contains("DISTRO_FEATURES", "seccomp", "packagegroup-base-seccomp", "", d)} \
>>      "
>>
>>
>> @@ -343,3 +345,7 @@ RDEPENDS_packagegroup-base-serial = "\
>>  SUMMARY_packagegroup-base-phone = "Cellular telephony (voice) support"
>>  RDEPENDS_packagegroup-base-phone = "\
>>      ofono"
>> +
>> +SUMMARY_packagegroup-base-seccomp = "Seccomp support"
>> +RDEPENDS_packagegroup-base-seccomp = "\
>> +    libseccomp"
>> --
>> 2.25.1
>>
>>
>> 
>>

