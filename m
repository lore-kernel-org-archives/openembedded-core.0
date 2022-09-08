Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AD00C54EE9
	for <webhook@archiver.kernel.org>; Thu,  8 Sep 2022 19:29:27 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.438.1662665365449394386
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Sep 2022 12:29:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=0+Laa+uF;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.49,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f49.google.com with SMTP id fy31so40428901ejc.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Sep 2022 12:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=2nyROtRqODg3lUNrSLJcBd3R0tfFObqRswsLQyAmGhw=;
        b=0+Laa+uFgIo7kP/hXKCT8QXTKRi/r2B2PhMYPLuPh4IYU9cXjh/K2cHVoiqfbPq9My
         fOIzk7EvjYOa/XC7vIU+fLunuL2iw7vybOYCv6ll8EvSjDjnDdKPdVwzuZ04UzWkR7Ef
         X8K+bfD8/SuhXMetanPNRvXQ/DSrdTTQr4qyb5FjgH+T2D5OexHOhUNGnIVKgsrLVQAn
         AXQwVJ6JFUCHPaymuchU5tD780o33PMaPf8/8gOGf5PZG7vhx2LK6GK+aNvQmdEDCr+7
         x0kjh1JupPf2rmu3eaDwucjIUVc+QJJCgZJ4q/fMLtmCA7Bf3MjWKqqTja/tmCvMTFbl
         SF5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=2nyROtRqODg3lUNrSLJcBd3R0tfFObqRswsLQyAmGhw=;
        b=JmkSIPgehVC7J7OWAb76mK8DsJxESPsNvXS8cxqIOWF8XdX21RtvBUjyMmHhazZvOO
         cSEtxwXYblVHwcYyHK/KXITpX+KD86vh7vfiTGPXThkbIoHa3A4Nf7vM98w7le927HUU
         /9mq9H5M5u49PCa7HOsRW5H7c8+6lIRABbqpFoDSXfh2G6wlOaVyn4PMA0t6qVNdkq5Y
         MbG6t2NowRKyMredP2u0w7xjsrgIEK8XfSfN6vONj1NIPkrPRVfxqnq3K0qCyu+Ylvw9
         7lIpoQRH6JElx8HCsr/k8IXJUGMBbcthfLb0Woeq9MhgmtWjw+o9rcdwTp1TEaMIKKhY
         qveQ==
X-Gm-Message-State: ACgBeo2Gxf9UmTmj6yf6tdqsDA8aHSiRqDouIbQgHCSPUZkY0VuFzTJq
	MwPLCa/ak5BBxN248ipjhXQrSc1TwKTG7t6ixF7lxg==
X-Google-Smtp-Source: 
 AA6agR6z83IGQO8izySLIRfymuCDg51pXQXTgMlNkktGQPVork3Z2M+1kOyKGYxXdDH3wtr7NG7pAYzTlIdaqbsicvI=
X-Received: by 2002:a17:907:8a1a:b0:731:6475:68f7 with SMTP id
 sc26-20020a1709078a1a00b00731647568f7mr7005865ejc.359.1662665363772; Thu, 08
 Sep 2022 12:29:23 -0700 (PDT)
MIME-Version: 1.0
References: <171248C99AA15227.20375@lists.openembedded.org>
 <5780cdfd47d24795ac023cdf6fa56185@axis.com>
In-Reply-To: <5780cdfd47d24795ac023cdf6fa56185@axis.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 8 Sep 2022 09:29:12 -1000
Message-ID: 
 <CAOSpxdYX2R1NTKWnb4jPVgUismgaJEyPZzeGy4gz6eMxbJH=jQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cairo: Adapt the license information based on
 what is being built
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Sep 2022 19:29:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170472

On Thu, Sep 8, 2022 at 6:44 AM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> Please cherry-pick this to Kirkstone.

Will do!

Steve
>
> //Peter
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
> > Sent: den 6 september 2022 15:34
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH] cairo: Adapt the license information based on what is being built
> >
> > If the "trace" PACKAGECONFIG is removed to disable cairo-trace (the
> > only part of the code licensed as GPL-3.0), we can adapt the licenses
> > for cairo-dbg and cairo-src so that they do not include
> > "GPL-3.0-or-later" and thus they can be used also when, e.g., GPL-3.0
> > is blacklisted in INCOMPATIBLE_LICENSE. Also drop the GPL-3.0 license
> > text from LIC_FILES_CHKSUM in this case.
> >
> > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > ---
> >
> > This applies the suggestion from commit f763b906 (cairo: Add missing
> > GPLv3 license checksum entry). I have verified that when disabling the
> > trace PACKAGECONFIG, then there is no trace (no pun intended) of the
> > GPL-3.0 code in the -dbg and -src packages.
> >
> >  meta/recipes-graphics/cairo/cairo_1.16.0.bb | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-graphics/cairo/cairo_1.16.0.bb b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> > index 67081bb8cb..ffb813d290 100644
> > --- a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> > +++ b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> > @@ -17,9 +17,13 @@ LICENSE:${PN}-doc = "MPL-1.1 | LGPL-2.1-only"
> >  LICENSE:${PN}-gobject = "MPL-1.1 | LGPL-2.1-only"
> >  LICENSE:${PN}-script-interpreter = "MPL-1.1 | LGPL-2.1-only"
> >  LICENSE:${PN}-perf-utils = "GPL-3.0-or-later"
> > +# Adapt the licenses for cairo-dbg and cairo-src depending on whether
> > +# cairo-trace is being built.
> > +LICENSE:${PN}-dbg = "(MPL-1.1 | LGPL-2.1-only)${@bb.utils.contains('PACKAGECONFIG', 'trace', ' & GPL-3.0-or-later', '', d)}"
> > +LICENSE:${PN}-src = "(MPL-1.1 | LGPL-2.1-only)${@bb.utils.contains('PACKAGECONFIG', 'trace', ' & GPL-3.0-or-later', '', d)}"
> >
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77 \
> > -                    file://util/cairo-trace/COPYING-GPL-3;md5=d32239bcb673463ab874e80d47fae504"
> > +                    ${@bb.utils.contains('PACKAGECONFIG', 'trace', 'file://util/cairo-trace/COPYING-GPL-3;md5=d32239bcb673463ab874e80d47fae504', '', d)}"
> >
> >
> >  DEPENDS = "fontconfig glib-2.0 libpng pixman zlib"

