Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1937EC433EF
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 17:01:45 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web12.9922.1639155703813546031
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 09:01:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mlU6Ok7c;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id g9so8547061qvd.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 09:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w9p6C5+szMOUv/IZ8yBQjjqzev8UJVySxqW8TmZNhUk=;
        b=mlU6Ok7cmPkPrnuvp+yRrljRYAZOaQ4rAttCPyaBYivllhdbnv+cHDeC6bHOQ63hQO
         nBqS00xC5+ahKD/CCQArcJuxd1EXDt7MGQw4wKd+fmM+7z75M2ZpxGTU6UUlFZuJ6c1V
         8cXo6LR/Tit7Je5KDptG1JFOYyhJy48cWcLuC59jqR1EAdeaTD7x/rWDHAJ5uP8gLrpc
         Q8rcFaQEPOoBGIz56uL1A1qE01SQVbgHuVf+KlEbBm6Mt4GW23r1HxJKBd0978oe578a
         8uHw9GUgaMR9XBMhrVQ6OL+yL+tQzi7qMVRgXZWaLlsWM7H3XfkRZ0Lt7i8ZGvHO/IjR
         V9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w9p6C5+szMOUv/IZ8yBQjjqzev8UJVySxqW8TmZNhUk=;
        b=FAuWXEkiNLtE9XQ/1o9pAwLbi1sCMBv+bvmtXdvDkJMub1cPHh6wfD7bT7kC36IgN9
         GjBPtFsJo1HAUXU1JEogF9XZeY6Md9BJV5CMzYikK9UycxmZZM1gGdVcKADjnpZZO1X/
         BOhF7uqfYel1YuiRU0ptpg7hFfyG86WBsJjvH1CZJZZleMMKbxtEiLslPb5NGx6qoRHn
         jPUps/iacIhNLShzmCM7iPHrIhsomhiwy5qWWyq9rbYYKG7boGFGGxkOQdkwV3QeubBu
         Mu0xRWuoZiCXVVaDlAVOzGIH5qu9cxZzIhmRozbTJbAcTXAR9DjEWLkcaE1sYC90Yi63
         qNoQ==
X-Gm-Message-State: AOAM53321tSMgGFLhV7yGG9AJ2Beke58CGPvmWEPuYLA88ZNI0/CGLdj
	dObzGIPNhI+d6ro8iGmTVrMtwUa/yZKyROFxuIs=
X-Google-Smtp-Source: 
 ABdhPJzq5bnzNppG0lqpzLaENdZLfbzTmlxL/3CPupw3xhMZtUoApOaGgPgr7ncfZqLlsWE7ZVtpkd42JR7G8o3g0oc=
X-Received: by 2002:a05:6214:c83:: with SMTP id
 r3mr26524419qvr.110.1639155702737;
 Fri, 10 Dec 2021 09:01:42 -0800 (PST)
MIME-Version: 1.0
References: <20211208215947.1979470-1-alex@linutronix.de>
 <20211208215947.1979470-10-alex@linutronix.de>
In-Reply-To: <20211208215947.1979470-10-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 10 Dec 2021 09:01:16 -0800
Message-ID: 
 <CAMKF1sqMoz=MSVWu=3nnWAMu9Z5VTt4JwrTv6A-OLAa_h4T2Bg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 10/29] meson: upgrade 0.60.1 -> 0.60.2
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 17:01:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159555

this breaks gjs also see https://github.com/mesonbuild/meson/issues/9472

On Wed, Dec 8, 2021 at 2:00 PM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> From: Alexander Kanavin <alex.kanavin@gmail.com>
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-devtools/meson/meson.inc                           | 2 +-
>  .../recipes-devtools/meson/{meson_0.60.1.bb => meson_0.60.2.bb} | 0
>  .../{nativesdk-meson_0.60.1.bb => nativesdk-meson_0.60.2.bb}    | 0
>  3 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/meson/{meson_0.60.1.bb => meson_0.60.2.bb} (100%)
>  rename meta/recipes-devtools/meson/{nativesdk-meson_0.60.1.bb => nativesdk-meson_0.60.2.bb} (100%)
>
> diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
> index f383ad9f74..7fbb246b87 100644
> --- a/meta/recipes-devtools/meson/meson.inc
> +++ b/meta/recipes-devtools/meson/meson.inc
> @@ -15,7 +15,7 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
>             file://0002-Support-building-allarch-recipes-again.patch \
>             file://0001-is_debianlike-always-return-False.patch \
>             "
> -SRC_URI[sha256sum] = "5add789c953d984b500858b2851ee3d7add0460cf1a6f852f0a721af17384e13"
> +SRC_URI[sha256sum] = "64e6968565bf1b8152f4f9d6ca8154efb9e14caa9aabf7b22e71e6c5d053e921"
>
>  UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
>  UPSTREAM_CHECK_REGEX = "meson-(?P<pver>\d+(\.\d+)+)\.tar"
> diff --git a/meta/recipes-devtools/meson/meson_0.60.1.bb b/meta/recipes-devtools/meson/meson_0.60.2.bb
> similarity index 100%
> rename from meta/recipes-devtools/meson/meson_0.60.1.bb
> rename to meta/recipes-devtools/meson/meson_0.60.2.bb
> diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.60.1.bb b/meta/recipes-devtools/meson/nativesdk-meson_0.60.2.bb
> similarity index 100%
> rename from meta/recipes-devtools/meson/nativesdk-meson_0.60.1.bb
> rename to meta/recipes-devtools/meson/nativesdk-meson_0.60.2.bb
> --
> 2.20.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159376): https://lists.openembedded.org/g/openembedded-core/message/159376
> Mute This Topic: https://lists.openembedded.org/mt/87599646/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

