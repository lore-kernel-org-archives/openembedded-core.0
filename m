Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9989CC4345F
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 08:48:15 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.11791.1713948485328825466
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Apr 2024 01:48:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OaOtdFuh;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d9fe2b37acso89153991fa.2
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 01:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713948483; x=1714553283; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iiiqUdq+/XgHOPKluhVPQ8q8IBnH9Al6g8nM0jJpkIs=;
        b=OaOtdFuhnAQcbBbtUSkM5XQ+rFjw7CRZzFDcFo7OruU2hYb50aJ+5zyU+Pvm18Q8HJ
         PwaTeJ+2hOvIJx0KSgAeQDXpOVQuoNeWTcJxLpX58zaXlNMp8QwH9AVgsKzOr0rtO7o/
         cfvA0UBvGjXD1Zn8R/SBg3z7tPHJlebBllqj+IZzpSai/RCTqI2wnMcBq3oFuIKBoHvu
         4FzByKoXmGEf6QeOSVxuIJSVuz9atY+if15SA1HtxD1uoqpZgQx5ttJeWkM5GltWMHHg
         rGsb3SCJygNRKH5mA8utx4f2zrwea1lEEx/ZGLLtYriYutwfyFuAMhuQ1N03vophmpmE
         ElvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713948483; x=1714553283;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iiiqUdq+/XgHOPKluhVPQ8q8IBnH9Al6g8nM0jJpkIs=;
        b=Y5EZG0L65zC786vT7vOhKWOPMlFMToEl92ebwU6JG9xjSJ6DXXj1FVJ+nAw3Y7EvaJ
         WQGsTO7caq+/d5ipC5qIv5C2ydp9JPoMdhiwzqlKnSSPohyjUF2tHU5QrHM2QC8WkdJ8
         3IQKJSfDdzOJVDFYSdwGGhyrWj6b1nyoWZtI3S/3oBPFG9b3vo/Yg5oCR4cmea8AaZK5
         dlmqmeFln/9Kr4DNwuTtBNdihRyhEPCzcRNd0wCKVy870+oWRIPRN3UM2T6enKOaASvF
         7otjLRpLN5lATfD79AHIA5AwQ9NKaU8RX1OOQ8GzjQ1Drv8fbOlf5dghm9HPFGXANclX
         sZoQ==
X-Gm-Message-State: AOJu0YwokCz6L2uwpNhaCFR8rl5Tbh/Kj4thMgUOBlWl0T59F4d1dRwP
	T5XNiMh0bx3TypnPCekc2nDwZ329x9xzHgks7/Inn4XkL/COhko5+33k7f9t0ne/MOQzBd+sME0
	v1lYslzTfO8iT7SKLP/PDT+UuFKY=
X-Google-Smtp-Source: AGHT+IGkBVGqjVNvB/Aaze5N7ie+0Dgvss0fKoAAYmtPfF1xmf1B4bW4Nz1Rw3z2yNkpzF1ZM43DaK67Kh2fQABc3fA=
X-Received: by 2002:a2e:9a88:0:b0:2d8:da4c:5909 with SMTP id
 p8-20020a2e9a88000000b002d8da4c5909mr960235lji.51.1713948483384; Wed, 24 Apr
 2024 01:48:03 -0700 (PDT)
MIME-Version: 1.0
References: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com> <1713948152-13501-16-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1713948152-13501-16-git-send-email-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 24 Apr 2024 10:47:52 +0200
Message-ID: <CANNYZj_57PSs-q-fuL_fa_S9zXwMdzYKnscc7rAsQ8mJQY7=kA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 16/38] mesa: upgrade 24.0.3 -> 24.0.5
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 08:48:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198684

mesa-gl recipe should be included here.

I wonder if we should just move PV into mesa.inc and away from
filenames, so that mesa can be updated without this friction (perhaps
even by AUH).

Alex

On Wed, 24 Apr 2024 at 10:43, wangmy via lists.openembedded.org
<wangmy=fujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
>  https://docs.mesa3d.org/relnotes/24.0.5.html
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta/recipes-graphics/mesa/mesa.inc                           | 2 +-
>  meta/recipes-graphics/mesa/{mesa_24.0.3.bb => mesa_24.0.5.bb} | 0
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-graphics/mesa/{mesa_24.0.3.bb => mesa_24.0.5.bb} (100%)
>
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index 1c9fa66c72..77e9c80fcb 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -22,7 +22,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
>             file://0001-Revert-meson-do-not-pull-in-clc-for-clover.patch \
>  "
>
> -SRC_URI[sha256sum] = "77aec9a2a37b7d3596ea1640b3cc53d0b5d9b3b52abed89de07e3717e91bfdbe"
> +SRC_URI[sha256sum] = "38cc245ca8faa3c69da6d2687f8906377001f63365348a62cc6f7fafb1e8c018"
>
>  UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
>
> diff --git a/meta/recipes-graphics/mesa/mesa_24.0.3.bb b/meta/recipes-graphics/mesa/mesa_24.0.5.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa_24.0.3.bb
> rename to meta/recipes-graphics/mesa/mesa_24.0.5.bb
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198661): https://lists.openembedded.org/g/openembedded-core/message/198661
> Mute This Topic: https://lists.openembedded.org/mt/105706672/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

