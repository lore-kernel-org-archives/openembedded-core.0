Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2B53C54EBE
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 07:51:33 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web11.81090.1673596288417726176
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jan 2023 23:51:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZoloGD+2;
 spf=pass (domain: gmail.com, ip: 209.85.210.47, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f47.google.com with SMTP id x25-20020a056830115900b00670932eff32so11870311otq.3
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Jan 2023 23:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZMHdyAVx+ugg0689ro/d7CiKr/gOo1Er+BJSIf96Xlg=;
        b=ZoloGD+2y20lVrgQhgSQ9bzEpj2nmQcdI6mVC3gbV51ERXx5gYxfVHWlHGx8kpdWwW
         neAMnpetwSl6btQdZBFoxXBIg5LwBdKRkh72dWxFA3PdKHhZ3IMAMmCquJTpI75nEXK3
         ch/mZE8tg981sgg1EKSNAvJIU16UyUSiMaEXzTSD1Jd8M+XGPu6+a6cl/ur2kZVkAwX4
         9FvXSg6I7zIK89R0TZdrDh6dSbBboawPct7B6V0OnpWui9SXvdhg/r1u6zwDNXmvSlKk
         DoU1cKmlH3zehn6jYybNTA5OjGW/08Nn9ltyVgdnAVrtg5Z88K/1eNpnNl5iqu+WyZI3
         +jsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZMHdyAVx+ugg0689ro/d7CiKr/gOo1Er+BJSIf96Xlg=;
        b=FqJMnW4TzqYE448vHfnaAE0OhAlPU+gRwvnPNmbTzKv2ufBHwBDNg1db+Z8VM3AFMn
         l00PmEgvrcGAHHqoR0yXYrpfFhnPAEK7CMLGbWh3nAW8fJLCf+spJftsyetkf0ZfPtIr
         9RWAKyOpcgNth6mMAbfbrlGGIoVzg8Du2uTv2ebImAucHEONVG/Z/knNtI1Rkj5EbS5C
         uaIWOTFnB0lsT0d1Wv70zO2Zjk1JYOfKY410nLw9WUuHWLHbP/NlwWgJr+RirMIufSJG
         9QtRxEvC4xMAXwK9AUZC7IB/eXlwFeT52miN/Z925dlpR5YQy6yG2wNTUK/foV8DvVvb
         jt0Q==
X-Gm-Message-State: AFqh2kr+sg2thPQtZnnWAR3r288sBymugXZKFAcqfSq7U3O6RzyODkLC
	xw8znc/yM6p9K6aRNgzCok+AFoe5HiAwZC0VMzoqkj2fJfaKvg==
X-Google-Smtp-Source: AMrXdXti8j83H6P3LdkiiWzBrQuSXWC1hyHHXO6CFYaZubDFLxsmFxXZ0cTc+Iy0SdwWRUUzqEcO+qao5TUghSMS8YM=
X-Received: by 2002:a9d:1984:0:b0:670:9d62:667f with SMTP id
 k4-20020a9d1984000000b006709d62667fmr4840124otk.111.1673596287565; Thu, 12
 Jan 2023 23:51:27 -0800 (PST)
MIME-Version: 1.0
References: <20230112112336.2254765-1-ross.burton@arm.com> <20230112112336.2254765-4-ross.burton@arm.com>
In-Reply-To: <20230112112336.2254765-4-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 12 Jan 2023 23:51:01 -0800
Message-ID: <CAMKF1soqRFWz4HNgQDLq2BPkaTt-0mb0225ddN_20b22KsTf0g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/4] python3-picobuild: remove
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, nd@arm.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 07:51:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175811

I think meta-python has
meta-python/recipes-devtools/python/python3-pytest-forked_1.4.0.bb
which needs some TLC after this.

There is another failure with opengl-es-cts

| ModuleNotFoundError: No module named 'build.common'

See https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/2348/steps/14/logs/stdio

On Thu, Jan 12, 2023 at 3:23 AM Ross Burton <ross.burton@arm.com> wrote:
>
> We've moved to using python3-build, so this can be removed.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/conf/distro/include/maintainers.inc      |  1 -
>  .../python/python3-picobuild_0.2.bb           | 23 -------------------
>  2 files changed, 24 deletions(-)
>  delete mode 100644 meta/recipes-devtools/python/python3-picobuild_0.2.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index 7254c749c51..fbcb025c954 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -647,7 +647,6 @@ RECIPE_MAINTAINER:pn-python3-packaging = "Tim Orling <tim.orling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-python3-pathlib2 = "Tim Orling <tim.orling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-python3-pathspec = "Ross Burton <ross.burton@arm.com>"
>  RECIPE_MAINTAINER:pn-python3-pbr = "Zang Ruochen <zangrc.fnst@fujitsu.com>"
> -RECIPE_MAINTAINER:pn-python3-picobuild = "Ross Burton <ross.burton@arm.com>"
>  RECIPE_MAINTAINER:pn-python3-pip = "Zang Ruochen <zangrc.fnst@fujitsu.com>"
>  RECIPE_MAINTAINER:pn-python3-pluggy = "Tim Orling <tim.orling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-python3-ply = "Tim Orling <tim.orling@konsulko.com>"
> diff --git a/meta/recipes-devtools/python/python3-picobuild_0.2.bb b/meta/recipes-devtools/python/python3-picobuild_0.2.bb
> deleted file mode 100644
> index 99e4cb87618..00000000000
> --- a/meta/recipes-devtools/python/python3-picobuild_0.2.bb
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -SUMMARY = "Library and tool for installing Python wheels"
> -HOMEPAGE = "https://gitlab.com/rossburton/picobuild"
> -LICENSE = "MIT & ( Apache-2.0 | BSD-2-Clause)"
> -
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=6c811a9fbdf5641ff0b0d43fbbb440e5 \
> -                    file://picobuild/vendored/packaging/LICENSE.APACHE;md5=2ee41112a44fe7014dce33e26468ba93 \
> -                    file://picobuild/vendored/packaging/LICENSE.BSD;md5=7bef9bf4a8e4263634d0597e7ba100b8 \
> -                    file://picobuild/vendored/pep517/LICENSE;md5=aad69c93f605003e3342b174d9b0708c \
> -                    file://picobuild/vendored/pyparsing/LICENSE;md5=657a566233888513e1f07ba13e2f47f1 \
> -                    file://picobuild/vendored/tomli/LICENSE;md5=aaaaf0879d17df0110d1aa8c8c9f46f5 \
> -                    "
> -
> -SRC_URI = "git://gitlab.com/rossburton/picobuild.git;protocol=https;branch=main"
> -SRCREV = "ed3b16ce48d91df181e5f5d77b9bbc2577b3fd9d"
> -PV .= "+git${SRCPV}"
> -
> -S = "${WORKDIR}/git"
> -
> -inherit python_flit_core
> -
> -DEPENDS:remove:class-native = "python3-picobuild-native"
> -
> -BBCLASSEXTEND = "native nativesdk"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175794): https://lists.openembedded.org/g/openembedded-core/message/175794
> Mute This Topic: https://lists.openembedded.org/mt/96220394/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

