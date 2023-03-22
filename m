Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16463C6FD20
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 03:14:11 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
 by mx.groups.io with SMTP id smtpd.web11.34325.1679454841536002075
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Mar 2023 20:14:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F8JL0OjU;
 spf=pass (domain: gmail.com, ip: 209.85.166.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f41.google.com with SMTP id m22so7899161ioy.4
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 20:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679454841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ItvZQGW0CMVXWx0nf2C84bOm6SDwBRrfeZ/uB37cS8=;
        b=F8JL0OjUKDwvfcwMX0JTxpXwmySq+0LhatNmnM8m1XBoh6Dgkz82A1ezBFLQO4NSaj
         ppq0Ec7FLDWT6UOd4+vApw/ufqGligu3kxQVdc3hkUYZA7KtnbVKeu9ugYaBqG3Sj9gq
         DNaFFZzfMZC2Ov10mpDq61N5txx22YU+L0xzNZsX14XhPKboT6OAzbjHPr/tCB4O8OQw
         B/SkjdLfC7gDzrM5bHWo6W/eGO4K35tf6zWZttLnR9RJ23w5xIr/aHmDTzAqm3vv+1UG
         kYfdJ0qv1/L8kMt3yLiqgb0l90kTQ706JKiytYjd1ISCNCskM7DD3Pgn3+BUyf9VJJyf
         ejGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679454841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ItvZQGW0CMVXWx0nf2C84bOm6SDwBRrfeZ/uB37cS8=;
        b=cgZqpzXeemw2xnelI4lek+sv1Du32PnT1QmbcWPHdz91fodhG3e0Tpd0FKtWZ8fx79
         97WW2XS+OcRBcqPS/tCHA/oC50npQGblXGXTBqitZx8q4dO8FebQ4fGGPzLXPFsGZauY
         zMPO0xGSkXJPED8VHNP6EOBGNyO0Wy4bS5ojcoDa28iM2a4jhed22uoRhmND53TeQmhw
         uD+UvdvTZe9kH26V8/vo8zFRp//WEqRQ2WJX0HdnTn63dFpvMcDPUXPuESh+HBVKA/kD
         7xYlIOtQuOryTSTXJgzAtQy5+o1ZzCdPF6ZBTRbJi5ySDZ8s9/OAxUCXH/cv6hPo5OTW
         yFow==
X-Gm-Message-State: AO0yUKX5k3CVfzrgpwTUCczoKsoAxgziorJNn8qBNfFV7lRkS+u+uGow
	jqULen3QNEgjknoIelA8aJdtM/m/P8wiuOOMvv9I57XLS7Alzg==
X-Google-Smtp-Source: AK7set/VA5sKpyAXdl0NxEV5fR5WNaMnAUb6jCA1ZGIiQHx96dMTnXylMSjtl0fXtSYEau3dL42kLgnpMDv3xpUMVwQ=
X-Received: by 2002:a6b:7204:0:b0:753:2ab8:aff7 with SMTP id
 n4-20020a6b7204000000b007532ab8aff7mr2115960ioc.1.1679454840733; Tue, 21 Mar
 2023 20:14:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230322022551.255320-1-zhangjialing@loongson.cn>
In-Reply-To: <20230322022551.255320-1-zhangjialing@loongson.cn>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 21 Mar 2023 23:13:54 -0400
Message-ID: <CADkTA4Op-pzthVVL2TD+BRFgJMRj9GA2-jNHM1kQiRseU0rfyA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] recipes: add support for loongarch64
To: zhangjialing@loongson.cn
Cc: openembedded-core@lists.openembedded.org, 
	Qizheng Zhu <zhuqizheng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 03:14:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178911

On Tue, Mar 21, 2023 at 10:26=E2=80=AFPM <zhangjialing@loongson.cn> wrote:
>
> From: Jialing Zhang <zhangjialing@loongson.cn>
>
> glibc gcc linux vulkan add support for loongarch64

Can you send a v2 of this without the linux-yocto SRCREV bump ?

They all need to be kept in sync, and I'm about to send a new set of
-stable and -dev updates to linux-yocto. I've updated my scripts to
include qemuloongarch64, so that SRCREV bump will now follow the rest.

Bruce

