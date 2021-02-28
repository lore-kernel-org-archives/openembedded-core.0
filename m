Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web09.1566.1614537628415085359
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Feb 2021 10:40:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XWEY5qMg;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id l18so10156065pji.3
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Feb 2021 10:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1CcEJrohlOIYztDsc1W6Ff1rKwRl9j/FRbYNAXxXYrc=;
        b=XWEY5qMge0fvgYrqApy9IQ5OPmLNybtejOzzZ9FTsHwx5pvCJQHBBKEVcvPLX4N4rq
         BcOXl/SwdtSi39bcxitC250j0NHLxFuSGu89Dqpeh1046lSj9nNI8ziqfsS65HsYpDQU
         i2cyYDcG8QqUtj2n7DCVaAQaMQk/8Jd1Jl8hrPJL5HexUG5KnqTBgGvfIo3ztXK9chvh
         K770Ep9efsYwz5F2nH3k8F64+R9e/eXyfm8Ty/swIQ5kRTa47Bxq/rV+16p0m36MfKTg
         qXOvN71ZOe6vkMmwTr76n2p+DNyF9zPriBCVIII/TAkunxpsbkhKYPXU6BVuvaJYq7FY
         V8WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=1CcEJrohlOIYztDsc1W6Ff1rKwRl9j/FRbYNAXxXYrc=;
        b=hcsFwPpyTroHqS4hhW/RIPo4a9iaozWUCHWtg+LBBnWnu6ZY1C4O+MY5gsVRS2kQlA
         1souyTUybkKTCynK5S4PdNmCuYFhId9OOZSgCywwpkJXejoTDNFsljvusAJPk95fIOZ/
         RHtMycLzYx0Xc2e02H79tXMEp63AFd2I5d8jYcD6OqUiESLbfD4T4visGO6/uVES8/L9
         U0YFACwaMft9aVcfA+DHZjjI8tcvGSm5hIvV+XaYeGwKSGDvCPfdyG1KSeH9J/sG7zF2
         BNRw0IpxHHEd6Nu5aoWt8m7XuZ/HcOQbS4wVpfIAaAHTkqgyLU/KdooCaDyID3J+s9uF
         R2RA==
X-Gm-Message-State: AOAM531N1wfK2c1BP8UmQyZU/eQ8jH7qRxPXsrf1XhyZhBA+mPKwrOp4
	kYXdQRRzUmOdlRNE4JG37a8BwcR+gg64Fg==
X-Google-Smtp-Source: ABdhPJy89fbOALOs/1JtCLkFL+T4C0CAULWEV0Db6enDAneSyqNLUXF3fXtrFo2DhittJfB3HuHcgA==
X-Received: by 2002:a17:902:7887:b029:e3:8ef0:9a9d with SMTP id q7-20020a1709027887b02900e38ef09a9dmr12278596pll.2.1614537627489;
        Sun, 28 Feb 2021 10:40:27 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::5d43? ([2601:646:9200:a0f0::5d43])
        by smtp.gmail.com with ESMTPSA id m14sm15126138pfo.16.2021.02.28.10.40.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Feb 2021 10:40:27 -0800 (PST)
Subject: Re: [OE-core] [PATCH 05/24] dosfstools: update 4.1 -> 4.2
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20210228153702.498275-1-alex.kanavin@gmail.com>
 <20210228153702.498275-5-alex.kanavin@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <c2f9b05f-15e7-42d6-a63b-fa51a876e98f@gmail.com>
Date: Sun, 28 Feb 2021 10:40:26 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210228153702.498275-5-alex.kanavin@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 2/28/21 7:36 AM, Alexander Kanavin wrote:
> udev support had been dropped upstream.
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>   .../{dosfstools_4.1.bb => dosfstools_4.2.bb}         | 12 ++++--------
>   1 file changed, 4 insertions(+), 8 deletions(-)
>   rename meta/recipes-devtools/dosfstools/{dosfstools_4.1.bb => dosfstools_4.2.bb} (68%)
> 
> diff --git a/meta/recipes-devtools/dosfstools/dosfstools_4.1.bb b/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb
> similarity index 68%
> rename from meta/recipes-devtools/dosfstools/dosfstools_4.1.bb
> rename to meta/recipes-devtools/dosfstools/dosfstools_4.2.bb
> index 4bd4aef099..e1d1734b99 100644
> --- a/meta/recipes-devtools/dosfstools/dosfstools_4.1.bb
> +++ b/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb
> @@ -9,24 +9,20 @@ SECTION = "base"
>   LICENSE = "GPLv3"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>   
> -SRC_URI = "https://github.com/dosfstools/dosfstools/releases/download/v${PV}/${BP}.tar.xz \
> +SRC_URI = "https://github.com/dosfstools/dosfstools/releases/download/v${PV}/${BP}.tar.gz \
>             "
> -SRC_URI[md5sum] = "07a1050db1a898e9a2e03b0c4569c4bd"
> -SRC_URI[sha256sum] = "e6b2aca70ccc3fe3687365009dd94a2e18e82b688ed4e260e04b7412471cc173"
> +SRC_URI[sha256sum] = "64926eebf90092dca21b14259a5301b7b98e7b1943e8a201c7d726084809b527"
>   
>   UPSTREAM_CHECK_URI = "https://github.com/dosfstools/dosfstools/releases"
>   
> -inherit autotools pkgconfig update-alternatives
> +inherit autotools gettext pkgconfig update-alternatives

is gettext new dependency ? or is it enabling something we did not do 
before

>   
> -EXTRA_OECONF = "--without-udev --enable-compat-symlinks"
> +EXTRA_OECONF = "--enable-compat-symlinks"
>   
>   CFLAGS += "-D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"
>   
>   BBCLASSEXTEND = "native nativesdk"
>   
> -# Add codepage437 to avoid error from `dosfsck -l`
> -RRECOMMENDS_${PN}_append_libc-glibc = " glibc-gconv-ibm437"
> -
>   ALTERNATIVE_PRIORITY = "100"
>   ALTERNATIVE_${PN} = "mkfs.vfat"
>   ALTERNATIVE_LINK_NAME[mkfs.vfat] = "${sbindir}/mkfs.vfat"
> 
> 
> 
> 
> 
