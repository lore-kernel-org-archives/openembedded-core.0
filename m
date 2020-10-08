Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web11.2151.1602192347881645269
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2020 14:25:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aAC5P9wU;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id c5so6397036qtw.3
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2020 14:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZiBZAwd0J/gx69KVahW3UW+nIJJWZJh6NMEjyyucpsE=;
        b=aAC5P9wUX/wUhD5AshZboGfEDLrotbVbcYSEOrNKc7JmH3LqA/8E7vD7KXvRKr130X
         RnVFwpWGMdUYFaBr5gAhcmViLOUClPAf2gBnKbZ9gdakXFDRiyLtIYZerGBDSwlv5zpG
         f9kfBW5n9StTSmjcf5om4aHtQi35EtXW6ZQnEfq+P6dIXtd2Ukw1kJcN2W3+ZYlUz3MB
         Dn1EGdGfmc1S4rJjnNlqbU1xBX5qIaFMC5u9g+5EdFsDTtPoGxYjrWOQUNpdcTrp6MbA
         6iGekZcYDn2HMAUmy5iDae25Ba205nset6ihvr2NWXF5KOQm6YLQpMPRL8uJ3bp6vei/
         /GSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZiBZAwd0J/gx69KVahW3UW+nIJJWZJh6NMEjyyucpsE=;
        b=AXcH2st8MQOvQpyq8hrR1An0jSf0LULqmdjcovcCwEiEk1IBVctSmfZ0tiXXk4edf1
         iqW+Mj7LFjnGY2wPonmTlzcG0y5gCq0n8O3n+Bz2zA4+e4DanHFCJHUzi7auQV45elkE
         n6KJWI06mSyAgO0e+glEy7x7WKlmIK7cQZMhPHZbB2afcQsIwRrc46pZAu8SZrcS1x93
         XCYtLwunPJVMciln9UlaaE5bGkRL/vpgWHvRyseJFXvg89S1Zx75tX0JO1xotmo6b5Na
         jZJaUwDaUoV5fnR8ZE2jooDIYkM6K03IK97hl4lXtLa2xbYdGwSF6OLe3VzNQP5uVymK
         DuTw==
X-Gm-Message-State: AOAM530vME1KewfXRmA7MaGo59MccjK94Z/CdMllw4JzzG2VFsLaXBtJ
	fcZ9tNyvL4zZqSRMLNmL7DjYEvjA7mxXGbd99bXgl+9u4K3IQw==
X-Google-Smtp-Source: ABdhPJzJLCP01PAAPNP2KCI3KTcG7WAFMnkap+8zd5yk2yv/zVQktBgWSJPX61ezy9oLblYCiI51+JSUUYoGCaNvjeM=
X-Received: by 2002:ac8:1b77:: with SMTP id p52mr4237719qtk.88.1602192346910;
 Thu, 08 Oct 2020 14:25:46 -0700 (PDT)
MIME-Version: 1.0
References: <aNp1.1602154243596831287.CumO@lists.openembedded.org>
In-Reply-To: <aNp1.1602154243596831287.CumO@lists.openembedded.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 8 Oct 2020 14:25:21 -0700
Message-ID: <CAMKF1sqOCr0Mw-BPndBU9aWpGRhV0_yUeBPyJNO37kpi7t1aoA@mail.gmail.com>
Subject: Re: [OE-core] Subject: [PATCHv2] qemuboot: change QB_MEM default strengths
To: Brett Warren <brett.warren@arm.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 8, 2020 at 3:53 AM Brett Warren <brett.warren@arm.com> wrote:
>
> Previously, to satisfy opengl's requirement for at least 512MB
> of memory, QB_MEM was overriden by core-image-sato. This made it
> impossible for machine configurations to specify their own values,
> so this was changed to a default asssignment. To accomodate this,
> qemuboot's default assignment of QB_MEM was changed to the week

typo s/the week/be weak/

> variant.
>
> Signed-off-by: Brett Warren <brett.warren@arm.com>
> ---
>  meta/classes/qemuboot.bbclass               | 2 +-
>  meta/recipes-sato/images/core-image-sato.bb | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
> index d8f62ef6ea..8e4ee9e49b 100644
> --- a/meta/classes/qemuboot.bbclass
> +++ b/meta/classes/qemuboot.bbclass
> @@ -73,7 +73,7 @@
>  # IMAGE_CLASSES += "qemuboot"
>  # See "runqemu help" for more info
>
> -QB_MEM ?= "-m 256"
> +QB_MEM ??= "-m 256"
>  QB_SERIAL_OPT ?= "-serial mon:stdio -serial null"
>  QB_DEFAULT_KERNEL ?= "${KERNEL_IMAGETYPE}"
>  QB_DEFAULT_FSTYPE ?= "ext4"
> diff --git a/meta/recipes-sato/images/core-image-sato.bb b/meta/recipes-sato/images/core-image-sato.bb
> index 673106eb6d..ec5e2e20fc 100644
> --- a/meta/recipes-sato/images/core-image-sato.bb
> +++ b/meta/recipes-sato/images/core-image-sato.bb
> @@ -11,5 +11,5 @@ inherit core-image
>  TOOLCHAIN_HOST_TASK_append = " nativesdk-intltool nativesdk-glib-2.0"
>  TOOLCHAIN_HOST_TASK_remove_task-populate-sdk-ext = " nativesdk-intltool nativesdk-glib-2.0"
>
> -QB_MEM = '${@bb.utils.contains("DISTRO_FEATURES", "opengl", "-m 512", "-m 256", d)}'
> +QB_MEM ?= '${@bb.utils.contains("DISTRO_FEATURES", "opengl", "-m 512", "-m 256", d)}'
>  QB_MEM_qemumips = "-m 256"

Ideally, it should check for minimum required memory it needs and
offset it only if passed value is lower and accept any higher value
coming from environment
what happens if you set

QB_MEM_<machine> = "xxx" in machine conf or local.conf does it still
overwrite that here ?

> --
> 2.17.1
> 
>
