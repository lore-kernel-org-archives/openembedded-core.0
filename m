Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web08.450.1625678203076196882
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jul 2021 10:16:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hWBWrfWI;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id d2so1411647qvh.2
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jul 2021 10:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=5AGsIXLo3Q3Kgx+dwIPNyfAfaXYKfJ5eTEXeBN/Lyzs=;
        b=hWBWrfWIDM1/gkigQdGClMhwUADKgKgacA21tQ9FqLsEStmOjurCHKZarxivv4wZaP
         G/ufdzj1TzcXIkEtev4sCOUfz/E7iuKRBSG0KHMOcqtc0GYmMnQhShtnbsdiSC/sBKAT
         5IBwHNOU6MBA+n+g1VNI1qoX2AWjSmzTFSiqN+NfCgRX2YYddpMZsfDwiqWEPbt0E0g8
         HPGViPm5gK9eXyy8i09N5qIJg157ftvQ4UgMtwucm4l4veDESrRe33x82rgdMrFGq6r6
         A12mQZHP7uPUpC+EHne/3vx+7KyAl01JKsp3lLFEuBe9TRbOZIE46WLKuuqKnY1+EARy
         wgfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=5AGsIXLo3Q3Kgx+dwIPNyfAfaXYKfJ5eTEXeBN/Lyzs=;
        b=c3VWs9zYIxp+9gwAfoq9uFlm/eW9OIVaJAJBMtXsIW4essl1Zs85Okq9Ydp4dt4P6Q
         Sy17D3ET9IOMRPHM67Haxy+WBvFx7g7/V2TKJtHI7Du+BoNIjhaO88gQU6+eFW5kHlPC
         N5pKPwigXsHLNFJCVkJpQtqGiqJPxiLUnknKygMQ6RlfDFcYwQzIAuG9vzy1M4xOupcM
         FYWrm1lNZvyo7bhg0jorDDISwlW7BTHRPWiOcx0VhcmMNxrExLFvNgzDYfd13xJJjkNH
         WyD9TkNKw1v/RbNpp8Gtq5Dz3vKUlNHLnwsELHBY+l7uL/ALP2Yu0xc3cYK+NNdmZ1ZB
         lp6Q==
X-Gm-Message-State: AOAM533MhSTY8olyps+gBNjSTcznJywW61BzC7W6g4HvnVUn7+9tPmgT
	UlrAyNIKMg2xFluN+jP/XpkCzC3W/Bndl03Hal62xeuFPuo=
X-Google-Smtp-Source: ABdhPJy5DhobZ6WSNN7OkV1cmabDWx4SpJZUsJz66kVB2BDWUmefKwTNABc6Vem7rKIm15AoLdQD1Ho0Pti5aCgJ8cY=
X-Received: by 2002:a0c:ecc8:: with SMTP id o8mr25087574qvq.55.1625678202073;
 Wed, 07 Jul 2021 10:16:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210624165421.32088-1-raj.khem@gmail.com>
In-Reply-To: <20210624165421.32088-1-raj.khem@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 7 Jul 2021 10:16:16 -0700
Message-ID: <CAMKF1soqvCNDPaZtAStEyT6W1S_KdQyyfuu_L0inj3re9AQosQ@mail.gmail.com>
Subject: Re: [PATCH] esdk: locked sig mismatch warnings when build from esdk env
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

ping

On Thu, Jun 24, 2021 at 9:54 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> From: Mani Selvaraj <mani_selvaraj@comcast.com>
>
> A repo with multiple layers are placed under /layers/ and a repo
> with single layer is placed under /layers/openembedded-core in esdk.
> This tiggered locked sig mismatch warnings when building image from
> esdk environment.
> -----
> TOPDIR=/Code/build
> corebase=/Code/openembedded-core
> -----
> /Code/meta-java
> /Code/meta-gplv2
> /Code/meta-openembedded/meta-webserver
> /Code/meta-openembedded/meta-oe
> /Code/openembedded-core/meta
> Are moved to
> /sdk_org/layers/openembedded-core/meta-gplv2
> /sdk_org/layers/openembedded-core/meta-java
> /sdk_org/layers/meta-openembedded/meta-webserver
> /sdk_org/layers/meta-openembedded/meta-oe
> /sdk_org/layers/openembedded-core/meta
>
> here fix it to move all layers under /layers dir.
>
> to check this fix build image from esdk environment and
> check for sig mismatch warnings.
>
> Signed-off-by: Mani Selvaraj <mani_selvaraj@comcast.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/lib/oe/copy_buildsystem.py | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/meta/lib/oe/copy_buildsystem.py b/meta/lib/oe/copy_buildsystem.py
> index d97bf9d1b9..4998afa60f 100644
> --- a/meta/lib/oe/copy_buildsystem.py
> +++ b/meta/lib/oe/copy_buildsystem.py
> @@ -102,8 +102,6 @@ class BuildSystem(object):
>                  layerdestpath += '/' + os.path.basename(corebase)
>              else:
>                  layer_relative = os.path.relpath(layer, corebase)
> -                if os.path.dirname(layer_relative) == corebase_relative:
> -                    layer_relative = os.path.dirname(corebase_relative) + '/' + layernewname
>                  layer_relative = os.path.basename(corebase) + '/' + layer_relative
>                  if os.path.dirname(layer_relative) != layernewname:
>                      layerdestpath += '/' + os.path.dirname(layer_relative)
> --
> 2.32.0
>
