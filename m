Return-Path: <schnitzeltony@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 136A1C433EF
	for <webhook@archiver.kernel.org>; Sun, 17 Oct 2021 12:20:17 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web09.21964.1634473216615995658
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Oct 2021 05:20:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=acwINlkl;
 spf=pass (domain: gmail.com, ip: 209.85.216.49,
 mailfrom: schnitzeltony@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id
 g13-20020a17090a3c8d00b00196286963b9so12587560pjc.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Oct 2021 05:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=KRIjMWCHxqbty7idjQjdH9dVXHUHzQk8cBYqvc3xLYM=;
        b=acwINlklHPHHLUvM7QDcGWI++Uzok/PCRmLOSo5zz9jPHYgiG1QbWiH6vA0db81YyF
         598R2NJ+/MjcWPsSmYn4griAiXPSHhGm7XGif0KlxysSfWJjdxEkhOJKiMzgU+DDqoqm
         J6dTXIM4mbj6J0Gdga4KI69GXLCI4fXkQL1wwUfKJapN+1y0MoffvyTCtNiKDMvXMpFr
         88H9uWChbS31WpSJcwInrzbP0e9nGfJ0KDZlQWzkkwz6nYClNRiQscUKUKzfkVjRD7xb
         ShBZUC/ywpPx2gAIWD/y9NuldbxGwVscY8paH7oxk40G/ZM2gltOwXSEpYpUuJRX0iPE
         C1Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=KRIjMWCHxqbty7idjQjdH9dVXHUHzQk8cBYqvc3xLYM=;
        b=fkbsAefk+ERAqgp5BhZeFoSj3vBYdLgoIpUCZHgB3JVPoi94aUifiRCP8N+YcM49Fz
         yWmzggjMlJFuthM8wUEGUj5yc3oJSZ5jAqiWJ33FluU9wmW5lNgGkd+K4waySRcbPvqi
         8lw4f0DaEpIqybS//4mLIf+xx1OVc/0MD754Ndw2H3Ah3tEM44sRdE0DZ+uE3Qzx0Hqf
         uAfPgyMFyVs+/iPT/H2/t/BvsdUSBxI6CSlQwHVWQv0MDNmUrHbTx3LwjvrexjSduz1Q
         0k/66ngNInsrx736Y1acVGNZKbYnyoVgHTfq514zInEGeLzxicx8Zp5TcQUjGSfwTKHq
         9zlw==
X-Gm-Message-State: AOAM531YinmPYZLSfYDctTMlXKMCpAX0kMymVL/tZ9mNOPSztMA5tYRu
	5shWTEjz1qBhfK8IzT/U1tphEfH0LvLAD1qfKcwpwziPr8U=
X-Google-Smtp-Source: 
 ABdhPJzYjoSuLEw6j8FDmxQlzoYk7JBWcAHG9iudU2hOTPuDkxktUl21iXjX97nd8as9ecBf5VaOfeS5T2K2tNe3HcI=
X-Received: by 2002:a17:903:1252:b0:13d:f3f6:2e1c with SMTP id
 u18-20020a170903125200b0013df3f62e1cmr21527246plh.73.1634473216007; Sun, 17
 Oct 2021 05:20:16 -0700 (PDT)
MIME-Version: 1.0
References: <20211017115703.3801301-1-schnitzeltony@gmail.com>
 <e4e32689f8bddb5de2f34b156620cd9cef488cdf.camel@linuxfoundation.org>
In-Reply-To: 
 <e4e32689f8bddb5de2f34b156620cd9cef488cdf.camel@linuxfoundation.org>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sun, 17 Oct 2021 14:20:03 +0200
Message-ID: 
 <CALbNGRRMuq7_Keq=FtszASw4-8ESc8jDLUSUyJU4eDHCg0AaNw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] webkitgtk: add gperf-native to DEPENDS to fix
 build
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Oct 2021 12:20:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157037

On Sun, Oct 17, 2021 at 2:03 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sun, 2021-10-17 at 13:57 +0200, Andreas M=C3=BCller wrote:
> > >   Could NOT find Gperf (missing: GPERF_EXECUTABLE) (Required is at le=
ast
> > >   version "3.0.1")
> >
> > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > ---
> >  meta/recipes-sato/webkit/webkitgtk_2.34.0.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/recipes-sato/webkit/webkitgtk_2.34.0.bb b/meta/recipe=
s-
> > sato/webkit/webkitgtk_2.34.0.bb
> > index 25e1d422cc..a8e067147c 100644
> > --- a/meta/recipes-sato/webkit/webkitgtk_2.34.0.bb
> > +++ b/meta/recipes-sato/webkit/webkitgtk_2.34.0.bb
> > @@ -32,6 +32,7 @@ CVE_PRODUCT =3D "webkitgtk webkitgtk\+"
> >
> >  DEPENDS =3D " \
> >            ruby-native \
> > +          gperf-native \
> >            cairo \
> >            harfbuzz \
> >            jpeg \
>
> Out of interest, why are you seeing that and the automated testing isn't?
>
Asked myself same but did not find an answer. My build should use
default PACKAGECONFIGs. Was off for a while so now pulled master
(meta-openembedded master-next for mozjs upgrade) and started a build.
Not helpful exactly - sorry...

Andreas

