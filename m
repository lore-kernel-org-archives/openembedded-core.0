Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE3A1C433EF
	for <webhook@archiver.kernel.org>; Fri, 29 Oct 2021 18:04:57 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web08.9321.1635530696916588554
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Oct 2021 11:04:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Dr25k+M8;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id b11so3504246qvm.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Oct 2021 11:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y0ILAWPCHP0Xw83alqBtLSctZZzDLdK+Q3bHgYktVZo=;
        b=Dr25k+M8Fs9BmzOpv10KIwcsElgTf6huq8zWxBSq3vdItpBSSN4tfqfGiSukHHM9yb
         //ACbPwgBhsErIftJ9tiPD9OuBxWXBDU5wkADnodaaRD6Mdx+HZATp2SVL1yCUkVdv9n
         ttcQnni0wP4TWgcMOKYGsCaXQftY5seTXbjfDap7A1Giun7/gu1M2huy1KQqVe1o2ONR
         YQOC/LtzLyltyUBnXEnCk1yJE+Rt5hmc/6my5S0g7Eh11+m3EntKf9b6iF3HYyHluDVu
         0jH17k1o3UjdnL37kAaKBhz2ViYYcJaKk/zELdkXijbLX/UmIZUpBpdf25jcZA3KHzJ5
         EjCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y0ILAWPCHP0Xw83alqBtLSctZZzDLdK+Q3bHgYktVZo=;
        b=XkZZ7ORH9yUGoOCKc2JypcN1wjdiDT/WsG0PJaP0HaAmU0gZLHF0zPJVRiBATuRrX1
         TJvFV/Aplg0bUIKvgyiAWKN9XNK7VbfoF2Fd1JdOe5eyWwmuWKTV87qVvfjOreRPbDGO
         +2pR+tTam9Da3ghKdQTQ2BrwaIN94KMYIdtdRthG4kUKnveaQjouFA1HtoIuAYTqREWl
         y29lIbwI5jHG2hScsFKAYmnvUMtFhwKODktpBZIsONMwF7TN9CmKyyhdY1bBYpZUIMbM
         3dFOpVtZfCswkVIZMglsvACGO21QVAlx+IACmvkAvSShTXi8VwG86PgcEGk0J2I0kdBC
         DdJA==
X-Gm-Message-State: AOAM530U9D8ZEoqS29BRG/Gh557qcmWjG0gXdceZlJ7Dwpt/aHdnZrc0
	C95YSW2C1LbKNeOu2LuNaH/GkOYsegetV9Mne6LZanxZlYY=
X-Google-Smtp-Source: 
 ABdhPJwtvriwUKVF00ipbKJLYGQ3tL3ShMADHqZWh398ItK1Y8AudRbIR1KnpdYf5rvkwdS8Mk7FKCV38JuERFiUfWE=
X-Received: by 2002:a05:6214:242a:: with SMTP id
 gy10mr12471172qvb.62.1635530695886;
 Fri, 29 Oct 2021 11:04:55 -0700 (PDT)
MIME-Version: 1.0
References: <20211027090736.2546759-1-alex@linutronix.de>
 <20211027090736.2546759-15-alex@linutronix.de>
In-Reply-To: <20211027090736.2546759-15-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 29 Oct 2021 11:04:29 -0700
Message-ID: 
 <CAMKF1sqcKQAQpVNf9d08MF-f-HZv57A3nphbZp7G9XOkBdtRQg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 15/30] wpebackend-fdo: upgrade 1.10.0 -> 1.12.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Oct 2021 18:04:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157634

seeing https://errors.yoctoproject.org/Errors/Details/615439/

On Wed, Oct 27, 2021 at 2:08 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> From: Alexander Kanavin <alex.kanavin@gmail.com>
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  .../{wpebackend-fdo_1.10.0.bb => wpebackend-fdo_1.12.0.bb}      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-sato/webkit/{wpebackend-fdo_1.10.0.bb => wpebackend-fdo_1.12.0.bb} (89%)
>
> diff --git a/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb b/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb
> similarity index 89%
> rename from meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb
> rename to meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb
> index f2d640f07a..ba6c54412a 100644
> --- a/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb
> +++ b/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb
> @@ -13,7 +13,7 @@ inherit meson features_check pkgconfig
>  REQUIRED_DISTRO_FEATURES = "opengl"
>
>  SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
> -SRC_URI[sha256sum] = "b89dfd3500a4dec711132cd7bff72599e67d56a419d000730e14bb99547509cc"
> +SRC_URI[sha256sum] = "6239c9c15523410798d66315de6b491712ab30009ba180f3e0dd076d9b0074ac"
>
>  # This is a tweak of upstream-version-is-even needed because
>  # ipstream directory contains tarballs for other components as well.
> --
> 2.20.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157491): https://lists.openembedded.org/g/openembedded-core/message/157491
> Mute This Topic: https://lists.openembedded.org/mt/86623392/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

