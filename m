Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B791FC433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 22:24:35 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web09.45.1645568675200067312
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 14:24:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=K3urSu3h;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id h13so3362287qvk.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 14:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SrShRVFBKQoC7wuvvpPNmwJf9jcy7XRq5mtSnHk3Bv4=;
        b=K3urSu3hGbjOVvwi73pYbRE6/FWB8UKP6hFNGNmxXjKBDVPwxtV3DeyUBLl3ZhZc5F
         5Il6RJf2HoNce+NTIZtHw7gRyDAV84RTK+pNHHSi+kcnO8Fa3+r1M3XPO1Pa8vNl3olL
         XFVgvvCxwgVTnLkmFxlczv/vsRXGw6lkGAxgWiYk2n+5sT0Mn6vqkPNqFMRvm6Q7EV7h
         ANp8HsTKpoK5eH5YqFci+AGeL9OVj73/hn8i+1BlJEY+iJ86uXHRaROVHQUPMyhML3q9
         NQXgNFMhrhDFVKR39HEEQtFzXGEx+PtkdRzLVBt9nA+2ciAiexaaBEKr+9YPCZ2n6fUK
         rEtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SrShRVFBKQoC7wuvvpPNmwJf9jcy7XRq5mtSnHk3Bv4=;
        b=MM+17axPAwjbg+qHwqAY8KRbQAOUTmZzbulYGMRzWqqRF5w6N/2hIWjWwm3dYzqqAm
         gxiFVEVLEjMrvMswGVvSRqMoz7IGnPS+NYc8MOcb59Lz9I0ME4EjnN9PgUrMzPu8YBvP
         lEhLmSUAILbTYVT1YpjKuzJmFtaxQhT/LH066cJJ9iI+a+enfqxC7zad4i9imTlBHLiU
         eBP19Npx+sZVeB2fSQTx7Z1riMNJej/nawC3zlwhmKB9m+zKgI4zR5y+768fHh48Ys0p
         OhBvaARy0/JXSACRIUdWgN2EgaBiJsSJqztuburTfaB6YG8BoUllvjy7ZbUe1CgQjmTS
         oDCQ==
X-Gm-Message-State: AOAM530t6G6MLfoIxSUM7jRc2ZPJsf5EGMVjA0yslc6k3EZ5h6Oa0f+6
	g4Lrf2DMAFq7/S/96r9iHq1F/lSbjnrHZ5t82JjMFESPNJTLDQ==
X-Google-Smtp-Source: 
 ABdhPJylbGwNsh13Eb5YB8sy3Y95iR1DqsXWlM9ybJAe5dAOsHqE4+DPlDgNWTHPyW4n/kkrXDCWuJx1con++X74V1I=
X-Received: by 2002:ad4:574a:0:b0:42b:ef56:c2a4 with SMTP id
 q10-20020ad4574a000000b0042bef56c2a4mr21081741qvx.16.1645568674153; Tue, 22
 Feb 2022 14:24:34 -0800 (PST)
MIME-Version: 1.0
References: <cover.1645478020.git.tim.orling@konsulko.com>
 <3071336da7ba931774c91ba3a937f277c7b7c7d7.1645478020.git.tim.orling@konsulko.com>
In-Reply-To: 
 <3071336da7ba931774c91ba3a937f277c7b7c7d7.1645478020.git.tim.orling@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 22 Feb 2022 14:24:08 -0800
Message-ID: 
 <CAMKF1soENmAx+JC4A7Jvdg2nrRaA0YmEsFWyg4Z+9Aj8V4SuSg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 32/32] python3-nose: drop recipe
To: Tim Orling <ticotimo@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 22:24:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162228

there are packages in meta-python which still need it

  meta-networking/recipes-connectivity/netplan/netplan_0.103.bb:RDEPENDS:${PN}
= "python3 python3-core python3-pyyaml python3-netifaces python3-nos
e python3-coverage python3-pycodestyle python3-pyflakes
util-linux-libuuid libnetplan"
  meta-python/recipes-devtools/python/python3-anyjson_0.3.3.bb:
