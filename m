Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web10.66135.1600104444685770480
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 10:27:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XMhPFbhF;
 spf=pass (domain: gmail.com, ip: 209.85.215.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f194.google.com with SMTP id t14so321853pgl.10
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 10:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QFodIFfl/afphgxXf96pzpq0BGw6ZHIe0C5NLBeWQvs=;
        b=XMhPFbhF66Qk78ZopMLZRGi0hfz8IF6+cpZTpOA7cTbaYR4VNgwxH53qSzUfXeG9uQ
         iGdui82B4631yB35lnFFStNPtkxJMlfjTmRoUpOT78EfmlHXB4N3NqzwfFdcfwN7gUe9
         bVRVuLq1WhErJQjEMYNmOp2QVwRtcYEqOvyX3lmaN86HN7ULbkPMdOdevjcutVUY5Hbp
         9ao20U7trBXiMavbuVHz05IrViRZJinVttgKwb/Ny2yDSgnGw4EiWxXq7cPPXN+V98E4
         QHbh3/Khp+2mQRL/RmQBSrf1X5Yr4tmg9VHZjBM/NBtRQePImFZZSp9E0hXFbpqCs4Y+
         vvPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=QFodIFfl/afphgxXf96pzpq0BGw6ZHIe0C5NLBeWQvs=;
        b=CUcaQb90DqANAJqbk0Ui/QuHF6TTthZNBujFx15xx/ld++i+PIX1zFJIs9pmKFcKz5
         CHeexBXVI8l53mxjVFnC+i8aNy8eVQA0k4RcNuz9eew10TVY7qJXvQK5cfM3mtafv7GF
         m3ApwUbG0noLIxoqcJYPNy50shzuOSzK20VaIEnu+CF3rAXxxzXNR2BCMM9PrzAyn64i
         I0ebcjoytP1x39ZWvmuzQ6yN9AZ5JqjiOy6N8KvpCQGPMZV9mKzGIl3BRrLCNV45naKy
         r6yQowvGqyjpzMxAcLScw0dqkwMhake1fj4NaF9Vlf/M568JAiSQo50qjI+d8cAT7YMt
         ffiA==
X-Gm-Message-State: AOAM53015/eID09IQn+XzVIFYA/0hZn90b6VIU05WCjbC86/I+CYgqAq
	ZV/cNEghAYtaw9BiStPxswQ=
X-Google-Smtp-Source: ABdhPJznpC2R28ZFPgw5U6ETf8ehYe8WU0sDLYny7ipHx9uYNYz7fY3x/SFQEj0xYLG5RYNmpbJGjw==
X-Received: by 2002:a17:902:e903:b029:d1:8c50:b1a9 with SMTP id k3-20020a170902e903b02900d18c50b1a9mr15758693pld.31.1600104444020;
        Mon, 14 Sep 2020 10:27:24 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:65be:52e2:459a:b2e1? ([2601:646:9200:4e0:65be:52e2:459a:b2e1])
        by smtp.gmail.com with ESMTPSA id z23sm10992835pfj.177.2020.09.14.10.27.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2020 10:27:23 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] core-image-sato: qemumips use 512 mem
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 akuster <akuster808@gmail.com>, openembedded-core@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.comt>
References: <20200913035916.24165-1-akuster808@gmail.com>
 <82df031010def40bb2f2f1bfe160cbbb8330353d.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <3889316c-3fb2-e100-468d-9ba2b77e69ad@gmail.com>
Date: Mon, 14 Sep 2020 10:27:22 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <82df031010def40bb2f2f1bfe160cbbb8330353d.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 9/14/20 12:13 AM, Richard Purdie wrote:
> On Sat, 2020-09-12 at 20:59 -0700, akuster wrote:
>> From: Armin Kuster <akuster808@gmail.comt>
>>
>> Fixes:
>>
>> WARNING: core-image-sato-sdk-1.0-r0 do_testimage: Couldn't login into
>> serial console as root using blank password
>> WARNING: core-image-sato-sdk-1.0-r0 do_testimage: The output:
>> root
>> <<< run_serial(): command timed out after 60 seconds without output
>>>>>
>>
>> In another run, this error was seen:
>>
>> Failed to reload daemon: Refusing to reload, not enough space
>> available on /run/systemd. Currently, 14.3M are free, but a safety
>> buffer of 16.0M is enforced.
>>
>> With updates to systemd and Qemu we should revert: 499a31cf06 core-
>> image-sato: don't use 512MB in qemumips
>>
>> Signed-off-by: Armin Kuster  <akuster808@gmail.com>
>> ---
>>   meta/recipes-sato/images/core-image-sato.bb | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/meta/recipes-sato/images/core-image-sato.bb
>> b/meta/recipes-sato/images/core-image-sato.bb
>> index 673106eb6d..878e0eaa8d 100644
>> --- a/meta/recipes-sato/images/core-image-sato.bb
>> +++ b/meta/recipes-sato/images/core-image-sato.bb
>> @@ -12,4 +12,3 @@ TOOLCHAIN_HOST_TASK_append = " nativesdk-intltool
>> nativesdk-glib-2.0"
>>   TOOLCHAIN_HOST_TASK_remove_task-populate-sdk-ext = " nativesdk-
>> intltool nativesdk-glib-2.0"
>>   
>>   QB_MEM = '${@bb.utils.contains("DISTRO_FEATURES", "opengl", "-m
>> 512", "-m 256", d)}'
>> -QB_MEM_qemumips = "-m 256"
> 
> 
> We have now seen:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/2452
> 
> with this applied, not sure if its related. We have seen this kind of
> network dropout elsewhere but we don't seem to have good debug when it
> happens.
> 

I wonder if ssh daemon is dead in this case. I also see its invoking 
compilers on target( kernelmodule case), are they usign -jX during make 
?, 512M might not be enough to run parallel compiles

> Cheers,
> 
> Richard
> 
> 
> 
> 
