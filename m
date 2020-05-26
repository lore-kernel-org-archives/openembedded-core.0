Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web12.48351.1590492053175796594
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2020 04:20:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@googlemail.com header.s=20161025 header.b=vYMJ6PR4;
 spf=pass (domain: googlemail.com, ip: 209.85.128.65, mailfrom: matthias.schoepfer@googlemail.com)
Received: by mail-wm1-f65.google.com with SMTP id u188so2840262wmu.1
        for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2020 04:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=crVwiDSVfVfLtYevVpYoav/M7k1t4HPZbuaVps6hm44=;
        b=vYMJ6PR4C0/4661W1FQK6xWdbcnDZ0M/lwR5KydXqt31jnhWKIh2unIaVdZRjsWYia
         D+Dx2hRQBKc55M6UVmVLe5f/PTyLtP6C7TY2msj3GEmHd0GHlCdRIevOp4F4kvorN52r
         cg9TszcEKSabhl/bb7+2uP0XP773X1Pw+6zMyB92+h2ZsYIfOIDulxbWfrfkNyUK37NJ
         n1xu5oSRAOjrZltcdlJBkHBeCAt+dO1F0uf4p9dymgOsiS1cqXVWI9VUNczeolZKGfbR
         POffpVv/uznTwoIipIF39URb4dxbjwLZ9Cm/QvCksAFlDkQQgSYGCN4lj8upbwAZw2S8
         m7uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=crVwiDSVfVfLtYevVpYoav/M7k1t4HPZbuaVps6hm44=;
        b=q2I2oZMsTL00NZriv2OqhzI7IfEMTcWfrArJ/RWMjMPsvUTo3UgfAzWI93PyTRL6Ji
         xCruINFz9DSsNC8NNOrRVcj9f4EneFOib0OBwXlEMVLElkQhgpQwyA2PVoClkaPBlh3d
         zYRO/OMIcCoinLhYNq/4Z1i+AMlN+DjMNVuROlIfxsDhQI/2m+SKpT/c+d4Ue73/kt0e
         zf2kLlXp1sqCI+9WjRHgmSJF5kTXtSQcIMvuFePk1gcKNq7Fh5JCheDVVpKZq44zYvKx
         JWdlhtA25F6ZeZbB4xpI2OYC9EkqSFXM7XtkFzhdjdM3dhDzeROLpx73bUcJtQeQ+2w7
         z3yw==
X-Gm-Message-State: AOAM532CzdQUlHpMHVEZd00OwSzuw8w1fPHB4Ji9ty4glUWD/FgA/pfe
	fHPUli0FpAhhlCB4tpBlDEI=
X-Google-Smtp-Source: ABdhPJxouKpa+yxbdWqtOEwGV5MNMPpovQjJIH5bBBlqz5jo4WsNklu8dBk/zPdpOMZdDjOjVpQdBw==
X-Received: by 2002:a7b:c385:: with SMTP id s5mr995294wmj.121.1590492051643;
        Tue, 26 May 2020 04:20:51 -0700 (PDT)
Return-Path: <matthias.schoepfer@googlemail.com>
Received: from [172.16.100.14] ([213.168.66.146])
        by smtp.gmail.com with ESMTPSA id 190sm14868383wmb.23.2020.05.26.04.20.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2020 04:20:50 -0700 (PDT)
Subject: Re: [OE-core] [meta-oe][PATCH 3/4] libgcrypt: made libgcrypt-lic license "GPLv2+ & LGPLv2.1+"
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
References: <20200526081233.62413-1-matthias.schoepfer@googlemail.com>
 <20200526081233.62413-3-matthias.schoepfer@googlemail.com>
 <de59b9f118c6d51c902e50dce97a7680f77e7402.camel@linuxfoundation.org>
From: "Matthias Schoepfer" <matthias.schoepfer@googlemail.com>
Message-ID: <b595d584-b544-b755-d175-85fffbfd31e5@googlemail.com>
Date: Tue, 26 May 2020 13:20:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <de59b9f118c6d51c902e50dce97a7680f77e7402.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Richard,

On 5/26/20 10:19 AM, Richard Purdie wrote:
> On Tue, 2020-05-26 at 10:12 +0200, Matthias Schoepfer via
> lists.openembedded.org wrote:
>> From: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
>>
>> With the exception of dumpsexp.c, which is GPLv3, all other parts
>> of libgcrypt are GPLv2+ & LGPLv2.1+, BSD or MIT or other "permissive"
>> licenses.
>>
>> If libgcrypt-lic is not set to "GPLv2+ & LGPLv2.1+", image creation
>> will
>> fail with settings like
>>
>> INCOMPATIBLE_LICENSE = "GPLv3 LGPLv3 GPLv3+ LGPLv3+ GPL-3.0 LGPL-3.0
>> AGPL-3.0"
>> COPY_LIC_MANIFEST = "1"
>> COPY_LIC_DIRS = "1"
>> LICENSE_CREATE_PACKAGE = "1"
>>
>> Signed-off-by: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
>> ---
>>   meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb
>> b/meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb
>> index 4e0eb0a169..fd40cdcf83 100644
>> --- a/meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb
>> +++ b/meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb
>> @@ -7,6 +7,7 @@ SECTION = "libs"
>>   LICENSE = "GPLv2+ & LGPLv2.1+ & GPLv3+"
>>   LICENSE_${PN} = "LGPLv2.1+"
>>   LICENSE_${PN}-dev = "GPLv2+ & LGPLv2.1+"
>> +LICENSE_${PN}-lic = "GPLv2+ & LGPLv2.1+"
>>   LICENSE_dumpsexp-dev = "GPLv3+"
> 
> I don't like this approach at all. Its obviously inconvenient if your
> image uses only the non-GPLv3 pieces but this doesn't change the fact
> that the main package license does include GLPv3 and ${PN}-lic is right
> to include it. You're breaking the metadata to fit your use case for
> convenience.
> 
> If you're excluding GPLv3 things from packaging, you could then (and
> only then) justifiably adjust ${PN}-lic to a different license so the
> code should be doing that, not changing the underlying metadata to suit
> you.

The question here seems to be, is the GPLv3 License itself GPLv3 
licensed. I followed the approach Khem Raj gave me on the yocto mailing 
list. I do not like the approach either, but lack a better solution. In 
this very specific package, only one .c file is licensed GPLv3, even the 
COPYING file claims, everything is GPLv2 and LGPLv2.1+.

dumpsexp, the only GPLv3 file, is not even in the package by default. 
The line
LICENSE_${PN} = "LGPLv2.1+"
pretty much tells the tale here.

Also, LICENSE file states, that there are other licenses also involved, 
BSD 3 Clause, Public Domain and OCB license...

Thanks and Regards,

   Matthias

-- 
Dr.-Ing. Matthias Schöpfer
matthias.schoepfer@googlemail.com
