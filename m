Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.5690.1620476329154519712
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 May 2021 05:18:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SykrDdv7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id t18so11860234wry.1
        for <openembedded-core@lists.openembedded.org>; Sat, 08 May 2021 05:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=Iigz6MaMu1TDmRUQFRS38WYrMcDjfWnQPAKcCJGkbMk=;
        b=SykrDdv7r1GGPEjCy7wJLoJyCggU1yTI6rACtik9n35X39xb+076VnLSrVklwU39DK
         f0gyA7aClsIYdOmOblZa8y2UOWrHMPKsxXC9/fntZzv1+AAJimUnqTEl61a8GmPlhmI/
         /V5SrX0fOxm4CtqcJT4nohhNjNDjL6JjDN6iM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Iigz6MaMu1TDmRUQFRS38WYrMcDjfWnQPAKcCJGkbMk=;
        b=mpdaIBTqcjJ0JvZ41pbMTMzMI8icVBGPxKpJ2HKXoph0CygfN4U/2m13+oyHgFFP0j
         Qr5+SkXkTIhtF13OgGxMP6thI+7zUw3EKY5K2Bk+kT8bMzcPrjEl2SKrLM51HbgPJwkW
         cwJgai1CVWeJOW3Y02xfcyi/rBRF2L2jvdJw+olg57fRmduZwAn5V3zWb4gSsAlQ1HAF
         XYR7Bg6bA5Qt5G+7/pVlbFrZjCjmBfcXUZ3nkQUjfTZlhdjQhuyKJ8GjAWqgyzxSP6q/
         QODn8tN7M+8sEX+gplPr8CEWgBjTalYpWTGqkeSNJiACxg3iSzux/ESlhBYLsKvPlhIw
         9jTw==
X-Gm-Message-State: AOAM533pT+Pj2NKQYO994xOdq0zOcdOTiYjs4qz0Xp6Q2NVgFWVj2O+X
	xCQvFAoa0lvaRzSDdhp2iZXAj831SWEMWw==
X-Google-Smtp-Source: ABdhPJxA4NtEkOoF5zHnbMUp9zEEfACPlABG0NRtDarV42nlCEZAPD10dQNB/T1nCy/tvnxN6s4/Wg==
X-Received: by 2002:a5d:5242:: with SMTP id k2mr19271372wrc.269.1620476327715;
        Sat, 08 May 2021 05:18:47 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:8b6c:ea91:f112:97a5? ([2001:8b0:aba:5f3c:8b6c:ea91:f112:97a5])
        by smtp.gmail.com with ESMTPSA id n20sm7866043wmk.12.2021.05.08.05.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 May 2021 05:18:47 -0700 (PDT)
Message-ID: <e53853537f647bff8284ead69df0cceda5f5d9d5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] gstreamer1.0-plugins-good: fix build with gcc11
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 08 May 2021 13:18:43 +0100
In-Reply-To: <20210508121437.839561-1-schnitzeltony@gmail.com>
References: <20210508121437.839561-1-schnitzeltony@gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sat, 2021-05-08 at 14:14 +0200, Andreas Müller wrote:
> Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> ---
>  ...from-static-vars-to-fix-build-with-g.patch | 100 ++++++++++++++++++
>  .../gstreamer1.0-plugins-good_1.18.4.bb       |   1 +
>  2 files changed, 101 insertions(+)
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0003-Remove-volatile-from-static-vars-to-fix-build-with-g.patch

I'm guessing this only happens when qt is enabled? I was wondering
why we hadn't seen this initially...

Cheers,

Richard

