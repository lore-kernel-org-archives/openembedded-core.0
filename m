Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CAE5C71133
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 07:54:34 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.8816.1692950066068689745
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Aug 2023 00:54:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SCpJHc8I;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-400a087b0bfso5446245e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 00:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1692950064; x=1693554864;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1k0VGrih4v8HeylKS4xjKhM+BXRkEr0HaPyg1ZzDrzk=;
        b=SCpJHc8IcsYgHj5eX+vvkcjGY5XBUUmKez+esQ+a3T1p/8xKH3+tmpWauGs0KYMy2D
         2pfUqdwSOWpuJMQVl62aj8VQp7nL5WYE0keYFHxcK8tMlLLZkuPRiTWWD6LZBWFU5KDQ
         jB3X4F5ho2sSuKHjdQWncbl4sEVOucvEJfz80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692950064; x=1693554864;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1k0VGrih4v8HeylKS4xjKhM+BXRkEr0HaPyg1ZzDrzk=;
        b=dj+SYSYIhRkW+gJG9+e14MYho4U4Eo+lSkxFofDtZyXf8HbPnq7tSPDWsKJ7U75uP+
         he13WOfCnVVck11WJDiNK/Izu07+z1VsXziq02SwlKPiASkciEpQ2hAo0lPQtrhuSQBW
         wuM9rXzfOtWdsS90UGZ/PrsZeD5yO28zDcA2CDj0nQgSln3yAr2wp3D9mBloqmB8wwiA
         x+k2+z3XaiUrH6h0cApSmJfRSrjDl/u/GX+RK9nyYdf3yvBnk5zc/MPLzKrziIrQJa0f
         zRVr4Epi81//mBX/aY/j/OiNfTzNIg7bH+2Z5Fnf4ASSRa5gGZPITVV4gQskjoyLJiFN
         eEiw==
X-Gm-Message-State: AOJu0Yyl5LF8vmevWwXkNcVgbouHWYZtd5yN44FCeI0Mil/WYhy6wHK6
	DnnPuigmx/MK19h/oy03GQGyjQ==
X-Google-Smtp-Source: AGHT+IEEsHO+B5JpASF/v1HzroOAzzQh5E8/QkF7fL3KZXwQX2CYsxtmms9Rb7Cv/BWt2Vz9iyJZ5A==
X-Received: by 2002:a05:600c:21d6:b0:3fe:fe71:14db with SMTP id x22-20020a05600c21d600b003fefe7114dbmr6911961wmj.12.1692950064502;
        Fri, 25 Aug 2023 00:54:24 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5f51:6592:7dd5:4623? ([2001:8b0:aba:5f3c:5f51:6592:7dd5:4623])
        by smtp.gmail.com with ESMTPSA id k2-20020a7bc302000000b003fc06169ab3sm4642598wmj.20.2023.08.25.00.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 00:54:24 -0700 (PDT)
Message-ID: <eb751c1d50a2f34e79bd710e00c3b3e32ef26356.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] python3: Add packagegroup-core-buildessential
 rdep to ptests
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Fri, 25 Aug 2023 08:54:23 +0100
In-Reply-To: <20230825070914.525031-1-raj.khem@gmail.com>
References: <20230825070914.525031-1-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 07:54:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186698

On Fri, 2023-08-25 at 00:09 -0700, Khem Raj wrote:
> cppext test needs full toolchain as it tries to build an extention with
> C, using packagegroup-core-buildessential ensures that a function
> toolchain bits are pulled into ptest image, as an aside it also
> abstracts hardcoding compiler to be gcc
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/python/python3_3.11.4.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/python/python3_3.11.4.bb b/meta/recipe=
s-devtools/python/python3_3.11.4.bb
> index 8fd1382caa4..e31c4a81ef6 100644
> --- a/meta/recipes-devtools/python/python3_3.11.4.bb
> +++ b/meta/recipes-devtools/python/python3_3.11.4.bb
> @@ -424,7 +424,7 @@ FILES:${PN}-man =3D "${datadir}/man"
>  # See https://bugs.python.org/issue18748 and https://bugs.python.org/iss=
ue37395
>  RDEPENDS:libpython3:append:libc-glibc =3D " libgcc"
>  RDEPENDS:${PN}-ctypes:append:libc-glibc =3D " ${MLPREFIX}ldconfig"
> -RDEPENDS:${PN}-ptest =3D "${PN}-modules ${PN}-tests ${PN}-dev ${PN}-cgit=
b ${PN}-zipapp unzip bzip2 libgcc tzdata coreutils sed gcc g++ binutils"
> +RDEPENDS:${PN}-ptest =3D "${PN}-modules ${PN}-tests ${PN}-dev ${PN}-cgit=
b ${PN}-zipapp unzip bzip2 libgcc tzdata coreutils sed packagegroup-core-bu=
ildessential"
>  RDEPENDS:${PN}-ptest:append:libc-glibc =3D " locale-base-fr-fr locale-ba=
se-en-us locale-base-tr-tr locale-base-de-de"
>  RDEPENDS:${PN}-tkinter +=3D "${@bb.utils.contains('PACKAGECONFIG', 'tk',=
 '${MLPREFIX}tk ${MLPREFIX}tk-lib', '', d)}"
>  RDEPENDS:${PN}-idle +=3D "${@bb.utils.contains('PACKAGECONFIG', 'tk', '$=
{PN}-tkinter ${MLPREFIX}tcl', '', d)}"

That also increases the dependencies needed to complete a build of
target python and I'm not sure this is a great idea. Compiler
dependencies in ptests are a real problem in this regard but this patch
makes the situation a lot worse :(

Cheers,

Richard

