Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A032C4332F
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 09:05:48 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.8895.1670576739566509877
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Dec 2022 01:05:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mRM1YJCj;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id n1so4278790ljg.3
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Dec 2022 01:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MIDP9J4gx0QvgHdyH1rejAhyZKZ6wtU/ALuEKxULtQc=;
        b=mRM1YJCj51arD3duknDd8rwyeGo+HTFOx4DiMuKUpdgqdDerILxbRsNYJrMDiUmrUZ
         01j90HlMTBNUiKdNSXelcl/rsgbqBGTxl7v19SyqPKx0InMMUt9cBh7E1ysNGyV/KIPw
         6U0eYSkoleKw3aTLSt55eXfR5ZQs14njx6sYY0z9pe8nSxI7ncTQLdVtpeRrF4YhApJg
         2wi8gQuxum+nx2xv5g9J69YfeiEFV3kvKslhfLGVA5ZL9kwc5Ps55ypi3h8YfPRZbzdY
         PdpoO/CNEwJqXhHe8Ae/TdicMId8QoikILWOLus/J0TzKTkuaHAzd9FQeEecaotA08jx
         AHww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MIDP9J4gx0QvgHdyH1rejAhyZKZ6wtU/ALuEKxULtQc=;
        b=H3c6qGhemlkOR1UuS+K1+zTZvhMqMDy3vRO5NO/HS2HvbeoPPGbOUqOu8FhESNt7+O
         LFKOkbFnJHyjSIEHXnCKewCOqmMGvd5uIhDCwnzQEbaKsvXnxONPqD6VWT2bZh1cvvuG
         P5hThjzLALD85LOy/RjL7CQPwjA/K0IJD+3Abzbpr/9LJZ5pQsYyIId5+E/YbpJO2Gdu
         Halp5EH8pRaNpRUZHSnHU2zJSXhJ/Z22y1Bhjz/8nx4i2WWj+spmEIS5rTvlvLUTsM4N
         0Hmtie23QRMDWv+hsasavdMtyvxczA/5co/vsRv3YtK3QeqOMNoABi6B6RByLYsxRWeH
         PJyw==
X-Gm-Message-State: ANoB5pniyfJGPNjzCnataDb+oJKaIQq8u1EQxYyh7fF2yDK7h+N3ACcA
	MH0MJx0a7ZaBhVuBzMLQaEe7pVYAaIo6cJPtXzP1U8P80ko=
X-Google-Smtp-Source: AA0mqf5+Pwd1gE6d+RoJd+Nyskl18FDxzAoIU1R3t1LCJ9EyQRbHQNpfZTLA1Z7WDSIEHuxdgRPTOkF/cxO7n0sqlf8=
X-Received: by 2002:a2e:9584:0:b0:27a:2285:411b with SMTP id
 w4-20020a2e9584000000b0027a2285411bmr1515301ljh.33.1670576737711; Fri, 09 Dec
 2022 01:05:37 -0800 (PST)
MIME-Version: 1.0
References: <20221205095151.3820258-1-mingli.yu@eng.windriver.com>
 <CANNYZj9RXtEWM_NoQJsC7Ej9W4k97BenfaPWccyypAxme0eobw@mail.gmail.com> <CO1PR11MB5009CDFE37A343FF56CC29CAF11C9@CO1PR11MB5009.namprd11.prod.outlook.com>
In-Reply-To: <CO1PR11MB5009CDFE37A343FF56CC29CAF11C9@CO1PR11MB5009.namprd11.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 9 Dec 2022 10:05:26 +0100
Message-ID: <CANNYZj94jqX06EqVxMmCDrJcuo7fr4rQvJ-6L7rJALZUzUvwgA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] xorg-driver-common: add opengl to REQUIRED_DISTRO_FEATURES
To: "Yu, Mingli" <Mingli.Yu@windriver.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Dec 2022 09:05:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174439

Hello,

this means that xf86-video-amdgpu_22.0.0.bb needs the
REQUIRED_DISTRO_FEATURES = "opengl"
line, but other x11 recipes do not need to be changed.

Alex

On Fri, 9 Dec 2022 at 05:10, Yu, Mingli <Mingli.Yu@windriver.com> wrote:
>
> Hi Alex,
>
> The error as below:
> ERROR: Nothing PROVIDES 'virtual/libgbm' (but /build/layers/meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-amdgpu_22.0.0.bb DEPENDS on or otherwise requires it). Close matches:
>   virtual/libc
>   virtual/libomxil
>   virtual/libusb0
> ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
> Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'xf86-video-amdgpu', 'virtual/libgbm']
>
> Thanks,
> ________________________________
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org> on behalf of Alexander Kanavin <alex.kanavin@gmail.com>
> Sent: Monday, December 5, 2022 18:04
> To: Yu, Mingli <Mingli.Yu@windriver.com>
> Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org>
> Subject: Re: [OE-core] [PATCH 1/2] xorg-driver-common: add opengl to REQUIRED_DISTRO_FEATURES
>
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> Both of these patches seem very wrong. X11 definitely does not require
> opengl. I just confirmed it by building xf86-input-synaptics without
> opengl in DISTRO_FEATURES.
>
> Can you show how the issue can be reproduced on plain poky? It seems
> like your local config or distro or BSP layer does something which
> triggers this.
>
> Alex
>
>
>
> On Mon, 5 Dec 2022 at 10:51, Yu, Mingli <mingli.yu@eng.windriver.com> wrote:
> >
> > From: Mingli Yu <mingli.yu@windriver.com>
> >
> > xf86-input-synaptics depends on virtual/xserver which needs opengl
> > DISTRO_FEATURES, so add opengl distro check also for xf86-input-synaptics.
> >
> > Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> > ---
> >  meta/recipes-graphics/xorg-driver/xorg-driver-common.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
> > index 8b3f19426b..3fc54af3e4 100644
> > --- a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
> > +++ b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
> > @@ -17,7 +17,7 @@ XORGBUILDCLASS ??= "autotools"
> >  inherit ${XORGBUILDCLASS} pkgconfig features_check
> >
> >  # depends on virtual/xserver
> > -REQUIRED_DISTRO_FEATURES = "x11"
> > +REQUIRED_DISTRO_FEATURES = "x11 opengl"
> >
> >  # FIXME: We don't want to include the libtool archives (*.la) from modules
> >  # directory, as they serve no useful purpose. Upstream should fix Makefile.am
> > --
> > 2.25.1
> >
> >
> >
> >

