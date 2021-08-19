Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.66531.1629364496502550670
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Aug 2021 02:14:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=P4EEGll6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id f5so7907410wrm.13
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Aug 2021 02:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=gRsdefPi9lAg4tUkwlrqaUtpLCxRem/w/AkICH1ziP8=;
        b=P4EEGll6ME2adJYQ3dIwD1CbQ2VEQq+eSYNimKDWRe/eSyw8kjl7Y4Vk9YpBXU+0Wo
         ChwORGA7R9DJ00mIQYNScC5IetnkFLsvQZjA9BCsI42jP92t9VVasXnbED/mqG3ucLjc
         k3Ko3p95xnA2eRSI9HcepZstjg5Aj7ymKfuVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=gRsdefPi9lAg4tUkwlrqaUtpLCxRem/w/AkICH1ziP8=;
        b=e+9RvbkZ+1eMBTlSWHDyk2xEi/XhYKC32kGXXVpZoAIyZJhBIj5r4VURyXDTdD7ran
         cgksjlaxzYWyCa6HJHCPwn6iixefdvXsc1d/rPHnlQBfq+ooarcm96hMbjCjROJneXtT
         z4p6Rqs6fElakLgNwIqCVWI5JlFp36h8RZLDo+zE4aKmCUZXMV9YDJSu0krhiUd2CfKg
         ZR3zlCsKlaw1wUZVNafTT5H5V84RIW0u+RMu/iGGg1tC3FHV7QE7s2I/DQK9GO5rDtbl
         Nrc7/jq9cEk1v3GwhEEU6bH16EBmOFDARGvpcC2ahI6ELMtd8ZBl30Jw7Uz8XQIO8cFE
         +neg==
X-Gm-Message-State: AOAM533/qR1E9rYUdpU8Z+RH5lJaqyW8qXYBVNL6dLqxGW1VXXvQ8m9p
	sdx6nyiqJFAreDLuR3tC70Sqrw==
X-Google-Smtp-Source: ABdhPJz642G5pEmCmqa+I7WVfMZf9irFeWZYr21nBBU60TeUyam7xBdtM+dZpfOD37coslGq/s36kw==
X-Received: by 2002:a5d:688c:: with SMTP id h12mr2522109wru.313.1629364494683;
        Thu, 19 Aug 2021 02:14:54 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:893b:b0d7:8112:9a58? ([2001:8b0:aba:5f3c:893b:b0d7:8112:9a58])
        by smtp.gmail.com with ESMTPSA id b20sm2075604wmj.48.2021.08.19.02.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 02:14:54 -0700 (PDT)
Message-ID: <4f17fad6060570b1ff87c54973ae46d3242565c6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v4 1/4] sstate.bbclass: track found files on mirrors with a counter
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 19 Aug 2021 10:14:52 +0100
In-Reply-To: <20210818202954.143099-1-quaresma.jose@gmail.com>
References: <20210818202954.143099-1-quaresma.jose@gmail.com>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2021-08-18 at 21:29 +0100, Jose Quaresma wrote:
> We don't need extra python collections to count the found files
> on the sstate cache and sstate mirrors.
> The main found collections provides all the files that were found,
> then we only need to count the files on sstate mirror
> 
> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> ---
>  meta/classes/sstate.bbclass | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)

I'm afraid there is still some change in this series causing problems.

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2464

Many of the failures in that build seem to be triggered only when this
patch series is applied. I thought it was the locking issue but there
appears to be something else.

Cheers,

Richard

