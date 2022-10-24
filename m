Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9546DC38A2D
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 08:36:16 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web09.16909.1666600560048542293
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Oct 2022 01:36:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DnXV9eoc;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id a29so15592628lfo.1
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 01:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=its7aTK3XqbMEB4Zcw/cAvktLoiliXFR4c632Kzx5GA=;
        b=DnXV9eocEbF8/s1W3xl28OiiPn4zCvXin59rMSAHm+AlS8sriR5lI1yu/2k5GG0QNY
         3lMNNL0w6EDK+BmXO21vF9ltDmb2A0SuIDbM6yz61s8Q13/12jNz5kcZS3JwnDch68it
         7ShrhHEXESk20Zsb45aNRrH5fo2XOWJcPKrh7fVHCxyTE+RQ62R2yjtRh0U7zigNgvYH
         ZQlhJcyNbhbpnhx+aB5ZTCiplU8ZZsZVCQ4pTEzYsgvtE6v+LGeEHa2tB4VH4VfQ3WW6
         eoOtXjvu8v/vBt6d6glQJay4A67P5mNDRwlaAULP0w39nepKIPAZtAbQ1NIBi3lgXTEj
         cD2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=its7aTK3XqbMEB4Zcw/cAvktLoiliXFR4c632Kzx5GA=;
        b=3WLlm8ZXzJ7o9bOfwgHBVS5SQ11cK+eJJVD3rXYFe1XdgX0Y+EzSaQIwQPiP3sIMcL
         kf00VLwG0R+dU/ZvdEGWCZ8ml3SawVQkje5OOtlnYneiWl24WLobXzo6s9o9Z/ZDleTD
         qpIxvt/Up3WhFF/b77X0SNmpn+YQw7cBKG/3ZXx90QX2VnMvAGdRXrAyvhjHvtAKnwOo
         mLktebKE9piuJNoJu3LaQgPUMnj0q0s7ueoOtaGFNHOO2sveXbbINrT85WaRaDtnt/od
         WS3mdk2ckuID16e80TY4UL/EzT11erdfxCCS+ylPRvUq/gDphsMbgfB4Xel4zvfXTYS8
         xNNA==
X-Gm-Message-State: ACrzQf0hIuoqZs4SyBvFOoGGAiHRLCczypmRGaDoxnXvvVdASli0HjVa
	6QN7vRlZV6wFVk4DOPKMTsU7vIKcoew/ALk2TOY=
X-Google-Smtp-Source: AMsMyM5GITWRpHYm3hfTJo08LJTKWXUxdxIL0egv9aQ+rsYXoFMRZ6fa2pwvFjlIC0+QpdzKFxEq8h/3OQOFE/v1YBQ=
X-Received: by 2002:a05:6512:2399:b0:4a2:94d6:da27 with SMTP id
 c25-20020a056512239900b004a294d6da27mr11712616lfv.131.1666600557719; Mon, 24
 Oct 2022 01:35:57 -0700 (PDT)
MIME-Version: 1.0
References: <20221024064759.343728-1-vince@underview.tech>
In-Reply-To: <20221024064759.343728-1-vince@underview.tech>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 24 Oct 2022 10:35:45 +0200
Message-ID: <CANNYZj8YiuFPW8sEo-72o574=7sD-1GHqL4GkVjW_qpX+BWn9Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mesa: enable glvnd support
To: Vincent Davis Jr <vince@underview.tech>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 08:36:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172076

On Mon, 24 Oct 2022 at 08:48, Vincent Davis Jr <vince@underview.tech> wrote:
> +    # sed can't find EGL/eglplatform.h as it doesn't get installed when glvnd enabled
> +    if ${@bb.utils.contains('PACKAGECONFIG', 'openglx', 'true', 'false', d)}; then
> +        return 0
> +    fi
> +
>      if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)}; then
>          sed -i -e 's/^#elif defined(__unix__) && defined(EGL_NO_X11)$/#elif defined(__unix__) \&\& defined(EGL_NO_X11) || ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
>      fi

This needs to be replaced with a direct check of EGL/eglplatform.h
existence in the existing if block.

> @@ -38,6 +43,7 @@ DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native zlib
>  EXTRANATIVEPATH += "chrpath-native"
>  PROVIDES = " \
>      ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'virtual/libgl', '', d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl x11', 'virtual/libglx', '', d)} \

Why DISTRO_FEATURES and not PACKAGECONFIG like others?

>      ${@bb.utils.contains('PACKAGECONFIG', 'gles', 'virtual/libgles1 virtual/libgles2 virtual/libgles3', '', d)} \
>      ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'virtual/egl', '', d)} \
>      ${@bb.utils.contains('PACKAGECONFIG', 'gbm', 'virtual/libgbm', '', d)} \
> @@ -116,6 +122,7 @@ VULKAN_DRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'broadcom', ',broa
>  PACKAGECONFIG[vulkan] = "-Dvulkan-drivers=${@strip_comma('${VULKAN_DRIVERS}')}, -Dvulkan-drivers='',glslang-native vulkan-loader vulkan-headers"
>
>  PACKAGECONFIG[opengl] = "-Dopengl=true, -Dopengl=false"
> +PACKAGECONFIG[openglx] = "-Dglvnd=true, -Dglvnd=false,libglvnd"

Packageconfig option should be named glvnd too.

Alex

