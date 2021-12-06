Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09877C433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 15:42:19 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.53273.1638805338247791613
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 07:42:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B9Qgd0bC;
 spf=pass (domain: gmail.com, ip: 209.85.128.44,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id
 p3-20020a05600c1d8300b003334fab53afso10723159wms.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 07:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WrTCTQAXBK6RCcyClvrfpjH4cNuN0re7bu73dxJrxhU=;
        b=B9Qgd0bCMiTPYydh1PmrSriZUkqTU/eowWjOjvsY+DRPywT2RSQP0NI9CxHFTWUWJA
         FNX04G+eJEQmSvoMoERrO8Zhqq/UvtCMPYM5pSScRz0VBEq9oUCErQ18c7NXO9AFDx/m
         y7Sq+AfOBwgFVwr70/OVXX2mPDjGj4ihtOTijQbY6XU903VGvzbml54bdxRpShsDuViO
         9/8Rqoqs+PrIa/cPv8+RUCOgl+F/pwgUcjgifvQOC0jwok13sifzG1pZqj7bSBnVf9TK
         f2BUv8bQnBfh+jDP1Q286WBodAp9z42Hm6lUaWILQJGwt4bgGHyYZ0gi8ahfEH7JDu3E
         300A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WrTCTQAXBK6RCcyClvrfpjH4cNuN0re7bu73dxJrxhU=;
        b=rNLXDnxVKu01KYaQkzq6z9dRvv0OAtyqeE0joN0IQ3C4k9bsDeOlBp9pF4xyxsEsEz
         SmgtVPF5j6FO7EYVDDA1upSmNvpdymWdwWJrIi3feRn8VSsiCRl0tn7J3qKymKsSUrrf
         Q4eSshB4M5oIl/jyAKGcwcUQiGTTsW8Chx6n+DUyMZKZsaxfz3OwvkK/EHw36Jxq6RIY
         nw/zl4mawGoix7FNeYjG2ugLAeB0tAi3GSUoBq+3vbUrVh+RvsoGSDd/s3u8EBq3l3nr
         IMXXb+dsWFRAklrL+S8s7ukvKOcLxNGpme3LuPBYRfY/e151RtmA8qb20HJRV7EIj9Oo
         dF3Q==
X-Gm-Message-State: AOAM530PjcaMRyCUN2gdxe29esGKiIQ8rdfsKhb00sXFtNjG6SnxUOr4
	0iDtUKkaLXYX+LPjKleUiak+RIhdyI6UcuoUYdQ=
X-Google-Smtp-Source: 
 ABdhPJzYp9JgCt2pnukezDscqanJrM/fbtRhB5hUYNhch/gn1sAu5kqHmtoRr8MHzZ1ZioWqYMTQaHkVepDvric/Dfc=
X-Received: by 2002:a1c:f414:: with SMTP id z20mr40625392wma.17.1638805336683;
 Mon, 06 Dec 2021 07:42:16 -0800 (PST)
MIME-Version: 1.0
References: <20211206153511.34838-1-foss+yocto@0leil.net>
 <20211206153511.34838-2-foss+yocto@0leil.net>
In-Reply-To: <20211206153511.34838-2-foss+yocto@0leil.net>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 6 Dec 2021 09:42:05 -0600
Message-ID: 
 <CAJdd5GY-3c1-eBbtNOgiEHf0yFnocNWz=mQaXmWCLWpStjz1JA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/4] rename core-image-testmaster* to
 core-image-testgolden
To: Quentin Schulz <foss@0leil.net>
Cc: openembedded-core@lists.openembedded.org,
	Quentin Schulz <foss+yocto@0leil.net>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 15:42:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159248

On Mon, Dec 6, 2021 at 9:35 AM Quentin Schulz <foss@0leil.net> wrote:
>
> "golden" has a more explicit meaning than master in addition to not
> being an issue wrt inclusivity.

I don't think "golden" has the same meaning here. Perhaps "controller"
or something similar?

