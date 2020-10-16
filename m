Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.9313.1602831056507331362
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2020 23:50:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jwRxqHJl;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: oecore.mailinglist@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id d81so1342781wmc.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2020 23:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tt+VoD2UcIuagO3/z3MtExynRiEkHyew8rexY8NNaXU=;
        b=jwRxqHJl3xpvegcROrk8I1yqnsJ33Rz3vDkAgAXCLV5o0V8WTVgF6sRp39RaKWnm6Y
         Hq2PSkX0VAj3VLK6WKOXir+xr0MWnLCkzM7pahgcLpFlQvL+Xy+9qxl772YbxKhm2FIa
         xP39VuVHZkZFwBKStHH14r3iNew0FYu64CtU16p0OCwaooMM4fOZUpdFtH9xB26z2eFL
         UVnqKXIOXD6cGV+zD0VooaUJ2Pz8/Srp7U8XdhBrvLTyr3qrlOt2kk9rfn7V4RnIBl5B
         WH3SjODPMSHcRuJWFWUfHIWf9FEuq4O0FSkVEY8A9Fc27X86xTCyIXbKydKyhpb/oShT
         zh4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tt+VoD2UcIuagO3/z3MtExynRiEkHyew8rexY8NNaXU=;
        b=oNnABNTa5SOLpdlhQEVSSqo3Hds4YjniN36Xntsuv7cDYDdBgxV6pu/ng/fcB5r6pH
         HizaTNhAFoqo/59pBfLL+Uj9XdJ/N/43XxC7c86sXM2AoWjPPxbzMQMU53ThOIeQirK6
         52nNVOJ0qHe+K+iLlJAnARCMT7g/lnSBXv0qWjvr56DBKWGJJ8MZpGt5QGasMEkVqIAX
         P8gPhn65Hbe5s0/BpwltAwxWkTWbJIenRNonuPo30GLzCl4EfyuutIFJieel7sqwTt3x
         MJFvnwTVBY7+979tk9Ak+abl+gp8XMq/Qmg9bSR0QQP2BoAc/rsfBD2JMh9bN2O7RrOg
         m7rA==
X-Gm-Message-State: AOAM533wXS5t3zBHXIeiggrNIyUnVs+of2oZbfDnmR4xeAcbSK7P5d9e
	GYGet2cRmzhQew75/0ELUQiwDWwUS7I=
X-Google-Smtp-Source: ABdhPJxKo0U9EnLXIDWFyoRaThh0x3Hp36X92fU5ANDCC2N2cqbvZJSAr4Zf75RziVuZWKMuZ2lUeQ==
X-Received: by 2002:a1c:6355:: with SMTP id x82mr2296768wmb.177.1602831054704;
        Thu, 15 Oct 2020 23:50:54 -0700 (PDT)
Return-Path: <oecore.mailinglist@gmail.com>
Received: from [192.168.42.52] (ppp-2-84-14-95.home.otenet.gr. [2.84.14.95])
        by smtp.gmail.com with ESMTPSA id a3sm2166778wrh.94.2020.10.15.23.50.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2020 23:50:54 -0700 (PDT)
Subject: Re: [OE-core] Where to download zeus 0011-linux-user-remove-host-stime-syscall.patch?
To: JH <jupiter.hce@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>,
 Yocto discussion list <yocto@yoctoproject.org>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <CAA=hcWTT+EjGhk_XN-ErdXmXJeZvFfje=rL7+O84HtmvC0uJsA@mail.gmail.com>
 <CAMKF1srurSsrbwJMAzTTRNEYX0eqPmCQn8t1u8kHbXkMz878=A@mail.gmail.com>
From: "Robert Berger" <oecore.mailinglist@gmail.com>
Message-ID: <f93752f2-3066-bb67-0734-6559029e62a7@gmail.com>
Date: Fri, 16 Oct 2020 09:50:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1srurSsrbwJMAzTTRNEYX0eqPmCQn8t1u8kHbXkMz878=A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

On 16/10/2020 09:27, Khem Raj wrote:
> ubuntu 20.04 is not a supported host for zeus see
> https://www.yoctoproject.org/docs/3.0/ref-manual/ref-manual.html#detailed-supported-distros
> so perhaps you might want to use a supported host e.g. 18.04 or 19.04

... or you use a docker poky build container with Ubuntu 20.04.

Something like this[1] official crops container or my modified one[2].

With my container you would have host Ubuntu whatever, say Ubuntu 20.04 
and in the container Ubuntu 18 with a host gcc9.

Here[3] is a video how you can get my build environment with the 
container from above up and running.

[1] https://github.com/crops/poky-container
[2] 
https://github.com/RobertBerger/poky-container/tree/2020-07-26-master-local-gcc-9-gui-ub18
[3] https://www.youtube.com/watch?v=QCBcHuCj5JU

Regards,

Robert


