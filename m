Return-Path: <armccurdy@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72F14C433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 21:39:28 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.830.1651009160404932026
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Apr 2022 14:39:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XhWfbC9y;
 spf=pass (domain: gmail.com, ip: 209.85.167.52,
 mailfrom: armccurdy@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id j4so9713268lfh.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Apr 2022 14:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6Iypx94KyKmKlY5OeoyaTsSLH61O/Id9l5k3fB+AM6M=;
        b=XhWfbC9yH2rbe3EQZsKI6SES3O3n+kwGdI5gmtGnh3+zPoybPrhcd93ZSeRagzkcIg
         edEfKRduX7B3aiahqdOIaqQ6bYB7B2HtNbO6Tu6NZThbjrrYW7GE2K57NYWmQyEbRheP
         xw1T8R1kpA+W/bmiaCovRM5hQtghtguNGiU/Ex0DV4ZPmKEi1JpJloPzsMelyz/ozwYp
         t6QaBX/9oblTtPdmUPz7eKVyzOWVmT5xwVAyW8cjPsPEBFQblMgX4y2W20SSKtkV754P
         29B9TuFydxsXTJJu163HcKb3X9He8eYHJr3lYzKINK+N4opDLuRtCaqF/nKc/Ob0FTji
         YRdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6Iypx94KyKmKlY5OeoyaTsSLH61O/Id9l5k3fB+AM6M=;
        b=MdI59yDa9zlkjJms2duMB+8DscJOGS4hXe7eNTMui29jIDKZrUoPpajGgjdUit944V
         zG7G4J2HhU4ScGM5JGtNyMUpqA+rjIFqVQ9GFon4UZf3pgoF4h/Jyyf4VD9r/okljAaP
         oDLGUPIXrOyEH7zd6Cv/liD3VTMEraErbyTum+zppjIe5YZ8+wV6u44RhiCCyFTYLhDk
         r8fWMYvGs6hF2UMNUwMdR8nfGt2AwB0G5h2NuR1tNdrtTLIMEd3m1/2pn3TsDMuxPBMg
         FOBLC/9gNWNmz5m11BvbjeLf33mR5cvERAQ/63iWxiN2iP5N4H/OvyTjTTBxud1Ps0y0
         EK8A==
X-Gm-Message-State: AOAM532K3SF/BkwX2TzwVrEN1OxzsVtgM/buqO9yElK6BkI8WvFwA2+c
	kfVT902IyhHOoicu1Ad6lz4Gsyg1kAwhjvmdYEo=
X-Google-Smtp-Source: 
 ABdhPJyzkiC2I5BB8c6BNYTwdUcF04p893i7HbCUKqF0TULT1ra2HB9NKJcTkJwD4Z5Muvxgm8G8tIifSlQMVjnMFjE=
X-Received: by 2002:a05:6512:1083:b0:472:1013:aad1 with SMTP id
 j3-20020a056512108300b004721013aad1mr5862194lfg.52.1651009158305; Tue, 26 Apr
 2022 14:39:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220426194618.218353-1-nicolas.dechesne@linaro.org>
 <CAJ86T=XZLytHs3yQxezF59+UbJnKPUsqJwqY0Cs8HTAqWoYRuQ@mail.gmail.com>
 <CAMKF1srtoJ018V4x3nX2CQ+77DfLgnN2-KizL1Zfje2e-wUEFQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1srtoJ018V4x3nX2CQ+77DfLgnN2-KizL1Zfje2e-wUEFQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 26 Apr 2022 14:39:01 -0700
Message-ID: 
 <CAJ86T=WOttBz2W-xWD=dEP36FredBqzjEC3d+sF_ciUX_aCS1w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sanity: skip make 4.2.1 warning for debian
To: Khem Raj <raj.khem@gmail.com>
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Apr 2022 21:39:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164885

On Tue, Apr 26, 2022 at 1:56 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Tue, Apr 26, 2022 at 1:51 PM Andre McCurdy <armccurdy@gmail.com> wrote:
> >
> > On Tue, Apr 26, 2022 at 12:46 PM Nicolas Dechesne
> > <nicolas.dechesne@linaro.org> wrote:
> > >
> > > This is a follow up patch of:
> > > ad5829aa1f8a (sanity: Show a warning that make 4.2.1 is buggy on non-ubuntu systems)
> > >
> > > Debian10 has the exact same version/sources for make as Ubuntu
> > > (focal), e.g. https://packages.debian.org/source/buster/make-dfsg and
> > > https://packages.ubuntu.com/source/focal/make-dfsg.
> > >
> > > As per the corresponding changelog, the patch mentioned in
> > > ad5829aa1f8a, is included in both Debian and Ubuntu in make
> > > 4.2.1-1.1. So it's safe to use make 4.2.1 in Debian10.
> > >
> > > Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> > > ---
> > >  meta/classes/sanity.bbclass | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> > > index c385d92e8b..c72a7b3ed3 100644
> > > --- a/meta/classes/sanity.bbclass
> > > +++ b/meta/classes/sanity.bbclass
> > > @@ -470,7 +470,7 @@ def check_make_version(sanity_data):
> > >
> > >      if bb.utils.vercmp_string_op(version, "4.2.1", "=="):
> > >          distro = oe.lsb.distro_identifier()
> >
> > Not directly related to your change, but shouldn't this be
> > lsb_distro_identifier() instead of oe.lsb.distro_identifier()?
>
> lsb_distro_identifier would work when it is inheriting base.bbclass
> otherwise the utility function is needed.

Question isn't really whether it will work or not (if it doesn't work,
we should make it work) but rather whether any user-defined
LSB_DISTRO_ADJUST should be applied before checking if the host distro
is based on Debian/Ubuntu or not.

> > > -        if "ubuntu" in distro:
> > > +        if "ubuntu" in distro or "debian" in distro:
> > >              return None
> > >          return "make version 4.2.1 is known to have issues on Centos/OpenSUSE and other non-Ubuntu systems. Please use a buildtools-make-tarball or a newer version of make.\n"
> > >      return None
> > > --
> > > 2.36.0
> > >
> > >
> > >
> > >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#164883): https://lists.openembedded.org/g/openembedded-core/message/164883
> > Mute This Topic: https://lists.openembedded.org/mt/90716488/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

