Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68C0FC4167B
	for <webhook@archiver.kernel.org>; Sun,  3 Dec 2023 16:25:15 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web10.42595.1701620706179107001
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Dec 2023 08:25:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HcktHa4H;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6d81faeefc4so1891093a34.2
        for <openembedded-core@lists.openembedded.org>; Sun, 03 Dec 2023 08:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701620705; x=1702225505; darn=lists.openembedded.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDpxHVomDy0eKnWjfJscSgeNL+5bT/qqJMmLRdg1Bmg=;
        b=HcktHa4HTQOHNKuT+6WA6FayVMiog9Cme4aBs8Qk6d4r7LZBe8tHZA1CsK6y3I1XJQ
         JO7USQK83/kI4BlSFcDBcWI8vXv45LRaXzwF8qSpC54XFpoKpMWxPA42PKqQP5zWB+wc
         rEtpAeHoGFLE2x6P0Dup/tnpAR8hUTSGDjqzGA5idL1bs8AX/RRpLGko4Qj0pSL7lZDG
         aHJc7Iii1hz1eGaiZG3biPq9YEeecl0rxh1Bc3RZeLMooPQZd/TGz4y4rPPEPWbAVrUi
         bjpHyiRt86DkAiKS0TUxS41f99hdwLURVhDrJRaXvXPY2Ztvf66IEJ/0a53+MscAUZyA
         FrOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701620705; x=1702225505;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FDpxHVomDy0eKnWjfJscSgeNL+5bT/qqJMmLRdg1Bmg=;
        b=HN+JQezh/5k4os4htQ0XRkgii7uz6AIStE2lQaCT3kSJMOBxM4chTXgZK02aYjd1q1
         YDHQuH6M3z2VIlh8eGN6hNnFidRN7y70XkIe6VUUOeUuY2tYGHa0RGAhNeME9qGtT/Ty
         xvacvBXMhBtUi/cNPyWMeAzR6vB66avEkpY+BMP26POxwGjANGcajKtSWdYy5JIfvBFd
         Gw0XCBRBXKUTiZj//ynF9b6B7A4Pg5BBSP6GVO2dFG0QxigKNeO3ydRkrLKgE+C2DB43
         YVhOh4ChMYXwp98zyJunCPDXT4JYrVUUCPsMBMhIoZOHTg9LmhwBK9DyHW6k5H7DkkrR
         QUXw==
X-Gm-Message-State: AOJu0YzbOd2huZnSz+NNE8VQ/d0aN30S1GnT3aRECyqZgGA1HcEcgdNJ
	mCo/49Rejif3gvqifpaQ1JtaHIHlOffgk9JyWJ2Ve84DqjI=
X-Google-Smtp-Source: AGHT+IFctfk9i21w9bXDRVHMTTrXJK69UQG/lsM9xvTz9DRoZMoM0UiKNRTjWfVzt+wE/OwAhh/kqGMNJWcHn3Ot6u8=
X-Received: by 2002:a05:6870:171e:b0:1fb:75a:6d1b with SMTP id
 h30-20020a056870171e00b001fb075a6d1bmr3528242oae.66.1701620705075; Sun, 03
 Dec 2023 08:25:05 -0800 (PST)
MIME-Version: 1.0
References: <20231202065754.3646660-1-raj.khem@gmail.com>
In-Reply-To: <20231202065754.3646660-1-raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 3 Dec 2023 08:24:38 -0800
Message-ID: <CAMKF1sp5MaNo=VshZA3A-Gdmkbu0rEfK3_u4PSshy1-jLKWYNQ@mail.gmail.com>
Subject: Re: [PATCH] musl: Update to latest tip of trunk
To: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Dec 2023 16:25:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191717

There are two issues with this

1. SRC_URI needs to fall back to using git protocol
2. basename has been removed from string.h which causes few recipes to buil=
d [1]

I will see to work though them before we apply this patch

[1] https://errors.yoctoproject.org/Errors/Build/175430/

On Fri, Dec 1, 2023 at 10:57=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> * f314e133 mntent: fields are delimited only by tabs or spaces, not gener=
al whitespace
> * ee1d39bc mntent: unescape octal sequences
> * e17b9d74 ldso: fix TLSDESC addend processing on archs with backwards de=
scriptors
> * 039d3c34 ldso: convert TLSDESC_BACKWARDS from "#ifdef" to "if" logic
> * 7b6a6516 byte-based printf family: emit a nul byte for %lc with argumen=
t zero
> * 8c086e76 remove arbitrary limit from dns result parsing
> * 2265a4c9 pass AT_NO_AUTOMOUNT when emulating fstatat via statx
> * 2d84486a __year_to_secs: fix dangling pointer
> * c5459df1 timer_create: volatile static -> static volatile
> * 7bb11f75 ensure valid setxid return value in an unexpected error case
> * 7f3a2925 synccall: add separate exit_sem to fix thread release logic bu=
g
> * 5baf2d92 ldso: use __ehdr_start if available to locate its own ELF head=
ers
> * 725e17ed remove non-prototype declaration of basename from string.h
> * 6be76895 elf.h: add typedefs for Elf64_Relr and Elf32_Relr
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/musl/musl_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/=
musl_git.bb
> index 7dd949ffafd..87ac1641af1 100644
> --- a/meta/recipes-core/musl/musl_git.bb
> +++ b/meta/recipes-core/musl/musl_git.bb
> @@ -4,7 +4,7 @@
>  require musl.inc
>  inherit linuxloader
>
> -SRCREV =3D "79bdacff83a6bd5b70ff5ae5eb8b6de82c2f7c30"
> +SRCREV =3D "f314e133929b6379eccc632bef32eaebb66a7335"
>
>  BASEVER =3D "1.2.4"
>
> --
> 2.43.0
>

