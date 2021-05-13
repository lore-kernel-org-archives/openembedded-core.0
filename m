Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
 by mx.groups.io with SMTP id smtpd.web09.6357.1620864491503434407
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 17:08:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CyhZBqhN;
 spf=pass (domain: gmail.com, ip: 209.85.166.171, mailfrom: alistair23@gmail.com)
Received: by mail-il1-f171.google.com with SMTP id s9so4412787ilp.9
        for <openembedded-core@lists.openembedded.org>; Wed, 12 May 2021 17:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BELIt4uOttq6cS+8FmdOS2trDkK2K9zRQlva8gxdf6c=;
        b=CyhZBqhNw7TD+ZF7waL86/3Soj71aTykzqgUpRsbB9B63keBgKjchHo1aGop6DbRVH
         iRwYBvLd/ASK0gL7PETeCs3pr3cZ5McQH8oY6D5J51imKkrTp44AJ/lg4+hIySSAy7l7
         ES9GW9cTmKBPd3/wIDYweXiWJecmYXKeN9DKMg7UDIWtY+EdILFZs7nu9du6/cBVPwyv
         psFBPjInDBAqMGMUTqQqxyQc74cSsYMlUYC3dyPvdyuRVwrtoBTUUPUs58d6GR99xvMk
         7cEKdtmD2cMYgkREYqLQKkBNCCzMvKJh70xYCuIxfnUTrUr4ItE0q8Gx5xd14a8Ej5s+
         z8Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BELIt4uOttq6cS+8FmdOS2trDkK2K9zRQlva8gxdf6c=;
        b=Q5qAsb4uXe1OhFKz3kI9q24m4vDHk9hHvPGelfu10J/Ag8/Hfkibl093IX/yHd29hM
         dYB7075BIv3jkjXczpaUczkhqLgBQrjde8k3XNrU0YD0mGsTLVJQWPRwcUFRvUGftlcB
         u0qxaSA0BGgZpRDyLp0jbbcyajgMpWjEmOp6C7dBzSwiRPbVCVDyNzJztUGWcWrYKN4K
         NewT5tG55N3lvvszNS2z61oeEvan16Z2rtG3RX9b7AwR3AJg2f4w/SLHDD9wxupgqo5S
         xTV5Tnp3UEc2EfIyEVdaLhgx6cHeQdc6S979BJIS+52N8ARrXz2jIgoejoU2Cd5a+qBU
         Bubg==
X-Gm-Message-State: AOAM533vqk20yP2THXRXK2ME3fkm1LIYACsP6XhEfH2IUNRBd0Pu/Bkd
	1ejhUbsj384IOOWUZ2HUnbdgVcGkDOHRx4LHTMc=
X-Google-Smtp-Source: ABdhPJyqD4AER5/IfszEXPXvqx+veXFq668yZEM3RN/jJeSDG4rEOxh4QSH9LIIuYgv8zUOrJgjRZzB4f6pv/BIdIN4=
X-Received: by 2002:a05:6e02:eac:: with SMTP id u12mr34030999ilj.177.1620864490846;
 Wed, 12 May 2021 17:08:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210511053134.3353286-1-alejandro@enedino.org>
In-Reply-To: <20210511053134.3353286-1-alejandro@enedino.org>
From: "Alistair Francis" <alistair23@gmail.com>
Date: Thu, 13 May 2021 10:07:44 +1000
Message-ID: <CAKmqyKMsRa8rU6==FVK7JXHxqUf8fDt_vJL=SODFmc3Mdfdzwg@mail.gmail.com>
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

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

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
