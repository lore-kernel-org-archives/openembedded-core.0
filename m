Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web10.361.1632416465292065415
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Sep 2021 10:01:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HfYIAs5u;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id a14so4543922qvb.6
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Sep 2021 10:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uFZpuTYKC6+Ol/E2DEF2s+uJ///lBAE+GeTH+uT5xW4=;
        b=HfYIAs5uVqFB+5Y7C8B69ielRY1ZE2NbE2GD7nKPC29Ipri7DnfqWqX/qZ7ttuNgCI
         E0BoSRamWxUG/WZO2rJen5wXx+RgSjxs5sbYyFkXspU2hFcG30/2WfUTOsIvoPUeIHpn
         nWj89zbhY2H7ZrkGWp3J653295iSzM5xosIujgfRhWxsLIyRp/itEfNE8lMsnboDJF4L
         WXuyC1NybqYvnzcC0yvE2pB0SXm1sneP9/27OvhxxawHM3Br4l8MlZfG2+ItjFSosx47
         PFaUyDDn2PDozEwxkBb5BfdJpps2bD3qzppxzqT9JqXw1YLxJs0P3LdhNTQQ0unbjFLn
         RN8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uFZpuTYKC6+Ol/E2DEF2s+uJ///lBAE+GeTH+uT5xW4=;
        b=If7DRh/AuS3iESgsqU0Gg6yDg5tMFgwxFQa/VhaYdCV1qOQczhx02irChniYZsYs8d
         lkGVgR7T5O176hB4Q8dP1oUq8xE7S2gDIyIbfxWeNrpVsJXVr05rrgmh6MOjboOX7OfA
         EXe9LGrHXs6ovk1sqBiiWUqMx9K4xIIXD5ggvC4lCwVF2SeqXwg0NXAqONI2h6pDOgWN
         gaKXj2wJ9bbxqijbVVhIQSIVUreyJ9yq2skiqhaeVSyHF35yXvo6aUHxHlEvIVYbAjcU
         HOL4lZaobkKIitj6LHPQTnHzokypjWr2IRVtC3VclrA5i6I+394BEmXXp+GIYCX6jWRr
         Kbjw==
X-Gm-Message-State: AOAM531ljARvgsDOWr5ZHwoOcZYQH/vozsyinVBZo9AD0hmLd37O5W/p
	7SvV9oaB+auJw1iMY6Fb8KQ5VuAwsKsGicYTm9I=
X-Google-Smtp-Source: ABdhPJzjvkZliT0kUUmXndJucGgjIE0vi3L6I2t19/laF+y4mipJ2ZLDd8pfCtDeCnDKeNkuAgZxMgWSmk6NcsNaDwY=
X-Received: by 2002:a0c:8061:: with SMTP id 88mr5544399qva.5.1632416464325;
 Thu, 23 Sep 2021 10:01:04 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1632332981.git.bruce.ashfield@gmail.com> <c3ed9c094566be74c852af8bc58212c3d7d612e3.1632332981.git.bruce.ashfield@gmail.com>
In-Reply-To: <c3ed9c094566be74c852af8bc58212c3d7d612e3.1632332981.git.bruce.ashfield@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 23 Sep 2021 10:00:38 -0700
Message-ID: <CAMKF1srUCZRhBh0N1Gnb3yp2+-h8t+0WXLHRw10BmBEEjSvrjQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/5] conf/machine: bump qemu preferred versions to 5.14
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

5.14 does break fio and bvoxdrivers recipes, and upgrade of fio took
care of build issues but vboxdrivers still needs fixing.

see
https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1564

On Wed, Sep 22, 2021 at 10:54 AM Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
>
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> 5.14 is the latest reference kernel, so let's make it the
> default.
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  meta/conf/machine/include/x86/x86-base.inc | 2 +-
>  meta/conf/machine/qemuarmv5.conf           | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/conf/machine/include/x86/x86-base.inc b/meta/conf/machine/include/x86/x86-base.inc
> index 958b3490e8..44e4b4ec46 100644
> --- a/meta/conf/machine/include/x86/x86-base.inc
> +++ b/meta/conf/machine/include/x86/x86-base.inc
> @@ -18,7 +18,7 @@ SERIAL_CONSOLES ?= "115200;ttyS0"
>  # kernel-related variables
>  #
>  PREFERRED_PROVIDER_virtual/kernel ??= "linux-yocto"
> -PREFERRED_VERSION_linux-yocto ??= "5.13%"
> +PREFERRED_VERSION_linux-yocto ??= "5.14%"
>
>  #
>  # XSERVER subcomponents, used to build the XSERVER variable
> diff --git a/meta/conf/machine/qemuarmv5.conf b/meta/conf/machine/qemuarmv5.conf
> index 252d6286d8..3c2c4997b9 100644
> --- a/meta/conf/machine/qemuarmv5.conf
> +++ b/meta/conf/machine/qemuarmv5.conf
> @@ -15,7 +15,7 @@ QB_MACHINE = "-machine versatilepb"
>  QB_KERNEL_CMDLINE_APPEND = "vmalloc=256"
>  QB_GRAPHICS = "-device virtio-gpu-pci"
>  QB_OPT_APPEND = "-device qemu-xhci -device usb-tablet -device usb-kbd"
> -PREFERRED_VERSION_linux-yocto ??= "5.13%"
> +PREFERRED_VERSION_linux-yocto ??= "5.14%"
>  QB_DTB = "${@oe.utils.version_less_or_equal('PREFERRED_VERSION_linux-yocto', '4.7', '', 'zImage-versatile-pb.dtb', d)}"
>
>  KMACHINE:qemuarmv5 = "qemuarm"
> --
> 2.19.1
>
>
> 
>
