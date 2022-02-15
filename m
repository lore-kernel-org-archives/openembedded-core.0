Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84072C433EF
	for <webhook@archiver.kernel.org>; Tue, 15 Feb 2022 17:33:19 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web08.206.1644946398605262361
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Feb 2022 09:33:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FmHwprzN;
 spf=pass (domain: gmail.com, ip: 209.85.160.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id ca12so1573450qtb.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Feb 2022 09:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jyK+gOnW+CChzQ/N+2WYE6eTkfelp91LriW7t1a3pFE=;
        b=FmHwprzNbhNehmhroQvAwn1kStXR0cn2d5xDjHJ/2hy9/LhA8QcR/e24BMkP/wawYb
         nIQCQBmuFPd2MO4xizA/SQtcXB6ww+WXvIC3MGch6n5IIgxfTFhiAANrqP6EkDX2+e9B
         u70Q2PhYt/gLbUD3Sgue666In/purhvkMX4hHPB1Y5tOw/6F3Ewh+FNZGfiMtcMRhHzp
         VvcPUP1MnSBayndbx9zBNXEW3w/IgzJ/0Aca7F8wID8QRSgHj4GjS5rUiY73TIzfqcbl
         TWvIysxG06ON0mJOg4xjhkOnMWpgxigsnJgS0+cMJyiH4QlFxFleurE//ukUNq0c22eW
         SqvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jyK+gOnW+CChzQ/N+2WYE6eTkfelp91LriW7t1a3pFE=;
        b=hkYqiWko9gYQfKu55x1OHP4kPus8wTmRj0B9u7QKbHQhsjVs1aOr5b+XgduzC1uTC8
         fgBByOALqQ4j2E1IYXfZ8EOzcBmx8Uke24+dUL7BkKX3Lmin9dhzJbM11MILUS6Sr1k5
         9aro9TDX1YM6uES/dKGH9oO0Q+cupxedb5gTNDH2Kkig/0R7dgGghwiPO+TRT76Ie+We
         3GVED49NP5jQC/pxhu/rEcAnMbogxRd9EUg85hL1y8VV4xpVPkhHqk8t6N4VpF5ogJj0
         uwL1YnLoh501N/yEHOLsDwJ5n367l1mLFQp704e69h4Feiqekzrtul3gVbfK6P5JXU00
         ZryQ==
X-Gm-Message-State: AOAM530QBDEgRawG3lGAm8RQfM2kOUlHC4DeGZ6DrtxOug+l3noklmrw
	z2SoGZ79C/0BwMk3/XTnpfaLD0fYZI8mJ4eAHOs=
X-Google-Smtp-Source: 
 ABdhPJzsGugARgjJHF+7ONpqbdmQHixWJflqArXUUy/J81y9rHC08HJGrC3zKYACz373S2vUyXEHEfj5RwHuoU4LAIM=
X-Received: by 2002:a05:622a:1a99:: with SMTP id
 s25mr136389qtc.634.1644946397520;
 Tue, 15 Feb 2022 09:33:17 -0800 (PST)
MIME-Version: 1.0
References: <20220215145716.291405-1-bruce.ashfield@gmail.com>
In-Reply-To: <20220215145716.291405-1-bruce.ashfield@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 15 Feb 2022 09:32:51 -0800
Message-ID: 
 <CAMKF1soqFGtyHdUdnsNu_oLX81qnjY0z2cyaHA+S-ouLh62u9Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] linux-yocto/5.10: fix dssall build error
 with binutils 2.3.8
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Feb 2022 17:33:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161758

title should say 2.38 instead of 2.3.8

