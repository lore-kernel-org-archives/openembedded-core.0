Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web08.7775.1611315028576996985
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jan 2021 03:30:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=epGjC7ei;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id g10so4762546wrx.1
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Jan 2021 03:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=L08ye6dqL1tFpG1jzAJZNFmkYNcmnYGyz821dcBvYlo=;
        b=epGjC7ei8IsH8RnhDykQ+Fn7x3TTOYdqHZrSIRtmy+5+QcEziCyY2JkUT1jQkfkHhe
         lezTEE4KZ/mR97WmN4gsbjCFXPT/xQxMSEd+JuFjPgFtvRF6jsINd+6duy7rcMxhrdvW
         PiuOT0Gbi0qUi7mV79sOqHUdDFm0bxMGrx08M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=L08ye6dqL1tFpG1jzAJZNFmkYNcmnYGyz821dcBvYlo=;
        b=Ap+ZnbPYBnlvnFeKEQWqilFA6fDVIjYfV2W64v2XUbBc9dMXIgsmhxXSXa9cFURBZ/
         8uUaR0eSHGyHxGHZbZTtqzNSQg4xqKZjcF0I5vIE6CJYignSGc0ExQUCxk0Qj/BDC2c1
         yfcDPwzI0CvZQ5lyK0WxNfM6ctt+Dseh/bX3oeGzjU64AsWWfXK3GakB/cRRt/y3UpnV
         49/XGlG2fX0EsGPMTeEFqqdRtsiDL57Qb0/59uy4ftGsrqhFJ0kQy+r4MyVCasQJqFpl
         xl7hQJ2T/4VsBentP0w7+IKf2x3oGx2PHEHdKK/2Lg0i/ztSdmMQ3VFWQXfyNxn1WykV
         hDrw==
X-Gm-Message-State: AOAM5338gKoOVLoQKOSarcqw5I4Muto67CpVYl36YFFngKkjKW2eIeet
	70PKnxoEYM9xCfv4XVLDu69BkA==
X-Google-Smtp-Source: ABdhPJy2/Cz4e+GEChpMyLDr6LJVT7tTwKI8wzF32QQZri67PIWiG5hY1XIUMJ/sXenJCzPf3r3XcA==
X-Received: by 2002:a5d:5913:: with SMTP id v19mr4054351wrd.207.1611315027128;
        Fri, 22 Jan 2021 03:30:27 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:6d8b:661b:50ff:3a78? ([2001:8b0:aba:5f3c:6d8b:661b:50ff:3a78])
        by smtp.gmail.com with ESMTPSA id l5sm11542654wrv.44.2021.01.22.03.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 03:30:26 -0800 (PST)
Message-ID: <916e0ec9970e7c08588d7150c9a141e3cdff2f63.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 2/2] glslang: upgrade 8.13.3743 -> 11.1.0
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 22 Jan 2021 11:30:25 +0000
In-Reply-To: <20210122093013.642421-2-quaresma.jose@gmail.com>
References: <20210122093013.642421-1-quaresma.jose@gmail.com>
	 <20210122093013.642421-2-quaresma.jose@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-01-22 at 09:30 +0000, Jose Quaresma wrote:
> License-Update: Add additional licenses
> 
> - [1] BSD-2-Clause & MIT & Apache-2.0
> - [2] GPL-3-with-bison-exception
> 
> [1] https://github.com/KhronosGroup/glslang/commit/2962be40baff69848fd786c609289666b60741b8
> [2] https://github.com/KhronosGroup/glslang/commit/14a2cfbc72f2bb2e060fdfe3fbe6a4d54e3817a8
> 
> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> ---
>  .../glslang/{glslang_8.13.3743.bb => glslang_11.1.0.bb}   | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>  rename meta/recipes-graphics/glslang/{glslang_8.13.3743.bb => glslang_11.1.0.bb} (73%)

I think this may be breaking shaderc-natve:

https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/2982
and many more

(see
https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1776
)

Cheers,

Richard

