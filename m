Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85FE0C433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 13:59:57 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web12.26496.1646661595956656650
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 05:59:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cdirmSak;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id u1so23406746wrg.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 05:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=qA5DNmiWZGNqH0PZ3SjOcKltl+H1FG6wYcrK+wDj7+I=;
        b=cdirmSakIFXp3dn11yhoHEwL4pLlnYMuyh+6cHUK85JuV2RIHGaAwyKYXadc8O1Lg+
         QoYRDtdAJ8f8wOwjqHFtQ2Gs7ndGKfikJD3wk0Js8sw6wsLUH1Ic5RZNL1URoqfcG35I
         nmlnWZvgfX+qwrPA5J3WaaPyRdFG/t4qDzQlk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=qA5DNmiWZGNqH0PZ3SjOcKltl+H1FG6wYcrK+wDj7+I=;
        b=ao6Y5pPEBil0zYd0CdExxrMFO4kfIBFKOAOLc3S9NJCZEYUG7fHDeOaatoOZIpqNq+
         s0TDezh4pZ2zDyVI1CWuLGbi8Ns+Jz1p2Z0zkfz+kMfP+0H+ID/QGeDjpSuWj1LNHsOH
         Fix5ZeRzyrzmXg6ZJWqGxfwBJpnLv6Yaj8EyFAlS8F3/6/AnSG2XrS4Ez5UW80u7fV3j
         8sMNG9P3PZTWtsmswPZIEAlE0Ecel+GtGdZDykKC/sFLUamKeN6YYut7PGoV6dfGo5HH
         ydeJ9nekp94dhnxdHWbLd4kqBz54ePq4VIbkXaVcUxRSe3PbcM7T5O2L1yC8TaxB+Hr2
         Ajlg==
X-Gm-Message-State: AOAM531irlEm60421MuazIc78/cbbNVaclbWABDbgOsseKu/u4fTs+5p
	H5gwvc3qy6UrYA12w5c8vbFz/A==
X-Google-Smtp-Source: 
 ABdhPJzc6QrQFjxL6MTePpR3OoElndqZF3YsZGu6ekB1sLAtEcVVNGsIK8EB/7ZlCfDddGXEUgDfSQ==
X-Received: by 2002:a05:6000:1862:b0:1f1:f526:7901 with SMTP id
 d2-20020a056000186200b001f1f5267901mr4385969wri.485.1646661594124;
        Mon, 07 Mar 2022 05:59:54 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:bb31:2700:8490:fdf8?
 ([2001:8b0:aba:5f3c:bb31:2700:8490:fdf8])
        by smtp.gmail.com with ESMTPSA id
 p3-20020a05600c358300b003897e440047sm10794214wmq.28.2022.03.07.05.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 05:59:53 -0800 (PST)
Message-ID: 
 <1b840c9a971a3a5a887991fabe919f29577b0810.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] asciidoc: upgrade 10.1.3 -> 10.1.4
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: wangmy <wangmy@fujitsu.com>, openembedded-core@lists.openembedded.org
Date: Mon, 07 Mar 2022 13:59:50 +0000
In-Reply-To: <1646658064-56217-1-git-send-email-wangmy@fujitsu.com>
References: <1646658064-56217-1-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 13:59:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162819

On Mon, 2022-03-07 at 21:01 +0800, wangmy wrote:
> Changelog:
> =========
> .Bug fixes
> - Add missing test py files to dist archives
> - Fix DeprecationWarnings in a2x regexes
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../asciidoc/{asciidoc_10.1.3.bb => asciidoc_10.1.4.bb}    | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>  rename meta/recipes-extended/asciidoc/{asciidoc_10.1.3.bb => asciidoc_10.1.4.bb} (84%)
> 
> diff --git a/meta/recipes-extended/asciidoc/asciidoc_10.1.3.bb b/meta/recipes-extended/asciidoc/asciidoc_10.1.4.bb
> similarity index 84%
> rename from meta/recipes-extended/asciidoc/asciidoc_10.1.3.bb
> rename to meta/recipes-extended/asciidoc/asciidoc_10.1.4.bb
> index fc8cbc89c8..484250b33e 100644
> --- a/meta/recipes-extended/asciidoc/asciidoc_10.1.3.bb
> +++ b/meta/recipes-extended/asciidoc/asciidoc_10.1.4.bb
> @@ -5,11 +5,12 @@ articles, books and UNIX man pages."
>  HOMEPAGE = "http://asciidoc.org/"
>  
>  LICENSE = "GPL-2.0-only"
> -LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=4e5d1baf6f20559e3bec172226a47e4e \
> -                    file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263 "
> +LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=aaee33adce0fc7cc40fee23f82f7f101 \
> +                    file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> +                    "
>  
>  

Why did the license checksums change?

Cheers,

Richard


