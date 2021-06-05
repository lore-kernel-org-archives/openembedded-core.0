Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web09.13436.1622907141842016677
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Jun 2021 08:32:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SLOMpGQQ;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id e22so10239986pgv.10
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Jun 2021 08:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Q8VZjYMTTzrMLvVSLLAydOK1PbvVhF1dfnOlcDbh3DM=;
        b=SLOMpGQQVN5Zbu/T1Plalr54TVnv7JEyYtvOB/E5Y+L8FcJ+/xWQmO0GCEK28yk7ff
         Kyy0w8UP/t9xws42ojhJmmr44mrju0fT+a5LlMXN78Vx0oUia6WJBRv+/UCiHpPu6sxc
         6VsEPWi7awwdIhVDuY0nkKkv9uRGbW+JRVavy/JVdWn86NPulGDTS+TJgwWM7Z9xyB/i
         hq7ztGItmZR/7UP0re5yKv3XhoLW5BmBBDkOvrwQWrS/G+ICHSCYZsn/6kaBZnAJkhpc
         iwy/1AG0M5uRrRzSC/3OT9/dPR2Ah15XX9CytMopzJB8K4oVxO10/JzzJqxTnIgwM38H
         UF0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Q8VZjYMTTzrMLvVSLLAydOK1PbvVhF1dfnOlcDbh3DM=;
        b=fHY6d2Kwv0OWyT+Nx5Ojl+bHgH93TX+feEtuUVrZRL98EWXGvIa24DlngYOSPwQEvw
         soqdmXv3TZFBKA76Bz+PuhKK91gW5/FZtP6Oa6cTxbZVE7L0NeJQeYA13UZ5vv/+VpfL
         bV3oCB0GvhJJDPxBir/PvVUST5FpJx//2jT827E6/evOPSl4u3NAoIOurw4xKs9UcgPg
         BDn278YWdhqt9QMPp7z2KI0357BplJ0g2jJZjjGwbNc0ywC3i8BcVgFgvL92MEI4HGdG
         7YjuRwcrQRVrn9fBD7xCYeRO0gu2oWna4QpPy71oxeBD+ZioJYHtKQOLNvpPE3K7Kpa6
         2G9A==
X-Gm-Message-State: AOAM530t5eKX+HsQpR5MplOFyxeQ1m4KtiIQM5YAJayGudFPXIeTn1nT
	T8F74AMdYBxnWeaHWH3xJm6YPxxbG1+Q3g==
X-Google-Smtp-Source: ABdhPJzsu1wY7LBD5B7y4dExe9pqPY4HKuo0FVAUxKqGdRHk728+Wox0+mi1xhf3LbU0CeMZ/qRoLQ==
X-Received: by 2002:aa7:8809:0:b029:2de:3b94:487e with SMTP id c9-20020aa788090000b02902de3b94487emr9836071pfo.33.1622907140897;
        Sat, 05 Jun 2021 08:32:20 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::6bc9? ([2601:646:9200:a0f0::6bc9])
        by smtp.gmail.com with ESMTPSA id f7sm4219497pfk.191.2021.06.05.08.32.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Jun 2021 08:32:20 -0700 (PDT)
Subject: Re: [OE-core] [PATCH 04/10] cmake: update 3.20.2 -> 3.20.3
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20210604091458.1381144-1-alex.kanavin@gmail.com>
 <20210604091458.1381144-4-alex.kanavin@gmail.com>
 <1685B658849E960A.4717@lists.openembedded.org>
 <f9cc3da4399fcca66a9c43638dcf4eca162ba23a.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <50a73766-dc52-0600-a6cd-7ab422030782@gmail.com>
Date: Sat, 5 Jun 2021 08:32:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <f9cc3da4399fcca66a9c43638dcf4eca162ba23a.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 6/5/21 8:13 AM, Richard Purdie wrote:
> On Sat, 2021-06-05 at 15:35 +0100, Richard Purdie via lists.openembedded.org wrote:
>> On Fri, 2021-06-04 at 11:14 +0200, Alexander Kanavin wrote:
>>> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>>> ---
>>>   .../cmake/{cmake-native_3.20.2.bb => cmake-native_3.20.3.bb}    | 0
>>>   meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
>>>   .../recipes-devtools/cmake/{cmake_3.20.2.bb => cmake_3.20.3.bb} | 0
>>>   3 files changed, 1 insertion(+), 1 deletion(-)
>>>   rename meta/recipes-devtools/cmake/{cmake-native_3.20.2.bb => cmake-native_3.20.3.bb} (100%)
>>>   rename meta/recipes-devtools/cmake/{cmake_3.20.2.bb => cmake_3.20.3.bb} (100%)
>>>
>>> diff --git a/meta/recipes-devtools/cmake/cmake-native_3.20.2.bb b/meta/recipes-devtools/cmake/cmake-native_3.20.3.bb
>>> similarity index 100%
>>> rename from meta/recipes-devtools/cmake/cmake-native_3.20.2.bb
>>> rename to meta/recipes-devtools/cmake/cmake-native_3.20.3.bb
>>> diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
>>> index be43760628..0987c01c87 100644
>>> --- a/meta/recipes-devtools/cmake/cmake.inc
>>> +++ b/meta/recipes-devtools/cmake/cmake.inc
>>> @@ -21,7 +21,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
>>>              file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
>>>   "
>>>   
>>>
>>>
>>>
>>> -SRC_URI[sha256sum] = "aecf6ecb975179eb3bb6a4a50cae192d41e92b9372b02300f9e8f1d5f559544e"
>>> +SRC_URI[sha256sum] = "4d008ac3461e271fcfac26a05936f77fc7ab64402156fb371d41284851a651b8"
>>>   
>>>
>>>
>>>
>>>   UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
>>>   
>>>
>>>
>>>
>>> diff --git a/meta/recipes-devtools/cmake/cmake_3.20.2.bb b/meta/recipes-devtools/cmake/cmake_3.20.3.bb
>>> similarity index 100%
>>> rename from meta/recipes-devtools/cmake/cmake_3.20.2.bb
>>> rename to meta/recipes-devtools/cmake/cmake_3.20.3.bb
>>
>> Seems there is some intermittent issue that the cmake upgrade brings in:
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/3509/steps/13/logs/stdio
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/3513/steps/12/logs/stdio
>>
>> yet the latter passed in:
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/3514
> 
> Re-ran it on centos8 and it failed:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/3515
> 
> so this looks to be centos8 specific.
> 

CMake Error at cmake_install.cmake:46 (file):
   file INSTALL cannot set modification time on
 
"/home/pokybuild/yocto-worker/genericx86/build/build/tmp/work/genericx86-poky-linux/core-image-sato/1.0-r0/testimage-sdk/assimppcyyuhv8/install/usr/local/lib/cmake/assimp-4.1/assimp-config.cmake":
   Invalid argument.
make: *** [Makefile:74: install] Error 1
No python package in the SDK

I wonder if its some parallel install race. Can we try disabling 
parallelism during install for the assimp build during test and see if 
that helps.

> Cheers,
> 
> Richard
> 
> 
> 
> 
> 
