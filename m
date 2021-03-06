Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web11.9098.1615045690475377528
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Mar 2021 07:48:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bGBq9g+n;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id 130so5105636qkh.11
        for <openembedded-core@lists.openembedded.org>; Sat, 06 Mar 2021 07:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=97ypy3Ch24+ZT1lKFxACQv9bOx0jrpjXxT/ZVR2J48U=;
        b=bGBq9g+n3imk0CyuiQpmGxI91Z6xOS420koQB9Kpvg8TgI/LoOh3VuWPGQvjMxWeBY
         qhBHZnneTT9hGHLBiZioQcZygMWvZx1AV0ubmJS5zSlcgpDIjt+Q/E6TXf4ApzTQ0hGg
         CYPDpPOp7ngdpliI6oavc10CnScjRTy47WILi21w2CQxoVNOC/OFLCIVnv7tKimtwtgF
         PQxHCiZ+/li/G4q/0/II/sba/QKTru2cWFFzrTEplrGAmXSOpap7SMHuoNDEe70B6MZ4
         MlqoLZrJO6Gz2yvMsOZgEn+8WBUmevf9u09XgKYSQ9tzV8gjsAQTUi/kei8c4QPOt/fZ
         h5qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=97ypy3Ch24+ZT1lKFxACQv9bOx0jrpjXxT/ZVR2J48U=;
        b=E9avVmojPDf+zx5frcdJ1GdJV0nSQA50mG1qJ/FwiQa3DS1pN18LlvJ6siSIlh0umr
         qn2hR10coWElWlJ9tj7WWYzri1UMn+UN3DEkO5oSt6gtPoztwA/bg48nJDhF3bbw8HDs
         Ad4Xvs6NnpT+DLmN8fqvgBuhQwkImmTx9J+9+Jm4dOyyTfredO3i/tyIyxe3MV6PwK9+
         QeSrkQPHqKaUxk21C3yilmQY5muzO1I7SlISDyO0iiJ63JA9qslfw3IRy/yPafU0FW7e
         I6CFGfgqe6thNHCorWkJvwi5nRBVNontgGpLR9U6qOwFx0os9dGUWB+BNHz4GQAU/KyK
         UkKA==
X-Gm-Message-State: AOAM533Fg6Lk+Z4m4GzQ2xTpETap08/PafV9ThYt6LJD000c8nQf81cv
	u+ExuwmBMnFNCaSyMkETF1EyEFewMnTr5Uh3RWw=
X-Google-Smtp-Source: ABdhPJyOUXjEze9S9hb9r7B2hxH4f0wDnoNzAjciEo+aKXpm0eEzPXrI2vY3S9P1u2k9Fv6GVWsTEvpko6IwYr476Bs=
X-Received: by 2002:a37:8ec4:: with SMTP id q187mr13776700qkd.381.1615045689417;
 Sat, 06 Mar 2021 07:48:09 -0800 (PST)
MIME-Version: 1.0
References: <1614817826-40571-1-git-send-email-wangmy@cn.fujitsu.com>
In-Reply-To: <1614817826-40571-1-git-send-email-wangmy@cn.fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 6 Mar 2021 07:47:42 -0800
Message-ID: <CAMKF1sqwAAyw1spRROMWXvW_pQWmTyzB-DiOOFq-rbUPo1k1xg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] vala: upgrade 0.50.3 -> 0.50.4
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

this break dconf-editor in meta-openembedded

https://errors.yoctoproject.org/Errors/Details/573677/

On Wed, Mar 3, 2021 at 4:33 PM Wang Mingyu <wangmy@cn.fujitsu.com> wrote:
>
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  meta/recipes-devtools/vala/{vala_0.50.3.bb => vala_0.50.4.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/vala/{vala_0.50.3.bb => vala_0.50.4.bb} (50%)
>
> diff --git a/meta/recipes-devtools/vala/vala_0.50.3.bb b/meta/recipes-devtools/vala/vala_0.50.4.bb
> similarity index 50%
> rename from meta/recipes-devtools/vala/vala_0.50.3.bb
> rename to meta/recipes-devtools/vala/vala_0.50.4.bb
> index 302f562549..4381635517 100644
> --- a/meta/recipes-devtools/vala/vala_0.50.3.bb
> +++ b/meta/recipes-devtools/vala/vala_0.50.4.bb
> @@ -2,4 +2,4 @@ require ${BPN}.inc
>
>  SRC_URI += " file://0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch"
>
> -SRC_URI[sha256sum] = "6165c1b42beca4856e2fb9a31c5e81949d76fa670e2f0cfc8389ce9b95eca5db"
> +SRC_URI[sha256sum] = "58fc31fa8bf492035b11d1a7d514801710afc65bd458b24c0f8d00280a92a38c"
> --
> 2.25.1
>
>
> 
>
