Received: from mail-il1-f193.google.com (mail-il1-f193.google.com [209.85.166.193])
 by mx.groups.io with SMTP id smtpd.web10.19154.1600959826211045098
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Sep 2020 08:03:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LULOOxcL;
 spf=pass (domain: gmail.com, ip: 209.85.166.193, mailfrom: alistair23@gmail.com)
Received: by mail-il1-f193.google.com with SMTP id h2so3408388ilo.12
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2020 08:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XyJlIwAYpaBR8qHmHPXz2b4u0K3JqhkgrD7Zck1LPC4=;
        b=LULOOxcLZGdKxR4WU4lJyX2eiXR9BZGMWWrN/o8dTqTnS30AJZyz+Q3DGPA8ftboYm
         r0Nm/ceM2Dp/+6lfQX4jYdHnx2KAPhy6kXlv76nxAbP9uQrwrwU0xHy7yGh38WtM0UDg
         UzNdmdtZGlQ5rgrSCd0kROjO3xqKTwCkqAtcL18L0LMbluTygWvv0JMRGNOWUKZU6n6k
         Mh4WEi8+TwKEDcBRHCnTFnDrZjAow0R6t4EdLrO5PO62Mhmd0EKTKKb1eGf3liMCrCRx
         obGDBTDc4hJmXzm6NyWZb6yDX0dC5PudqpyIEQVLAObyseD0Z9XlS9pBkMZt2MKFkv2Z
         M6+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XyJlIwAYpaBR8qHmHPXz2b4u0K3JqhkgrD7Zck1LPC4=;
        b=DfP7TsW6KZTXqF7sWcULYjeIw4GuKFlIE+lvkQ4OvuAJBXLrtcoGYbrHyUOwWwrMSQ
         xqi2utiLUO73DaC8SQuvW5J3A4v2eNgqg1fr6iRSeb+Xg65u5g8ClHy+04srM5A7s7LV
         eRj1a6yadWflmqgq4Wa93h9C9kme6fKLBM3IFoDarcoDQwtpxbZqhTMhHonOENOsqrsZ
         v5Q9KEgk6xjS8+4vjryjChwrUP78fjAlYF+jo/eF6KkfYwQLHtny/VEGANPCSz/M9GWC
         zJDIqNKSRWC5bxVuKNKoMqx6wBrTrXmZrzPZDKV6kUBAccvDEZSHcRy4RvTzP7xmbi6h
         fWSA==
X-Gm-Message-State: AOAM532BN3Bt9AuPZqUrf9PI6mzm5EmUvrKabRJzrOZDIwRJ82SIyj2J
	iCKHk7iKa1jRJMdGhBgEIFKhXTYEVSLbTeMaAFQ=
X-Google-Smtp-Source: ABdhPJxHgNJltX5d+FG8IIqWthuADm0DDVekr37yZxKSVXUMnoB761FAOhIoRm8O1XgDfvgjnpIph7FnYzhjXtpYApA=
X-Received: by 2002:a92:589a:: with SMTP id z26mr4478274ilf.267.1600959825402;
 Thu, 24 Sep 2020 08:03:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200924012506.1007542-1-raj.khem@gmail.com>
