Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61EF1C05027
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 17:44:34 +0000 (UTC)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
 by mx.groups.io with SMTP id smtpd.web11.312.1676051064462486682
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Feb 2023 09:44:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZtMVqY4r;
 spf=pass (domain: gmail.com, ip: 209.85.166.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f173.google.com with SMTP id v13so917870iln.4
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Feb 2023 09:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BigFvfX6HaLJy2raRZp/n1PTTcpikpD59IEoZss+6BI=;
        b=ZtMVqY4rz2nY6oSs3EOke3sFJswNBGlYPPWTfLaKBEsnyzFiBbgY2BftSHO6fz37ir
         iB7n3k39zUYD6CNfCVpneg2IepGtOjfbUDS8i1p53fJFZPJb1gRRFtBsmrA/+w/SRQjE
         h1UMk3YvaEk4w+C+herZLpPL41hWRXFa92qbGeQlH1RD3PBbhftQWFqG9soyAnF/DB+j
         YA7Z/gR5Nl561hziIBuIUfDeyqIZzu+V1MoFklEOCqHnBBASoga0lg3skXybANF0Wf5L
         SQj6dz4q9A22Tmfu2ss4C8oAiyPODrrD/26T3YCBfu/yRw+J2rJqXEMaQ9iIEYyA2aQ1
         0Y9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BigFvfX6HaLJy2raRZp/n1PTTcpikpD59IEoZss+6BI=;
        b=4VNHuzkJ+LOug0MnMg//pszuLvei8ySs58cuCurj6lF/r/Yxg4FC/BhyYBMg3ZQzsI
         /uVwT+apzuoDKcVMIms0E5EztnXWzZ7zvDL7q7QFHKKDs7n0sq75EyzgyS3LicIwDeq/
         nY0q99MPbFrdenTWLXQuAI8DIwDd7o4YUVNOLp1M25msNKjriD+pVlmAK4as2Z+Qjqpx
         jDSMftRGhj/8Zkiwl2rnf3qLpi4najUxkiYmK8Rd64XmHwc0rZIp8p2HGZVe0JKjVtLn
         PF+a2GRz64OviNfQzjRFOfSFP4ZTcG2uCSK/8ooR+8VParNhF5gJsFc7RLAblUS/H5MR
         HbFw==
X-Gm-Message-State: AO0yUKV+VwxrOlW6AM2z8q1ox0Tjs+Dr7VQtNYdSaKGM+Aq3sT/8Seo6
	/CfXYxSHxZdcwjzxGUsbHeDmfLAxYZ5ApAVYYuw=
X-Google-Smtp-Source: AK7set8nnA/0UF5IApHoN8F8Gz6FsNitt0kG3Jjz6IQB5HOPNyaD/YQfE1zjKg3xl2L9Dh/VBRQ+ueW5LJ7k4L26CEU=
X-Received: by 2002:a92:c5c8:0:b0:314:1098:ebaa with SMTP id
 s8-20020a92c5c8000000b003141098ebaamr2391591ilt.117.1676051063663; Fri, 10
 Feb 2023 09:44:23 -0800 (PST)
MIME-Version: 1.0
References: <20230210142539.28035-1-twoerner@gmail.com>
In-Reply-To: <20230210142539.28035-1-twoerner@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 10 Feb 2023 12:44:12 -0500
Message-ID: <CADkTA4NwY6tb6HhA6LGk5dGxarbQzyrRS=H=i8u9TY8gBbAMZg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/2] python3-dtschema: add dependency on pylibfdt
To: Trevor Woerner <twoerner@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Feb 2023 17:44:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176998

On Fri, Feb 10, 2023 at 9:25 AM Trevor Woerner <twoerner@gmail.com> wrote:
>
> dt-schema has a dependency on pylibfdt.
>

FWIW. I find that the pypi libfdt lags quite a bit, and isn't updated
often (that being said, there aren't really updates in dtc either, so
it probably isn't an issue).

When I've been building it for supporting my other projects, I've
ended up using the main dtc git, and meson to do the build and
install.

Bruce

> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
> changes since v1:
> - add a maintainer entry
> ---
>  meta/conf/distro/include/maintainers.inc           |  1 +
>  .../python/python3-dtschema_2023.1.bb              |  2 +-
>  .../python/python3-pylibfdt_1.6.1.bb               | 14 ++++++++++++++
>  3 files changed, 16 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/python/python3-pylibfdt_1.6.1.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index ec7ea90d16a6..575ceac8f23c 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -661,6 +661,7 @@ RECIPE_MAINTAINER:pn-python3-pycparser = "Tim Orling <tim.orling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-python3-pyelftools = "Joshua Watt <JPEWhacker@gmail.com>"
>  RECIPE_MAINTAINER:pn-python3-pygments = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
>  RECIPE_MAINTAINER:pn-python3-pygobject = "Zang Ruochen <zangrc.fnst@fujitsu.com>"
> +RECIPE_MAINTAINER:pn-python3-pylibfdt = "Trevor Woerner <twoerner@gmail.com>"
>  RECIPE_MAINTAINER:pn-python3-pyopenssl = "Tim Orling <tim.orling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-python3-pyparsing = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
>  RECIPE_MAINTAINER:pn-python3-pyproject-hooks = "Ross Burton <ross.burton@arm.com>"
> diff --git a/meta/recipes-devtools/python/python3-dtschema_2023.1.bb b/meta/recipes-devtools/python/python3-dtschema_2023.1.bb
> index 9767c95d3043..24bded9710a9 100644
> --- a/meta/recipes-devtools/python/python3-dtschema_2023.1.bb
> +++ b/meta/recipes-devtools/python/python3-dtschema_2023.1.bb
> @@ -10,6 +10,6 @@ PYPI_PACKAGE = "dtschema"
>  SRC_URI[sha256sum] = "8fc8c269e4c57e9d008af7b32cd33b77afd4ea1ac9552bcfa96b41b9e0c52586"
>
>  DEPENDS += "python3-setuptools-scm-native"
> -RDEPENDS:${PN} += "python3-ruamel-yaml python3-jsonschema python3-rfc3987"
> +RDEPENDS:${PN} += "python3-ruamel-yaml python3-jsonschema python3-rfc3987 python3-pylibfdt"
>
>  BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta/recipes-devtools/python/python3-pylibfdt_1.6.1.bb b/meta/recipes-devtools/python/python3-pylibfdt_1.6.1.bb
> new file mode 100644
> index 000000000000..966f8f1413fb
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-pylibfdt_1.6.1.bb
> @@ -0,0 +1,14 @@
> +DESCRIPTION = "libfdt from the dtc project"
> +HOMEPAGE = "git://git.kernel.org/pub/scm/utils/dtc/dtc.git"
> +LICENSE = "BSD-2-Clause"
> +LIC_FILES_CHKSUM = "file://BSD-2-Clause;md5=5d6306d1b08f8df623178dfd81880927"
> +
> +inherit pypi setuptools3
> +
> +PYPI_PACKAGE = "pylibfdt"
> +
> +SRC_URI[sha256sum] = "90c667c5adf44c6ab2f13bdc566598897784c7b781bed91064e7373bd270b778"
> +
> +DEPENDS += "python3-setuptools-scm-native swig-native"
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.36.0.rc2.17.g4027e30c53
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176993): https://lists.openembedded.org/g/openembedded-core/message/176993
> Mute This Topic: https://lists.openembedded.org/mt/96876890/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

