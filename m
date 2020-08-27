Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web10.10132.1598494618334678389
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2020 19:16:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IDScoAST;
 spf=pass (domain: gmail.com, ip: 209.85.216.65, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f65.google.com with SMTP id 2so1813513pjx.5
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2020 19:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OA4mnsKcg5aSIji9a/HyRpYwC03AxJcffOxOApTglx4=;
        b=IDScoASTmOGcGdUDFTFC1i/MdfYelYVZOIPq2Na29zrej/TbMj+blIBA+Giwqh6Mnc
         ARQL4/zTwP9RiBrNFGIfKTzOdCnxSxnlMgtOjHARs02w5dGeFeTenu4nNcj0Zc29xwnQ
         d90yASs2yvyoORlewMwLiixay4nCIBpBb2HIPdvRV5t7nZZXoU9vLspRDobI4AmlsqzC
         b5Onr9dku6A8YSKuCzks6y/M29389e32wi+7ci7gXP14yGbInWiCbGmfvQ9EI5eSmXhO
         emMUAXegaA67ZAnb4eQxBh+/0tE0g8TnPDIPYN/gyrKERAG8/X1SF8B0Y3IC/AlJScdf
         MmQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OA4mnsKcg5aSIji9a/HyRpYwC03AxJcffOxOApTglx4=;
        b=my8JlhuCcLfcEZBkUJmeMLw4z2rfCCQ9cGQ58gAnvZ/0ii2ckf4lOIpR3BTwU2gP4j
         XAUKnXwxfFcdpeDxUkgX+WePZPVCDh+GWgDcFNVUCpoLEU74Y3rtWUty959SjazuflH2
         5PsLK7nwGmmwsgwIRwm3Clatp4OtzBj+lyDaPuoAPbMCFYYYkozzLrvogIwjhhTSJagY
         3DULn9+UxsKFI/fLw/EDAeXnhWW/eWTwHyLxwO3xZwo5qtTKdohoLaTI4pu5mzIxqb3O
         5yhGgo/w5FVJm/cMfhXKX9Y/d1S2oxmO+JLT9qQC6lPuoL4NZ8TcwhGJC7nFUChkYEJ0
         yhQQ==
X-Gm-Message-State: AOAM533B+CHgB1nzlCmCkbjUpbykoaXJl0kuMY6eotWvT523Mktet8T0
	egP4228xMs+BL5xqQKzrBHy+esjL18KNYA==
X-Google-Smtp-Source: ABdhPJxjx5cc9tVvfvUR2cSmYeShgtsWioDKesLlGCCTJRO/u+M6keUHq6wZvAysWHTFS7s8Wf19/g==
X-Received: by 2002:a17:90a:b008:: with SMTP id x8mr8515963pjq.75.1598494617432;
        Wed, 26 Aug 2020 19:16:57 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:e8b6:ed97:4b5a:9e46? ([2601:646:9200:4e0:e8b6:ed97:4b5a:9e46])
        by smtp.gmail.com with ESMTPSA id g17sm371600pge.9.2020.08.26.19.16.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2020 19:16:56 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] lttng-tools: Do not build for riscv64
To: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>
Cc: openembedded-core@lists.openembedded.org
References: <20200826054101.856417-1-raj.khem@gmail.com>
 <20200826140046.GJ1638231@joraj-alpa>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <94a29731-4335-5ab3-ae62-740f29c7627b@gmail.com>
Date: Wed, 26 Aug 2020 19:16:56 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200826140046.GJ1638231@joraj-alpa>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 8/26/20 7:00 AM, Jonathan Rajotte-Julien wrote:
> Hi,
> 
> LTTng does not have a hard requirement on lttng-modules (on paper), when kernel modules
> (tracer) is not present kernel tracing is disabled and only userspace tracing is
> available.
> 
> Was there any report that lttng-ust (userspace tracing) is not working as
> intended on riscv64?

No, but lttng-tools have this as rdep for ptest packages which is not 
controlled via packageconfig or something.

> 
> Cheers
> 
> On Tue, Aug 25, 2020 at 10:41:01PM -0700, Khem Raj wrote:
>> Since lttng-modules are not buildable, there is no point of building
>> tools either
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>   .../packagegroups/packagegroup-core-tools-profile.bb           | 1 +
>>   meta/recipes-kernel/lttng/lttng-tools_2.12.2.bb                | 3 +++
>>   2 files changed, 4 insertions(+)
>>
>> diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
>> index ca35af1ec3..608e406f83 100644
>> --- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
>> +++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
>> @@ -41,6 +41,7 @@ LTTNGUST_arc = ""
>>   
>>   LTTNGTOOLS = "lttng-tools"
>>   LTTNGTOOLS_arc = ""
>> +LTTNGTOOLS_riscv64 = ""
>>   
>>   LTTNGMODULES = "lttng-modules"
>>   LTTNGMODULES_arc = ""
>> diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.12.2.bb b/meta/recipes-kernel/lttng/lttng-tools_2.12.2.bb
>> index e9c8e18e22..0614e86713 100644
>> --- a/meta/recipes-kernel/lttng/lttng-tools_2.12.2.bb
>> +++ b/meta/recipes-kernel/lttng/lttng-tools_2.12.2.bb
>> @@ -162,3 +162,6 @@ do_install_ptest () {
>>           esac
>>       done
>>   }
>> +
>> +COMPATIBLE_HOST_riscv64 = "null"
>> +
>> -- 
>> 2.28.0
>>
> 
>> 
> 
> 
