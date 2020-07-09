Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web12.2066.1594280930034256967
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2020 00:48:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QSgLwk6u;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id q15so815238wmj.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2020 00:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=6LXhM62YhY+wVCUXDFkQZFUYrbYcGv/A644R9ISzzWE=;
        b=QSgLwk6uzHkb2EjVWW/8cRQpds6ic3K5J8t3HufWnIPUvxevw5Ep36sXoDn3bTJUMk
         Y+l9rZrBnsv0+1ZP85ZoWfWNd8h4jmB4+lCJGLneUE7F9t4J+d9i0IGBXRAXYMbMKyUL
         Ir7h3dpY2OzdhEFHUzHI3LLZ7HMnnPTHfbX+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=6LXhM62YhY+wVCUXDFkQZFUYrbYcGv/A644R9ISzzWE=;
        b=NY2v/PlzfkUj5uFwEgclfSNw3WIUwc9ID+YCH0cSvFx5LTgN0cQSXYYTPbBTxaSoOO
         c1iW1tNVoq0CGRUQQYD+V+KdxEVAb6/XBc1POgr6k2JtrA557AbRgjNiuKCwYETvBeAE
         /LF1bxdmWRoTcznewi1OCflU9eKWgZUmAP30u8tKEb22xgiOZDkWHvgj8f+VGUXkS1vG
         azl+2OzOisf0s8GktKvjvoicWNjkbFKEhKgAO8cO2lfHS9QLhGjnMwPWhr5YfCeHfxIC
         ONFQvsHJuAFC2nrhZsV4NOLiJlZmEI5N190YVQpoUCsC+tTGOCJNyJ9HX3EBgrSNoncX
         N8gw==
X-Gm-Message-State: AOAM533s/+Ptw+F94UZ4f24jFUwawH7LmkC3H+uTm+Taf6Vo+IUZsImw
	KdcqjV1w+pV2zjySUWQpd0grrA==
X-Google-Smtp-Source: ABdhPJx8g465uf+lyZxs0yTMfFjfTM4fmvbmr24v9+azEYcOaj1YTwf4d9QWOr5bbHnGlgSj65BwqA==
X-Received: by 2002:a7b:c84d:: with SMTP id c13mr12819971wml.170.1594280928504;
        Thu, 09 Jul 2020 00:48:48 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id u84sm3511798wmg.7.2020.07.09.00.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 00:48:47 -0700 (PDT)
Message-ID: <eb3e588aff2d599c3dfccb3b4192a4fa15407821.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCH] linux-firmware: fix iwlwifi-misc to include all iwlwifi firmware
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jun Miao <jun.miao@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 09 Jul 2020 08:48:46 +0100
In-Reply-To: <1594273815-13127-1-git-send-email-jun.miao@windriver.com>
References: <1594273815-13127-1-git-send-email-jun.miao@windriver.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-07-09 at 13:50 +0800, Jun Miao wrote:
> Signed-off-by: Jun Miao <jun.miao@windriver.com>
> ---
>  meta/recipes-kernel/linux-firmware/linux-firmware_20200619.bb | 3 +-
> -
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-kernel/linux-firmware/linux-
> firmware_20200619.bb b/meta/recipes-kernel/linux-firmware/linux-
> firmware_20200619.bb
> index 79acccddc7..321d808884 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_20200619.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200619.bb
> @@ -265,7 +265,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
>               \
>               ${PN}-imx-sdma-license ${PN}-imx-sdma-imx6q ${PN}-imx-
> sdma-imx7d \
>               \
> -             ${PN}-iwlwifi-license ${PN}-iwlwifi \
> +             ${PN}-iwlwifi-license ${PN}-iwlwifi ${PN}-iwlwifi-misc
> \
>               ${PN}-iwlwifi-135-6 \
>               ${PN}-iwlwifi-3160-7 ${PN}-iwlwifi-3160-8 ${PN}-
> iwlwifi-3160-9 \
>               ${PN}-iwlwifi-3160-10 ${PN}-iwlwifi-3160-12 ${PN}-
> iwlwifi-3160-13 \
> @@ -277,7 +277,6 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
>               ${PN}-iwlwifi-7265 \
>               ${PN}-iwlwifi-7265d ${PN}-iwlwifi-8000c ${PN}-iwlwifi-
> 8265 \
>               ${PN}-iwlwifi-9000 \
> -             ${PN}-iwlwifi-misc \
>               ${PN}-ibt-license ${PN}-ibt ${PN}-ibt-misc \
>               ${PN}-ibt-11-5 ${PN}-ibt-12-16 ${PN}-ibt-hw-37-7 ${PN}-
> ibt-hw-37-8 \
>               ${PN}-ibt-17 \

Why? Does this make the individual iwlwifi packages empty?

Cheers,

Richard

