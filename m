Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
 by mx.groups.io with SMTP id smtpd.web11.8839.1620712741373647271
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 22:59:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nFZEfuXY;
 spf=pass (domain: gmail.com, ip: 209.85.166.170, mailfrom: alistair23@gmail.com)
Received: by mail-il1-f170.google.com with SMTP id v13so16178920ilj.8
        for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 22:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Cqnhk4gnnP56Dm7NEsc6gkAsq22Imy2Mc8OIx4H2CD0=;
        b=nFZEfuXY81/RrfQZF16bAI5WSKywDHcmc0BdeRDe+qsG849kQG87BOxmRpBDP6SmvP
         OOAVZYoCiyCKxry15Fp/DikgTmFRYCIEbDq/V19iUt+Slf4zjnBIBb/Q30Nuea4HpZnO
         E/10cZqE20ZYL9RTsPLZFg0EEMLD7jJFzk1VqCfhfUIJisXSwxu2rHLxrV4YHw7zc0Ih
         abJwIgC0NYHcZ7YV2S0qXJkEgNACimZ3uMt5YtorRyQ36xGLnBPK6PSjp3U2s5n4h7X/
         Xhb4OtqnG8MjaED24bPQzB4uEltoQx7uqhGpyR2D/lOhRLtqh+/xYrdt8VST0Gp05xGF
         2pmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Cqnhk4gnnP56Dm7NEsc6gkAsq22Imy2Mc8OIx4H2CD0=;
        b=nuTLqKV/WJa10fcol9CYSTvFlIyone6p1jMiZMCFzmSQQX3+6m6AceFElgaEk2/ei5
         a//dYCDrgcslG8Ln7XATRMVwftJ+A0iJMT3xNXUOePd293N/XZwOogfIKjxCc+wu/7lZ
         bhGx/XviWGjjHZdy43hQMB2ii1RfsmR4PXw4ExF6jZMtbOtKazP8yo02peOBp7yZ2nXS
         eTd/uV018egUlU9aT6qqD7UkXNbhapJL3d/b2G9uCSI/8VAeZhDpRuWYtoI/7eVNqI9S
         HRVtODMCSvmg/OPpyxs0SkFCDSXnzuNUz3An4m7QvWjPnbo+ILQbTvBdSNG/ONE0LZ04
         UCvA==
X-Gm-Message-State: AOAM533Z0m8TAwaUEWaCSmmzpmEXYvolop+j6vBiq6xZ8jCQoXzDU8dm
	jIUWw/ASHBqJOVBeSzoIjqRxcRg36Zsss+jdfyw=
X-Google-Smtp-Source: ABdhPJyE+z3Rf6fHXiotx8v8TzYUCJw41NqEeQCd9FcJ/zhzGCzcfDfyFhaFPrIfHgcFtlBU3ZE0hq/X2yCXA0x6MXk=
X-Received: by 2002:a05:6e02:eac:: with SMTP id u12mr25317715ilj.177.1620712740677;
 Mon, 10 May 2021 22:59:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210511053134.3353286-1-alejandro@enedino.org>
In-Reply-To: <20210511053134.3353286-1-alejandro@enedino.org>
From: "Alistair Francis" <alistair23@gmail.com>
Date: Tue, 11 May 2021 15:58:34 +1000
Message-ID: <CAKmqyKPPOb6ZdqYnU=5Px6VVa365y-5k0qWgvV7Ot+wjsXUp=A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] baremetal-helloworld: Enable RISC-V 64 port
To: Alejandro Hernandez Samaniego <alejandro@enedino.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, May 11, 2021 at 3:31 PM Alejandro Hernandez Samaniego
<alejandro@enedino.org> wrote:
>
> Add support for MACHINE=qemuriscv64.
>
> $ runqemu nographic
>
> KERNEL: [tmp/deploy/images/qemuriscv64/baremetal-helloworld-image-qemuriscv64.bin]
> MACHINE: [qemuriscv64]
> FSTYPE: [bin]
>
> runqemu - INFO - Running tmp/work/x86_64-linux/qemu-helper-native/1.0-r1/recipe-sysroot-native/usr/bin/qemu-system-riscv64
>
> Hello OpenEmbedded on RISC-V 64!
>
> Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
> ---
>  .../baremetal-examples/baremetal-helloworld_git.bb |  5 +++--
>  meta/classes/baremetal-image.bbclass               | 14 +++++++++++++-
>  2 files changed, 16 insertions(+), 3 deletions(-)
>
> diff --git a/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-helloworld_git.bb b/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-helloworld_git.bb
> index ee945c1ff0..19ef16988f 100644
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
> diff --git a/meta/classes/baremetal-image.bbclass b/meta/classes/baremetal-image.bbclass
> index b0f5e885b5..319b61c7cd 100644
> --- a/meta/classes/baremetal-image.bbclass
> +++ b/meta/classes/baremetal-image.bbclass
> @@ -73,7 +73,19 @@ QB_DEFAULT_KERNEL ?= "${IMAGE_LINK_NAME}.bin"
>  QB_MEM ?= "-m 256"
>  QB_DEFAULT_FSTYPE ?= "bin"
>  QB_DTB ?= ""
> -QB_OPT_APPEND = "-nographic"
> +QB_OPT_APPEND_append = " -nographic"
> +
> +# RISC-V tunes set the BIOS, unset, and instruct QEMU to
> +# ignore the BIOS and boot from -kernel
> +QB_DEFAULT_BIOS_qemuriscv64 = ""
> +QB_OPT_APPEND_append_qemuriscv64 = " -bios none"

Sorry, I forgot to reply to the other thread.

Can't you just set QB_DEFAULT_BIOS to "none"?

Alistair

> +
> +
> +# Use the medium-any code model for the RISC-V 64 bit implementation,
> +# since medlow can only access addresses below 0x80000000 and RAM
> +# starts at 0x80000000 on RISC-V 64
> +CFLAGS_append_qemuriscv64 = " -mcmodel=medany"
> +
>
>  # This next part is necessary to trick the build system into thinking
>  # its building an image recipe so it generates the qemuboot.conf
> --
> 2.25.1
>
>
> 
>
