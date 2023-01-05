Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFCBCC3DA7A
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 19:58:02 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web11.3851.1672948675272688748
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jan 2023 11:57:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FTTy4Eux;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-1433ef3b61fso44074921fac.10
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Jan 2023 11:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JupH7ZRyUkVPEBaFR2em7r5jcpQlu52ROiphPruUayY=;
        b=FTTy4EuxhfMjURbj/KAc6asZxQrVp3+d+Oco48yrt0Xn8+BEc0uaaC4cmLDY6eOlkD
         um/dRH87ndKrnkivprQJhnq9cv51oIprxNEaZTdjwowHVjB3QuzFQd8XRFCgEeWxsojo
         h7rsTnP46yJgPCzIc5z6dtxQbvivH4NyI11hp2zpkKfIdfT9VTkCYqTWgICKqcnCQMwa
         npOXkiZI2pyAJQFFpeSS9LzmA2VxHsbnALN/AeYhKs4Y0F73erXLJu1cKbShF/1IY65E
         aKNjKsq+JbSDQMuHbZHTTdqt46rtKCzxws7MFmJ/8KHhVWA9Ufof6Pcb1taHSrXgiWyd
         13yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JupH7ZRyUkVPEBaFR2em7r5jcpQlu52ROiphPruUayY=;
        b=14aFp5CzN1QVWHe6B7W5yvJSntGw5D2jigXBaTDLOwAKSYXlRYHXOQ/knBcXG3sElL
         tYIJssneYxRFo9AMI+p/1UIRx1LfKTVMsse1LE6Ufjdv2pWio2PXRSWwyLiCGk7Jt3aa
         sM5E8F+VFnoEx50jrQ1XPtfhX+NgIDjbCCM1rQor51a6P0BpN9yO+vML6QHVlFvO1ozW
         S4vR6edS1oAuNp5+yV9+NiUkhXG7vlQROu2bmhMO2ZhM9RsQaJArl63BvQGzMmT3lmc/
         BwBK0/GBVsJCq39IehMSn6G+xB4Y0Ul0Xv5wjgRDhiB+MosUzOV5H7I6WpFRu4e7SPgQ
         pZNA==
X-Gm-Message-State: AFqh2kosr/3neTYx45nfoMwnRQEDwVFQwpgLEslfNRTPI+FzC6OHt8WI
	NDO3zvnn9ooE1VbNlM21j6xUEiEtkosYHJzgqGc=
X-Google-Smtp-Source: AMrXdXvf3efRNo0G//9KwHqrnsbAps1acEsof76uh7W/ViSLi1ZkBeEYCVFlJEmWS32JyBon59bSaCOJg+f0wLrjvxc=
X-Received: by 2002:a05:6870:b01d:b0:144:e1eb:419 with SMTP id
 y29-20020a056870b01d00b00144e1eb0419mr3684680oae.262.1672948674342; Thu, 05
 Jan 2023 11:57:54 -0800 (PST)
MIME-Version: 1.0
References: <20230101132326.398971-1-f_l_k@t-online.de>
In-Reply-To: <20230101132326.398971-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 5 Jan 2023 11:57:28 -0800
Message-ID: <CAMKF1srnx4w1Vm=KxmM+LCnLdOCbWgOj6BkhpVZTx133P0_95Q@mail.gmail.com>
Subject: Re: [oe-core][PATCH] gtk4: update 4.8.2 -> 4.8.3
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org, 
	Alexandre BELLONI <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jan 2023 19:58:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175548

I am seeing native build failure

https://errors.yoctoproject.org/Errors/Details/686967/

On Sun, Jan 1, 2023 at 5:23 AM Markus Volk <f_l_k@t-online.de> wrote:
>
> Overview of Changes in 4.8.3, 12-22-2022
> ========================================
>
> * GtkText:
>  - Claim gestures more selectively
>  - Prevent unexpected notify::direction emissions
>
> * Accessibility:
>  - Remember if we don't find the a11y bus
>
> * DND:
>  - Prefer file:// urls over other protocols
>
> * GtkMountOperation:
>  - Work on Wayland
>
> * GtkListView:
>  - Cancel rubberband if not handling drag
>
> * Wayland:
>  - Fix button masks
>
> * Windows:
>  - Fix resizes with native decorations
>
> * X11:
>  - Fix some ordering problems with surface destruction
>
> * Translation updates
>  Abkhazian
>  Basque
>  Dutch
>  Hungarian
>  Interlingue
>  Georgian
>  Persian
>  Russian
>  Spanish
>  Turkish
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta/recipes-gnome/gtk+/{gtk4_4.8.2.bb => gtk4_4.8.3.bb} | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>  rename meta/recipes-gnome/gtk+/{gtk4_4.8.2.bb => gtk4_4.8.3.bb} (98%)
>
> diff --git a/meta/recipes-gnome/gtk+/gtk4_4.8.2.bb b/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb
> similarity index 98%
> rename from meta/recipes-gnome/gtk+/gtk4_4.8.2.bb
> rename to meta/recipes-gnome/gtk+/gtk4_4.8.3.bb
> index fe18fa2ffd..6101905128 100644
> --- a/meta/recipes-gnome/gtk+/gtk4_4.8.2.bb
> +++ b/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb
> @@ -37,7 +37,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
>  UPSTREAM_CHECK_REGEX = "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.xz"
>
>  SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-${PV}.tar.xz"
> -SRC_URI[sha256sum] = "85b7a160b6e02eafa4e7d38f046f8720fab537d3fe73c01c864333a983a692a9"
> +SRC_URI[sha256sum] = "b362f968d085b4d3d9340d4d38c706377ded9d5374e694a2b6b7e6292e3cba74"
>
>  S = "${WORKDIR}/gtk-${PV}"
>
> @@ -106,7 +106,6 @@ GTKBASE_RRECOMMENDS ?= " \
>      adwaita-icon-theme-symbolic \
>  "
>
> -
>  GTKBASE_RRECOMMENDS:class-native ?= ""
>
>  GTKGLIBC_RRECOMMENDS ?= "${GTKBASE_RRECOMMENDS} glibc-gconv-iso8859-1"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175185): https://lists.openembedded.org/g/openembedded-core/message/175185
> Mute This Topic: https://lists.openembedded.org/mt/95987319/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

