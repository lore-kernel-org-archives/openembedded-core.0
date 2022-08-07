Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFEFAC19F2D
	for <webhook@archiver.kernel.org>; Sun,  7 Aug 2022 00:48:27 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web08.9296.1659833304480532506
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Aug 2022 17:48:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ld0DDBQ8;
 spf=pass (domain: gmail.com, ip: 209.85.219.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f174.google.com with SMTP id i62so8927503yba.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Aug 2022 17:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=WdPsuWW7i3zgXOZEHvjkzwcrGPnzu1Zg44VQYWUVvQg=;
        b=ld0DDBQ8zPpf6US2n+9WWcBjoqeP/BHAW3waLGeKz+rJlH0rC4pUEpcRoek2vxtEJb
         UBlKR7AKFPlDORoGdjk2jRxVURoHlQTG52rm5VRy6/drDvM+0h+nKoVDj6Euf9IMISH2
         Rm4ncd0qWlHHy+mJeAdlDTV5rhKT3wfdTRz+uSQpbkTNUWFyVC6dYnpTbCc/j//zS1FQ
         +h7k1Cdu6ZjghWuHAyjGyYbbqeHMGB171iDgD1dbKkNlazvh/HvLkkZhrdD2yVnmCjLd
         L1tUvoXGoH3uJqQDVDgb3hSW4I5TXTXhz2Z8bNTR/tSACK6clcFeTnzaOvd5m7H1/OpR
         cEEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=WdPsuWW7i3zgXOZEHvjkzwcrGPnzu1Zg44VQYWUVvQg=;
        b=Oz/FS7tP/xYgAati/RKRlfjnrdjI4SP96f0LMWUfu0njF/iBoa5dHzpWd4oXeovkIw
         dUwmlHO6v8qEcU4M3qlsJKSj0ASKFyP8gwvKjnQEiuksClQiuuoCOyYtiBbqUkB5EDGT
         9iuAwcO0lOIMFS0toN1FuTSBF0oUSXUog7BujOUmnEh51OVQsclrmar03ByksDOa6I7A
         cyeLWIu2bU3WpMON2RZvIEn5+ZUKfCaBbkAgubHw/NdzGYruATU5f+6scm8SaE2Irqbx
         hDzbh4USteaHjqhoxCOGaiEcQ5KSKs8Sy8NutTFsO5y75K7eR3x46rWQMIJI5Gwv6p6v
         ETFQ==
X-Gm-Message-State: ACgBeo1AK0iAY0qCemXJ00/Z83hTZIEFsLHkZntnmGd5nsOr/Fx6r3GO
	MlLwqKAUH0szGPsfNo0JyT78o4j8oK/Z1NFBK18=
X-Google-Smtp-Source: 
 AA6agR6FtyILgbpC5P/5ikXKc7Xxl/vtnXEdirxIjUEN2nBxr8Be0B31eVOV68fMahwRmZPab6gWQqbZuB100fahUBQ=
X-Received: by 2002:a05:6902:11c9:b0:67a:7633:644e with SMTP id
 n9-20020a05690211c900b0067a7633644emr10317621ybu.363.1659833303504; Sat, 06
 Aug 2022 17:48:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220805131252.3706794-1-richard.purdie@linuxfoundation.org>
 <20220805131252.3706794-5-richard.purdie@linuxfoundation.org>
In-Reply-To: <20220805131252.3706794-5-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 6 Aug 2022 17:47:56 -0700
Message-ID: 
 <CAMKF1srgNYi_hUN2UATKUOAJWsGC2BonVXupA1x0goTi-3eRgg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/29] rust-target-config: Add mips n32 best
 guess at target information
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Aug 2022 00:48:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168980

On Fri, Aug 5, 2022 at 6:13 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Add a best guess at MIPS n32 target information. This might not be
> 100% correct but is something to start from at least.
>

Looking at llvm data layout this is correct, so you might update the
commit comment

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/rust-target-config.bbclass | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/meta/classes/rust-target-config.bbclass b/meta/classes/rust-target-config.bbclass
> index 87b7dee3edc..1721839922e 100644
> --- a/meta/classes/rust-target-config.bbclass
> +++ b/meta/classes/rust-target-config.bbclass
> @@ -190,6 +190,13 @@ TARGET_POINTER_WIDTH[mips64] = "64"
>  TARGET_C_INT_WIDTH[mips64] = "64"
>  MAX_ATOMIC_WIDTH[mips64] = "64"
>
> +## mips64-n32-unknown-linux-{gnu, musl}
> +DATA_LAYOUT[mips64-n32] = "E-m:e-p:32:32-i8:8:32-i16:16:32-i64:64-n32:64-S128"
> +TARGET_ENDIAN[mips64-n32] = "big"
> +TARGET_POINTER_WIDTH[mips64-n32] = "32"
> +TARGET_C_INT_WIDTH[mips64-n32] = "32"
> +MAX_ATOMIC_WIDTH[mips64-n32] = "64"
> +
>  ## mips64el-unknown-linux-{gnu, musl}
>  DATA_LAYOUT[mips64el] = "e-m:e-i8:8:32-i16:16:32-i64:64-n32:64-S128"
>  TARGET_ENDIAN[mips64el] = "little"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168939): https://lists.openembedded.org/g/openembedded-core/message/168939
> Mute This Topic: https://lists.openembedded.org/mt/92834380/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

