Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.2019.1611875775994031906
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jan 2021 15:16:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UoIqOQxv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id p15so7046716wrq.8
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Jan 2021 15:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=OYAkClynstDM4GhrNVK82o4XawVXnRWu0WOZ/X24kII=;
        b=UoIqOQxvDrSkOJS+U5kGib7q88QMbZA2FV0+e6BT1xj4EULEsQCHR6JnoMvZCHZ94K
         tffsc+SvO25R3qlFJ0Ke4L7majoi2/UUO7Ysi2QFub7Z5yWcL/a9vWrrihUkEze3YsZR
         rrgZJemp2sl9U+9LuoRWRDm2tyC2BJSLDO8ec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=OYAkClynstDM4GhrNVK82o4XawVXnRWu0WOZ/X24kII=;
        b=Js6zZfREjxEMvvTFTR48jk0wEdsLmebee/6H9JLP/6tj5T82cO5UI4xMHjFCKoTeVY
         NubOTtwwgvV20qD0cqvf9RsXjZ9AG4PEVLYdSjh/QteJfsO660XyE8Fqq0zvMt21VHi3
         RFVGAPLTD29VH39kkXcdmKrO7+kkmVp2jgQ1RVSsoj3Y1ZkFH0ZKIYa+j8ApcGBFwTXo
         otfP/SEeHlDzVs9yfsGTO4BlTglxB+C5u+IYJH60GrYAPfi1mfBJZUv2W08avMWxZJYU
         EFDjKnGlUVMPK/VZdzT/FbVuIBN1DApTVn/1uJx0LXvyVQT1+uYwbKyG2a0fHetZwlHO
         Ow5g==
X-Gm-Message-State: AOAM533CT0zcCBcjj6DdlNdhUVhkpUDxNMr6uw5r2PSax7w95HwkpQ+D
	VVYGnaCGkAQBMCLJfqejmsMh1Q==
X-Google-Smtp-Source: ABdhPJzd8saKLJnycRoxq+TrKMZsCnqo7YNsTdV3cAHwfVERSh+tda3xa2JA554PI5BPlZkI06s2lg==
X-Received: by 2002:adf:decf:: with SMTP id i15mr1329173wrn.405.1611875774509;
        Thu, 28 Jan 2021 15:16:14 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:93ef:509c:4f16:14ff? ([2001:8b0:aba:5f3c:93ef:509c:4f16:14ff])
        by smtp.gmail.com with ESMTPSA id z63sm7394435wme.8.2021.01.28.15.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 15:16:14 -0800 (PST)
Message-ID: <f7478654da009d76e9bc6c7a1ba3a99865f775e6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] insane: native-last: Print classes inherited after native/nativesdk
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>, Tomasz Dziendzielski
	 <tomasz.dziendzielski@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Jan 2021 23:16:13 +0000
In-Reply-To: <CAP9ODKow4MBA-WoGMJyxiU-75GXY3-BQyWRqT+dYsJ=+AT7ECQ@mail.gmail.com>
References: <20210127213311.6030-1-tomasz.dziendzielski@gmail.com>
	 <20210127213311.6030-2-tomasz.dziendzielski@gmail.com>
	 <CAP9ODKow4MBA-WoGMJyxiU-75GXY3-BQyWRqT+dYsJ=+AT7ECQ@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-01-28 at 17:27 -0300, Otavio Salvador wrote:
> Em qua., 27 de jan. de 2021 às 18:30, Tomasz Dziendzielski
> <tomasz.dziendzielski@gmail.com> escreveu:
> > 
> > See [YOCTO #5729] for details.
> > 
> > Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
> 
> I'd prefer a little of context on the commit log.

Agreed, I've improved the log of the patch I've merged. Linking to a
bugzilla entry isn't really enough information. I appreciate the
patches though, there have been some good ones!

Cheers,

Richard

