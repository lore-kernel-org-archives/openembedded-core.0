Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0605DECAAA1
	for <webhook@archiver.kernel.org>; Sun, 23 Oct 2022 17:20:12 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.10272.1666545603433397898
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Oct 2022 10:20:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lsYPqGDI;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id j14so10049829ljh.12
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Oct 2022 10:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pLuoIf6PBTx6Hp0HWhFhldg3a6o91EuBEjIxepN2TLs=;
        b=lsYPqGDIpKO1xRlCefp3ERGlPrTKTCB6SK0QKSUD5MeYnBFloif3t289D4L6s8ptvt
         dvEsRyUFgvYEV/1PU8zr6DdVoeEfPj1o+H5gPPyyeMLBGD6cB3ZlB0TWGM0l2oJ8seJy
         WOlN35wXh/UekRuRVyGviHLiS+xmjuXVP8v1ih+XL6KhVbRI05CnQ44oE3bz11HXiN7g
         xwfm1OfvboRz5yUIxP6g7xN4yr27uRt2FLsvDkE7dIhMpOw91SVLCCljstdz5wDA6w66
         TJ+FIOitEnpH2w1C2vka7MK4pgMU4z1q0VJ6FfzUqhJLCId0lidt/AFeYUfEFGTpwHVx
         SaZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pLuoIf6PBTx6Hp0HWhFhldg3a6o91EuBEjIxepN2TLs=;
        b=kc6+JQfPDJ8Mx89I5QxKzEl9JsD8RuStHUjRHr4ZQVauzxcV7+Ljp3VhdXy3PYDMh2
         slC6zcWHhqMnxAosVaWg51/YuTI2VGmxhcLmdlCnLDeI3K6s26AVMTN80Fr4PeaFf5S5
         cyUc4cthK8e+t4o1+55pztBa2Ra2OI/NYhltmnQGeaoNy97q3j9MzlkyB7E65v/MNsTM
         wWTPZeB+q0HiN9UnimbK+TsXZ+pH/lYGwkRJOTd8cOx0SREEH9dXuCKnv3YzE2hu0yBP
         /9+4XJHvp7kwfj0EJfa4IEP6SVhr5IRy/nmsK5eQBq3IUaMCH9GBvsjMMydyRg6wAggm
         jv+w==
X-Gm-Message-State: ACrzQf1s4s3zH0PtbvZxJ7rs6yYZNDRaIXGuR+aQReplpE0tigRCgKiO
	zqV4UvHQV5lubR49O2u677nVEd0TCc3BCsi1OSs=
X-Google-Smtp-Source: AMsMyM6ExEER/H8rggtX47cHsGInDrLSuJC18ifJU0NTLDFC0w0Ved6azcVCGCwvEZPHvJeMiuH92fvQkW9TmDeKBMw=
X-Received: by 2002:a05:651c:1950:b0:26f:e54b:8c54 with SMTP id
 bs16-20020a05651c195000b0026fe54b8c54mr10044333ljb.108.1666545601332; Sun, 23
 Oct 2022 10:20:01 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj__oO_F=t3DZDupCwFi8L_Q8FEZG=p8+iA48A_UY4xzuQ@mail.gmail.com>
 <1878.1666544754793887571@lists.openembedded.org>
In-Reply-To: <1878.1666544754793887571@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 23 Oct 2022 19:19:49 +0200
Message-ID: <CANNYZj-mFU4uwTSx1LBjy7i=xSgSQ9up+iv7Va8c8HGDc9M9Mg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libglvnd: add new recipe libglvnd v1.5.0
To: Vincent Davis Jr <vince@underview.tech>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Oct 2022 17:20:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172070

 I believe the glvnd recipe should be going to
meta-openembedded/meta-oe/recipes-graphics/, but any needed changes to
mesa recipe should be done here, as long as glvnd support is off by
default.

Alex

On Sun, 23 Oct 2022 at 19:05, Vincent Davis Jr <vince@underview.tech> wrote:
>
> Okay, yes this is an optional dependency of mesa. This recipe will allow for glvnd support in mesa.
> Thus, giving access to the GLX window-system API library and related libraries, mesa will build
> libGLX_mesa.so.*.* and libEGL_mesa.so.*.* when added. There may be applications that require
> direct access to the GLX window-system API library in order to build/execute. This will allow for
> multiple layers to have generic support for libraries in libglvnd (GLX window-system API library, etc...)
> without needing to implement their own version of the libglvnd recipe.
>
> Question, since the goal is to support glvnd in mesa.
> Should I be creating a patch series for this or just leave it as individual patches?
>
> Also, I'll update commit message with above response
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172069): https://lists.openembedded.org/g/openembedded-core/message/172069
> Mute This Topic: https://lists.openembedded.org/mt/94500417/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

