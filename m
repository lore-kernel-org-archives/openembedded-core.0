Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
 by mx.groups.io with SMTP id smtpd.web08.7873.1628415165359277507
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Aug 2021 02:32:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZF0ViJ4l;
 spf=pass (domain: gmail.com, ip: 209.85.166.41, mailfrom: alistair23@gmail.com)
Received: by mail-io1-f41.google.com with SMTP id h1so22015235iol.9
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Aug 2021 02:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+hiGKeoJSS2rvMAvaaGk2vlPrupxIL8PLcquAaN/+rM=;
        b=ZF0ViJ4lVmPPXv1sa1pu0GgYgEh0frBKW4DRl3O54+9EC3fhZHrpKNUAJkXZKuK4LK
         BmsYdmtRkPYk/NXZ5i74WjwSCIOtnjtqNAqMcSfpa9kz9JFjvHjEmA4L56Armo4d1CrC
         /73mFhjMdlHGZZP5Dqo9fyMmiAqCQnR6a2wnWAuwLhXRB7xLQ2S4Ep9YV3gtVHfj+EEd
         x3UHMaaT3pbtZY6ZXTRLhaS5Tr8/FqwRxFMM0B1lJdZoTrDeL7O1i6eWR66x6w9YTEaV
         Rjy05dedoUV8JRkqeOghF81faO6Wp3gy3rJe6oxz49ooAIduSLtfv7hK6dK9paAkjtsn
         AdSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+hiGKeoJSS2rvMAvaaGk2vlPrupxIL8PLcquAaN/+rM=;
        b=XlYDI8Sjc0yL5dH8BC8qoK2jWXgU6wU00AvxzF1SnjLjtEdWGbT4hsmznIkU8WjZgp
         v1Mvxf+dWwiBYP7UPdLh4UidvgeJM9xKdggIMCYonO4SRP62M5qjf2IdmpmtTErcBt/h
         ZGffyQ1KKc17wtkBLmq5aClTNSwHIgK62MIXIcy+x3eDthnZCVbyRAHx0acth4tKiE1X
         ctVrh1P6Iw8g+Q8nAGnuAHl67ycJYY3eyTyLn3uyTuHX8+WX1x3/HCvzsKR3vXScKVCA
         octv4uAep3kRfQXWPPbPx4zDWxz2IWFEEpVbG9ZCcw2vZOD0u4c0rSWheR8Nm7KUWVhf
         mmvQ==
X-Gm-Message-State: AOAM530xpfJarKjWrPalU+64BZu7kURHhEo1l0Y2k757kjmlWualeRty
	xL5H42CFIOix0guELXH0tBDiYTqUuwSgjn4HgSk=
X-Google-Smtp-Source: ABdhPJxnYIjqYiBnk5tRQTU22lJ3VSUnAVJJRH83KblzVHq5jDoRXpuJle1PgUVyBZX3+MDcQJ8YJYUa4ITNWOLdmkE=
X-Received: by 2002:a05:6638:240d:: with SMTP id z13mr3638573jat.8.1628415164694;
 Sun, 08 Aug 2021 02:32:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210808041451.1319775-1-alejandro@enedino.org>
In-Reply-To: <20210808041451.1319775-1-alejandro@enedino.org>
From: "Alistair Francis" <alistair23@gmail.com>
Date: Sun, 8 Aug 2021 19:32:18 +1000
Message-ID: <CAKmqyKPRJjM9mXrjVYSDY6XrHUSxSb8eYHDg-0wa=Piw0RBjog@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] baremetal-helloworld: Enable RISC-V 32 port
To: Alejandro Hernandez Samaniego <alejandro@enedino.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Aug 8, 2021 at 2:15 PM Alejandro Hernandez Samaniego
<alejandro@enedino.org> wrote:
>
> $ runqemu nographic
> runqemu - INFO - Running bitbake -e ...
> KERNEL: [tmp/deploy/images/qemuriscv32/baremetal-helloworld-image-qemuriscv32.bin]
> MACHINE: [qemuriscv32]
> runqemu - INFO - Running tmp/work/x86_64-linux/qemu-helper-native/1.0-r1/recipe-sysroot-native/usr/bin/qemu-system-riscv32
>
> Hello OpenEmbedded on RISC-V 32!
>
> Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  .../baremetal-examples/baremetal-helloworld_git.bb           | 5 +++--
>  meta/classes/baremetal-image.bbclass                         | 3 +++
>  2 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-helloworld_git.bb b/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-helloworld_git.bb
> index 37193f5a33..d11e2e530e 100644
> --- a/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-helloworld_git.bb
> +++ b/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-helloworld_git.bb
> @@ -4,7 +4,7 @@ DESCRIPTION = "These are introductory examples to showcase the use of QEMU to ru
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=39346640a23c701e4f459e05f56f4449"
>
> -SRCREV = "0bf9ea216e6f76be50726a3a74e527b7bbb0ad93"
> +SRCREV = "31b4e5a337018b4a00a7426b0e5ed83b81df30c7"
>  PV = "0.1+git${SRCPV}"
>
>  SRC_URI = "git://github.com/aehs29/baremetal-helloqemu.git;protocol=https;branch=master"
> @@ -28,13 +28,14 @@ inherit baremetal-image
>  # machine that QEMU uses on OE, e.g. -machine virt -cpu cortex-a57
>  # but the examples can also be run on other architectures/machines
>  # such as vexpress-a15 by overriding the setting on the machine.conf
> -COMPATIBLE_MACHINE = "qemuarmv5|qemuarm|qemuarm64|qemuriscv64"
> +COMPATIBLE_MACHINE = "qemuarmv5|qemuarm|qemuarm64|qemuriscv64|qemuriscv32"
>
>  BAREMETAL_QEMUARCH ?= ""
>  BAREMETAL_QEMUARCH:qemuarmv5 = "versatile"
>  BAREMETAL_QEMUARCH:qemuarm = "arm"
>  BAREMETAL_QEMUARCH:qemuarm64 = "aarch64"
>  BAREMETAL_QEMUARCH:qemuriscv64 = "riscv64"
> +BAREMETAL_QEMUARCH:qemuriscv32 = "riscv32"
>
>  EXTRA_OEMAKE:append = " QEMUARCH=${BAREMETAL_QEMUARCH} V=1"
>
> diff --git a/meta/classes/baremetal-image.bbclass b/meta/classes/baremetal-image.bbclass
> index 9ec3f1460b..089c445522 100644
> --- a/meta/classes/baremetal-image.bbclass
> +++ b/meta/classes/baremetal-image.bbclass
> @@ -82,12 +82,15 @@ QB_OPT_APPEND:append = " -nographic"
>  # RISC-V tunes set the BIOS, unset, and instruct QEMU to
>  # ignore the BIOS and boot from -kernel
>  QB_DEFAULT_BIOS:qemuriscv64 = ""
> +QB_DEFAULT_BIOS:qemuriscv32 = ""
>  QB_OPT_APPEND:append:qemuriscv64 = " -bios none"
> +QB_OPT_APPEND:append:qemuriscv32 = " -bios none"
>
>
>  # Use the medium-any code model for the RISC-V 64 bit implementation,
>  # since medlow can only access addresses below 0x80000000 and RAM
>  # starts at 0x80000000 on RISC-V 64
> +# Keep RISC-V 32 using -mcmodel=medlow (symbols lie between -2GB:2GB)
>  CFLAGS:append:qemuriscv64 = " -mcmodel=medany"
>
>
> --
> 2.25.1
>
>
> 
>
