Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web08.3601.1627073546507376986
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jul 2021 13:52:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=LuHRtSWU;
 spf=pass (domain: ossystems.com.br, ip: 209.85.219.42, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qv1-f42.google.com with SMTP id j4so1943928qvp.9
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Jul 2021 13:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4wQ22nALqV7LolBxy3RVFgzp7dSJGKv6KG8Y+LAdZEg=;
        b=LuHRtSWUiJi9n2/ZK/5Z8n2DnBZGGWZhFUU3V4xTUEQU/xEX0pbpgavChPc6MoczYT
         KwJhS/xKOmfbPhjn2BEupeVueEqEzBz/u9w1bh1VVe1qFYb4lPtqBtNl6yvoRAI58sGV
         qEMKXX+3UOymkmz3djZsioIkL3iAS2zr+yw8WRZHG9z7983f01LTPE9Ehyr+IUKbZzmn
         /vgkX7/o7vmqKHj/UE4149XJlEFN4hiQjX6sZCsCI4wy3cZoBcx/KD4RtaSuH30R28/4
         Pna13B38YaiDNH3Qihxq8WAYRydQNGrXy6TpbmR8vJLh5ADkjj888ah3hV0VZ4BOUX6V
         f8pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4wQ22nALqV7LolBxy3RVFgzp7dSJGKv6KG8Y+LAdZEg=;
        b=pR9EVMmBrS+RiZY9cTNptDRb0MHk7lmQCfFC0HKk8Q1ZgsR85I1YrBLt62YzzmkDMx
         yPVwursLVbY+0S9vqtArPB5ZcudRL+IdfX3nwzPKjQkB5Y7VpRqhJhV+w05N5EmKV/jx
         1pOFtHFNgmNK3EyO4gkLeA9Wr/jjleqVAYrRkMxXSh4DkaF49Y3B8OrT+5dYlIgQQr2f
         u8HcBEhVMuV1EBG5+dO/Fzf+gFu9yeqVRJSyp+bMm/F+56uQAGhBit56gWeIP2Q+Syx8
         chh4/uhg3yMnxGlJ7G9geEuuv+mqSLOQZbMGzT8aOQGSKEvD9vNWNtwzeLhcueYVdGGc
         v9aw==
X-Gm-Message-State: AOAM531EQb+IJWZGzlttbrJlT7HfTT2Q6r8/7lDQZrlNIup7GEcclsaC
	8O1SR2ao9KSH8yEm+g11e+TUkbmOVCFUZ7FF
X-Google-Smtp-Source: ABdhPJwkvT+fpqsWSqlYH/yWgXM+FyCCdGusyF4MwcOSeLYehkT/zUIXEvUEsl7PlOty+4W4LzPIhg==
X-Received: by 2002:a05:6214:ac1:: with SMTP id g1mr6763877qvi.51.1627073545393;
        Fri, 23 Jul 2021 13:52:25 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com. [209.85.160.172])
        by smtp.gmail.com with ESMTPSA id l6sm15000428qkk.117.2021.07.23.13.52.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jul 2021 13:52:25 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qt1-f172.google.com with SMTP id t18so2525906qta.8
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Jul 2021 13:52:25 -0700 (PDT)
X-Received: by 2002:ac8:5490:: with SMTP id h16mr5476160qtq.217.1627073544804;
 Fri, 23 Jul 2021 13:52:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210723001927.42892-1-anuj.mittal@intel.com>
In-Reply-To: <20210723001927.42892-1-anuj.mittal@intel.com>
Date: Fri, 23 Jul 2021 17:52:13 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrhqfHAQHgJz-CvJWoObGmgB-Yp-7kOv3Bz3ZWwfEz74g@mail.gmail.com>
Message-ID: <CAP9ODKrhqfHAQHgJz-CvJWoObGmgB-Yp-7kOv3Bz3ZWwfEz74g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Revert "Revert "libubootenv: inherit uboot-config""
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I am against reverting it again. We discussed alternatives, which
could solve the problem.

Em qui., 22 de jul. de 2021 =C3=A0s 21:19, Anuj Mittal
<anuj.mittal@intel.com> escreveu:
>
> This reverts commit be1cf223bf9c514ee81820ded5b13318458c0daf.
>
> The original change was added to resolve build errors [1] for MACHINE
> values that don't have u-boot support. This recipe was, after that
> change, skipped in world builds for those MACHINEs.
>
> But we should be able to build libubootenv with or without u-boot
> support [2] so the original solution to inherit uboot-config was not
> perfect. But until we have a better solution, revert this so
> builds don't fail for others.
>
> [1] https://lists.openembedded.org/g/openembedded-core/message/153508
> [2] https://lists.openembedded.org/g/openembedded-core/message/153614
>
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
>  meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb b/meta/recipes=
-bsp/u-boot/libubootenv_0.3.2.bb
> index 6774290ea5..cb59dd3f1d 100644
> --- a/meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb
> +++ b/meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb
> @@ -15,7 +15,7 @@ SRCREV =3D "ba7564f5006d09bec51058cf4f5ac90d4dc18b3c"
>
>  S =3D "${WORKDIR}/git"
>
> -inherit cmake lib_package
> +inherit uboot-config cmake lib_package
>
>  EXTRA_OECMAKE =3D "-DCMAKE_BUILD_TYPE=3DRelease"
>
> --
> 2.31.1
>
>
>=20
>


--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
