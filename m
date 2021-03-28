Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web09.2282.1616891998373510275
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Mar 2021 17:39:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=izp6Rzai;
 spf=pass (domain: gmail.com, ip: 209.85.166.180, mailfrom: alistair23@gmail.com)
Received: by mail-il1-f180.google.com with SMTP id y17so8249794ila.6
        for <openembedded-core@lists.openembedded.org>; Sat, 27 Mar 2021 17:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LueHZioKiBwF+NhwwEifpPGedOVDIucJ/yQnkm7fBq0=;
        b=izp6RzaiMVdHMMIyMZI8RZWllyFj32pHvW8a5oi0y7MNlqbJKxJSHLUXnFSZUPBPZE
         uP+FFmSODb9JHFJmSrl0Lsp0KpU3XgevyoMSKwxbVdDdBexPi3ymxYd2AV9uHh4oRVHz
         itC/YeRlmLcGR1qnueC1noFR6DkjYja1sJ7crQFTdm36xD+BWB98atIS0u5J9/427Lb3
         O4vbz6Ibbs1wwCm9RT09NVf67YYGKTh2tRCJlc/811Rta+XvAG7Pk1/VdK0QUQvgNZ25
         XCPGCbCh7GkI3gZ/E5b2+mremBRRXIMSWH3b/GUS4XPVbZPacyX6tCR4FmUjvY04LrtM
         2Dcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LueHZioKiBwF+NhwwEifpPGedOVDIucJ/yQnkm7fBq0=;
        b=JB/ApF5JNGRu/MI7XFlj77/cqaVKM7xMJPuF/WU5err7aMORSQy1SYy2w3P3BhJ/rP
         /tWTDFmyudJuqd3fmnCiwMeEQvl9Hb4CxyXnWB8Ul7j91leB6pHti6QwGUIsNythhB83
         EM4mDsnmFsM8TSuMXVninx88gb7tSdpm3DunEOFI6QWolA+B5QS/U4wypwxeuGwbNDJ7
         H/LcbBrbvEWD3biFwCJ4AUPi2ge3VOiekfOdGJoNoqnqz1qQqH7WH6wIg6LQqDgprfX4
         Dwz905DMGj5ZmGBj/3yc2en7XVSuysuvJqlsX/gOHHoAAQkgZgWlpkXZx1D3uzvFslOg
         KevA==
X-Gm-Message-State: AOAM531zYahlYYIKje3I98o9bkAW80GPA/QHxVPu+l2aA2WAg192/DwJ
	/Ge76Ao92L7fH5CWRqSzeKSdQ+sxxQvfOIxkRSo=
X-Google-Smtp-Source: ABdhPJxP38dCUVbiemPGKpJd+4IfpZclPRvMPnslHAvoZh8BlhJNAj5jUmC6WHMwmoMDue2YcV3Le7/wZDuE9TLslHE=
X-Received: by 2002:a92:da89:: with SMTP id u9mr11960941iln.131.1616891997814;
 Sat, 27 Mar 2021 17:39:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210326043708.1118307-1-raj.khem@gmail.com>
In-Reply-To: <20210326043708.1118307-1-raj.khem@gmail.com>
From: "Alistair Francis" <alistair23@gmail.com>
Date: Sat, 27 Mar 2021 20:39:28 -0400
Message-ID: <CAKmqyKO7-fFNwj6o2HWCL7Uy4YGW7-ew=BLHGXxXaTCt=kukmw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] grub2: Disable for RISCV32
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 26, 2021 at 12:37 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> A full working port is not available yet, until such time disable it
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Alistair Francis <alistair.francis@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  meta/recipes-bsp/grub/grub2.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
> index bcff676c26..d88c3fd3ad 100644
> --- a/meta/recipes-bsp/grub/grub2.inc
> +++ b/meta/recipes-bsp/grub/grub2.inc
> @@ -33,7 +33,7 @@ UPSTREAM_CHECK_REGEX = "grub-(?P<pver>\d+(\.\d+)+)\.tar\.(gz|xz)"
>
>  DEPENDS = "flex-native bison-native gettext-native"
>
> -COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*|riscv.*)-(linux.*|freebsd.*)'
> +COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*|riscv64)-(linux.*|freebsd.*)'
>  COMPATIBLE_HOST_armv7a = 'null'
>  COMPATIBLE_HOST_armv7ve = 'null'
>
> --
> 2.31.0
>
>
> 
>
