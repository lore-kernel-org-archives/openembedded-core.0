Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1848BEB64D7
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 21:14:18 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.3847.1687814049760506168
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jun 2023 14:14:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=jL9t1glf;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-4f973035d60so4823823e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 14:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687814048; x=1690406048;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IqfZeVIM1tvEOOaPHMgbUfjDmE1bmiSmspn3Bfy1ibI=;
        b=jL9t1glf34sQtsFzYdQrppcHU0cJqYFwuJ1GgDMfSrxIs+XVTQnbgrGfJFbld4IBpP
         cUnHhVuyUb59jr2QR2uh2bv+3OSMDmPol0LCU6/8VpJhJLv80GubK8MHKZoEevC12TJc
         g6BZukg4dNBGtGL39+igmnc41q7OAfFtrAuLnA24MMDsF+Ws7gG9D1ygev24C5NNu5Zs
         qUbuftVG6XpnAKBWCpJwjHwkIeKL7ZPtdMIJ5Wt751k+yYik9lzO5QP+xNp+QHIPdYlc
         vl0B5V8GnzRhQmUsvP4YLjl6oMFBT3MvO2ARXOZl8GLMghPHf8gaP9xOJ4NudXuL/zd2
         uNeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687814048; x=1690406048;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IqfZeVIM1tvEOOaPHMgbUfjDmE1bmiSmspn3Bfy1ibI=;
        b=G0BA9In1JFERLE2jCNdPCapEJzp8BegmoMMGj76TvPHkrunvPnW2h/ROSBWWPikd3c
         F58NS/rYVlRCQl6zqb0NbfdQDeDfkMMrzR0FKwcu8x8P41AvM9WObMrfCU6KHqvbAvO/
         dor/fSl+TAL+iV8AJM57lVqMK7d8HT3LLl8K83fAcC8mPWrtx7Zp7huRNqER+rArodsd
         G8rCXuHHMoSCDu8+7UJgX7+PoAEszkVXphPwZzOkPkM9SDhPR4nKyWpj1rBlZUBMWP8x
         3pqyK1Zfiu7UYAeyeuRBJQlYtQ3V4Dt0j3W8uMzVZYUUdgrXBkxUFVJv6L8enAj8DMrc
         dPOg==
X-Gm-Message-State: AC+VfDzyB2o/POUTXtC+obQT1E9PBhFP6mp4n2ev/SOGE0B+lAfo3aXJ
	7g26kE8IrWrW4iu78ND9pD13q7kRhOdsoq/E7P5KdtNZav0=
X-Google-Smtp-Source: ACHHUZ5qaSIclAHl+gQx5Tb0Ebc52eZy41SCl+/Hv6uYf4mfTfyLU5EwcNOxyti8dskJ4yMerIqnjzWceNXRLi0E0S8=
X-Received: by 2002:a19:4f5a:0:b0:4f8:65ef:afcd with SMTP id
 a26-20020a194f5a000000b004f865efafcdmr13932892lfk.17.1687814047494; Mon, 26
 Jun 2023 14:14:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230626141908.97141-1-sdoshi@mvista.com>
In-Reply-To: <20230626141908.97141-1-sdoshi@mvista.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 26 Jun 2023 23:13:56 +0200
Message-ID: <CANNYZj_jM2q8V32R7TC2tzPNS=Jx7w4G4ngnB_kAVGuCLvAQSw@mail.gmail.com>
Subject: Re: [OE-core][master][PATCH] Upgrade flac 1.4.2 => 1.4.3
To: Siddharth <sdoshi@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 21:14:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183429

On Mon, 26 Jun 2023 at 16:21, Siddharth <sdoshi@mvista.com> wrote:
>  LICENSE = "GFDL-1.2 & GPL-2.0-or-later & LGPL-2.1-or-later & BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://COPYING.FDL;md5=ad1419ecc56e060eccf8184a87c4285f \
> -                    file://src/Makefile.am;beginline=1;endline=17;md5=146d2c8c2fd287545cc1bd81f31e8758 \
> +                    file://src/Makefile.am;beginline=1;endline=17;md5=b1dab2704be7f01bfbd9b7f6d5f000a9 \
>                      file://COPYING.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> -                    file://src/flac/main.c;beginline=1;endline=18;md5=893456854ce6bf14a1a7ea77266eebab \
> +                    file://src/flac/main.c;beginline=1;endline=18;md5=23099119c034d894bd1bf7ef5bd22101 \
>                      file://COPYING.LGPL;md5=fbc093901857fcd118f065f900982c24 \
> -                    file://COPYING.Xiph;md5=3d6da238b5b57a0965d6730291119f65 \
> +                    file://COPYING.Xiph;md5=0c90e41ab2fa7e69ca9391330d870221 \
>                      file://include/FLAC/all.h;beginline=65;endline=70;md5=39aaf5e03c7364363884c8b8ddda8eea"

If something in license files has changed, the changes need to be
documented in the commit message, and LICENSE needs to be updated if
necessary. Checksums are tracked for that reason: to be able to catch
important changes in upstream licensing terms.

Alex

