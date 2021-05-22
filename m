Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web08.5592.1621682421661324926
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 May 2021 04:20:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TLbyDnUf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id l18-20020a1c79120000b0290181c444b2d0so1918669wme.5
        for <openembedded-core@lists.openembedded.org>; Sat, 22 May 2021 04:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=QgswSyMd2bxo4zZCFnr1LCfTSwiaDRBBUlDbS5iKrAI=;
        b=TLbyDnUf0tEr150SfHl70ch2D7BvEj/z1H9P+mfXp+p7+ROGuSV3J6smEBZ0xBW3yw
         d3ag/Wd6P5zLBSZ9ppOfd0vaz6AF/Ljb0mon9dxV0RZ+EnLCJOqFQvsVw3luatSR5TnA
         EpFcXReT+xJwXAJQFDYsmn/DSai2KsJulEIoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=QgswSyMd2bxo4zZCFnr1LCfTSwiaDRBBUlDbS5iKrAI=;
        b=Rv3fqep20IgFMYOYpovB3k2ffn7H6vvdJ804iZQOYpt83wyIEyf4bQPhb2mp2G/DWX
         E4EciZx2FFkgBf/IRhLj04dFFoE/2dDYAfCJq01ZX1A/ijqvq9AMfiHrpm1n6dHCa/JN
         hgs1yprLqBuEBJYALhsSLnu+7Jl62OjeMdIVGPE3fCUMrM3kUT8wNmr3gUnarlQOeXbq
         8iBarliYAQwm0RflwN4lpMOHunl9kPobddTVFRBSzYmsE3JanCMiTVyfXTxLfZkPsXrB
         gPkM2Qq8MwG4JQv69KeyTipp2aMguvsvkhkJCTyhiQGBhiasdNByYiOqR8oQBM9fHOYT
         i8Tw==
X-Gm-Message-State: AOAM530h+SgW0zgAQfIIm5Vdy8+mKcItsk0xbxcOAEr99tt4LM/rEmQT
	ojfK6ggq/isKzj2fKvyetcCPUg==
X-Google-Smtp-Source: ABdhPJxgSd97K89liuPzFy4U8griBhNtDc7mXNxwnD0OgnY7C4pN+2nxwFOjQ/PgX7YAw3okg89hGg==
X-Received: by 2002:a1c:e90d:: with SMTP id q13mr12522510wmc.163.1621682419827;
        Sat, 22 May 2021 04:20:19 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:39e6:11a6:599d:95f2? ([2001:8b0:aba:5f3c:39e6:11a6:599d:95f2])
        by smtp.gmail.com with ESMTPSA id y3sm5041201wrh.28.2021.05.22.04.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 May 2021 04:20:19 -0700 (PDT)
Message-ID: <81a17639bf8248ff9f4fd03e34f171a98fdd8184.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] libxml2: upgrade 2.9.10 -> 2.9.12
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Randy MacLeod <randy.macleod@windriver.com>, wangmy
 <wangmy@fujitsu.com>,  openembedded-core@lists.openembedded.org,
 "Tascioglu, Tony" <Tony.Tascioglu@windriver.com>
Cc: Jon Mason <Jon.Mason@arm.com>
Date: Sat, 22 May 2021 12:20:17 +0100
In-Reply-To: <e856de39-d194-7926-8963-b316a45c90e3@windriver.com>
References: <1621468435-21509-1-git-send-email-wangmy@fujitsu.com>
	 <1621468435-21509-5-git-send-email-wangmy@fujitsu.com>
	 <8a5d37690356e7c9e063ca098e2ed532d9702da2.camel@linuxfoundation.org>
	 <e856de39-d194-7926-8963-b316a45c90e3@windriver.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-05-20 at 18:31 -0400, Randy MacLeod wrote:
> On 2021-05-20 2:09 p.m., Richard Purdie wrote:
> > 
> > 
> > Richard
> 
> Tony has an update posted to the list:
>    [PATCH] libxml2: Update to 2.9.12
> that passes ptests at least locally
> and I know that we fixed the 'fuzz' problem
> and even explained in the commit log! ;-)

That was much appreciated, particularly as we're close to driving the open
list of CVEs down for master. I merged this patch and hope it will help
for this week's CVE report, thanks!

btw, for some reason, git am wouldn't apply it, I had to do that manually.
The other patches have been ok so I didn't dig too much into this one. It
was the deletion of the merged CVE patches that somehow didn't work so
I just did that manually.

Cheers,

Richard

