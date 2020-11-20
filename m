Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web11.709.1605893632363414048
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2020 09:33:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OavhYV3f;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id c198so9190172wmd.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2020 09:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=60R0pnk4UBf2PzyMM/lUZfZnZgxGwsQrSnJVmtCuoEA=;
        b=OavhYV3fntviwgs3UfBj8F6KKbSA4Y6nI/YXjbsrt6dPM/JM0uDRwPrnNYhVeorHK0
         skZ6hEdudDegRsPdsgQKzexoqkvVe/zyXqDGX4jGUSUwgI3m7IgP59PnD0mlyNfbv3gS
         qszbvSanYgmbHKvjPjf8mnDBnWtgPCZQh8Rjg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=60R0pnk4UBf2PzyMM/lUZfZnZgxGwsQrSnJVmtCuoEA=;
        b=H8cq/h62vRL6/w1NhNeh0E4O06oRNgjokfOygSbLpEsZTMLWdf2mFnNTP/6xMGJmvz
         YCGyuH2qOzPkAyTIqERMBmAsjRUF8knTd+PgCAxOn0qYKbtXdQoR/zth7HZrM5ubqSjO
         PwXMz/ZUkHxgVk6BABFRC8qAbEDbLI//SZ8Xs0FC5Y/92MXVcquWU2qvbUomq2eM56Lg
         bY+ST7UazRjTVUpS9qJuppHHT5zmbIoH27CJbfKe59fc+GmtHZFeD+DlRiZAmv3dIdQo
         lqjXVi4s8fAQHiEjN/dG3jzGFxPRFdPQqVswJgAVKBstOvlk5iYei7sTYnoV2vRryrQl
         W1WQ==
X-Gm-Message-State: AOAM530wx5WS42muMiga3x7L+wsxDduvKFUScXgNU8/m+tXoRrk9C+z9
	TonOZ4vRAuQXd1jUra9N5XHuJA==
X-Google-Smtp-Source: ABdhPJxbIyH6fKnQkuv9/LK1ACS16OD8XzwZvIBxarswrWv22nw93QWQwYJQkCD1O9ftJb4NzGxvLQ==
X-Received: by 2002:a1c:bd08:: with SMTP id n8mr11066650wmf.136.1605893630578;
        Fri, 20 Nov 2020 09:33:50 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from c.8.b.3.0.6.d.4.9.0.2.b.0.0.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (c.8.b.3.0.6.d.4.9.0.2.b.0.0.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:6000:b209:4d60:3b8c])
        by smtp.gmail.com with ESMTPSA id m3sm6071232wrv.6.2020.11.20.09.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 09:33:49 -0800 (PST)
Message-ID: <2661dbaed4995b2e276b2cf9d5f89877645b6a4d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] go: Update to 1.15.5
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Fri, 20 Nov 2020 17:33:47 +0000
In-Reply-To: <16494477F3BE7FC7.12254@lists.openembedded.org>
References: <20201120081520.1356830-1-raj.khem@gmail.com>
	 <16494477F3BE7FC7.12254@lists.openembedded.org>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-11-20 at 16:33 +0000, Richard Purdie via
lists.openembedded.org wrote:
> On Fri, 2020-11-20 at 00:15 -0800, Khem Raj wrote:
> > Define CXX_FOR_TARGET and CC_FOR_TARGET for target go
> > since we are cross building it, it helps in defining the compiler
> > for cgo on target
> > 
> > Disable CGO_LDFLAGS for go-runtime since it confuses the linker
> > 
> > Fixes
> > > Building std for target, linux/arm.
> > > go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
> > 
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > v2: Fix go-runtime build
> 
> Various failures in world builds:
> 
> musl x86:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/2728
> musl x86-64:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/2731
> no-x11:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/2729

and selftests:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/1582

Cheers,

Richard

