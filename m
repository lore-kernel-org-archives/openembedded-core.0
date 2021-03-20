Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.9850.1616277881356921277
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Mar 2021 15:04:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DYtpfhdy;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id q6-20020a17090a4306b02900c42a012202so6573668pjg.5
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Mar 2021 15:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pJ9xB16oVnyu3+6pde9fvFZdSEElB6ba0C5gpdnXcz4=;
        b=DYtpfhdylAE963BHweZpjQuAonHCrh63KdhTn5S1DHO3x/iT0UfC571QmvD+c30uJj
         JE/h3k7AvisC8sshDXB4q7Z/ISwkNxo+0I8bJQ+ejWGDS8cmVGDcqcvFLgBvJCNzIeUC
         5bH16eZnYuoYF43JbG6jHHEwUbIVXZvbAMoLDC3KGdVNZG8rBqHJkkLI6h4tyCmMYHtz
         PtFQ/PbogGHg6rRq4WoHccGhEBWmiZ88VIYGhL60rMG4bG2z+YU77N7rBqsJKHOfWmdJ
         f1cWhRpO2Iu8WaU0frR4yOxs9X8ukb9o4k1+zAQQTPAvDlY4ctXRQpPVioE7TBwzXTn5
         yPiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=pJ9xB16oVnyu3+6pde9fvFZdSEElB6ba0C5gpdnXcz4=;
        b=Qbqnplmvf4breRpo0bplyrni06whuU28jGuUJ12DUd+z8MFj/qxU9Mvy2G0TobReqQ
         +szvKh05jxAHHmKczFyEPncGBHKOisQrJZFZwVgEcFUNFVBhKMWG9Q/TxPGl/tWaOK03
         he5McmooEgdT/DGsP39RLZUOWwY+RD9D2hk/txBYOPX73hLpo9KJfIg0nA0rhUpygeo0
         3fSHQi2ZNzn72fu34VO6fw/zgB1bxlQ1aH16W8PqMmeMmCzQgiDEcv94soiX5wCmjkyF
         F6eF/ISMhI3Qhs+Bo/nG2C0KDRTylEgPyqGhYtQfL9CfANbpTI07H7aRTiRfbtsL9G/z
         OyRA==
X-Gm-Message-State: AOAM533YIADi4naOXG5BQfvvZpjrygjqThGl7s9CAC/yL+Hm+frhY37X
	2kduI5AtBGOQyjCOfhkclak/jYKd8PXbDA==
X-Google-Smtp-Source: ABdhPJxo7tVJ22Adt7vCRXH7HHE+dS2vEBxHFXx3r6bzPgSsliL3wucUIfTQItvgjb065GCVDLTwrg==
X-Received: by 2002:a17:90a:8813:: with SMTP id s19mr5226107pjn.94.1616277880897;
        Sat, 20 Mar 2021 15:04:40 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:c4a9:4187:9c07:8080? ([2601:646:9200:a0f0:c4a9:4187:9c07:8080])
        by smtp.gmail.com with ESMTPSA id 82sm9277920pfv.19.2021.03.20.15.04.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Mar 2021 15:04:40 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] bitbake.conf: Prevent pyc file creation in pseudo context for shell tasks
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 openembedded-core@lists.openembedded.org, Paul Barker <pbarker@konsulko.com>
References: <20210319203032.16009-1-pkj@axis.com>
 <ff7b6c5bc9802ad17521c3d561d2fa392efd3b19.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <c5baa736-8b8e-69da-b97d-ca66849c739d@gmail.com>
Date: Sat, 20 Mar 2021 15:04:39 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <ff7b6c5bc9802ad17521c3d561d2fa392efd3b19.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 3/20/21 1:34 AM, Richard Purdie wrote:
> On Fri, 2021-03-19 at 21:30 +0100, Peter Kjellerstedt wrote:
>> In commit 73d538f2 (bitbake.conf: Prevent pyc file generation in
>> pseudo context), pyc generation was disabled for fakeroot python
>> tasks. However, Python applications started from a fakeroot shell task
>> were not affected by this and would still generate pyc files, which
>> could trigger pseudo to abort. To avoid this, add
>> PYTHONDONTWRITEBYTECODE=1 also to FAKEROOTENV.
>>
>> Also add a test case to ensure that pyc files are not created by
>> Python applications started from shell tasks that are executed under
>> pseudo.
>>
>> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> 
> It is looking like this might not be quite so simple.
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/3225
> 
> Basically if we do what this patch does, it disables pyc files everywhere
> including target recipes/output.
> 

seems to break builds meson as well see
https://errors.yoctoproject.org/Errors/Details/574281/

> Cheers,
> 
> Richard
> 
> 
> 
> 
> 
