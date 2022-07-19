Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDF97C43334
	for <webhook@archiver.kernel.org>; Tue, 19 Jul 2022 07:59:07 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web08.38110.1658217541635194177
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jul 2022 00:59:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=E/8mnWkO;
 spf=pass (domain: gmail.com, ip: 209.85.167.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id z25so23447173lfr.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jul 2022 00:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T0t3Ab2ESLzP+7BnCw+HRoNAGK04ucunZYzDQNfxACI=;
        b=E/8mnWkOO24HnWX3lhq7w2KDZFpxGcVVAHrDT6vp3YpHplBEi8iPdijSkWYKk5Vyii
         Sl7jrBArgKM/D7FOBP9vp3GUBcg1Y/61Tuli4L1IgDMyswhoTDQ3wtF89exgHA9dYTkD
         z1nEoqfy6snt0O5rVV41qx6i9R95Mh91c4WUwtBPmTXbMcCB+jJS8myhCGs8Xgaq5Tp3
         oQvUTR3Lga9RO5rtah+rz1lzxayOehYR6/RqYdf/MU9phPagjQ1Kx1RZwOLHtrg0CJuN
         ffzb/GLKMN4xCKKEHOS7BcyFSfU+mhiPSZ5q7qlH/vzTvENcRxCyKlOzUZ2cag40APjA
         X3qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T0t3Ab2ESLzP+7BnCw+HRoNAGK04ucunZYzDQNfxACI=;
        b=7LFKMh7EZMmQfuxHpoMPbLeJqFpX9nShN+AF4fody5pp7NE8+j55hyujvUIgqHVGqV
         rWWGFrrmbT0zJ6TsxZyM2m3pZxCoiyhy4cHVW344U4j6GQTpdvr4NmRX1/hwKPfWFgzW
         5LH+BvbO/qfhCZPE+fGD7jse0XGnKjtTRFyq4qN5BIfztfpnpkUMmdi3YVL2d3yteeWs
         lv3ENVGMYUYcd2YuwqdxEmBfQhF10HaSUmtze9Z8D5gaYdlWvgguAOI/MRJ8YwALhcUH
         YhrjHvW2GZloWFX004IpzcX6D1HQ9p1AwyOtlzo4lUlWK+UvCULh2EG6eTqNGy4/wlop
         Qs5A==
X-Gm-Message-State: AJIora+t4EuRQ51jXA1hUdyDGniqkz5hbksD5hJWPD9tk23m8Nk5bHFw
	RyW1t7YiufCVUpoXZ7917TA47NNhHXBBkDHT+k0=
X-Google-Smtp-Source: 
 AGRyM1v6fv1zLMjrGtFKJhKlsDSbqAOf6kbW3174/shqWsSeZ4B33y6TRK5S4/WdTyRhRFE+T5x++Yw3d49r1F41WjY=
X-Received: by 2002:a05:6512:3409:b0:489:c549:4693 with SMTP id
 i9-20020a056512340900b00489c5494693mr16008747lfr.26.1658217539611; Tue, 19
 Jul 2022 00:58:59 -0700 (PDT)
MIME-Version: 1.0
References: <1658189026-652-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1658189026-652-1-git-send-email-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 19 Jul 2022 09:58:49 +0200
Message-ID: 
 <CANNYZj-6Zr2ix48ieud=2Ct-S7hhODckXi_Amhu_XmQw1S_Fgg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] python3-docutils: upgrade 0.18.1 -> 0.19
To: wangmy <wangmy@fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Jul 2022 07:59:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168276

That should be ok, but you need to re-send the commit.

Alex

On Tue, 19 Jul 2022 at 02:04, wangmy <wangmy@fujitsu.com> wrote:
>
> License-Update:
>  year updated to 2022
>  url of some reposity and license changed
>  file lists changed
>
> Changelog:
> ===========
> - Drop support for Python 2.7, 3.5, and 3.6.
>
> - Output changes:
>   HTML5:
>      Wrap groups of footnotes in an <aside> for easier styling.
>      The CSS rule .footnote-list { display: contents; } can be used to restore
>      the behaviour of custom CSS styles.
> - After package installation, the CLI commands python -m docutils and docutils
>   start the generic command line front end tool.
> - Support parsing "Markdown" input with 3rd party parsers myst, pycmark, or recommonmark.
> - The default values for the "pep-references", "rfc-base-url", and "python-home"
>   configuration settings now use the "https:" scheme. The PEP-writer template's
>   header is updated to fix links and resemble the header of official PEPs.
> - Various bugfixes and improvements (see HISTORY).
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../{python3-docutils_0.18.1.bb => python3-docutils_0.19.bb}  | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/python/{python3-docutils_0.18.1.bb => python3-docutils_0.19.bb} (62%)
>
> diff --git a/meta/recipes-devtools/python/python3-docutils_0.18.1.bb b/meta/recipes-devtools/python/python3-docutils_0.19.bb
> similarity index 62%
> rename from meta/recipes-devtools/python/python3-docutils_0.18.1.bb
> rename to meta/recipes-devtools/python/python3-docutils_0.19.bb
> index e4ddd01978..7ae93ab557 100644
> --- a/meta/recipes-devtools/python/python3-docutils_0.18.1.bb
> +++ b/meta/recipes-devtools/python/python3-docutils_0.19.bb
> @@ -2,9 +2,9 @@ SUMMARY = "Docutils is a modular system for processing documentation into useful
>  HOMEPAGE = "http://docutils.sourceforge.net"
>  SECTION = "devel/python"
>  LICENSE = "PSF-2.0 & BSD-2-Clause & GPL-3.0-only"
> -LIC_FILES_CHKSUM = "file://COPYING.txt;md5=fecee07ad8df9116e1f739e2ed2ea513"
> +LIC_FILES_CHKSUM = "file://COPYING.txt;md5=41001b296a89bb2780bbe306e947ecee"
>
> -SRC_URI[sha256sum] = "679987caf361a7539d76e584cbeddc311e3aee937877c87346f31debc63e9d06"
> +SRC_URI[sha256sum] = "33995a6753c30b7f577febfc2c50411fec6aac7f7ffeb7c4cfe5991072dcf9e6"
>
>  inherit pypi setuptools3
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168264): https://lists.openembedded.org/g/openembedded-core/message/168264
> Mute This Topic: https://lists.openembedded.org/mt/92472708/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

