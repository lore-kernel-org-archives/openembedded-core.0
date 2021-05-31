Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web12.47798.1622486516652644847
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 May 2021 11:41:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JWG25zQD;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id pi6-20020a17090b1e46b029015cec51d7cdso414731pjb.5
        for <openembedded-core@lists.openembedded.org>; Mon, 31 May 2021 11:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=ZKJseFFlgO4OqxFSSX+BlCRbKWbn5nBquLMMqRDy2s4=;
        b=JWG25zQD61W0tGhUrymFXkVCcmiipETRbd7u9jwIgeR1AyYrvGONzmSNP9Mc9bLBvQ
         8mbu/1CE482A09NFrOKu33z+p6VfC7q4HMEG9JgLnu9wrPp0AQ30EGKsWFpZVAb895Rn
         BPv4UE+rcaSk7d0urUG7l5ixTN8YHGFG76WVB1EA2u++/HIbQQT0JxJo+udpS642z1mS
         sZvw0p6cNv+qhnDqKdBioEi1glAsW3atIr4NScfyNvhLxWGLbsuP2lhMm6jhmAQO+thl
         tWhD61dUrK3Kd2H14aYophDxqWRTncaD27eF8ijbbU5nn0tc/DiiNYW9HMNVBFittD0K
         LWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=ZKJseFFlgO4OqxFSSX+BlCRbKWbn5nBquLMMqRDy2s4=;
        b=Bm352LxdrZyLgh/AbaA+Au44Mt9zcH7fUlS7Y9Y7MfOKNjAScuaa15ZOwtt2OGXzWa
         sl34o9R/KDSOEFc2EzgQ8xTOLfxTUnbKb+FFGPHyU0gd8r2wqPV77+orI8pF4QMEAIEd
         38aoEG+DyVQb7VGxTJHosOtAcKU7+7n3aAualzEofI+va3TeNRpS54Y/s8Ji6LIxx6Ki
         VdY1LnjzPJCWK4KCXUkN+DwGSQRsDDLfA6qKSEtvfX7CphjuDQrslPoAnRrCe4G4CDcB
         +BLrO4V4/nkrGylhIsr3aZ/k3TbJMRQ9lSIUBK0PIRTb7odgWJPwoPMe/opmmeN1VZEl
         mOqw==
X-Gm-Message-State: AOAM531OkErN99PAQyJcFtEq1Gdso1odDJJUPReBLqRffv91Mc8ecMiA
	zF8t8dwlDFNWEfhOIovJhYMtxPDpCa5HVg==
X-Google-Smtp-Source: ABdhPJwXCA81AmRdZc5lEpch6m38QG1B6yKfPJbLM7Yj+eWTBlryOhd8Yj9oSvgTeW54Mz5G3COedw==
X-Received: by 2002:a17:902:c406:b029:ef:7ba2:f308 with SMTP id k6-20020a170902c406b02900ef7ba2f308mr21988378plk.9.1622486516022;
        Mon, 31 May 2021 11:41:56 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:801:3907:4101:edb0? ([2601:202:4180:a5c0:801:3907:4101:edb0])
        by smtp.gmail.com with ESMTPSA id q24sm12006862pgb.19.2021.05.31.11.41.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 May 2021 11:41:55 -0700 (PDT)
Subject: Re: [OE-core] [v2][PATCH 2/3] kernel.bbclass: link in kernel-features
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20210531181609.963494-1-akuster808@gmail.com>
 <20210531181609.963494-2-akuster808@gmail.com>
 <CADkTA4Nz_WY9M+AZX9AgvXAbCZL-zyCT5YTeAx=B=0y839YU6g@mail.gmail.com>
From: "Armin Kuster" <akuster808@gmail.com>
Message-ID: <cb8ee3b7-f17f-c738-57e9-0c250e6cdbf8@gmail.com>
Date: Mon, 31 May 2021 11:41:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4Nz_WY9M+AZX9AgvXAbCZL-zyCT5YTeAx=B=0y839YU6g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 5/31/21 11:20 AM, Bruce Ashfield wrote:
> Thanks for v2!
>
> On Mon, May 31, 2021 at 2:16 PM Armin Kuster <akuster808@gmail.com> wrote:
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>>
>> --
>> V2]
>> rename kernel-kfrag to kernel-features
>> ---
>>  meta/classes/kernel.bbclass | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index 8693ab86be..493136dfb0 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -1,4 +1,4 @@
>> -inherit linux-kernel-base kernel-module-split
>> +inherit linux-kernel-base kernel-module-split kernel-features
> Since we have the bbwarn, can this just go into kernel-yocto.bbclass
> as a default include (for now) ?
sure.
>
> As part of my series to move things around, I can relocate it to kernel.bbclass.
>
> We are sending two different messages as it stands, and everyone is
> going to get a bbawarn that isn't using linux-yocto, but is using
> kernel.bbclass :D (not that i mind, but others will object ;))
Well. One message is from the Crazy Uncle ( and its not you )

I am not hung up on my solution. Whatevery works  when I  define a
'unique name'  to pull in kernel fragment that live in the
yocto-kernel-cache. I think is silly I am doing this in a s/w layer.

-armin
>
> Bruce
>
>
>>  COMPATIBLE_HOST = ".*-linux"
>>
>> --
>> 2.25.1
>>
>>
>> 
>>
>

