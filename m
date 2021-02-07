Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web09.27865.1612738811518926412
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Feb 2021 15:00:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ehf8Ii/O;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id c12so15066995wrc.7
        for <openembedded-core@lists.openembedded.org>; Sun, 07 Feb 2021 15:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=caZN71TdxOV0ifhH1qjaTOU8No4hskcTFJIWS3ivq0g=;
        b=Ehf8Ii/OSU3BD3ZCsXJYkCCNMDUGI/e4IPcBmuNVxzv7ohvtiMdX4uRgOJs5UB2Je+
         yjC9Fs8O+G/JnoXVba5F7kdBl4KA+DnTVjiQZXbhTHdE2HXzNFE2mZ2mtPFOT/IvBK9Y
         jQdOW3tlCA75//Js7vbov/IybNkH+34ic+7mM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=caZN71TdxOV0ifhH1qjaTOU8No4hskcTFJIWS3ivq0g=;
        b=iTyt1hdxq1BYyDd5U+O5gKfdMdldLaaIDeKzOn5vSxzGlf2f7Y8Ahm+nPJArGXQ9UK
         NMdb1a3zfzzqmCVRxMF9P5Xu7JqBJCXfZx9tEm2YI4aLunl/lbWiBpqvCmehEbil5CQu
         Sj3uKe8pQ6ZysowXQ/R3Wcged5j5sS+CFSraQ8mPnm+4UsULeXKJ6Fb7SS+Vn21olZZ1
         erd/UqfKYYxwfxNDJEuqvS5DQ2hsV/IApS7A1L9mAzDoDH1i3EZDDRq3YeB3jXwvEs97
         070sNW37YExCJOvkiNjgeUx12MIuTILVzEFiwoYZwsqWYf79twXSj/38Cm+RHHVnhFkO
         o9hg==
X-Gm-Message-State: AOAM530QmUo2Jnm9FKi8+CFNJ+W5bu7C1BHRqE26c8vsqaynIIcu42Lt
	2kMvJMAWS4cEa9xwbBiKr3jP6w==
X-Google-Smtp-Source: ABdhPJwpUUOl0AdYYBztzLkB5uM/vgzF7mayqtbb+w0/N4CLSY6JJH8Wce/KD8694qOiiiZyLvLsgw==
X-Received: by 2002:adf:e70e:: with SMTP id c14mr5139429wrm.54.1612738810222;
        Sun, 07 Feb 2021 15:00:10 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:ff1a:4654:ede1:462c? ([2001:8b0:aba:5f3c:ff1a:4654:ede1:462c])
        by smtp.gmail.com with ESMTPSA id z1sm25128992wru.70.2021.02.07.15.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 15:00:09 -0800 (PST)
Message-ID: <5bd02696955631f07d754eb6a009a8f6f38ce27c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 2/3] shaderc: add option to skip building the examples
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Sun, 07 Feb 2021 23:00:09 +0000
In-Reply-To: <CANPvuRntP03A8U696D+JoBVtvK=Kp-Dj08Eae5=Sx=CuqpTP4g@mail.gmail.com>
References: <20210207180504.1552900-1-quaresma.jose@gmail.com>
	 <20210207180504.1552900-2-quaresma.jose@gmail.com>
	 <f772741f2969f3b3e3ea117fb35c8a39a9a14756.camel@linuxfoundation.org>
	 <CANPvuRntP03A8U696D+JoBVtvK=Kp-Dj08Eae5=Sx=CuqpTP4g@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2021-02-07 at 22:56 +0000, Jose Quaresma wrote:
> Hi Richard,
> 
> I need some help to analyze the log of the compilation.
> where can i find it? is it possible?
> 
> The compilation log mentioned on
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1835
> are
> /home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/x86_64-
> linux/shaderc-native/2020.4-r0/temp/log.do_compile.199121
> 
> On my side it build fine on x86_64 so I don't understand the problem!

That log is included here:

https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/3034/steps/11/logs/stdio

or here is another:

https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/3056/steps/11/logs/stdio

Cheers,

Richard



