Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B2C1C433F5
	for <webhook@archiver.kernel.org>; Sat, 11 Dec 2021 02:42:49 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web08.17100.1639190568734904198
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 18:42:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mwgPwo/g;
 spf=pass (domain: gmail.com, ip: 209.85.160.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id t34so10212470qtc.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 18:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JZnrEpiUdZf1lxnGLdQen//ka1MYqcdXhGJWTc40BeY=;
        b=mwgPwo/gBnfwfRTytcI0ya5XvQzPQVObeLN4vpkdbY8eaewZQgPLhHm6VSJG0z47JJ
         hpEA+lQnUGlZHKuEWK0kLVKb6dP+bCS3xXpJsKA4W2wh9YrXywtxUSezDDEtXBbkPz2p
         TTP+MsLRgHuI6KJ/aIhbLeE2Hk2UQHIMXaq/tD3aQj1+CiLT7cBNGTh+Z8oGagrJtjXS
         IZhxJbboKxsK8/uD+PbYD5hLSYmgVx6jDiOKw8aGg0yv8GsVYmYmWa4viIN/oo7U1fqi
         MaaR0WqX0Hnen/IiVZ1OQtblmDBvHDTbe9wY9R62YWPgAsl71mtoAXOvTLvgwHL01Qs+
         vpeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JZnrEpiUdZf1lxnGLdQen//ka1MYqcdXhGJWTc40BeY=;
        b=JNtRcgMeBYoZIWxbs0JLwXWSr98tdswTUK3xbrjISa5UkiYy4bm8CxRR/XBkmaH07k
         eQNBjE8fExkjpZ/9gJVi9kdk/8UZq+fpoIoR0HKeMeJKe1uyrTzKRPCNvtejBtIRoEK4
         vVRbb7D7x9vlbGlcy1yGTBiL3T8bY6gDXVm2MOtrd+5uZL48YZzMOAYfDbZKpUx3G6aF
         Y7aRJs8E8BsEInHlY9cmbG/C8i5jAWMdRfU/BsuB2nYO7qBlbbAgU5TyRLn1tvYAI/Df
         i2muoC67y4MFQktEZ+4TLb9klwOQddO2xgmJVTDXXJvgBzbvkj+I0sfgCkWLbi3MP7yR
         ecqA==
X-Gm-Message-State: AOAM531mlpkt0qjim/LltIqnomAQAxaWy6/V9v8uOT51uWlhxKsFWwAV
	yb0o6pkYOYehJwXsfWaLFA/L+RtqIk2bxs1tAEM=
X-Google-Smtp-Source: 
 ABdhPJyNbw33rhJCnT6nk23lwk/6G+nFu3Jg9oOpVTonIakcOF6CdHZWspdApmKZhyy3P3go25a6eWhK0c230oysUWc=
X-Received: by 2002:aed:30a3:: with SMTP id 32mr31295061qtf.660.1639190567802;
 Fri, 10 Dec 2021 18:42:47 -0800 (PST)
MIME-Version: 1.0
References: <20211208215947.1979470-1-alex@linutronix.de>
 <20211208215947.1979470-10-alex@linutronix.de>
 <CAMKF1sqMoz=MSVWu=3nnWAMu9Z5VTt4JwrTv6A-OLAa_h4T2Bg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqMoz=MSVWu=3nnWAMu9Z5VTt4JwrTv6A-OLAa_h4T2Bg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 10 Dec 2021 18:42:22 -0800
Message-ID: 
 <CAMKF1srOg-TWoVFNXe5BXmm=ZK4V5VA25+F57GqtmdDE8+WO3A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 10/29] meson: upgrade 0.60.1 -> 0.60.2
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Dec 2021 02:42:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159559

On Fri, Dec 10, 2021 at 9:01 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> this breaks gjs also see https://github.com/mesonbuild/meson/issues/9472
>

I have a fix for gjs [1] but I was thinking meta-gnome is a good
testcase for meson. So when upgrading meson it will be good to add
this layer
to test and build world.


[1] https://lore.kernel.org/openembedded-devel/20211210173603.2826515-1-raj.khem@gmail.com/T/#u

> On Wed, Dec 8, 2021 at 2:00 PM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> >
> > From: Alexander Kanavin <alex.kanavin@gmail.com>
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  meta/recipes-devtools/meson/meson.inc                           | 2 +-
> >  .../recipes-devtools/meson/{meson_0.60.1.bb => meson_0.60.2.bb} | 0
> >  .../{nativesdk-meson_0.60.1.bb => nativesdk-meson_0.60.2.bb}    | 0
> >  3 files changed, 1 insertion(+), 1 deletion(-)
> >  rename meta/recipes-devtools/meson/{meson_0.60.1.bb => meson_0.60.2.bb} (100%)
> >  rename meta/recipes-devtools/meson/{nativesdk-meson_0.60.1.bb => nativesdk-meson_0.60.2.bb} (100%)
> >
> > diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
> > index f383ad9f74..7fbb246b87 100644
> > --- a/meta/recipes-devtools/meson/meson.inc
> > +++ b/meta/recipes-devtools/meson/meson.inc
> > @@ -15,7 +15,7 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
> >             file://0002-Support-building-allarch-recipes-again.patch \
> >             file://0001-is_debianlike-always-return-False.patch \
> >             "
> > -SRC_URI[sha256sum] = "5add789c953d984b500858b2851ee3d7add0460cf1a6f852f0a721af17384e13"
> > +SRC_URI[sha256sum] = "64e6968565bf1b8152f4f9d6ca8154efb9e14caa9aabf7b22e71e6c5d053e921"
> >
> >  UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
> >  UPSTREAM_CHECK_REGEX = "meson-(?P<pver>\d+(\.\d+)+)\.tar"
> > diff --git a/meta/recipes-devtools/meson/meson_0.60.1.bb b/meta/recipes-devtools/meson/meson_0.60.2.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/meson/meson_0.60.1.bb
> > rename to meta/recipes-devtools/meson/meson_0.60.2.bb
> > diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.60.1.bb b/meta/recipes-devtools/meson/nativesdk-meson_0.60.2.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/meson/nativesdk-meson_0.60.1.bb
> > rename to meta/recipes-devtools/meson/nativesdk-meson_0.60.2.bb
> > --
> > 2.20.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#159376): https://lists.openembedded.org/g/openembedded-core/message/159376
> > Mute This Topic: https://lists.openembedded.org/mt/87599646/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