>
> Signed-off-by: Jialing Zhang <zhangjialing@loongson.cn>
> Signed-off-by: Qizheng Zhu <zhuqizheng@loongson.cn>
> ---
>  meta/recipes-core/glibc/glibc-locale.inc           | 2 +-
>  meta/recipes-devtools/gcc/gcc-runtime.inc          | 1 +
>  meta/recipes-graphics/vulkan/vulkan-samples_git.bb | 2 +-
>  meta/recipes-kernel/linux/linux-yocto_6.1.bb       | 2 +-
>  4 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-core=
/glibc/glibc-locale.inc
> index 7f70b3ca4f..760de9437b 100644
> --- a/meta/recipes-core/glibc/glibc-locale.inc
> +++ b/meta/recipes-core/glibc/glibc-locale.inc
> @@ -20,7 +20,7 @@ ENABLE_BINARY_LOCALE_GENERATION:pn-nativesdk-glibc-loca=
le =3D "1"
>
>  #enable locale generation on these arches
>  # BINARY_LOCALE_ARCHES is a space separated list of regular expressions
> -BINARY_LOCALE_ARCHES ?=3D "arc arm.* aarch64 i[3-6]86 x86_64 powerpc mip=
s mips64 riscv32 riscv64"
> +BINARY_LOCALE_ARCHES ?=3D "arc arm.* aarch64 i[3-6]86 x86_64 powerpc mip=
s mips64 riscv32 riscv64 loongarch64"
>
>  # set "1" to use cross-localedef for locale generation
>  # set "0" for qemu emulation of native localedef for locale generation
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-dev=
tools/gcc/gcc-runtime.inc
> index fa5b048dab..bccc8a5b89 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> @@ -38,6 +38,7 @@ RUNTIMELIBITM:nios2 =3D ""
>  RUNTIMELIBITM:microblaze =3D ""
>  RUNTIMELIBITM:riscv32 =3D ""
>  RUNTIMELIBITM:riscv64 =3D ""
> +RUNTIMELIBITM:loongarch64 =3D ""
>  RUNTIMELIBSSP ?=3D ""
>  RUNTIMELIBSSP:mingw32 ?=3D "libssp"
>
> diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/re=
cipes-graphics/vulkan/vulkan-samples_git.bb
> index 20f39905b1..05babf4c91 100644
> --- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
> +++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
> @@ -18,7 +18,7 @@ UPSTREAM_CHECK_GITTAGREGEX =3D "These are not the relea=
ses you're looking for"
>  S =3D "${WORKDIR}/git"
>
>  REQUIRED_DISTRO_FEATURES =3D 'vulkan'
> -COMPATIBLE_HOST =3D "(x86_64|aarch64|mips64|powerpc64|riscv64).*-linux"
> +COMPATIBLE_HOST =3D "(x86_64|aarch64|mips64|powerpc64|riscv64|loongarch6=
4).*-linux"
>
>  inherit cmake features_check
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-=
kernel/linux/linux-yocto_6.1.bb
> index be31a22524..c43a75a250 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
> @@ -16,7 +16,7 @@ KBRANCH:qemumips64 ?=3D "v6.1/standard/mti-malta64"
>
>  SRCREV_machine:qemuarm ?=3D "129155997616e25e7221ed259fa75282e46a00b6"
>  SRCREV_machine:qemuarm64 ?=3D "b05ca3429c1eef8cfff0b5638c8a5bb708b4e98a"
> -SRCREV_machine:qemuloongarch64 ?=3D "1caf99d56881e1510afca553cd4a057f804=
79973"
> +SRCREV_machine:qemuloongarch64 ?=3D "b05ca3429c1eef8cfff0b5638c8a5bb708b=
4e98a"
>  SRCREV_machine:qemumips ?=3D "aa98067af82a03ef5223e9c116506030a732eb24"
>  SRCREV_machine:qemuppc ?=3D "b05ca3429c1eef8cfff0b5638c8a5bb708b4e98a"
>  SRCREV_machine:qemuriscv64 ?=3D "b05ca3429c1eef8cfff0b5638c8a5bb708b4e98=
a"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178905): https://lists.openembedded.org/g/openembedde=
d-core/message/178905
> Mute This Topic: https://lists.openembedded.org/mt/97770391/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

