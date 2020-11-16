Received: from mail-io1-f65.google.com (mail-io1-f65.google.com [209.85.166.65])
 by mx.groups.io with SMTP id smtpd.web09.37420.1605544280446227571
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2020 08:31:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rKwMRreM;
 spf=pass (domain: gmail.com, ip: 209.85.166.65, mailfrom: alistair23@gmail.com)
Received: by mail-io1-f65.google.com with SMTP id i18so16556344ioa.3
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2020 08:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DPKPL/0tTdxGbePFKqw1wjkz5kjVoLylSWv1zzPyy28=;
        b=rKwMRreM9VYUCNFztlVbQXRyJd/qJT92bkjiwXnrOTMCCTU8LRoCIIMPp3P9q1FpB/
         tzmWF40Ofl5z0RvUpXRg0lVjaMPxHBuV2XlhvxV1OSIsUm3siQqGrGZpIDPvOd+KHRss
         42hslUImdQ1CkcwJqc+oVRcn+s/T1ajlhEzO/Ryd8V8O00tzrdKgzmUWW9JvMIIk4vSE
         80Lpl7srntP0JBOlb3Urftdw9evK4G9A8LuEtMEfjV3cbcEBjKJksegGzPNTmNUrI7YQ
         +ddfaJF8mUeLONcSTyDUU7U1UwMD8LurC8oNWDiADDUFyE3oXi46/CNQ3n1MupkM91NI
         QPVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DPKPL/0tTdxGbePFKqw1wjkz5kjVoLylSWv1zzPyy28=;
        b=RUOZC5zoj7Hk9Gzs+807ZkmwC9PJBp4eJQY/dvCqeHtrGlG/NKdPET4oshFhctXVzo
         bsPMp1xElmwFzCooLhqroqCiYWv8yIxHS1cdyTAUGx6v+3goiVHj2qK+Pxkw70yValkx
         Q98se2Xbq6xDt9J4NiWqume4e9HzOFgTSJKGyM8IStETx8fmCDMYy2cExIRKjWub1S/d
         8P/sOHpiMSL0fVDqWFAWu9E91Q0pnYDVqouRc11aOgcxgPHv38Gz4K8JP8d1wfteWOAR
         t6LtZ6Zz7yXVzte1Ru1QK2vSomTwNOIuSsCdtptVs+5LJpM0/89qffUV8L0EJOQ6NraG
         izqQ==
X-Gm-Message-State: AOAM530BaTDUaGuZMi8b29ILfaaYYNv0qNbTiPS/8dqJjusZEIdHzkXm
	thS4T9ZA+lMB2V/aJORK3S/NahOB2O25utBjz+s=
X-Google-Smtp-Source: ABdhPJzTKKX9GmCLs29e97oc2sccj+h1Y1h+gYyoGeSEa2K1iWFSgidUDxIhmM+WgvEqt8+nH1TU+IPFyTCOlzwQBbs=
X-Received: by 2002:a02:aa0d:: with SMTP id r13mr296306jam.26.1605544279899;
 Mon, 16 Nov 2020 08:31:19 -0800 (PST)
MIME-Version: 1.0
References: <20201114195853.2945292-1-raj.khem@gmail.com>
In-Reply-To: <20201114195853.2945292-1-raj.khem@gmail.com>
From: "Alistair Francis" <alistair23@gmail.com>
Date: Mon, 16 Nov 2020 08:19:05 -0800
Message-ID: <CAKmqyKNDDZ+K0iXgp+Ypnu9mj=ZV5iCUwv=W1FCbHymFeWKFsg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] arch-riscv: Enable qemu-usermode on rv32
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Nov 14, 2020 at 11:59 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> Current version of Qemu in OE-core now works fine in rv32/user-mode the
> said nvalid instruction errors are gone, so we can enable it now
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  meta/conf/machine/include/riscv/arch-riscv.inc | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/meta/conf/machine/include/riscv/arch-riscv.inc b/meta/conf/machine/include/riscv/arch-riscv.inc
> index e3dbef7fe3..eae2b88778 100644
> --- a/meta/conf/machine/include/riscv/arch-riscv.inc
> +++ b/meta/conf/machine/include/riscv/arch-riscv.inc
> @@ -7,9 +7,6 @@ TUNE_PKGARCH = "${TUNE_PKGARCH_tune-${DEFAULTTUNE}}"
>  TUNE_CCARGS_append = "${@bb.utils.contains('TUNE_FEATURES', 'riscv64nf', ' -mabi=lp64', ' ', d)}"
>  TUNE_CCARGS_append = "${@bb.utils.contains('TUNE_FEATURES', 'riscv32nf', ' -mabi=ilp32', ' ', d)}"
>
> -# QEMU usermode fails with invalid instruction error (For riscv32)
> -MACHINE_FEATURES_BACKFILL_CONSIDERED_append = "${@bb.utils.contains('TUNE_FEATURES', 'riscv32', ' qemu-usermode', '', d)}"
> -
>  # Fix: ld: unrecognized option '--hash-style=sysv'
>  LINKER_HASH_STYLE_libc-newlib = ""
>  # Fix: ld: unrecognized option '--hash-style=gnu'
> --
> 2.29.2
>
>
> 
>
