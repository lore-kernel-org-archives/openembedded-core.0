Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web12.11067.1610836505609190158
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Jan 2021 14:35:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hNIxkwSS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id d13so12844975wrc.13
        for <openembedded-core@lists.openembedded.org>; Sat, 16 Jan 2021 14:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=qL0LWlD0+GmnntaVOE+5iLkTYHoA4OJ0FNyvqtOGDME=;
        b=hNIxkwSSemKFcxG794eOEHTkbPnhYS0HrYaD2FQr2qgRJBCwIzT/+Hh43+Hf5n8KUE
         BEqSiSYKrKG6en5w9TMFI1O2n+xLUxM+C7w7GJhCoCCRKYCz8ErcOap8sLdD/aBtOkmd
         3ssYYZcm56dHlYLEO3QW7HNsLDXcOl0qpIyHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=qL0LWlD0+GmnntaVOE+5iLkTYHoA4OJ0FNyvqtOGDME=;
        b=gelPw4OvXuUWrBWSMH/lrPsldXnasVZ05ySqhsnBpAt/0t7vKCj/F7B3SQ5WJpw3uk
         LPTEBbw4iOcRGcd1dUmy7G5iD8FtDfKErbWFpigTc2k2i2sjjQ1TK+ZfquT+UbZ7YlDt
         x5zVDtOywUbOX2+cfYgoj/P0GTz93GNfHq4F5f1SKuGPuPvrWgHiZkqHYKQ2QXePlvCU
         Y7XXhh5HX+dhQdgxraYZs1yJ2rSDtdHRsXCWZCGRJtQOqr/misVE+bgwUtYRRvwOiC4J
         ExAk3VVV9G2N2T/X2jm1QIc6XElaiefQ3V0b1Iss/LKEYkBZKmPxT7NflSnc9Wmo7oSF
         PnGw==
X-Gm-Message-State: AOAM533bjyAM/xoaxyWqsX/HACY7cWty8wjrp4nsQmnrxa4zKka2DFhq
	Ex4HhTIr6Dqr+rAMpv+VcwzXAw==
X-Google-Smtp-Source: ABdhPJwP17uRFZuzFuTwPkhrYaSYPjSodfCxc7or76Niw99rdjysOb/KN4w3YK9JsvqNzqB+7sxCWQ==
X-Received: by 2002:adf:e8c5:: with SMTP id k5mr14529259wrn.242.1610836504070;
        Sat, 16 Jan 2021 14:35:04 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:bfb4:a7c0:34bb:ed0e? ([2001:8b0:aba:5f3c:bfb4:a7c0:34bb:ed0e])
        by smtp.gmail.com with ESMTPSA id y11sm17091143wmi.0.2021.01.16.14.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jan 2021 14:35:03 -0800 (PST)
Message-ID: <859d5ae812f49d2300c805866001715329d2b851.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] libdrm: upgrade 2.4.103 -> 2.4.104
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Wang Mingyu <wangmy@cn.fujitsu.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 16 Jan 2021 22:35:02 +0000
In-Reply-To: <1610614977-24935-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1610614977-24935-1-git-send-email-wangmy@cn.fujitsu.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-01-14 at 17:02 +0800, Wang Mingyu wrote:
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  .../drm/{libdrm_2.4.103.bb => libdrm_2.4.104.bb}                | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-graphics/drm/{libdrm_2.4.103.bb => libdrm_2.4.104.bb} (97%)
> 

https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/1266/steps/12/logs/stdio

Fails when docs are enabled.

Cheers,

Richard



