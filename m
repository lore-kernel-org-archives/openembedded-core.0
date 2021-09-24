Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4FADC433EF
	for <webhook@archiver.kernel.org>; Fri, 24 Sep 2021 16:15:11 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web09.1224.1632500111168121902
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Sep 2021 09:15:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=K39iUiSy;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id
 nn5-20020a17090b38c500b0019af1c4b31fso7887062pjb.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Sep 2021 09:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=cL9W5WcVEkpNJlIOIF/hVoeAyq96sYv/qL8uLOUd8Kg=;
        b=K39iUiSyXQUfSAxDJ4u45z3xOZMKzj1RGjDrUrH2b9K7+fIArfv3ItxKe3tK7I9W56
         T3tY0TJBBDu24AbNwNFkr4dNinhGhx042VobPtxkLNVV5uk+r+B6782qoiEbvGTfIP8j
         iyYNQRZjuI0W5RnaFGI0UrXAGvDc7/C5z57m3XJP95Sfi0NkVM/1gkViXNKRmVrewC7V
         npGRjqxrO98MeBgt1SMln/PNXr2Jnmfk6S2UrY1L2c0ZvfKsZpMxzZVnVUXgZBu7+GVc
         vsLryMVqe//kJgbQtYO3MkXXl3PsiScJkuY5gzvrKc9QamdPf612PV6Idh0/KjdHkn0P
         4rLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=cL9W5WcVEkpNJlIOIF/hVoeAyq96sYv/qL8uLOUd8Kg=;
        b=vWkhRtHr8Q3/UKIeFMZYssyGDzYJGCOoZQP9GaIAYrYumlI7Mx4nvq2c6QEoH2B+rk
         qjtSlGiHxvxuopgNl2qUo9H5tFQmJJsUWkehZzOZMITvebWD+70fbjcC9byDAvnmvO8x
         HIeAIlfbXmsjlq1k10xV2agYrd5n1uvuic1kerktDy9qa64SXTalCMerVkZc3HzrYScq
         Ifqg6uQle1llHM/RiAetCPTW625tAc6nHlfp8S+WaTIege1mmtE6yrpuTfjtNzhyjT/L
         ok/Zng3tLC80AX8TbFMGkKYgaWOchi6m34+JRV6kanmKvdhbVIvbd+e2GnWnf3u+X8VZ
         i65g==
X-Gm-Message-State: AOAM532Nz4tnPrU1R/IfQ8iNIsN+pv3hSVGt10arUhWb1Lm6sLIWi/8s
	8aCSGwopTEq0+YbhaNpPDis=
X-Google-Smtp-Source: 
 ABdhPJwLGWWcFKA9SOolgGhrpRasKY25GSbecp1C7Db9RqkB68t50RSFGY3QIAMk0QdFbrD1ZHLCrA==
X-Received: by 2002:a17:903:4049:b0:13b:99ea:8899 with SMTP id
 n9-20020a170903404900b0013b99ea8899mr9665878pla.84.1632500110295;
        Fri, 24 Sep 2021 09:15:10 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0:1dda:37cf:b1d6:5d51?
 ([2601:646:9200:a0f0:1dda:37cf:b1d6:5d51])
        by smtp.gmail.com with ESMTPSA id
 y13sm8780182pjc.50.2021.09.24.09.15.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Sep 2021 09:15:09 -0700 (PDT)
Message-ID: <a7ef7af8-6a70-4396-89c0-e84dc5d01a5b@gmail.com>
Date: Fri, 24 Sep 2021 09:15:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.1.1
Subject: Re: [OE-core] [PATCH] libsamplerate0: Set correct soname for 0.1.9
Content-Language: en-US
To: Tom Pollard <tom.pollard@codethink.co.uk>,
 openembedded-core@lists.openembedded.org
References: <20210924124757.86731-1-tom.pollard@codethink.co.uk>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20210924124757.86731-1-tom.pollard@codethink.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Sep 2021 16:15:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156333



On 9/24/21 5:47 AM, Tom Pollard wrote:
> Manually patch SHARED_VERSION_INFO, which was missed in
> the 0.1.9 release and later incorrectly fixed until 0.2.1
> 
> Signed-off-by: Tom Pollard <tom.pollard@codethink.co.uk>
> ---
>   .../libsamplerate0/shared_version_info.patch        | 13 +++++++++++++
>   .../libsamplerate/libsamplerate0_0.1.9.bb           |  1 +
>   2 files changed, 14 insertions(+)
>   create mode 100644 meta/recipes-multimedia/libsamplerate/libsamplerate0/shared_version_info.patch
> 
> diff --git a/meta/recipes-multimedia/libsamplerate/libsamplerate0/shared_version_info.patch b/meta/recipes-multimedia/libsamplerate/libsamplerate0/shared_version_info.patch
> new file mode 100644
> index 0000000000..b42d564b4b
> --- /dev/null
> +++ b/meta/recipes-multimedia/libsamplerate/libsamplerate0/shared_version_info.patch
> @@ -0,0 +1,13 @@
> +Index: libsamplerate-0.1.8/configure.ac
> +===================================================================
> +--- libsamplerate-0.1.8.orig/configure.ac
> ++++ libsamplerate-0.1.8/configure.ac
> +@@ -53,7 +53,7 @@ AC_PROG_LN_S
> + #  6. If any interfaces have been removed since the last public release, then set age
> + #     to 0.
> +
> +-SHARED_VERSION_INFO="1:8:1"
> ++SHARED_VERSION_INFO="1:9:1"
> +

it can be synthesized from PV, that will be better, since we dont have 
to change it manually everytime version upgrade is done.

> +
> +
> diff --git a/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb b/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb
> index 6dfc42b436..8345d6880f 100644
> --- a/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb
> +++ b/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb
> @@ -10,6 +10,7 @@ PR = "r1"
>   
>   SRC_URI = "http://www.mega-nerd.com/SRC/libsamplerate-${PV}.tar.gz \
>              file://0001-configure.ac-improve-alsa-handling.patch \
> +           file://shared_version_info.patch \
>   "
>   
>   SRC_URI[md5sum] = "2b78ae9fe63b36b9fbb6267fad93f259"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156294): https://lists.openembedded.org/g/openembedded-core/message/156294
> Mute This Topic: https://lists.openembedded.org/mt/85838060/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

