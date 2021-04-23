Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web08.7322.1619170485014812655
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Apr 2021 02:34:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HhK7A82c;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id a4so47694295wrr.2
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Apr 2021 02:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=kJIvgV3uwI3XWmYEsA+gAGeplvgR84xPi51Lt6y83og=;
        b=HhK7A82cb9tX3bX6+t4taVOEyNoBWUYpXf6Vv9AzB5gvIAqphlaTNxqcYAe3ME8BYL
         Rd7ZDj+0LKdediVdHiXaEXqNAyA5ld4q3k3hG6+e1tuhKG97XBkTmNKPDEt/oNHLCtdq
         CArECgAo7B/k6hi9oNtpa4mLgnrCY+lk2Oj+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=kJIvgV3uwI3XWmYEsA+gAGeplvgR84xPi51Lt6y83og=;
        b=szRoiFzpTOS66KbmyRUcpTeaQiM03Zzs4dOQrRKf5s0E6y7zN7mfubrjUovX7hSt1w
         Yw6SY0uhtpOE3cOeoTMWJaM1NLH6GpYC9o/XsTKl/eLoiuEcu7vLTO6noBXxU0ijtcho
         /jscxGFBjoudRIaZOs5wcFn9rr8MDb8zS152Wr0WQOgUgrB+72X4Ne1kexWtZ6PO7u21
         c6I2qGNCvqqc7mqMyp0QIvjeA9IQ0NS6qBM1UgtGWyiAn/zE2lqOYWZbpBlLU+lwDZlT
         ggfhu748RvqyDTBtA7jMx2nwEqX1Q15n5HcWAmTnnGdoMgGZ5RDV2uxfK+TnrVABZNfi
         P7tg==
X-Gm-Message-State: AOAM530RPNPrb4sTlM9sTgI5/ztPH3c6E5GKnHk9GSZvJxc1rAjpdSTx
	LwVMQdOGEWsA+P3SR2q3xQgogQ==
X-Google-Smtp-Source: ABdhPJwExWsSecRHsj0higF3bL8BD4deK/RllbKO7PaX/TdhJgnFa3W6DWiNBKDHBcNGtOw75mBc7g==
X-Received: by 2002:adf:dcd0:: with SMTP id x16mr3422208wrm.127.1619170483416;
        Fri, 23 Apr 2021 02:34:43 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:9e5d:1acf:2dd2:29e6? ([2001:8b0:aba:5f3c:9e5d:1acf:2dd2:29e6])
        by smtp.gmail.com with ESMTPSA id n3sm7270844wmi.7.2021.04.23.02.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 02:34:43 -0700 (PDT)
Message-ID: <3ea2c73330a6a7383913c283eaf888b0bb255477.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] python3-docutils: Upgrade to 0.17.1
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Fri, 23 Apr 2021 10:34:42 +0100
In-Reply-To: <20210423021123.3732767-1-raj.khem@gmail.com>
References: <20210423021123.3732767-1-raj.khem@gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-04-22 at 19:11 -0700, Khem Raj wrote:
> This was in meta-python for a while so merge the changes here
> and  upgrade, once applied, delete from meta-python
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Detect file rename
> 
>  ...docutils_0.16.bb => python3-docutils_0.17.1.bb} | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)
>  rename meta/recipes-devtools/python/{python3-docutils_0.16.bb => python3-docutils_0.17.1.bb} (25%)
> 
> diff --git a/meta/recipes-devtools/python/python3-docutils_0.16.bb b/meta/recipes-devtools/python/python3-docutils_0.17.1.bb
> similarity index 25%
> rename from meta/recipes-devtools/python/python3-docutils_0.16.bb
> rename to meta/recipes-devtools/python/python3-docutils_0.17.1.bb
> index 50547a1b0c..54a809847f 100644
> --- a/meta/recipes-devtools/python/python3-docutils_0.16.bb
> +++ b/meta/recipes-devtools/python/python3-docutils_0.17.1.bb
> @@ -1,17 +1,11 @@
> -SUMMARY = "Text processing system for documentation"
> +SUMMARY = "Docutils is a modular system for processing documentation into useful formats"
>  HOMEPAGE = "http://docutils.sourceforge.net"
>  SECTION = "devel/python"
>  LICENSE = "PSF & BSD-2-Clause & GPLv3"
> -LIC_FILES_CHKSUM = "file://COPYING.txt;md5=7a4646907ab9083c826280b19e103106"
> +LIC_FILES_CHKSUM = "file://COPYING.txt;md5=836a1950177996968a49ff477a4a61c4"
>  
> 
> 
> 

Did the license change? Needs a comment in the commit message.

Cheers,

Richard


