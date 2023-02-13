Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD54C636D7
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 10:46:07 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.11750.1676285158704451929
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Feb 2023 02:45:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=foX9l9aY;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id o20so18287794lfk.5
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 02:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h/QvBWHGXNN1WZqOwzALPQpylh+tbKktug51S+yl+ZQ=;
        b=foX9l9aYavMxnHC9Ja9c1xXVPgPHyuxfVTgxu/VaYzsRqzbJZKntqCiS2qBQkyjjD4
         QEbOV8icUkw2UdGaJkXleYGz6erHDwFcfhvvcL++chP3QYE+ZDYniO8UNh/znFfNCKPl
         wY8mueRhzzziCH2LkSnUWvGe3uSyOVvYkZCKpyfMQGk4dYB2j/bzjjuUutL/N+H+f80u
         a8W1IoA3X+ZpfLFEe1+HMoqmZZg+iuEDIKsvFjQpIKHlM5RMtD/oJe9IONS6tawSmkWw
         Vydboy5CB6UPURyGRjDY8eA3//QQqXOSOkfcnQ+ZpP6iidua7JWYbJ3ZAWWfLbPpEeWs
         xt/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h/QvBWHGXNN1WZqOwzALPQpylh+tbKktug51S+yl+ZQ=;
        b=ETjynw+1CdHyKaXztzhZRrd5MCOBA/S/trWHtIXnupCfsrO18J9Y4RCjB/S40ch7qu
         q//lGzgfafzqFWsTMj+49tJXtJuIg2xFvoiy47u9W7Qd99lTeI1h8f7EZzS2JjwV0fYk
         Kqv1xG+eR09kz7BNSlQnLmi8YUQ6sv6eqXQGijDw4OAlN5e2gLcYk5TTJEHYudECwSDh
         Txb7qu41bC+DzlXiB7kdErL0RZq98N5zwri2hdpDhYwYVjNMoGJeN+bek9Dx4JrTMouR
         2ziw67PhdKwm9TRkFO+9Bgzs1cq204RdpdedOyp4Kj2qAXmsG30khEK9PyrIu3/z8sS0
         YxQg==
X-Gm-Message-State: AO0yUKXMm3r9sHZs/f9uQtINAF0LjNKJ/hoVNKdi5H0zK62o9vf64MtF
	WetOj5zNGma2rNDUUyrel8oz7D6R8hLYKiQmneNt9g/C
X-Google-Smtp-Source: AK7set9iSZbr5XPPh8qFfGAfA83Vy2oOS73xfwhRjIuNtDrwdz6gTxu/lbNFDZMXI408t6vLouW/HKQr5opI0F/NPFI=
X-Received: by 2002:ac2:43af:0:b0:4da:f3a6:63b5 with SMTP id
 t15-20020ac243af000000b004daf3a663b5mr3651976lfl.243.1676285156994; Mon, 13
 Feb 2023 02:45:56 -0800 (PST)
MIME-Version: 1.0
References: <20230213104228.1067057-1-f_l_k@t-online.de>
In-Reply-To: <20230213104228.1067057-1-f_l_k@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 13 Feb 2023 11:45:45 +0100
Message-ID: <CANNYZj8KiZfFD6-BvTNv5oSQ5pNg_KX7_qF1hfNpip8WLM=G-g@mail.gmail.com>
Subject: Re: [oe-core][PATCHv3] graphene: add a PACKAGECONFIG for arm_neon
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 10:46:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177096

Doesn't this negate 'introspection' assigned with ?= ? Can you verify
the final value on aarch64?

(yes, this is a never-ending confusion, and I don't know how that
works either, after all the years of dealing with it).

Alex

On Mon, 13 Feb 2023 at 11:42, Markus Volk <f_l_k@t-online.de> wrote:
>
> Not all arm platforms support neon and runtime detection for this feature is
> currently not reliable. Add a PACKAGECONFIG that disables neon support for arm
> but can be manually enabled.
>
> Enable neon for aarch64 by default
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta/recipes-graphics/graphene/graphene_1.10.8.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-graphics/graphene/graphene_1.10.8.bb b/meta/recipes-graphics/graphene/graphene_1.10.8.bb
> index 813ff74adf..0efe6520d8 100644
> --- a/meta/recipes-graphics/graphene/graphene_1.10.8.bb
> +++ b/meta/recipes-graphics/graphene/graphene_1.10.8.bb
> @@ -11,7 +11,9 @@ SRC_URI[archive.sha256sum] = "a37bb0e78a419dcbeaa9c7027bcff52f5ec2367c25ec859da3
>
>  # gtk4 & mutter 41.0 requires graphene build with introspection
>  PACKAGECONFIG ?= "introspection"
> +PACKAGECONFIG:aarch64 += "neon"
>  PACKAGECONFIG[introspection] = "-Dintrospection=enabled,-Dintrospection=disabled,"
> +PACKAGECONFIG[neon] = "-Darm_neon=true,-Darm_neon=false,"
>
>  GTKDOC_MESON_OPTION = "gtk_doc"
>
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177093): https://lists.openembedded.org/g/openembedded-core/message/177093
> Mute This Topic: https://lists.openembedded.org/mt/96933147/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

