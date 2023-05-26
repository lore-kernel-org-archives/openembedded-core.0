Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31F8AC77B7A
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 01:10:25 +0000 (UTC)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
 by mx.groups.io with SMTP id smtpd.web10.6285.1685063418990234862
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 May 2023 18:10:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Nr2GUqxS;
 spf=pass (domain: gmail.com, ip: 209.85.166.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-33823abc8a4so409245ab.3
        for <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 18:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685063418; x=1687655418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LxrqywVDGbmh4cXcZJq0TarCe6ytYuCHKuHFlmTSL8I=;
        b=Nr2GUqxSE55EfkGntMjrbAIGyPKmx24pD6wYkr0GY6inkoZY5MJzCjNvKQ3yrD5bnL
         1QtuPtlDgVL538mNJB/qlv0K67ybDFtKqr+hQfcSHczoSOjeKnxLwXdEaO0PFyoYbgLF
         SdtUOYOvd0orMTRcPcYHuumkLZh+WseptqIQUX9/LpziJsw20MNbRIiv3ePzduv7nyJq
         DOXQSMbJV5sFMHVruWRki66DSmiq/7dYyhLHhz4vY4BeQWzk7EERX5VFnC0tkgH057/H
         hDUrBmlHZUqKK6dHcFSM07tALksEco0sd4Y00jZYROQma5opZdc3lehFoCLlqZmROD8V
         FkIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685063418; x=1687655418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LxrqywVDGbmh4cXcZJq0TarCe6ytYuCHKuHFlmTSL8I=;
        b=ZD17KoOy5rDjeeuTAHm5Ta+W5LKkvJ4Q3TKVzW3L5FD1oh8UWlKYpZgDFs7dJxvAtP
         gT4RGamRShovwvDbI+s4p+OHarydj9O0rmP77KofK2tjs3tI+uWw48uGtjG63b4xP7tP
         WxtcPlv/wMGEc4Z9alxWg9lJsOIPSUDrtqw7mEA1UqDGjGYm5TOvecB62qxMLS5jzov0
         AGMcHfYFam8xoRb0Edsa/sXaoFfeBuMuxkUrAf9E++nOLl5zb54VxcnHztjvw6r8kNHF
         BnPHP7jd89NxtqCXEkJ+PVrr5r1gPgM6PfAKQjUUHY33VNieqUlZXEV3Ti1SpokVaQAg
         0fvw==
X-Gm-Message-State: AC+VfDy2YgU0dTkSOBtQmasN+hMxyUX9dBf07s9fUkenJopnuUOaRv+N
	odeZ1k3pqB8C0SRD5+qqPLo9agtlkxD5Dwc3TjI=
X-Google-Smtp-Source: ACHHUZ67Lp8QUtlHZ8Id9Ehn9eGyPNarSSk7l8w4j1tOB9TiOtEGmPmOyQnZ23flXE4kK42wCJ0rigpivp5lKbWiEIM=
X-Received: by 2002:a92:d98f:0:b0:33a:9a68:35ff with SMTP id
 r15-20020a92d98f000000b0033a9a6835ffmr159203iln.26.1685063418080; Thu, 25 May
 2023 18:10:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230525122936.2733864-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20230525122936.2733864-1-richard.purdie@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 25 May 2023 21:10:08 -0400
Message-ID: <CADkTA4OQh9z6bTmyqq-DsxpwqVTM+xy+hw8dgR=bGmN1mx87Cg@mail.gmail.com>
Subject: Re: [PATCH] linux-yocto: Drop 5.15 support
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 01:10:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181729

On Thu, May 25, 2023 at 8:29=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> 5.15 doesn't work with gcc 13 and we'll be replacing 5.15 with a new kern=
el
> version later in the release cycle. Drop 5.15 now so we can move forward
> with gcc 13 and we'll add a new kernel version later.
>

Fine with me.

I'll continue sending -stable updates for 5.15 for the released branches.

linux-yocto-dev is currently testing the 6.4-rc series, so depending
on where the kernel release cycles land, we'll be 6.4 or 6.5 for the
"new" kernel in the release.

Bruce

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../linux/linux-yocto-rt_5.15.bb              | 45 ------------
>  .../linux/linux-yocto-tiny_5.15.bb            | 30 --------
>  meta/recipes-kernel/linux/linux-yocto_5.15.bb | 70 -------------------
>  3 files changed, 145 deletions(-)
>  delete mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
>  delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
>  delete mode 100644 meta/recipes-kernel/linux/linux-yocto_5.15.bb
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/reci=
pes-kernel/linux/linux-yocto-rt_5.15.bb
> deleted file mode 100644
> index 475fe34066d..00000000000
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -KBRANCH ?=3D "v5.15/standard/preempt-rt/base"
> -
> -require recipes-kernel/linux/linux-yocto.inc
> -
> -# Skip processing of this recipe if it is not explicitly specified as th=
e
> -# PREFERRED_PROVIDER for virtual/kernel. This avoids errors when trying
> -# to build multiple virtual/kernel providers, e.g. as dependency of
> -# core-image-rt-sdk, core-image-rt.
> -python () {
> -    if d.getVar("KERNEL_PACKAGE_NAME") =3D=3D "kernel" and d.getVar("PRE=
FERRED_PROVIDER_virtual/kernel") !=3D "linux-yocto-rt":
> -        raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel=
 to linux-yocto-rt to enable it")
> -}
> -
> -SRCREV_machine ?=3D "8e0611e36c848a07f9cdd778903c9e51bb90b319"
> -SRCREV_meta ?=3D "e4b95ec17228274acb38bf10061448224df3a312"
> -
> -SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;branch=3D${KBRAN=
CH};name=3Dmachine;protocol=3Dhttps \
> -           git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;na=
me=3Dmeta;branch=3Dyocto-5.15;destsuffix=3D${KMETA};protocol=3Dhttps"
> -
> -LINUX_VERSION ?=3D "5.15.108"
> -
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
> -
> -DEPENDS +=3D "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '',=
 d)}"
