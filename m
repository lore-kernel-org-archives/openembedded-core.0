Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23F93C6FA8B
	for <webhook@archiver.kernel.org>; Wed, 21 Sep 2022 09:08:11 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web09.4280.1663751288372193195
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Sep 2022 02:08:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aEDAN/ZU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id
 h130-20020a1c2188000000b003b4cadadce7so7332166wmh.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Sep 2022 02:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date;
        bh=YTEeGioWgpNNGeMw1VCSpMUnqmX0CkW9+gm0g3TV/jM=;
        b=aEDAN/ZUKkkCNNUR2psX6FPlzltQf4pi8LVatUgbOseLwU73xYDfQbqIQogQeGSQJu
         jSdyrcNrBqgXYkXgkfCyMJImNS7VzmapvG/po0SjnSC3JQtf0gtWTXfalF6LR44276iM
         ijIlEvmQBVywlhUSmCu9RsmSCwlt2o+re+sas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=YTEeGioWgpNNGeMw1VCSpMUnqmX0CkW9+gm0g3TV/jM=;
        b=M5YT8VlK272HJYLzvmvuqHC+mX7ADmB4MCdvi7KEx96A+PzxvUpwNRyeSFoSVtJA6Z
         3Cx9eaVGXx4RxrcAQVLe3ldjaaSGp6cXSqBMRXi8sFDor0YamPdnCLQb2YSYoVdXkTVv
         a8tLpMnReJopTpPxlYr3vEhsjPmp9NN5wBhRR33Ip8AM3CC6wSuXXYi1vxfVdizbwRec
         VCHxF2cH4PR+rSoTXnEyH40QurI/PpxPv/m0wvgwIphvPaMpnYigCyexh4o9tItIC9YK
         pydyrdBRbIEs+KiT3+7DHw6qjWTWWm5zdYmxxzAazml2NyqYCDibDaWngS/J16CFqJ1u
         pOlw==
X-Gm-Message-State: ACrzQf3Wqszqhb8wxErHt7cW4lWSkM0BPQWfw2wQLZAVwejVbq65zVrX
	ceViPZITFFertBQ1Q0t2PwngIg==
X-Google-Smtp-Source: 
 AMsMyM5Tn6g201qLC3pIEmSVH2X4hLJk1dmmQZBmPIsNX+e0XMeft7sN4GeUnvPNgJatos3zSn5Llw==
X-Received: by 2002:a05:600c:21c3:b0:3b4:7e47:e3a with SMTP id
 x3-20020a05600c21c300b003b47e470e3amr5036197wmj.167.1663751286519;
        Wed, 21 Sep 2022 02:08:06 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b663:b06:b4c5:e314?
 ([2001:8b0:aba:5f3c:b663:b06:b4c5:e314])
        by smtp.gmail.com with ESMTPSA id
 bn27-20020a056000061b00b0022762b0e2a2sm2214609wrb.6.2022.09.21.02.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 02:08:05 -0700 (PDT)
Message-ID: 
 <51cc35c11610c638c75efc6de20845f3e497c8dc.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] mesa: only apply patch to fix
 ALWAYS_INLINE for native
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: kai <kai.kang@windriver.com>, raj.khem@gmail.com
Cc: martin.jansa@gmail.com, openembedded-core@lists.openembedded.org
Date: Wed, 21 Sep 2022 10:08:04 +0100
In-Reply-To: <20220921080357.8493-1-kai.kang@windriver.com>
References: <20220921080357.8493-1-kai.kang@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Sep 2022 09:08:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170943

On Wed, 2022-09-21 at 16:03 +0800, kai wrote:
> From: Kai Kang <kai.kang@windriver.com>
>=20
> 0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch is not
> required by target mesa any more. But it still fails to compile
> mesa-native with DEBUG_BUILD enabled on Ubuntu 18.04 with gcc 7.5.0
> without this patch:
>=20
> > ../mesa-22.1.6/src/compiler/nir/nir_inline_helpers.h: In function =E2=
=80=98nir_opt_move_block=E2=80=99:
> > ../mesa-22.1.6/src/compiler/nir/nir_opt_move.c:55:1: error: inlining fa=
iled in call to
>     always_inline =E2=80=98src_is_ssa=E2=80=99: indirect function call wi=
th a yet undetermined callee
> >  src_is_ssa(nir_src *src, void *state)
> >  ^~~~~~~~~~
>=20
> So only apply it for mesa-native.
>=20
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
> v2:
> * add comment
>=20
>  meta/recipes-graphics/mesa/mesa.inc | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
> index ea7ed4fd27..913aec987d 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -22,9 +22,11 @@ SRC_URI =3D "https://mesa.freedesktop.org/archive/mesa=
-${PV}.tar.xz \
>             file://0001-util-format-Check-for-NEON-before-using-it.patch =
\
>             file://0001-Revert-egl-wayland-deprecate-drm_handle_format-an=
d-d.patch \
>             file://0001-swrast_kms-use-swkmsDRI2Extension-instead-of-driD=
RI2.patch \
> -           file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error=
.patch \
>             "
> =20
> +# required by mesa-native on Ubuntu 18.04 with gcc 7.5 when DEBUG_BUILD =
enabled
> +SRC_URI:append:class-native =3D " file://0001-nir-nir_opt_move-fix-ALWAY=
S_INLINE-compiler-error.patch"
> +
>  SRC_URI[sha256sum] =3D "22ced061eb9adab8ea35368246c1995c09723f3f71653cd5=
050c5cec376e671a"
> =20
>  UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)"

This still generates warnings for musl builds, e.g.:

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/5882/step=
s/11/logs/warnings

Cheers,

Richard


