Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 037B3C433FE
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 10:22:06 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.17428.1668853324201278442
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 02:22:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FbiKF9Lu;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id p8so11989051lfu.11
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 02:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SNy2JHkY/O795s24DuTMypbxYzgLt76jGlwBuR63FnY=;
        b=FbiKF9LuaJg4+nYAkLeeoiYIOIM5TTTV2Jx93TmPA5mwtfwl7X+vhnqV4LERT0oOJJ
         9+PCdpqNLMh/JyhjYnF6EPlBQLVROH0VCEOImO1RSmZsnAsUa5CABux6rZwECQNuQhSI
         AbGGbdLcuLMije7CVcz7JWi5d9PEvBv561eTIyYqh3L7urS9vmyHjQzSf/Jt3E+mjJoz
         hvS3C1xlp8z+PWB59oQkemazdpP9wg2pu1crd8KGs3hdMGRsSaF7vHz0xmq5ZrNa2Idr
         U29H1iCVvAmT6sSSBp574KYKBaLoGIMDgK/9NJBVYqgZ+umSwkvxW3jSNFvpMhX6KB+o
         FkZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SNy2JHkY/O795s24DuTMypbxYzgLt76jGlwBuR63FnY=;
        b=xTo8IIFOSZ1f4ATRywTkfrsDWRlKFEj0F/HI5AIcTxsaM6ix5dVbE84g3Gxv/jfhLd
         sStSIna8pB78SjVwRFU5scJNDgcOYuAu0jdY0YFm1OizppB18zGtGpjjEfSq5aeS7UrR
         qhjA8e3U9OUN+pEyoy8zACWBScDYEzXzluVZicFReIdKTsI7se/Qb0FBtORcTNtArp2A
         QcXStrioIlHX5CWVZoGXV81ZOiOjFTQCULuUB3/7OnzarnGLKSKiaSEIm3iw7wvhzptl
         olDxXLrQPP+942SHkc62BRhwrCLhwyT3exd09oHRv0+ED+XvNcb7U10/jGvf/JQoQ2EJ
         IQpw==
X-Gm-Message-State: ANoB5pmWPv2HYP2QP6Yk6XHtW7MPR9N+lliOSn+4jg53spEcP5waG6df
	2M3/vEfciNSPn5x1XUL3NsVsKiP5PNDYPd40VPE=
X-Google-Smtp-Source: AA0mqf78l38b1twnjCF+g6Eicl6V+C1R2TIGLY4isJsoAyzHwUFYtFwfmNZAIcBL2+6nrFSol1IY/lrk65y6Dke/HaQ=
X-Received: by 2002:a19:5f1e:0:b0:4aa:81bc:dcf with SMTP id
 t30-20020a195f1e000000b004aa81bc0dcfmr3829847lfb.393.1668853322191; Sat, 19
 Nov 2022 02:22:02 -0800 (PST)
MIME-Version: 1.0
References: <20221119101115.319-1-cp0613@linux.alibaba.com>
In-Reply-To: <20221119101115.319-1-cp0613@linux.alibaba.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 19 Nov 2022 11:21:50 +0100
Message-ID: <CANNYZj_UJUJ0QAsbtB7nMEdJ+WD2NPd-soRmbiNp-0gDB2aH=w@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe] [PATCH] rust-snapshot:add riscv64 toolchains
To: cp0613 <cp0613@linux.alibaba.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 10:22:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173514

I do have to ask, what kind of hardware are you using? Riscv64 systems
tend to be seen as something akin to raspberry pi, but if building
rust (which takes at least ten minutes on a 2x64 core x86 server) is
now feasible, I'd like to know how :)

Alex

On Sat, 19 Nov 2022 at 11:11, cp0613 <cp0613@linux.alibaba.com> wrote:
>
> From: Chen Pei <cp0613@linux.alibaba.com>
>
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
> ---
>  meta/recipes-devtools/rust/rust-snapshot.inc | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc b/meta/recipes-devtools/rust/rust-snapshot.inc
> index 2f9cdb9566..491c022a36 100644
> --- a/meta/recipes-devtools/rust/rust-snapshot.inc
> +++ b/meta/recipes-devtools/rust/rust-snapshot.inc
> @@ -21,6 +21,10 @@ SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] = "ef697469b2a3ea8897f49b70e3be
>  SRC_URI[rustc-snapshot-powerpc64le.sha256sum] = "11630fc51fffe722e52f649357b5948c24b5305cfb61a8114527234e054451c4"
>  SRC_URI[cargo-snapshot-powerpc64le.sha256sum] = "ba7188b2c7890e61bf58d3aa9e94c323fec375f67cf03841bbcc0f6c800fe6ad"
>
> +SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] = "284b09a96d4cdbb96827914a318f9c41e2b207c0afeae76b9f0e3830d2ef2d4d"
> +SRC_URI[rustc-snapshot-riscv64gc.sha256sum] = "5f3e69a185c7246773948ac97c053cf135d81ffdbf926d10a3339de93424f26b"
> +SRC_URI[cargo-snapshot-riscv64gc.sha256sum] = "b94e262dec82b7cacf3baa77f35601c82d389ad338d118b42da4d23e26240760"
> +
>  SRC_URI += " \
>      https://static.rust-lang.org/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=rust-std-snapshot-${RUST_BUILD_ARCH};subdir=rust-snapshot-components \
>      https://static.rust-lang.org/dist/${RUSTC_SNAPSHOT}.tar.xz;name=rustc-snapshot-${RUST_BUILD_ARCH};subdir=rust-snapshot-components \
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173513): https://lists.openembedded.org/g/openembedded-core/message/173513
> Mute This Topic: https://lists.openembedded.org/mt/95130600/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