> -DEPENDS +=3D "openssl-native util-linux-native"
> -
> -PV =3D "${LINUX_VERSION}+git${SRCPV}"
> -
> -KMETA =3D "kernel-meta"
> -KCONF_BSP_AUDIT_LEVEL =3D "1"
> -
> -LINUX_KERNEL_TYPE =3D "preempt-rt"
> -
> -COMPATIBLE_MACHINE =3D "^(qemux86|qemux86-64|qemuarm|qemuarmv5|qemuarm64=
|qemuppc|qemumips)$"
> -
> -KERNEL_DEVICETREE:qemuarmv5 =3D "versatile-pb.dtb"
> -
> -# Functionality flags
> -KERNEL_EXTRA_FEATURES ?=3D "features/netfilter/netfilter.scc features/ta=
skstats/taskstats.scc"
> -KERNEL_FEATURES:append =3D " ${KERNEL_EXTRA_FEATURES}"
> -KERNEL_FEATURES:append:qemuall=3D" cfg/virtio.scc features/drm-bochs/drm=
-bochs.scc"
> -KERNEL_FEATURES:append:qemux86=3D" cfg/sound.scc cfg/paravirt_kvm.scc"
> -KERNEL_FEATURES:append:qemux86-64=3D" cfg/sound.scc cfg/paravirt_kvm.scc=
"
> -KERNEL_FEATURES:append =3D "${@bb.utils.contains("DISTRO_FEATURES", "pte=
st", " features/scsi/scsi-debug.scc", "", d)}"
> -KERNEL_FEATURES:append =3D "${@bb.utils.contains("DISTRO_FEATURES", "pte=
st", " features/gpio/mockup.scc", "", d)}"
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/re=
cipes-kernel/linux/linux-yocto-tiny_5.15.bb
> deleted file mode 100644
> index 365d01db781..00000000000
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -KBRANCH ?=3D "v5.15/standard/tiny/base"
> -
> -LINUX_KERNEL_TYPE =3D "tiny"
> -KCONFIG_MODE =3D "--allnoconfig"
> -
> -require recipes-kernel/linux/linux-yocto.inc
> -
> -LINUX_VERSION ?=3D "5.15.108"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
> -
> -DEPENDS +=3D "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '',=
 d)}"
