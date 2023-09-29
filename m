Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F15CE728F4
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 20:13:36 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web10.28039.1696018408902214393
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Sep 2023 13:13:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JiYmQAHO;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-59f57ad6126so135962737b3.3
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 13:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696018408; x=1696623208; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Os8MGDHbbF7qsJ21yWH1cej1ZbT29qrfkbOGW+H68LU=;
        b=JiYmQAHOtZBPUem4jNSA0M279Zadesv6XqMGmpJtne51T0ramHLsWWSqWRMxH1jVka
         3ZZsQZnD2xIDGzQ0t5gePodtFwYZT+vQwASe1l8inoWG7hJl8cjdn0rBxTfI73wbF+DL
         QU6faxzUqMUHteMHv3eujQLFcaX+8x6MR8HCXD56H+5kkjiVzH4GXWOC3PgRcglKglJg
         o/BVW4QTJ2s6G6XVXiHnJ9RTWQ5SUK07taKqpXIbsKVcHMpqx5wbl78yJksuF5/rpq/T
         m4AXDxA7S0GyIbtoQRxF9hlipTuCdfPiy+igHi4Q6UKaLm++2jc/WUzKLC1sXGzhum95
         1xog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696018408; x=1696623208;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Os8MGDHbbF7qsJ21yWH1cej1ZbT29qrfkbOGW+H68LU=;
        b=jFFjFVGrenxdAIkPi0z74woieZEisKC8UgMQ9Gxi8881iQpWu3XNuuS2xwtTIOmX2b
         5SA6berx+rXTuKOWTZs0FL05A/RRBabSbolb38t98HlqG3hA6BoBB+yrMHWFRSGFjmU9
         vnGZgSg1rbUJ3AUKQTh3NKQCaB1qt86zL53UgKPBU55QyHNkX8I28WW2eViIKAUba1tC
         MPLuHly9LIRNJJvEssfnDV2T1bjlAbzZHa3Kn1wYi5hFvmiEAX9kHbGLeZLQc9JfJ5lz
         YC1aE/WKjJpdA087ifTnXvWPUUTzZdK4eEdx52yPNR6LNhh4O9LlWGZVT4ZSANhSqcFm
         jNaQ==
X-Gm-Message-State: AOJu0YxufYsheXMbLM0X9Ew/0dUvk/NcjxwW7IKnVa27ZJ90ZfSSOYib
	b089V5rbjxZyUZi1l9ulpr434ik5d1XxNIEDaow=
X-Google-Smtp-Source: AGHT+IFerxcDh5XXbg7L+e3VZ0gzzhg/pVf5gyCQfkT0rblKm6lSYoJNdFfILuNlV7xMUgGtRybbl2VH98LrmBLej9g=
X-Received: by 2002:a81:48c7:0:b0:59f:5614:ebe8 with SMTP id
 v190-20020a8148c7000000b0059f5614ebe8mr5475029ywa.9.1696018407922; Fri, 29
 Sep 2023 13:13:27 -0700 (PDT)
MIME-Version: 1.0
References: <178977AE9C92331E.9230@lists.openembedded.org>
In-Reply-To: <178977AE9C92331E.9230@lists.openembedded.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 29 Sep 2023 16:13:15 -0400
Message-ID: <CADkTA4NcGWJtS2P43ecAeq2S14kHVTTLAyXAUAX+uYBxEB0qqw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/6] linux-yocto/5.15: update to v5.15.125
To: bruce.ashfield@gmail.com
Cc: steve@sakoman.com, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000bca0dc0606850eaa"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 20:13:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188436

--000000000000bca0dc0606850eaa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

These obviously should have had [mickledore] in the subject.

My scripts are not cooperating today.

Bruce

On Fri, Sep 29, 2023 at 4:12=E2=80=AFPM Bruce Ashfield via lists.openembedd=
ed.org
<bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:

> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Updating  to the latest korg -stable release that comprises
> the following commits:
>
>     c275eaaaa342 Linux 5.15.125
>     754e0c7c4a30 x86: fix backwards merge of GDS/SRSO bit
>     b14a3924c267 xen/netback: Fix buffer overrun triggered by unusual
> packet
>     153f9a7b02d4 x86/srso: Tie SBPB bit setting to microcode patch
> detection
>     df4c3823cba5 x86/srso: Fix return thunks in generated code
>     0071b17eb66b x86/srso: Add IBPB on VMEXIT
>     5398faac76a6 x86/srso: Add IBPB
>     c24aaa7dde5f x86/srso: Add SRSO_NO support
>     4e9115e194a8 x86/srso: Add IBPB_BRTYPE support
>     b35087763a44 x86/srso: Add a Speculative RAS Overflow mitigation
>     c3b4c644525e x86/cpu, kvm: Add support for CPUID_80000021_EAX
>     236dd7133394 x86/bugs: Increase the x86 bugs vector size to two u32s
>     0242a8bdef56 Documentation/x86: Fix backwards on/off logic about YMM
> support
>     27a72e350869 x86/mm: Initialize text poking earlier
>     d0317b9502ea mm: Move mm_cachep initialization to mm_init()
>     8e4c2530879d x86/mm: Use mm_alloc() in poking_init()
>     13ec5cb4c113 x86/mm: fix poking_init() for Xen PV guests
>     3e90080d5665 x86/xen: Fix secondary processors' FPU initialization
>     348741a9e4d3 KVM: Add GDS_NO support to KVM
>     59d78655f808 x86/speculation: Add Kconfig option for GDS
>     0cc5643b63ae x86/speculation: Add force option to GDS mitigation
>     348a89e20184 x86/speculation: Add Gather Data Sampling mitigation
>     a094d3b30967 x86/fpu: Move FPU initialization into
> arch_cpu_finalize_init()
>     59f2739111ca x86/fpu: Mark init functions __init
>     bb9c20d903f6 x86/fpu: Remove cpuinfo argument from init functions
>     de8b7ce4c533 x86/init: Initialize signal frame size late
>     041d929233bb init, x86: Move mem_encrypt_init() into
> arch_cpu_finalize_init()
>     8ae795ed6115 init: Invoke arch_cpu_finalize_init() earlier
>     7e270cebaffd init: Remove check_bugs() leftovers
>     285384ac24c3 um/cpu: Switch to arch_cpu_finalize_init()
>     6ea421786426 sparc/cpu: Switch to arch_cpu_finalize_init()
>     21a1fc8d13d8 sh/cpu: Switch to arch_cpu_finalize_init()
>     dfeb371a2707 mips/cpu: Switch to arch_cpu_finalize_init()
>     4baf46a3ba00 m68k/cpu: Switch to arch_cpu_finalize_init()
>     8c8165cd25cf ia64/cpu: Switch to arch_cpu_finalize_init()
>     de8c592cc5a1 ARM: cpu: Switch to arch_cpu_finalize_init()
>     75da6209d3ba x86/cpu: Switch to arch_cpu_finalize_init()
>     0774fc2177c3 init: Provide arch_cpu_finalize_init()
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
>  .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
>  meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
>  3 files changed, 19 insertions(+), 19 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
> b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
> index be5dd5efec..f09dbe0b5f 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
> @@ -11,13 +11,13 @@ python () {
>          raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel
> to linux-yocto-rt to enable it")
>  }
>
> -SRCREV_machine ?=3D "0ac91942af8fec31671ffe62e9518aaf15f110b3"
> -SRCREV_meta ?=3D "f484a7f175b4f3c4f7d2b553cde232bd41f757d8"
> +SRCREV_machine ?=3D "897961fcc3a4126a9d86096b4c3f0de174eb51e7"
> +SRCREV_meta ?=3D "9d45e4358eec5d4585e6e26d7f2f6f03ad909ea7"
>
>  SRC_URI =3D "git://
> git.yoctoproject.org/linux-yocto.git;branch=3D${KBRANCH};name=3Dmachine;p=
rotocol=3Dhttps
> <http://git.yoctoproject.org/linux-yocto.git;branch=3D$%7BKBRANCH%7D;name=
=3Dmachine;protocol=3Dhttps>
> \
>             git://
> git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=
=3Dyocto-5.15;destsuffix=3D${KMETA};protocol=3Dhttps
> <http://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;=
branch=3Dyocto-5.15;destsuffix=3D$%7BKMETA%7D;protocol=3Dhttps>
> "
>
> -LINUX_VERSION ?=3D "5.15.124"
> +LINUX_VERSION ?=3D "5.15.125"
>
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
> b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
> index b8f3d71a72..2f0e232fe6 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
> @@ -5,7 +5,7 @@ KCONFIG_MODE =3D "--allnoconfig"
>
>  require recipes-kernel/linux/linux-yocto.inc
>
> -LINUX_VERSION ?=3D "5.15.124"
> +LINUX_VERSION ?=3D "5.15.125"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
>
>  DEPENDS +=3D "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '',
> d)}"
> @@ -14,8 +14,8 @@ DEPENDS +=3D "openssl-native util-linux-native"
>  KMETA =3D "kernel-meta"
>  KCONF_BSP_AUDIT_LEVEL =3D "2"
>
> -SRCREV_machine ?=3D "cdb289c798fe1fc9f259a08c32e2dd9516ccb7a4"
> -SRCREV_meta ?=3D "f484a7f175b4f3c4f7d2b553cde232bd41f757d8"
> +SRCREV_machine ?=3D "673a7d93e8c401525183fd793cd1fbc5d688761f"
> +SRCREV_meta ?=3D "9d45e4358eec5d4585e6e26d7f2f6f03ad909ea7"
>
>  PV =3D "${LINUX_VERSION}+git${SRCPV}"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
> b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
> index a15284fb4b..f3c6733656 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
> @@ -13,24 +13,24 @@ KBRANCH:qemux86  ?=3D "v5.15/standard/base"
>  KBRANCH:qemux86-64 ?=3D "v5.15/standard/base"
>  KBRANCH:qemumips64 ?=3D "v5.15/standard/mti-malta64"
>
> -SRCREV_machine:qemuarm ?=3D "676a22c65ec0f8bb5dc7e13d130f6e3764959d75"
> -SRCREV_machine:qemuarm64 ?=3D "f0e7afd5948f71be062cd9194b56cd03de94b7cb"
> -SRCREV_machine:qemumips ?=3D "0f1ceb9008f182cd7f21420bbec6f21a67da8397"
> -SRCREV_machine:qemuppc ?=3D "4ec9fc13283ce01627ef8c32617a1eb71e127c62"
> -SRCREV_machine:qemuriscv64 ?=3D "1c09be01f4b87f60ea64136459167d73502a118=
f"
> -SRCREV_machine:qemuriscv32 ?=3D "1c09be01f4b87f60ea64136459167d73502a118=
f"
> -SRCREV_machine:qemux86 ?=3D "1c09be01f4b87f60ea64136459167d73502a118f"
> -SRCREV_machine:qemux86-64 ?=3D "1c09be01f4b87f60ea64136459167d73502a118f=
"
> -SRCREV_machine:qemumips64 ?=3D "fad09cc6acf2175aa6b5979ef48cd5f05afc3da0=
"
> -SRCREV_machine ?=3D "1c09be01f4b87f60ea64136459167d73502a118f"
> -SRCREV_meta ?=3D "f484a7f175b4f3c4f7d2b553cde232bd41f757d8"
> +SRCREV_machine:qemuarm ?=3D "f1655130f428a06fd10df1401cf4a97c2c9e98fe"
> +SRCREV_machine:qemuarm64 ?=3D "3562a213e44daf360d873c1c1773d64c7b1bdb90"
> +SRCREV_machine:qemumips ?=3D "bff8d6b2771b531f996b41ab89d742b21d6d1a5f"
> +SRCREV_machine:qemuppc ?=3D "9ccbf6add86b58f8446ba2b439ccdaaa1646c20b"
> +SRCREV_machine:qemuriscv64 ?=3D "50ad222fc4256538597cc943ddb328692041424=
d"
> +SRCREV_machine:qemuriscv32 ?=3D "50ad222fc4256538597cc943ddb328692041424=
d"
> +SRCREV_machine:qemux86 ?=3D "50ad222fc4256538597cc943ddb328692041424d"
> +SRCREV_machine:qemux86-64 ?=3D "50ad222fc4256538597cc943ddb328692041424d=
"
> +SRCREV_machine:qemumips64 ?=3D "05401de4dd847384e7592e2d729e2d8ff4a1e1bd=
"
> +SRCREV_machine ?=3D "50ad222fc4256538597cc943ddb328692041424d"
> +SRCREV_meta ?=3D "9d45e4358eec5d4585e6e26d7f2f6f03ad909ea7"
>
>  # set your preferred provider of linux-yocto to 'linux-yocto-upstream',
> and you'll
>  # get the <version>/base branch, which is pure upstream -stable, and the
> same
>  # meta SRCREV as the linux-yocto-standard builds. Select your version
> using the
>  # normal PREFERRED_VERSION settings.
>  BBCLASSEXTEND =3D "devupstream:target"
> -SRCREV_machine:class-devupstream ?=3D
> "38d4ca22a5288c4bae7e6d62a1728b0718d51866"
> +SRCREV_machine:class-devupstream ?=3D
> "c275eaaaa34260e6c907bc5e7ee07c096bc45064"
>  PN:class-devupstream =3D "linux-yocto-upstream"
>  KBRANCH:class-devupstream =3D "v5.15/base"
>
> @@ -38,7 +38,7 @@ SRC_URI =3D "git://
> git.yoctoproject.org/linux-yocto.git;name=3Dmachine;branch=3D${KBRA
> <http://git.yoctoproject.org/linux-yocto.git;name=3Dmachine;branch=3D$%7B=
KBRA>
>             git://
> git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=
=3Dyocto-5.15;destsuffix=3D${KMETA};protocol=3Dhttps
> <http://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;=
branch=3Dyocto-5.15;destsuffix=3D$%7BKMETA%7D;protocol=3Dhttps>
> "
>
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
> -LINUX_VERSION ?=3D "5.15.124"
> +LINUX_VERSION ?=3D "5.15.125"
>
>  DEPENDS +=3D "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '',
> d)}"
>  DEPENDS +=3D "openssl-native util-linux-native"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188430):
> https://lists.openembedded.org/g/openembedded-core/message/188430
> Mute This Topic: https://lists.openembedded.org/mt/101665554/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000bca0dc0606850eaa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">The=
se obviously should=C2=A0have had [mickledore] in the subject.=C2=A0</div><=
div class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">My scripts are not cooperating=
 today.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></d=