On Tue, Feb 15, 2022 at 6:57 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Integrating the following commit(s) to linux-yocto/5.10:
>
>     c0b313d988a1 powerpc/mm: Switch obsolete dssall to .long
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  .../linux/linux-yocto-rt_5.10.bb              |  4 ++--
>  .../linux/linux-yocto-tiny_5.10.bb            |  6 ++---
>  meta/recipes-kernel/linux/linux-yocto_5.10.bb | 22 +++++++++----------
>  3 files changed, 16 insertions(+), 16 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
> index 4315ef6fa3..8a8a7eabe9 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
> @@ -11,8 +11,8 @@ python () {
>          raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
>  }
>
> -SRCREV_machine ?= "c8061a9f265a0d314e5b780a651662f462e4b287"
> -SRCREV_meta ?= "a58f4e7cca3973e04d3f9a40356ef9c2c0bb10a5"
> +SRCREV_machine ?= "e5b266bc6b15dc8852649b7d2a31395195dc7b3a"
> +SRCREV_meta ?= "b53e11ea46f4e78ff4cb48532a11e1dbad7939b1"
>
>  SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
>             git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
> index c968d404d0..bf7662eed3 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
> @@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
>  KMETA = "kernel-meta"
>  KCONF_BSP_AUDIT_LEVEL = "2"
>
> -SRCREV_machine:qemuarm ?= "5e7b4957ac1a94fdaaa719f6b62b80856e8a55e6"
> -SRCREV_machine ?= "24a50caea8c65c2af4987c60067dc55ef737ebca"
> -SRCREV_meta ?= "a58f4e7cca3973e04d3f9a40356ef9c2c0bb10a5"
> +SRCREV_machine:qemuarm ?= "9a8497a8761a22b3086cab63d18698024a69a410"
> +SRCREV_machine ?= "317635e1feaecfd8aa29bc94d8d03ba873190414"
> +SRCREV_meta ?= "b53e11ea46f4e78ff4cb48532a11e1dbad7939b1"
>
>  PV = "${LINUX_VERSION}+git${SRCPV}"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
> index ae607d721b..ecb2d03949 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
> @@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
>  KBRANCH:qemux86-64 ?= "v5.10/standard/base"
>  KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
>
> -SRCREV_machine:qemuarm ?= "7f5de9bc153963749c9a566828b59d4e63796432"
> -SRCREV_machine:qemuarm64 ?= "c5bed4d604e64e8ce795a28576e341a2e790b4de"
> -SRCREV_machine:qemumips ?= "0361229f491eec312e503cf7e58931571e53503f"
> -SRCREV_machine:qemuppc ?= "2d7e10b0e0bab9b364e7612caf81b318f1d28b27"
> -SRCREV_machine:qemuriscv64 ?= "1bd813fe8d0e8e2bc4b05fdf61fb77d68ee416c5"
> -SRCREV_machine:qemuriscv32 ?= "1bd813fe8d0e8e2bc4b05fdf61fb77d68ee416c5"
> -SRCREV_machine:qemux86 ?= "1bd813fe8d0e8e2bc4b05fdf61fb77d68ee416c5"
> -SRCREV_machine:qemux86-64 ?= "1bd813fe8d0e8e2bc4b05fdf61fb77d68ee416c5"
> -SRCREV_machine:qemumips64 ?= "931424f9c84cc440e8f154465062e71e2bdc2f03"
> -SRCREV_machine ?= "1bd813fe8d0e8e2bc4b05fdf61fb77d68ee416c5"
> -SRCREV_meta ?= "a58f4e7cca3973e04d3f9a40356ef9c2c0bb10a5"
> +SRCREV_machine:qemuarm ?= "5c9de82973348b40bfdcecc0623f488d9443038e"
> +SRCREV_machine:qemuarm64 ?= "8c841836837414c6d07fa08ef8482162760fc27a"
> +SRCREV_machine:qemumips ?= "d8287fdfbe460acdd62cf57e351411c992101514"
> +SRCREV_machine:qemuppc ?= "f436ec6dd3942a87331abf39805e791460e499ef"
> +SRCREV_machine:qemuriscv64 ?= "c0b313d988a16b25c1ee730bfe7393c462ee8a5c"
> +SRCREV_machine:qemuriscv32 ?= "c0b313d988a16b25c1ee730bfe7393c462ee8a5c"
> +SRCREV_machine:qemux86 ?= "c0b313d988a16b25c1ee730bfe7393c462ee8a5c"
> +SRCREV_machine:qemux86-64 ?= "c0b313d988a16b25c1ee730bfe7393c462ee8a5c"
> +SRCREV_machine:qemumips64 ?= "ae7887fe8d4da06d2d0d0a5071d09155899de26c"
> +SRCREV_machine ?= "c0b313d988a16b25c1ee730bfe7393c462ee8a5c"
> +SRCREV_meta ?= "b53e11ea46f4e78ff4cb48532a11e1dbad7939b1"
>
>  # remap qemuarm to qemuarma15 for the 5.8 kernel
>  # KMACHINE:qemuarm ?= "qemuarma15"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161751): https://lists.openembedded.org/g/openembedded-core/message/161751
> Mute This Topic: https://lists.openembedded.org/mt/89162211/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

