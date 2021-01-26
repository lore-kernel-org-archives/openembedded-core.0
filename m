Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web12.9422.1611649240846118440
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 00:20:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NddZmUMa;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id m187so1688195wme.2
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Jan 2021 00:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=12+Kk+O34SYBnLXxMVIQU64oHY35gUoE4kjJz7oWUoU=;
        b=NddZmUMa2yADeffNb4Vs4EMaXHYHjGcQsAvHYoZLmLAVwAQy3Y2xqYfk3DKOXU7DVh
         M2Oi/ydw9ZkYioJF2TxacxKg7CuFduEvr1K0WkIAxYxMLYl8muV/jm4J40bLNtKw3azU
         jfS2WlRXFJ0lFeZyUd5/2y3kvYDyjXGUUxoV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=12+Kk+O34SYBnLXxMVIQU64oHY35gUoE4kjJz7oWUoU=;
        b=FqS8mZwbv+N7HHOEp7mlDtmg1JoN8kIL+99rdsjhuiFr+MKxhfTbq/k37oFr/77svV
         pl4EeOURWV9CMvYsp//xaQKZDatQ55the4UAPMBqJIP5qh1pWwl498GrNlQrH4C7ZSeq
         hEmgGDYvA/gMK9AWEUJHxJ8QmC3LFLBkKYd8Ji4Dmcb8+Wi42zfGPLzQXOUPpcMhAgDc
         V4pSQI3ig+lv1ZcuthNWzmb5XK9qeSafJu+zQgE1Lyq2orxcsWGxRuXQFPQSzH6ZS/kT
         /GE74oup5HR4fJIuEkZulqZEybM/cTyGjRymPN8m2gffqfDdcNrH4e97AU0y22/X78ux
         0J+w==
X-Gm-Message-State: AOAM531UR9AQAClAAkZgUtR8v7S28+Q6Y4kEx4bycfgMI6xX83XojouZ
	N+kSq7Yho2s/ra705qvNbjKmAw==
X-Google-Smtp-Source: ABdhPJxV6y80jDVi6CzOUg9M6wX2L7NEBWMNggM3jImuVG70sWJ7AMN/7Wkgz1SlG1V77XvCUKFhnQ==
X-Received: by 2002:a1c:2b05:: with SMTP id r5mr3468722wmr.179.1611649239364;
        Tue, 26 Jan 2021 00:20:39 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:b393:1589:56b4:ccf1? ([2001:8b0:aba:5f3c:b393:1589:56b4:ccf1])
        by smtp.gmail.com with ESMTPSA id u7sm13398537wrr.80.2021.01.26.00.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 00:20:38 -0800 (PST)
Message-ID: <5e3acf487208372321ba28aec286fdb7fef7e6bf.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] core-image-sato-sdk-ptest: use 3G of RAM
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Changqing Li <changqing.li@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 26 Jan 2021 08:20:34 +0000
In-Reply-To: <20210126053605.2003-1-changqing.li@windriver.com>
References: <20210126053605.2003-1-changqing.li@windriver.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-01-26 at 13:36 +0800, Changqing Li wrote:
> [YOCTO #14164]
> 
> Some ptest cases, for example, libinput ptest intermittent failure on
> arm64, this should caused by OOM Killer.
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/recipes-sato/images/core-image-sato-sdk-ptest.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
> index bf749acd79..b3ce859d76 100644
> --- a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
> +++ b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
> @@ -17,7 +17,7 @@ IMAGE_ROOTFS_EXTRA_SPACE = "1124288"
>  
> 
> 
> 
>  # ptests need more memory than standard to avoid the OOM killer
>  # also lttng-tools needs /tmp that has at least 1G
> -QB_MEM = "-m 2048"
> +QB_MEM = "-m 3072"
> 

What is libinput doing that needs 3GB of memory? Is this because its
loading a whole graphics stack for testing or something? It seems odd
that we need that much memory for input drivers!

Cheers,

Richard