iv><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri=
, Sep 29, 2023 at 4:12=E2=80=AFPM Bruce Ashfield via <a href=3D"http://list=
s.openembedded.org">lists.openembedded.org</a> &lt;bruce.ashfield=3D<a href=
=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" targ=
et=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
<br>
Updating=C2=A0 to the latest korg -stable release that comprises<br>
the following commits:<br>
<br>
=C2=A0 =C2=A0 c275eaaaa342 Linux 5.15.125<br>
=C2=A0 =C2=A0 754e0c7c4a30 x86: fix backwards merge of GDS/SRSO bit<br>
=C2=A0 =C2=A0 b14a3924c267 xen/netback: Fix buffer overrun triggered by unu=
sual packet<br>
=C2=A0 =C2=A0 153f9a7b02d4 x86/srso: Tie SBPB bit setting to microcode patc=
h detection<br>
=C2=A0 =C2=A0 df4c3823cba5 x86/srso: Fix return thunks in generated code<br=
>
=C2=A0 =C2=A0 0071b17eb66b x86/srso: Add IBPB on VMEXIT<br>
=C2=A0 =C2=A0 5398faac76a6 x86/srso: Add IBPB<br>
=C2=A0 =C2=A0 c24aaa7dde5f x86/srso: Add SRSO_NO support<br>
=C2=A0 =C2=A0 4e9115e194a8 x86/srso: Add IBPB_BRTYPE support<br>
=C2=A0 =C2=A0 b35087763a44 x86/srso: Add a Speculative RAS Overflow mitigat=
ion<br>
=C2=A0 =C2=A0 c3b4c644525e x86/cpu, kvm: Add support for CPUID_80000021_EAX=
<br>
=C2=A0 =C2=A0 236dd7133394 x86/bugs: Increase the x86 bugs vector size to t=
wo u32s<br>
=C2=A0 =C2=A0 0242a8bdef56 Documentation/x86: Fix backwards on/off logic ab=
out YMM support<br>
=C2=A0 =C2=A0 27a72e350869 x86/mm: Initialize text poking earlier<br>
=C2=A0 =C2=A0 d0317b9502ea mm: Move mm_cachep initialization to mm_init()<b=
r>
=C2=A0 =C2=A0 8e4c2530879d x86/mm: Use mm_alloc() in poking_init()<br>
=C2=A0 =C2=A0 13ec5cb4c113 x86/mm: fix poking_init() for Xen PV guests<br>
=C2=A0 =C2=A0 3e90080d5665 x86/xen: Fix secondary processors&#39; FPU initi=
alization<br>
=C2=A0 =C2=A0 348741a9e4d3 KVM: Add GDS_NO support to KVM<br>
=C2=A0 =C2=A0 59d78655f808 x86/speculation: Add Kconfig option for GDS<br>
=C2=A0 =C2=A0 0cc5643b63ae x86/speculation: Add force option to GDS mitigat=
ion<br>
=C2=A0 =C2=A0 348a89e20184 x86/speculation: Add Gather Data Sampling mitiga=
tion<br>
=C2=A0 =C2=A0 a094d3b30967 x86/fpu: Move FPU initialization into arch_cpu_f=
inalize_init()<br>
=C2=A0 =C2=A0 59f2739111ca x86/fpu: Mark init functions __init<br>
=C2=A0 =C2=A0 bb9c20d903f6 x86/fpu: Remove cpuinfo argument from init funct=
ions<br>
=C2=A0 =C2=A0 de8b7ce4c533 x86/init: Initialize signal frame size late<br>
=C2=A0 =C2=A0 041d929233bb init, x86: Move mem_encrypt_init() into arch_cpu=
_finalize_init()<br>
=C2=A0 =C2=A0 8ae795ed6115 init: Invoke arch_cpu_finalize_init() earlier<br=
>
=C2=A0 =C2=A0 7e270cebaffd init: Remove check_bugs() leftovers<br>
=C2=A0 =C2=A0 285384ac24c3 um/cpu: Switch to arch_cpu_finalize_init()<br>
=C2=A0 =C2=A0 6ea421786426 sparc/cpu: Switch to arch_cpu_finalize_init()<br=
>
=C2=A0 =C2=A0 21a1fc8d13d8 sh/cpu: Switch to arch_cpu_finalize_init()<br>
=C2=A0 =C2=A0 dfeb371a2707 mips/cpu: Switch to arch_cpu_finalize_init()<br>
=C2=A0 =C2=A0 4baf46a3ba00 m68k/cpu: Switch to arch_cpu_finalize_init()<br>
=C2=A0 =C2=A0 8c8165cd25cf ia64/cpu: Switch to arch_cpu_finalize_init()<br>
=C2=A0 =C2=A0 de8c592cc5a1 ARM: cpu: Switch to arch_cpu_finalize_init()<br>
=C2=A0 =C2=A0 75da6209d3ba x86/cpu: Switch to arch_cpu_finalize_init()<br>
=C2=A0 =C2=A0 0774fc2177c3 init: Provide arch_cpu_finalize_init()<br>
<br>
Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.co=
m" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../linux/<a href=3D"http://linux-yocto-rt_5.15.bb" rel=3D"noreferrer=
" target=3D"_blank">linux-yocto-rt_5.15.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 ++---<br>
=C2=A0.../linux/<a href=3D"http://linux-yocto-tiny_5.15.bb" rel=3D"noreferr=
er" target=3D"_blank">linux-yocto-tiny_5.15.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 6 ++---<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_5.15.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_5.15.bb</a> | 26 +++++++++---=
-------<br>
=C2=A03 files changed, 19 insertions(+), 19 deletions(-)<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_5.1=
5.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-rt_5.15.bb</a> b/met=
a/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_5.15.bb" rel=3D"nor=
eferrer" target=3D"_blank">linux-yocto-rt_5.15.bb</a><br>
index be5dd5efec..f09dbe0b5f 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_5.15.bb" r=
el=3D"noreferrer" target=3D"_blank">linux-yocto-rt_5.15.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_5.15.bb" r=
el=3D"noreferrer" target=3D"_blank">linux-yocto-rt_5.15.bb</a><br>
@@ -11,13 +11,13 @@ python () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise bb.parse.SkipRecipe(&quot;Set PREFE=
RRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it&quot;)<br>
=C2=A0}<br>
<br>
-SRCREV_machine ?=3D &quot;0ac91942af8fec31671ffe62e9518aaf15f110b3&quot;<b=
r>
-SRCREV_meta ?=3D &quot;f484a7f175b4f3c4f7d2b553cde232bd41f757d8&quot;<br>
+SRCREV_machine ?=3D &quot;897961fcc3a4126a9d86096b4c3f0de174eb51e7&quot;<b=
r>
+SRCREV_meta ?=3D &quot;9d45e4358eec5d4585e6e26d7f2f6f03ad909ea7&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/linux-=
yocto.git;branch=3D$%7BKBRANCH%7D;name=3Dmachine;protocol=3Dhttps" rel=3D"n=
oreferrer" target=3D"_blank">git.yoctoproject.org/linux-yocto.git;branch=3D=
${KBRANCH};name=3Dmachine;protocol=3Dhttps</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://git.yocto=
project.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-5.15=
;destsuffix=3D$%7BKMETA%7D;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_=
blank">git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;bra=
nch=3Dyocto-5.15;destsuffix=3D${KMETA};protocol=3Dhttps</a>&quot;<br>
<br>
-LINUX_VERSION ?=3D &quot;5.15.124&quot;<br>
+LINUX_VERSION ?=3D &quot;5.15.125&quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D6bc538ed5bd9a7fc93980=
86aedcd7e46&quot;<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_5=
.15.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_5.15.bb</a> b=
/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_5.15.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_5.15.bb</a><br>
index b8f3d71a72..2f0e232fe6 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_5.15.bb"=
 rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_5.15.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_5.15.bb"=
 rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_5.15.bb</a><br>
