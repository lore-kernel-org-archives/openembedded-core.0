Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web09.3585.1616621724527196601
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Mar 2021 14:35:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Kzw53jqj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id y124-20020a1c32820000b029010c93864955so1993057wmy.5
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Mar 2021 14:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=6jL3NtZUjdN+pNiPAGI4diEES99S0v787DtdgBcLgNw=;
        b=Kzw53jqjTWIwaQj5XVPrm9FdePxeGlxiufTKSygdKZG8wxVO/s/LLZ1CEifeij3OSM
         1Q2u/AE/oi1TSk8bUr65OrsgDY+Kn1Fp1Ql60YLkwRmKWwwZ/5mxa8r3xtKKCqXs00w9
         oxmY54TdgJElriOZ51VFf+NVpOA4938lOrGC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=6jL3NtZUjdN+pNiPAGI4diEES99S0v787DtdgBcLgNw=;
        b=MTAskzfi0y26mHjVRVf++CcJNyW/dpGk9H3iYz6Ee3QkmAoo+E15SuhUElFfCrMBel
         /A3W7xuf5sSBxZaS8gsKPE/WXnEcTddqx6w5b+i/WMBJRXUz2s2c90TQ9+4QM1n/0UoZ
         l1noHyz3Iw8yw280B8BZJkvsUcGuLQc++reRDuyWM40pk43nK6xSbuCbVoZdpRvqmOXn
         m8k6dF5Sznj1nFD3WYP3+v7i6F+Hj7VjOu+Uqw2oyfW9FwUSxTxLs8vz+t3cIbX37BrP
         8VjY+9FApKT59IrdPuO2vm6iOW7f6oA3slOCVFtPFuYEJ+uGfh5/y7kM6Q0AxoaLP7bf
         gBEA==
X-Gm-Message-State: AOAM530+k+541x3gJ/V8fWrlAIPelSh+bNFGlxLa6+83hl+ace121qET
	0lviqCCPieOBuOu0r7XwxRZ/X0MKibG+ng==
X-Google-Smtp-Source: ABdhPJwSXu7sNliTdkxQGOKGLqugv5W3c1mDNlJXX3jsEb4WPi3Vdx9nsxE73/cpLKgzfXNxnqJ1tA==
X-Received: by 2002:a05:600c:35c8:: with SMTP id r8mr4565307wmq.130.1616621723056;
        Wed, 24 Mar 2021 14:35:23 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:6a6e:24cd:b165:9075? ([2001:8b0:aba:5f3c:6a6e:24cd:b165:9075])
        by smtp.gmail.com with ESMTPSA id m10sm3830817wmh.13.2021.03.24.14.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 14:35:22 -0700 (PDT)
Message-ID: <daec4eaf8dce63a70617a4a70b87e33b230f9462.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] util-linux.inc: Set the correct license for util-linux-libuuid again
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 24 Mar 2021 21:35:22 +0000
In-Reply-To: <20210324191508.8400-1-pkj@axis.com>
References: <20210324191508.8400-1-pkj@axis.com>
User-Agent: Evolution 3.39.2-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-03-24 at 20:15 +0100, Peter Kjellerstedt wrote:
> LICENSE_${PN}-libuuid was not updated when libuuid was moved to the
> util-linux-uuid recipe. Use LICENSE_${BPN}-libuuid instead as BPN is
> set to "util-linux" for both util-linux and util-linux-uuid.
> 
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta/recipes-core/util-linux/util-linux.inc | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
> index 4031c586c9..bb93eb67d6 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -7,11 +7,11 @@ disk partitioning, kernel message management, filesystem creation, and system lo
>  SECTION = "base"
>   LICENSE = "GPLv2+ & LGPLv2.1+ & BSD-3-Clause & BSD-4-Clause"
> -LICENSE_${PN}-libblkid = "LGPLv2.1+"
> -LICENSE_${PN}-libfdisk = "LGPLv2.1+"
> -LICENSE_${PN}-libmount = "LGPLv2.1+"
> -LICENSE_${PN}-libsmartcols = "LGPLv2.1+"
> -LICENSE_${PN}-libuuid = "BSD-3-Clause"
> +LICENSE_${BPN}-libblkid = "LGPLv2.1+"
> +LICENSE_${BPN}-libfdisk = "LGPLv2.1+"
> +LICENSE_${BPN}-libmount = "LGPLv2.1+"
> +LICENSE_${BPN}-libsmartcols = "LGPLv2.1+"
> +LICENSE_${BPN}-libuuid = "BSD-3-Clause"

How was this tested? This will not work for multilibs or nativesdk.

Cheers,

Richard


