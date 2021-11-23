Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8409DC433F5
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 22:36:03 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.1270.1637706962295116761
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 14:36:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NcfDLyXI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id
 d72-20020a1c1d4b000000b00331140f3dc8so439929wmd.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 14:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=XIwcu6bwUouQiMPJ+dqG0S+0Fe53WZzeJ86XHOA9Aks=;
        b=NcfDLyXI4PqNvq52zv17LMvO2FyRs310pTynGzj2s6joEicCCVpHwc+R8eeiXLGZtA
         6AnjeegW3zZHTgDuEn7OG/HeG4wFgufvF5bbMRsYOzvU2Siom9MuH0Ljq2LCBuiPpI77
         2A1qpz5ejijz827yrMQbDjP3fiY/IZ1ruR9w0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=XIwcu6bwUouQiMPJ+dqG0S+0Fe53WZzeJ86XHOA9Aks=;
        b=6/z0+o1Oo6zvS88IBv98DaKPhTPb/RQZ0H53h5OvTqp6cUMG2rftIS55aleVNY0Q3+
         8mFC0YpQ7HeeF7hCeEnhxM4RmVCyZrH5t7+TtxQP3/JwPNRmpkiL+Uq28flmpeIIAuxB
         WKb+LexBshnzKvwTHTgRQUeswPj2bu2NG0hJUoREpdeJmm9LvmrRmWwquuIyEUj6eZQr
         YreWmWX2lXk8qlfsBjhODRkCiTvpgN/4SibaHNfUl8OAdQ1NO3cnE+R37X/CkhceSL1O
         6/GTA/puxAmQEQTV7iy5RODdNKWxUbrgjgEazOP5xjRgt0CBXdKSLgGKB8sDJFBX+sjh
         DG9g==
X-Gm-Message-State: AOAM530o4tdjLCKq8DDAL5pNGOYVgTfSzoaA9f3PTKZ52E9nhiEucK9E
	QKbuQI8PDqV28f64DGezDyNdJQ==
X-Google-Smtp-Source: 
 ABdhPJyO8ANcLYeAZAGX69aGbR4OUuGDkKEDZKDhcV6dxbtOt4BA1xcv18Ds65J+npmWyQks5to95g==
X-Received: by 2002:a05:600c:4e02:: with SMTP id
 b2mr7958138wmq.105.1637706960614;
        Tue, 23 Nov 2021 14:36:00 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:246e:77cb:e23:80f?
 ([2001:8b0:aba:5f3c:246e:77cb:e23:80f])
        by smtp.gmail.com with ESMTPSA id
 f15sm3498684wmg.30.2021.11.23.14.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 14:36:00 -0800 (PST)
Message-ID: 
 <4385af73ed16d497a0f066396ffe6baddc92d899.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] meson: drop redundant patch
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross@burtonini.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 23 Nov 2021 22:35:59 +0000
In-Reply-To: <20211123193859.2983287-1-ross.burton@arm.com>
References: <20211123193859.2983287-1-ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Nov 2021 22:36:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158643

On Tue, 2021-11-23 at 19:38 +0000, Ross Burton wrote:
> This patch disables the debian-detection to use the correct $libdir by
> default on that platform.  However in cross builds this is always
> overridden to be $prefix/lib, and all recipes that inherit meson pass
> the correct libdir explicitly.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-devtools/meson/meson.inc         |  1 -
>  ...01-is_debianlike-always-return-False.patch | 26 -------------------
>  2 files changed, 27 deletions(-)
>  delete mode 100644 meta/recipes-devtools/meson/meson/0001-is_debianlike-always-return-False.patch

We build native things which are meson based. Do we want native tool libdir
paths depending on the existence of /etc/debian_version ? It was some reason
like that this was added as we found it doing 'fun' changes depending on the
host. Not sure I really want to debug that again...

Cheers,

Richard




