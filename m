Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67915C433F5
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 20:11:35 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web08.1514.1642709494215441632
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 12:11:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WcqXMgEZ;
 spf=pass (domain: gmail.com, ip: 209.85.160.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id 14so7657328qty.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 12:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YJ/vj4FbAVPZeRniYwwpu/72H6Zly7CEJ73zP8R6B4I=;
        b=WcqXMgEZjrptKjLvjlATLuQ2BTWFMdeWadMsX/QBd0FESDcPx08EDzrtBSswLxuIYp
         EXsKg/QEc6U0R6+M4rSTmH022YxNWStCydnGDexFHv9JAEZ+VQ1yHOzskGy9PPzgxt/6
         TU30s4dNcG7WZ5klv6/NZKYKOBRqc5EhUCNiWBflkMPFtSya9017lbl+H9YktQWBQyaq
         CPn9n5NW0eDNEbTKqHJCLpGaTdY/gWIrm4XZXk9DjXPGFuUAP2DOQx+vvHRc+Kv3OhJG
         AzOSbFb3UG6oxASb3NXeOahLmvRv8RuDQ4KBlUhaksu6Xil467HNkgMOvnNF9PGszDKw
         vEiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YJ/vj4FbAVPZeRniYwwpu/72H6Zly7CEJ73zP8R6B4I=;
        b=IXGTzjGWTXn2ViQeMV71eEVWICTmzHz+H3YAM6cmwPp8b9OAcsgLYIHllSjET/Wfhg
         ujoijmANbb3B8cgbQiA7pgohM+VBAjhEhbyQMyxQehNAr7Si31lqY5rb8zlsqzzM8ZiL
         MJdCXd2HE3zH7+TvEIxtj0OkRMC4bLeJDkqHyp+u58bPqZvl9Wb0Bq1JUq2lKGChm0M5
         1EgjBpsIX5zPYwTAmfuha+VnztJ7IZfNPfQAuJ5N88U6ISgPNNvkEkCpZCFYpN1kOOYN
         90mU0oTe+wDmJoSHFsWHUNG4d2N9ZLyN4SMwFVp9N7kEbANBELE7Ih84kR3xKQh996nR
         HCQw==
X-Gm-Message-State: AOAM532uYfFbLd2CsLy3EVGY1iIJCO7U2pYjD3Ahhl9yJkQEjLNyWp/o
	MwJA2JRaDPWmGRNkei5OKlEzKogfs2b0frFxPiI=
X-Google-Smtp-Source: 
 ABdhPJw24CxWDNtDIx4fcGIRPxMB7tXr746D3P4JUjpIX0NR6DmZBcJgP5jCqNUBX7cgcWNeOAMRt2IfakSLVUXI8TM=
X-Received: by 2002:a05:622a:1350:: with SMTP id
 w16mr649936qtk.532.1642709493197;
 Thu, 20 Jan 2022 12:11:33 -0800 (PST)
MIME-Version: 1.0
References: <20220120151824.61601-1-f_l_k@t-online.de>
 <20220120151824.61601-2-f_l_k@t-online.de>
In-Reply-To: <20220120151824.61601-2-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Jan 2022 12:11:07 -0800
Message-ID: 
 <CAMKF1soam8JqD=T8tD+2gMX4rkdzb790dsOOkPMachEHTsFbnw@mail.gmail.com>
Subject: Re: [OE-core] [meta-gnome][PATCH 2/2] folks: initial add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 20:11:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160779

fails to configure

https://errors.yoctoproject.org/Errors/Details/622929/

On Thu, Jan 20, 2022 at 7:18 AM Markus Volk <f_l_k@t-online.de> wrote:
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../folks/folks_0.15.4.bb                     | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb
>
> diff --git a/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb b/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb
> new file mode 100644
> index 000000000..e7160bde9
> --- /dev/null
> +++ b/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb
> @@ -0,0 +1,23 @@
> +SUMMARY = "Folks is a contact aggregation library."
> +LICENSE = "LGPLv2.1"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
> +
> +DEPENDS = " \
> +    glib-2.0 \
> +    libgee \
> +    dbus-glib \
> +    telepathy-glib \
> +"
> +
> +GNOMEBASEBUILDCLASS = "meson"
> +
> +# gobject-introspection is mandatory and cannot be configured
> +REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
> +GIR_MESON_OPTION = ""
> +
> +EXTRA_OEMESON = "-Deds_backend=false -Dbluez_backend=false -Dofono_backend=false -Dtelepathy_backend=false"
> +
> +inherit gnomebase gettext gobject-introspection vala features_check
> +
> +SRC_URI[archive.sha256sum] = "e71099afc9e88fad4e757ae134bc3fd63e12b901ad62b0ed5536afb79124af5f"
> +
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160768): https://lists.openembedded.org/g/openembedded-core/message/160768
> Mute This Topic: https://lists.openembedded.org/mt/88560749/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

