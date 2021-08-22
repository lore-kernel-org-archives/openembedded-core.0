Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web12.8665.1629628299197262276
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 03:31:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UOfAMKRL;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: oecore.mailinglist@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id z4so5792370wrr.6
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 03:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=x/yXkH2kspkVYf+suA5TSZ2IRslSv2m9574p2e/INuc=;
        b=UOfAMKRL2ErhUMdy0ky0sY39QQwTq/1ndIrGhPTqFnGJXwu1mvkapkjoaDXfOttz6t
         qSQ6Ss4+6hsAMDcUoS1o37E/dTIMyI/4cp7RW436iMxpc2ua6JyP9KpSW2BPfIma+awa
         v0INd0p77Nfs1//Rjhc108FhtB7zdMITbNXRFnmjQLzN7yOaxh1fcd636+Nf33qRVKbe
         25KvQsxa01USbaEcIQFdj+Z5vuO0EwvAI/3CcfiH4c2Rzq/y0GpeLgEwykQXLmNtoc1y
         lgEoPB7kjDcWy64NMEWE3CH2+p+suYBHIBn1NTJMgHHTzhZkL3UZ35dEUWLWV/U07xee
         zpdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=x/yXkH2kspkVYf+suA5TSZ2IRslSv2m9574p2e/INuc=;
        b=Xh0bczm9eICiInYoGwmL62GQmV3z2u9Mn8mwF0P2WRT7dqN1S2OaiCAt1jdENggPj5
         xXHRpAzm75H5emxb72+qeoU5kKlDSBt0doIcj8VWKwfJzlIS+9fngpKkJzcvx5JUAcQg
         fJxDB01nImLlIKDJVdlDUrE9sXyDMBUfCbAJMNuGUCVNEqOQI8zfwMGo6EuoUdOnfeDv
         i5mkQxfcuD4U+/IzLJ5IPm1VjHAt8SRMkENvUNW54145Q0sgEbNc8Q2R6AM4OhnMoS8N
         LX94iIIklF/SttlBGghGDjpOYyEKSCE4V9yhkMsRBr7C79BIQfFKurCUlVT3tHkX63xG
         OA3g==
X-Gm-Message-State: AOAM531vuELLkn8cmkte6OlX+IiU3Dlqkgm7Vq4qc+Z0xUcHNLSEcSCb
	UA2ThUUCP1eObPM+ry/iLo0=
X-Google-Smtp-Source: ABdhPJwVL7C0VwKsp1+DL7uZ8PcLBiujkpEF/eNzuNGFHyYyHBcL3eT0lQgWZ3rwK88mETSYXq7Bxw==
X-Received: by 2002:a5d:548e:: with SMTP id h14mr2929798wrv.7.1629628297514;
        Sun, 22 Aug 2021 03:31:37 -0700 (PDT)
Return-Path: <oecore.mailinglist@gmail.com>
Received: from [192.168.42.52] (ppp-2-86-146-48.home.otenet.gr. [2.86.146.48])
        by smtp.gmail.com with ESMTPSA id g35sm17345527wmp.9.2021.08.22.03.31.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Aug 2021 03:31:37 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] goarch.bbclass: Disable GO_DYNLINK by default
To: Oliver Kranz <o.kranz.88@gmail.com>,
 Konrad Weihmann <kweihmann@outlook.com>,
 openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com
References: <20210821200919.3064381-1-o.kranz.88@gmail.com>
 <AS8PR09MB46459A00E870A5B364082DCFA8C29@AS8PR09MB4645.eurprd09.prod.outlook.com>
 <32bdbcc1-469b-2d7d-8a4e-7413f88fc4e2@gmail.com>
From: "Robert Berger" <oecore.mailinglist@gmail.com>
Message-ID: <e75f5049-6904-4f1a-dc04-809353f5eb01@gmail.com>
Date: Sun, 22 Aug 2021 13:31:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <32bdbcc1-469b-2d7d-8a4e-7413f88fc4e2@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

On 22/08/2021 01:31, Oliver Kranz wrote:
> On 21.08.21 22:26, Konrad Weihmann wrote:
>> I'd truly like to oppose the idea of static linking by default, how 
>> juicy this idea may sound...
>> But if we switch to static linking, literary no one can be be sure 
>> about licensing anymore (to me one of the major weak spots of go).
>>
> I see your point here. The main concern was to get rid of the 37MB go 
> std lib but I missed the licensing part. I'll have a deeper look into 
> the golang linking.

One major issue with licensing and reproducibility is that go pulls in 
dependencies. This issue can also be seen by many other "modern" 
languages and you can also modify your Makefile or Cmake to pull in 
dependencies, but that's not what we typically want when we BitBake.

A workaround for reproducibility is to use a local go cache.

A workaround for licensing is to split the dependencies into separate 
recipes.

Konrad describes it here:

https://bitbakesoda.blogspot.com/2021/04/making-go-not-no-go.html

Now, if we make static linking the default things might get even more 
interesting licensing-wise, depending on whom you ask ;)

I think the main issue here is LGPL2/3 vs. GPL2/3, "derivative work", 
"installation requirements" and what you need to ship for open source 
license compliance.

LGPL2/3:

https://tldrlegal.com/license/gnu-lesser-general-public-license-v2.1-(lgpl-2.1)

https://tldrlegal.com/license/gnu-lesser-general-public-license-v3-(lgpl-3)

GPL2/3:

https://tldrlegal.com/license/gnu-general-public-license-v2

https://tldrlegal.com/license/gnu-general-public-license-v3-(gpl-3)

derivative work:

The GPL2 license describes it like this: The "Program", below, refers to 
any such program or work, and a "work based on the Program" means either 
the Program or any derivative work under copyright law: that is to say, 
a work containing the Program or a portion of it, either verbatim or 
with modifications and/or translated into another language.

see also:

https://lwn.net/Articles/548216/

"installation requirements":

LGPL3:

If the software is part of a consumer device, you must include the 
installation information necessary to modify and reinstall the software.

GPL3:

If the software is part of a consumer device, you must include the 
installation information necessary to modify and reinstall the software.

Bradley seems to have another opinion lately (July 23, 2021)

https://sfconservancy.org/blog/?author=bkuhn

Regards,

Robert





