Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52EB9C433F5
	for <webhook@archiver.kernel.org>; Fri, 20 May 2022 08:30:21 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.6471.1653035412891128973
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 May 2022 01:30:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gyBaeJcz;
 spf=pass (domain: gmail.com, ip: 209.85.218.54,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id wh22so14108948ejb.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 20 May 2022 01:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4HEzzJNzbs141AOvXeiIc32VGgMoHIgpS0RweBjIc1U=;
        b=gyBaeJczXm9zqZznt414Pf3MpvioUZop+Fhldpnhd1FA6gE38rRArKYBbds79NVPVG
         /vI5XqZn1Flcuasl5EH2vZIT/BK5ruO1DoPGKUF2XVa1XMvePlF/tjyurmWmbADPh+fB
         RK7fCFfZeN9K87H2G9MeZK56DQgjpo6N5LExExPOiwzy/qMnlfVL7ra8ZSNoXdyq1bME
         jIR7fGPxQABTSHHMhEu40vcbsCCwxgtr0hEM1mTpfGgPSJ+eMlRaTKPzCnaaFSv7TnzO
         PNXIjakie+Ra1DnNFYB3q0ZIjTvu7YdaM7FtVu9F6dD8CdqFn0mRPP7eRg0pRJeE7PCG
         KrAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4HEzzJNzbs141AOvXeiIc32VGgMoHIgpS0RweBjIc1U=;
        b=BD+9ygtvXNaRkOe/vD2xgH0DECEhQo8nWKdiHm62LJS49OA4djXYrRnZSTZlrImOCM
         cA4ovsWzPEUjog2qjf/FzdFislHDnAAx7x+iAKmTO04QUSqLOhiqkmUsOd6S8XlrsSE8
         VFwCkc+slRSiMRGoOpymPad3Qw/fLbDhIStKfINCTZrEDozAL2kt9ii20lgh5V2lFmb8
         hR10nV569cIEn2KmWudXoqjQKC3xil/PLPSP6l1O8LzGxR+o2AS1qS9/+aFV0Gvkc+eZ
         H4k5XRtSIxQWOaC+vZ969gzBFOtwZCOfNy2Xjjpih9Z7SIr7hwG/nBi4nAlrvTAmjbKS
         rWWA==
X-Gm-Message-State: AOAM533g1lo5FbL1qkJJ1Y+vFmLIWMHqdgib77B6jZQpA2kAp5iV1mIX
	Fe3m8/qbx4ode0LbygRSP7EOesVTB+MCCM6Y0Kc=
X-Google-Smtp-Source: 
 ABdhPJzX9V3QH9mVemJDq7cPnevjnJDjd409cfmD4K2odMO6uwCNjrl9pY8X4z0vFvVu2GAkhpd33H+mZbfBWUEu5FI=
X-Received: by 2002:a17:906:c14b:b0:6f8:e6bb:f8d5 with SMTP id
 dp11-20020a170906c14b00b006f8e6bbf8d5mr7645693ejc.4.1653035411249; Fri, 20
 May 2022 01:30:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220516194915.29231-1-alex.kiernan@gmail.com>
 <5ba8ced312bd0426cdec907f0172834f0823b59f.camel@linuxfoundation.org>
In-Reply-To: 
 <5ba8ced312bd0426cdec907f0172834f0823b59f.camel@linuxfoundation.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 20 May 2022 09:29:59 +0100
Message-ID: 
 <CAO5Uq5SksDN-g4wAJowfWExi971UA2F+Kjhd3Zt8DEgdLOou_w@mail.gmail.com>
Subject: Re: [OE-Core][PATCH 1/3] eudev: Convert dependencies to PACKAGECONFIG
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, Alex Kiernan <alexk@zuma.ai>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 May 2022 08:30:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165920

On Fri, May 20, 2022 at 9:24 AM <richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2022-05-16 at 20:49 +0100, Alex Kiernan wrote:
> > GObject support was dropped in 252150e181c5 ("src/gudev: remove Gobject
> > libudev support."), but some gir support appears to still exist.
> >
> > Fill out PACKAGECONFIG options.
> >
> > Signed-off-by: Alex Kiernan <alexk@zuma.ai>
> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > ---
> >  meta/recipes-core/udev/eudev_3.2.11.bb | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/recipes-core/udev/eudev_3.2.11.bb b/meta/recipes-core/udev/eudev_3.2.11.bb
> > index 841039f6d745..0fd1b6ab2283 100644
> > --- a/meta/recipes-core/udev/eudev_3.2.11.bb
> > +++ b/meta/recipes-core/udev/eudev_3.2.11.bb
> > @@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
> >  LICENSE:libudev = "LGPL-2.1-or-later"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
> >
> > -DEPENDS = "glib-2.0 glib-2.0-native gperf-native kmod util-linux"
> > +DEPENDS = "gperf-native"
> >
> >  PROVIDES = "udev"
> >
> > @@ -19,7 +19,7 @@ SRC_URI[sha256sum] = "19847cafec67897da855fde56f9dc7d92e21c50e450aa79068a7e704ed
> >  UPSTREAM_CHECK_URI = "https://github.com/eudev-project/eudev/releases"
> >  UPSTREAM_CHECK_REGEX = "eudev-(?P<pver>\d+(\.\d+)+)\.tar"
> >
> > -inherit autotools update-rc.d qemu pkgconfig features_check manpages
> > +inherit autotools update-rc.d qemu pkgconfig features_check manpages gobject-introspection
>
> I like most of what this patch does, cleaning up this kind of thing is
> great. I am a bit worried about the gobject-introspection inherit
> though as this wasn't there before and brings with it a huge dependency
> tree. For something as "core" as udev that is rather sad. Do we really
> need it? Should we find a way to disable it by default?
>

Let me dig some more... basically swapping in g-i-r made the intent of
the previous glib inherits more obvious but I have a strong suspicion
there's no actual code left in eudev which will drive it and it just
wasn't removed from configure.ac as part of removing GObject.

I'll try an upstream patch to completely expunge it and see where we end up.

-- 
Alex Kiernan