> -DEPENDS +=3D "openssl-native util-linux-native"
> -
> -KMETA =3D "kernel-meta"
> -KCONF_BSP_AUDIT_LEVEL =3D "2"
> -
> -SRCREV_machine ?=3D "3d762b85647844790979dd1e17a762003aaa7476"
> -SRCREV_meta ?=3D "e4b95ec17228274acb38bf10061448224df3a312"
> -
> -PV =3D "${LINUX_VERSION}+git${SRCPV}"
> -
> -SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;branch=3D${KBRAN=
CH};name=3Dmachine;protocol=3Dhttps \
> -           git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;na=
me=3Dmeta;branch=3Dyocto-5.15;destsuffix=3D${KMETA};protocol=3Dhttps"
> -
> -COMPATIBLE_MACHINE =3D "^(qemux86|qemux86-64|qemuarm64|qemuarm|qemuarmv5=
)$"
> -
> -# Functionality flags
> -KERNEL_FEATURES =3D ""
> -
> -KERNEL_DEVICETREE:qemuarmv5 =3D "versatile-pb.dtb"
> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes=
-kernel/linux/linux-yocto_5.15.bb
> deleted file mode 100644
> index 54c8e126449..00000000000
> --- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
> +++ /dev/null
> @@ -1,70 +0,0 @@
> -KBRANCH ?=3D "v5.15/standard/base"
> -
> -require recipes-kernel/linux/linux-yocto.inc
> -
> -# board specific branches
> -KBRANCH:qemuarm  ?=3D "v5.15/standard/arm-versatile-926ejs"
> -KBRANCH:qemuarm64 ?=3D "v5.15/standard/qemuarm64"
> -KBRANCH:qemumips ?=3D "v5.15/standard/mti-malta32"
> -KBRANCH:qemuppc  ?=3D "v5.15/standard/qemuppc"
> -KBRANCH:qemuriscv64  ?=3D "v5.15/standard/base"
> -KBRANCH:qemuriscv32  ?=3D "v5.15/standard/base"
> -KBRANCH:qemux86  ?=3D "v5.15/standard/base"
> -KBRANCH:qemux86-64 ?=3D "v5.15/standard/base"
> -KBRANCH:qemumips64 ?=3D "v5.15/standard/mti-malta64"
> -
> -SRCREV_machine:qemuarm ?=3D "80421c525a12141d31bf1592b0d8c176defe3010"
> -SRCREV_machine:qemuarm64 ?=3D "9d140dbc3171bf272f51b524edeeb2f22783aca5"
> -SRCREV_machine:qemumips ?=3D "b29a8fa62d88db512f1fa5d60e430a851d7e3aaf"
> -SRCREV_machine:qemuppc ?=3D "7ee6b7fc4b57933114376cf012218c2ae3d23558"
> -SRCREV_machine:qemuriscv64 ?=3D "e8c818cce43dd720c366d831aeb102c20c23765=
2"
> -SRCREV_machine:qemuriscv32 ?=3D "e8c818cce43dd720c366d831aeb102c20c23765=
2"
> -SRCREV_machine:qemux86 ?=3D "e8c818cce43dd720c366d831aeb102c20c237652"
> -SRCREV_machine:qemux86-64 ?=3D "e8c818cce43dd720c366d831aeb102c20c237652=
"
> -SRCREV_machine:qemumips64 ?=3D "5c900befc90365f6daa80989e8de0ccc546ff0f5=
"
> -SRCREV_machine ?=3D "e8c818cce43dd720c366d831aeb102c20c237652"
> -SRCREV_meta ?=3D "e4b95ec17228274acb38bf10061448224df3a312"
> -
> -# set your preferred provider of linux-yocto to 'linux-yocto-upstream', =
and you'll
> -# get the <version>/base branch, which is pure upstream -stable, and the=
 same
> -# meta SRCREV as the linux-yocto-standard builds. Select your version us=
ing the
> -# normal PREFERRED_VERSION settings.
> -BBCLASSEXTEND =3D "devupstream:target"
> -SRCREV_machine:class-devupstream ?=3D "3299fb36854fdc288bddc2c4d265f8a2e=
5105944"
> -PN:class-devupstream =3D "linux-yocto-upstream"
> -KBRANCH:class-devupstream =3D "v5.15/base"
> -
> -SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;name=3Dmachine;b=
ranch=3D${KBRANCH};protocol=3Dhttps \
> -           git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;na=
me=3Dmeta;branch=3Dyocto-5.15;destsuffix=3D${KMETA};protocol=3Dhttps"
> -
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
> -LINUX_VERSION ?=3D "5.15.108"
> -
> -DEPENDS +=3D "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '',=
 d)}"
> -DEPENDS +=3D "openssl-native util-linux-native"
> -DEPENDS +=3D "gmp-native libmpc-native"
> -
> -PV =3D "${LINUX_VERSION}+git${SRCPV}"
> -
> -KMETA =3D "kernel-meta"
> -KCONF_BSP_AUDIT_LEVEL =3D "1"
> -
> -KERNEL_DEVICETREE:qemuarmv5 =3D "versatile-pb.dtb"
> -
> -COMPATIBLE_MACHINE =3D "^(qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qe=
muppc64|qemumips|qemumips64|qemux86-64|qemuriscv64|qemuriscv32)$"
> -
> -# Functionality flags
> -KERNEL_EXTRA_FEATURES ?=3D "features/netfilter/netfilter.scc"
> -KERNEL_FEATURES:append =3D " ${KERNEL_EXTRA_FEATURES}"
> -KERNEL_FEATURES:append:qemuall=3D" cfg/virtio.scc features/drm-bochs/drm=
-bochs.scc"
> -KERNEL_FEATURES:append:qemux86=3D" cfg/sound.scc cfg/paravirt_kvm.scc"
> -KERNEL_FEATURES:append:qemux86-64=3D" cfg/sound.scc cfg/paravirt_kvm.scc=
"
> -KERNEL_FEATURES:append =3D " ${@bb.utils.contains("TUNE_FEATURES", "mx32=
", " cfg/x32.scc", "", d)}"
> -KERNEL_FEATURES:append =3D " ${@bb.utils.contains("DISTRO_FEATURES", "pt=
est", " features/scsi/scsi-debug.scc", "", d)}"
> -KERNEL_FEATURES:append =3D " ${@bb.utils.contains("DISTRO_FEATURES", "pt=
est", " features/gpio/mockup.scc", "", d)}"
> -KERNEL_FEATURES:append:powerpc =3D" arch/powerpc/powerpc-debug.scc"
> -KERNEL_FEATURES:append:powerpc64 =3D" arch/powerpc/powerpc-debug.scc"
> -KERNEL_FEATURES:append:powerpc64le =3D" arch/powerpc/powerpc-debug.scc"
> -
> -INSANE_SKIP:kernel-vmlinux:qemuppc64 =3D "textrel"
> -
> --
> 2.39.2
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

