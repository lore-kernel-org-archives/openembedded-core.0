Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77731C04FDE
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 10:27:29 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.39792.1670840842484727659
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Dec 2022 02:27:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=axyrQqdu;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id b9so12014036ljr.5
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Dec 2022 02:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V3AM9qK500iT3gB9iLKzBI2AH32zYkGx0BvFoowdvG0=;
        b=axyrQqdukNQdXWP32xBH3bClosqKOV6bWG00+vpyNscOo4V3Dg0dOkfBECQ466jniI
         vVjDFMCljI2wufl3bFtX7fF8dm572nnLD97oYJwfCwhSDdYme2lvCHNoDDArjkWGrJAT
         2VpRkJKG9MagTD8kbgt3y95D5PuNY7iIp8JrwKEdmy6nO80J8UcmETOPsHS1hCqamCx9
         S8LAwmRJSfo04pHtJxSGY59RYtY5TQrOw4Zu66F55u1t4jo3C717vV6B0xBa4NirZfn5
         7fAThdJ2P/GbEbctZFsyzDcB7Dx55+rr6scStZiSRVTDgV5K7nMaox1B9Yz2mVEiM2Cg
         Xkqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V3AM9qK500iT3gB9iLKzBI2AH32zYkGx0BvFoowdvG0=;
        b=ew/IEI+PyT4ORRF33g45HRA42Q5x8XfATHtbTyU7SR5qFPPpO/PsKQ0qpTM9+Ep9rc
         2HJmoeKUsDEpiSZuAx/B/5SJ4jt9EzN0B+rJSAU6JVoO6JsBjsR1Lj6xYAhWzXHOo4pP
         1GOR1xkSsEXbZDilJ+VAwhtqxutQttbhoFkSgPrmzaUiLmdXguGBnqE+B5JyQwPCxaQ7
         4ttQSZnGGt6Hsd6J9eHLEtrZrjVfBG0OIwGqrF7mpJ624v7drnT1Y6Mnm+/t6nIlqR5v
         GsxuwQiniJaEu3zDttiydQ0eLC8KqQB6ZiArnBTby9y5psARLzNSiGbZpeO1f1TG9L8j
         vC+g==
X-Gm-Message-State: ANoB5pmtZ2tFggpgF6J2Q3ArLzDzXw2WygakoMuPp5dEOBxBw/WFuJEv
	H43hoe4VrhlDSZIXPzjq6lEdzNERyX7zwuoClCBJUC8nMDE=
X-Google-Smtp-Source: AA0mqf5/YgD9qUAgQR2V/5V269JwGV8Yy2vaC6p10HvW5rRg0ysgHb5lIKWCwyvytb/uX53+rGVaCyk9choJJBpeLhI=
X-Received: by 2002:a2e:7818:0:b0:279:bf32:34dd with SMTP id
 t24-20020a2e7818000000b00279bf3234ddmr13337991ljc.31.1670840840425; Mon, 12
 Dec 2022 02:27:20 -0800 (PST)
MIME-Version: 1.0
References: <20221205095151.3820258-1-mingli.yu@eng.windriver.com>
 <CANNYZj9RXtEWM_NoQJsC7Ej9W4k97BenfaPWccyypAxme0eobw@mail.gmail.com>
 <CO1PR11MB5009CDFE37A343FF56CC29CAF11C9@CO1PR11MB5009.namprd11.prod.outlook.com>
 <CANNYZj94jqX06EqVxMmCDrJcuo7fr4rQvJ-6L7rJALZUzUvwgA@mail.gmail.com> <CO1PR11MB5009C30880A024CEA0FF9F5FF1E29@CO1PR11MB5009.namprd11.prod.outlook.com>
In-Reply-To: <CO1PR11MB5009C30880A024CEA0FF9F5FF1E29@CO1PR11MB5009.namprd11.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 12 Dec 2022 11:27:08 +0100
Message-ID: <CANNYZj_605Sfbr4pHUoy_hhvKKpGrUtqMDHjcRhhUDq_jn39yg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] xorg-driver-common: add opengl to REQUIRED_DISTRO_FEATURES
To: "Yu, Mingli" <Mingli.Yu@windriver.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Dec 2022 10:27:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174491