In-Reply-To: <20200924012506.1007542-1-raj.khem@gmail.com>
From: "Alistair Francis" <alistair23@gmail.com>
Date: Thu, 24 Sep 2020 07:52:27 -0700
Message-ID: <CAKmqyKNHwB2f81ROeK3_A7RO6VH_-fePdWk5j7yzrJaeyfoP0Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] qemuboot: Add QB_RNG variable
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 23, 2020 at 6:25 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> RNG passthru has been enabled on all qemu machines but its being added
> to each one of them, with this patch its turned into QB variables which
> defaults to host passthru, yet it can be overridden if needed via
> machine or config metadata if needed.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Good idea!

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  meta/classes/qemuboot.bbclass                 | 4 ++++
>  meta/conf/machine/include/qemuboot-mips.inc   | 2 --
>  meta/conf/machine/include/qemuboot-x86.inc    | 2 --
>  meta/conf/machine/include/riscv/qemuriscv.inc | 3 ---
>  meta/conf/machine/qemuarm.conf                | 2 --
>  meta/conf/machine/qemuarm64.conf              | 2 --
>  meta/conf/machine/qemuarmv5.conf              | 2 --
>  meta/conf/machine/qemuppc.conf                | 2 --
>  scripts/runqemu                               | 2 +-
>  9 files changed, 5 insertions(+), 16 deletions(-)
>
> diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
> index d8f62ef6ea..824676216e 100644
> --- a/meta/classes/qemuboot.bbclass
> +++ b/meta/classes/qemuboot.bbclass
> @@ -29,6 +29,9 @@
>  # QB_AUDIO_OPT: qemu audio option, e.g., "-soundhw ac97,es1370", used
>  #               when QB_AUDIO_DRV is set.
>  #
> +# QB_RNG: Pass-through for host random number generator, it can speedup boot
> +#         in system mode, where system is experiencing entropy starvation
> +#
>  # QB_KERNEL_ROOT: kernel's root, e.g., /dev/vda
>  #
>  # QB_NETWORK_DEVICE: network device, e.g., "-device virtio-net-pci,netdev=net0,mac=@MAC@",
> @@ -77,6 +80,7 @@ QB_MEM ?= "-m 256"
>  QB_SERIAL_OPT ?= "-serial mon:stdio -serial null"
>  QB_DEFAULT_KERNEL ?= "${KERNEL_IMAGETYPE}"
>  QB_DEFAULT_FSTYPE ?= "ext4"
> +QB_RNG ?= "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
>  QB_OPT_APPEND ?= ""
>  QB_NETWORK_DEVICE ?= "-device virtio-net-pci,netdev=net0,mac=@MAC@"
>  QB_CMDLINE_IP_SLIRP ?= "ip=dhcp"
> diff --git a/meta/conf/machine/include/qemuboot-mips.inc b/meta/conf/machine/include/qemuboot-mips.inc
> index e99bade2e3..230f032c53 100644
> --- a/meta/conf/machine/include/qemuboot-mips.inc
> +++ b/meta/conf/machine/include/qemuboot-mips.inc
> @@ -3,8 +3,6 @@ IMAGE_CLASSES += "qemuboot"
>  QB_MACHINE = "-machine malta"
>  QB_KERNEL_CMDLINE_APPEND = "console=ttyS0 console=tty"
>  QB_OPT_APPEND = "-usb -device usb-tablet"
> -# Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
> -QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
>
>  # For graphics to work we need to define the VGA device as well as the necessary USB devices
>  QB_OPT_APPEND += "-vga std"
> diff --git a/meta/conf/machine/include/qemuboot-x86.inc b/meta/conf/machine/include/qemuboot-x86.inc
> index ccc6dcd3bf..2a4760c717 100644
> --- a/meta/conf/machine/include/qemuboot-x86.inc
> +++ b/meta/conf/machine/include/qemuboot-x86.inc
> @@ -10,6 +10,4 @@ QB_AUDIO_DRV = "alsa"
>  QB_AUDIO_OPT = "-soundhw ac97,es1370"
>  QB_KERNEL_CMDLINE_APPEND = "oprofile.timer=1"
>  QB_OPT_APPEND = "-usb -device usb-tablet"
> -# Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
> -QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
>
> diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/machine/include/riscv/qemuriscv.inc
> index 759c8a196e..0e88c91aa6 100644
> --- a/meta/conf/machine/include/riscv/qemuriscv.inc
> +++ b/meta/conf/machine/include/riscv/qemuriscv.inc
> @@ -33,6 +33,3 @@ QB_NETWORK_DEVICE = "-device virtio-net-device,netdev=net0,mac=@MAC@"
>  QB_ROOTFS_OPT = "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio-blk-device,drive=disk0"
>  QB_SERIAL_OPT = "-device virtio-serial-device -chardev null,id=virtcon -device virtconsole,chardev=virtcon"
>  QB_TCPSERIAL_OPT = " -device virtio-serial-device -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1 -device virtconsole,chardev=virtcon"
> -# Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
> -QB_OPT_APPEND = " -object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-device,rng=rng0"
> -
> diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm.conf
> index 3364dcf042..702b850cbb 100644
> --- a/meta/conf/machine/qemuarm.conf
> +++ b/meta/conf/machine/qemuarm.conf
> @@ -21,8 +21,6 @@ QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0"
>  # For graphics to work we need to define the VGA device as well as the necessary USB devices
>  QB_OPT_APPEND = "-device VGA,edid=on"
>  QB_OPT_APPEND += "-device qemu-xhci -device usb-tablet -device usb-kbd"
> -# Add the virtio RNG
> -QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
>  # Virtio Networking support
>  QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
>  QB_NETWORK_DEVICE = "-device virtio-net-device,netdev=net0,mac=@MAC@"
> diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
> index fdd464d708..2f61eb0aed 100644
> --- a/meta/conf/machine/qemuarm64.conf
> +++ b/meta/conf/machine/qemuarm64.conf
> @@ -22,8 +22,6 @@ QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0"
>  # For graphics to work we need to define the VGA device as well as the necessary USB devices
>  QB_OPT_APPEND = "-device VGA,edid=on"
>  QB_OPT_APPEND += "-device qemu-xhci -device usb-tablet -device usb-kbd"
> -# Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
> -QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
>  # Virtio Networking support
>  QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
>  QB_NETWORK_DEVICE = "-device virtio-net-device,netdev=net0,mac=@MAC@"
> diff --git a/meta/conf/machine/qemuarmv5.conf b/meta/conf/machine/qemuarmv5.conf
> index 48e83f13e1..7e8c9e1fa6 100644
> --- a/meta/conf/machine/qemuarmv5.conf
> +++ b/meta/conf/machine/qemuarmv5.conf
> @@ -14,8 +14,6 @@ QB_SYSTEM_NAME = "qemu-system-arm"
>  QB_MACHINE = "-machine versatilepb"
>  QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0,115200 console=tty"
>  QB_OPT_APPEND = "-usb -device usb-tablet"
> -# Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
> -QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
>  PREFERRED_VERSION_linux-yocto ??= "5.8%"
>  QB_DTB = "${@oe.utils.version_less_or_equal('PREFERRED_VERSION_linux-yocto', '4.7', '', 'zImage-versatile-pb.dtb', d)}"
>
> diff --git a/meta/conf/machine/qemuppc.conf b/meta/conf/machine/qemuppc.conf
> index 9733b5e85b..a84594f335 100644
> --- a/meta/conf/machine/qemuppc.conf
> +++ b/meta/conf/machine/qemuppc.conf
> @@ -17,6 +17,4 @@ QB_MACHINE = "-machine mac99"
>  QB_CPU = "-cpu G4"
>  QB_KERNEL_CMDLINE_APPEND = "console=tty console=ttyS0"
>  QB_OPT_APPEND = "-usb -device usb-tablet"
> -# Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
> -QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
>  QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
> diff --git a/scripts/runqemu b/scripts/runqemu
> index e62d869c20..e5e66f3453 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -1336,7 +1336,7 @@ class BaseConfig(object):
>          if not os.access(qemu_bin, os.X_OK):
>              raise OEPathError("No QEMU binary '%s' could be found" % qemu_bin)
>
> -        self.qemu_opt = "%s %s %s %s" % (qemu_bin, self.get('NETWORK_CMD'), self.get('ROOTFS_OPTIONS'), self.get('QB_OPT_APPEND'))
> +        self.qemu_opt = "%s %s %s %s %s" % (qemu_bin, self.get('NETWORK_CMD'), self.get('QB_RNG'), self.get('ROOTFS_OPTIONS'), self.get('QB_OPT_APPEND'))
>
>          for ovmf in self.ovmf_bios:
>              format = ovmf.rsplit('.', 1)[-1]
> --
> 2.28.0
>
>
> 
>
