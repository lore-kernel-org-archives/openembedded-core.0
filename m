Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web09.9791.1626282457673060970
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jul 2021 10:07:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TSlw8J7B;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id l11so1987864pji.5
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jul 2021 10:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CAxfToTcd1wCZXKLC4rPLc7iEAlnyP2qp8rNN37nMSQ=;
        b=TSlw8J7BDi6ixNVqU/9A+sl0XgiFp5EoF19cTSd0jV6wS/klOVu+3PxVceWot7gecW
         VObXb7OQwoFhSKFsMi7iw4dG7A59KLHBBSmh/CSpyHhogPoVMSyyAu8d3fqP6arbT9Iw
         LiPvuYYeRHgTn4mjMiBbRcwXUgt9YNA0+iw/BAwXIrJOxJkQ7qR33YOYJhEpcuQCWh+H
         55mcBR580bg8zRAbivvmjkUrjnfaXEHB7kuHM06bNNhnu+gDr7Or16pwK3pPZGTU7M3k
         cnT2dXGuA3xoA12atagrM+SXanQU6eJ0NDDQZIy6HJj+oBIbUQnYl0iCV7kF/lSC5w1k
         vRrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=CAxfToTcd1wCZXKLC4rPLc7iEAlnyP2qp8rNN37nMSQ=;
        b=DaCrd74qyPatm0Qleg3UoppPlLrdjFQ1b5XDp0rfjwMP13J3EdWtV4fVDrP06cNEc4
         3on3kDGsmMJrDfDqPlATocArnQuXf5XCa2mvGSu6qtT7jUXuX2LiB80/qY8Z70p98gxg
         eQsg/y9xBDX1ifi71/KfvpUWLmXUBhs8HK7Pok5xZoWWb8+GylMoxB39XE12KVirBahL
         nzV5q8E6IiQ0tpox0z/6jFuB2LjdL1JJS+S6C8F3stMPSLmLA0DDtOBung6ZA2vy6vsC
         GzqIwWAJDh+51o4ok2V5nDsorkkEl8IYBcxcBDai59ZvlKu3sGfk5g+Lc7mXr0TUPTUJ
         2Gow==
X-Gm-Message-State: AOAM5311fBlkksipkPMYmWd0KEpdU0sXNvC6VJ5Yt4ZlpkBFh/ptYz8l
	hd0aoUPLncJO8Hqoo84uJd8xG6WUb05gSQ==
X-Google-Smtp-Source: ABdhPJw10kV1pQyfpNkUOYmMaDQ3k+Eh4zlJGQQ5reIvFatygUbrVyJrrKpq9ez6u4O2z4Vv9hvETg==
X-Received: by 2002:a17:90a:5644:: with SMTP id d4mr10605314pji.9.1626282456956;
        Wed, 14 Jul 2021 10:07:36 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:9c22:5530:e06f:dd43? ([2601:646:9200:a0f0:9c22:5530:e06f:dd43])
        by smtp.gmail.com with ESMTPSA id 1sm3478495pfm.123.2021.07.14.10.07.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jul 2021 10:07:36 -0700 (PDT)
Subject: Re: [OE-core] [PATCH 02/21] tcmode-default.inc: do not set PREFERRED_VERSION for toolchain items
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20210714122606.605142-1-alex.kanavin@gmail.com>
 <20210714122606.605142-2-alex.kanavin@gmail.com>
 <CADkTA4N09rGXOSwev-C4oEihwWsvwqtCpY=XHNShF_xUUzkWZA@mail.gmail.com>
 <CANNYZj9wDZfHK5mrn-UsgZcHHOF8+Xv8UXRUX1r+Mkcvr9+xMQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <ed840838-7425-3455-1572-732912bb1cf6@gmail.com>
Date: Wed, 14 Jul 2021 10:07:35 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj9wDZfHK5mrn-UsgZcHHOF8+Xv8UXRUX1r+Mkcvr9+xMQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 7/14/21 7:04 AM, Alexander Kanavin wrote:
> On Wed, 14 Jul 2021 at 16:02, Bruce Ashfield <bruce.ashfield@gmail.com 
> <mailto:bruce.ashfield@gmail.com>> wrote:
> 
> 
>     I'd prefer that libcheaders stays explicitly set.
> 
>     Bumping libc-headers is something we do carefully, and should not be a
>     common devtool
>     operation, and is not something that we want automated at all. Having
>     that extra variable
>     to set is a good thing for the headers, it helps reenforce that you
>     really should know what
>     you are doing.
> 
> 
> Right, I'll respin the patch once more.

if this is not fixing anything besides cleanup then, its not worth doing 
it, there are layers which may not be public which use these variables 
to choose toolchain from external layers which may not be in layer index

> 
> Alex
> 
> 
> 
> 
