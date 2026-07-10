Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 798BBC43458
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 10:02:28 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9380.1783677738676204591
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 03:02:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=PdJqV77q;
 spf=pass (domain: smile.fr, ip: 209.85.218.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c15cb6f5c12so134282566b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 03:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783677737; x=1784282537; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TYOp7Tk9pj/okOEXvvuIT4uWBAmQrPyjkTpKYeBkNAI=;
        b=PdJqV77qMrs7dNQp/Ep9Uyt74fIqYlWD98vXJHA6pcnHIWEsvnfV2FDcbO9inJyoF1
         aXVrfkJrhCnmK+WNEgp94jvA3urvEo/Xp1nVtTMAnyqGzbhs/8NIhx3UgFLPMyNH6n7m
         FZyjcCb/gJRkIPtcGAo3b94Ocx8n/tRpTKlB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783677737; x=1784282537;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TYOp7Tk9pj/okOEXvvuIT4uWBAmQrPyjkTpKYeBkNAI=;
        b=ToZwwMZQkjdRLGkF5Y2mFoZfHK51DM0TeYwOf3kke+aVEgoRNmN4mJhOTCc2/KmFEP
         tpYRWlogCy103lcgWZV1jmTJZ/ZvxAai3GKkpCgvf1SDGFX+EQ4jy4nK9x++B6CXMEWu
         Cyu/c1c+BNuFek9/hxsGuijARcMgHqr+TY3hVlE2kUuH3jMH4GuNiuuWsaOXi8gkk+Y5
         QrHeadloiSRMtfv7hl7npm8iXTTqb8l24suwzggipQ+NUAeod3KNhtbHK1yrLOjBy2FZ
         tlD4uupc2rAZ/pxB/2C7RlOmH0Ay+tfEHlPgCmxU1MRg+3SX+u/bmejEj/txdBI4sxan
         f3yg==
X-Forwarded-Encrypted: i=1; AHgh+RqRf4xjrlYfQbahzKfYUti3T905AUE2KcHT3QhjmyH5YtwcPnhqnD4LDx1iKTs1eBfa3xgZQn7ioa7ws/aLbJlXcA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyvThkIM/9lpti0qoyMywb/5owWN7P4DPOQKQRKps2GLEw7trRn
	qEcwUSR6kuHNH+6fQQvjJHv7MUoQZA1Q+dmmfhj7EcchBKCz1CuVKjWfaBMYxUdUEi9TcCKZpZ7
	1QLG7NlM=
X-Gm-Gg: AfdE7cmw+jXWGFCGcp4o1sa6X6ERfAH4H4booDwkxStvty4mHaWdCT4qpka6vZAp6hJ
	giCanK0q/Z+zKVeAXaOn3WNixiwt9OPecQa8ILY5AHSlrzSTpxqC5x7ezL7fl0bUNnBIFjOzX4/
	PB1tflnCIXj1Ff58NvGk3Tb5vTlQXA2Jw57sZM965SY5WT9gqFrCyYzvel624HGaoO7Dj57Lhx1
	4b7K+26z7s0zcQBjzYBno02kiGY7QUwnRA4t8AS0rjjCigGI6nMbxbo+s1CC5MIqme+1PetzMDI
	rtadC/SFK6cTRSxq0AQ1xYsW4IJPz+bS9PZLhgQZzl2C8gKSWTaKzcusnAzHcZZZlVRC8yyWRXz
	QnM2CjmHNzkwGlmK7qYl6xrJWer21hJ0WfoY9+eLj1xX0ST2g7pOj1et8q8JHA0SAe0MgpcKTOW
	OU7oxbq5yZNXeA2B543ZfdjxspfRi/2iYfhJvLMKAQHdfLCcn0o8shELELk48wQ8oNlWWbX5Yie
	nQ3vA==
X-Received: by 2002:a17:906:ee8c:b0:c12:7b74:7812 with SMTP id a640c23a62f3a-c15ce108461mr470977066b.59.1783677736665;
        Fri, 10 Jul 2026 03:02:16 -0700 (PDT)
Received: from localhost (2a01cb001331aa005f82d0ccbe50ecf8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:5f82:d0cc:be50:ecf8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15deea5cf6sm279189466b.16.2026.07.10.03.02.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 03:02:16 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Jul 2026 12:02:15 +0200
Message-Id: <DJUSZJTUMA4P.2YSMPEY5JDSXH@smile.fr>
To: <pidge@baylibre.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] ovmf: fix tpm PACKAGECONFIG to use
 TPM2_ENABLE
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260708142249.916053-1-pidge@baylibre.com>
In-Reply-To: <20260708142249.916053-1-pidge@baylibre.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 10:02:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240627

On Wed Jul 8, 2026 at 4:22 PM CEST, Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=C3=
=A1in via lists.openembedded.org wrote:
> The tpm PACKAGECONFIG passed "-D TPM_ENABLE=3DTRUE/FALSE", but ovmf
> renamed that macro to TPM2_ENABLE in edk2 commit 4de8d61bcec0
> ("OvmfPkg: rework TPM configuration", first released in
> edk2-stable202202). Since then TPM_ENABLE has been an unknown macro
> that edk2 ignores, so TPM2 support was never compiled in, even for
> MACHINEs with 'tpm'/'tpm2' in MACHINE_FEATURES.

Hello,

By looking at the version only, should'nt this be backported to
scarthgap as well? It has ovmf edk2-stable202402.

Thanks!

>
> Use TPM2_ENABLE (as defined in
> OvmfPkg/Include/Dsc/OvmfTpmDefines.dsc.inc and consumed by
> OvmfPkgX64.dsc) so the tpm PACKAGECONFIG actually enables TPM2 support.
>
> The same commit also added a separate TPM1_ENABLE macro (TPM 1.2
> support, default TRUE), but its dsc.inc snippets are only included
> inside OvmfPkgX64.dsc's "!if $(TPM2_ENABLE) =3D=3D TRUE" block, so it has
> no effect unless TPM2_ENABLE is TRUE. No separate PACKAGECONFIG knob is
> needed.
>
> I'm sending a backport to wrynose of this in another email.
>
> Signed-off-by: Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=C3=A1in <pidge@baylibr=
e.com>
> ---
>  meta/recipes-core/ovmf/ovmf_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/=
ovmf_git.bb
> index bda33e2631..ab276bad1f 100644
> --- a/meta/recipes-core/ovmf/ovmf_git.bb
> +++ b/meta/recipes-core/ovmf/ovmf_git.bb
> @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D "file://OvmfPkg/License.txt;md5=3D=
06357ddc23f46577c2aeaeaf7b776
>  PACKAGECONFIG ??=3D "${@bb.utils.contains_any('MACHINE_FEATURES', 'tpm t=
pm2', 'tpm', '', d)}"
>  PACKAGECONFIG[debug] =3D ",,,"
>  PACKAGECONFIG[secureboot] =3D ",,,"
> -PACKAGECONFIG[tpm] =3D "-D TPM_ENABLE=3DTRUE,-D TPM_ENABLE=3DFALSE,,"
> +PACKAGECONFIG[tpm] =3D "-D TPM2_ENABLE=3DTRUE,-D TPM2_ENABLE=3DFALSE,,"
> =20
>  SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branch=3Dmaster;proto=
col=3Dhttps;tag=3D${PV} \
>             file://0001-ovmf-update-path-to-native-BaseTools.patch \


--=20
Yoann Congal
Smile ECS


