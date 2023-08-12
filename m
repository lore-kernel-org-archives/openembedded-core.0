Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 801FDC001B0
	for <webhook@archiver.kernel.org>; Sat, 12 Aug 2023 00:23:26 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web10.57430.1691799802733510127
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Aug 2023 17:23:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ewYzPCWL;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3a6f3ef3155so2125125b6e.1
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Aug 2023 17:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691799802; x=1692404602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wr1EQmvnMMtEdO0I48/HARQ26JWmRkCcNfa4TzmecMA=;
        b=ewYzPCWLeA/O2sRcNk9nVI7Uxp5olr21kKZS8SP89qnYhKmYc3UNUBLWrZfb+HUPyw
         CAYmrny1gFxNPj+5SrIo9CKmVzTUF15RiRwMxdizAPKBPBT+y31ezL9+XMURvqZryhx+
         I/UmOc9Jph5OKftY9JTUEPoTxbdCKfd+9FRPZFSLyQuKEuzheINBdWpJ4iPJsYKC5nVn
         R8ZcovXUh5yL5LDwr5ZKc7dQOm4KDb2o+8P581TBepVw8ahrjrh3NlK79oYQ9cNXq/DE
         et6Oki7nKWvwR9fSOxnPz5PlWMLa9UZXYZQilrdka53KbAVMXCTpG7vuqGihF99m45m0
         /aaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691799802; x=1692404602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wr1EQmvnMMtEdO0I48/HARQ26JWmRkCcNfa4TzmecMA=;
        b=UWNuytMaICMYj2n7r2+gOBmxoaXxZ/9lnKh5iImOLBBQaZ4nOqejghz0YJcB1Sf036
         GT6m9NomxKAZ43W06/U39XkZ1S0sBZOdd/xt7lUeEdHUdCOU8etX0IWLO6BzatoNIiLQ
         pPrDiBwk0CVutrKcXXkOvWtaeAzwvTS7tke0TM2F7aGkhKTlRQ5LvrOgS+wraY9aa/PT
         8mciZ3OhG877EktJk5gBnUNoR5Bnl4zcwR/vTpZx9QLxzJOxi4E4UnBX3D0GgQ4xTOhW
         wt8qdOQkkdNzVhioS5LYJ7GR7inZp9Wbe2EcWdWKnsv7uOApHxOYTYXD66DrknZhzXhS
         feoQ==
X-Gm-Message-State: AOJu0YyJpsbs0jLnbsLAwHodCg1fBE3YMMbghjS2NCaaLIqpXVRzUjOO
	2bjOeGPb01EbxobPyjZKSZcu0V8y9OaNaG2qtsI=
X-Google-Smtp-Source: AGHT+IGEf0em1sAPeY5/XfDbJACv6vORnu2ufE1tiY69XjbaPpgMIagGHIQ8kk6S2bPbiPP1GilITfNZyGk9RoI3gCU=
X-Received: by 2002:a05:6808:1416:b0:3a4:3072:e597 with SMTP id
 w22-20020a056808141600b003a43072e597mr4494382oiv.54.1691799802017; Fri, 11
 Aug 2023 17:23:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230811223240.195105-1-alexandru.t.moise@gmail.com>
In-Reply-To: <20230811223240.195105-1-alexandru.t.moise@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 11 Aug 2023 17:22:55 -0700
Message-ID: <CAMKF1spexKG3_6GcWadFqR1w4NR0G5L3tejeeOGN4S6RWg-bJA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] riscv: Add asm-offsets.s to target for
 on-target module compilation
To: alexandru.t.moise@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Aug 2023 00:23:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185853

On Fri, Aug 11, 2023 at 3:30=E2=80=AFPM <alexandru.t.moise@gmail.com> wrote=
:
>
> From: Alexandru Moise <alexandru.t.moise@gmail.com>
>
> I wanted to build kernel modules on my riscv target,
>
> cd /usr/src/kernel/
>
> make scripts prepare
> <...>
>   CC      scripts/mod/devicetable-offsets.s
>   UPD     scripts/mod/devicetable-offsets.h
>   HOSTCC  scripts/mod/file2alias.o
>   HOSTCC  scripts/mod/sumversion.o
>   HOSTLD  scripts/mod/modpost
>   CC      kernel/bounds.s
> /bin/sh: line 1: arch/riscv/kernel/asm-offsets.s: No such file or directo=
ry
> make[1]: *** [Kbuild:37: include/generated/asm-offsets.h] Error 1
> make: *** [Makefile:1219: prepare0] Error 2
>
> The patch just adds the asm-offsets.s file for riscv targets.
>
> With this the prepare target succeeds:
>
> make scripts prepare
> <...>
>   CC      kernel/bounds.s
>   CALL    scripts/checksyscalls.sh
>   CALL    scripts/atomic/check-atomics.sh
>   LDS     arch/riscv/kernel/vdso/vdso.lds
>   AS      arch/riscv/kernel/vdso/rt_sigreturn.o
>   CC      arch/riscv/kernel/vdso/vgettimeofday.o
>   AS      arch/riscv/kernel/vdso/getcpu.o
>   AS      arch/riscv/kernel/vdso/flush_icache.o
>   AS      arch/riscv/kernel/vdso/note.o
>   VDSOLD  arch/riscv/kernel/vdso/vdso.so.dbg
>   VDSOSYM include/generated/vdso-offsets.h
> root@visionfive2:/usr/src/kernel
>
> Signed-off-by: Alexandru Moise <alexandru.t.moise@gmail.com>
> ---
>  meta/recipes-kernel/linux/kernel-devsrc.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-ke=
rnel/linux/kernel-devsrc.bb
> index 6764598d48..ec14ccf6f2 100644
> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> @@ -115,6 +115,9 @@ do_install() {
>              if [ -e arch/${ARCH}/kernel/vdso/vdso.lds ]; then
>                 cp -a --parents arch/${ARCH}/kernel/vdso/vdso.lds $kernel=
dir/build/
>              fi
> +            if [ -e arch/${ARCH}/kernel/asm-offsets.s ]; then
> +               cp -a --parents arch/${ARCH}/kernel/asm-offsets.s $kernel=
dir/build/
> +            fi

LGTM

>         fi
>         if [ "${ARCH}" =3D "powerpc" ]; then
>             cp -a --parents arch/powerpc/kernel/vdso32/vdso32.lds $kernel=
dir/build 2>/dev/null || :
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185852): https://lists.openembedded.org/g/openembedde=
d-core/message/185852
> Mute This Topic: https://lists.openembedded.org/mt/100693249/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

