Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.36381.1622408098344580445
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 May 2021 13:54:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BGJaqH/E;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id j12so6819751pgh.7
        for <openembedded-core@lists.openembedded.org>; Sun, 30 May 2021 13:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=ZWjX96pi6yxNs0E0KKiG/leUHhzAjiRVKSNGGnbOCVk=;
        b=BGJaqH/E4Rkf0gWTo+xISUQzOWqFWdr5zNxg57Rafyq0lwUvw2qV6GfIOsZnQz+BBW
         kqN7f2Ds4h7FoDFGfN7A/o3xbDfgAD872RqYHOqGn6/yHfd7242krJOI6PkVm+ruU9Ex
         IyJt+vInyapfwQZwcfh0Af2ndO4VzYPqnc5sEVzU8eenpnNeclwiwtOSi36CeuqMhb3P
         740eEAPzDyMePf6+z6lLm4XerH/MaxkVI2nA+UZ+re1ARbFe67/R8ncLzgJMQGmklZwZ
         ERbPvwmWrTULhlcLQYab6veln70bB8helQzVTosnxHLgaxNjwAt2UsCXj62BQozURV5O
         IveA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=ZWjX96pi6yxNs0E0KKiG/leUHhzAjiRVKSNGGnbOCVk=;
        b=jrfIaAUonjT7hev6cBTcmK1R8xKvqnvPL490s4smqydO4CFeZsz8tOsho9jPG+MSg7
         NPFctHjWDr9a5Ix18oxDEit7OU839r3HxVMqhzvmFz8Y2k20ZaHrPVVVF6pmFCp+bIF2
         a6xVC8cYrKItkpuRKUa5MEYGxq9TzvcMGPyWvMShCUgNrWj/MnCRgWpeCoL8Mh0Rb+c6
         nuD0DfWdyNIELETrOfJ/0ua7DNVr3vUOsepcLgxUQaGs5uvzAss+xb/IX62gQ0N/5BfN
         70jMMmaVun4fw5L0J4NRekyCQ2CHTAh6C8oT3bttMmwtptnwQhpAR7f6bUFFQrq2I/Wo
         pk/w==
X-Gm-Message-State: AOAM531PJ/hyvENvHJtUfPeYJdwRNlpq2flmC1gKe6zHvRnPY2bUi4h+
	omg28wgDPpWGb2tnP838NX+PRPXGq1cFNA==
X-Google-Smtp-Source: ABdhPJytPhlA6MRGypFWV/T6Br4YBqHzydr3xJL1DXu0K5itDbLpORFpgsGfKVfiuhTQTlPJjvxg1A==
X-Received: by 2002:aa7:83ca:0:b029:2e5:3a96:982a with SMTP id j10-20020aa783ca0000b02902e53a96982amr13851078pfn.12.1622408097583;
        Sun, 30 May 2021 13:54:57 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:417e:d6cd:22c6:4534? ([2601:202:4180:a5c0:417e:d6cd:22c6:4534])
        by smtp.gmail.com with ESMTPSA id l20sm8932104pjq.38.2021.05.30.13.54.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 May 2021 13:54:57 -0700 (PDT)
Subject: Re: [OE-core] [PATCH 1/2] kernel-kfrag: add new class
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20210530180552.580308-1-akuster808@gmail.com>
 <CADkTA4ORQc2j9W9QgRJUhDY=q1ZLUdKxctJj=HLdkPPm9iGoTA@mail.gmail.com>
From: "Armin Kuster" <akuster808@gmail.com>
Message-ID: <9bc2b2eb-7691-82a2-e68f-8b9d6c7459ce@gmail.com>
Date: Sun, 30 May 2021 13:54:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4ORQc2j9W9QgRJUhDY=q1ZLUdKxctJj=HLdkPPm9iGoTA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 5/30/21 1:47 PM, Bruce Ashfield wrote:
> On Sun, May 30, 2021 at 2:06 PM Armin Kuster <akuster808@gmail.com> wrote:
>> This provides a common place to define kernel fragments
>> that may be usefull to the larger community.
> Not a bad idea at all, but what about calling the class
> "kernel-features", versus kfrag ? That describes the purpose, versus
> what the mechanism does.
works for me.
>
> A 2nd suggestion would be to bbwarn if this is inherited, but
> kernel-yocto is not.
seems reasonable.  I did wonder the best place to place for thie. The
kernel cache can be used w/o linux-yocto.
>
> Note: as mentioned during the yocto summit, I do have patches that
> make fragments more universally available, when I get them ready, we
> could remove the bbwarn.
Would those patches eliminate the need for a class like this?

-armin
>
> Bruce
>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>  meta/classes/kernel-kfrag.bbclass | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>  create mode 100644 meta/classes/kernel-kfrag.bbclass
>>
>> diff --git a/meta/classes/kernel-kfrag.bbclass b/meta/classes/kernel-kfrag.bbclass
>> new file mode 100644
>> index 00000000000..c0c5667b519
>> --- /dev/null
>> +++ b/meta/classes/kernel-kfrag.bbclass
>> @@ -0,0 +1,8 @@
>> +#
>> +# Class to place yocto-kernel-cache fragments
>> +# selections usfull to anyone
>> +#
>> +
>> +KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "apparmor", " features/apparmor/apparmor.scc", "" ,d)}"
>> +KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "smack", " features/smack/smack.scc", "" ,d)}"
>> +KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "dm-verity", " features/device-mapper/dm-verity.scc", "" ,d)}"
>> --
>> 2.24.3
>>
>>
>> 
>>
>

