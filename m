Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EF6EC47091
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:54 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web10.6624.1649899921759427012
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 18:32:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SsAcQYLi;
 spf=pass (domain: gmail.com, ip: 209.85.160.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id p1so2639143qtq.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 18:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+Tl2CWFurQe6RkqWzypKydvLX6oOgbY5a9kXsqJjL58=;
        b=SsAcQYLigNxWcBNeq4VZqyDPRi3RaDw3VFt+MuEAhKUtgR/p83VGFv9vXnaUltgNV/
         grvWJG13tcpyxqN+6dS2CXqvfW3+owWcEuQak1yWYcV/E1u3gzjUx+y8j2G0fOtAPN9O
         H0MvdPqk3DUjDKuyYYnqbEccgpMxp01t3qP1nPqKNHiScxvWL4yroKmbONaGNiFKwagI
         vpRyQKYffnDqR3xTRyEXy/GFj871WevA3jzP4ZEX93NQijyeoiqnLJzj09ak/Jo3gwwH
         Uhb3Ii3wcnfOWiIvxPvJbK1kS+AqIv1B7O6VqjasIARU30nI85e+lfnxTCAVEago5mVK
         g6Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+Tl2CWFurQe6RkqWzypKydvLX6oOgbY5a9kXsqJjL58=;
        b=cKrOOuLAEWobnYBbjdrhe1D0+JCaId0swUpdAjQ0Fln4CJk/EDGEeTHXrS9Il8ULRt
         uRKIPoWfkPYMhxdKcHwgVrwu4EkSZgRgcWD6ANmfQn3reHdRmbWn0Tw2arqGyOTa0i/T
         Ydp+Oc0/To6n60ubUhsRvTR7zxWrrqOQcvGzQBRAisrcwuGrYEAZRDQOb/HfcmpeVELM
         GdwPrFuFPxrxYG3Hq5CEEapjsQ9ELBlZiDy4fsdrU2J+Bwpjxadb0r8QkfQVp/M+LAlJ
         ZSv0haSgb0tZniOFLlzgItl4W8oYRnhrxWeBrWFzSPe/wmm1NYhtVg91xmBA75ORyV0C
         fWzw==
X-Gm-Message-State: AOAM532wI5d6tMsh8eARg6NlDTkmN2GTaNLuQo+wfmYgzcl+lcOKY++/
	ksyGs3gq9+fVg99qYFIDMG90e4nh/p7pejiA7PY=
X-Google-Smtp-Source: 
 ABdhPJxPkghwEbTBOrM/nwuNxC7v53pjNmjD69mQySNUDUrVZ4L8LoMRRF05hcC7Tj2MHfY7MPtFSot9yFDiZHS3b/s=
X-Received: by 2002:ac8:724c:0:b0:2ed:e78b:2168 with SMTP id
 l12-20020ac8724c000000b002ede78b2168mr210192qtp.532.1649899920673; Wed, 13
 Apr 2022 18:32:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220410231659.717650-1-raj.khem@gmail.com>
 <20220410231659.717650-2-raj.khem@gmail.com>
 <YlUzOsgctKOiW87c@mail.local>
 <CAMKF1sowJ-rn3C-MttHuUgNGcmkJ3boMxOd-62mnH5KLb2E7TA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sowJ-rn3C-MttHuUgNGcmkJ3boMxOd-62mnH5KLb2E7TA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 Apr 2022 18:31:34 -0700
Message-ID: 
 <CAMKF1sotnhQtwTLRchE2XVPmNTw41R_5LLudmVw8mqR6ST2Kjw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/2] pango: Upgrade to 1.50.6
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164375

it looks like a rounding error. A bunch of them were fixed in few
months back via

https://gitlab.gnome.org/GNOME/pango/-/commit/053c9ff8ab00d6d7d4b7cbe8aeeaca58c0982df1

On Wed, Apr 13, 2022 at 3:42 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Tue, Apr 12, 2022 at 1:07 AM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> >
> > Hi Khem,
> >
> > On 10/04/2022 16:16:59-0700, Khem Raj wrote:
> > > Changes in this release [1]
> > >
> > > [1] https://github.com/GNOME/pango/commit/37a427018c92a2bc679ef104097e07a619609c9c
> >
> >
> > New ptest failures with this release:
> > https://autobuilder.yoctoproject.org/typhoon/#builders/82/builds/3109/steps/12/logs/stdio
> > https://autobuilder.yoctoproject.org/typhoon/#builders/81/builds/3362/steps/12/logs/stdio
> >
> > {'pango': ['pango/test-layout.test']}
> >
> > It seems to be intermittent as my previous build didn't have that
> > failure.
>
> hmmm is there more info in logs on how it fails ?
>
> >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > > v2: Rebased
> > >
> > >  .../recipes-graphics/pango/{pango_1.50.4.bb => pango_1.50.6.bb} | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >  rename meta/recipes-graphics/pango/{pango_1.50.4.bb => pango_1.50.6.bb} (94%)
> > >
> > > diff --git a/meta/recipes-graphics/pango/pango_1.50.4.bb b/meta/recipes-graphics/pango/pango_1.50.6.bb
> > > similarity index 94%
> > > rename from meta/recipes-graphics/pango/pango_1.50.4.bb
> > > rename to meta/recipes-graphics/pango/pango_1.50.6.bb
> > > index 0ea621bf670..b1b9054234d 100644
> > > --- a/meta/recipes-graphics/pango/pango_1.50.4.bb
> > > +++ b/meta/recipes-graphics/pango/pango_1.50.6.bb
> > > @@ -20,7 +20,7 @@ GIR_MESON_DISABLE_FLAG = "disabled"
> > >
> > >  SRC_URI += "file://run-ptest"
> > >
> > > -SRC_URI[archive.sha256sum] = "f4ad63e87dc2b145300542a4fb004d07a9f91b34152fae0ddbe50ecdd851c162"
> > > +SRC_URI[archive.sha256sum] = "a998bcf36881c3ac20495d40bceb304f4eaa9175bd2967c85656434cbdafe86a"
> > >
> > >  DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
> > >
> > > --
> > > 2.35.1
> > >
> >
> > >
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#164211): https://lists.openembedded.org/g/openembedded-core/message/164211
> > > Mute This Topic: https://lists.openembedded.org/mt/90384193/3617179
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > >
> >
> >
> > --
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com

