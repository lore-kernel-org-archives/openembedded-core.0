Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web08.497.1631555798466089144
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Sep 2021 10:56:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bRuDkMzj;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id s32so8837313qtc.12
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Sep 2021 10:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Fri/zLDJRx0yZgaQ9anuvWsmVz71xg86CuhBa4lsjmo=;
        b=bRuDkMzjDnOOj7Rwrmls1FAU9YnY+/ikQQT6EwW7/vcff2Zx+vn3Lp2mrOAE6p2yqJ
         RsPKtGXNEdHfQJpmiPt5CX+A8UA9Ogp0odku5MKrZUhRPslUlzHPadEMirAWKVRLYfC3
         MtNSnJFxbaqZXAn9ixuptY4Fp+pkC80bJshzOqpWrQgOIuTWEvpar9sH4z9DgUPraxXm
         VNfOgjJjQ7QPcZg6R0Xo0SVSVVzM9bV6D+Sy/yMf35jmaE3hnAoyifMCov2yPkdEC8FG
         XGDSovuPi1WslGo+Di0eKd4Jk9aRRW9g6sBE/jAIHcuIhxe/O7ZIR16gSGS33BDBASEs
         wG0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Fri/zLDJRx0yZgaQ9anuvWsmVz71xg86CuhBa4lsjmo=;
        b=jukJBJPVWkVHJHBbmpQGJAqd9TMDg+u2tsm+mlXLHQNZDDDLTBNoK2mMgp+tzRQlS5
         9FztZilsvWCshYm0Ny9cI/fxSYkHJlnfs29yNVxv8Y0gP7oKhhb7h79n4fC+2nXqS3xD
         5KzfqPjAkIkY5dlWF2iCkpVteqv2JZuFg4f96XWZBL62eXfwMryp4X/cmmWmRfB9rZlh
         fI2pWb0p8ZDEklUWbFoDwViJ0uTAtaHN/dfDB5ZoXgSfpkRmP22EisbfdYAXkOmt6/Jt
         o0IAa7X3B6lKaz4ojrzM0X/PrE8MIoR6o6Ii8gAnx/Z1aB2yrUo2Yn7CC+dlX9iZutiE
         sMfA==
X-Gm-Message-State: AOAM533AnjkvgrYPG/HvGyDyC6xh/5M4yOi1vEkeUuZfS8+JoeE+hM2+
	tbXnCMTCf+uTcI4fFZZhJUFhGI8rChT3O0sUDdE=
X-Google-Smtp-Source: ABdhPJwi+b0sHjXELaZNir+vpyH0zp4w+m/WNO5ELEoNgQ+ewL7jVvnQ1RnnnwXEUnceIvujc4xsXa0zRB7L9MK0BOM=
X-Received: by 2002:ac8:78c:: with SMTP id l12mr824102qth.112.1631555797465;
 Mon, 13 Sep 2021 10:56:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210913173513.176653-1-pgowda.cve@gmail.com> <20210913173513.176653-4-pgowda.cve@gmail.com>
In-Reply-To: <20210913173513.176653-4-pgowda.cve@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 13 Sep 2021 10:56:11 -0700
Message-ID: <CAMKF1spEPofycJT3jYU48b9tkLtcTYvcQEX_Wmu5=o0kV1H3cw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/4] Modify target cpu for powerpc to "7400"
To: Pgowda <pgowda.cve@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Randy MacLeod <rwmacleod@gmail.com>, 
	umesh kalappa0 <umesh.kalappa0@gmail.com>, Vinay Kumar <vinay.m.engg@gmail.com>, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 13, 2021 at 10:35 AM Pgowda <pgowda.cve@gmail.com> wrote:
>
> During rust testing, some ui test failed due to following message.
> 'powerpc' is not a recognized processor for this target in rust
>
> Hence the target cpu was renamed to "7400" in "llvm_cpu" as per
> default tune for qemuppc.
>
> Signed-off-by: Pgowda <pgowda.cve@gmail.com>
> ---
>  meta/recipes-devtools/rust/rust-common.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/rust/rust-common.inc b/meta/recipes-devtools/rust/rust-common.inc
> index 153fa3aa97..aece1247a4 100644
> --- a/meta/recipes-devtools/rust/rust-common.inc
> +++ b/meta/recipes-devtools/rust/rust-common.inc
> @@ -265,7 +265,7 @@ def llvm_cpu(d):
>      trans['x86-64'] = "x86-64"
>      trans['i686'] = "i686"
>      trans['i586'] = "i586"
> -    trans['powerpc'] = "powerpc"
> +    trans['powerpc'] = "7400"

interesting. what happens if you use 'ppc'

>      trans['mips64'] = "mips64"
>      trans['mips64el'] = "mips64"
>      trans['riscv64'] = "generic-rv64"
> --
> 2.31.1
>
>
> 
>
