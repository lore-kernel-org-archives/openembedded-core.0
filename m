Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 699CEC32771
	for <webhook@archiver.kernel.org>; Wed, 21 Sep 2022 13:37:02 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.6501.1663767420363982179
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Sep 2022 06:37:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Nn3oPP0j;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id n10so9870386wrw.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Sep 2022 06:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date;
        bh=yoOYGpHCJvpcbzMgvrUxPw833igBMCu/pMRzD7MEhE8=;
        b=Nn3oPP0jQXtJsorM1Be/e+elk+SxablE19gOXRGSbKVXXvs4glbmsduMfEISub/6Jf
         Mu2meUVg+UAe8h6qzkiGBcdgFxFyBtPyXkLcoMygy43sCdBcB3WfIih8nkQY8s/9Rs9O
         t3assNh7aHEp6aWwaV/CaAdPBujvJxdKBoLHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date;
        bh=yoOYGpHCJvpcbzMgvrUxPw833igBMCu/pMRzD7MEhE8=;
        b=wbEQQkESlAAkfM5ZDpgMOkSHVo/iV96pYO+Q4OcQWffHnVzJm3+Tlr+TwO/cxqn6n0
         FSkMBE+oE9qRsXkif5kCVN8WOhroEIjMNs2XmKmOip0AZWtExmUtRYzNT+pIoGdgqxHk
         PxW9Ra1neG4bXxPzhiH0uM+H7C6Of8sWFECJwYjpa4P4Fk+UbdwWRHQ2Y8CZV7yH1Evo
         eKcZ96sJTy836pgf9MPFNot4h7wBjVmzaGp7ZXhHY4EDsMazGRFyFpMFU7l9ip7z/eZu
         YOdsycuW04tNzMSqHGr7xOpqd+RjL7myruwv40O0q2LPosse0FcE5k88kjsGy5nwa+KX
         JPMQ==
X-Gm-Message-State: ACrzQf3rdX53nOUcGTql3A8yZc7w4Hc+hhSFYu+1Ym3JRkWgCnB+XEcw
	3ke69WDvDFsHKy4aw/yzXuZ7Vw==
X-Google-Smtp-Source: 
 AMsMyM6DDLTytyxAwy8ohNI+3RulUevWhWOG9kc4DGolxUSq4QTa9OI27qWVrG0TzdrjYAgyNvfTdA==
X-Received: by 2002:a05:6000:81e:b0:228:a17f:92f0 with SMTP id
 bt30-20020a056000081e00b00228a17f92f0mr17780531wrb.31.1663767418615;
        Wed, 21 Sep 2022 06:36:58 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b663:b06:b4c5:e314?
 ([2001:8b0:aba:5f3c:b663:b06:b4c5:e314])
        by smtp.gmail.com with ESMTPSA id
 c3-20020a5d63c3000000b0021e51c039c5sm2484317wrw.80.2022.09.21.06.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 06:36:57 -0700 (PDT)
Message-ID: 
 <6f4b27f1205eae9c527af9de6755e92ecd55d9b3.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCH] mesa: upgrade 22.1.6 -> 22.2.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Date: Wed, 21 Sep 2022 14:36:55 +0100
In-Reply-To: <20220921064915.186408-1-f_l_k@t-online.de>
References: <20220921064915.186408-1-f_l_k@t-online.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Sep 2022 13:37:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170949

On Wed, 2022-09-21 at 08:49 +0200, Markus Volk wrote:
> - add PACKAGECONFIG to build vulkan beta drivers
> - add PACKAGECONFIG for zink and build it along with vulkan
> - remove TLS-ELF patch and the associated PACKAGECONFIG. It looks like it=
s unneeded
> - remove swrast_kms backport patch
> - remove the patch that reverts the deprecation of drm_handle as it is no=
t applicable. Still needed ?
> - fix patch fuzz warnings
>=20
> License file has been changed, but no change of licenses
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/e6392fcf3d8b8dd7e3a8427=
755d8be2f2332366a
>=20
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...nd-deprecate-drm_handle_format-and-d.patch | 158 ------------------
>  ...fine-__NR_futex-if-it-does-not-exist.patch |  10 +-
>  ...sdetects-64bit-atomics-on-mips-clang.patch |   2 +-
>  ...k-for-all-linux-host_os-combinations.patch |  10 +-
>  ...ove-fix-ALWAYS_INLINE-compiler-error.patch |  20 ++-
>  ...wkmsDRI2Extension-instead-of-driDRI2.patch | 113 -------------
>  ...ormat-Check-for-NEON-before-using-it.patch |   6 +-
>  ...02-meson.build-make-TLS-ELF-optional.patch |  61 -------
>  meta/recipes-graphics/mesa/mesa.inc           |  16 +-
>  .../mesa/{mesa_22.1.6.bb =3D> mesa_22.2.0.bb}   |   0
>  10 files changed, 33 insertions(+), 363 deletions(-)
>  delete mode 100644 meta/recipes-graphics/mesa/files/0001-Revert-egl-wayl=
and-deprecate-drm_handle_format-and-d.patch
>  delete mode 100644 meta/recipes-graphics/mesa/files/0001-swrast_kms-use-=
swkmsDRI2Extension-instead-of-driDRI2.patch
>  delete mode 100644 meta/recipes-graphics/mesa/files/0002-meson.build-mak=
e-TLS-ELF-optional.patch
>  rename meta/recipes-graphics/mesa/{mesa_22.1.6.bb =3D> mesa_22.2.0.bb} (=
100%)

I suspect this needs to change mesa-gl as well:

https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/6197/step=
s/11/logs/stdio

Cheers,

Richard

