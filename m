Received: from mail-io1-f66.google.com (mail-io1-f66.google.com [209.85.166.66])
 by mx.groups.io with SMTP id smtpd.web10.20895.1589569977896460593
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2020 12:12:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ENyW5GJk;
 spf=pass (domain: gmail.com, ip: 209.85.166.66, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f66.google.com with SMTP id o5so3868367iow.8
        for <openembedded-core@lists.openembedded.org>; Fri, 15 May 2020 12:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=+rP0+rBGmU+S1fblyqFEzAyYcfAmX0xsL1IcTXh9nLI=;
        b=ENyW5GJkkAOSoiYYYYnlSZUVJOA4UFp3pHBSgGfSWdKaJCw+1F2WMQ1dqL7lqkdKth
         Uu6DGbadht4lGvV8DCLv1SJUgBl2s7DKEDU9zERcdsxc1WBMPhZMTQRO0eE8Egi34BQG
         oCN3EOLt8VwEt6Ap2P8Pgd+B3qdL77wXD1visSQxezTAo0DHM4iytrN6NnmxpIjp0Gre
         ngejx8LqmZkEV6dycfD5VcXNJdou65PX5hiUJ8aWBdEjq0s+lwEYZtk/RAbwL3YH0hhU
         avHwA7x7U64BNpCZ8wuuYnrTyQP5g8MM4bceE279HVG4t2YqEi11e88tVzH9BYKd3Rdn
         nryQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=+rP0+rBGmU+S1fblyqFEzAyYcfAmX0xsL1IcTXh9nLI=;
        b=ChRB94EHwW3r7k30XAfGE017rwfv3sgUZuJuOQjC2RnpwGLkAQbPPKAqiAV1H/bgZ7
         85APhZoboQYoV8VJpImEuB/hXPPbhuDgj9CmglrXwCpWIm7VjB/YvlTfNl0XjPHJY1Kg
         Jdp+k/q2FgW8zZsPGn6LjoGR6fhgIBYgE9npYGnyZ1Y9//jfqB+5TfVX+k3V3UdYkFPw
         sPjNuAQ9cDs9KREdYm+/EfhnF6iaVk0Diea5YcUX3ubXOhO5/JJ5RnA+1I0sxQ39Esmg
         ZRlU89EqeTUBzpX3oXOJOI91uaDRogny85u5PYrDwAJODNyf2zYqaRP21O23e2YIWLyZ
         GRdg==
X-Gm-Message-State: AOAM5305zepVRPuoN+kkdI9/ZlF8cep1vOic1HDSvKcilMrIFv2W4FdS
	S4bdovDz3Nj/x3phrdKIbQI=
X-Google-Smtp-Source: ABdhPJzynlxrk1a1zR2leWYnrlzMJ+5O7fLGkq72LgKpplB/GO/NfcLW+4J9811hifeXmYTIJAJdgg==
X-Received: by 2002:a5e:df08:: with SMTP id f8mr4419696ioq.30.1589569977166;
        Fri, 15 May 2020 12:12:57 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from ?IPv6:2605:a601:ac3d:c100:7472:a058:3fd7:24e9? ([2605:a601:ac3d:c100:7472:a058:3fd7:24e9])
        by smtp.gmail.com with ESMTPSA id i21sm1247492ila.22.2020.05.15.12.12.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2020 12:12:56 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [OE-core][PATCH 0/4] Import recipes from meta-python
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org, jdmason@kudzu.us,
 Khem Raj <raj.khem@gmail.com>
References: <20200514210458.33543-1-JPEWhacker@gmail.com>
 <20200515185354.GE11927@denix.org>
 <591d657764bbea63ad2a2fa5cd0587cc305e600a.camel@linuxfoundation.org>
Message-ID: <faff3240-ecfa-2f3a-4601-a7ad41952b99@gmail.com>
Date: Fri, 15 May 2020 14:12:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <591d657764bbea63ad2a2fa5cd0587cc305e600a.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 5/15/20 2:05 PM, Richard Purdie wrote:
> On Fri, 2020-05-15 at 14:53 -0400, Denys Dmytriyenko wrote:
>> I see Richard has merged these to master-next, thanks!
>> And thanks Joshua for volunteering to maintain these recipes :)
>> I submitted removal patches to meta-python.
>>
>> So, it is good we are getting this extra dependency resolved in master. The
>> question is - can we get these backported to dunfell, does it qualify?
>>
>> Otherwise Jon wanted to finally branch off meta-arm into dunfell today and
>> we'll have to live with it until gatesgarth.
> I put them into -next so we could test them, see if the autobuilder had
> any surprises. Good news is there weren't any.
>
> The question still remains whether this is the best approach or not and
> some people I talked to were not convinced that a consensus had been
> reached.
>
> The question I guess is how widely used is optee and does it warrant
> adding this? Its a little ironic the thing people want is trusted-
> firmware...

FWIW, after having gone through the exercise of pulling in TF-A into 
qemuarm64, I think I've been convinced that op-tee and TF-A belong 
together since they are sometimes tightly integrated together (something 
I didn't realize before). As such, having both in the same layer makes 
sense. Even if TF-A was in oe-core, you'd probably want op-tee also, 
which means the python modules would have to be there anyway. I think we 
can still have the discussion about moving the whole lot over there, but 
we don't need to do that now, and moving the python recipes at least 
cuts out the meta-python dependency.

My last concern was testing of optee, since there was no platform that 
could build it by default, but I fixed that by implemented support for a 
qemuarm64-based machine that's defined in meta-arm which uses TF-A + 
optee + u-boot and can successful boot using TF-A and passes the op-tee 
unit tests, so I don't have any concern about that anymore.

>
> Cheers,
>
> Richard
>
