Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web12.1453.1619193569851047421
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Apr 2021 08:59:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Zv+zm6fd;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id n10so14279971plc.0
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Apr 2021 08:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=a5ECvUVZhmIG4HDSXcTI86kbN0st7Wh7TTPyB3lBHkI=;
        b=Zv+zm6fdPtLq6uNngisO8SiW8OFS+WebY5J+DIbV4/fthLpyC01IZNuS3RxM2SrlzG
         ReqbAp9YD+CTVlK+0B9TR12DihG32j5KED9j4o8fYMv50ITxqjSy2AoEWw4nv3WzRCGN
         m37hYwxlnYowTl6kI5NaCaBd+3QXdPD9fjzx/mLMMz2SkxClJYXHSe/GCUlfeko4GF+S
         i2A9B+5bu4c8TOVOdDefltkYfvjZgv8vy2K/ZOoxJkRNKOA2aiOX+eAC59Cu+tAMzwvc
         7MpheIcievziN/uLOr8NSpKdhLibhEPRlil9hQUBEkY8AHTwpSJpTadhoX1+/T7mjoZW
         IMGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=a5ECvUVZhmIG4HDSXcTI86kbN0st7Wh7TTPyB3lBHkI=;
        b=mp4WUKSrs7nwSyUu8oq1FqMvikp7hjks46ecS/Rkv8tg4XTzSs6gzbvL+Xc2r7txKt
         eBDdmNtbF2j7rG52BbH6a2EzHmFNi5fyOWymZVVfq5EqauZaqDoL9ximoA41xtNck8AL
         4X+tQ0I6Kt12xbeZvdgejkxLwxYWartzolYpIlQjoc1MfOo1OunYsqYIUVJhI8crg8WY
         2tpXYaebrp673QWkkc4Dxa21zcPcfSoIy0a8ZcgBOHqLATq/DA7G6RDOP2ZfwzzgQYa6
         UYhT6A/Bag2EEXQlqx6hWza8OX6PHRZYpJPpmNJGio6OXNXshWfiOkZ7UYFSSyNiVJph
         ElSg==
X-Gm-Message-State: AOAM5327HqiuVqvxGKGYaBc5U9YEHC0P7hHn6QHrTbardnBK4RiLvsZ8
	zyRU/rGD8+r0Z5aiuwFPwT4G/6iRYOQtWw==
X-Google-Smtp-Source: ABdhPJyN8pSmkDW+DuTX1zen2fB3RfxT/YtNu3ii5TDXnPutsCa3TcaZXffydww5VrbvB0fC1Y28ng==
X-Received: by 2002:a17:902:8202:b029:ec:b398:6d73 with SMTP id x2-20020a1709028202b02900ecb3986d73mr4719291pln.37.1619193568961;
        Fri, 23 Apr 2021 08:59:28 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:11fe:f444:6c85:56b? ([2601:646:9200:a0f0:11fe:f444:6c85:56b])
        by smtp.gmail.com with ESMTPSA id d3sm8176344pjw.35.2021.04.23.08.59.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Apr 2021 08:59:28 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] tiff: upgrade 4.2.0 -> 4.3.0
From: "Khem Raj" <raj.khem@gmail.com>
To: wangmy <wangmy@fujitsu.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <1619078047-5587-1-git-send-email-wangmy@fujitsu.com>
 <1619078047-5587-5-git-send-email-wangmy@fujitsu.com>
 <CAMKF1sq9OEK=LYu7oo8=LwmT0Z5piunXeiad0KF-rVWMnN6G_w@mail.gmail.com>
Organization: HIMVIS LLC
Message-ID: <a81e426a-737d-17d8-0df9-52fa8fdd4a31@gmail.com>
Date: Fri, 23 Apr 2021 08:59:27 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sq9OEK=LYu7oo8=LwmT0Z5piunXeiad0KF-rVWMnN6G_w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 4/22/21 10:31 PM, Khem Raj wrote:
> this breaks gd package in meta-oe see
> 
> https://errors.yoctoproject.org/Errors/Details/577264/
> 

FWIW I have sent a fix for this to meta-oe layer

> On Thu, Apr 22, 2021 at 12:54 AM wangmy <wangmy@fujitsu.com> wrote:
>>
>> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
>> ---
>>   .../recipes-multimedia/libtiff/{tiff_4.2.0.bb => tiff_4.3.0.bb} | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>   rename meta/recipes-multimedia/libtiff/{tiff_4.2.0.bb => tiff_4.3.0.bb} (95%)
>>
>> diff --git a/meta/recipes-multimedia/libtiff/tiff_4.2.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
>> similarity index 95%
>> rename from meta/recipes-multimedia/libtiff/tiff_4.2.0.bb
>> rename to meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
>> index ea8580a25e..abf0a67740 100644
>> --- a/meta/recipes-multimedia/libtiff/tiff_4.2.0.bb
>> +++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
>> @@ -10,7 +10,7 @@ CVE_PRODUCT = "libtiff"
>>
>>   SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
>>             "
>> -SRC_URI[sha256sum] = "eb0484e568ead8fa23b513e9b0041df7e327f4ee2d22db5a533929dfc19633cb"
>> +SRC_URI[sha256sum] = "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8"
>>
>>   # exclude betas
>>   UPSTREAM_CHECK_REGEX = "tiff-(?P<pver>\d+(\.\d+)+).tar"
>> --
>> 2.25.1
>>
>>
>> 
>>
