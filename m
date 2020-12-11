Received: from mail-io1-f67.google.com (mail-io1-f67.google.com [209.85.166.67])
 by mx.groups.io with SMTP id smtpd.web12.9716.1607704496439607462
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Dec 2020 08:34:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hbPHNfsh;
 spf=pass (domain: gmail.com, ip: 209.85.166.67, mailfrom: alistair23@gmail.com)
Received: by mail-io1-f67.google.com with SMTP id n14so10027435iom.10
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Dec 2020 08:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iHFL5wFTjIlwLfMOVTwqdB8ZlfqrIpVRMvyvnE2T4l8=;
        b=hbPHNfshWb0FR9Ho0PocdfRfLF2Q9TKTfN3JRUOsimDz7lPRN9J2H2DfCb46JFVIeQ
         Bkfbek0z1ysRJJBv/NaCscoheCkR0w4GwN0pmZX67YIEqfQk7PLytZMzsgofDVPiJ1Ce
         a255+F/oZuBRjCNEm2yi2Jfbe7JUkfEtkvCOWi0Dsqp7NU1gnLjO0v+7j+hBZ2Cpo3gp
         ESD0irTjnRiizC4DDL9ol4CUn8MIS+eY1B1hiyyDj1EsqqMyQ44aEDmmttus6IsXYxEc
         j31f/N73Lpp5DogDhIhaMQFKd+E27gP7m6r+J6x6hx9H5FPBYIJmehBI2lDNUIE5IBnU
         YSUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iHFL5wFTjIlwLfMOVTwqdB8ZlfqrIpVRMvyvnE2T4l8=;
        b=ZZfUyMff5rNFJx9EDcgtWjJiwA9I+JG7ZfAjdEd5skIY2z9Df/PbqFxf22A5kciPfl
         LXLqID0dsjxKoWfqi7DvsSDkn49eMlOcgvJHLEH3i1qcet5p0owT/ElxFnLSYFfBc49d
         dWNg9IR2sGs4DdlqLSHDWANdHuWNZwVKVUc4wbdU9JE1EUA/fWeEWj9RTE3J0Yt+86Yc
         i7pm7Ron13sGW8raHMx0CePUrZ2k+PSaHxspvpnvA5S3sHZHd2AYBW1aJiHZYYIMqlqx
         01PY8dvj5YpEEnBS3XOItlAcqpKlwGbHw5+LlJ5lr6GYrXCDDACHyrnmp/oufKpTfo+2
         mwew==
X-Gm-Message-State: AOAM530n0oXhPuaj58UkY6z2FkDzBrPNhEjxzwBCKfozax5QK008Grrv
	7NbG1gz/Tp0U9K2GDMFlXM2fEw9S6L0vv6UNUq0=
X-Google-Smtp-Source: ABdhPJyULk+DeJem/+u0frpLPaQCZX9VPScTtNkCiaO05oQDUxcsEaf6JTkTVoy63wOy3ToBpESkyyqoXszWTQwn31E=
X-Received: by 2002:a6b:c994:: with SMTP id z142mr16044154iof.42.1607704495887;
 Fri, 11 Dec 2020 08:34:55 -0800 (PST)
MIME-Version: 1.0
References: <20201211073640.479105-1-anuj.mittal@intel.com>
In-Reply-To: <20201211073640.479105-1-anuj.mittal@intel.com>
From: "Alistair Francis" <alistair23@gmail.com>
Date: Fri, 11 Dec 2020 08:34:29 -0800
Message-ID: <CAKmqyKMpTU8n6mjOeD3qjZztCm5RQNfqUrurBxG5uZa2Hb6zeg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] mesa: add more details to elf-tls patch
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>, 
	Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 10, 2020 at 11:37 PM Anuj Mittal <anuj.mittal@intel.com> wrote:
>
> Include link to upstream report and the last autobuilder failure [1]
> so it's easy to identify why this is needed in future.
>
> [1] https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1160/steps/8/logs/step1c
>
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  .../0002-meson.build-make-TLS-ELF-optional.patch  | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch b/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch
> index 74f7fe5c2d..89c0d150fa 100644
> --- a/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch
> +++ b/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch
> @@ -6,6 +6,21 @@ Subject: [PATCH] meson.build: make TLS ELF optional
>  USE_ELF_TLS has replaced GLX_USE_TLS so this patch is the original "make
>  TLS GLX optional again" patch updated to the latest mesa.
>
> +For details, see:
> +https://gitlab.freedesktop.org/mesa/mesa/-/issues/966
> +
> +This prevents runtime segfault on musl:
> +
> +Traceback (most recent call last):
> +  File "/home/pokybuild/yocto-worker/musl-qemux86/build/meta/lib/oeqa/core/decorator/__init__.py", line 36, in wrapped_f
> +    return func(*args, **kwargs)
> +  File "/home/pokybuild/yocto-worker/musl-qemux86/build/meta/lib/oeqa/runtime/cases/parselogs.py", line 378, in test_parselogs
> +    self.assertEqual(errcount, 0, msg=self.msg)
> +AssertionError: 1 != 0 : Log: /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/qemux86-poky-linux-musl/core-image-sato-sdk/1.0-r0/target_logs/Xorg.0.log
> +-----------------------
> +Central error: [    10.477] (EE) Failed to load /usr/lib/xorg/modules/extensions/libglx.so: Error relocating /usr/lib/libGL.so.1: alphasort: initial-exec TLS resolves to dynamic definition in /usr/lib/libGL.so.1
> +***********************
> +
>  Upstream-Status: Inappropriate [configuration]
>  Signed-off-by: Alistair Francis <alistair@alistair23.me>
>
> --
> 2.29.2
>
>
> 
>
