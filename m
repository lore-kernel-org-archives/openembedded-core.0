Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.14216.1614271924462854073
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Feb 2021 08:52:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NgWqcvQ9;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id e3so5891pfj.6
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Feb 2021 08:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MKo1kogzSm28hQ0gJsvbLPmvK4+N671qxnTFcr75qQ8=;
        b=NgWqcvQ9Auf8cGMw1SdOKlzYQARxLbYeLGcyVnbXQcEhRfoiHbVZuWmQvuaQjLOPbm
         H87bkrfEQjGtBucRWDWxh7dxmCfngkWubQ5YrAg0uSdk1pnK00s4JCuUiTE6EeE1slE0
         PE+f4qBlWkBQKwHjs/0zJ9DqL72cw27eqpduse1fQvvq88cC3iFnb4D3S5e2TMSIMD40
         xrjrVpQIaujPqY76Ei/n4tcDobIzYBqCjn8N0xSiyu5iXZFJvyJXnOJntcGxrwUT6gf9
         3dxFrTPWHiaqYmlo0Lq5JlF6bUR09uJbqt8T2CPCfdDshCxNM4bJGOL0NFH5Nd674Afn
         fAlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=MKo1kogzSm28hQ0gJsvbLPmvK4+N671qxnTFcr75qQ8=;
        b=B6QP6vzZqGYxgpvLCBBsgkBG1Erfo/5EiSbDRRWpomRGnpsCRdXQcHvqjVcYfR2mII
         PvKm7hVrBA30tTZBOHMMkKdj+KCNl3AipTpM34Ux7b7IM0bhqBPhbfGOzVQNWAQfvOYY
         qb7KS9g6x19ed+XcgMIkgj1WkVBVcD8Ug12DEVsUihyRp7nj/ZtaaM5y7lhrljClGV/+
         +3RxsPb7oYQqSzQo65XG3NfJ9B2uUK4H0LzbSK6Bn60SaWNUNl9j6BZyBH9vES3CFLR0
         hBwJ8byA/r9J9yaKUtg6bF6+Pbmwro7bY7p5kFd7MG/oTMNe0+S3g3fqSnm98xYJ/B4o
         r68A==
X-Gm-Message-State: AOAM531SnTIXP6orvahgfQYGYgMTkAAxLJVmEUgMmbomJvEzjgUQSCDQ
	+fCEWDHs7fjaG0K6M+DJQzReRdpNh0Tziw==
X-Google-Smtp-Source: ABdhPJznz/NQazYkVZfePyPBSCctJ4wOjAdDP9p9JDD8pDE1GxIntr+LrDf3Tr2eymAL/Qlzmf+3JQ==
X-Received: by 2002:a63:504a:: with SMTP id q10mr3758679pgl.188.1614271923517;
        Thu, 25 Feb 2021 08:52:03 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::d2c6? ([2601:646:9200:a0f0::d2c6])
        by smtp.gmail.com with ESMTPSA id c12sm6364088pjq.48.2021.02.25.08.52.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Feb 2021 08:52:03 -0800 (PST)
Subject: Re: [OE-core] [qa-build-notification] QA notification for completed autobuilder build (yocto-3.1.6.rc1)
To: openembedded-core@lists.openembedded.org
References: <20210222224808.50B89817FA08@fedora32-ty-1.yocto.io>
 <BYAPR11MB36240D3D33192AF2180FB382E39E9@BYAPR11MB3624.namprd11.prod.outlook.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <cba7b326-e7b2-87d0-be2c-11f27ca3292a@gmail.com>
Date: Thu, 25 Feb 2021 08:52:01 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <BYAPR11MB36240D3D33192AF2180FB382E39E9@BYAPR11MB3624.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

lgtm

On 2/24/21 11:35 PM, Sangeeta Jain wrote:
> Hi all,
> 
> This is the full report for yocto-3.1.6.rc1:
> https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?h=intel-yocto-testresults
> 
> ======= Summary ========
> No high milestone defects.
> 
> no new issue found
> 
> Thanks,
> Sangeeta
> 
>> -----Original Message-----
>> From: qa-build-notification@lists.yoctoproject.org <qa-build-
>> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
>> Sent: Tuesday, 23 February, 2021 6:48 AM
>> To: yocto@lists.yoctoproject.org
>> Cc: qa-build-notification@lists.yoctoproject.org
>> Subject: [qa-build-notification] QA notification for completed autobuilder build
>> (yocto-3.1.6.rc1)
>>
>>
>> A build flagged for QA (yocto-3.1.6.rc1) was completed on the autobuilder and is
>> available at:
>>
>>
>>      https://autobuilder.yocto.io/pub/releases/yocto-3.1.6.rc1
>>
>>
>> Build hash information:
>>
>> bitbake: fa94374baea75a94e3a488126ca7d8e241a77acd
>> meta-arm: 02c660521619ddb7a9495d65403aaa2636747ce8
>> meta-gplv2: 60b251c25ba87e946a0ca4cdc8d17b1cb09292ac
>> meta-intel: 4bd62a7e154b8c9e8a114f452d3b062d8d058118
>> meta-kernel: f793168bd19af3d8c5a260dd35f387ed9a31794b
>> meta-mingw: 524de686205b5d6736661d4532f5f98fee8589b7
>> oecore: a8debddd6cbdd70db74e096d72f97fbee008ee63
>> poky: a13bda44fcda4e79e9aed39ca1495eabecb6a7b7
>>
>>
>>
>> This is an automated message from the Yocto Project Autobuilder
>> Git: git://git.yoctoproject.org/yocto-autobuilder2
>> Email: richard.purdie@linuxfoundation.org
>>
>>
>>
>>
>>
>>
>>
> 
> 
> 
> 
> 
