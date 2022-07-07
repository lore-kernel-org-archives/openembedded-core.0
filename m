Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 614D9C43334
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 08:20:13 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web12.3178.1657182002784537175
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 01:20:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B+MJhPUM;
 spf=pass (domain: gmail.com, ip: 209.85.167.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id t25so29830558lfg.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 01:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gPNMuAsaJtHW7OMFIu0Iu5Klfl1PxF/eQ24zep3RPf0=;
        b=B+MJhPUMJpmSV0UiaeuXOFLe27fjmisjt6omusdg2oQUPWe70tK5Q3lkpVQvi9TIB2
         rnBMbZ5Il6zOvfBmU4+Eqa97y7H0o60l18VF/Vj9TGpOWVN/2bdjQNCu9nZiT5tskp8P
         LNQ6ABwBsrike63dq9ebEJgCyefjLGxuaEjIKLSw4oul/FPuJeGFYLtRPcTIeIHUipog
         DkpQfkAI7PSNbrm/lZe/84RL4maogxUumgKFoy3yvjhJDpwYlnbDfZcEBaDsMu8E+qvU
         AC31VzF93UBsKRmxUsbApRugABXFiP1i1t2RNKUzo+bpJVEtALJtmVJimF4tzn1YKLM8
         8log==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gPNMuAsaJtHW7OMFIu0Iu5Klfl1PxF/eQ24zep3RPf0=;
        b=W2XpSSKiMFxNTxiBBGeMqChCOD7jnk9jcKkiMUwk3a0sCnKpiH1ESndkon4X/FHk8w
         kfSRai4bFpbToBmzRDkJhh2oDa6ndbrd50nO+VnMZdwTASVRaPUYBqrMVR/PVxAaxdww
         UdQwfXWCGPC75G5HlF/KhSiwN6MLbHN8ScViu9CTVG13vI9I4UvoKsps5brkcePIDejC
         kQn1fukiN9RoKff9y+f1VW7wqqtlXCjSMqdEwmh+b9JWaxvn81d27kbCtO+CYTLqXLyO
         r75QKXt033V/2W4wzwDRAkJ6Y5AarNn6LZv0/0NwqnpS15PAG9xVY5FPDo8MtTuYxryY
         a2jA==
X-Gm-Message-State: AJIora/qsPqgio2I7Eb1KOI2vWGL9PU3Fmigqd13NZCTrOa3tusIc9dK
	TSPCIP4Md3R0guuv4tV51LyNRi+ZekXJe/wbnAE=
X-Google-Smtp-Source: 
 AGRyM1sb5oDPq+dqtSJGzfhn9WMovsHMMU7O9dUet+38r/nDe6UO7MSa8SghnzF2vK8xocgrRzMjT7x0VaLKmOx/gXY=
X-Received: by 2002:ac2:5597:0:b0:47f:8d1d:c63d with SMTP id
 v23-20020ac25597000000b0047f8d1dc63dmr28225222lfg.521.1657182000685; Thu, 07
 Jul 2022 01:20:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220707081704.2494733-1-adrian.freihofer@siemens.com>
 <20220707081704.2494733-2-adrian.freihofer@siemens.com>
In-Reply-To: <20220707081704.2494733-2-adrian.freihofer@siemens.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 7 Jul 2022 10:19:50 +0200
Message-ID: 
 <CANNYZj-uo4wxG8e0RMhFk61t=1DYL00Eq11Fj9gPLvzg7hVH8Q@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH 1/2] libqmi: upgrade 1.30.4 -> 1.30.8
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Jul 2022 08:20:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167760

Wrong mailing list, should go to oe-devel.

Alex

On Thu, 7 Jul 2022 at 10:17, Adrian Freihofer
<adrian.freihofer@gmail.com> wrote:
>
> Update to latest stable version:
>
> 1.30.8
> * New request/response/indications:
>   ** dms: new 'Foxconn FCC authentication v2' request/response.
>
> 1.30.6
> * build:
>   ** meson: fix 'export_packages' in GIR setup.
> * libqmi-glib:
>   ** net-port-manager: use unaligned netlink attribute length.
>
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  .../libqmi/{libqmi_1.30.4.bb => libqmi_1.30.8.bb}               | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.30.4.bb => libqmi_1.30.8.bb} (95%)
>
> diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.30.4.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.30.8.bb
> similarity index 95%
> rename from meta-oe/recipes-connectivity/libqmi/libqmi_1.30.4.bb
> rename to meta-oe/recipes-connectivity/libqmi/libqmi_1.30.8.bb
> index 4807244a5..a1cfe29cc 100644
> --- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.30.4.bb
> +++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.30.8.bb
> @@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 glib-2.0-native"
>
>  inherit meson pkgconfig bash-completion gobject-introspection
>
> -SRCREV ?= "f6c2feaf199e0f129a0bde8c5e6cba5f2117b564"
> +SRCREV ?= "95108b6eebfefa6621a1c34565f562eeca9308b9"
>  # patch 0001 is on main branch upstream
>  SRC_URI = "\
>      git://gitlab.freedesktop.org/mobile-broadband/libqmi.git;protocol=https;branch=qmi-1-30 \
> --
> 2.35.3
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167759): https://lists.openembedded.org/g/openembedded-core/message/167759
> Mute This Topic: https://lists.openembedded.org/mt/92224455/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

