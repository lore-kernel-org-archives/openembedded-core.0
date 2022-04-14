Return-Path: <alistair23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCB01C5AC78
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:55 +0000 (UTC)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
 [209.85.166.177])
 by mx.groups.io with SMTP id smtpd.web11.8934.1649921586027579554
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Apr 2022 00:33:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hEbY4FDD;
 spf=pass (domain: gmail.com, ip: 209.85.166.177,
 mailfrom: alistair23@gmail.com)
Received: by mail-il1-f177.google.com with SMTP id b5so2632516ile.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Apr 2022 00:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JA9NMCHHLV63ttXYQYHXgys3k9PHhLq1HupxriW22dA=;
        b=hEbY4FDDwGFNEBj311SndyeDl6LFIggn++mTzoQ9newHMWoFS4/K/Ynm/Ak7fHmNRt
         wVO4TedIzAaqbIDvCW/AyjOupHacs7R/V3nQgntP3FQKEN00/xseGOogSd2rRvsfja7u
         7JZikPLckjezmcYAal9++JXT3ynmbslY5XVRNHj9SMtYWsGPlVU4xECx5Ue5gsDt8Cj8
         ocyl1zMRtl7khFOYXabCw2HHPXXECH+AnSstyirfGbzmYh9iNUMyf1F+j+MsfO+DOoiH
         BCQErs2tz35a/3ECVs2/CQei3m1NOaMFrwFzvvVmmUyFUW913IxfM1R1KUjNpwQFJjqS
         pU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JA9NMCHHLV63ttXYQYHXgys3k9PHhLq1HupxriW22dA=;
        b=0lwcQVW0R/+bLBPuZ7KDfGeUkTY/XyseZeN1CwRPmfmQnaypAOx7z90m4qD7VYeUOM
         V36SrBlUd1rWFXdd1/5RQQbXy1Ska2siUIEt5em+ehk1S73h+PJp/J8U27G8Dany3HDl
         PqyaLQXtjc6Y7DeG7sice8zEheOT3VHJIVN/HsCCx1zPGZbaV6v5w2YLZm7RVWy6bqAN
         XsOtsSub+/9V5SFvm3QT14ggeNFdhNjiZjCIGU27byiALPMqnRQqgOBVcNCYiw/Ngn1R
         GgWepGLON0TEyCzaz3x7Ij6ecONR5Cc1eT6JgUTneQz0uaoFaXetRGoKC2DD8FIBfKrl
         I71Q==
X-Gm-Message-State: AOAM531x1tZmTSrnQ0qm+DvWjKqI0bt3Y7tPGxMfvoEN9ymYVGl24hRn
	+w9QacgH4TYXiDqNsWyP12+DCiqi6G/sf9iC+3A=
X-Google-Smtp-Source: 
 ABdhPJx/UuiJGwJ6R5AFfJkFpK3g8xKxf9MvZjQ2pPhns5UO9gc3uoC16ofxubsS6C2wzineyzGSOmsZGhSyGP9urHc=
X-Received: by 2002:a05:6e02:219e:b0:2cb:d264:831b with SMTP id
 j30-20020a056e02219e00b002cbd264831bmr558165ila.55.1649921585383; Thu, 14 Apr
 2022 00:33:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220414025230.1166825-1-raj.khem@gmail.com>
In-Reply-To: <20220414025230.1166825-1-raj.khem@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 14 Apr 2022 17:32:39 +1000
Message-ID: 
 <CAKmqyKNUJse_0a_NTK7SRQZ+CSzBZ2EDbgJ68KaW7m23m9bc8A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/6] riscv: Add tunes for rv64 without
 compressed instructions
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164393

On Thu, Apr 14, 2022 at 12:52 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/conf/machine/include/riscv/arch-riscv.inc | 2 ++
>  meta/conf/machine/include/riscv/tune-riscv.inc | 8 ++++++++
>  2 files changed, 10 insertions(+)
>
> diff --git a/meta/conf/machine/include/riscv/arch-riscv.inc b/meta/conf/machine/include/riscv/arch-riscv.inc
> index e5611a12a66..230a266563a 100644
> --- a/meta/conf/machine/include/riscv/arch-riscv.inc
> +++ b/meta/conf/machine/include/riscv/arch-riscv.inc
> @@ -7,6 +7,8 @@ TUNE_PKGARCH = "${TUNE_PKGARCH:tune-${DEFAULTTUNE}}"
>  TUNE_CCARGS:append = "${@bb.utils.contains('TUNE_FEATURES', 'riscv64nf', ' -mabi=lp64', ' ', d)}"
>  TUNE_CCARGS:append = "${@bb.utils.contains('TUNE_FEATURES', 'riscv32nf', ' -mabi=ilp32', ' ', d)}"
>
> +TUNE_CCARGS:append = "${@bb.utils.contains('TUNE_FEATURES', 'riscv64nc', ' -march=rv64imafd', ' ', d)}"

I thought Linux expected compressed instruction support, is there
actual hardware that doesn't have compressed instructions?

Alistair

> +
>  # Fix: ld: unrecognized option '--hash-style=sysv'
>  LINKER_HASH_STYLE:libc-newlib = ""
>  # Fix: ld: unrecognized option '--hash-style=gnu'
> diff --git a/meta/conf/machine/include/riscv/tune-riscv.inc b/meta/conf/machine/include/riscv/tune-riscv.inc
> index cc2896f277b..659801496c9 100644
> --- a/meta/conf/machine/include/riscv/tune-riscv.inc
> +++ b/meta/conf/machine/include/riscv/tune-riscv.inc
> @@ -6,6 +6,8 @@ TUNEVALID[riscv32] = "Enable 32-bit RISC-V optimizations"
>  TUNEVALID[riscv64nf] = "Enable 64-bit RISC-V optimizations no floating point"
>  TUNEVALID[riscv32nf] = "Enable 32-bit RISC-V optimizations no floating point"
>
> +TUNEVALID[riscv64nc] = "Enable 64-bit RISC-V optimizations without compressed instructions"
> +
>  TUNEVALID[bigendian] = "Big endian mode"
>
>  AVAILTUNES += "riscv64 riscv32 riscv64nf riscv32nf"
> @@ -31,3 +33,9 @@ TUNE_FEATURES:tune-riscv32nf = "${TUNE_FEATURES:tune-riscv32} riscv32nf"
>  TUNE_ARCH:tune-riscv32nf = "riscv32"
>  TUNE_PKGARCH:tune-riscv32nf = "riscv32nf"
>  PACKAGE_EXTRA_ARCHS:tune-riscv32nf = "riscv32nf"
> +
> +# no compressed
> +TUNE_FEATURES:tune-riscv64nc = "${TUNE_FEATURES:tune-riscv64} riscv64nc"
> +TUNE_ARCH:tune-riscv64nc = "riscv64"
> +TUNE_PKGARCH:tune-riscv64nc = "riscv64nc"
> +PACKAGE_EXTRA_ARCHS:tune-riscv64nc = "riscv64nc"
> --
> 2.35.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164378): https://lists.openembedded.org/g/openembedded-core/message/164378
> Mute This Topic: https://lists.openembedded.org/mt/90456787/3619028
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alistair23@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