>
> Signed-off-by: Quentin Schulz <foss+yocto@0leil.net>
> ---
>  meta/conf/distro/include/distro_alias.inc                   | 4 ++--
>  meta/conf/distro/include/maintainers.inc                    | 4 ++--
>  meta/lib/oeqa/controllers/masterimage.py                    | 6 +++---
>  ...ster-initramfs.bb => core-image-testgolden-initramfs.bb} | 2 +-
>  .../{core-image-testmaster.bb => core-image-testgolden.bb}  | 4 ++--
>  5 files changed, 10 insertions(+), 10 deletions(-)
>  rename meta/recipes-extended/images/{core-image-testmaster-initramfs.bb => core-image-testgolden-initramfs.bb} (92%)
>  rename meta/recipes-extended/images/{core-image-testmaster.bb => core-image-testgolden.bb} (80%)
>
> diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/include/distro_alias.inc
> index 44bc3bf1315..2649a21474b 100644
> --- a/meta/conf/distro/include/distro_alias.inc
> +++ b/meta/conf/distro/include/distro_alias.inc
> @@ -42,8 +42,8 @@ DISTRO_PN_ALIAS:pn-core-image-rt-sdk = "OE-Core"
>  DISTRO_PN_ALIAS:pn-core-image-sato = "OE-Core"
>  DISTRO_PN_ALIAS:pn-core-image-sato-dev = "OE-Core"
>  DISTRO_PN_ALIAS:pn-core-image-sato-sdk = "OE-Core"
> -DISTRO_PN_ALIAS:pn-core-image-testmaster = "OE-Core"
> -DISTRO_PN_ALIAS:pn-core-image-testmaster-initramfs = "OE-Core"
> +DISTRO_PN_ALIAS:pn-core-image-testgolden = "OE-Core"
> +DISTRO_PN_ALIAS:pn-core-image-testgolden-initramfs = "OE-Core"
>  DISTRO_PN_ALIAS:pn-core-image-weston = "OE-Core"
>  DISTRO_PN_ALIAS:pn-core-image-x11 = "OE-Core"
>  DISTRO_PN_ALIAS:pn-createrepo-c = "Fedora=createrepo_c Clear=createrepo_c"
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index 97ba2ce79c8..61572247560 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -112,8 +112,8 @@ RECIPE_MAINTAINER:pn-core-image-ptest-all = "Richard Purdie <richard.purdie@linu
>  RECIPE_MAINTAINER:pn-core-image-ptest-fast = "Richard Purdie <richard.purdie@linuxfoundation.org>"
>  RECIPE_MAINTAINER:pn-core-image-sato = "Richard Purdie <richard.purdie@linuxfoundation.org>"
>  RECIPE_MAINTAINER:pn-core-image-sato-sdk = "Richard Purdie <richard.purdie@linuxfoundation.org>"
> -RECIPE_MAINTAINER:pn-core-image-testmaster-initramfs = "Richard Purdie <richard.purdie@linuxfoundation.org>"
> -RECIPE_MAINTAINER:pn-core-image-testmaster = "Richard Purdie <richard.purdie@linuxfoundation.org>"
> +RECIPE_MAINTAINER:pn-core-image-testgolden-initramfs = "Richard Purdie <richard.purdie@linuxfoundation.org>"
> +RECIPE_MAINTAINER:pn-core-image-testgolden = "Richard Purdie <richard.purdie@linuxfoundation.org>"
>  RECIPE_MAINTAINER:pn-core-image-weston = "Richard Purdie <richard.purdie@linuxfoundation.org>"
>  RECIPE_MAINTAINER:pn-core-image-weston-sdk = "Richard Purdie <richard.purdie@linuxfoundation.org>"
>  RECIPE_MAINTAINER:pn-core-image-x11 = "Richard Purdie <richard.purdie@linuxfoundation.org>"
> diff --git a/meta/lib/oeqa/controllers/masterimage.py b/meta/lib/oeqa/controllers/masterimage.py
> index 0bf5917e481..2eff6d05ef9 100644
> --- a/meta/lib/oeqa/controllers/masterimage.py
> +++ b/meta/lib/oeqa/controllers/masterimage.py
> @@ -3,13 +3,13 @@
>  # SPDX-License-Identifier: MIT
>  #
>  # This module adds support to testimage.bbclass to deploy images and run
> -# tests using a "master image" - this is a "known good" image that is
> +# tests using a "golden image" - this is a "known good" image that is
>  # installed onto the device as part of initial setup and will be booted into
>  # with no interaction; we can then use it to deploy the image to be tested
>  # to a second partition before running the tests.
>  #
> -# For an example master image, see core-image-testmaster
> -# (meta/recipes-extended/images/core-image-testmaster.bb)
> +# For an example golden image, see core-image-testgolden
> +# (meta/recipes-extended/images/core-image-testgolden.bb)
>
>  import os
>  import bb
> diff --git a/meta/recipes-extended/images/core-image-testmaster-initramfs.bb b/meta/recipes-extended/images/core-image-testgolden-initramfs.bb
> similarity index 92%
> rename from meta/recipes-extended/images/core-image-testmaster-initramfs.bb
> rename to meta/recipes-extended/images/core-image-testgolden-initramfs.bb
> index 1a2e0af27ba..5495e3d12e0 100644
> --- a/meta/recipes-extended/images/core-image-testmaster-initramfs.bb
> +++ b/meta/recipes-extended/images/core-image-testgolden-initramfs.bb
> @@ -7,7 +7,7 @@ PACKAGE_INSTALL = "initramfs-live-boot initramfs-live-install-testfs initramfs-l
>  # Do not pollute the initrd image with rootfs features
>  IMAGE_FEATURES = ""
>
> -export IMAGE_BASENAME = "core-image-testmaster-initramfs"
> +export IMAGE_BASENAME = "core-image-testgolden-initramfs"
>  IMAGE_NAME_SUFFIX ?= ""
>  IMAGE_LINGUAS = ""
>
> diff --git a/meta/recipes-extended/images/core-image-testmaster.bb b/meta/recipes-extended/images/core-image-testgolden.bb
> similarity index 80%
> rename from meta/recipes-extended/images/core-image-testmaster.bb
> rename to meta/recipes-extended/images/core-image-testgolden.bb
> index 0faf18f5a4e..f4cab1491d4 100644
> --- a/meta/recipes-extended/images/core-image-testmaster.bb
> +++ b/meta/recipes-extended/images/core-image-testgolden.bb
> @@ -1,4 +1,4 @@
> -DESCRIPTION = "A master image to be deployed on a target useful for testing other images"
> +DESCRIPTION = "A golden image to be deployed on a target useful for testing other images"
>
>  IMAGE_FEATURES += "ssh-server-openssh package-management"
>
> @@ -14,5 +14,5 @@ IMAGE_INSTALL += "\
>  # we need a particular initramfs for live images
>  # that pulls custom install scripts which take
>  # care of partitioning for us
> -INITRD_IMAGE = "core-image-testmaster-initramfs"
> +INITRD_IMAGE = "core-image-testgolden-initramfs"
>
> --
> 2.33.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159243): https://lists.openembedded.org/g/openembedded-core/message/159243
> Mute This Topic: https://lists.openembedded.org/mt/87542272/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JPEWhacker@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

