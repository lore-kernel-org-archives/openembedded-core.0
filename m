Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BBFAC433F5
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 20:28:32 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web12.1814.1642710511145468930
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 12:28:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KGIbm1nX;
 spf=pass (domain: gmail.com, ip: 209.85.222.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id s12so7497183qkg.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 12:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Yc64+ArAIFk16K8SMQUH2Jlv5bfqfBXk912j6qPQ0s0=;
        b=KGIbm1nX9OYX/52y3CiUvHsJr2CqH0RwdgVfw7rFd+ZxrGsYbfdzPChQwmE7uE9xan
         NvZXjQOdZv3gOBL5PzpGdraNE8vTyt4DJfzOGlW0502cKeVduj3+jUAEwgudx1mk931n
         Tvvxs7EyW/6sDiPWzej1jRXXZaRkziZhymienoJpy1atVABLlZg496yJf0tC7CeVHJlk
         r7Olg5DLcJH1YqlG3ZBPtACxTQu0Reg44ny/Z7ycDvk/bNpS3g+mz1VH+9CcRiQvBp7Y
         5j4B/S/zbdgxPFS8JJfqslNFYWzTitQlrHXyGd8KjmFgmn341szcgPkOpDARNrj38NoZ
         UNfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Yc64+ArAIFk16K8SMQUH2Jlv5bfqfBXk912j6qPQ0s0=;
        b=uk4EKglguq7mSN7nvtql6S+/pPdj+ZH/urV3GLJ7nUXD6Mr2nN924ynDkoRxwzZE4g
         mYCgDnSbOaDXe9MiU9Cv5xrQp7MkKoQhM7OK2gKUJdO/AN2CDiS8poHej/rnKckEUWQW
         YHljg5nahS8uM+VF7ogwAZE9ROxHbdl51CRLol6hTVyRNu79IJivt6Sd09McTSVxi6Ko
         CdD4nwbPa2STIloE/HV6cYGYXUt6I6Cde9zKB6CB26H5S5yHqdTQ7TxZUvPq3NWSxICX
         jfzap7yYXeu4qKRKhlBm3oI3bGyKyiL7AiMRW/FPxTorlLASecAJliRT0opjkLG3zGcY
         XVaA==
X-Gm-Message-State: AOAM532KUAo1X8w0Y2veDXYyHBG3eh5jieEyttmy1Uz3XdDu4iDXpLSG
	NyIcXQuIPZ0KR5EmClN+wst5EhvPejpsAYv+xnE=
X-Google-Smtp-Source: 
 ABdhPJwkDpUvYLmjuzIuXTYDPbFCmbpj1kgwpEF3NGB63GqNCpibfNQzOfQvtRbJQ6ed22yaa10uMCRyigxxt0qHno8=
X-Received: by 2002:a05:620a:2990:: with SMTP id
 r16mr424152qkp.463.1642710510238;
 Thu, 20 Jan 2022 12:28:30 -0800 (PST)
MIME-Version: 1.0
References: <20220120151824.61601-1-f_l_k@t-online.de>
 <20220120151824.61601-2-f_l_k@t-online.de>
 <CAMKF1soam8JqD=T8tD+2gMX4rkdzb790dsOOkPMachEHTsFbnw@mail.gmail.com>
 <e01a9599-42a7-187d-c72a-2b057652b51b@t-online.de>
In-Reply-To: <e01a9599-42a7-187d-c72a-2b057652b51b@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Jan 2022 12:28:04 -0800
Message-ID: 
 <CAMKF1srAs7Xxcr68xo_S4t48_XE6XSq-ne8Gu+d19DPF+ByM9g@mail.gmail.com>
Subject: Re: [OE-core] [meta-gnome][PATCH 2/2] folks: initial add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 20:28:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160783

I posted the link with error message the specific error is

Run-time dependency libxml-2.0 found: NO (tried pkgconfig)

../folks-0.15.4/meson.build:126:2: ERROR: Dependency "libxml-2.0" not
found, tried pkgconfig

On Thu, Jan 20, 2022 at 12:22 PM Markus Volk <f_l_k@t-online.de> wrote:
>
> mmmh. Whats the error message ?
>
> I can build folks like this for aarch64 and x86-64
>
> Am 20.01.22 um 21:11 schrieb Khem Raj:
> > +SUMMARY = "Folks is a contact aggregation library."
> > +LICENSE = "LGPLv2.1"
> > +LIC_FILES_CHKSUM ="file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
> > +
> > +DEPENDS = " \
> > +    glib-2.0 \
> > +    libgee \
> > +    dbus-glib \
> > +    telepathy-glib \
> > +"
> > +
> > +GNOMEBASEBUILDCLASS = "meson"
> > +
> > +# gobject-introspection is mandatory and cannot be configured
> > +REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
> > +GIR_MESON_OPTION = ""
> > +
> > +EXTRA_OEMESON = "-Deds_backend=false -Dbluez_backend=false -Dofono_backend=false -Dtelepathy_backend=false"
> > +
> > +inherit gnomebase gettext gobject-introspection vala features_check
> > +
> > +SRC_URI[archive.sha256sum] = "e71099afc9e88fad4e757ae134bc3fd63e12b901ad62b0ed5536afb79124af5f"
> > +
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160781): https://lists.openembedded.org/g/openembedded-core/message/160781
> Mute This Topic: https://lists.openembedded.org/mt/88560749/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

