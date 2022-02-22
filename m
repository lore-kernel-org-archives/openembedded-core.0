Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0900C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 09:59:41 +0000 (UTC)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com
 [209.85.221.178])
 by mx.groups.io with SMTP id smtpd.web11.10971.1645523981216157490
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 01:59:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gbfBTE95;
 spf=pass (domain: gmail.com, ip: 209.85.221.178,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f178.google.com with SMTP id f12so10047108vkl.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 01:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tdqidp7BeOf7Jx3q166TCMXtqLTQGHs4MciLFOdmUuY=;
        b=gbfBTE95DNh6uWHbAVqFQQIv3MCHRlBb7RdEljvD6OXhJUUZwhE/REG8Z6yd10Sstz
         /SYnT1fs4yWSSr99niQdB/tm/TgsvycwDjBFE3pHJZZSQmMynOjK+8QDj5lffZxnRvZZ
         2ezqtgrafL+Z7uxifWMGOmQEUPRtcs78jp+tr5G8j0MEIOgqZSF0FO1RyzjJ7c/7zlqr
         hGi0yNxXXtz61VYmb3Ukqdhe7wi9gDXMZQxA/Goatt2GpvAMi3YsVq+OMyjTrOdx9IEG
         yusDFI2DRHpNHJlpLbGy5tJjIjiHihV9+4nG/tbIJQRFOHDdLMjxcpL36a4XMDn9QyY4
         4h3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tdqidp7BeOf7Jx3q166TCMXtqLTQGHs4MciLFOdmUuY=;
        b=0hFr4p3ncYesKD9shRJlcnryVx2q8ATKrLv4M7Fa6Qwee4qyvcnjemu3Kfm1MM0TQc
         g+I2xUwtsMDHxHGLE+AyH98hYBe5kL3pGofawAt8CpPIos4S96xAGD5UxdIobi/cRL6L
         JpgK4YJDyB2+gwAy4yzmUxB+0kEEY5dIJU9yEnEPwRDms2IW3VD46h+ekpH1gwFsWFx+
         ysPT70f0QshtAi6ULmBEryTNluUxHiK+GYOnY/l8fL1Mzo37+8TrBWIvGFl1d4IpY+gV
         JvTi0wowjjLOPb2/CogZSb3T4ckV5udpLvxxBNteaEaH07RTUgDSdSqZOrLAiI2LAbxN
         BGsw==
X-Gm-Message-State: AOAM5314e3VUXgPaxlMUpp0xAgG/Z2xZBnHHJD7InCw146lYsxf2bB+i
	lTVwoiVBcz6vSQQ2vBHozoSOKxig6KSbUG/Xs2NwvDEc
X-Google-Smtp-Source: 
 ABdhPJyBtL26t81WiN/Oq0WbeJbTZ+xJBt4Xi6VpvPlljgIlfXD6JYYmG5dAc4vcCF6JiKY4pwNRePLIkdHDaqhCFeY=
X-Received: by 2002:a05:6122:20aa:b0:32d:4894:f680 with SMTP id
 i42-20020a05612220aa00b0032d4894f680mr10343062vkd.1.1645523980339; Tue, 22
 Feb 2022 01:59:40 -0800 (PST)
MIME-Version: 1.0
References: <20220222035234.463162-1-andrew@aj.id.au>
 <20220222035234.463162-8-andrew@aj.id.au>
In-Reply-To: <20220222035234.463162-8-andrew@aj.id.au>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 22 Feb 2022 10:59:28 +0100
Message-ID: 
 <CANNYZj_3sRMqa-F_GvR2fCi2vNtafyNOvyHB_WhS99EhpoVK_w@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 7/8] rust: Add snapshot checksums for
 powerpc64le
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 09:59:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162128

I have to note that YP does not support ppc systems as build hosts;
can this be kept in a bbappend?

Alex

On Tue, 22 Feb 2022 at 04:52, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  meta/recipes-devtools/rust/rust-snapshot.inc | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc b/meta/recipes-devtools/rust/rust-snapshot.inc
> index 74b558262f62..d6ffe92d07ee 100644
> --- a/meta/recipes-devtools/rust/rust-snapshot.inc
> +++ b/meta/recipes-devtools/rust/rust-snapshot.inc
> @@ -14,6 +14,10 @@ SRC_URI[rust-std-snapshot-aarch64.sha256sum] = "3618da916a0f92f241cf1d67d04bb578
>  SRC_URI[rustc-snapshot-aarch64.sha256sum] = "f26811e48d03c56c125de03d389e1ae7c6df36990953c1670c6a5676bc12d4cb"
>  SRC_URI[cargo-snapshot-aarch64.sha256sum] = "6d11cd94618d80cda273eeeae7285980445f61a49ebacc616777b482a41cbf3f"
>
> +SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] = "fc07eb3e9f3d227428cc5b53ca868e3de375bc198ce4dce7b87a9246e6fec81a"
> +SRC_URI[rustc-snapshot-powerpc64le.sha256sum] = "f43cb99109c3438c77c7079cdce4673df3320e310158e0b4d949c1babc4300fc"
> +SRC_URI[cargo-snapshot-powerpc64le.sha256sum] = "599cf1b5a8cdbf76d591621bc9222aefa60e2f5fd378ae71c4dcf4514c47122e"
> +
>  SRC_URI += " \
>      https://static.rust-lang.org/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=rust-std-snapshot-${BUILD_ARCH};subdir=rust-snapshot-components \
>      https://static.rust-lang.org/dist/${RUSTC_SNAPSHOT}.tar.xz;name=rustc-snapshot-${BUILD_ARCH};subdir=rust-snapshot-components \
> --
> 2.32.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162121): https://lists.openembedded.org/g/openembedded-core/message/162121
> Mute This Topic: https://lists.openembedded.org/mt/89310363/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

