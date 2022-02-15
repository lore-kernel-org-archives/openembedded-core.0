Return-Path: <alistair23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 169D9C433F5
	for <webhook@archiver.kernel.org>; Tue, 15 Feb 2022 22:28:23 +0000 (UTC)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
 [209.85.166.177])
 by mx.groups.io with SMTP id smtpd.web10.4170.1644964102219366841
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Feb 2022 14:28:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qfGfDcPN;
 spf=pass (domain: gmail.com, ip: 209.85.166.177,
 mailfrom: alistair23@gmail.com)
Received: by mail-il1-f177.google.com with SMTP id f13so120610ilq.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Feb 2022 14:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ug5GKizJ+3qO7gtQ50faV8d4biY273axDNKABcA7H0E=;
        b=qfGfDcPNuf32nwKutIIbg4sOxnGO1i0cgnnjLpiVh/Q8gtxRmVYR9KPaZJYwGoWAFx
         hQE5yHrnIS7SZzgTBuTnXqCRje2Pn2qjIAjp+t8UHcneRbPTJJvH11cWSPYBdMbLIRTh
         NU345TYdK9wlD4YXlNtinpKz/6zpytjLq5edF/YBk73jgIDguPwtX2xhbO5NN3Tlt+hU
         mcjw81re5qXkgmT6fEpW/cp6zlSRXngDqrHLh4BdftYh8KmQF4kHtutNuZCIKuPAAhpb
         H9oBaJb9Md4CKXV9VGUXYIu7PAoII/aVeaIR2EpoC/JCiZPpA1h7q6zkirs7A7Q3Nw+K
         V3/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ug5GKizJ+3qO7gtQ50faV8d4biY273axDNKABcA7H0E=;
        b=atYk0XBGkbcIaK02UFT7Dmyzbb7bUweLrjMHLS20z9uCAyE2jRaNCM3ZrFEJWA3gB4
         XnfOGJ3nVsJp5708NUMGxLuWFF0DkTlYhqkRb5DqV5zfkXWNYkqzvQDCn04Rt+vAnHXD
         OCfbb77iwLqwUvNP/Hkf7sbER5J8gxNx+yGFl+LDWmy+Vjz0HWZ/vZg6xiOzkn0w675I
         7zQ6dS2whRiFRF+pMy2d9SwRNgjJw1f2cWWePCzWlPxiNT/f7jWIfS4EZthSAIw22pKn
         MFHMR6G4MBqqqUmQ//xp8EUmsMaZFYClw18g2V4PVRKxqTlKUh6K6yjSu+a3z6iOfsCC
         EMqg==
X-Gm-Message-State: AOAM532z02pPms4qIULvqZ97kyLhsYRICzFi1wVgpQnpRAEWbJI0SHmC
	WwQg1JEyqYuNZYaunhODPz267mrrMKRobPbh8N8=
X-Google-Smtp-Source: 
 ABdhPJxgXke7Ap2Qa3yC5LP3t8adrOiXlYP/K932jAH+Ir4mibJ1UnBvCrtUNjDSliroo7dCFn8Fm2FkSJmvnPogUqU=
X-Received: by 2002:a05:6e02:1ba7:: with SMTP id
 n7mr773103ili.290.1644964101490;
 Tue, 15 Feb 2022 14:28:21 -0800 (PST)
MIME-Version: 1.0
References: <20220214233739.3219186-1-raj.khem@gmail.com>
In-Reply-To: <20220214233739.3219186-1-raj.khem@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 16 Feb 2022 08:27:55 +1000
Message-ID: 
 <CAKmqyKPZA8sVy4sHAiFVV6RuPjNLrsQAPeqJhhiGudNQEZLN0A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] opensbi: Upgrade to 1.0
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Feb 2022 22:28:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161760

