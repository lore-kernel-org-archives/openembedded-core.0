Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web09.3439.1617623094543568540
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Apr 2021 04:44:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=tKfTXuuD;
 spf=pass (domain: konsulko.com, ip: 209.85.218.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f44.google.com with SMTP id hq27so16376737ejc.9
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Apr 2021 04:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=JCalkAVAZrkez+VZjN4MSlIrJacs1KonpzokuXSsqGo=;
        b=tKfTXuuDXdYwWnWvaphBTgzs/5MC+3i3vjItTzsZKZP17Ru9mrE3XYoqb9DgapHd8g
         IWobtUigEGTaRR+ufHcILpxqGmRC7Oqj4vq6wT+xHeBjRibGn0brpxPjRER/fCzqazVb
         J8hd49awe9VLlZ7ptLJpWgx9AJJD9x6VLqO3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=JCalkAVAZrkez+VZjN4MSlIrJacs1KonpzokuXSsqGo=;
        b=mNHO+SUlFyYpFedyUbBZnjqM1G7ehiaos0Tm6zNqIQ8xriP4xACmcrwC1Fa6tExFfj
         aEVVWGnO1O38XS3t3+aEbIDfJeznQeAE1Ie1IMPDIzYxBut40u4zAa1psyk667PSrADg
         HKuZxW9oFNPnGqBZatNhqhSuinK5KdUg8LkVFGeSpTI1zq1RsBlf8njgD93Hhi+Hgxu4
         1iV4gYDRlQSRcCna/RhKq5yRizlUP9+wd51aVtZhkpjmqY6Eb8xO2ADcEERiWy44hWEF
         bxgNMU9ZKxhdntMIhB+yOFvBIAWOznaMdsevFOlsmIOM9Homy2a0+2TyXg2oRFagjG27
         0Xkw==
X-Gm-Message-State: AOAM530AYi31X1eQLFLJM03WT8NyN8HQ5vZSBqoRGBY/qQPB6BCWND3s
	eD/z8Qjfdi2H+Xw0Gxtcn8cMz2L+udnMMQ==
X-Google-Smtp-Source: ABdhPJzygn8Rrz0jIhexM7IckWYrw9PNr1FEDqPVTyUkUr8t1jQ7dQyrRmAbBnvysElqvNxhJ8vUCg==
X-Received: by 2002:a17:906:1444:: with SMTP id q4mr28065873ejc.343.1617623092638;
        Mon, 05 Apr 2021 04:44:52 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from [192.168.4.166] ([78.130.197.211])
        by smtp.gmail.com with ESMTPSA id d1sm8655962eje.26.2021.04.05.04.44.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Apr 2021 04:44:52 -0700 (PDT)
Subject: Re: [OE-core] [meta-oe][PATCH] python3-setuptools-rust: Add release 0.11.6
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20210402114521.3888-1-leon.anavi@konsulko.com>
 <278df56a6cff5cd90a092c1caa416078ca5b432d.camel@linuxfoundation.org>
From: "Leon Anavi" <leon.anavi@konsulko.com>
Message-ID: <4f6e87f1-692b-e116-2673-1ef6dfbc8c8a@konsulko.com>
Date: Mon, 5 Apr 2021 14:44:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <278df56a6cff5cd90a092c1caa416078ca5b432d.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Richard,

On 4.04.21 г. 13:05, Richard Purdie wrote:
> On Fri, 2021-04-02 at 14:45 +0300, Leon Anavi wrote:
>> Add setuptools-rust release 0.11.6:
>>
>> - Respect CARGO_BUILD_TARGET environment variable if set.
>> - Add setuptools_rust.__version__ and require setuptools >= 46.1.
>>
>> This recipe is required as a dependency of Python packages relying
>> on Rust, for example newer versions of python3-cryptography from
>> layer meta-python.
>>
>> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>> ---
>>   .../python/python3-setuptools-rust_0.11.6.bb  | 28 +++++++++++++++++++
>>   1 file changed, 28 insertions(+)
>>   create mode 100644 meta/recipes-devtools/python/python3-setuptools-rust_0.11.6.bb
> If this is targeting OE-Core (hard to tell from the subject line
> including meta-oe), it has no maintainers entry. I'm also a little
Yes, sorry, the patch is targeting OE-Core for consistency with other 
Python3 recipes likes python3-setuptools and python3-setuptools-scm.
> surprised there is no rust dependency. Adding rust is something
> we deferred to the next development cycle.
I've I heard that rust is expected in the next development cycle because 
if this at the moment I definitely want to avoid dependency on meta-rust.

Please let me know if python3-setuptools-rust can be accepted in 
OE-Core, if I need to modify it or just to wait for the start of the new 
development cycle when rust will be in OE-Core.

Thanks,
Leon

>
> Cheers,
>
> Richard
>
-- 
Leon Anavi
Software Engineer
konsulko.com