@@ -5,7 +5,7 @@ KCONFIG_MODE =3D &quot;--allnoconfig&quot;<br>
<br>
=C2=A0require recipes-kernel/linux/linux-yocto.inc<br>
<br>
-LINUX_VERSION ?=3D &quot;5.15.124&quot;<br>
+LINUX_VERSION ?=3D &quot;5.15.125&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D6bc538ed5bd9a7fc93980=
86aedcd7e46&quot;<br>
<br>
=C2=A0DEPENDS +=3D &quot;${@bb.utils.contains(&#39;ARCH&#39;, &#39;x86&#39;=
, &#39;elfutils-native&#39;, &#39;&#39;, d)}&quot;<br>
@@ -14,8 +14,8 @@ DEPENDS +=3D &quot;openssl-native util-linux-native&quot;=
<br>
=C2=A0KMETA =3D &quot;kernel-meta&quot;<br>
=C2=A0KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
<br>
-SRCREV_machine ?=3D &quot;cdb289c798fe1fc9f259a08c32e2dd9516ccb7a4&quot;<b=
r>
-SRCREV_meta ?=3D &quot;f484a7f175b4f3c4f7d2b553cde232bd41f757d8&quot;<br>
+SRCREV_machine ?=3D &quot;673a7d93e8c401525183fd793cd1fbc5d688761f&quot;<b=
r>
+SRCREV_meta ?=3D &quot;9d45e4358eec5d4585e6e26d7f2f6f03ad909ea7&quot;<br>
<br>
=C2=A0PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_5.15.b=
b" rel=3D"noreferrer" target=3D"_blank">linux-yocto_5.15.bb</a> b/meta/reci=
pes-kernel/linux/<a href=3D"http://linux-yocto_5.15.bb" rel=3D"noreferrer" =
target=3D"_blank">linux-yocto_5.15.bb</a><br>
index a15284fb4b..f3c6733656 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_5.15.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_5.15.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_5.15.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_5.15.bb</a><br>
@@ -13,24 +13,24 @@ KBRANCH:qemux86=C2=A0 ?=3D &quot;v5.15/standard/base&qu=
ot;<br>
=C2=A0KBRANCH:qemux86-64 ?=3D &quot;v5.15/standard/base&quot;<br>
=C2=A0KBRANCH:qemumips64 ?=3D &quot;v5.15/standard/mti-malta64&quot;<br>
<br>
-SRCREV_machine:qemuarm ?=3D &quot;676a22c65ec0f8bb5dc7e13d130f6e3764959d75=
&quot;<br>
-SRCREV_machine:qemuarm64 ?=3D &quot;f0e7afd5948f71be062cd9194b56cd03de94b7=
cb&quot;<br>
-SRCREV_machine:qemumips ?=3D &quot;0f1ceb9008f182cd7f21420bbec6f21a67da839=
7&quot;<br>
-SRCREV_machine:qemuppc ?=3D &quot;4ec9fc13283ce01627ef8c32617a1eb71e127c62=
&quot;<br>
-SRCREV_machine:qemuriscv64 ?=3D &quot;1c09be01f4b87f60ea64136459167d73502a=
118f&quot;<br>
-SRCREV_machine:qemuriscv32 ?=3D &quot;1c09be01f4b87f60ea64136459167d73502a=
118f&quot;<br>
-SRCREV_machine:qemux86 ?=3D &quot;1c09be01f4b87f60ea64136459167d73502a118f=
&quot;<br>
-SRCREV_machine:qemux86-64 ?=3D &quot;1c09be01f4b87f60ea64136459167d73502a1=
18f&quot;<br>
-SRCREV_machine:qemumips64 ?=3D &quot;fad09cc6acf2175aa6b5979ef48cd5f05afc3=
da0&quot;<br>
-SRCREV_machine ?=3D &quot;1c09be01f4b87f60ea64136459167d73502a118f&quot;<b=
r>
-SRCREV_meta ?=3D &quot;f484a7f175b4f3c4f7d2b553cde232bd41f757d8&quot;<br>
+SRCREV_machine:qemuarm ?=3D &quot;f1655130f428a06fd10df1401cf4a97c2c9e98fe=
&quot;<br>
+SRCREV_machine:qemuarm64 ?=3D &quot;3562a213e44daf360d873c1c1773d64c7b1bdb=
90&quot;<br>
+SRCREV_machine:qemumips ?=3D &quot;bff8d6b2771b531f996b41ab89d742b21d6d1a5=
f&quot;<br>
+SRCREV_machine:qemuppc ?=3D &quot;9ccbf6add86b58f8446ba2b439ccdaaa1646c20b=
&quot;<br>
+SRCREV_machine:qemuriscv64 ?=3D &quot;50ad222fc4256538597cc943ddb328692041=
424d&quot;<br>
+SRCREV_machine:qemuriscv32 ?=3D &quot;50ad222fc4256538597cc943ddb328692041=
424d&quot;<br>
+SRCREV_machine:qemux86 ?=3D &quot;50ad222fc4256538597cc943ddb328692041424d=
&quot;<br>
+SRCREV_machine:qemux86-64 ?=3D &quot;50ad222fc4256538597cc943ddb3286920414=
24d&quot;<br>
+SRCREV_machine:qemumips64 ?=3D &quot;05401de4dd847384e7592e2d729e2d8ff4a1e=
1bd&quot;<br>
+SRCREV_machine ?=3D &quot;50ad222fc4256538597cc943ddb328692041424d&quot;<b=
r>
+SRCREV_meta ?=3D &quot;9d45e4358eec5d4585e6e26d7f2f6f03ad909ea7&quot;<br>
<br>
=C2=A0# set your preferred provider of linux-yocto to &#39;linux-yocto-upst=
ream&#39;, and you&#39;ll<br>
=C2=A0# get the &lt;version&gt;/base branch, which is pure upstream -stable=
, and the same<br>
=C2=A0# meta SRCREV as the linux-yocto-standard builds. Select your version=
 using the<br>
=C2=A0# normal PREFERRED_VERSION settings.<br>
=C2=A0BBCLASSEXTEND =3D &quot;devupstream:target&quot;<br>
-SRCREV_machine:class-devupstream ?=3D &quot;38d4ca22a5288c4bae7e6d62a1728b=
0718d51866&quot;<br>
+SRCREV_machine:class-devupstream ?=3D &quot;c275eaaaa34260e6c907bc5e7ee07c=
096bc45064&quot;<br>
=C2=A0PN:class-devupstream =3D &quot;linux-yocto-upstream&quot;<br>
=C2=A0KBRANCH:class-devupstream =3D &quot;v5.15/base&quot;<br>
<br>
@@ -38,7 +38,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoprojec=
t.org/linux-yocto.git;name=3Dmachine;branch=3D$%7BKBRA" rel=3D"noreferrer" =
target=3D"_blank">git.yoctoproject.org/linux-yocto.git;name=3Dmachine;branc=
h=3D${KBRA</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://git.yocto=
project.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-5.15=
;destsuffix=3D$%7BKMETA%7D;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_=
blank">git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;bra=
nch=3Dyocto-5.15;destsuffix=3D${KMETA};protocol=3Dhttps</a>&quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D6bc538ed5bd9a7fc93980=
86aedcd7e46&quot;<br>
-LINUX_VERSION ?=3D &quot;5.15.124&quot;<br>
+LINUX_VERSION ?=3D &quot;5.15.125&quot;<br>
<br>
=C2=A0DEPENDS +=3D &quot;${@bb.utils.contains(&#39;ARCH&#39;, &#39;x86&#39;=
, &#39;elfutils-native&#39;, &#39;&#39;, d)}&quot;<br>
=C2=A0DEPENDS +=3D &quot;openssl-native util-linux-native&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#188430): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/188430" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/188430</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101665554/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/101665554/1050810</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.com" =
target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">- =
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><b=
r></div>

--000000000000bca0dc0606850eaa--

