Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BF28C54FB9
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 12:13:08 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.5240.1700136782598538013
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Nov 2023 04:13:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fUoIiY8g;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.178, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2c6ed1b9a1cso8953431fa.3
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 04:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1700136781; x=1700741581; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IQ25eSTLXh0MhNwMnmv5bcREK4qo17CXYYrBJq39Z0E=;
        b=fUoIiY8ghbJO7xrW0nNtJw+02gGliDIgzc+dQ/TymR54KNeNa0sBnY/giZQFzqP7ow
         HS4IA/sJ1Jq0bAa4AsN+8Sn5AQxmO37qaJ+G7YNHU5fFVaxoJ4iG+X5iHXJxwwxBlPbS
         7Owx5gIPDWHbYz3W76CfAGrob/yBfAqC9ElSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700136781; x=1700741581;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IQ25eSTLXh0MhNwMnmv5bcREK4qo17CXYYrBJq39Z0E=;
        b=f0GE3q/Kgw5rnBotX55pv9KhIPW2kIiASg4RDVVZ5Aqa1GxteiMbhp8Y8YE9wTWaWO
         wwTh30wQIIcBshmkHENZnv2f8wjg1QTgZRkaKgQassWOw3930IRxcFwvRHfuOpkBJBX2
         X8Mvivm5lVL4PG3ZC7lpbikfrM8pUjLzA1J+WuI2gNCjr2xgtbaTYugfgh9fTa9DMc+Z
         s1Lmm0WD2Djzn2LOR0hLl0qIztR2FYAdRCTaYDG48RYObfA7o3n+AMR5wd/ateHKTW0S
         I6Jh9HSl7KwOjCQvmfZANBRYS/DQNGpthgUdPRI+AT3ABVi7CDgYrW4ZwIvvV/KICeYd
         0QxQ==
X-Gm-Message-State: AOJu0YwDPrRfKhzrr/1kBTR0KCyDWZ/KKSN2HvDf4bbrlFbFWo2HLTyp
	R3ToPs5BbCPr4XTdYKwI5466aw==
X-Google-Smtp-Source: AGHT+IHD9J2ABZkvr9OHxksmOst4vRsXTIRfU3OeX+JYGo81Ht+lxo+MlNC4HXqSeoJrgAcp2LFL2Q==
X-Received: by 2002:a2e:350e:0:b0:2c5:19ab:726e with SMTP id z14-20020a2e350e000000b002c519ab726emr6293972ljz.47.1700136780670;
        Thu, 16 Nov 2023 04:13:00 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:6dd4:df61:1cbf:d952? ([2001:8b0:aba:5f3c:6dd4:df61:1cbf:d952])
        by smtp.gmail.com with ESMTPSA id r4-20020a05600c35c400b003fefb94ccc9sm3414700wmq.11.2023.11.16.04.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 04:13:00 -0800 (PST)
Message-ID: <1ab344acaa97212f14044d48623d03b9a93c2ed4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] meta/recipes: Remove empty
 ${PN}/DEV_PKG_DEPENDENCY workarounds
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yoann Congal <yoann.congal@smile.fr>, 
	openembedded-core@lists.openembedded.org
Cc: Fawzi KHABER <fawzi.khaber@smile.fr>
Date: Thu, 16 Nov 2023 12:12:59 +0000
In-Reply-To: <20230928215640.2683961-3-yoann.congal@smile.fr>
References: <20230928215640.2683961-1-yoann.congal@smile.fr>
	 <20230928215640.2683961-3-yoann.congal@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 12:13:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190791

On Thu, 2023-09-28 at 23:56 +0200, Yoann Congal wrote:
> From: Fawzi KHABER <fawzi.khaber@smile.fr>
>=20
> Remove superfluous DEV_PKG_DEPENDENCY =3D "" previously used to bypass
> ${PN}-dev package RDEPENDS on empty&non-built ${PN}. DEV_PKG_DEPENDENCY
> applies RRECOMMENDS now, all workarounds are not needed anymore.
>=20
> Related to [YOCTO #6839] and [YOCTO #8222]
>=20
> Signed-off-by: Yoann CONGAL <yoann.congal@smile.fr>
> Signed-off-by: Fawzi KHABER <fawzi.khaber@smile.fr>
> ---
>  meta/recipes-connectivity/bind/bind_9.18.19.bb                | 1 -
>  meta/recipes-core/musl/bsd-headers.bb                         | 1 -
>  meta/recipes-core/musl/libssp-nonshared.bb                    | 1 -
>  meta/recipes-core/newlib/newlib_git.bb                        | 3 ---
>  meta/recipes-devtools/gcc/libgcc-common.inc                   | 4 ----
>  meta/recipes-devtools/python/python3_3.11.5.bb                | 1 -
>  meta/recipes-graphics/mesa/libglu_9.0.3.bb                    | 3 ---
>  meta/recipes-graphics/mesa/mesa.inc                           | 3 ---
>  meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb        | 1 -
>  meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb                | 1 -
>  meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb          | 1 -
>  meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb          | 3 +--
>  meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb         | 3 +--
>  meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc | 1 -
>  meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb  | 1 -
>  meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb | 1 -
>  16 files changed, 2 insertions(+), 27 deletions(-)

Firstly, sorry for taking as long to get to this. The patch 1/2 looks
good and I'm happy to merge that. It does set us on the patch I
outlined originally so I think we're good there.

I'm less sure about this second one. It appears to remove variables
which do actively change things and once they are removed, warnings
from the previous patch show up.

I therefore think the second patch is incorrect and doesn't move us in
the direction we want?

Cheers,

Richard

