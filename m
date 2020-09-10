Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web12.10902.1599698766234244537
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 17:46:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=r4g5R+1P;
 spf=pass (domain: gmail.com, ip: 209.85.210.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f194.google.com with SMTP id l126so3635942pfd.5
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2020 17:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nnrwwRHmL+2cKIspx+g5j4yfQO5FRQ9pIsmN7xQkzA0=;
        b=r4g5R+1PjUWkr8DJI+kCuhfMsSrsP4Kz7OPmZjvFRq/Qoa2A5P/YlFvlTYKXiv+Fa8
         nf/si24dN9lx05PGm4yY3t8ThmVJu5MYCg4yaa6mcVSW1kjfWlLXhBc0xcpDAauK0Hkd
         IUyDyEH5NxxkJ4FZMpBmzTM+FnqwckXfhiylCCHkLjzjjA7TpgHqDhmF0rYITBuBafMN
         YTVv36GCqoBXFYlmvocw1hsg/cciSiUyTBq15qNH4a4jnzrhC24k2nykxNo3hncP1GE3
         IhSG4zub14IyMfoztuOyN2jv1yzOAj3FSYzxIbUbF6v3ov9emIn9Tqmu3/vX6VUKx3ty
         77hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=nnrwwRHmL+2cKIspx+g5j4yfQO5FRQ9pIsmN7xQkzA0=;
        b=erLv/FBRLgKkkIQNnutRclYhZ7jgYsRJ1BJd/ZNOcQdheuPeTcCePmLgG2DuMsx7oT
         JQsTsBkajyby5Q9IFT5prfujG+rkuFxQUmSTdQRocLWtz4Jg/rFRgJD5KqwtqFgqugfS
         +h7sKl2NBhKpMKtx5UqxZjf+UBZ3Fxlca/d1JDteLbUa+/DYNuLKo9zd6SqaL1hm6cNg
         U0/r7k/ZmlHH4UrK2lBi7tQceJURbXJhSLCYqaKfJCOX1he+ElkWlm3CoFcwjeGcOmmd
         NDRzj7TZ7H9iGsveK/0puLv0yOY9zfm0X3AeOGtoGc/sLmjaUFyaS6pCpstC31w28w3h
         0tkQ==
X-Gm-Message-State: AOAM530vfGjclpFdk1/o/15IXVdSZroxjNnGyAkzPHsQMIHNLH6J+20x
	5b+myPwx1uSPX+cCQ9XKU4BsKl7vWQXqEw==
X-Google-Smtp-Source: ABdhPJz7gtRxwNvS0LvLrf/OW7tGoq0bjdFrPn/HAGeXD2z1XrN9RdwpnF+t7b7fKWRKu3aKO0vG4w==
X-Received: by 2002:aa7:94a4:: with SMTP id a4mr3034975pfl.49.1599698765290;
        Wed, 09 Sep 2020 17:46:05 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::ff6e? ([2601:646:9200:4e0::ff6e])
        by smtp.gmail.com with ESMTPSA id il14sm293718pjb.54.2020.09.09.17.46.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2020 17:46:04 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] cryptodev: bump 1 commit past 1.11 to fix 5.9-rc1+
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
References: <1599688063-38109-1-git-send-email-denis@denix.org>
 <a1c03ca8-5c09-ee52-7912-42c560ca689c@gmail.com>
 <20200910003838.GC17660@denix.org>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <36ae78d2-f69c-4e0c-26e6-c40c10aacf39@gmail.com>
Date: Wed, 9 Sep 2020 17:46:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200910003838.GC17660@denix.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 9/9/20 5:38 PM, Denys Dmytriyenko wrote:
> On Wed, Sep 09, 2020 at 05:24:05PM -0700, Khem Raj wrote:
>>
>>
>> On 9/9/20 2:47 PM, Denys Dmytriyenko wrote:
>>> From: Denys Dmytriyenko <denys@ti.com>
>>>
>>> There's one commit on top of 1.11 release that fixes builds against kernel 5.9-rc1+.
>>
>> since we call the recipe as 1.11, perhaps its better to explcitly apply
>> this patch via SRC_URI or alter PV to reflect this SRCREV changes,
> 
> Yeah, we went back and forth on this - in the past we had a separate patch 
> applied, as well as just bump the SRCREV. There's no standard so far - we've 
> done both ways. If you want, I can just append SRCPV.

That will be better yes.

> 
> 
>>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>>> ---
>>>  meta/recipes-kernel/cryptodev/cryptodev.inc | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-kernel/cryptodev/cryptodev.inc b/meta/recipes-kernel/cryptodev/cryptodev.inc
>>> index 906f4fc..c050eda 100644
>>> --- a/meta/recipes-kernel/cryptodev/cryptodev.inc
>>> +++ b/meta/recipes-kernel/cryptodev/cryptodev.inc
>>> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>>>  
>>>  SRC_URI = "git://github.com/cryptodev-linux/cryptodev-linux \
>>>             "
>>> -SRCREV = "2299d39475e91392abd050ea09f2d20feecb4adf"
>>> +SRCREV = "fabe5989a3dc9fba0cd0a40b612247cdde351c01"
>>>  
>>>  S = "${WORKDIR}/git"
>>>  
>>>
>>>
>>> 
>>>
>>
