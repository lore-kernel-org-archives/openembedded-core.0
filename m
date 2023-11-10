Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7596CC4332F
	for <webhook@archiver.kernel.org>; Fri, 10 Nov 2023 08:12:13 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.23271.1699603929749386189
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 10 Nov 2023 00:12:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ad6+piGu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-507c5249d55so2468979e87.3
        for <Openembedded-core@lists.openembedded.org>; Fri, 10 Nov 2023 00:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1699603928; x=1700208728; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VzOmxAtLn0QYlIQ6MEXcvb9b2FYu8SfZG3MJBbWZ6ZE=;
        b=ad6+piGuOSE74Z3gMK/aF1waEObH8CSARXYDVbvHFdonx99pL0N3jj50c3gvZORVFE
         Xj8on0GpiX9zkSYV7Vg+3E4Rj6m6RWi7BUclbm12w2/kJAtsyaP5s9ph4Se74T/WLFA/
         2zuHTfd2lyTOMGz04RsDB/ai0XfQ62aHZPJ0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699603928; x=1700208728;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VzOmxAtLn0QYlIQ6MEXcvb9b2FYu8SfZG3MJBbWZ6ZE=;
        b=PwA6dZozvQxFz6gOja3d0nWDroA5G2rAtPOw2lUo/t6QR96ZrVHtD8tlRefsez6Ftf
         KU/jD/KHy3oAO0hpnEgl3X5JDH5hEyN4sMshlIYLJwDhUpu7Hhs4+WldKjVgVKqwvF4L
         Q0uMA2EdjmeHk31ddhKDWQBZNnJfZvv6XKcSDe+bOuMPC3jRxSwlpricj7D0WUsmxPo0
         hgE94Kpk4B5ccMDAsWzkM+OR/zponLTkAbj1DNLls3KT8n/wkrsZuDNiS3B12NeudUl7
         tR9XMmb9VFCca18+MhoIj30VlaNdR9vWoFUGbx6unKqsljeOcysCMhkSez9FeYJ+P/Ak
         ckaQ==
X-Gm-Message-State: AOJu0YzflObSfuyKGq5nu55tuJ3ryN6xEkfVgpnAf+bjjTGSZ6SZ4iBg
	FEWy8DPFLod2QPFfH7KiTCzb7g==
X-Google-Smtp-Source: AGHT+IElgHV5nfqQdXec/tCU5Rjzp7iCUwRGBdeXFM1Ea9X31WADBbzE12J5h1lvTZi98tbXFm+9UQ==
X-Received: by 2002:a19:7116:0:b0:509:4f70:f6f3 with SMTP id m22-20020a197116000000b005094f70f6f3mr3199452lfc.64.1699603927945;
        Fri, 10 Nov 2023 00:12:07 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:3703:3761:dd76:7c61? ([2001:8b0:aba:5f3c:3703:3761:dd76:7c61])
        by smtp.gmail.com with ESMTPSA id i15-20020adfe48f000000b0032dbf32bd56sm1378152wrm.37.2023.11.10.00.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Nov 2023 00:12:07 -0800 (PST)
Message-ID: <8d001ec40a0b801fb38a44388585bf2f182e6134.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] staging.bbclass: Inlcude native dirs for
 nativesdk build
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Vyacheslav Yurkov <uvv.mail@gmail.com>, 
	Openembedded-core@lists.openembedded.org
Date: Fri, 10 Nov 2023 08:12:06 +0000
In-Reply-To: <20231110064147.20798-1-uvv.mail@gmail.com>
References: <20231110064147.20798-1-uvv.mail@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Nov 2023 08:12:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190401

On Fri, 2023-11-10 at 07:41 +0100, Vyacheslav Yurkov wrote:
> Some build systems (like cmake) check whether target binaries are
> present even if they are not used during compilation. Excluded ${bindir}
> causes such recipes to fail to build nativesdk variant. The good
> example of that is protobuf/grpc nativesdk build from meta-oe layer.
>=20
> For more details refer this long discussion:
> https://lists.openembedded.org/g/openembedded-devel/topic/101679410#10528=
4
>=20
> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> ---
>  meta/classes-global/staging.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/classes-global/staging.bbclass b/meta/classes-global/st=
aging.bbclass
> index d229f40107..72c811d609 100644
> --- a/meta/classes-global/staging.bbclass
> +++ b/meta/classes-global/staging.bbclass
> @@ -26,6 +26,7 @@ SYSROOT_DIRS_NATIVE =3D " \
>      ${localstatedir} \
>  "
>  SYSROOT_DIRS:append:class-native =3D " ${SYSROOT_DIRS_NATIVE}"
> +SYSROOT_DIRS:append:class-nativesdk =3D " ${SYSROOT_DIRS_NATIVE}"
>  SYSROOT_DIRS:append:class-cross =3D " ${SYSROOT_DIRS_NATIVE}"
>  SYSROOT_DIRS:append:class-crosssdk =3D " ${SYSROOT_DIRS_NATIVE}"
> =20

This has disk space performance implications. We don't want to to this
just because there is one "bad" recipe out there. I think we should be
working around the issue in that recipe, or changing cmake not to have
the issue. Adding a load of pointless binaries to the sysroot for all
recipes is not a good solution for us.

Cheers,

Richard

