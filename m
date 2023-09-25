Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 745CBCE7A81
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 04:38:18 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web10.54490.1695616694727847011
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Sep 2023 21:38:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c3M4x5ZW;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1dcbd8a56d6so2595908fac.1
        for <openembedded-core@lists.openembedded.org>; Sun, 24 Sep 2023 21:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695616694; x=1696221494; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IchC4OS7IAL/1xeFty1U4J1xgxoSUiHaudNtFW5Pddo=;
        b=c3M4x5ZW/XinzjsNdUmp5xD2gvK/oGvTwu+O2QUSFuMi1fiOK2RoIBDsKyFcx3mclr
         ZvPEprPFB01bB6n8STrC/K8lScYLH1bX8iHFfNONUUJnwYr7YGjZTq6vNbFUPpff3L3w
         HEdSjm/RIJGXjIE0N5rp0a/xg8HmhYrpbDGX45XAI9So5KFT7uTvJpUfOmVEtYne8tdp
         6xYF1ROGJ+wPxqFE/t/BUJCAOQbf8uGGNbcLXgvO7c+joOEhhmo2/uGGXfdY4tx3TQ8H
         XYAyI2hVGt6aqC7egdJYI9goj/wRGT6d77UI6ZPi4chNs+8fxyrb2sHx/Nbb+BdxLW/U
         /i7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695616694; x=1696221494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IchC4OS7IAL/1xeFty1U4J1xgxoSUiHaudNtFW5Pddo=;
        b=maxFyBDp4IZb9gPiLpzMTgXh6VLLgEivJos8qgXMjA0d/pHcIniroNe0RgiNQlYE5i
         eupFUT7YUbySVW1+kTkfOkuolVpefQ04CZG/kGqhxEa2W2CkvMeOvGDO5qH6iTqEOWdX
         TAo2ch3KF7ot1muvFAWkO7zJDO9gALKJ4mBvwldVc8hg7GriuC/579s6ldvOTelXnhFO
         qrL81HI2mDdn1JVO9XSY70v5A4FcePyKSqB9WYjznLqKDLkE/zKi3D2DrvAaQm8Hwlyh
         0JeWO/n8kpm0N8fk26v2l2RXoOObbm6Zj0v340LS8S59GTFHC3FcEjFXwiEcdC8SYNUx
         Vwww==
X-Gm-Message-State: AOJu0YwlyoX+r+GNdKUj9aMieH22mc3jGFPy/hVH8xaWMf3fQevwmCOL
	d5X7rAXC3Bt5hZ1EkRx+Nizl+ChQ1kORIWpAXC8=
X-Google-Smtp-Source: AGHT+IHBH9iYdUXhVpxieryNTzuD/rv9gulNsssNeU98PDJwkNqYPACMrLJJQGQuAA/OKRitN8k/hWqh8RZrGM65Q9Q=
X-Received: by 2002:a05:6870:944f:b0:1b0:649f:e68a with SMTP id
 e15-20020a056870944f00b001b0649fe68amr8085712oal.25.1695616693758; Sun, 24
 Sep 2023 21:38:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230922072431.1481743-1-alex@linutronix.de> <20230922072431.1481743-9-alex@linutronix.de>
In-Reply-To: <20230922072431.1481743-9-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 24 Sep 2023 21:37:47 -0700
Message-ID: <CAMKF1spr5ROE6VqghUWDJk4fYFmcm8cDqhUFBpN_Uk1BJJUboA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 09/40] boost: upgrade 1.82.0 -> 1.83.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 04:38:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188168

This fails cpp-netlib in meta-oe -
https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3169/step=
s/14/logs/stdio

On Fri, Sep 22, 2023 at 12:24=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  .../boost/{boost-1.82.0.inc =3D> boost-1.83.0.inc}                | 2 +-
>  ...oost-build-native_1.82.0.bb =3D> boost-build-native_1.83.0.bb} | 2 +-
>  meta/recipes-support/boost/{boost_1.82.0.bb =3D> boost_1.83.0.bb} | 0
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-support/boost/{boost-1.82.0.inc =3D> boost-1.83.0.in=
c} (90%)
>  rename meta/recipes-support/boost/{boost-build-native_1.82.0.bb =3D> boo=
st-build-native_1.83.0.bb} (92%)
>  rename meta/recipes-support/boost/{boost_1.82.0.bb =3D> boost_1.83.0.bb}=
 (100%)
>
> diff --git a/meta/recipes-support/boost/boost-1.82.0.inc b/meta/recipes-s=
upport/boost/boost-1.83.0.inc
> similarity index 90%
> rename from meta/recipes-support/boost/boost-1.82.0.inc
> rename to meta/recipes-support/boost/boost-1.83.0.inc
> index 39d3c9ce5da..da275f18c1f 100644
> --- a/meta/recipes-support/boost/boost-1.82.0.inc
> +++ b/meta/recipes-support/boost/boost-1.83.0.inc
> @@ -12,7 +12,7 @@ BOOST_MAJ =3D "${@"_".join(d.getVar("PV").split(".")[0:=
2])}"
>  BOOST_P =3D "boost_${BOOST_VER}"
>
>  SRC_URI =3D "https://boostorg.jfrog.io/artifactory/main/release/${PV}/so=
urce/${BOOST_P}.tar.bz2"
> -SRC_URI[sha256sum] =3D "a6e1ab9b0860e6a2881dd7b21fe9f737a095e5f33a3a874a=
fc6a345228597ee6"
> +SRC_URI[sha256sum] =3D "6478edfe2f3305127cffe8caf73ea0176c53769f4bf1585b=
e237eb30798c3b8e"
>
>  UPSTREAM_CHECK_URI =3D "http://www.boost.org/users/download/"
>  UPSTREAM_CHECK_REGEX =3D "release/(?P<pver>.*)/source/"
> diff --git a/meta/recipes-support/boost/boost-build-native_1.82.0.bb b/me=
ta/recipes-support/boost/boost-build-native_1.83.0.bb
> similarity index 92%
> rename from meta/recipes-support/boost/boost-build-native_1.82.0.bb
> rename to meta/recipes-support/boost/boost-build-native_1.83.0.bb
> index dcfb65e3d6e..a345bac4999 100644
> --- a/meta/recipes-support/boost/boost-build-native_1.82.0.bb
> +++ b/meta/recipes-support/boost/boost-build-native_1.83.0.bb
> @@ -7,7 +7,7 @@ LICENSE =3D "BSL-1.0"
>  LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3De4224ccaecb14d942c71d31be=
f20d78c"
>
>  SRC_URI =3D "git://github.com/boostorg/build;protocol=3Dhttps;branch=3Dm=
aster"
> -SRCREV =3D "9f488e003a568dffe0caed05d86ed6f1a8f8c7f3"
> +SRCREV =3D "8d86b9a85407d73d6e8c631771f18c2a237d2d71"
>  PE =3D "1"
>
>  UPSTREAM_CHECK_GITTAGREGEX =3D "boost-(?P<pver>(\d+(\.\d+)+))"
> diff --git a/meta/recipes-support/boost/boost_1.82.0.bb b/meta/recipes-su=
pport/boost/boost_1.83.0.bb
> similarity index 100%
> rename from meta/recipes-support/boost/boost_1.82.0.bb
> rename to meta/recipes-support/boost/boost_1.83.0.bb
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188053): https://lists.openembedded.org/g/openembedde=
d-core/message/188053
> Mute This Topic: https://lists.openembedded.org/mt/101516856/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

