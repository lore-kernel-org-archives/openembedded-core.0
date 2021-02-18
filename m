Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web09.4703.1613642106452543086
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Feb 2021 01:55:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=F6yFuhhJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id a132so2346345wmc.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Feb 2021 01:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=txKXoizdul9+6jok2ytNdnE4Ro9SesxHm5jHgO0OLT4=;
        b=F6yFuhhJsonRMwKLFv3Mo5u8hSxnXxsmofZ/yp+fGccYZDWypqX74WcgUEie/i3U7S
         3hSBmMJEA0KUzMEmZywWsWqTPveX+ca5BKadP7mEHm61IRplOXx8ncLpCgFCIGuK8wZI
         vER/qR5/pY5zJuFNEXZ7Naai46gXKfLlpK1+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=txKXoizdul9+6jok2ytNdnE4Ro9SesxHm5jHgO0OLT4=;
        b=Qg9BjtZVp4uusTsdeIXoHeIa4VdfVq8GZNaQKgtzf6r/Go3qbXsB178bdRvZBh/Xgg
         ZXhetdLfy3uucJDWfeN7HKLM5YSS+32N5jV3STViD9dVJiBWVSHMDBD5LHMggSCgSLZY
         S0uk94hnmRFB5RODe0Ryo0qTIbHj3nAv4MMuiBxh6kXr3tCBtGjK9LzpclYIIISYOGun
         ITxDtmntdNj1dNceBsCVzPGCPy5C/me3M0JDBSnEfCwHk0IMq+gJrA8heU6L/2nC7NDp
         2ChwIyTADLVKweIdTvCscNMYwTQrklfm4D5TBDTtz9Dr7UrqDwYYYRe5WeLOKIMuVekL
         YqZQ==
X-Gm-Message-State: AOAM5300QxCV9DLDJUZBYGKyPQkdHrMwOUoyI6OVwpok7MyiktOjRulN
	0qyqQwmEaMNN2JdXPMyuT2OZig==
X-Google-Smtp-Source: ABdhPJzvn73i0SVwKQSf3SnpbHMIJhuzx9rrtYtwNio9j5S8YpPCm503tgMW8dJ2dzcey9vNgCWHUg==
X-Received: by 2002:a1c:20cf:: with SMTP id g198mr2655347wmg.173.1613642104825;
        Thu, 18 Feb 2021 01:55:04 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:7504:d16b:192:2652? ([2001:8b0:aba:5f3c:7504:d16b:192:2652])
        by smtp.gmail.com with ESMTPSA id d5sm8175905wrp.39.2021.02.18.01.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Feb 2021 01:55:04 -0800 (PST)
Message-ID: <075c7fbe4df698d6919b3c6bebbb43d83fa1c861.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] bitbake.conf: Add sstate-build-populate_sdk and intercept_scripts- to PSEUDO_IGNORE_PATHS
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 18 Feb 2021 09:55:01 +0000
In-Reply-To: <20210217224915.23546-1-tomasz.dziendzielski@gmail.com>
References: <20210217224915.23546-1-tomasz.dziendzielski@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-02-17 at 23:49 +0100, Tomasz Dziendzielski wrote:
> Recipes using populate_sdk.bbclass are failing with pseudo abort due to
> path mismatch on these paths.
> 
> Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

We build SDKs on the autobuilder and don't see this. Any idea what you 
need to do to trigger it?

Cheers,

Richard



