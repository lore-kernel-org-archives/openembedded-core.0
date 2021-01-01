Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.8032.1609502283808720416
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jan 2021 03:58:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=d/uMR6Ss;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id g25so4731473wmh.1
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Jan 2021 03:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=DOLK+cY0JFJbiLYZvnFwxfxsutMraOyB3SRSTdR7JE0=;
        b=d/uMR6Sspnvi3ENtcN1fvkZLYZdhmnisUwuiW9DlYiRKDrQurrfDt+rzR0HYUp+ee4
         4ol7+FvysKadw5Nzr+mV+wbXDBZZZ3a6T83pXDBCvqSGavGgE9BjJuZme2wUuWal8l5C
         N9E7iLlpwQRck9bKIugG2iqiX1enL93EQJzQU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=DOLK+cY0JFJbiLYZvnFwxfxsutMraOyB3SRSTdR7JE0=;
        b=SJHWHQpX4n008oWkfbuPAtTNy7v36k7ZK+z7du8Qzx4c1vy9oPmLaPlZrSFPnk4TG1
         74bItnPcHaD5voZamqGpj3R9Gobnml8jAAGYKmXj3g5JAacDNQr6IcqmJZLX/8UwyTY+
         EJIuhNwoMovC+JPb5B7c1efJv9LpUf43kgIl1ajAF5yTtGQYC+A0HjWlx7aRSVFxAUlq
         CsccSArlT4mypYqqe6QAZYR2hW+p3ZDGgX2CnSkvETcNFwd3kpb4LjMrBTqDpWUxnBwP
         qkEwMIHvI2WaqnnZfuFx7ZNZq/Hs/zLoKGxUbY1MyNHPVjOd3Y1dRnaP3McMaYgYYozU
         67Yg==
X-Gm-Message-State: AOAM532Gr9l6uLAkFYLzj1uXAl7+PDj6Gjv0rBQdvxU3xP2z4nGJlONl
	MF0IRVolGTpWsxi7ArXOxXlOiw==
X-Google-Smtp-Source: ABdhPJxylzyvMqpY/K5OCJG71W3oqEQyFlL8a4qurxNpuBoRN9/zwhkrGRbbN3Yhq5uBQwXh+up2WQ==
X-Received: by 2002:a7b:cd91:: with SMTP id y17mr15020196wmj.171.1609502282065;
        Fri, 01 Jan 2021 03:58:02 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 2.7.5.c.1.8.5.6.f.f.4.2.7.7.f.8.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (2.7.5.c.1.8.5.6.f.f.4.2.7.7.f.8.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:8f77:24ff:6581:c572])
        by smtp.gmail.com with ESMTPSA id h20sm79969744wrb.21.2021.01.01.03.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jan 2021 03:58:01 -0800 (PST)
Message-ID: <0d8414139b060fa0d50bbd3a609513525dc94288.camel@linuxfoundation.org>
Subject: Re: [OE-core][dunfell 00/25] Pull request (cover letter only)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 01 Jan 2021 11:57:58 +0000
In-Reply-To: <cover.1609424319.git.steve@sakoman.com>
References: <cover.1609424319.git.steve@sakoman.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2020-12-31 at 04:20 -1000, Steve Sakoman wrote:
> The following changes since commit
> 02870c7fbaaa1c3869ecb439f5c58fcf40a533be:
> 
>   binutils: fix CVE-2020-16592/16598 (2020-12-14 05:58:27 -1000)
> 
> are available in the Git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib
> stable/dunfell-next
>   
> http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

I am a bit wary that we're in a holiday period and not many people are
reviewing things. Most of this is fine but I've deferred the world
reproducibility patches for now.

Partly that is due to the holidays and review, its partly as they're
causing me a lot of pain in master. I note for example you list grub-
efi but not grub and both are likely affected if one is.

So I've merged without those bits and we can discuss further next week.

Cheers,

Richard



