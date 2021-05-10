Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web08.26033.1620609938438497536
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 May 2021 18:25:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RvRo6Zrk;
 spf=pass (domain: gmail.com, ip: 209.85.166.51, mailfrom: alistair23@gmail.com)
Received: by mail-io1-f51.google.com with SMTP id p11so13231573iob.9
        for <openembedded-core@lists.openembedded.org>; Sun, 09 May 2021 18:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XJ86lurT2YAZ65IetDnLeEobmYOz0F1ZbqBVq3IagPk=;
        b=RvRo6ZrkyzBdwM8wTSUByRWRYACwOmXcDKCWWtjHNM73UdLuseilg7Gr740UT/BoSP
         tCLtCq1NagfOH2wrXcSDjxsYWKxp/4nKOMAi/If+IEEKxd/1QUCjgmr0Dqelkavv8KBu
         gNmVoZuw7dWXaubr2qHXUoircA71KIg5V26oNdOsJE11HrtuJGhov+StlvkuNSMZonBq
         c3n5dQpr8kHJT/4MF8z7/QL2E61I0P1hYcfWyNDjR7fweBrlTWR1Z7GW1wCyDnuNc1nN
         yLe1moRcObVv36jE/vsSMo1jzE+pg3BPNeD9tYNpURDdC70vLdr24NDfCfZsWDr2gav0
         4a4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XJ86lurT2YAZ65IetDnLeEobmYOz0F1ZbqBVq3IagPk=;
        b=LlH1qq5lozqBhvr+yCdkpdWCKC+C55ZCyxf0CGMODZRnZIO3diTSrIuNuwcHBgDU/H
         snI2Kx9n4Tj6KaPL08aretC0nHq2exa8SnS2ZhYntgd9/LRlHneTHPpk8gFkhaR4sh5g
         xLQQ/DL70khgAA2HjM02XDU9V8ai0uRfw+jlCO2F5Xld7AF8cU5rxMsoCa6z/EgYBH0Y
         5Z/9oVcoHsFLqEwk7R48IU2XGhPhh/Ho7YjpaQojnwV1C9k1niNUzpJQONxidptACBI0
         RzRToL6PgeZGpUAvi/A227z5ciBC3xF95MnkEyysmbj7TP3onI3dKeYj7CYFD72rSKkM
         gm7Q==
X-Gm-Message-State: AOAM5321e+Ea6Xla6agb+NIbAQV0iUFhYtFtpghBx5BCbT/bEBepfBHL
	rw1NTsqcaMJ5mpBR53ce/ICL+FHNYmitm+NAR00=
X-Google-Smtp-Source: ABdhPJy3M/vGG81zdRkSgBO5nRf2R2jNafrpgx9jPq+ljlTcnl15gH76mX7BDWWtphPm6tKunzoUJ8k7wz7YmYhcGVc=
X-Received: by 2002:a5d:944e:: with SMTP id x14mr16509928ior.175.1620609937763;
 Sun, 09 May 2021 18:25:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210508083031.1448886-1-alejandro@enedino.org>
In-Reply-To: <20210508083031.1448886-1-alejandro@enedino.org>
From: "Alistair Francis" <alistair23@gmail.com>
Date: Mon, 10 May 2021 11:25:08 +1000
Message-ID: <CAKmqyKNVQQf6fsKaHT=_T_5GFOnNytqaXoisYQ7eDiFLK_1N5A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] baremetal-helloworld: Enable RISC-V 64 port
To: Alejandro Hernandez Samaniego <alejandro@enedino.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, May 8, 2021 at 6:30 PM Alejandro Hernandez Samaniego
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

You should also just be able to say `-bios none` and then use the
-kernel argument as normal.

Alistair

> +
> +# Use the medium-any code model for the RISC-V 64 bit implementation,
> +# since medlow can only access addresses below 0x80000000
> +CFLAGS_append_qemuriscv64 = " -mcmodel=medany"
> --
> 2.25.1
>
>
> 
>
