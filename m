Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8BAFC7EE25
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 02:12:15 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web10.4362.1686276727065305288
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jun 2023 19:12:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=g6jbRTgu;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-19f8af9aa34so288569fac.1
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 19:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686276726; x=1688868726;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nW1IpTHCL4fxCvbpb2uYiHhVjiRgrCcr2c66WBm8yDs=;
        b=g6jbRTgu4DRE07Wz9H5+mxk8cmQMR5EXzQupobIyRW1m439QUJ5mDCsVb+ayEyt6eQ
         btLhTs0mgxMLqfQpTgQNs08mA9q6uHkSsQctuCV4nQ27XLrzdQFV/T0vKLNlzA7gzDJk
         Ww2miM1OnPaA+PPtiCgTcdeD0msNX7shYG5H9cWZBBmuhLdCLzjCp/cnJQY4cKpg+H8L
         qfOhtAbYeYvpn4OVP8MEqe/Ze7O9Nf497jY2d5As3/welaGwqCnEfZVtZqejwAHmVxlk
         4JpuZLUpR0miUDIWEgN3WRC+KAc0OIDbU81+x7/OHt5TfwE327JjYa52ZQ7OXyNuJxu4
         9REw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686276726; x=1688868726;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nW1IpTHCL4fxCvbpb2uYiHhVjiRgrCcr2c66WBm8yDs=;
        b=IjxtxEjw02N8Mo9izzCXW4Bw0io3n50bxDQfGUVCpQ0MWvM/EhYxWv3aicVOV1suqG
         qqe8AyEEguOSpkUGkZMTOwiaxCmDFpCzEG+wQlKg1D8AEby6boGlfhkhLlumf8ylROG5
         VktVjCg6eGZusQluOSeN+rgm/cEDZXClRJ8mAV+cnfsa6NnftCKzXhLM0KK1gaXwv7XZ
         VObNX9fyCn8Xy4Lp4WMoIVC5LGqqkMfm+1bp7D+KjrJfxLVRzeIBVuXSii7Iabx20l6j
         cBWuYiGHIox78tGGVeYCpZGZz9dWGJgoW+BlLRkLJGswmm7TRjo9G9oE6wVuQVGd7F2a
         zGdA==
X-Gm-Message-State: AC+VfDw05YRU9OKMV/uzElbkZQOGx6np9rKodvZ2V4Z/M1knTSwDt/iS
	0Ec60EbJECJWsvBDo3sIOy7SaS8ED6vr+VXsFc0=
X-Google-Smtp-Source: ACHHUZ5RNjBUu7RSJdLv+Lx6sLdc9uWuXP79Z6MqLd5S/uxQvVlvtbopW21fITOm0D+IYHyKF7KYTzsWEQCW7IC9Au8=
X-Received: by 2002:a05:6870:8542:b0:19f:9579:379d with SMTP id
 w2-20020a056870854200b0019f9579379dmr197619oaj.18.1686276726133; Thu, 08 Jun
 2023 19:12:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230606151335.6019-1-vince@underview.tech> <20230606151335.6019-2-vince@underview.tech>
In-Reply-To: <20230606151335.6019-2-vince@underview.tech>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 8 Jun 2023 19:11:40 -0700
Message-ID: <CAMKF1sppV_=AW3+jrHw322B=7upV9ZQmqa__Q54a0akhnp0qaQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 2/2] vulkan-validation-layers: add new recipe v1.3.243.0
To: Vincent Davis Jr <vince@underview.tech>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 02:12:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182525

I am seeing build failure on imx8 platform using clang.

https://errors.yoctoproject.org/Errors/Details/707981/

