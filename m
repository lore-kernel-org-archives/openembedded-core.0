Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web09.479.1619199886384927963
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Apr 2021 10:44:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=A+11nhHJ;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id z16so35678469pga.1
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Apr 2021 10:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uXK0vMKbmtb0bLSYm190sYzxhYCTrFM6/UkX7cFO9tA=;
        b=A+11nhHJbtfmthz0pjzQT5GFKNj9QJoWciy3LOTH0jaHQtenGj/0yYSzIaioihau1s
         6gBhDGcfAx/75cs+9Apjq9f2/ktz9CwtMAfd5oX5JTRzVDaRJ9B8Vug4itMeNo+ymtXR
         FtybFM+BxhSI6r6hcvo5hwLl97S4pYCWgeYEVxLYqgnk17zI+sYsHYZo/QHBDU522PuH
         Zlu/76rqelLqjHFLB5UGc3nPnSlV8dxG1sxre61EyTwdk1UJgEC5dddESNM3TVfS4/xy
         IZmT7xNR6MOh6tUKPPIpIUYTcmoHguz+cNspzkurR6oQQu04Lr16mOIKBGxTtdIxgn76
         FU8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=uXK0vMKbmtb0bLSYm190sYzxhYCTrFM6/UkX7cFO9tA=;
        b=CJB2AAcx+q2zQElscmhsSFWTFdFGRG2D3g4joYSEJyEwo9eyzuZTYG4s8Fssv+6p40
         l8ldU7ch70t4hM72AK3FzsDyh+fIORuFhx4XgA9W19NgDyYiOVdWGAMcUsWdidNJSFEY
         F40CD86rd+lI5Td6sfV/9YMMUjVs01Me41MPHbQjW8VL5VFTtWz1Hmq7XX7Jmc8dbdrG
         fPL5+CDGbQL3jScgx1z4V/nKAP+iL7tm8UgNbHXCp06HfmqMHHnZpgjntGIYmVamAthn
         R7KKaW/kDRW54UQUIABw9ojEk10NaKNaxYTMowM36VNLP+3tvaE1KJC4wF9ux3W97MRW
         /z7w==
X-Gm-Message-State: AOAM530iJK2jVkk2b0pat/fw59a23SZxy6bytSxrxxiyb9eZ+s28BLtg
	o9SLe061znlK2wrDdwf8Z5r2IQIU/1A8Eg==
X-Google-Smtp-Source: ABdhPJy0pZYpS7iZQ28oCCHTib5Z6oYfqoKEYRO6MFjLGL3fAtQO5sCFlESTzkEdnsrt/Bq60Zl7wg==
X-Received: by 2002:a63:1e1e:: with SMTP id e30mr4872738pge.77.1619199885476;
        Fri, 23 Apr 2021 10:44:45 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:11fe:f444:6c85:56b? ([2601:646:9200:a0f0:11fe:f444:6c85:56b])
        by smtp.gmail.com with ESMTPSA id o127sm5381988pfd.147.2021.04.23.10.44.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Apr 2021 10:44:45 -0700 (PDT)
Subject: Re: [OE-core] [PATCH v2] python3-docutils: Upgrade to 0.17.1
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20210423021123.3732767-1-raj.khem@gmail.com>
 <3ea2c73330a6a7383913c283eaf888b0bb255477.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <53004b6e-e3a8-b220-3b6c-9edf819c5072@gmail.com>
Date: Fri, 23 Apr 2021 10:44:44 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <3ea2c73330a6a7383913c283eaf888b0bb255477.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 4/23/21 2:34 AM, Richard Purdie wrote:
> On Thu, 2021-04-22 at 19:11 -0700, Khem Raj wrote:
>> This was in meta-python for a while so merge the changes here
>> and  upgrade, once applied, delete from meta-python
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> v2: Detect file rename
>>
>>   ...docutils_0.16.bb => python3-docutils_0.17.1.bb} | 14 ++++----------
>>   1 file changed, 4 insertions(+), 10 deletions(-)
>>   rename meta/recipes-devtools/python/{python3-docutils_0.16.bb => python3-docutils_0.17.1.bb} (25%)
>>
>> diff --git a/meta/recipes-devtools/python/python3-docutils_0.16.bb b/meta/recipes-devtools/python/python3-docutils_0.17.1.bb
>> similarity index 25%
>> rename from meta/recipes-devtools/python/python3-docutils_0.16.bb
>> rename to meta/recipes-devtools/python/python3-docutils_0.17.1.bb
>> index 50547a1b0c..54a809847f 100644
>> --- a/meta/recipes-devtools/python/python3-docutils_0.16.bb
>> +++ b/meta/recipes-devtools/python/python3-docutils_0.17.1.bb
>> @@ -1,17 +1,11 @@
>> -SUMMARY = "Text processing system for documentation"
>> +SUMMARY = "Docutils is a modular system for processing documentation into useful formats"
>>   HOMEPAGE = "http://docutils.sourceforge.net"
>>   SECTION = "devel/python"
>>   LICENSE = "PSF & BSD-2-Clause & GPLv3"
>> -LIC_FILES_CHKSUM = "file://COPYING.txt;md5=7a4646907ab9083c826280b19e103106"
>> +LIC_FILES_CHKSUM = "file://COPYING.txt;md5=836a1950177996968a49ff477a4a61c4"
>>   
>>
>>
>>
> 
> Did the license change? Needs a comment in the commit message.
> 

nothing changed in license types per-se but some edits which I 
documented and sent a v3

> Cheers,
> 
> Richard
> 
> 
