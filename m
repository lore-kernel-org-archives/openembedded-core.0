Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43867C433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 18:00:00 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web08.30357.1644429599553205457
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 09:59:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=e/xYiPpq;
 spf=pass (domain: gmail.com, ip: 209.85.222.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id b35so2287772qkp.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 09:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PcRbSAGqY1BNXJvVbzaSPuGFf6cVhRd00cMnjNkkxvc=;
        b=e/xYiPpqFqjVTEi8Y8GrKHmQRV/M+TOZPgs75mWKeT/vBTc8bzkbL2z3tX0QQ0cyxY
         RtyoN9nNLhuxdaImmGJAvcw1BZynN2KXRgBOt8DuG6DxZmdSoDdtmhqYox/F7Zbfjk7A
         L+m6E8ghr66AEXpzWSD7OHwo6vIPBUgGjfvmK7wGkGImRHmVnVkFiT30C3cnKFVjaCna
         x7FaOmw9wu2iu9JfGFo72wmEiwisIXVbev1KDwe17V9OpsB/GIKq6+u20BQ2biZROemp
         bCshmIirEX1LhsnP9s82OfGm2U2jZZIA15Y9sNCCpZcO9aoooNFZOZax8R3HN2wNFxB6
         Zm9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PcRbSAGqY1BNXJvVbzaSPuGFf6cVhRd00cMnjNkkxvc=;
        b=JEAjlBnQjEqLBHNSmMRGzmgEzvSl2MhbINgIXxJzvds8AAeuInn4mFwVG+x58h72iY
         2HjBxcsa5PsVnTYYTxRFaWF0NMY3P/b01TXjWA5W3oyKnBuPDcg+w4Y13P2MnxX6smug
         IpZDnyo8XdiTkDIfq8oQ0TsyvkJzO/J7mHaXgvT+iPt/PIa7KS9Q2jjgPgd+OT/1ZRtZ
         0oY9uKfW4Bs4nXEtuV6acR3ZxMBABDr+RoNiAPxLNllNzbSub8sEa+BEu6v1rX/03l6U
         1Bcrf71R+aSRIrnPLq6xYpeim6C6tohgStLdD4ytCF8NOem4QbUsCsVGH3UmNCDk5YFx
         NpBQ==
X-Gm-Message-State: AOAM5325a/dRXTR/fvBb50s7W/eDlKG7rYqKVJGIatPIGKuTEvZYtyZO
	y7SonbAXOE7VUW8ZAkv+Qp+HL+aJRceDKiKDtMy17WoLAQU=
X-Google-Smtp-Source: 
 ABdhPJzQYd7x5hMWCBIvGDSjEmc5JKKAlcjKMDRmvCYIPBSD3x+53YIsG/+GW1qXBthVVXHbpxMOhIPoFRy5AqmIUk4=
X-Received: by 2002:a37:63cf:: with SMTP id x198mr1805865qkb.72.1644429598544;
 Wed, 09 Feb 2022 09:59:58 -0800 (PST)
MIME-Version: 1.0
References: <20220209173014.1389378-1-jdmason@kudzu.us>
 <20220209173014.1389378-5-jdmason@kudzu.us>
In-Reply-To: <20220209173014.1389378-5-jdmason@kudzu.us>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 9 Feb 2022 09:59:32 -0800
Message-ID: 
 <CAMKF1spbOiDZgS+jYNYR8FgH_ywMckc7+K-aprMOwR+NM36x1w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/5] qemuarmv5: use arm-versatile-926ejs
 KMACHINE and add more virtio devices
To: Jon Mason <jdmason@kudzu.us>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Feb 2022 18:00:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161584

On Wed, Feb 9, 2022 at 9:30 AM Jon Mason <jdmason@kudzu.us> wrote:
>
> Use the Arm Versatile 926 kernel configs and round out all of the virtio
> interfaces to match other QEMU machines.
>
> Signed-off-by: Jon Mason <jdmason@kudzu.us>
> ---
>  meta/conf/machine/qemuarm64.conf |  8 ++++----
>  meta/conf/machine/qemuarmv5.conf | 11 +++++++++--
>  2 files changed, 13 insertions(+), 6 deletions(-)
>
> diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
> index f24515216838..ffc51c803fa7 100644
> --- a/meta/conf/machine/qemuarm64.conf
> +++ b/meta/conf/machine/qemuarm64.conf
> @@ -23,9 +23,9 @@ QB_GRAPHICS = "-device virtio-gpu-pci"
>  QB_OPT_APPEND = "-device qemu-xhci -device usb-tablet -device usb-kbd"
>  # Virtio Networking support
>  QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
> -QB_NETWORK_DEVICE = "-device virtio-net-device,netdev=net0,mac=@MAC@"
> +QB_NETWORK_DEVICE = "-device virtio-net-pci,netdev=net0,mac=@MAC@"
>  # Virtio block device
> -QB_ROOTFS_OPT = "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio-blk-device,drive=disk0"
> +QB_ROOTFS_OPT = "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio-blk-pci,drive=disk0"
>  # Virtio serial console
> -QB_SERIAL_OPT = "-device virtio-serial-device -chardev null,id=virtcon -device virtconsole,chardev=virtcon"
> -QB_TCPSERIAL_OPT = "-device virtio-serial-device -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1 -device virtconsole,chardev=virtcon"
> +QB_SERIAL_OPT = "-device virtio-serial-pci -chardev null,id=virtcon -device virtconsole,chardev=virtcon"
> +QB_TCPSERIAL_OPT = "-device virtio-serial-pci -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1 -device virtconsole,chardev=virtcon"
> diff --git a/meta/conf/machine/qemuarmv5.conf b/meta/conf/machine/qemuarmv5.conf
> index 2dad504c9932..863379ff4961 100644
> --- a/meta/conf/machine/qemuarmv5.conf
> +++ b/meta/conf/machine/qemuarmv5.conf
> @@ -13,9 +13,16 @@ SERIAL_CONSOLES ?= "115200;ttyAMA0 115200;ttyAMA1"
>  QB_SYSTEM_NAME = "qemu-system-arm"
>  QB_MACHINE = "-machine versatilepb"
>  QB_KERNEL_CMDLINE_APPEND = "vmalloc=256"
> +# For graphics to work we need to define the VGA device as well as the necessary USB devices
>  QB_GRAPHICS = "-device virtio-gpu-pci"
>  QB_OPT_APPEND = "-device qemu-xhci -device usb-tablet -device usb-kbd"
> -PREFERRED_VERSION_linux-yocto ??= "5.15%"

is this intentional change ?

> +# Virtio Networking support
> +QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
> +QB_NETWORK_DEVICE = "-device virtio-net-pci,netdev=net0,mac=@MAC@"
> +# Virtio serial console
> +QB_SERIAL_OPT = "-device virtio-serial-pci -chardev null,id=virtcon -device virtconsole,chardev=virtcon"
> +QB_TCPSERIAL_OPT = "-device virtio-serial-pci -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1 -device virtconsole,chardev=virtcon"
> +
>  QB_DTB = "${@oe.utils.version_less_or_equal('PREFERRED_VERSION_linux-yocto', '4.7', '', 'zImage-versatile-pb.dtb', d)}"
>
> -KMACHINE:qemuarmv5 = "qemuarm"
> +KMACHINE:qemuarmv5 = "arm-versatile-926ejs"
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161573): https://lists.openembedded.org/g/openembedded-core/message/161573
> Mute This Topic: https://lists.openembedded.org/mt/89026731/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

