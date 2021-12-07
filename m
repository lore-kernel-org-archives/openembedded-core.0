Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0920BC433F5
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 16:51:20 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.596.1638895878411305820
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 08:51:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=hYYRImxf;
 spf=pass (domain: burtonini.com, ip: 209.85.128.43,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f43.google.com with SMTP id
 az34-20020a05600c602200b0033bf8662572so2782142wmb.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 08:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CQI6H85wAQKfG8eMt8pISVoaV4rdOnLRlhCEyBoHXmE=;
        b=hYYRImxf0xjSvi9XXGNhGDeItbtJIbSdq4ifsallMUeFd5x4YuOX2aLXihTDkuXha3
         SF+FoP2O2RB/+dOkJDGyYa4olJBbChjdK606g7bvRpkpq8OSK5z120hEQw4n6h8cP2uo
         O0/Ymyo/6xL4PHMuiFg2UmwZAjuAQ6n83lv7KPsVWu2jqKk6r03ZjAXfiwYB3r3A4z2X
         lHMeLMdc2xATnBhM0bP9uFReX68B67Mk9zOkg/wbufioJdBHx0tdWPWC58H6SK1p3mRT
         Z1g9sO8E9iGImA0M49ToslOl/B9yoTNPnSiphTXhk4BLDHX2Fa7CUPB+xCUYBcHGeSrM
         lM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CQI6H85wAQKfG8eMt8pISVoaV4rdOnLRlhCEyBoHXmE=;
        b=g/cWmCSRupbqyMQrPslk8/oq27DH246KxTcpHy6Yv5rFcK4uduYol5Zp12ZqBVFQUB
         ZJZrNzsrcXwM1oWvU1LQvnA4WkHVg96HD6uZcVM/HOBGw7aGVEc1KKVK970b3Tb4dJ5i
         WBazD0zC1MVhG88EIjnAyi7WPTv6qj6HCeU1d7c+P3lJq4A9pKOaj9gdsIvfmU6OuAO1
         pqqal1aqTKpZWvNYS2sz7Q3IfwWrrhiPyBMNSIidyYbjV8uTtsPrAhEP18x5vF8QTtXn
         ve3TCVXJ+zDuC/OWFrdc0MjhTZG9RcVdRXqN+1DqxolYhcpr9xHs9ME+VM3m9iXUWlki
         i1hQ==
X-Gm-Message-State: AOAM531kWmQW3EAPhQ/BAlT+NzDmukJdveoTEugb2KrQdJRheirk6re/
	aQb7ebVpO9HV5QKgCLs4yOAco2voUYNTIsagey/BEw==
X-Google-Smtp-Source: 
 ABdhPJyhk6pez5IpYPJ8t59JG7yyXMZygabX1EfnzrdyA/56//UShP3G7UP8z7+NrNjoFETT0OiEnys2iM4/sWkEOyI=
X-Received: by 2002:a05:600c:4f96:: with SMTP id
 n22mr8274957wmq.184.1638895876710;
 Tue, 07 Dec 2021 08:51:16 -0800 (PST)
MIME-Version: 1.0
References: <1638804078-8183-1-git-send-email-wangmy@fujitsu.com>
 <f206d7acc80b1d4f4425898539f06b33dfd091b8.camel@linuxfoundation.org>
In-Reply-To: 
 <f206d7acc80b1d4f4425898539f06b33dfd091b8.camel@linuxfoundation.org>
From: Ross Burton <ross@burtonini.com>
Date: Tue, 7 Dec 2021 16:51:05 +0000
Message-ID: 
 <CAAnfSTtKWk0njrZQm_a0awBXyRWxGea8GCZ2tzgRfpy96F1zCg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] pango: upgrade 1.48.10 -> 1.50.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: wangmy <wangmy@fujitsu.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Dec 2021 16:51:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159314

Not just x32:

https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/2898/steps/12/logs/stdio

Ross

On Tue, 7 Dec 2021 at 13:36, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2021-12-06 at 23:21 +0800, wangmy wrote:
> > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > ---
> >  .../pango/{pango_1.48.10.bb => pango_1.50.0.bb}                 | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta/recipes-graphics/pango/{pango_1.48.10.bb => pango_1.50.0.bb} (94%)
> >
> > diff --git a/meta/recipes-graphics/pango/pango_1.48.10.bb b/meta/recipes-graphics/pango/pango_1.50.0.bb
> > similarity index 94%
> > rename from meta/recipes-graphics/pango/pango_1.48.10.bb
> > rename to meta/recipes-graphics/pango/pango_1.50.0.bb
> > index 40df7042e6..db17158d20 100644
> > --- a/meta/recipes-graphics/pango/pango_1.48.10.bb
> > +++ b/meta/recipes-graphics/pango/pango_1.50.0.bb
> > @@ -20,7 +20,7 @@ GIR_MESON_DISABLE_FLAG = "disabled"
> >
> >  SRC_URI += "file://run-ptest"
> >
> > -SRC_URI[archive.sha256sum] = "21e1f5798bcdfda75eabc4280514b0896ab56f656d4e7e66030b9a2535ecdc98"
> > +SRC_URI[archive.sha256sum] = "dba8b62ddf86e10f73f93c3d2256b73238b2bcaf87037ca229b40bdc040eb3f3"
> >
> >  DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
> >
>
> Seems to break x32 unfortunately:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/4403
>
> Cheers,
>
> Richard
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159304): https://lists.openembedded.org/g/openembedded-core/message/159304
> Mute This Topic: https://lists.openembedded.org/mt/87541909/1676615
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ross@burtonini.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

