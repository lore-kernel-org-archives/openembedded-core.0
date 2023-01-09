Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4920C5479D
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 14:38:58 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.73380.1673275135993319207
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jan 2023 06:38:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Un+OKvUF;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id v25so13244010lfe.12
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 06:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FCFKRsPdEyGKopea9BW7A6rBJkWXmOJJGppg+0fZEHw=;
        b=Un+OKvUF7aNS3cPHUKSnQdfo1V/SPI8mO2Snh9N2UHzBVLGbjND7PT165HbsfGLAH+
         itvs83AUABDggDbOJmtXeHKt/vhSy/PJIBDVSb6bPCutRSuWTnlON6rVjRD8tDl0Tr/4
         D7UMQB2jn3NZkb4Ui9R9wAAK3l9wpCf9k5goxyZ5qXNieA0Q+j2sZPVJIhBIdZ6Rrp03
         nbu1iufXdztiQab0XYupucqiYTOoM2PVbH/kjGAb66oasdQVJi3RXaDJhvu8UhTJY7t7
         /grgnITP8MI4DzOfX/Hv/cUx+76lK1cBKcLvvEkZm4FyEE1LOk1ByXkEgZHNqJunJimG
         WAYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FCFKRsPdEyGKopea9BW7A6rBJkWXmOJJGppg+0fZEHw=;
        b=YvmnKbTb2SvcMUXET1MwIzA7SPJj6P6R2XDTIB9c72vwtYzIWYG/b0SxMDJ14FCWDz
         5vMzZxAawJWIQIpEnX2oHK1Yofgi/QzDg/ZqCTErhdUGd0cvjryZ0JZ6Ab9MFj843QnS
         iXPaDj3XNhIAVQjXV3NChkV148+/0lrA5RDQMWiAFbSQQOreYpoPSbDtHCSoTEprP2/G
         FEPOF+jsm4Jr+vQ04PLIW+lWLVbM3wfd+AsF6r5q1KojHf/bb7m1dhAn82yWu8NTvgbF
         +lJVJVgxKiIMTgVAjDKkYUMPmgPYY7ozXl8ymdN47F9y7+7QqLtwAXZAKRDYNGK+oas0
         clkQ==
X-Gm-Message-State: AFqh2kouazQ7pptiPNJRSBD3ZTFjYwxM/wA5SU5uRbWCuy6nhZOEegmU
	y27TeRCM1tpVZjtlECJnUQLAkbStYQM7xwTnDnA=
X-Google-Smtp-Source: AMrXdXtnqT5tu+FOnwVo0ssYVUNBBW8nFXLaqwR8EQqat8o7c1fwauO/WeGf84jmfOW9Q3jukU10wmzzgiZrgotH7IY=
X-Received: by 2002:a05:6512:1107:b0:4cb:2508:f535 with SMTP id
 l7-20020a056512110700b004cb2508f535mr2751128lfg.131.1673275133875; Mon, 09
 Jan 2023 06:38:53 -0800 (PST)
MIME-Version: 1.0
References: <20230109133437.84684-1-f_l_k@t-online.de>
In-Reply-To: <20230109133437.84684-1-f_l_k@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 9 Jan 2023 15:38:42 +0100
Message-ID: <CANNYZj-4_4V0TPQaCPKgCn=my4wgwz3s+tW0VSNjzxr1mv2f4Q@mail.gmail.com>
Subject: Re: [oe-core][PATCH] librsvg: enable vapi build
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 14:38:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175687

This probably needs 'inherit vala' as well, so that dependencies are
reliably pulled in?

Alex

On Mon, 9 Jan 2023 at 14:35, Markus Volk <f_l_k@t-online.de> wrote:
>
> Otherwise gnome-chess will fail like this:
>
> | error: Package `librsvg-2.0' not found in specified Vala API directories or GObject-Introspection GIR directories
> | Compilation failed: 1 error(s), 0 warning(s)
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta/recipes-gnome/librsvg/librsvg_2.54.5.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb b/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb
> index fc52ae61c5..b2e93a2684 100644
> --- a/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb
> +++ b/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb
> @@ -42,6 +42,8 @@ do_configure[postfuncs] += "cargo_common_do_configure"
>
>  inherit rust-target-config
>
> +EXTRA_OECONF:class-target = "--enable-vala"
> +
>  # rust-cross writes the target linker binary into target json definition without any flags.
>  # This breaks here because the linker isn't going to work without at least knowing where
>  # the sysroot is. So copy the json to workdir, and patch in the path to wrapper from rust class
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175683): https://lists.openembedded.org/g/openembedded-core/message/175683
> Mute This Topic: https://lists.openembedded.org/mt/96152051/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

