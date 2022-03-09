Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78D9BC433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 12:30:54 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web09.4915.1646829053371569061
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 04:30:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=iQc0YRer;
 spf=pass (domain: burtonini.com, ip: 209.85.221.45,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f45.google.com with SMTP id u10so2760273wra.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 04:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+2K+QTlsexgRd7444A/aLY/9ndu+fhhVZToVwLdE2eQ=;
        b=iQc0YRernYAAZ6/a3c7s3pChtWYGEOY8btvkSc34btbFv2xb0MOBn0x5vbIS+Kgq0p
         3etNpr/pOlixkOdTp9hb5biY9TgbKB7WXaUzT2hjPBy5FlemqreBAzwHmKb0CqQzbWqy
         wsDI+GkGE6qkh/E4bbqkgXKV4cZ9RIHE4gIpI5l5S0YPhL+O841Jiyo6IBzMJ1J2XK0s
         qrg+Ib+xZM9ocxAy61IAZLzp1paiK2JjIeh+uPtLhKhEGbtblARLP7VvkYZpmCksdRIN
         bbeIuS3wUgY8+IZiOaCuJwdO6BllhwDQIXoC1EaBVr28VFA36DBlytqoWM9U8Npj7PYP
         9hRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+2K+QTlsexgRd7444A/aLY/9ndu+fhhVZToVwLdE2eQ=;
        b=1C6DRxaLZIqQxiaclJOwCeQJck7fyHHXAL1EpGhD+/2N+eE9jEmvFRzBUEDmqkk3M0
         wYimxKmvK3mJCzCoRQBCb0RJtN086Dds3l0Bkt775pRzQySpCfvnco+ZJ0Fwo5icAZET
         GmLk2qdQEqaPPxFZZR0SPt+ta3jz6uoQ0YZvN/mCBOS+4I3g561yjFBGmPeU5h7OZ7dx
         a8NDWkULsfmrf0+rfSg0huarWnp30ZrfqTBCJyr6BcbC62t/FN/UsSACkMSLMIakYJNA
         XOv+y0/ibU/FeP/dDVW3fRShQftkE1JFHdmMZXPdjc4tBtmXpmVZ6h4mgKbiTZt6vOZi
         uYYw==
X-Gm-Message-State: AOAM531cnP4cNl85/Cj5V8gm1Y5sz5D+C+3eyG365gAQxKOVSpspSPmT
	PHvBFE/I9Ll1vCChqRPSsfrbLgN4+8QInvp7dRoPaQ==
X-Google-Smtp-Source: 
 ABdhPJxdSZlCzGGaeKIMnPf9smfGO3rjqsFWin0RQF/8lJ1RKMo6A8qZRuxvSitYg1noo9GUHBuBsszB/1VFw+cNBvw=
X-Received: by 2002:a5d:6506:0:b0:1f1:da5e:e077 with SMTP id
 x6-20020a5d6506000000b001f1da5ee077mr15844982wru.405.1646829051713; Wed, 09
 Mar 2022 04:30:51 -0800 (PST)
MIME-Version: 1.0
References: <20220308155252.2454464-1-raj.khem@gmail.com>
In-Reply-To: <20220308155252.2454464-1-raj.khem@gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Wed, 9 Mar 2022 12:30:40 +0000
Message-ID: 
 <CAAnfSTtiGgXAi675oJ1oxkX+r-f1bwT7+Utc-8ddvPwC_zaTSw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/5] qemu: Depend on virtual/egl
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Mar 2022 12:30:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162960

On Tue, 8 Mar 2022 at 15:52, Khem Raj <raj.khem@gmail.com> wrote:
> -PACKAGECONFIG[glx] = "--enable-opengl,--disable-opengl,virtual/libgl"
> +PACKAGECONFIG[glx] = "--enable-opengl,--disable-opengl,virtual/egl"

Either the packageconfig name is wrong, or this patch is wrong: GLX is
explicitly big-GL not EGL.

Ross

