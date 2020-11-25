Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web10.568.1606330514164858588
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2020 10:55:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=htwbz941;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id v143so5732137qkb.2
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2020 10:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8a8wovqMd2mR2AouZFCPLrlI5An6usk9IDxo17Z2lBQ=;
        b=htwbz941ORJo8/VsvP9gOkiVSE8M7dbo3/GeMsdtcAVUDbrWFKy2rrjh7C5VW3Gmpv
         PZdbfG/hSYiLyPX+PSsC7nkmtZTcDzoZ2SoArCL229dOaobX/CInEB7uawpZCH7hs9Yo
         7bZl6Jrgbw4tpXciKuZm27k6b/w830Um9W+Q4bdwjfKzl//4bWaFIKKYmb0/s0NfKimC
         X2gbQcbj8IyVnCNBgqTbd5uWd9o7HXs/pKtNldQrmZ5ARMca0Bi78OHwaTE9EWK3hBQ6
         DcsbI0yN9Z5plvj7ZgKk4boFTdK95eNBbQL5Y4zVO+Ryo2TuRhUwzdrA9yN7I6tgNDj+
         lbDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8a8wovqMd2mR2AouZFCPLrlI5An6usk9IDxo17Z2lBQ=;
        b=Qc7LGBVIHpsRN78unGV4MPk362OO7gB8dvANA61RYrRIJXCwg/30fNNwJwzcqSWzr0
         T36sYNrJiWmG5X2yPl7bFzv6wbX3LnCK4Fhot0BHWXm1RenTD/8O/9CwjevmbtxRA0G8
         mEgsj2sozQXWUq+mXlSxSiZagOQWHjW+ZJrIfVwB9EYuUpn5djcniiVF6UQo0tKSK6L8
         4EpGX8unTxogfr/Gpc66Hqg+ecl8Qw4cXzMc5NlC2tZJgm8MV/ChujBVt3LY9xKL5/Hk
         bdmIa7GfR++T5m6qPUsS71l28S3Riu5CW+HobWIltiT7UsOGXzcyV6BDR9FRM6i6MhQr
         M7iQ==
X-Gm-Message-State: AOAM530I2xcsi/quQzrtOxvlYuIx4RCCwC5nv1VGF11QCXJ528fGviKl
	zQqXKZRqZCELVOXOb8GIxdOSI2wIHl9usSnIqSD7O+Q2qEI=
X-Google-Smtp-Source: ABdhPJyUlVyYLrz87FH2W9tsPHaYd5CylU5sKcdUZz1QkPKJGN+t/IUbZTH5Cg4c2/mtZR9h+lVUzgEed6R1QJh7lOg=
X-Received: by 2002:a37:a70e:: with SMTP id q14mr254309qke.337.1606330513032;
 Wed, 25 Nov 2020 10:55:13 -0800 (PST)
MIME-Version: 1.0
References: <20201125172249.1067599-1-norbert.kaminski@3mdeb.com>
In-Reply-To: <20201125172249.1067599-1-norbert.kaminski@3mdeb.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 25 Nov 2020 10:54:46 -0800
Message-ID: <CAMKF1spgmRqX-rmy-tV+a5VwRCTT6-UpjWejAq2UL5nhbB9-kQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] grub: Add support for RISC-V
To: Norbert Kaminski <norbert.kaminski@3mdeb.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
Content-Type: text/plain; charset="UTF-8"

Thanks for your contribution.

On Wed, Nov 25, 2020 at 9:23 AM Norbert Kaminski
<norbert.kaminski@3mdeb.com> wrote:
>
> This patch adds RISC-V to the COMPATIBLE_HOST. Since GRUB 2.04,
> the source code supports the RISC-V, thanks to Alexander Graf.
>
> Adding the GRUBPLATFORM for RISC-V prevents autoconf problems.
> Also, the patch appends the __anonymous method with RISC-V architecture.
>
> Signed-off-by: Norbert Kaminski <norbert.kaminski@3mdeb.com>
> ---
>  meta/recipes-bsp/grub/grub-efi_2.04.bb | 4 ++++
>  meta/recipes-bsp/grub/grub2.inc        | 4 +++-
>  2 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-bsp/grub/grub-efi_2.04.bb b/meta/recipes-bsp/grub/grub-efi_2.04.bb
> index 30d95f95e0..f80afd95cb 100644
> --- a/meta/recipes-bsp/grub/grub-efi_2.04.bb
> +++ b/meta/recipes-bsp/grub/grub-efi_2.04.bb
> @@ -26,6 +26,10 @@ python __anonymous () {
>          grubtarget = 'arm64'
>      elif re.match('arm', target):
>          grubtarget = 'arm'
> +    elif re.match('riscv64', target):
> +        grubtarget = 'riscv64'
> +    elif re.match('riscv32', target):
> +        grubtarget = 'riscv32'

RV64 is file but does it also support RV32 ?

>      else:
>          raise bb.parse.SkipRecipe("grub-efi is incompatible with target %s" % target)
>      grubimage = prefix + d.getVar("EFI_BOOT_IMAGE")
> diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
> index ff17dbe8b7..d020103605 100644
> --- a/meta/recipes-bsp/grub/grub2.inc
> +++ b/meta/recipes-bsp/grub/grub2.inc
> @@ -33,7 +33,7 @@ SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e503165
>
>  DEPENDS = "flex-native bison-native gettext-native"
>
> -COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*)-(linux.*|freebsd.*)'
> +COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*|riscv.*)-(linux.*|freebsd.*)'
>  COMPATIBLE_HOST_armv7a = 'null'
>  COMPATIBLE_HOST_armv7ve = 'null'
>
> @@ -42,6 +42,8 @@ COMPATIBLE_HOST_armv7ve = 'null'
>
>  GRUBPLATFORM_arm = "efi"
>  GRUBPLATFORM_aarch64 = "efi"
> +GRUBPLATFORM_riscv32 = "efi"
> +GRUBPLATFORM_riscv64 = "efi"
>  GRUBPLATFORM ??= "pc"
>
>  inherit autotools gettext texinfo pkgconfig
> --
> 2.25.1
>
>
> 
>