"libmali-xlnx PROVIDES virtual/libgbm but was skipped: incompatible
with machine qemux86-64 (not in COMPATIBLE_MACHINE)"

This is the key error. Why is libmali being set as the libgbm provider
if it's not compatible?

Alex

On Mon, 12 Dec 2022 at 11:20, Yu, Mingli <Mingli.Yu@windriver.com> wrote:
>
> Hi Alex,
>
> Not only xf86-video-amdgpu_22.0.0.bb needs the REQUIRED_DISTRO_FEATURES = "opengl", there still comes below error if we only add REQUIRED_DISTRO_FEATURES = "opengl" for xf86-video-amdgpu_22.0.0.bb.
> ERROR: Nothing PROVIDES 'virtual/libgbm' (but /build/layers/oe-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.4.bb DEPENDS on or otherwise requires it)
> libmali-xlnx PROVIDES virtual/libgbm but was skipped: incompatible with machine qemux86-64 (not in COMPATIBLE_MACHINE)
> ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
> Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'xf86-input-mouse', 'virtual/xserver', 'virtual/libgbm']
>
> Thanks,
>
> ________________________________
> From: Alexander Kanavin <alex.kanavin@gmail.com>
> Sent: Friday, December 9, 2022 17:05
> To: Yu, Mingli <Mingli.Yu@windriver.com>
> Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org>
> Subject: Re: [OE-core] [PATCH 1/2] xorg-driver-common: add opengl to REQUIRED_DISTRO_FEATURES
>
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> Hello,
>
> this means that xf86-video-amdgpu_22.0.0.bb needs the
> REQUIRED_DISTRO_FEATURES = "opengl"
> line, but other x11 recipes do not need to be changed.
>
> Alex
>
> On Fri, 9 Dec 2022 at 05:10, Yu, Mingli <Mingli.Yu@windriver.com> wrote:
> >
> > Hi Alex,
> >
> > The error as below:
> > ERROR: Nothing PROVIDES 'virtual/libgbm' (but /build/layers/meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-amdgpu_22.0.0.bb DEPENDS on or otherwise requires it). Close matches:
> >   virtual/libc
> >   virtual/libomxil
> >   virtual/libusb0
> > ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
> > Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'xf86-video-amdgpu', 'virtual/libgbm']
> >
> > Thanks,
> > ________________________________
> > From: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org> on behalf of Alexander Kanavin <alex.kanavin@gmail.com>
> > Sent: Monday, December 5, 2022 18:04
> > To: Yu, Mingli <Mingli.Yu@windriver.com>
> > Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org>
> > Subject: Re: [OE-core] [PATCH 1/2] xorg-driver-common: add opengl to REQUIRED_DISTRO_FEATURES
> >
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender and know the content is safe.
> >
> > Both of these patches seem very wrong. X11 definitely does not require
> > opengl. I just confirmed it by building xf86-input-synaptics without
> > opengl in DISTRO_FEATURES.
> >
> > Can you show how the issue can be reproduced on plain poky? It seems
> > like your local config or distro or BSP layer does something which
> > triggers this.
> >
> > Alex
> >
> >
> >
> > On Mon, 5 Dec 2022 at 10:51, Yu, Mingli <mingli.yu@eng.windriver.com> wrote:
> > >
> > > From: Mingli Yu <mingli.yu@windriver.com>
> > >
> > > xf86-input-synaptics depends on virtual/xserver which needs opengl
> > > DISTRO_FEATURES, so add opengl distro check also for xf86-input-synaptics.
> > >
> > > Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> > > ---
> > >  meta/recipes-graphics/xorg-driver/xorg-driver-common.inc | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
> > > index 8b3f19426b..3fc54af3e4 100644
> > > --- a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
> > > +++ b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
> > > @@ -17,7 +17,7 @@ XORGBUILDCLASS ??= "autotools"
> > >  inherit ${XORGBUILDCLASS} pkgconfig features_check
> > >
> > >  # depends on virtual/xserver
> > > -REQUIRED_DISTRO_FEATURES = "x11"
> > > +REQUIRED_DISTRO_FEATURES = "x11 opengl"
> > >
> > >  # FIXME: We don't want to include the libtool archives (*.la) from modules
> > >  # directory, as they serve no useful purpose. Upstream should fix Makefile.am
> > > --
> > > 2.25.1
> > >
> > >
> > >
> > >

