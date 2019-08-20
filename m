Return-Path: <alistair23@gmail.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 537507EA36
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2019 21:48:06 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id h15so170240ljg.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2019 14:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dZRrtbZJ9voPqzRWWW0wO6+4TNweFSMulTrGsB7wnZE=;
	b=HbiTniZCTC5pVuQ5MYGKWapk3cf+nPJO1PuT0OT4N8f4HuBfK6ggz+LMU5NjhC7mZ/
	ADPMVhGT0D6MKqztoig/cr+EpEGoueQ7Es9MKo0aUo1+UUNCC2AC3jJa1IeLrWRaqT9h
	4HrZTVJchdudDuQEc2vF32auRN1tiPqM7cHRb79GH10ejWhzu4zIE2yWqxegg1gNmJyS
	ALPJwqjN9XTcF5TfYyw210UrfklKd0SHPTWGopqOL4c56BMW/ozQCifWgbs2P8nL+6Wb
	ECaYQDf0o2B9g9LnFvT9VYLfUJZw8RmJkDrfJ6qd4biF+hzjnq3on42K03X+2Be2Har8
	TzRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dZRrtbZJ9voPqzRWWW0wO6+4TNweFSMulTrGsB7wnZE=;
	b=DBUcxAdjincMKK1oKK295j1jv0OggrwoFNBfPtKS/aJPgwcMX03UTTrcC43QzzYaOv
	TvZtaA1pJA2338Qtuh2TRhqej9WU6nbYGb9RgEsfsZ6V9HzuQ7VpxbYv/3JTaKIJj0aJ
	V48tRCNuiAQg+dHf7KIncI6Fy9IoYUYMLP4qwuP6VF2dWYKO1E57IQSFVBHwiY/tpyGm
	H+9s9PDixcserxeUzSCKhkApJ6/nKOpir+5nkdVoGa0JYJG1o9SYZiigIjnbSBX89OEs
	vhadDYz2emNGSj0j9mpV0hYr9wj2JWSP7XKri5JCMJ/I5Tj+J+CYQcoQn9HJGQN5NS/j
	6t/Q==
X-Gm-Message-State: APjAAAURUi/idgs+ua1vyWmYbnpTXTTP9UNeOnyYvzLpME7I+zBE1pz/
	Wfx4gAX+By3hnF6HCVQhNgm6eh0fKAbUJSCAAQc=
X-Google-Smtp-Source: APXvYqx5XdAQXy6EYVOwxauwfXKZX9Y7PgtfLx+CiLdgRtNhjNpXfadaWIymmUeeiUlVd7p3JLszm3SPS9Hdi/T2+ts=
X-Received: by 2002:a2e:7c0b:: with SMTP id x11mr16851909ljc.85.1566337686800; 
	Tue, 20 Aug 2019 14:48:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190820205917.21297-1-alistair.francis@wdc.com>
	<20190820205917.21297-3-alistair.francis@wdc.com>
	<CAMKF1sr=QRRJ=8_0=G7PJ3+HWDUAv2k_YtJar_GQjy=ai0ciig@mail.gmail.com>
In-Reply-To: <CAMKF1sr=QRRJ=8_0=G7PJ3+HWDUAv2k_YtJar_GQjy=ai0ciig@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 20 Aug 2019 14:44:04 -0700
Message-ID: <CAKmqyKOOLXmn2eYjgCE22NpZ5UCA2B1aMPDHUO9VaAwAd_ij7A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 3/3] qemuriscv64: Specify the firmware as a bios instead of kernel
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Aug 2019 21:48:06 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 20, 2019 at 2:13 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Tue, Aug 20, 2019 at 2:03 PM Alistair Francis
> <alistair.francis@wdc.com> wrote:
> >
> > Now that we have a -bios option for the RISC-V virt machine in QEMU we
> > can pass OpenSBI in via -bios and the kernel in via -kernel. We no
> > longer need to pass the kernel in via -device loader so let's remove
> > that.
> >
>
> have you tried running bitbake -ctestimage with this change ?

I have run the testimage, (not bitbake -c testimage) with this change.

Alistair

>
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> > v2:
> >  - Improve the commit message
> >
> >  meta/conf/machine/include/riscv/qemuriscv.inc | 2 +-
> >  meta/conf/machine/qemuriscv64.conf            | 2 --
> >  2 files changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/machine/include/riscv/qemuriscv.inc
> > index 797a27660d..2ebd0a01f2 100644
> > --- a/meta/conf/machine/include/riscv/qemuriscv.inc
> > +++ b/meta/conf/machine/include/riscv/qemuriscv.inc
> > @@ -28,7 +28,7 @@ UBOOT_ENTRYPOINT_riscv64 = "0x80200000"
> >  QB_KERNEL_CMDLINE_APPEND = "earlycon=sbi"
> >  QB_MEM = "-m 512"
> >  QB_MACHINE = "-machine virt"
> > -QB_DEFAULT_KERNEL = "fw_jump.elf"
> > +QB_DEFAULT_BIOS = "fw_jump.elf"
> >  QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
> >  QB_NETWORK_DEVICE = "-device virtio-net-device,netdev=net0,mac=@MAC@"
> >  QB_ROOTFS_OPT = "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio-blk-device,drive=disk0"
> > diff --git a/meta/conf/machine/qemuriscv64.conf b/meta/conf/machine/qemuriscv64.conf
> > index dba8f09e93..99b48b309b 100644
> > --- a/meta/conf/machine/qemuriscv64.conf
> > +++ b/meta/conf/machine/qemuriscv64.conf
> > @@ -4,8 +4,6 @@
> >
> >  require conf/machine/include/riscv/qemuriscv.inc
> >
> > -QB_OPT_APPEND += "-show-cursor -monitor null -device loader,file=${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE},addr=0x80200000"
> > -
> >  EXTRA_IMAGEDEPENDS += "u-boot"
> >  UBOOT_MACHINE = "qemu-riscv64_defconfig"
> >  UBOOT_ELF = "u-boot"
> > --
> > 2.22.0
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