On Tue, Feb 15, 2022 at 9:37 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> Drop OE specific patch to shunt march/mabi
> this seems to work fine now.
>
> unset CLANG_TARGET so it can compile with OE produced clang toolchain
> which provides --target itself
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Alistair Francis <alistair.francis@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  ...Makefile-Don-t-specify-mabi-or-march.patch | 36 -------------------
>  .../{opensbi_0.9.bb => opensbi_1.0.bb}        |  5 ++-
>  2 files changed, 2 insertions(+), 39 deletions(-)
>  delete mode 100644 meta/recipes-bsp/opensbi/files/0001-Makefile-Don-t-specify-mabi-or-march.patch
>  rename meta/recipes-bsp/opensbi/{opensbi_0.9.bb => opensbi_1.0.bb} (91%)
>
> diff --git a/meta/recipes-bsp/opensbi/files/0001-Makefile-Don-t-specify-mabi-or-march.patch b/meta/recipes-bsp/opensbi/files/0001-Makefile-Don-t-specify-mabi-or-march.patch
> deleted file mode 100644
> index d2a8048e87e..00000000000
> --- a/meta/recipes-bsp/opensbi/files/0001-Makefile-Don-t-specify-mabi-or-march.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From fe9860fd85e49a75bef545e5d9914070491e8002 Mon Sep 17 00:00:00 2001
> -From: Alistair Francis <alistair.francis@wdc.com>
> -Date: Fri, 15 Feb 2019 14:57:41 -0800
> -Subject: [PATCH] Makefile: Don't specify mabi or march
> -
> -To avoid
> -    can't link double-float modules with soft-float modules
> -errors when building 32-bit openSBI don't specify mabi or march.
> -
> -Upstream-Status: Inappropriate [Fixes a 32-bit OE flow bug]
> -Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> -
> ----
> - Makefile | 2 --
> - 1 file changed, 2 deletions(-)
> -
> -diff --git a/Makefile b/Makefile
> -index ccf8ea3..69e5b38 100644
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -169,7 +169,6 @@ GENFLAGS   +=      $(firmware-genflags-y)
> - CFLAGS                =       -g -Wall -Werror -ffreestanding -nostdlib -fno-strict-aliasing -O2
> - CFLAGS                +=      -fno-omit-frame-pointer -fno-optimize-sibling-calls
> - CFLAGS                +=      -mno-save-restore -mstrict-align
> --CFLAGS                +=      -mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
> - CFLAGS                +=      -mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
> - CFLAGS                +=      $(GENFLAGS)
> - CFLAGS                +=      $(platform-cflags-y)
> -@@ -183,7 +182,6 @@ CPPFLAGS   +=      $(firmware-cppflags-y)
> - ASFLAGS               =       -g -Wall -nostdlib -D__ASSEMBLY__
> - ASFLAGS               +=      -fno-omit-frame-pointer -fno-optimize-sibling-calls
> - ASFLAGS               +=      -mno-save-restore -mstrict-align
> --ASFLAGS               +=      -mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
> - ASFLAGS               +=      -mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
> - ASFLAGS               +=      $(GENFLAGS)
> - ASFLAGS               +=      $(platform-asflags-y)
> diff --git a/meta/recipes-bsp/opensbi/opensbi_0.9.bb b/meta/recipes-bsp/opensbi/opensbi_1.0.bb
> similarity index 91%
> rename from meta/recipes-bsp/opensbi/opensbi_0.9.bb
> rename to meta/recipes-bsp/opensbi/opensbi_1.0.bb
> index 1956fbf9ffc..8430f62543a 100644
> --- a/meta/recipes-bsp/opensbi/opensbi_0.9.bb
> +++ b/meta/recipes-bsp/opensbi/opensbi_1.0.bb
> @@ -8,14 +8,13 @@ require opensbi-payloads.inc
>
>  inherit autotools-brokensep deploy
>
> -SRCREV = "234ed8e427f4d92903123199f6590d144e0d9351"
> +SRCREV = "ce4c0188d96b2c20c2e08d24646a5e517fe15a4b"
>  SRC_URI = "git://github.com/riscv/opensbi.git;branch=master;protocol=https \
> -           file://0001-Makefile-Don-t-specify-mabi-or-march.patch \
>            "
>
>  S = "${WORKDIR}/git"
>
> -EXTRA_OEMAKE += "PLATFORM=${RISCV_SBI_PLAT} I=${D} FW_PIC=n"
> +EXTRA_OEMAKE += "PLATFORM=${RISCV_SBI_PLAT} I=${D} FW_PIC=n CLANG_TARGET= "
>  # If RISCV_SBI_PAYLOAD is set then include it as a payload
>  EXTRA_OEMAKE:append = " ${@riscv_get_extra_oemake_image(d)}"
>  EXTRA_OEMAKE:append = " ${@riscv_get_extra_oemake_fdt(d)}"
> --
> 2.35.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161733): https://lists.openembedded.org/g/openembedded-core/message/161733
> Mute This Topic: https://lists.openembedded.org/mt/89150183/3619028
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alistair23@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

