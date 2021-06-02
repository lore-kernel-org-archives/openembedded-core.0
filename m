Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web11.1171.1622678408254168104
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jun 2021 17:00:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=la7UrnBv;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id q6so2346387qvb.2
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Jun 2021 17:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4HKTZ/WWmVDx6cEqhDdQgYKq8sphD50nF0gsqRbmC2M=;
        b=la7UrnBviiXq8JQ+CQHg9wiHvcW0PvnvVvSTOdmDms8NOF/l4i2ulCaSj3ctLitxnA
         XAWTVwlnGKUrbBDxPVSqkE/g/ibJ/q3pyGrO9OABlXZoWD9ZyNkBHPFKGOhO9qBP6WA1
         OIPSmF1rbpb1Mun7xMfXfh+hf5EkFsYvCOQ/QCe+xxQgIXyZU6uEy2XobVnCeOup8xMN
         5jaKsfQ2Z0vlFlZqIkf9Wc+dcy/VKGN0bh8PjbAW2k5XcxDjxi1Z3TvYpDqoZD6rH+VM
         LA6GDWe6HD7ScjdFq4W/zAqr761hMPgdTxsbl9ftYAT2NK5kiWvYC9JAZA6kJw6V+yyy
         K8Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4HKTZ/WWmVDx6cEqhDdQgYKq8sphD50nF0gsqRbmC2M=;
        b=gDT9XP23ZfNnmShVhh/tvPHq935brjiV9tD9jOJcglaeImKqb1X8G7ES3c4/sOWnO9
         RmaUs12ocj5KAj7QvSEQxSLR6YqTTl68uYWfgJQEAiqOlGNjsSxmh+ppraJ9xEfe1Uj6
         cqUj5TFWM4pQfoz7UzR801hA8da7wgTmGVhV/6JGjz5apFQ4LEGyzMKXnOXyH5/YM1tm
         xWsSOlRgOq+THERplkiLCHHSgCqNiICZOlTKA/zqlBqifXS0FekwZy5ON60fwRn+ybTw
         qCsEN4ip3WF7tKlpyW2qf/8cLXwwIL7HA40cySuLPerWJyEhk7Idcl/gunmgfryWnUSr
         XtJQ==
X-Gm-Message-State: AOAM533UiHmDAuN/lk8YediJQKXDnMrBHOZy63QBZ66FGiix5KkGJO31
	jmNzA338uPTEqQQtNMomi2oO/pXC01B02V+pLaU=
X-Google-Smtp-Source: ABdhPJyJZoCUDixYCbb8UrGJQ6Dmscipg0vo9bMtivRoUH2F+BnycSrh88RiRkPj8w+F0ToZ2QGyxD+80by9345wsik=
X-Received: by 2002:a05:6214:258d:: with SMTP id fq13mr31458354qvb.50.1622678407276;
 Wed, 02 Jun 2021 17:00:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210602232104.3490139-1-alistair.francis@wdc.com>
In-Reply-To: <20210602232104.3490139-1-alistair.francis@wdc.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 2 Jun 2021 16:59:41 -0700
Message-ID: <CAMKF1spg_GwUojZXzsoQYYB3C0PTL032Aa-UXokdE=ZydsuMvQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] recipes-bsp/opensbi: Disable FW_PIC
To: Alistair Francis <alistair.francis@wdc.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Thanks Alistair

All three patches look good in my testing on beaglev

Acked-by: Khem Raj <raj.khem@gmail.com>

On Wed, Jun 2, 2021 at 4:21 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Disable FW_PIC to fix the error message:
>
> opensbi-0.9-r0 do_package_qa: QA Issue: File /share/opensbi/lp64/generic/firmware/fw_jump.elf in package opensbi doesn't have GNU_HASH (didn't pass LDFLAGS?)
>
> This is seen in newer versions of OpenSBI that enable FW_PIC by default.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  meta/recipes-bsp/opensbi/opensbi_0.9.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-bsp/opensbi/opensbi_0.9.bb b/meta/recipes-bsp/opensbi/opensbi_0.9.bb
> index cb1c3f2ebf..52965abda5 100644
> --- a/meta/recipes-bsp/opensbi/opensbi_0.9.bb
> +++ b/meta/recipes-bsp/opensbi/opensbi_0.9.bb
> @@ -15,7 +15,7 @@ SRC_URI = "git://github.com/riscv/opensbi.git;branch=master \
>
>  S = "${WORKDIR}/git"
>
> -EXTRA_OEMAKE += "PLATFORM=${RISCV_SBI_PLAT} I=${D}"
> +EXTRA_OEMAKE += "PLATFORM=${RISCV_SBI_PLAT} I=${D} FW_PIC=n"
>  # If RISCV_SBI_PAYLOAD is set then include it as a payload
>  EXTRA_OEMAKE_append = " ${@riscv_get_extra_oemake_image(d)}"
>
> --
> 2.31.1
>
