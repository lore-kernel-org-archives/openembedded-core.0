Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52599C433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 12:48:36 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web09.9818.1645706915190066981
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 04:48:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=ZR8YCQa6;
 spf=pass (domain: burtonini.com, ip: 209.85.128.50,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f50.google.com with SMTP id
 p184-20020a1c29c1000000b0037f76d8b484so1180513wmp.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 04:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wrimm5aYmzPicIvjZ9eyWEDsZB5UfKZ1GHvczmb3v8c=;
        b=ZR8YCQa62XB4hrX/PZbfvK6KvLInaGp6KNgPINXmcBpkXeypJ5SXwyKkGMLLlUp/FJ
         nfyp6+ylMKNzbQWWb/cBIj2QfpflglkUHOxp4Iv3noZ54FniY3X95vnpisP8EE1D7wEJ
         W8q0E1Kq5xeX86KEwJ2TGBofQeVpYvI7zg2BhN5sUnFkB5MOj73CeuYBzvT9y4GzNd4p
         y5bYjVWrhIwuqhgxKjmOCYdYNb7ahE5jj6gd9u+Qywnjn2cMYBFXf4OZAP/JpLtAhsz7
         tauMTiilmv/T5n954t9POVGfJWLOND4F0l3MB9V/SSyGvgyEEdmlgSI6I3EighrBgogu
         QuLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wrimm5aYmzPicIvjZ9eyWEDsZB5UfKZ1GHvczmb3v8c=;
        b=jt/j7I/Z9NDg2MpSuyuIkjJDZpTLuNpL7os/f6+A5SV6Rz2gs2XOS4UjcLn6VFqpSo
         GWJq2DLYKghL3Msn/+bZ5BeXDk3Zek/PZrP5Vn2OgjvfHdwLSr1cr2muinPNNjzqiN7m
         L3qXOBCxkCl1ZVGplg3NzSaW5l5GmF96hC6w4ISdMfLAtoSWQui5cZzApvLn1h0WWWbe
         RJRg/ZKj47egIY9vUPlj1micukvq5nrVnYX6F92weND1iB0nju7mT3O/wD/NiePr4ajp
         oebZgjsU1OY3kw8U9UzM+hReVsGM4UCEEokBaxQ5qVjVWTc9DEiCzOKcPBoXnwxIR+m1
         /aeA==
X-Gm-Message-State: AOAM530A7Hnm0lw/5sYUoQEMm5Dmk8fMG6BqzhiUv5rTz/QcKprtYGzt
	0TVcufOLUddEn0Kyy5fpH8lV2abKJLEvqa7kNq568g==
X-Google-Smtp-Source: 
 ABdhPJwwyDgs75pBoE3r0cFBCc9ey5UZ6uPGzcx1Drw/sHbW+2nRQG6lIbwAI2zf2szbX2RQKcF+5RacscaGYo6peAY=
X-Received: by 2002:a05:600c:354c:b0:380:dec4:10ac with SMTP id
 i12-20020a05600c354c00b00380dec410acmr9907094wmq.62.1645706913442; Thu, 24
 Feb 2022 04:48:33 -0800 (PST)
MIME-Version: 1.0
References: <20220224072343.1262534-1-zboszor@pr.hu>
In-Reply-To: <20220224072343.1262534-1-zboszor@pr.hu>
From: Ross Burton <ross@burtonini.com>
Date: Thu, 24 Feb 2022 12:48:22 +0000
Message-ID: 
 <CAAnfSTvbo-e73Ea6i3dZ0c4tH9LYk2VjJ7znhuo_SJvMkLQ4Lw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gtk-icon-cache: Allow using gtk4
To: zboszor@pr.hu
Cc: openembedded-core@lists.openembedded.org,
	=?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Feb 2022 12:48:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162309

On Thu, 24 Feb 2022 at 07:23, Zoltan Boszormenyi via
lists.openembedded.org <zboszor=pr.hu@lists.openembedded.org> wrote:
> +            ${@['${GTKPN}', '']['${BPN}' == '${GTKPN}']} \

I know this was the syntax originally here, but please change this to
use the "a if b else c" syntax used elsewhere.

Ross

