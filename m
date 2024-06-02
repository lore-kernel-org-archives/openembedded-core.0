Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D98BC25B74
	for <webhook@archiver.kernel.org>; Sun,  2 Jun 2024 16:36:11 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.62218.1717346162899021992
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jun 2024 09:36:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NWq/M8LJ;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2eaa794eb9fso9895901fa.2
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Jun 2024 09:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717346161; x=1717950961; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rwXS1ZCVksLFMmvafPSJGrDlWwB9gYjvsrOUb21UtqA=;
        b=NWq/M8LJ+pjQIzsOimc6YeqOU2saKf2/Gs6bnMaS+UDHzX/jN8i9r/urKVScDJTcx7
         ucbltbkIpK3ebzDJNro11VGBb8WJiNmBZ3hoxo/yHhP2nV6QPrEto7gu2g3wKyNTV/9c
         x2KITG6NMiAG6XwAnLN1zIAycLt4XB8M0u6/TMoIIfHjWfsapKwYzkEO+DGVWargWVBD
         ZwwwW20vNsvnWU5Q1Wvr0Qd50/HxmIniFJIHxJZY7wW2VWEzwDDYLBbFMpkNKH8UjZz2
         jSLGXa90P3BoIsco6rlYaF10zkZoOgCuBh9hVa82Wv+zxEy3t7mB6JERDdp4eyI+Q8lN
         KApw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717346161; x=1717950961;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rwXS1ZCVksLFMmvafPSJGrDlWwB9gYjvsrOUb21UtqA=;
        b=AWXLCPlM5ozAAmAWc8kvfj0IHOSa3rPdi00E1/9+nFWxasMEHSMyEcLrxDcnGzEDZW
         3jcpYZe6X0p1BnwPDW8OUxDGr1QI+TGV/+qOFiH3ze18LcIxOXJZRjtRmYThgUm/dzrK
         zT70bQf7IDxb2b5agds/1QOEgMmgvCVUuSz1K6Cfyb1OhH306jfeVz2rPh+T3UC6Sazt
         RhOlsQLDeYcWb9BYKjERjvONJEdf7Dwmc5eOG974EfOLK7R3cIyHphrc/J2GRQDb0ZU4
         +mbHChIqiSzwuD4n6F3/Ux9o/uvzFSmUmEe4rat85gj1JJg10SuG2vwiJIzoR8MxZxKe
         hKuw==
X-Gm-Message-State: AOJu0YwtJecySrXDH8tGCr7d10gm4oGLcWS0A1eK8DfFyMtjVi2js5+t
	ZsOkUI3S7b2f4ghHulfBq6AIH7F7xwyl2m+On8tDXGPnXL4YKXq533tyGzy2l8ZW6E3eM45S6rz
	eUFPQwBgdLn309E1IG9Kmu4TFQdE=
X-Google-Smtp-Source: AGHT+IExAzXyGgON8/I/3MBzmOO+yob3ukmFBjcG4OwnlN7MMLkZsbO2Qce0C/BWyfkfNbGVmFxdt2RpwmV67k8wll8=
X-Received: by 2002:a05:651c:1687:b0:2e9:8d77:65a with SMTP id
 38308e7fff4ca-2ea9510df72mr43995681fa.29.1717346160739; Sun, 02 Jun 2024
 09:36:00 -0700 (PDT)
MIME-Version: 1.0
References: <QTDGES.21EDCKYOMIWH1@t-online.de>
In-Reply-To: <QTDGES.21EDCKYOMIWH1@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 2 Jun 2024 18:35:49 +0200
Message-ID: <CANNYZj8jOi9BSnkA0DH-Q_OPw5w2WGvRDbBAicxpJHDxXx1QSw@mail.gmail.com>
Subject: Re: [OE-core] xcb-util-errors
To: f_l_k@t-online.de
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Jun 2024 16:36:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200210

I think it belongs in core, as otherwise it would require a
cross-layer include, which is technically possible, but is a
maintenance issue. New xcb releases are very rare.

Alex

On Sun, 2 Jun 2024 at 14:39, Markus Volk via lists.openembedded.org
<f_l_k=t-online.de@lists.openembedded.org> wrote:
>
> xcb-util-errors is an optional dependency for wlroots and as of
>
> https://github.com/hyprwm/Hyprland/commit/a54ab301602e205f273969c093cf494d38ba4a98
>
> required for hyprland. It is missing in recipes-graphics/xorg-lib and I have therefore created the recipe like this:
>
> xcb-util-errors_1.0.1.bb
> require recipes-graphics/xorg-lib/xcb-util.inc
>
> SUMMARY = "xcb-util-errors gives human readable names to error codes and event codes"
>
> DEPENDS += "xcb-util python3 xorgproto"
>
> LICENSE = "MIT"
> LIC_FILES_CHKSUM = "file://COPYING;md5=c90ee77011043c608617f5323a523726"
>
> SRC_URI[sha256sum] = "5628c87b984259ad927bacd8a42958319c36bdf4b065887803c9d820fb80f357"
>
> Is there interest in having this recipe in oe-core or should I move it to meta-wayland?
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200207): https://lists.openembedded.org/g/openembedded-core/message/200207
> Mute This Topic: https://lists.openembedded.org/mt/106442655/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

