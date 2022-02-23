Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B85B5C433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 16:01:51 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.9625.1645632110897312270
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 08:01:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NTKCErRN;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id j5so9101350qvs.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 08:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dG5g+ZYR1AaJmRI2g57jVdXVWLz5Jyk468izg0daVDM=;
        b=NTKCErRNXbqEYvauo0hpTA1MCh0OHbYVyHVKHBf9udwWJt36272S6Gm1S0DWjXZ9Re
         WADN8dGFQkkDH88DVnhx9OTcoW4s5It2D93T5U5ovTNT5G5D46HdiV9jrJ7X3rkVQkD0
         ZWUL+UxfBFuWu6N4WaX67P3pBahFXMlNIp5cbkVFj25Kv5nlxrZ+1+LKDA3twExwKPx/
         Q4uGpn5ZWiDS0xEHlafZTeLpp5WRMXTB7/JEAGCaXJjLaZtEb0HYeTf9ewCu6neF8FSo
         TTkgD07de7EZS4nY8x0GBk31c+9rh+xnyg4a2BWeBsiw//nLbCPSmhbFJQoO1LJfvxau
         zDvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dG5g+ZYR1AaJmRI2g57jVdXVWLz5Jyk468izg0daVDM=;
        b=BWS/QhcmCRdpmsvUaa+6KEw/bwb3Wo8OGzle2vSd1x2Bq0UPuSk6Bc3iPu4TN+15HN
         hvhCXL/e6o+rozJ/eDOL9rSWXXrRhkPRLk2bLX1gFZofrAAR7Dq1qybfA2V/QqvW1suj
         1svXmNxLvXyHTTqBOoKOECO1D+/sZx0/MnwVORnr0HAEb3gdu322BQtXDpwD51L/o5N+
         0y3AGhzpO+H2UWZpUYfiPPCuDY9RMOv94eeOOBUR1vF+z6TTxJ8PrusZAu5YOManblIE
         UoSWyJlyWnkzbx+5uVrCyN0p0tKFKgsyMfLi7CeKdkvq5HreqA/AL6OonF4NEIaagJ1P
         x5bg==
X-Gm-Message-State: AOAM533M2r+o+w8B9VHv6xa3lScSkwhhh+IPUhV2QgD1S+Vku0P2w8Lz
	CkRw5z7X+tEo1jxgvofuEGxf4I0YxXb+Hu8D7xw=
X-Google-Smtp-Source: 
 ABdhPJx8ejuTUfgawcdjhGZtB38Zn5gxklCOqZflvkjH4/ZvdtWEhoof2Lmpl0S2WIZfYNzLF/zUji5StZW/YvYn8+E=
X-Received: by 2002:ac8:5742:0:b0:2cb:96f2:a4da with SMTP id
 2-20020ac85742000000b002cb96f2a4damr358375qtx.634.1645632109863; Wed, 23 Feb
 2022 08:01:49 -0800 (PST)
MIME-Version: 1.0
References: <cover.1645478020.git.tim.orling@konsulko.com>
 <2c82b18cfcc34dce08fa4600baa2bbdc046a0350.1645478020.git.tim.orling@konsulko.com>
In-Reply-To: 
 <2c82b18cfcc34dce08fa4600baa2bbdc046a0350.1645478020.git.tim.orling@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Feb 2022 08:01:23 -0800
Message-ID: 
 <CAMKF1spqY_0TrwW7ojxZ2CX2x7CebZLbuceYDNbgt9rPFfEpGQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 01/32] python3-wheel: move 0.37.0 from
 meta-python
To: Tim Orling <ticotimo@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Feb 2022 16:01:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162268

this series is breaking things quite a bit in rest of world.

https://errors.yoctoproject.org/Errors/Build/141298/

On Mon, Feb 21, 2022 at 1:24 PM Tim Orling <ticotimo@gmail.com> wrote:
>
> This is one of the "new build tools" which are part of pypa (Python
> Packaging Authority) toolchain.
>
> Wheels are the official delivery mechanism for Python packages, replacing
> the now deprecated Eggs (egg-info).
>
> [YOCTO #14638]
>
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
>  meta/conf/distro/include/maintainers.inc             |  1 +
>  meta/recipes-devtools/python/python3-wheel_0.37.1.bb | 12 ++++++++++++
>  2 files changed, 13 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-wheel_0.37.1.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index 740e5fe55c4..72cd0125814 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -651,6 +651,7 @@ RECIPE_MAINTAINER:pn-python3-typogrify = "Alexander Kanavin <alex.kanavin@gmail.
>  RECIPE_MAINTAINER:pn-python3-vcversioner = "Bruce Ashfield <bruce.ashfield@gmail.com>"
>  RECIPE_MAINTAINER:pn-python3-wcwidth = "Tim Orling <tim.orling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-python3-webcolors = "Bruce Ashfield <bruce.ashfield@gmail.com>"
> +RECIPE_MAINTAINER:pn-python3-wheel = "Tim Orling <tim.orling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-python3-zipp = "Tim Orling <tim.orling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-qemu = "Richard Purdie <richard.purdie@linuxfoundation.org>"
>  RECIPE_MAINTAINER:pn-qemu-helper-native = "Richard Purdie <richard.purdie@linuxfoundation.org>"
> diff --git a/meta/recipes-devtools/python/python3-wheel_0.37.1.bb b/meta/recipes-devtools/python/python3-wheel_0.37.1.bb
> new file mode 100644
> index 00000000000..6c7a31db9e7
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-wheel_0.37.1.bb
> @@ -0,0 +1,12 @@
> +SUMMARY = "The official binary distribution format for Python "
> +HOMEPAGE = "https://github.com/pypa/wheel"
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=10;endline=10;md5=8227180126797a0148f94f483f3e1489"
> +
> +SRC_URI[sha256sum] = "e9a504e793efbca1b8e0e9cb979a249cf4a0a7b5b8c9e8b65a5e39d49529c1c4"
> +
> +inherit pypi setuptools3
> +
> +BBCLASSEXTEND = "native"
> +
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162077): https://lists.openembedded.org/g/openembedded-core/message/162077
> Mute This Topic: https://lists.openembedded.org/mt/89304009/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

