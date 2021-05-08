Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web11.8275.1620490596284016123
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 May 2021 09:16:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=X94cxeJq;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id a2so11553620qkh.11
        for <openembedded-core@lists.openembedded.org>; Sat, 08 May 2021 09:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1qu70W30qEUl5pdfH+B2vkdyU2xgPBYoDfnn5EbvXm0=;
        b=X94cxeJqjABLr+uH/gHi2FFb66gy0eDb/XKSKse0QbQME7i3dqkuH1hwQw9cGy8xkA
         kpYnvverYazHlXmNigux0RGb6lfx0UERTJ6D66wBP92ENRsdnAsIod97EdfDDslUxTA7
         OeshU8IPR5GhWSJt5iBit+AyAmZrI79IUzCVfH3CYQsNn+Q5XQkHT52YOwPW7g4q2Xso
         hQrah1DRAOH62ZvmIyUkxl9I6Tw91jQ9aussFDt6U1Tk1nFOVmH5QzcF/rp5dQ1D6u+W
         Mkjw1s4Ph1trL8I5PNIaLM5b3r0LydyC8Lr3+jhNtNNhldTZbwLHzGMrifSv4FNcBd8n
         dhIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1qu70W30qEUl5pdfH+B2vkdyU2xgPBYoDfnn5EbvXm0=;
        b=m0Rv6Ne6Iy/4F5KfXfaAR4Nujlz7EgPwsXkRy50b30EuVM4yO/OqVzhHO3wPzKVuUQ
         ksZYn5Zu6ElEccOalFuyqFrg5TiRJXxBtt2SevQm28Yks2l+jLHFck2CeCAzp6ZRgnj1
         sb1Gt7yEcThmYaujf5N4yRsc0sHMTjpIFW69qAAUUlZIpz5MZHZz+hAA3jcGwq98uT79
         ihTiuoBrpz035M8LmI7dVZc7I5dSGboAjr5MGjIY58mk8Y4imOSaTpcQNOwkIIr0WTMw
         Dmj9AorxNtjEf0ca8zeaKeXYT/khoyuKqCPfqjryR5cCuVeOsqAbo4gO2/fqN/W3gTig
         bFRQ==
X-Gm-Message-State: AOAM532+Uxvb3ll5dcm5IqAYHEQiSG61Ws9SATX84oT8/WgRYXHypt4Q
	bPzwpNFXEivwT7PSCb/iz/B0sz5+QQgxXgsioRo=
X-Google-Smtp-Source: ABdhPJzYLQz/MqjeOqfL2C2Kie5YKDKWp/Y0097lJNVqAX6emnDY5+8oB0aOQxuhVf1DoiLnPtmDS4HwFqMoyhSGhUA=
X-Received: by 2002:a05:620a:9c8:: with SMTP id y8mr15033366qky.125.1620490595346;
 Sat, 08 May 2021 09:16:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210508083031.1448886-1-alejandro@enedino.org>
In-Reply-To: <20210508083031.1448886-1-alejandro@enedino.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 8 May 2021 09:16:08 -0700
Message-ID: <CAMKF1spzTGhbLjcx6sW_J51ADSDRFj3sPfnb6wa=VUqam_0H+g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] baremetal-helloworld: Enable RISC-V 64 port
To: Alejandro Hernandez Samaniego <alejandro@enedino.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, May 8, 2021 at 1:30 AM Alejandro Hernandez Samaniego
<alejandro@enedino.org> wrote:
>
> Add support for MACHINE=qemuriscv64.
>
> $ runqemu nographic
>
> BIOS: [tmp/deploy/images/qemuriscv64/baremetal-helloworld-image-qemuriscv64.elf]
> MACHINE: [qemuriscv64]
>
> runqemu - INFO - Running tmp/work/x86_64-linux/qemu-helper-native/1.0-r1/recipe-sysroot-native/usr/bin/qemu-system-riscv64
>
> Hello OpenEmbedded on RISC-V 64!
>
> Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
> ---
>  .../baremetal-examples/baremetal-helloworld_git.bb   | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-helloworld_git.bb b/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-helloworld_git.bb
> index ee945c1ff0..3b7b8193a7 100644
> --- a/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-helloworld_git.bb
> +++ b/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-helloworld_git.bb
> @@ -4,7 +4,7 @@ DESCRIPTION = "These are introductory examples to showcase the use of QEMU to ru
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=39346640a23c701e4f459e05f56f4449"
>
> -SRCREV = "99f4fa4a3b266b42b52af302610b0f4f429ba5e3"
> +SRCREV = "0bf9ea216e6f76be50726a3a74e527b7bbb0ad93"
>  PV = "0.1+git${SRCPV}"
>
>  SRC_URI = "git://github.com/aehs29/baremetal-helloqemu.git;protocol=https;branch=master"
> @@ -28,12 +28,13 @@ inherit baremetal-image
>  # machine that QEMU uses on OE, e.g. -machine virt -cpu cortex-a57
>  # but the examples can also be run on other architectures/machines
>  # such as vexpress-a15 by overriding the setting on the machine.conf
> -COMPATIBLE_MACHINE = "qemuarmv5|qemuarm|qemuarm64"
> +COMPATIBLE_MACHINE = "qemuarmv5|qemuarm|qemuarm64|qemuriscv64"
>
>  BAREMETAL_QEMUARCH ?= ""
>  BAREMETAL_QEMUARCH_qemuarmv5 = "versatile"
>  BAREMETAL_QEMUARCH_qemuarm = "arm"
>  BAREMETAL_QEMUARCH_qemuarm64 = "aarch64"
> +BAREMETAL_QEMUARCH_qemuriscv64 = "riscv64"
>
>  EXTRA_OEMAKE_append = " QEMUARCH=${BAREMETAL_QEMUARCH} V=1"
>
> @@ -49,3 +50,10 @@ FILES_${PN} += " \
>      ${base_libdir}/firmware/${BAREMETAL_BINNAME}.bin \
>      ${base_libdir}/firmware/${BAREMETAL_BINNAME}.elf \
>  "
> +
> +# RISC-V tunes set the BIOS, redefine since runqemu jumps there
> +QB_DEFAULT_BIOS_qemuriscv64 = "${IMAGE_LINK_NAME}.elf"
> +
> +# Use the medium-any code model for the RISC-V 64 bit implementation,
> +# since medlow can only access addresses below 0x80000000
> +CFLAGS_append_qemuriscv64 = " -mcmodel=medany"

I would have thought medlow would be appropriate for baremetal apps.
Since this is a sample app
we should try to use good defaults as it will serve as template.
having no access below 0x80000000
should not be such a hard limitation or is it so ?

> --
> 2.25.1
>
>
> 
>