${PYTHON_PN}-nose \
  meta-python/recipes-devtools/python/python3-blinker_1.4.bb:
${PYTHON_PN}-nose \
  meta-python/recipes-devtools/python/python3-oauthlib_3.2.0.bb:PACKAGECONFIG[test]
= ",,,${PYTHON_PN}-blinker ${PYTHON_PN}-cryptography ${PYTHON_P
N}-nose ${PYTHON_PN}-pyjwt"

I wonder if these recipes can either be also removed or made free of
nose module.

On Mon, Feb 21, 2022 at 1:25 PM Tim Orling <ticotimo@gmail.com> wrote:
>
> The code has not been touched since 2016 and numerous files still have
> Python2 syntax code in them. This causes do_compile errors when
> packaging a wheel (PEP-517 packaging).
>
> Nothing in oe-core depends on python3-nose.
>
> [YOCTO #14638]
>
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
>  meta/conf/distro/include/maintainers.inc       |  1 -
>  meta/recipes-devtools/python/python-nose.inc   | 18 ------------------
>  .../python/python3-nose_1.3.7.bb               |  2 --
>  3 files changed, 21 deletions(-)
>  delete mode 100644 meta/recipes-devtools/python/python-nose.inc
>  delete mode 100644 meta/recipes-devtools/python/python3-nose_1.3.7.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index 7a65612b7c6..333685cd8b8 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -616,7 +616,6 @@ RECIPE_MAINTAINER:pn-python3-mako = "Oleksandr Kravchuk <open.source@oleksandr-k
>  RECIPE_MAINTAINER:pn-python3-markdown = "Alexander Kanavin <alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER:pn-python3-markupsafe = "Richard Purdie <richard.purdie@linuxfoundation.org>"
>  RECIPE_MAINTAINER:pn-python3-more-itertools = "Tim Orling <tim.orling@konsulko.com>"
> -RECIPE_MAINTAINER:pn-python3-nose = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
>  RECIPE_MAINTAINER:pn-python3-numpy = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
>  RECIPE_MAINTAINER:pn-python3-packaging = "Tim Orling <tim.orling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-python3-pathlib2 = "Tim Orling <tim.orling@konsulko.com>"
> diff --git a/meta/recipes-devtools/python/python-nose.inc b/meta/recipes-devtools/python/python-nose.inc
> deleted file mode 100644
> index 08c380d637c..00000000000
> --- a/meta/recipes-devtools/python/python-nose.inc
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -SUMMARY = "Extends Python unittest to make testing easier"
> -HOMEPAGE = "http://readthedocs.org/docs/nose/"
> -DESCRIPTION = "nose extends the test loading and running features of unittest, \
> -making it easier to write, find and run tests."
> -SECTION = "devel/python"
> -LICENSE = "LGPL-2.1-only"
> -LIC_FILES_CHKSUM = "file://lgpl.txt;md5=a6f89e2100d9b6cdffcea4f398e37343"
> -
> -SRC_URI[md5sum] = "4d3ad0ff07b61373d2cefc89c5d0b20b"
> -SRC_URI[sha256sum] = "f1bffef9cbc82628f6e7d7b40d7e255aefaa1adb6a1b1d26c69a8b79e6208a98"
> -
> -inherit pypi
> -
> -RDEPENDS:${PN} = "\
> -  ${PYTHON_PN}-unittest \
> -  "
> -
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta/recipes-devtools/python/python3-nose_1.3.7.bb b/meta/recipes-devtools/python/python3-nose_1.3.7.bb
> deleted file mode 100644
> index 13dbf96179a..00000000000
> --- a/meta/recipes-devtools/python/python3-nose_1.3.7.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -inherit setuptools3
> -require python-nose.inc
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162108): https://lists.openembedded.org/g/openembedded-core/message/162108
> Mute This Topic: https://lists.openembedded.org/mt/89304054/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