On Tue, Jun 6, 2023 at 8:14=E2=80=AFAM Vincent Davis Jr <vince@underview.te=
ch> wrote:
>
> Add a recipe to build the Khronos official Vulkan validation
> layers that can assist developers in verifying that their
> applications correctly use the Vulkan APIs.
>
> Signed-off-by: Vincent Davis Jr <vince@underview.tech>
> ---
>  meta/conf/distro/include/maintainers.inc      |  1 +
>  .../vulkan-validation-layers_1.3.243.0.bb     | 51 +++++++++++++++++++
>  2 files changed, 52 insertions(+)
>  create mode 100644 meta/recipes-graphics/vulkan/vulkan-validation-layers=
_1.3.243.0.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
> index 0f7b7287bb..b06ae43dac 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -827,6 +827,7 @@ RECIPE_MAINTAINER:pn-vulkan-headers =3D "Anuj Mittal =
<anuj.mittal@intel.com>"
>  RECIPE_MAINTAINER:pn-vulkan-loader =3D "Anuj Mittal <anuj.mittal@intel.c=
om>"
>  RECIPE_MAINTAINER:pn-vulkan-samples =3D "Ross Burton <ross.burton@arm.co=
m>"
>  RECIPE_MAINTAINER:pn-vulkan-tools =3D "Anuj Mittal <anuj.mittal@intel.co=
m>"
> +RECIPE_MAINTAINER:pn-vulkan-validation-layers =3D "Vincent Davis Jr <vin=
ce@underview.tech>"
>  RECIPE_MAINTAINER:pn-waffle =3D "Ross Burton <ross.burton@arm.com>"
>  RECIPE_MAINTAINER:pn-watchdog =3D "Alexander Kanavin <alex.kanavin@gmail=
.com>"
>  RECIPE_MAINTAINER:pn-watchdog-config =3D "Alexander Kanavin <alex.kanavi=
n@gmail.com>"
> diff --git a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.24=
3.0.bb b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.243.0.bb
> new file mode 100644
> index 0000000000..6e1ef7a05d
> --- /dev/null
> +++ b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.243.0.bb
> @@ -0,0 +1,51 @@
> +SUMMARY =3D "Vulkan Validation layers"
> +DESCRIPTION =3D "Khronos official Vulkan validation layers to assist dev=
elopers \
> +in verifying that their applications correctly use the Vulkan API"
> +HOMEPAGE =3D "https://www.khronos.org/vulkan/"
> +BUGTRACKER =3D "https://github.com/KhronosGroup/Vulkan-ValidationLayers"
> +SECTION =3D "libs"
> +
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D8df9e8826734226d08cb412ba=
bfa599c"
> +
> +SRC_URI =3D "git://git@github.com/KhronosGroup/Vulkan-ValidationLayers.g=
it;branch=3Dsdk-1.3.243;protocol=3Dhttps"
> +SRCREV =3D "4ac0fd8e6cb3d49105d707d9ec07f0f3aa0943d6"
> +
> +S =3D "${WORKDIR}/git"
> +
> +REQUIRED_DISTRO_FEATURES =3D "vulkan"
> +
> +DEPENDS =3D "vulkan-headers vulkan-loader spirv-headers spirv-tools glsl=
ang"
> +
> +# BUILD_TESTS            - Not required for OE builds
> +# USE_ROBIN_HOOD_HASHING - Provides substantial performance improvements=
 on all platforms.
> +#                          Yocto project doesn't contain a recipe for pa=
ckage so disabled it.
> +EXTRA_OECMAKE =3D "\
> +    -DBUILD_TESTS=3DOFF \
> +    -DUSE_ROBIN_HOOD_HASHING=3DOFF \
> +    -DGLSLANG_INSTALL_DIR=3D${STAGING_DATADIR} \
> +    -DVULKAN_HEADERS_INSTALL_DIR=3D${STAGING_EXECPREFIXDIR} \
> +    -DSPIRV_HEADERS_INSTALL_DIR=3D${STAGING_EXECPREFIXDIR} \
> +    "
> +
> +PACKAGECONFIG[x11] =3D "-DBUILD_WSI_XLIB_SUPPORT=3DON -DBUILD_WSI_XCB_SU=
PPORT=3DON, -DBUILD_WSI_XLIB_SUPPORT=3DOFF -DBUILD_WSI_XCB_SUPPORT=3DOFF, l=
ibxcb libx11 libxrandr"
> +PACKAGECONFIG[wayland] =3D "-DBUILD_WSI_WAYLAND_SUPPORT=3DON, -DBUILD_WS=
I_WAYLAND_SUPPORT=3DOFF, wayland"
> +
> +PACKAGECONFIG ?=3D "\
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)} \
> +    "
> +
> +inherit cmake features_check pkgconfig
> +
> +FILES:${PN} +=3D "${datadir}/vulkan ${libdir}"
> +
> +SOLIBS =3D ".so"
> +FILES_SOLIBSDEV =3D ""
> +
> +# These recipes need to be updated in lockstep with each other:
> +# glslang, vulkan-headers, vulkan-loader, vulkan-tools,
> +# vulkan-validation-layers, spirv-headers, spirv-tools
> +# The tags versions should always be sdk-x.y.z, as this is what
> +# upstream considers a release.
> +UPSTREAM_CHECK_GITTAGREGEX =3D "sdk-(?P<pver>\d+(\.\d+)+)"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182446): https://lists.openembedded.org/g/openembedde=
d-core/message/182446
> Mute This Topic: https://lists.openembedded.org/mt/99365321/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

