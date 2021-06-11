Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
 by mx.groups.io with SMTP id smtpd.web11.4783.1623391417222058546
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Jun 2021 23:03:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bcUvaWor;
 spf=pass (domain: gmail.com, ip: 209.85.166.178, mailfrom: alistair23@gmail.com)
Received: by mail-il1-f178.google.com with SMTP id i13so4089744ilk.3
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Jun 2021 23:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EI/yauNWZ3kehWLtaE/yVLfw+77L3q6x016t0MfDsPQ=;
        b=bcUvaWorp8CVf8GefBwxjaGKsE9Q62mN3qOWgGhF1ZlpUT8jPfhn/C7wZ16La05dCF
         h983deA45IK4iVfT4yM7sskyP4vgN4zaaYfNOiKap0wi4yQQ6q7HsxoO2LD7gH3F1535
         r59KfEzxR/m14uS70tL0xnj1wRFddGpk8h9X9WonbW42nbrgOBepnWcv8OmXXVHMa8h8
         UybLJyEquN/M8DIYb/W9UK05ZTqBJ48R5Dfo7gNLj5z2wddDpMKeg26LNV1QAPTHv/PG
         YkaQxaVPi6wgtZ/vLHwoUg+GJ3GpCSkxbAa/nstfRxS6Wh4o3nx4Ca7jG+uZXSJpB5fK
         D3dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EI/yauNWZ3kehWLtaE/yVLfw+77L3q6x016t0MfDsPQ=;
        b=LFydof7HhwmoI/ScSsBuG6FevbGQ8YGAZxdSMw0x62FPLScHjQfSwwqDNFXKIUgxIV
         ashD1r74dwRs1VqlLtrAwjOWl1cpk3sjy5VgAvBpv6YFLIzF2I/pdnGP1wNqbs86vKgi
         nFLebUkuRLyccqX7bxQFebHn+DLDZfrsKDc1w3i64uUnOyvC5kB48YJoN7F5umgBNdEx
         dSMwBd/fD7wyzdw0n+eunXfCFoyXSyZpLdnKFUy2tb+fsnsRvEJW8/WCeH7fvbuU5ljH
         eWQ2jvJ1+eDAih/8Bsd4vvJGlcwLD+QNOEwJCgnMRsnqxhzpVVaxwJBPiPu/OH2qlmek
         5fdw==
X-Gm-Message-State: AOAM532JLXpbYTjKspOTFDZx5etH6zPcEy+qHeeHae1ckcbs0C8Tor8K
	l0vG5BezPGIIxSeWlZAVKyRHwmPNVg4Gz8be/5I=
X-Google-Smtp-Source: ABdhPJw7vysPg6OoVw6A/BU2jBF5k9O3UsFi6SsPRrg9Ic41+2qR2Iwj/rtxyThdau8nXq6iPazvgQ3dSNr9dbCgVgY=
X-Received: by 2002:a05:6e02:1447:: with SMTP id p7mr1924142ilo.131.1623391416442;
 Thu, 10 Jun 2021 23:03:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210611024436.2109932-1-raj.khem@gmail.com> <20210611024436.2109932-2-raj.khem@gmail.com>
In-Reply-To: <20210611024436.2109932-2-raj.khem@gmail.com>
From: "Alistair Francis" <alistair23@gmail.com>
Date: Fri, 11 Jun 2021 16:03:09 +1000
Message-ID: <CAKmqyKMiC8V5z68SnT2aWWuq+rwoXu=Owj-hovC_GGsobc=EGA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] qemuriscv: Enable 4 core emulation
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 11, 2021 at 12:44 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Helps in running tests a bit faster
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  meta/conf/machine/include/riscv/qemuriscv.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/machine/include/riscv/qemuriscv.inc
> index 428d28bde1..20e2d465a1 100644
> --- a/meta/conf/machine/include/riscv/qemuriscv.inc
> +++ b/meta/conf/machine/include/riscv/qemuriscv.inc
> @@ -26,6 +26,7 @@ UBOOT_ENTRYPOINT_riscv32 = "0x80400000"
>  UBOOT_ENTRYPOINT_riscv64 = "0x80200000"
>
>  # qemuboot options
> +QB_SMP = "-smp 4"
>  QB_KERNEL_CMDLINE_APPEND = "earlycon=sbi"
>  QB_MACHINE = "-machine virt"
>  QB_DEFAULT_BIOS = "fw_jump.elf"
> --
> 2.32.0
>
>
> 
>
