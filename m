Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28037C433EF
	for <webhook@archiver.kernel.org>; Sat, 13 Nov 2021 16:27:55 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web09.491.1636820873749256836
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Nov 2021 08:27:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=f00nNXir;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id
 f7-20020a1c1f07000000b0032ee11917ceso9076642wmf.0
        for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Nov 2021 08:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=VRLGyxNqiJF2zvDWNJ9EPB0l2F1XlQE4yIIBSsZcCyw=;
        b=f00nNXirtrbOPj7y5VbGIu4RxmsfuY2ZLW1Ym9xWmzoPbIJHSP4FvUBn/5YA4Mpara
         WOGnKssBJTsonxGNQsI7DJUOqcRtEWnoZ8AMKbwwrRVaIGFHxADBkkNlJjFj3br5hJWT
         7f4H1Spkw3FXfq+JWrKDmMVqys6pyHDF3eCh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=VRLGyxNqiJF2zvDWNJ9EPB0l2F1XlQE4yIIBSsZcCyw=;
        b=k7ErKt9HLCTQFXSPYFXucm7/xQXkoag+bE9J3MfQk86jwf7Zu1wfhCRC1h6NYQv6Or
         ismiu40JiQ3EaXoaJ8F/xJnmdPY0VDiBpNV3iMgQ6SyFmS1PtHdmb3FqorQViF8npMFv
         8Qd/NvOlWC8HvW/UAHzh7dDIvk1ZNV1hvp7AKc5A5ZF47/Xf55VUBklBcRdiHRe3K9zn
         aQSikGf/tOFIzxHPmEWt85ed5kax60dpiCgtZ6Mk8Tuolnl04Yq+owA7fLWVzASLykJA
         220Xaxx/irxDYx5r7XRf4J6yEUH95aIN97zVVZMGvJGObAEG82uX6lMPmRprmrG8ZJaZ
         MeJQ==
X-Gm-Message-State: AOAM533eKH5NIaWFWnQqwBowKBoNDL9faVrq5c027bDTQzF69qYKcnHn
	zXbO+ko5kCITVGM0BlnPoW9qoQ==
X-Google-Smtp-Source: 
 ABdhPJxhSCzpHlLPnjnBeEbjyir0FXSa7LI+9YLgXxOkfkXIE3hYxl9qoPf/H7mPBAfVV84zb4FksA==
X-Received: by 2002:a05:600c:a55:: with SMTP id
 c21mr44362241wmq.191.1636820872186;
        Sat, 13 Nov 2021 08:27:52 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:4f1d:7b2:7d47:57f5?
 ([2001:8b0:aba:5f3c:4f1d:7b2:7d47:57f5])
        by smtp.gmail.com with ESMTPSA id
 o3sm16305194wms.10.2021.11.13.08.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Nov 2021 08:27:51 -0800 (PST)
Message-ID: 
 <ba2b422b552fa9690698041e4b8199a115b2a3dd.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] python-numpy: move recipe to python directory
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yi Zhao <yi.zhao@windriver.com>, openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com
Date: Sat, 13 Nov 2021 16:27:49 +0000
In-Reply-To: <20211113134505.353043-1-yi.zhao@windriver.com>
References: <20211113134505.353043-1-yi.zhao@windriver.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Nov 2021 16:27:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158247

On Sat, 2021-11-13 at 21:45 +0800, Yi Zhao wrote:
> This recipe had been moved out from python directory since 2016[1] in
> order to share patches between python2 and python3. But now there is no
> reason to keep it in its own directory as we only keep python3-nump.
> Move it back to python directory.
> 
> [1] https://git.openembedded.org/openembedded-core/commit/?id=9bffe2f9fb4ce6c0b265f27e5b484fbe076c6349
> 
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  ...01-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch | 0
>  .../python3-numpy}/0001-numpy-core-Define-RISCV-32-support.patch | 0
>  .../{python-numpy/files => python/python3-numpy}/run-ptest       | 0
>  .../{python-numpy => python}/python3-numpy_1.21.4.bb             | 1 +
>  4 files changed, 1 insertion(+)
>  rename meta/recipes-devtools/{python-numpy/files => python/python3-numpy}/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch (100%)
>  rename meta/recipes-devtools/{python-numpy/files => python/python3-numpy}/0001-numpy-core-Define-RISCV-32-support.patch (100%)
>  rename meta/recipes-devtools/{python-numpy/files => python/python3-numpy}/run-ptest (100%)
>  rename meta/recipes-devtools/{python-numpy => python}/python3-numpy_1.21.4.bb (98%)
> 
> diff --git a/meta/recipes-devtools/python-numpy/files/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch b/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
> similarity index 100%
> rename from meta/recipes-devtools/python-numpy/files/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
> rename to meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
> diff --git a/meta/recipes-devtools/python-numpy/files/0001-numpy-core-Define-RISCV-32-support.patch b/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch
> similarity index 100%
> rename from meta/recipes-devtools/python-numpy/files/0001-numpy-core-Define-RISCV-32-support.patch
> rename to meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch
> diff --git a/meta/recipes-devtools/python-numpy/files/run-ptest b/meta/recipes-devtools/python/python3-numpy/run-ptest
> similarity index 100%
> rename from meta/recipes-devtools/python-numpy/files/run-ptest
> rename to meta/recipes-devtools/python/python3-numpy/run-ptest
> diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.21.4.bb b/meta/recipes-devtools/python/python3-numpy_1.21.4.bb
> similarity index 98%
> rename from meta/recipes-devtools/python-numpy/python3-numpy_1.21.4.bb
> rename to meta/recipes-devtools/python/python3-numpy_1.21.4.bb
> index 8988a5bc39..a3ea4ab5aa 100644
> --- a/meta/recipes-devtools/python-numpy/python3-numpy_1.21.4.bb
> +++ b/meta/recipes-devtools/python/python3-numpy_1.21.4.bb
> @@ -47,6 +47,7 @@ RDEPENDS:${PN} = "${PYTHON_PN}-unittest \
>                    ${PYTHON_PN}-ctypes \
>                    ${PYTHON_PN}-threading \
>                    ${PYTHON_PN}-multiprocessing \
> +                  ${PYTHON_PN}-json \
>  "
>  RDEPENDS:${PN}-ptest += "${PYTHON_PN}-pytest \
>                           ${PYTHON_PN}-hypothesis \

Looks like there is a dependency being changed too which isn't in the commit
message?

Cheers,

Richard


