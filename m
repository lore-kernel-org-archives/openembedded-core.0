Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.14971.1624902923644083794
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jun 2021 10:55:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=U6giiQsH;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id mn20-20020a17090b1894b02901707fc074e8so387261pjb.0
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Jun 2021 10:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:references:from:organization:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7M9d7q6d5n5ky+p0jjeickxIJKXOdH0gx4hjUpwx/mk=;
        b=U6giiQsHqbBCLzHleKoRNFmlFGlHr2CEZa/7tv76c+y6SErii5hn5UBWYU1bit+V/O
         gYdPZDD/p1mzSWLk9Alkr3TyoWDPOfojH3ZEH6oohldX8G1FXMfLgb5Zzg0rzUdgYKiT
         5HB75LLtqMKIq++MXgBqRZ1DtIXmfBo5uQwVMgGaDObGpOJ8gINX4n6D8aWXzrL24G6J
         dtMmHr8KRlGVu91CffGdwgyxHBwiqTWQIpj4wagjCZymA/Nv7A/HOYrWS1uPK1zTSo1W
         rV/9eQ0FDpUyD4muo6ZxbhgUZ+CxPaQfnmJkkI7kx6YfVCuGPSpsAs5GCS63JWzUA8tx
         dzIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:references:from:organization:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=7M9d7q6d5n5ky+p0jjeickxIJKXOdH0gx4hjUpwx/mk=;
        b=hCfl0wvtktF1W4ZQNZlSneCFfAzruRFwY9lcQoKoqdpO36kFYPMLUaXGtarYQHOvXL
         PBeLtT3tWbHBjAUehmpRM8f2pPBAgZMslHgiJeAJSGydnjLm1btJgXSSwPjZv62tN4sp
         /L6B/aKgKb88ZpK8WFHyAFxr0rrFcndoeyh6e+vC9V7lq5Cogti21JYx826u9OdffuL6
         xnZdvjEeIhzy1E8/n1YXYXMGRC3rIqaepYwiKjCfYCgzBb54ARaLkr6AEkfhn4jhMbrk
         c29cUvkxk9sXYPU+LyFRIk/HCPG7QPMC9Vsp7UuK/vYp3un68C9jVyL07HOXtoeWS0BF
         VkhA==
X-Gm-Message-State: AOAM531jO26UcydSj4kK9xpDqDqUGsOsG0nArhJxzAm1vIXQLhXLG2+v
	xPZuOuMop1Cxsalb42ss5CDvty2iEMxJmw==
X-Google-Smtp-Source: ABdhPJz9Z7nNEDQzCiWCmMLPIV8JKB8RYxnP0VF5peD+6+cwjIaROI+kTxLVi9rg3VjQhGECnCJcqQ==
X-Received: by 2002:a17:90a:6b01:: with SMTP id v1mr29179137pjj.10.1624902922961;
        Mon, 28 Jun 2021 10:55:22 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:7ccb:5507:b206:6695? ([2601:646:9200:a0f0:7ccb:5507:b206:6695])
        by smtp.gmail.com with ESMTPSA id j19sm15144705pgm.44.2021.06.28.10.55.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jun 2021 10:55:22 -0700 (PDT)
To: Andrea Adami <andrea.adami@gmail.com>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <CAAQYJAvFsFr-1WDMkqeSLReq6V2irGR04XOEoVa_GnXAK+abqA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Subject: Re: [OE-core] RFC: pulseaudio vs. meson vs. neon
Message-ID: <c11c5d80-1913-00eb-343d-a8b344352298@gmail.com>
Date: Mon, 28 Jun 2021 10:55:21 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAAQYJAvFsFr-1WDMkqeSLReq6V2irGR04XOEoVa_GnXAK+abqA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Andrea

On 6/28/21 3:01 AM, Andrea Adami wrote:
> Hello,
> 
> during a core-image-sato build for armv4 I got one single build
> failure with pulseaudio.
> 
> This happens after commit 80bbea0 pulseaudio: switch build system from
> Autotools to Meson. In the commit text it is evidenced:
> 
> "
> With Meson there's no option for disabling Neon optimizations if the
> compiler supports Neon. If -mfpu is set in CC or CFLAGS, it's ignored,
> because the build system adds -mfpu=neon at the end of the compiler
> command line, overriding any earlier -mfpu options. This shouldn't be
> a problem, because PulseAudio detects at runtime whether the CPU
> supports Neon instructions.
> "
> 
> At the moment to build pulseaudio for armv4/5 I have reverted to using
> autotools.
> 
> 
> There was around a patch but has not been merged.
> https://lists.openembedded.org/g/openembedded-core/message/146375
> 

this patch is not right. It might let us compile but it will still emit 
code that will expect VFP at runtime and hence fail to run.

> Maybe a v2 will be accepted?

right fix would be to add a proper neon support check in pulseaudio 
meson'ary, and if PA has dropped the ball on non VFP ARM then it will be 
hard to convince upstream to accept it but atleast you can try.

> 
> Cheers
> A.A.
> 
> 
> 
> 
> 
