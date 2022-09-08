Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EBC3ECAAD3
	for <webhook@archiver.kernel.org>; Thu,  8 Sep 2022 02:20:28 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web12.679.1662603624431827866
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 19:20:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=R0gOJ1ix;
 spf=pass (domain: gmail.com, ip: 209.85.210.49, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f49.google.com with SMTP id
 q39-20020a056830442700b0063889adc0ddso11501558otv.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 19:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=LUuIfUgnP0Pt3CKTO49TIuAmHdUNcvEuQ+1FPCzykzo=;
        b=R0gOJ1ixTCB7ePxjD3erV+eJqYjun1ZRv3sTawhBB80Hp1eYD9u24yGZjmH5UyPoz7
         COwhJKMtTkvXCnV5jTV/rrL79+eYdlJ028FBzsZIlZwTLrLQJF4xk/FmCU39rRu3+6f3
         DY6vOC9O3g2TLHqFXaYYSoI/5lY5QUAG4tQeyTFebT4oqfkxzjtzFm0j2u8legD04aD0
         YDKpp8BEItX1GlteEKnTgA348LjJ0Z16A/tCs3spnepXGWdPiM4o5sccNKkB6j8vJP5p
         C1SVpGF+A6X+9saTWbQE3TVY0t/Bif+uXBefKZPcQJBmF6c+gyYpnH/PFYueVOpFAUhg
         fbNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=LUuIfUgnP0Pt3CKTO49TIuAmHdUNcvEuQ+1FPCzykzo=;
        b=bklZSXkPS/OXp9iJdrNZaoGw+jjBd5NvzC1ApfbdQbwr7+t4rouL0z8v+qoFTAPtk2
         5tLbbW14qlQg9mIfZNcG9jWu5o3S9g9PmQj+PmeHAng0beUnkUL3TDeXIr8LbwnShjgJ
         N30rbQBdqyZvzc/I9IovuUmHXSubt2MeSzEUefiBJp+BLAIrwe2eXAqw2QahULA9GFca
         /b72bDf6oWzFPGB2yKuT/f2Q1OEAbgwi8OhM7DWsHIXFPMJ0xt8yMycow8j7nUrBnhwQ
         BJT5udFslMAFCEiUvBpF+xP2CbOrGZ2/TTayVC98M7MuKVPWmZQF6WEN4Ssgdrxq4tNh
         i2Lw==
X-Gm-Message-State: ACgBeo37QxzfKJ/cW8FuS+7eIlBWlXGb7msObKWnCwA+HX7ySK0KXQny
	Mmodv4qWF2oBDrLJLL+uqXkfQgk0U5XQBfb5zHI=
X-Google-Smtp-Source: 
 AA6agR73okB6g/z85Gmt/UndzvPQBQyEh6Aij/99dPvHgshs2Z/MHsENszoBBJ4NRajUh3BTsTrGipOXR7UipcfkER0=
X-Received: by 2002:a05:6830:22e7:b0:637:3879:3d5e with SMTP id
 t7-20020a05683022e700b0063738793d5emr2589871otc.111.1662603623617; Wed, 07
 Sep 2022 19:20:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220903092100.3544874-1-raj.khem@gmail.com>
 <468d4b98-b086-c5db-281d-678c21522492@windriver.com>
In-Reply-To: <468d4b98-b086-c5db-281d-678c21522492@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 7 Sep 2022 19:19:57 -0700
Message-ID: 
 <CAMKF1sqBszEhk9GwnQJ_496Vpki5JftokgUfSJPBcYyp_TNnNg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] webkitgtk: Update to 2.6.37
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Sep 2022 02:20:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170438

On Wed, Sep 7, 2022 at 6:43 PM Yu, Mingli <mingli.yu@windriver.com> wrote:
>
>
> Fail to build on beaglebone-yocto.
>
> /build/tmp-glibc/work/cortexa8hf-neon-wrs-linux-gnueabi/webkitgtk/2.36.7-r0/webkitgtk-2.36.7/Source/W
> ebCore/platform/graphics/filters/FELighting.h:72:41: error:
> 'LightingData' does not name a type
>     72 |     inline void platformApplyNeon(const LightingData&, const
> LightSource::PaintingData&);
>        |                                         ^~~~~~~~~~~~
>

there is a proposed patch upstream. I have taken that and applied. The
patch is on ml.
while you are at it. Please test that patch out and report if the
issue is solved.

> Thanks,
>
> On 9/3/22 17:21, Khem Raj wrote:
> > [Please note: This e-mail is from an EXTERNAL e-mail address]
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >   .../webkit/{webkitgtk_2.36.6.bb => webkitgtk_2.36.7.bb}        | 3 +--
> >   1 file changed, 1 insertion(+), 2 deletions(-)
> >   rename meta/recipes-sato/webkit/{webkitgtk_2.36.6.bb => webkitgtk_2.36.7.bb} (98%)
> >
> > diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb b/meta/recipes-sato/webkit/webkitgtk_2.36.7.bb
> > similarity index 98%
> > rename from meta/recipes-sato/webkit/webkitgtk_2.36.6.bb
> > rename to meta/recipes-sato/webkit/webkitgtk_2.36.7.bb
> > index 37b977f9ba..026e24ae39 100644
> > --- a/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb
> > +++ b/meta/recipes-sato/webkit/webkitgtk_2.36.7.bb
> > @@ -16,8 +16,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
> >              file://reproducibility.patch \
> >              file://0001-When-building-introspection-files-do-not-quote-CFLAG.patch \
> >              "
> > -
> > -SRC_URI[sha256sum] = "1193bc821946336776f0dfa5e0dca5651f1e57157eda12da4721d2441f24a61a"
> > +SRC_URI[sha256sum] = "0c260cf2b32f0481d017670dfed1b61e554967cd067195606c9f9eb5fe731743"
> >
> >   inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
> >
> > --
> > 2.37.3
> >
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#170267): https://lists.openembedded.org/g/openembedded-core/message/170267
> > Mute This Topic: https://lists.openembedded.org/mt/93436476/3618448
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mingli.yu@windriver.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

