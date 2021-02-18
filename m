Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.362.1613679572402757312
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Feb 2021 12:19:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FwQXx+9h;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id z15so2073384pfc.3
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Feb 2021 12:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=6ZDI9dmHOs49gOJ6OdY5/h5atar36xNjlZg/bSDoz1Q=;
        b=FwQXx+9hjiaBeh5Vb5PzrE6hTAexoyhH6m5pJItM5OXOijTK1pXMfFr2iqtbB5tnQa
         WMuda0gC2fn3GIyicx6K4stq04s1Ve9rO+qv0wA6IQuUphcHxbeGY6tvBtuPDdbKGJWx
         BfInWOklr4XrJJOHDUnPJ9hhZZWtawXl9fjxG+uWUoU6+VTo5Z23bttz25sxf+YsvayO
         qBxw6U0YWUlfB9zTSydzvylxaY0o4fP8PJv8bAA7u4hGpbvdDW4JJjyw5+eYL8868fdH
         P2RueUBPlo5GrARFDUUQXX2ddYwDYwUiHthRSxOFU+AwNv/eNRVB2ouJqgWRvT2FZJem
         0whg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=6ZDI9dmHOs49gOJ6OdY5/h5atar36xNjlZg/bSDoz1Q=;
        b=Owu54ozaXbMe2AN++kiDVRzx78akH84TZRlFoxOAP9kqwPizaImrw4DWZR4ETK/t7r
         pVOwbuoR4riz0sqniPar+Ptt4Y6468nf8GZojoeZU1Ir0Pm5F5/FspcEIRgd8FPHowBw
         XHHsg5mP095xFF+4E9zptg3kxG0lMFBrgZI2DDitpBj0LIAvSgJlZ1zqYFbLirWYv5Mu
         eiIoIpwLcHsLsD7345P2Z+8IGxIQoQin4a2qn+uMYQwi+gpauHI6j20GL+ybRSqpAZE2
         ntExX9vbiGMC216QSNRLcKAiKGLv84RED6YeabtfrrIw5AqyNNjIBu0emctDeA7RkOyN
         QXYA==
X-Gm-Message-State: AOAM5337DFUcu/HA2spHn7CZfcwDBrg6/N2olikt8XsEzh+jNSYV9LqO
	VHKCc7JPv0kr00m5+UvTQYIGEFuDHDGInQ==
X-Google-Smtp-Source: ABdhPJwO19bVxAb9p+53eU5dduL5cGfSI/oOqOZGMXNvP991DTZ7VE29mcNgYAM0hn0bv6329/bNdg==
X-Received: by 2002:a63:f04b:: with SMTP id s11mr5365362pgj.352.1613679571532;
        Thu, 18 Feb 2021 12:19:31 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:7db1:8052:decd:2a75? ([2601:202:4180:a5c0:7db1:8052:decd:2a75])
        by smtp.gmail.com with ESMTPSA id s18sm5956105pjr.14.2021.02.18.12.19.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Feb 2021 12:19:30 -0800 (PST)
Subject: Re: [OE-core] [[PATCH] cve-check.bbclass: don't skip scanning if file not found
To: Ross Burton <ross@burtonini.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20210215224133.2550191-1-akuster808@gmail.com>
 <CAAnfSTsYM9QwW6qyLAfC+OnKES0K0nfvH9eoTCZu1zH9-HuObA@mail.gmail.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <a90e22e6-2dbc-945b-7c35-a0dc2f4c336d@gmail.com>
Date: Thu, 18 Feb 2021 12:19:29 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAAnfSTsYM9QwW6qyLAfC+OnKES0K0nfvH9eoTCZu1zH9-HuObA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 2/18/21 8:50 AM, Ross Burton wrote:
> Why is the file not found though?
its downloaded there for not in the WORKDIR

-armin


>
> Ross
>
> On Mon, 15 Feb 2021 at 22:41, akuster <akuster808@gmail.com> wrote:
>> This helps avoid these errors:
>> ERROR: lockdev-1_1.0.3-r0 do_cve_check: File Not found: /home/build/builds/master/tmp/work/core2-64-poky-linux/lockdev/1_1.0.3-r0/lockdev_1.0.3-1.6.diff
>>
>> We should continuing to scan other applied patches for CVE info.
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>  meta/classes/cve-check.bbclass | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
>> index 1bed815d8e4..e56366579d1 100644
>> --- a/meta/classes/cve-check.bbclass
>> +++ b/meta/classes/cve-check.bbclass
>> @@ -186,8 +186,8 @@ def get_patches_cves(d):
>>          patch_file = bb.fetch.decodeurl(url)[2]
>>
>>          if not os.path.isfile(patch_file):
>> -            bb.error("File Not found: %s" % patch_file)
>> -            raise FileNotFoundError
>> +            bb.warn("File Not found: %s" % patch_file)
>> +            continue
>>
>>          # Check patch file name for CVE ID
>>          fname_match = cve_file_name_match.search(patch_file)
>> --
>> 2.25.1
>>
>>
>> 
>>

