Return-Path: <armccurdy@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6922CC352A7
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:53 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.2809.1649877729518708366
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 12:22:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UCMawpxw;
 spf=pass (domain: gmail.com, ip: 209.85.208.175,
 mailfrom: armccurdy@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id b21so3430784ljf.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 12:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jsnLxgI7g1XX0nz2a8QJGT8vUcEkPmC4oouwmVDfmL4=;
        b=UCMawpxwXYV8ytS0/X0AQoXhFFyKksyuKqH94OLTMxtUI8zA7TF4f1SX1Z0fOksWk1
         t3uuiSqhA3rbWB9+GUNL1NyzT3jXHX70r+QyI1wlm3fA+BGB01UqlFqBWV2kPoUPK0Db
         NjadDuosGN3ke3V15bKzA/j9iO6o6PECFi18kgWeO5KbP0SFV/QA6Ns6RSCQmJLXvGet
         U3m1x+2h3u9824r0mul7q3E9rZondrqHW5xCfxIBPe1Fb0sq5bCJqPYA0rpOlSPX29m/
         9ZrIbwvXiI4nBkxBv1DzfYy6DNJHl3C0EcEOOPYDO5RdcrXFWlQ+E71mRE+2NxJxIpOy
         79Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jsnLxgI7g1XX0nz2a8QJGT8vUcEkPmC4oouwmVDfmL4=;
        b=d77yE+o3qpcxY0lVTd7U1T8Jn9YNYLBkW559mAmkSq5pxE+NT01RQ1+HS7hJ0PJWH1
         +qNGmoxkwHlV7qnQEcfNCYGanT7/LwNUN041JCWWfVwWTAYr71X4xZUy8E6ph7XD4NAr
         +F9rhE9/2SGm1bvpZoU/TEOMV+aB0SalJN4ysbnmLRSUPTw3YPY2UFllGmCSg1p+I85n
         VmjjjAWpI77PF5LNUL++DwnvFfnVvcL9k/vg+b81EmZy59sUUEn73040bf2PeiAM2zsa
         j9qc3AgbaO3mSEXDDKLKrk5t5LZJHIBdVftz3vgv9wvt7L4lIq2LRZwcdBsXtLdqpqTM
         MbRQ==
X-Gm-Message-State: AOAM533wesKIO5IKmYl/h01rSAa+cyFtHSoNMuY+4FxIQEF7lwrl/VFF
	47IlTKppP9yrOFlPT0Lmbt2YNvs2s1fp7AVGPpo=
X-Google-Smtp-Source: 
 ABdhPJz9BySxri6TY9A2UPN7ERBIxlgN/rGOMUu+gB76A/2vGen9Zqlx8Eee0i8yhAuMacSA1hreq7NE+jlcdJqlw5E=
X-Received: by 2002:a2e:a726:0:b0:24b:63a6:bd27 with SMTP id
 s38-20020a2ea726000000b0024b63a6bd27mr9835150lje.132.1649877727354; Wed, 13
 Apr 2022 12:22:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220413175817.2187595-1-richard.purdie@linuxfoundation.org>
 <20220413175817.2187595-2-richard.purdie@linuxfoundation.org>
In-Reply-To: <20220413175817.2187595-2-richard.purdie@linuxfoundation.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 13 Apr 2022 12:21:50 -0700
Message-ID: 
 <CAJ86T=Up-de2X5=mjvpVqkwfXrQWHXDV5bd6G6+G9oEA4PUvnw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] buildtools: Add standalone make tarball
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164362

On Wed, Apr 13, 2022 at 10:58 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Some versions of make have bugs. Add a way to provide a make tarball
> that can be used on it's own in these cases.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/conf/distro/include/maintainers.inc         |  1 +
>  .../recipes-core/meta/buildtools-make-tarball.bb | 16 ++++++++++++++++
>  2 files changed, 17 insertions(+)
>  create mode 100644 meta/recipes-core/meta/buildtools-make-tarball.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index 2c5e7308275..09a75933e26 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -84,6 +84,7 @@ RECIPE_MAINTAINER:pn-builder = "Richard Purdie <richard.purdie@linuxfoundation.o
>  RECIPE_MAINTAINER:pn-buildtools-extended-tarball = "Richard Purdie <richard.purdie@linuxfoundation.org>"
>  RECIPE_MAINTAINER:pn-buildtools-tarball = "Richard Purdie <richard.purdie@linuxfoundation.org>"
>  RECIPE_MAINTAINER:pn-buildtools-docs-tarball = "Richard Purdie <richard.purdie@linuxfoundation.org>"
> +RECIPE_MAINTAINER:pn-buildtools-make-tarball = "Richard Purdie <richard.purdie@linuxfoundation.org>"
>  RECIPE_MAINTAINER:pn-busybox = "Andrej Valek <andrej.valek@siemens.com>"
>  RECIPE_MAINTAINER:pn-busybox-inittab = "Denys Dmytriyenko <denis@denix.org>"
>  RECIPE_MAINTAINER:pn-bzip2 = "Denys Dmytriyenko <denis@denix.org>"
> diff --git a/meta/recipes-core/meta/buildtools-make-tarball.bb b/meta/recipes-core/meta/buildtools-make-tarball.bb
> new file mode 100644
> index 00000000000..e278f682719
> --- /dev/null
> +++ b/meta/recipes-core/meta/buildtools-make-tarball.bb
> @@ -0,0 +1,16 @@
> +require recipes-core/meta/buildtools-tarball.bb
> +
> +DESCRIPTION = "SDK type target for building a standalone tarball containing build-essentials, python3, chrpath, \
> +               make, git and tar. The tarball can be used to run bitbake builds on systems which don't meet the \
> +               usual version requirements and have ancient compilers."

Over enthusiastic copy and paste?

> +SUMMARY = "Standalone tarball for running builds on systems with inadequate software and ancient compilers"
> +LICENSE = "MIT"
> +
> +# Add nativesdk equivalent of build-essentials
> +TOOLCHAIN_HOST_TASK = "\
> +    nativesdk-sdk-provides-dummy \
> +    nativesdk-make \
> +    "
> +TOOLCHAIN_OUTPUTNAME = "${SDK_ARCH}-buildtools-make-nativesdk-standalone-${DISTRO_VERSION}"
> +
> +SDK_TITLE = "Make build tool"
> --
> 2.32.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164354): https://lists.openembedded.org/g/openembedded-core/message/164354
> Mute This Topic: https://lists.openembedded.org/mt/90446806/3619030
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [armccurdy@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

