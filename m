Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4953EC433F5
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 22:12:14 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com
 [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web12.511.1664575927999541815
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Sep 2022 15:12:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MQ1DNNiv;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id
 586e51a60fabf-11e9a7135easo7001304fac.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Sep 2022 15:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=qnsJqe0QQmxXTDnQX2FK6+rcSXF3Db3UuWi8zaucMdQ=;
        b=MQ1DNNivhae0/6VeWAxW2WOp1n8jnElLRzDTT+h4RFJK6v9Sc6lxTVBQroHp8NH76p
         PLCZmCEV2hamXWLtKsCmF6blm0EXgEyIauoME7+I6zxs7HsobdSH12BRq+sklEuOvxR1
         KMMAiCNouz5/r8mjfwVvKewf5t9x6y/1gjG67Kd1lTZeaOURiyRYcsgXp4IUOGFASj1C
         NPbhBRdT8hEz5isDevKDX2UImqOThOxa6d5OA9iE6xa6eiFFz2NKWUKQskfWJeMQ3Q7J
         xorRp6y6Y7ox0BA451PdFWwSQHpyOwJpVBYfEDavSkRpOkGuu5SoPsqMWue0xORHdPqO
         qqGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=qnsJqe0QQmxXTDnQX2FK6+rcSXF3Db3UuWi8zaucMdQ=;
        b=1O9Zc/H0bDJmBMcZbB9G3qHK26Q/CTHxaeHQxR4wPfeP1oJh4Z8YqCYhKBpg6OnCU+
         duAVjPrdnQkQelV6/UprzUlNwkgaIb8xsC6fLO5gOo5UT1a9CBL32mb7Lggbt1I9elWQ
         7Z5/BbtWM8N9SZRb9ewXoke3Tf8BfoBmuxgpLwhyqC0XqL525uU6nxlnOeg0grr7diZX
         KVGtczVvPSHFGYfPq5uSxbLtL8yBzeoExSqBdDl7x/YluOqSMTduk8grVytE/lQhWFJl
         YQVALQdvPeayg60hy5+n36KpI/+L+vPpoXqOfWHpQsuY28Q+Rczy+iqL+Httq6yJQzf0
         rV4Q==
X-Gm-Message-State: ACrzQf2kG37RMG02OKSulJVK2Lk51Vc5MqXYmBwyAld8mlWXFreZgg1M
	cYHz3zySG+q3TD+2S42PCE8lEZqtqXhWpPvDtPVlUHR8SJY=
X-Google-Smtp-Source: 
 AMsMyM7p+kxMk0de9PckZSHk/h2BFisOAtcgiC11gy6MfseKUfZ0muqnedSi/aJDms3fRMP/1nPzmSZyyruf/Od5y8Q=
X-Received: by 2002:a05:6870:d1c8:b0:132:1239:2550 with SMTP id
 b8-20020a056870d1c800b0013212392550mr152124oac.55.1664575927222; Fri, 30 Sep
 2022 15:12:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220930041614.2704304-1-raj.khem@gmail.com>
 <YzdVGmP2GoownRfx@mail.local>
In-Reply-To: <YzdVGmP2GoownRfx@mail.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 30 Sep 2022 15:11:41 -0700
Message-ID: 
 <CAMKF1spHHwuCYkLttW8CBqxf-mBfze-qDGJUfDbo9N3Fe9Xfrg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssl: Add missing perl module runtime
 dependencies for ptests
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Sep 2022 22:12:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171245

Thanks Alex, I will rework it.

On Fri, Sep 30, 2022 at 1:44 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hello,
>
> This caused many issues on the autobuilders, similar to those:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/5982/steps/11/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/96/builds/3796/steps/11/logs/stdio
>
> On 29/09/2022 21:16:14-0700, Khem Raj wrote:
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-connectivity/openssl/openssl_3.0.5.bb | 11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.5.bb b/meta/recipes-connectivity/openssl/openssl_3.0.5.bb
> > index 04aff04fab..119e58ed24 100644
> > --- a/meta/recipes-connectivity/openssl/openssl_3.0.5.bb
> > +++ b/meta/recipes-connectivity/openssl/openssl_3.0.5.bb
> > @@ -243,7 +243,16 @@ CONFFILES:openssl-conf = "${sysconfdir}/ssl/openssl.cnf"
> >
> >  RRECOMMENDS:libcrypto += "openssl-conf ${PN}-ossl-module-legacy"
> >  RDEPENDS:${PN}-misc = "perl"
> > -RDEPENDS:${PN}-ptest += "openssl-bin perl perl-modules bash sed"
> > +RDEPENDS:${PN}-ptest += "bash sed openssl-bin \
> > +                         perl perl-modules \
> > +                         perl-module-file-spec-functions \
> > +                         perl-module-findbin perl-module-harness perl-module-tap-base \
> > +                         perl-module-tap-object perl-module-tap-parser-sourcehandler-executable \
> > +                         perl-module-tap-formatter-file perl-module-tap-formatter-session \
> > +                         perl-module-tap-formatter-base perl-module-tap-parser \
> > +                         perl-module-tap-parser-scheduler perl-module-test-more \
> > +                         perl-module-pod-text perl-module-encode-encoding \
> > +                         "
> >
> >  RDEPENDS:${PN}-bin += "openssl-conf"
> >
> > --
> > 2.37.3
> >
>
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#171204): https://lists.openembedded.org/g/openembedded-core/message/171204
> > Mute This Topic: https://lists.openembedded.org/mt/94010252/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

