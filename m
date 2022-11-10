Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7597C4332F
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 09:23:19 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web09.5288.1668072191616222701
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Nov 2022 01:23:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UI191MCY;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id g12so2056891lfh.3
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 01:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aauFs00ZrNgaCQYm4EM7NEZJJGT5KoyAFY2uj2NTkUs=;
        b=UI191MCYgNclgq0wDUzskj7cNv6BT9FDUf+uiuYPdDkMRK+4vhfRL6JrDbPT5aa1YZ
         qu6qa20bsClcKK6q3e/or9FjuBjIGcLrj+eYgECYm0/YmwciIPvyAGqB/tAeDuJLIcxz
         6IbUYhhZ+k5ruj/5EKaEKU1vexwkXFeEQ/+mr6rpjcIECEakUIqNYUwnXjMfy4AmxIzg
         hiKSRdJBSL0jOx9+/6T6UXWMV7Uy4FWgXfLbwyFC16vMCl+QsRrURlkJ/Sisr7b19f24
         s4e0nJNd2TYozVKbWqD0YhVCxdEIik3HQKRDdcj2jYAOcPWsbnZKShO05YeimfaTFmBF
         /I2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aauFs00ZrNgaCQYm4EM7NEZJJGT5KoyAFY2uj2NTkUs=;
        b=wvE2qERgyTMtjqCYPhkMGefZieqKfABVbVfvqr9NOoJADD7WZ+k11YPvtMiqncFXJr
         EZGEdaJgoEauSmXZoO4RYtyT0NS6V9rJvcRuwk4s89QwLDuB9UE8omyxoe+aNuharyer
         j1CyfcXx90+A/EpRsu4Jwdn6vBZUti2f8vcHA0FVOWKHduZmZkJzQC2Yz811sZ2Bgdpm
         zJHjMRfaQm3mGyrb5IQ3yRV8UFa3rhNCccD8Dgn9tEr4GREdoONPyOf6ApXsLSPgSbxb
         NiZOLgEPbp9kJfEEbZXJEfExDR+1xFJ11h7uDLn0fkNvKHEVcnO5GUigKKBWY8B8bQxK
         R7wg==
X-Gm-Message-State: ACrzQf2p2oGKdVNcJX43zTQs5LW9WzVIEjB5RJc09oPcWpV9BfSU8RJM
	zS6FSsHgxJi+LLEKN4cBIrjJ58seD5pPg15RFZU=
X-Google-Smtp-Source: AMsMyM4fUmo24EZ9Pd/G8p6n97jTUQhU6pRCnp9gYwPXflh1tNd/ncqqmeNDFnT6dOQF24MGOgxDrPp4mmrXKV5DNzE=
X-Received: by 2002:a19:4f18:0:b0:4a2:4aad:8fff with SMTP id
 d24-20020a194f18000000b004a24aad8fffmr1170552lfb.445.1668072189514; Thu, 10
 Nov 2022 01:23:09 -0800 (PST)
MIME-Version: 1.0
References: <20221110020136.908205-1-pkj@axis.com> <17262CACB6ABB9ED.25923@lists.openembedded.org>
In-Reply-To: <17262CACB6ABB9ED.25923@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 10 Nov 2022 10:22:58 +0100
Message-ID: <CANNYZj_VB3=V-appX8fkmWB6YcetvFU2F25ZxtSjNtmYeNHY_g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] pango: Make it build with ptest disabled
To: alex.kanavin@gmail.com
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 09:23:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173071

I checked locally, it does.


Alex

On Thu, 10 Nov 2022 at 09:43, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
>
> This snippet is going to be eliminated altogether, can you check that
> this patch addresses the problem?
> https://git.yoctoproject.org/poky-contrib/commit/?h=akanavin/package-version-updates&id=232607c0a781272e2d7f54f1a13980c109fd1d25
> (if I force push, the commit is 'pango: replace a recipe fix with an
> upstream submitted patch')
>
> Alex
>
> On Thu, 10 Nov 2022 at 03:01, Peter Kjellerstedt
> <peter.kjellerstedt@axis.com> wrote:
> >
> > This avoids the following error:
> >
> >   ERROR: pango-1.50.11-r0 do_package: QA Issue: pango: Files/directories
> >   were installed but not shipped in any package:
> >     /usr/libexec
> >     /usr/libexec/installed-tests
> >     /usr/libexec/installed-tests/pango
> >     /usr/libexec/installed-tests/pango/nofonts
> >     /usr/libexec/installed-tests/pango/nofonts/fonts.conf
> >
> > Also use tabs for indentation of shell code.
> >
> > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > ---
> >  meta/recipes-graphics/pango/pango_1.50.11.bb | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/recipes-graphics/pango/pango_1.50.11.bb b/meta/recipes-graphics/pango/pango_1.50.11.bb
> > index f545689811..f982d9a65b 100644
> > --- a/meta/recipes-graphics/pango/pango_1.50.11.bb
> > +++ b/meta/recipes-graphics/pango/pango_1.50.11.bb
> > @@ -38,13 +38,15 @@ PACKAGECONFIG[thai] = ",,libthai"
> >  GIR_MESON_OPTION = 'introspection'
> >
> >  do_configure:prepend() {
> > -    chmod +x ${S}/tests/*.py
> > +       chmod +x ${S}/tests/*.py
> >  }
> >
> >  # https://gitlab.gnome.org/GNOME/pango/-/issues/713
> >  do_install:append() {
> > -    mkdir -p ${D}/${libexecdir}/installed-tests/pango/nofonts/
> > -    install ${S}/tests/nofonts/fonts.conf ${D}/${libexecdir}/installed-tests/pango/nofonts/
> > +       if [ "${@bb.utils.filter('PACKAGECONFIG', 'tests', d)}" ]; then
> > +               mkdir -p ${D}${libexecdir}/installed-tests/pango/nofonts
> > +               install ${S}/tests/nofonts/fonts.conf ${D}${libexecdir}/installed-tests/pango/nofonts
> > +       fi
> >  }
> >
> >  LEAD_SONAME = "libpango-1.0*"
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173070): https://lists.openembedded.org/g/openembedded-core/message/173070
> Mute This Topic: https://lists.openembedded.org/mt/94928175/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

