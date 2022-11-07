Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C106EC43217
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 16:25:53 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web12.320.1667838348512539081
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 08:25:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PDIieLYa;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id d26-20020a05683018fa00b0066ab705617aso6810104otf.13
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 08:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Gzsuxr2ppq8z5oORJAhDUQkjWKGAFlb/hNoPSy6k3zg=;
        b=PDIieLYay9V6URXm3W/D/Xc2IzfE5l9lKkjqUKTrJOur+GgNqfOC81cOeepJR8tDKb
         fEfTVaQ4ILrjNCT7P2p6wtb+/lcdkTxR70mABov0ep+57+UH+U3VzWWBbGzfYakv3r3J
         2i+GwRfuORFJkaaqFQK3HacGOOicSqNdLTSm9KIcSUcVX9y/0BjpzxweU+Lt06y9UEGA
         o+rO8WWnxIVa8lFW0b+j70pI+SSiRAEsUiYtDDXIElebkm4QU9IzZtYU1vLCIWjk+Nh3
         6zuP/n9Fs1PxNpOahL94i18Gxl6kZdQuKMffY6P9gzxyqGV9TUu58cxAqOtJokku54T2
         +X1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gzsuxr2ppq8z5oORJAhDUQkjWKGAFlb/hNoPSy6k3zg=;
        b=8BhRJxiHaq1/5WRVcO4/uSSBSDVJKcJup6nJLJpNf7wStIGqrCKuLxcbFNHqdyYrN1
         +oy/qp27O+w1IwlvyELCOglw7j5gZxAbxKrbfmHmIATv6dr+LEpQdBi8NSJfNgNjkan/
         4FoYkrUEfduVTvnptxFVko2OxXCBPQTdz2sdTWYXGgMUVIl2Aer/AOs09MefvZxoCGBY
         lH0msxWTI8TeRPnT/RK1HA1N/RMxLiqjZQKlNdYc3dfQO9gYlN6f4BVuLxDkwhuu+imZ
         5Jq8mkgMbYjXgfPFmFgT8WHWCesnzcKc7ly/H+ThDVb3uQ/yHlsez8rL/ZFnC/2PMrGO
         Ho5Q==
X-Gm-Message-State: ACrzQf1oLsmQjQrgZ7N5+ckcgAm39yXlqv6dQ3DPtl2ZRmGELsCyfxPI
	PkU0WwjNpVaz/Scr+DnQxR/F3pI9tl1xwWoi9ZY=
X-Google-Smtp-Source: AMsMyM7TYMP+7h/jR/A0LXylzhR0H1a5nmZPIPmjeEVdedMlLZ9J5HI6egRqJPuH+c5bqeuETK1040rX1MQcQIhA2Bg=
X-Received: by 2002:a9d:65c9:0:b0:66c:5124:909a with SMTP id
 z9-20020a9d65c9000000b0066c5124909amr21480014oth.111.1667838347613; Mon, 07
 Nov 2022 08:25:47 -0800 (PST)
MIME-Version: 1.0
References: <20221105164343.1328765-1-f_l_k@t-online.de>
In-Reply-To: <20221105164343.1328765-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Nov 2022 08:25:21 -0800
Message-ID: <CAMKF1sok84zeArjLdO5bTWUm=7h9DCv2eG2zz70uz=RT_b8SDw@mail.gmail.com>
Subject: Re: [oe-core][PATCH] webkitgtk: use libsoup-3.0 by default
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 16:25:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172925

On Sat, Nov 5, 2022 at 9:44 AM Markus Volk <f_l_k@t-online.de> wrote:
>
> Some Gnome projects have stopped  supporting libsoup-2.4. Therefore, switch to libsoup-3.0.
> This would unblock the update of geary or gnome-online-accounts, which would otherwise
> fail like this:
>
> | Run-time dependency webkit2gtk-4.1 found: NO (tried pkgconfig)
> |
> | ../git/meson.build:70:0: ERROR: Dependency "webkit2gtk-4.1" not found, tried pkgconfig
>

There is also a break overved in some meta-oe packages see

https://errors.yoctoproject.org/Errors/Build/154536/
Perhaps minio is not related but I have not looked too closely.

> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta/recipes-sato/webkit/webkitgtk_2.36.7.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.7.bb b/meta/recipes-sato/webkit/webkitgtk_2.36.7.bb
> index 76b119c9c7..f3e1adee70 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.36.7.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.36.7.bb
> @@ -43,7 +43,7 @@ DEPENDS = " \
>            gstreamer1.0-plugins-base \
>            "
>
> -PACKAGECONFIG_SOUP ?= "soup2"
> +PACKAGECONFIG_SOUP ?= "soup3"
>  PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd wayland x11', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'webgl opengl', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', 'webgl gles2', d)} \
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172753): https://lists.openembedded.org/g/openembedded-core/message/172753
> Mute This Topic: https://lists.openembedded.org/mt/94829885/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

