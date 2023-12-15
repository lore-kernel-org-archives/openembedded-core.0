Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53EFFC4332F
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 01:39:14 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web11.50068.1702604352951051727
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 17:39:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bUoxrHed;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3ba3cf9aa13so163389b6e.2
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 17:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702604352; x=1703209152; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eNSBTMcUhsB9EIE6M6W4hUc/W+5dx2+xvCdR7QtYxys=;
        b=bUoxrHedzP3efxTLR3Igsu4PvClqSzAzTpbz4HiWvgLgiUM2dR95t8CswMPgQF3Dgz
         PKldIC1xh90oLrHj3rAlxNZF+D3g3TUgjYbUlSu+QBlv4ax39BtJjcUyCbneNG8KuLFT
         GvSdKqMGrki40VvJNT2rtySybWwI1Sok/q7PO3wrHDMIXYQtUtBizjfpXKEZQ2Le0ehh
         Plr4KHdcjdLrR9ehZwa7gAitsynCK5zG+1C19phLWuzmp6wDREdAwTUU5MLohONYyeNL
         j708fd2WzX0eFm+1bg+gE+EfkdPgBuUJEel0Maa6CtKUmLwNxDce7uei5GyyyyMavQwc
         bqOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702604352; x=1703209152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eNSBTMcUhsB9EIE6M6W4hUc/W+5dx2+xvCdR7QtYxys=;
        b=xPSU/vjbjTxsuFsIP9e3B7RGEMfY5r/91ys19YQfKNGlGW2qhTBRf2Ydn1Dmi54glI
         2wHd66obfTOorwkkqZcRZhjZkebzOUFZPPwz9IdYGbVA3PVU0UklTYB8XvKsCf473KlL
         HUnlXt0ZZsgIu9m6NsxOMebGuBVaASS9G//6b0dqCCORACNc+Now0ger7jSV9yb8VuYK
         nG5gP005wErrPNsvw7LxIUHC82nI8T2qqKk93R7wIss6hYeiadk4dz923+BzyuehD/DF
         i0MwzIGt2OkMqwI8RlQ6eZ2hyf9hciaARbQP0b2fver1Fmmc+V1ze2cT34PKzshAKVzg
         U98w==
X-Gm-Message-State: AOJu0YxzI0ti67WF0ZHfQXuOVj0iZY0MrXZHsS9Bn5oQ4v/fskX93Iu4
	k85MkJ+LchpoybrhwR3KmR77srCIDdUA3rgO7BI=
X-Google-Smtp-Source: AGHT+IG049gnQCBQ7+dlyegReBSyZDlzqTgo2mQjkGhSSwtqBrCqIkhJ4RIjwMibLdt+gvXVcNvSaDSYrHsP8a89ICA=
X-Received: by 2002:a05:6808:320d:b0:3b9:e80b:709f with SMTP id
 cb13-20020a056808320d00b003b9e80b709fmr14945517oib.83.1702604352056; Thu, 14
 Dec 2023 17:39:12 -0800 (PST)
MIME-Version: 1.0
References: <20231214143222.2796092-1-quic_vkraleti@quicinc.com>
In-Reply-To: <20231214143222.2796092-1-quic_vkraleti@quicinc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Dec 2023 17:38:45 -0800
Message-ID: <CAMKF1spP2P5zNaXoAhmmfMbxLxrN=_2ZayaYp_yLMzU2+TioSg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] systemd-boot: Add recipe to compile native
To: Viswanath Kraleti <quic_vkraleti@quicinc.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 01:39:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192412

On Thu, Dec 14, 2023 at 6:33=E2=80=AFAM Viswanath Kraleti
<quic_vkraleti@quicinc.com> wrote:
>
> systemd-boot native recipe provides ukify tool to build
> UKI images for systemd-boot
>
> Signed-off-by: Viswanath Kraleti <quic_vkraleti@quicinc.com>
> ---
>  .../systemd/systemd-boot-native_254.4.bb          | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 meta/recipes-core/systemd/systemd-boot-native_254.4.b=
b
>
> diff --git a/meta/recipes-core/systemd/systemd-boot-native_254.4.bb b/met=
a/recipes-core/systemd/systemd-boot-native_254.4.bb
> new file mode 100644
> index 0000000000..baa60ae0d2
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd-boot-native_254.4.bb
> @@ -0,0 +1,15 @@
> +require systemd.inc
> +
> +inherit native
> +
> +deltask do_configure
> +deltask do_compile
> +
> +do_install () {
> +       install -Dm 0755 ${S}/src/ukify/ukify.py ${D}${bindir}/ukify
> +}
> +addtask install after do_unpack
> +
> +PACKAGES =3D "${PN}"
> +
> +FILES:${PN} =3D "*"

Lets be explicit about what we want to package.

> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192384): https://lists.openembedded.org/g/openembedde=
d-core/message/192384
> Mute This Topic: https://lists.openembedded.org/mt/103170560/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

