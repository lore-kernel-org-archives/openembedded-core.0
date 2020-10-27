Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
 by mx.groups.io with SMTP id smtpd.web11.3104.1603830362143318339
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2020 13:26:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mV9OE6ON;
 spf=pass (domain: gmail.com, ip: 209.85.216.66, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f66.google.com with SMTP id gi3so1330428pjb.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2020 13:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RuwOUnHBbt1alDrRVMzHGl0mGpK//MbvHTCpuTjLlhI=;
        b=mV9OE6ONSEUaQfubMZ46+3XybqLeicmme/E6w2lHcZgph1iUDCqewr/UUKJDKwN7EX
         Z7Q3fs6ikRwpTNapmol478I+ghTTci/9Qgocz2Jv3s4odFOjN6QNXN1qMcAFGxSVLZes
         hMBiDOmuzcRfuFmzelf7NaIeIkHxhXlssXlhyCVa7cm//9t3KA7viBSEBcMNCB+zcgZ7
         sA1MwXwa854NcIWYS9YCZJR9wBFX0zfB1epQFN34xSpy5hvymO8asmCJgXEoWm4Wxvut
         0G9yB7S9RVbz2+JRnJAxM/MyWbwS5sMzlcmOrqpJXLcO3kJGE7JcysnPB20VywWQfz/W
         Lkmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=RuwOUnHBbt1alDrRVMzHGl0mGpK//MbvHTCpuTjLlhI=;
        b=J2fkTcnKtCkKlIE8AFn3jl6JyNWYW1X5FW8/zkDmpQA10Macxv/wVN5TsAa2v5g/uj
         iaTcP9EiVoWvoAcZEA6DhTvIa0UZ8+kKXyzFBQJCjZm83bcW0t9Q72UI37z7/D31/W3v
         AySegwmNOJxgc6t9iPQSlDgJwRkYREQBTZVKh9R+Eh55+BT3jng/F96GP4gCfqVQ/uan
         h4E7XQugjuog97RYoQ8qPCJe33YDrm4E3DqWogoocKyLKbYA0YdGCtPGqfYPTmRJLMxm
         3X8Lht9ImHHf6qIXpYNz7+0P7V6eTiAyutrGcna9UIYcPDFcmJbr6Y+20K9aL6Yz3bDO
         t9ZA==
X-Gm-Message-State: AOAM533OcFSwfqE4/Fckm0lEvZlchr1jNYMcd39Gvh5xkAfJwV05iC2+
	9T4BDt6NG57/Vk8Qx8e31zo=
X-Google-Smtp-Source: ABdhPJw4wWTdiS8DhaSutUAae7ubq7swWuJEg49/f+HQR4A3hoMTB9Ba1R1v61epjV4nKb0LWGypwg==
X-Received: by 2002:a17:90a:4b87:: with SMTP id i7mr3646269pjh.68.1603830361499;
        Tue, 27 Oct 2020 13:26:01 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:34ed:fa30:8661:dbd2? ([2601:646:9200:4e0:34ed:fa30:8661:dbd2])
        by smtp.gmail.com with ESMTPSA id ch21sm2777806pjb.24.2020.10.27.13.26.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2020 13:26:00 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] recipes-core/busybox: fixup licensing information
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 openembedded-core@lists.openembedded.org
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Alexandre BELLONI <alexandre.belloni@bootlin.com>
References: <20201027164831.3297010-1-yann.morin.1998@free.fr>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <ee39bffd-e43b-69a6-98e2-b3f4963e346f@gmail.com>
Date: Tue, 27 Oct 2020 13:25:59 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201027164831.3297010-1-yann.morin.1998@free.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 10/27/20 9:48 AM, Yann E. MORIN wrote:
> Commit 7d32417b4d (busybox: Correct the name of the bzip2 license)
> changes the licesne from 'bzip2' to 'bzip2-1.0.6' on the rationale
> that the 'bzip2 license was renamed from "bzip2" to "bzip2-1.0.6"
> [...] to match the official SPDX identifier.'
> 
> Though the above is true for the bzip2 and pbzip2 packages, the bzip2
> code bundled in busybox is a copy from the bzip2 1.0.4 version, not the
> 1.0.6 version.
> 
> As such, using bzip2-1.0.6 is wrong.
> 
> Unfortunately, there is no official SPDX license identifier for this
> bzip2 1.0.4 version, so we just mimick the existing ones (bzip2-1.0.5
> and bzip2-1.0.6) by using bzip2-1.0.4.
> 
> Also, there is a license file attached to that, so we add it to the
> list.
> 

we also need a text file for this license in meta/files/common-licenses 
perhaps a symlink to bzip2-1.0.6 might be ok.

> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Cc: Alexandre BELLONI <alexandre.belloni@bootlin.com>
> 
> ---
> Respin, as I was not yet subscribed to the list...
> Sorry for any duplicates...
> ---
>   meta/recipes-core/busybox/busybox.inc | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
> index 45aaa2b41c..e0522be729 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -5,10 +5,11 @@ BUGTRACKER = "https://bugs.busybox.net/"
>   
>   DEPENDS += "kern-tools-native virtual/crypt"
>   
> -# bzip2 applet in busybox is based on lightly-modified bzip2 source
> +# bzip2 applet in busybox is based on lightly-modified bzip2-1.0.4 source
>   # the GPL is version 2 only
> -LICENSE = "GPLv2 & bzip2-1.0.6"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=de10de48642ab74318e893a61105afbb"
> +LICENSE = "GPLv2 & bzip2-1.0.4"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=de10de48642ab74318e893a61105afbb \
> +                    file://archival/libarchive/bz/LICENSE;md5=28e3301eae987e8cfe19988e98383dae"
>   
>   SECTION = "base"
>   
> 
> 
> 
> 
> 
