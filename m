Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.2693.1617752208946352944
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Apr 2021 16:36:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=f7Sy/8Tr;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id l4so24564765ejc.10
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Apr 2021 16:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LjqXhuFoWnxJcARw131FgX0Tg0bBR8iCAlhdIWhN2uk=;
        b=f7Sy/8TryFPjy0930J82QljgvoErIabzIkpbaygxUhQQ9d3Jod7VHbcEeYtGqJzNEA
         21O4+RhaYkLDqXNJ8Z1tXcyrLmCiGazv91axPPH8NTIuVa9JwjaG3jotS5Fsr9q86R3/
         Qzvsu/oA2Z89R2bjlTXA09b1GYvsZyoMidTW3tUVJVTwfeJNFR1ISk24IHP/zjVSSnDi
         Z3PoZTazRjl3jJkGW4cnY2Bp1oGNn+cERAUKAozSW3Bhtdk/nGX+OUaGE8ASTJzKuRPx
         A6zNHxEpiifULCjr0TFpaGOPKJESxdEHR6SW3iUGo0tUdgT3KAiyDqEGZHa4oFcRaKP6
         ps7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LjqXhuFoWnxJcARw131FgX0Tg0bBR8iCAlhdIWhN2uk=;
        b=VzbTidWF0TPnN2LJxGTlnqaNDspfAeOgeApnLyePzzeWpzFUlFv2Vrenqk995G1X5m
         AZZHFQgDDqNMklokpRMWVUoEliwxrG5sTQumkBlN8lzpUZwTJDFKVOrlOIFnownMxIv8
         4wcU19iTSMy6CQwx27e9Cu7mZcbKV5XKb6YRYJg6r8UhhyZk7J9Nc0Ae1Q7MqOfGt/At
         qksdxw+p1YXBnjWeSPYE2kXAAwcP2PO/4oEM0jgwMOQEzLo/G2T6Uqd9hPIedNkYjPUf
         m3jD4nUZbxG5IBJ5eo5iQsPFWaew30KrxCU1KV7DELmilPipM9T5FOUJ73yW2e01oxbN
         uUSA==
X-Gm-Message-State: AOAM5323RBCoKhTAhBfwaXgUsnbUNyURNLo/wrpzJbWpDBqL/l1gvogL
	vKzvnqR7o54aIg+30w1HUhIUWJfparO1v3zh+JY=
X-Google-Smtp-Source: ABdhPJy+MVZM5B44M0jwbZhRxB7pcxVvhxgFb5bHMBgebkb04HOe72/4quZSNI42BTJl6+Mi060IleljXw0uD9Wwly0=
X-Received: by 2002:a17:906:4ad5:: with SMTP id u21mr561729ejt.22.1617752207347;
 Tue, 06 Apr 2021 16:36:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210405190833.53066-1-sakib.sajal@windriver.com>
In-Reply-To: <20210405190833.53066-1-sakib.sajal@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 6 Apr 2021 19:36:36 -0400
Message-ID: <CADkTA4NtZxz0vPb+Ska8++1T_Q2v5LAkV3PNVyDAyEFO6-tpbg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-yocto[-rt]_5.4: remove feature/gpio/mockup.scc
To: Sakib Sajal <sakib.sajal@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 5, 2021 at 3:08 PM Sakib Sajal <sakib.sajal@windriver.com> wrote:
>
> mockup.scc is not supported in 5.4 kernel
>

Can you elaborate ? Are you seeing build issues ? Something else ?

The Kconfig options are in our 5.4.109 kernel tree, so you must mean
something more than that.

Bruce

> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb | 1 -
>  meta/recipes-kernel/linux/linux-yocto_5.4.bb    | 1 -
>  2 files changed, 2 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> index 2ffc8ed542..7629229601 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> @@ -42,4 +42,3 @@ KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc
>  KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
>  KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
>  KERNEL_FEATURES_append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "", d)}"
> -KERNEL_FEATURES_append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc", "", d)}"
> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> index 245c3d574b..04e64c028b 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> @@ -52,4 +52,3 @@ KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
>  KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
>  KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "", d)}"
>  KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "", d)}"
> -KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc", "", d)}"
> --
> 2.25.1
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
