Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48E03C0015E
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 08:37:50 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.43769.1690187861158729735
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jul 2023 01:37:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=QYLcl9dV;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-4faaaa476a9so6052346e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 01:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690187859; x=1690792659;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5vgd/IYiAvX7PsrLctFfA53U/PaYbLaGU2Td0AjAt1Q=;
        b=QYLcl9dVwFIEKavDs1McjBxD4OzjSVRXUyPuyOSlLFWd8JxOQXtvGgQ8IN5kSGXr9N
         6//TLW21OglZrN10TdmEYdlXcR1QoUUiJsK7mhHfxMsO2o0gO2poouJE29WkwxNsb1+f
         N+vs+MjVyW19pMsdCL0zpGzzpOyQfheMuuC6RU5k+YToSkiShKtLn74+4H5bAtjE9ZAi
         61uIrK6RIg46Rf5n6hQOuJdK9BQPBIecHUXT+oy4B05OKjfF9lPXDgjztCQOmXuqkunr
         3i4iCRlPnHbpLMUdUgVjgo5KhfIffC2mxo7iIXOPoHILULxNbRxbOAnoyP4OVZvPRvQ8
         fHGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690187859; x=1690792659;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5vgd/IYiAvX7PsrLctFfA53U/PaYbLaGU2Td0AjAt1Q=;
        b=PTeQ1nmkv9bYzjEBCHGYAeQsrkY/4pmBQGncKcYVK8tAijhq0qcrG2BX72+kRd2AJr
         DP14d5pJNSUMAllktJEQ9wa948K/MG76orN+kBlQ5px4RGGaMa/zZdTcQiYzFUJFKQUV
         W4aHKC1o1rhb1Wtk/JBrHlfbI4PIqtgxEmr4/Hk6oBKBKjcI9IuzwEJQ/WZ5FbDDzLy5
         3d2/l51oOvCdweHRnMGt55d18a0u++NIeS+wDPGkRCALqIE6/keVrXFMgz2dQolY9cpj
         toZnwz8U9t0tll0vbAqvvLI3FzTak0kK/1Udyhn99CGyHq/ygLYC+VkIM3nIh5z/TRYV
         XqNQ==
X-Gm-Message-State: ABy/qLaeEPkfgWL8N50x8zNh7TU9tSQdnZzl4G5vsRQYMkjuNA+BScWP
	iYSzQ/jFEKdDw+Oxp58Rk5SJM+7F2BYSCyXyiVk=
X-Google-Smtp-Source: APBJJlGkcHBJU3Mq+9bJWX3uZKlkIPVb9Sojw4laT51W574dDySDjmsVKoh+3ulx3bE+xlaecVjlgcDWKSXylj6hobQ=
X-Received: by 2002:a05:6512:553:b0:4fb:89e3:5ac6 with SMTP id
 h19-20020a056512055300b004fb89e35ac6mr4296319lfl.62.1690187856480; Mon, 24
 Jul 2023 01:37:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230724074815.591827-1-kai.kang@windriver.com>
In-Reply-To: <20230724074815.591827-1-kai.kang@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 24 Jul 2023 10:37:24 +0200
Message-ID: <CANNYZj-79JCh1A74Z3G_Z5W2GXoN734YKgSt4Csx7uEexwANgw@mail.gmail.com>
Subject: Re: [OE-core] [mickledore][PATCH] webkitgtk: disable DEBUG_BUILD
To: Kai Kang <kai.kang@eng.windriver.com>
Cc: steve@sakoman.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 08:37:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184781

Does this happen on master? If so, does this need an upstream bug
report, or maybe a better fix?

Alex

On Mon, 24 Jul 2023 at 09:48, Kai Kang <kai.kang@eng.windriver.com> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> It fails to build webkitgtk with DEBUG_BUILD:
>
>   Source/bmalloc/libpas/src/libpas/pas_generic_large_free_heap.h:140:1:
>   error: inlining failed in call to 'always_inline'
>   'pas_generic_large_free_heap_try_allocate_test_allocation_candidate':
>   indirect function call with a yet undetermined callee
>   | pas_generic_large_free_heap_try_allocate_test_allocation_candidate(
>   | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> So disable DEBUG_BUILD for it.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/recipes-sato/webkit/webkitgtk_2.38.6.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.38.6.bb b/meta/recipes-sato/webkit/webkitgtk_2.38.6.bb
> index 5e8adf50fc..e6d817cb62 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.38.6.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.38.6.bb
> @@ -42,6 +42,9 @@ DEPENDS += " \
>            gettext-native \
>            "
>
> +# webkitgtk fails to build with DEBUG_BUILD enabled
> +DEBUG_BUILD = "0"
> +
>  PACKAGECONFIG_SOUP ?= "soup3"
>  PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd wayland x11', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'webgl opengl', '', d)} \
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184778): https://lists.openembedded.org/g/openembedded-core/message/184778
> Mute This Topic: https://lists.openembedded.org/mt/100324919/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

