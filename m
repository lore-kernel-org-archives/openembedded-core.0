Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web08.8798.1620305343338056207
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 May 2021 05:49:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YOCBybj6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id m9so5495315wrx.3
        for <openembedded-core@lists.openembedded.org>; Thu, 06 May 2021 05:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Lb0kH9T/v/LipH117ChaMY+gqDwgDbQswmsJ9PdEYfs=;
        b=YOCBybj6XOtij4iS7czvue7dUL8gN3qVai26YlRZ3tPeKNdxwGy9kinOBi9rrrZyZF
         7QmAuF2ql8s4E2qvbEih/RXKHuP56+0cqHk58HJi2XlciquN9jubMLgndGzBrZ9/k4xQ
         dEhT+TG5kmrWC2yz3pnQ++A70KFN8k+E6TifI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Lb0kH9T/v/LipH117ChaMY+gqDwgDbQswmsJ9PdEYfs=;
        b=TwGkhRyEsXl7YTbVguomNpAC2zSS5ihZvE0ArMB6w0mxz3oX4MhFBVYFMOlW50O3hn
         zzjYfETyR/5oEOL2NAK+u4lem3uDc0P6KlpuReBsWlFgeHaN2BXcL0VRYKwIuzOd0ebi
         a9NVr2z4WUlFwOypMIC1G4uXBfYms4UspCIFllUMS+peZWpfIglMIfaoXZOTaPNLEC6P
         jLM2Ca9/KhNd5JMp1y/x/4t/Tqb12egCYrwdiN1ocbZHSGW4xRWH+jk3LgfzABHC8fdp
         OaIQ813a+9npYfJFLx49Ye+BVB9aF43wciOl6N021IIigRWFg7ZKPH8TdsnYbcd35PTS
         n1vQ==
X-Gm-Message-State: AOAM531+N6o6wcxfX7k5twOZpMtWa4k21mVNcrmcgFH8j7LtZXQS3pNJ
	ImxahY5TJ03/InklzGLOY38dqg==
X-Google-Smtp-Source: ABdhPJwnHfHxPxh7Gs0tP/kmwiBU30nOL9taJbfqVCc0lwEN7vfK5qxhUGMLSvSuAe4Rpvj6g4BYgw==
X-Received: by 2002:adf:d091:: with SMTP id y17mr4820049wrh.107.1620305341889;
        Thu, 06 May 2021 05:49:01 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:d0ab:d9f1:6e0d:9f6e? ([2001:8b0:aba:5f3c:d0ab:d9f1:6e0d:9f6e])
        by smtp.gmail.com with ESMTPSA id h5sm9743672wmq.23.2021.05.06.05.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 05:49:01 -0700 (PDT)
Message-ID: <5477b2d1345e68ebe5fe99c23325fc306215611b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [hardknott][PATCH] Binutils: Fix CVE-2021-20197
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Vinay Kumar <vinay.m.engg@gmail.com>, "Mittal, Anuj"
 <anuj.mittal@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, "vinay.kumar@blackfigtech.com"
 <vinay.kumar@blackfigtech.com>, "rwmacleod@gmail.com"
 <rwmacleod@gmail.com>,  "umesh.kalappa0@gmail.com"
 <umesh.kalappa0@gmail.com>
Date: Thu, 06 May 2021 13:49:00 +0100
In-Reply-To: <CANUMPcUyz7S_ynQGEtoq03TjnD-ccJZF9=Vfin+QGe7TW_GkEg@mail.gmail.com>
References: <20210429113046.172473-1-vinay.m.engg@gmail.com>
	 <4064cc6aa03b56a7e3aa5e403fc4c17ed5bef77d.camel@intel.com>
	 <CANUMPcUyz7S_ynQGEtoq03TjnD-ccJZF9=Vfin+QGe7TW_GkEg@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-05-06 at 17:55 +0530, Vinay Kumar wrote:
> Hi Anuj,
> 
> Thanks for the feedback.
> 
> > > This doesn't look like a cherry pick of: https://github.com/bminor/binutils-gdb/commit/d3edaa91d4cf7202ec14342410194841e2f67f12
> > > What else is in there?
> 
> cherry picked commit ids in the below order to "SRCREV" of binutils-2.36.inc.
> 
> 1. 8e03235147a9e774d3ba084e93c2da1aa94d1cec
> 2. d3edaa91d4cf7202ec14342410194841e2f67f12
> 3. 8b69e61d4be276bb862698aaafddc3e779d23c8f
> 
> Direct cherry-pick of "d3edaa91d4cf7202ec14342410194841e2f67f12" into
> "SRCREV" gives errors due to the changes in arsup.c file. So used
> 8e03235147a9e774d3ba084e93c2da1aa94d1cec (binutils: Avoid renaming
> over existing files).
> 
> The commit id 8b69e61d4be276bb862698aaafddc3e779d23c8f is
> to fix the binutils build error with Mingw.
> 
> > > Also this didn't apply on hardknott and I had to rebase it. Please also
> > > use b in the subject for binutils.
> 
> Will send a v2 patch with corrections.

The patch was tested and then merged but we can update the patch header with 
more info if we have it.

I'd assumed the differences were due to the smart_rename disabling/renabling 
the patch mentioned.

Cheers,

Richard

