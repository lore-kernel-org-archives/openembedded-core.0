Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD6BBCA0EEB
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 17:58:24 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web10.272.1755626296905100074
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 10:58:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hGdhhXfr;
 spf=pass (domain: gmail.com, ip: 209.85.219.175, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e934b5476a0so2427417276.3
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 10:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755626296; x=1756231096; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zpepbljOapLWS1f43TW/1DEZrl13TBB8q/uNWJQLn+g=;
        b=hGdhhXfraAkrd9ilCj26vlUA5A2+tUlqjRKwNKdW/xmJdOwgdRgEdLEZzhkp3wxz2a
         iOg8Tv6EGxNEsQNvUEZkaaCHZ2P9QXacLN2jagYfBiYvt/lC/ZFsx1bgctV/vYVXfwda
         c3rzd024Eooqw5TGfkocRGF7hBTl7lu4vpAQ5kecGzigfh9xsDhovZTDWYYOQNLjmQHJ
         O9xJJL1jNXkg8yR1ADYl4+yyqPFNGx3RrSLvJ03Yat93srsHTWNWbvFjQ6i6qxyV2tg1
         sv3XlL6VlGVafB2YIPZbJqp7WRNcEg3RFjPVB69IzYC/xNFdZMQI2cDQ2WaTaMGMD4TT
         a6BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755626296; x=1756231096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zpepbljOapLWS1f43TW/1DEZrl13TBB8q/uNWJQLn+g=;
        b=p+8nL1wjckj0LuxUimE3XdgyVpvcUD9wjWj5iQX19D3W3qdJVbtAF4heOf8FSRndUp
         Lhv7Y1vAiVo/2ys2EyX3f9hbvL0ijtbeE3IcUw30DK44AqN90VjkHnbzYq3E2uzILbd+
         Abe/aLh3Bq+BjdFnysCvVf0C37Gdn7M3x0mvyFW0a4ZQU7vi1ER4SZhO4zcTgIl8DfAy
         7ZaGJWUaOS3Q93Jl2/ioeI7GPHPtgP+AuduFCEW38cauL3AvLO/9Qn4HY0bQ6eFxb3B2
         yqo4f0WlZon3eWmrWZzN5BS+nh0CtV4okUsBcWr/sDmVafHTtZW0LsC5QME+9mNptp6B
         X6mQ==
X-Gm-Message-State: AOJu0YxhtxMo/Osk7P7sWWBurW1oyO7tBS3Zwv1B3fYltfDWGe5kw/lH
	BQ57f7tgdTj7rWAR22n4htsRkl05cMpvrVrsoghw0p20rh6hJIIb+oYbMSgob0BO55xLy2Zllk2
	ok2v7k88E9fEtueeIPRqEsgYFFEOsV0U=
X-Gm-Gg: ASbGncv2cw41i39zdLow7OYb3KBpjkjDnc3M+dknf813hLwYhxg6pY7D3JQpS6bEQii
	GfyiSzHNFIHS408hbZhIxlbMef7CBDQi92sd0CxvWMGdPj0QmqRuLJ0n27nP2sJIW5DUlJuUNpq
	WOpQCwrXxbVcgLpha5+Dfn+qj1RoyTIhkloapsLnO03Xr2sHRwosrSrr1Egt+tTvMrh6N/SYGa8
	T+Sqwb4Za9042m9UCvhzth4a4ULaDeZDh8p
X-Google-Smtp-Source: AGHT+IFO+dimHq0vBIeCbUFPwiwWcgSjS1VOcmIbaZOghAWwP1q+KrPFrVo/ogeuaLmhF6oCHkySzl6bc580gHN3NsI=
X-Received: by 2002:a05:6902:6005:b0:e90:8278:5f2f with SMTP id
 3f1490d57ef6-e94e634a81bmr3762843276.48.1755626295896; Tue, 19 Aug 2025
 10:58:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250819-mesa-libclc-panfrost-v5-0-b8b89e6af908@cherry.de> <20250819-mesa-libclc-panfrost-v5-1-b8b89e6af908@cherry.de>
In-Reply-To: <20250819-mesa-libclc-panfrost-v5-1-b8b89e6af908@cherry.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 19 Aug 2025 10:57:49 -0700
X-Gm-Features: Ac12FXx-E9FEGp_LzBUI2TjNcnQJb4VPOHYPfAZt1z7BTr6Rrqf95WsZ0Jvmrtc
Message-ID: <CAMKF1srwWF=gXkEQyhVdE+L=Si3KSyWdRUL77kz_97qjPmF43g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5 1/9] mesa-gl: make mesa-gl really openGL-only
To: foss@0leil.net
Cc: openembedded-core@lists.openembedded.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Markus Volk <f_l_k@t-online.de>, 
	Trevor Woerner <twoerner@gmail.com>, Ross Burton <ross.burton@arm.com>, 
	Otavio Salvador <otavio.salvador@ossystems.com.br>, 
	Quentin Schulz <quentin.schulz@cherry.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 17:58:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222124

On Tue, Aug 19, 2025 at 1:16=E2=80=AFAM Quentin Schulz via
lists.openembedded.org <foss=3D0leil.net@lists.openembedded.org> wrote:
>
> From: Quentin Schulz <quentin.schulz@cherry.de>
>
> The ??=3D operator for PACKAGECONFIG doesn't actually do anything because
> the recipe includes mesa.inc which already sets this variable (with the
> =3D operator).
>
> This probably wasn't noticed until now because mesa-gl is likely only
> ever built in its target flavor which was already set correctly thanks
> to the :class-target override.
>
> This essentially only make mesa-gl-native and nativesdk-mesa-gl follow
> the same configuration as the target.
>
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
>  meta/recipes-graphics/mesa/mesa-gl.bb | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/meta/recipes-graphics/mesa/mesa-gl.bb b/meta/recipes-graphic=
s/mesa/mesa-gl.bb
> index e2f03c81c4588c6257ffec2892fef7fcbe9f82bf..35d6dc854cf4dfac7a757e333=
e25e4ddeab10b6e 100644
> --- a/meta/recipes-graphics/mesa/mesa-gl.bb
> +++ b/meta/recipes-graphics/mesa/mesa-gl.bb
> @@ -9,6 +9,4 @@ S =3D "${UNPACKDIR}/mesa-${PV}"
>  TARGET_CFLAGS =3D "-I${STAGING_INCDIR}/drm"
>
>  # At least one DRI rendering engine is required to build mesa.
> -PACKAGECONFIG ??=3D "opengl gallium ${@bb.utils.contains('DISTRO_FEATURE=
S', 'x11', 'x11', '', d)}"
> -PACKAGECONFIG:class-target =3D "opengl gallium ${@bb.utils.contains('DIS=
TRO_FEATURES', 'x11', 'x11', '', d)}"
> -
> +PACKAGECONFIG =3D "opengl gallium ${@bb.utils.contains('DISTRO_FEATURES'=
, 'x11', 'x11', '', d)}"

you can use bb.utils.filter here e.g.
${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}

>
> --
> 2.50.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#222077): https://lists.openembedded.org/g/openembedde=
d-core/message/222077
> Mute This Topic: https://lists.openembedded.org/mt/114777987/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

