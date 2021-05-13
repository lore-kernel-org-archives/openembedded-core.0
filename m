Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web12.610.1620922886844348901
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 May 2021 09:21:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eDHd3bki;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id a2so26013481qkh.11
        for <openembedded-core@lists.openembedded.org>; Thu, 13 May 2021 09:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G1W9KIMJy4JJzv3fu1TUA3tTX1su09deE2Hi1sQtQ54=;
        b=eDHd3bkiUr+WGc2Z8WRR0Gn7WkfyViX+PpHw+QoAyr2JusyUNhdetRa7Iqq97DplsD
         B/MVrKzZGLHZEyEhB+dTDU1Azii7U9Jv5rOtOBRkpUfF1MCZEiu8oWFOGoPvu2rmiIBC
         5B7goUn2FSKVM/LRnQ957vHzUVL2UVZ05WZ8sJ6piZfbV3boe1KTEf1hfq5rKJjWpzD3
         7p9Xy2ra3PKljGSaWoVxWQwXCgZSEc2V1tj5NWl1F6tjudnpsCVu9F1Up1qRjNZp8B7n
         RflzioKT0T3uziF6r1Bf7p1dMygCV5jMQhlAvWt/v8g561Czo2pAGrPYiPIjzWjqmpdU
         kugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G1W9KIMJy4JJzv3fu1TUA3tTX1su09deE2Hi1sQtQ54=;
        b=lronKqajvobo/uPEy0F/TG1j7TFQ1hHBU2Emhj6leC9vfozm9aG/GzY2wrrGvWrtd4
         sXgBCe3Ke9S1TeQL6RstAyagvFBZxDied4J1TeKhh/xSQwSy+syA0l+T45oGkgQcn7cf
         /KsA6iNe/92xc0W0UbeYb6aLZhqG5SE5WvK+0Zsx408sFBfgcDUdcV9nWvf88xRoMzl0
         qsoj2N4p5LCFTvgLiO3e81XkOWz4nl3eAghAivqsCxxM6Y7OtDnL/UjFSiAfRhvMCNKx
         2QR6KEylZIg7o7DbubMCpTnzyvtcPWlR8/wXwjA4ugCqEZlH6ExhCiiOGaWKrw5Mjtd9
         YmNQ==
X-Gm-Message-State: AOAM530JuPKPoVcGYVh2+zydsFTXwcpm+jtLihl7TG4+W2mNxzhfWNEd
	2CpRe5d4j+FC9JIEFTtWPsMVF5jdebd/FeZwkeCGGbz30RU=
X-Google-Smtp-Source: ABdhPJwJqlT7L0yyTIEvSb/lcOAK0CED2oB3Mask6W6/WXjurGYVNbotfrmcHa08XyE0RNvU+5Al8ZyXLyMf3iYTL54=
X-Received: by 2002:a37:444a:: with SMTP id r71mr1710176qka.381.1620922885851;
 Thu, 13 May 2021 09:21:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210513161524.3167085-1-mac@mcrowe.com>
In-Reply-To: <20210513161524.3167085-1-mac@mcrowe.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 13 May 2021 09:20:59 -0700
Message-ID: <CAMKF1soUT-kwS3SZZhUnQnRtMeh2SDjXuMkxB3EuwXfEgcjFVg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] libnotify: Make gtk+3 dependency optional
To: yocto@mac.mcrowe.com
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, Mike Crowe <mac@mcrowe.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, May 13, 2021 at 9:15 AM Mike Crowe via lists.openembedded.org
<yocto=mac.mcrowe.com@lists.openembedded.org> wrote:
>
> libnotify only requires gtk+3 for its tests. Let's disable them by
> default.
>
> Signed-off-by: Mike Crowe <mac@mcrowe.com>
> ---
>  meta/recipes-gnome/libnotify/libnotify_0.7.9.bb | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb b/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb
> index bbbd72193e..0dc3dc3a3c 100644
> --- a/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb
> +++ b/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb
> @@ -9,15 +9,16 @@ SECTION = "libs"
>  LICENSE = "LGPLv2.1"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
>
> -DEPENDS = "dbus gtk+3 glib-2.0"
> +DEPENDS = "dbus glib-2.0 gdk-pixbuf"
> +
> +PACKAGECONFIG ?= ""
> +PACKAGECONFIG[gtk+] = "-Dtests=true,-Dtests=false,gtk+3"
>
perhaps knob should be called 'tests'

>  GNOMEBASEBUILDCLASS = "meson"
>  GTKDOC_MESON_OPTION = "gtk_doc"
>  GIR_MESON_ENABLE_FLAG = "enabled"
>  GIR_MESON_DISABLE_FLAG = "disabled"
>  inherit gnomebase gtk-doc features_check gobject-introspection
> -# depends on gtk+3
> -ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>

do we need to check for them when tests are enabled ?

>  SRC_URI[archive.md5sum] = "ccd9c53364174cc8d13e18a1988faa76"
>  SRC_URI[archive.sha256sum] = "66c0517ed16df7af258e83208faaf5069727dfd66995c4bbc51c16954d674761"
> --
> 2.30.2
>
>
> 
>
