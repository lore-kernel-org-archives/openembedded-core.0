Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0A21C433F5
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 11:56:13 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web09.6054.1648727772858705278
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 04:56:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=Bet6DlNc;
 spf=pass (domain: burtonini.com, ip: 209.85.221.50,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f50.google.com with SMTP id h4so33426995wrc.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 04:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1DtzaQSgSI/SP22+E5TA6OG61Z12Zv73E4NVHPhO/rE=;
        b=Bet6DlNcPE6c5ad4WiIxEK84M1ZFkWRgdcfHfjo6gzyCH6W+jV+OQbD3mCG5tOdzHx
         twX2J1D8PQ5jbpEX0Hd8vVKskoll+bmJV0eE0tj1sw47D1ICaWBYIbttO9RPv4SCMHYP
         NmkPbmgpn/7f1x5rO8FTP2jJct9TB4v5j2BeW8skoniVCcWc68B73PH2qjnftueVpL+Z
         Uc/H7o1EoQvSHhNZtmvo2rJUubHFp+0gMeUIJ7PxtdUUeVBu8OnP18Br+HX7fRc9+iO+
         2wp6/jZT2tpbZX+N/z4VynS0AhffjdZG2UfhTKiqD/48nNspbqTiH10dMNhQv/TYUdA4
         n9tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1DtzaQSgSI/SP22+E5TA6OG61Z12Zv73E4NVHPhO/rE=;
        b=w36/fujrOMBcBB4aTqOE1/+179J09ODEY1oFdN52n6SI+QPGiDsCttvWYKslEYuiH+
         z91e61/cGTGPlAJOInmHPlyTHkJyMUFIzYHtplFzBtUlH6LKFO4qCbsPwIcha1br0A7i
         /v11ER2asqCOmlAB934ftt7yThdauYBui74YvxCLIlbPKBw798pi4NydJsSBbucCRLn3
         7FqQw6V0PbJh6n+XgGKlSx2xdMNoyC/oubJlLjgdQqMJQJLRsI04tCG20SH0d17xWHqm
         2ItYeBidNW/YasFpbVT2UgG8EunZNtwpD6SD2kWxPt6MYYczXEyOMaj7LrAvehCTi8BA
         tR2w==
X-Gm-Message-State: AOAM5313jfNfXTERAxKSfA0MoS0z0tn2D5HPypA5/U6/A5Cq039VF/vm
	c1vNlpc5ZIprw5KI19XraA2LZ9eVLS1qI0wLEl7r48kwXkMO7A==
X-Google-Smtp-Source: 
 ABdhPJyqLeDYGyxM4COlNFPc+o+vmJKN7vNF74Jcv1ou1XR4nYpfXvKJ4urs+T7rCVSq7DljpFICNLAmVMHUIe6OV1Y=
X-Received: by 2002:adf:eccc:0:b0:205:8ee4:b70f with SMTP id
 s12-20020adfeccc000000b002058ee4b70fmr3632836wro.620.1648727771303; Thu, 31
 Mar 2022 04:56:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220331115131.1565450-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20220331115131.1565450-1-richard.purdie@linuxfoundation.org>
From: Ross Burton <ross@burtonini.com>
Date: Thu, 31 Mar 2022 12:56:00 +0100
Message-ID: 
 <CAAnfSTuHd-w6pZTAjXyOx9nw9Sb4Vh1N3Htg6TucFGh+vy_53A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] modutils-initscripts: Change license PD ->
 MIT
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 11:56:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163813

+1 on this.  Much happier looking code.

Ross

On Thu, 31 Mar 2022 at 12:51, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> The file was originally added to OE here:
> https://git.openembedded.org/openembedded/commit/modutils/files/modutils.sh?id=3b3989442075d0a4c6c32cb187de17d87bf65fbd
>
> and the license added here as "PD":
> https://git.openembedded.org/openembedded/commit/modutils/modutils-initscripts.oe?id=4f7d2b1b63d166e5de146d71e5c942419424446e
>
> As "Public Domain", we can re-license it to MIT, which fits in with the rest of
> our metadata and has an SPDX identifier, so lets do that and try and keep our
> licenses simpler.
>
> This also them removes the need for a weird license patch in SRC_URI.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-kernel/modutils-initscripts/files/PD.patch   | 8 --------
>  .../recipes-kernel/modutils-initscripts/files/modutils.sh | 4 ++++
>  .../modutils-initscripts/modutils-initscripts.bb          | 7 +++----
>  3 files changed, 7 insertions(+), 12 deletions(-)
>  delete mode 100644 meta/recipes-kernel/modutils-initscripts/files/PD.patch
>
> diff --git a/meta/recipes-kernel/modutils-initscripts/files/PD.patch b/meta/recipes-kernel/modutils-initscripts/files/PD.patch
> deleted file mode 100644
> index 21ac49cbd8d..00000000000
> --- a/meta/recipes-kernel/modutils-initscripts/files/PD.patch
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -Upstream-Status: Inappropriate [licensing]
> -
> -Index: modutils-initscripts-1.0/LICENSE
> -===================================================================
> ---- /dev/null  1970-01-01 00:00:00.000000000 +0000
> -+++ modutils-initscripts-1.0/LICENSE   2010-12-06 14:26:03.570339002 -0800
> -@@ -0,0 +1 @@
> -+Public Domain
> diff --git a/meta/recipes-kernel/modutils-initscripts/files/modutils.sh b/meta/recipes-kernel/modutils-initscripts/files/modutils.sh
> index 67e1dcd9907..e9aaa66cb71 100755
> --- a/meta/recipes-kernel/modutils-initscripts/files/modutils.sh
> +++ b/meta/recipes-kernel/modutils-initscripts/files/modutils.sh
> @@ -1,4 +1,8 @@
>  #!/bin/sh
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
>  ### BEGIN INIT INFO
>  # Provides:          module-init-tools
>  # Required-Start:
> diff --git a/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb b/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb
> index aa71309126f..8f4fdd76bfb 100644
> --- a/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb
> +++ b/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb
> @@ -1,9 +1,8 @@
>  SUMMARY = "Initscript for auto-loading kernel modules on boot"
>  SECTION = "base"
> -LICENSE = "PD"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=7bf87fc37976e93ec66ad84fac58c098"
> -SRC_URI = "file://modutils.sh \
> -          file://PD.patch"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://modutils.sh;beginline=3;endline=3;md5=b2dccaa94b3629a08bfb4f983cad6f89"
> +SRC_URI = "file://modutils.sh"
>
>  PR = "r7"
>
> --
> 2.32.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163810): https://lists.openembedded.org/g/openembedded-core/message/163810
> Mute This Topic: https://lists.openembedded.org/mt/90152715/1676615
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ross@burtonini.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

