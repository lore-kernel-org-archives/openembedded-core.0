Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86F9FC433EF
	for <webhook@archiver.kernel.org>; Thu, 25 Nov 2021 17:36:29 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web10.15036.1637861788178925750
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 09:36:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hMmR0q3X;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id g9so3240773qvd.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 09:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yQwB0FzfoSqK7NYK8mDoyvcAD0pe9rFFSNiDzHIQAC4=;
        b=hMmR0q3XGaS23lbjN0jhpBFWLQiivL+6Mi2bcJU7TBl6B4LypMNZS6KO0X1k3DYkbt
         geTkI3ZhWoAVy/wRIKeNFARjT+ENplXGeuSdEEBWWx7m6IapipqGWuI6XDekjw+scTTg
         0+p4h7FVEihlamaEHVjuBBe9cSs5qX9BdepoiXmVOqN/sBkpFdAYsvigPOV4xn5Xl9BD
         2nsFquvXCq4ZY+FUgZLt/y0kJUBg5FyKvLguFQbmO9Y9Uwh2V7/fTwUKt5UKx4L1iGgN
         b35QCBPtXwuwkyMZox+xO3nWA/3LmF5186l4qqPB55jPjwun8y3lAomOafmm/eui02sF
         kcKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yQwB0FzfoSqK7NYK8mDoyvcAD0pe9rFFSNiDzHIQAC4=;
        b=0P4RSIxeowyez4l0Cp6sOoOKIL0UXP7KvgPrLBVPEJ6cUYvau03X26r9TohZqlHdpY
         PVyBF1O6pCk1sfTkVcuVf0C+VE4puqhD1hsqE2Cul8OU6pryqUqdu8ANqIDItHNj8u/i
         U8k17B7DMfSOWMmo2qXtReknTgqfS4xsoEjz2d4u53B8Soa2j1RsNRrJHHG/79hgwLjT
         n8zjjIJnSOJrsPWRW3FY4XpOk0czRhu/r+a7E34y+8dARO0B9R5+nVx32s9iSG5LSDAF
         2QnmYy4wTCDUaozIBT5ErAEsHP0OXMOQviMzKKjWe4DHhz0uxE91mAcroximFqg7tvH8
         HM3w==
X-Gm-Message-State: AOAM533fllQ9p2W3xVkKDE5MyA4FEq4yJyy+LVL9WEFqUM5ijko5Khzr
	NC5jSRlU5bMYybSVfWFrBlSqnHNu0LAbbOx/16U=
X-Google-Smtp-Source: 
 ABdhPJxUhpOBpPwk0JS1iFCn6nOuy6iTavOBFhbXXpjNZ3bqIPy65UJE53ucDUf16HSpVhWO1IHx1ytG47mfVAx9V40=
X-Received: by 2002:a05:6214:e63:: with SMTP id
 jz3mr19732877qvb.16.1637861787270;
 Thu, 25 Nov 2021 09:36:27 -0800 (PST)
MIME-Version: 1.0
References: <cover.1637788184.git.bruce.ashfield@gmail.com>
 <c653e0c3cd0edd038b3c3a2d9df442d2fe5ea745.1637788184.git.bruce.ashfield@gmail.com>
In-Reply-To: 
 <c653e0c3cd0edd038b3c3a2d9df442d2fe5ea745.1637788184.git.bruce.ashfield@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 25 Nov 2021 09:36:01 -0800
Message-ID: 
 <CAMKF1sqXFdQCtOHcc36CZgfoxwL0ASFeU2PyWW7LiD22drJVLA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 03/20] python: introduce python3-dtschema
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, Tim Orling <TicoTimo@gmail.com>,
	Trevor Gamblin <trevor.gamblin@windriver.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Nov 2021 17:36:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158789

fails to build for me

https://errors.yoctoproject.org/Errors/Details/618010/

On Wed, Nov 24, 2021 at 1:14 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> kernel commit 53182e81f47d [kbuild: Enable DT schema checks for %.dtb
> targets], which is part of v5.16+, makes the checking of dtb schemas
> manditory.
>
> To support the checking, we introduce this new recipe dtschema.
>
> Dependencies will be imported in subsequent commits, so we can
> track the dependency need on a per-import basis.
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  .../python/python3-dtschema_2021.10.bb           | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-dtschema_2021.10.bb
>
> diff --git a/meta/recipes-devtools/python/python3-dtschema_2021.10.bb b/meta/recipes-devtools/python/python3-dtschema_2021.10.bb
> new file mode 100644
> index 0000000000..f16232d610
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-dtschema_2021.10.bb
> @@ -0,0 +1,16 @@
> +DESCRIPTION = "Tooling for devicetree validation using YAML and jsonschema"
> +HOMEPAGE = "https://github.com/devicetree-org/dt-schema"
> +LICENSE = "BSD-2-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=457495c8fa03540db4a576bf7869e811"
> +
> +inherit pypi setuptools3
> +
> +PYPI_PACKAGE = "dtschema"
> +
> +SRC_URI[md5sum] = "d2f0d847ba2ad4d223317ef7304342b0"
> +SRC_URI[sha256sum] = "d09c94d13f46e6674ba11ff31220651ad1b02dae860f5a87905dfac6b8d768d9"
> +
> +DEPENDS += "python3-setuptools-scm"
> +RDEPENDS:${PN} += "python3-ruamel-yaml python3-jsonschema python3-rfc3987"
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.19.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158749): https://lists.openembedded.org/g/openembedded-core/message/158749
> Mute This Topic: https://lists.openembedded.org/mt/87290455/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

