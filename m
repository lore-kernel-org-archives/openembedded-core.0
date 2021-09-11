Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web08.9462.1631398655032149790
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Sep 2021 15:17:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qu8BEcZp;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id w8so5474732pgf.5
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Sep 2021 15:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=HPokKwdsL8Vd2OpJUjZZUEdNx28SDsijuGMC9R6KY3w=;
        b=qu8BEcZpVRxWBWA+5magdamTGU/BOFgusN5jYs6xKLAxeZeOmSa/no3N33dH8Qw898
         LWCy1NvAZznwT9anqKdq3xhVNeCk2IF53z8oufvWtGM+LqP4mZwRXyUugtj7dSApR+Xj
         EPMKGZFr7ABrdVqeJW9chIq9WIxIBu0zGe6mG2jYx8p7dT9HFKKXQuW8u6wXV7s1Ec9J
         TbDX3XZudYTzWzB4hte7fWsoLICAbolpTUo+A8Wa95drbQ7nObV2CT4mixPeRn1yIwZr
         cBzwe9tzDmJ+WVjpXl8DJ65gkyvEu8vzX0/1CtIWb/bMNur/nUNPDC9eO9md5cIKq4Zr
         Dxqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=HPokKwdsL8Vd2OpJUjZZUEdNx28SDsijuGMC9R6KY3w=;
        b=IuGefSHVkLhdtx3GYRRWLhJm+N3HBpEazzhB5nEMgUnQ0D78gzX5RcvT9tx05M6PYm
         hI7tTbtXn+n74Op5uLfw9+4CcoPMXPgFipJC8h6+og87tZqRGWls1X6kaI1xyK2kno5/
         7EVcrXD9jqGI478uoQpqjlq5D3skj4KPwbWBWJzcszzeCNhGyIS6NFuA1BWqWWFxAOBH
         Fd7CXgZHSbCAR+u2eJifHDqdkLj32j2Cpj4VufRN2i5cP87xRwAduAb0Zlw+GqPP1rME
         Z/TavhVpekUwbbFrjucDqiUBGQWbTTLj/7PB+S0o32XIYzNoLFvLnkRfeF5HrLkyXd2U
         f7jg==
X-Gm-Message-State: AOAM533eOVKgz49geBZNSwha659kmzAPQxMFodBOqvNde40UE5ub3IUC
	ciEohT41yz9rBkylFRy7p68=
X-Google-Smtp-Source: ABdhPJzRCW3SV5J1uwUtO0GxK+oiU0ppSILFwlNItIOfyNkUhQhknXGCaIb0+yhJAMMC+jW+YhkTAg==
X-Received: by 2002:a63:cf44:: with SMTP id b4mr4189000pgj.215.1631398654526;
        Sat, 11 Sep 2021 15:17:34 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:b27c:7a4e:d59f:d7eb? ([2601:202:4180:a5c0:b27c:7a4e:d59f:d7eb])
        by smtp.gmail.com with ESMTPSA id 23sm2971140pgk.89.2021.09.11.15.17.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Sep 2021 15:17:34 -0700 (PDT)
Subject: Re: [qa-build-notification] QA notification for completed autobuilder build (yocto-3.3.3.rc2)
To: qa-build-notification@lists.yoctoproject.org,
 yocto@lists.yoctoproject.org,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: "Jain, Sangeeta" <sangeeta.jain@intel.com>
References: <32334a100a5bd0c20239e42a463e5604f00345ec.camel@linuxfoundation.org>
 <BN9PR11MB53728D00D9321AE9BECCB725BBD69@BN9PR11MB5372.namprd11.prod.outlook.com>
From: "Armin Kuster" <akuster808@gmail.com>
Message-ID: <997e565f-768a-2020-35ac-55497156f121@gmail.com>
Date: Sat, 11 Sep 2021 15:17:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <BN9PR11MB53728D00D9321AE9BECCB725BBD69@BN9PR11MB5372.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 9/9/21 11:39 PM, Teoh, Jay Shen wrote:
> Hello all,
>
> Intel and WR YP QA is planning for QA execution for YP build yocto-3.3.3.rc2 We are planning to execute following tests for this cycle:
>
> OEQA-manual tests for following module:
> 1. OE-Core
> 2. BSP-hw
>
> Runtime auto test for following platforms:
> 1. MinnowTurbot 32-bit
> 2. Coffee Lake
> 3. NUC 7
> 4. NUC 6
> 5. Edgerouter
> 6. Beaglebone
>
> ETA for completion is next Wednesday, 15 September.
Thanks,

Your work is much appreciated.

- armin
>
> Thanks,
> Jay
>> -----Original Message-----
>> From: qa-build-notification@lists.yoctoproject.org <qa-build-
>> notification@lists.yoctoproject.org> On Behalf Of Richard Purdie
>> Sent: Friday, 10 September, 2021 4:00 AM
>> To: <yocto@lists.yoctoproject.org> <yocto@lists.yoctoproject.org>
>> Cc: qa-build-notification <qa-build-notification@lists.yoctoproject.org>
>> Subject: [qa-build-notification] QA notification for completed autobuilder build
>> (yocto-3.3.3.rc2)
>>
>> A build flagged for QA (yocto-3.3.3.rc2) was completed on the autobuilder and is
>> available at:
>>
>>
>>     https://autobuilder.yocto.io/pub/releases/yocto-3.3.3.rc2
>>
>>
>> Build hash information:
>>
>> bitbake: c7b506d11df78cfc4610db6578745eaa6220b13a
>> meta-agl: 60344efa7a50dc2548fc4b5d68b5ad4d60c4023a
>> meta-arm: ba82ea920a3a43244a0a72bd74817e2f00f4a1af
>> meta-aws: 171aa2cf4d12ff4877e9104b6ec46be54128e3d8
>> meta-gplv2: 9e119f333cc8f53bd3cf64326f826dbc6ce3db0f
>> meta-intel: 5c4a6b02f650a99a5ec55561443fcf880a863d19
>> meta-mingw: 422b96cb2b6116442be1f40dfb5bd77447d1219e
>> meta-openembedded: 7bd7e1da9034e72ca4262dba55f70b2b23499aae
>> oecore: 567dd35d893c5d8969d41f263a24da8fbae3fc2f
>> poky: 0a2ca9d60f3851515a79d5aa9ddd8b4069b5a206
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

